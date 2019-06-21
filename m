Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3D44F0D3
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 00:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020E289DB5;
	Fri, 21 Jun 2019 22:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB4D89DB5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 22:35:37 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1heS86-0000Or-EG; Fri, 21 Jun 2019 22:35:34 +0000
From: Colin King <colin.king@canonical.com>
To: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: fix memory leak when too many retries have
 occurred
Date: Fri, 21 Jun 2019 23:35:34 +0100
Message-Id: <20190621223534.14283-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkN1cnJlbnRs
eSB3aGVuIHRvbyBtYW55IHJldHJpZXMgaGF2ZSBvY2N1cnJlZCB0aGVyZSBpcyBhIG1lbW9yeQps
ZWFrIG9uIHRoZSBhbGxvY2F0aW9uIGZvciByZXBseSBvbiB0aGUgZXJyb3IgcmV0dXJuIHBhdGgu
IEZpeAp0aGlzIGJ5IGtmcmVlJ2luZyByZXBseSBiZWZvcmUgcmV0dXJuaW5nLgoKQWRkcmVzc2Vz
LUNvdmVyaXR5OiAoIlJlc291cmNlIGxlYWsiKQpGaXhlczogYTljZDljMDQ0YWE5ICgiZHJtL3Zt
d2dmeDogQWRkIGEgY2hlY2sgdG8gaGFuZGxlIGhvc3QgbWVzc2FnZSBmYWlsdXJlIikKU2lnbmVk
LW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9tc2cuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X21zZy5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfbXNnLmMKaW5kZXggOGI5MjcwZjMxNDA5Li44YjYxZjE2ZjUwY2YgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X21zZy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X21zZy5jCkBAIC0zMDEsOCArMzAxLDEwIEBAIHN0YXRpYyBpbnQgdm13X3Jl
Y3ZfbXNnKHN0cnVjdCBycGNfY2hhbm5lbCAqY2hhbm5lbCwgdm9pZCAqKm1zZywKIAkJYnJlYWs7
CiAJfQogCi0JaWYgKHJldHJpZXMgPT0gUkVUUklFUykKKwlpZiAocmV0cmllcyA9PSBSRVRSSUVT
KSB7CisJCWtmcmVlKHJlcGx5KTsKIAkJcmV0dXJuIC1FSU5WQUw7CisJfQogCiAJKm1zZ19sZW4g
PSByZXBseV9sZW47CiAJKm1zZyAgICAgPSByZXBseTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

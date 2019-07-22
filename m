Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B6670C99
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 00:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEBF89D64;
	Mon, 22 Jul 2019 22:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC52089D64
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 22:30:34 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hpgkR-00024f-KX; Mon, 22 Jul 2019 22:25:35 +0000
From: Colin King <colin.king@canonical.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: fix missing decrement of retry counter
Date: Mon, 22 Jul 2019 23:25:35 +0100
Message-Id: <20190722222535.19114-1-colin.king@canonical.com>
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
eSB0aGUgcmV0cnkgY291bnRlciBpcyBub3QgYmVpbmcgZGVjcmVtZW50ZWQsIGxlYWRpbmcgdG8g
YQpwb3RlbnRpYWwgaW5maW5pdGUgc3BpbiBpZiB0aGUgc2NhbGFyX3JlYWRzIGRvbid0IGNoYW5n
ZSBzdGF0ZS4KCkFkZHJlc3Nlcy1Db3Zlcml0eTogKCJJbmZpbml0ZSBsb29wIikKRml4ZXM6IDI4
MGU1NGM5ZjYxNCAoImRybS9leHlub3M6IHNjYWxlcjogUmVzZXQgaGFyZHdhcmUgYmVmb3JlIHN0
YXJ0aW5nIHRoZSBvcGVyYXRpb24iKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29s
aW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9zY2FsZXIuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fc2NhbGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fc2NhbGVy
LmMKaW5kZXggOWFmMDk2NDc5ZTFjLi5iMjRiYTk0OGI3MjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9zY2FsZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fc2NhbGVyLmMKQEAgLTk0LDEyICs5NCwxMiBAQCBzdGF0aWMgaW5s
aW5lIGludCBzY2FsZXJfcmVzZXQoc3RydWN0IHNjYWxlcl9jb250ZXh0ICpzY2FsZXIpCiAJc2Nh
bGVyX3dyaXRlKFNDQUxFUl9DRkdfU09GVF9SRVNFVCwgU0NBTEVSX0NGRyk7CiAJZG8gewogCQlj
cHVfcmVsYXgoKTsKLQl9IHdoaWxlIChyZXRyeSA+IDEgJiYKKwl9IHdoaWxlICgtLXJldHJ5ID4g
MSAmJgogCQkgc2NhbGVyX3JlYWQoU0NBTEVSX0NGRykgJiBTQ0FMRVJfQ0ZHX1NPRlRfUkVTRVQp
OwogCWRvIHsKIAkJY3B1X3JlbGF4KCk7CiAJCXNjYWxlcl93cml0ZSgxLCBTQ0FMRVJfSU5UX0VO
KTsKLQl9IHdoaWxlIChyZXRyeSA+IDAgJiYgc2NhbGVyX3JlYWQoU0NBTEVSX0lOVF9FTikgIT0g
MSk7CisJfSB3aGlsZSAoLS1yZXRyeSA+IDAgJiYgc2NhbGVyX3JlYWQoU0NBTEVSX0lOVF9FTikg
IT0gMSk7CiAKIAlyZXR1cm4gcmV0cnkgPyAwIDogLUVJTzsKIH0KLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72A759D86
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 16:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BD26E929;
	Fri, 28 Jun 2019 14:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384BC6E929;
 Fri, 28 Jun 2019 14:10:08 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hgrXl-0004cj-Pu; Fri, 28 Jun 2019 14:08:01 +0000
From: Colin King <colin.king@canonical.com>
To: Hawking Zhang <Hawking.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amdgpu: fix off-by-one comparison on a WARN_ON
 message
Date: Fri, 28 Jun 2019 15:08:01 +0100
Message-Id: <20190628140801.31937-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBXQVJO
X09OIGlzIGN1cnJlbnRseSB0aHJvd2luZyBhIHdhcm5pbmcgd2hlbiBpIGlzIDY1IG9yIGhpZ2hl
ciB3aGljaAppcyBvZmYgYnkgb25lLiBJdCBzaG91bGQgYmUgNjQgb3IgaGlnaGVyICg2NCBxdWV1
ZXMgZnJvbSAwLi42MyBpbmNsdXNpdmUpLApzbyBmaXggdGhpcyBvZmYtYnktb25lIGNvbXBhcmlz
b24uCgpGaXhlczogODQ5YWNhOWY5YzAzICgiZHJtL2FtZGdwdTogTW92ZSBjb21tb24gY29kZSB0
byBhbWRncHVfZ2Z4LmMiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2lu
Z0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
ZnguYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYwppbmRleCA3NDA2NmUxNDY2
ZjcuLmM4ZDEwNmM1OWUyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2dmeC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZngu
YwpAQCAtNTAxLDcgKzUwMSw3IEBAIGludCBhbWRncHVfZ2Z4X2VuYWJsZV9rY3Eoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCiAJCS8qIFRoaXMgc2l0dWF0aW9uIG1heSBiZSBoaXQgaW4gdGhl
IGZ1dHVyZSBpZiBhIG5ldyBIVwogCQkgKiBnZW5lcmF0aW9uIGV4cG9zZXMgbW9yZSB0aGFuIDY0
IHF1ZXVlcy4gSWYgc28sIHRoZQogCQkgKiBkZWZpbml0aW9uIG9mIHF1ZXVlX21hc2sgbmVlZHMg
dXBkYXRpbmcgKi8KLQkJaWYgKFdBUk5fT04oaSA+IChzaXplb2YocXVldWVfbWFzaykqOCkpKSB7
CisJCWlmIChXQVJOX09OKGkgPj0gKHNpemVvZihxdWV1ZV9tYXNrKSo4KSkpIHsKIAkJCURSTV9F
UlJPUigiSW52YWxpZCBLQ1EgZW5hYmxlZDogJWRcbiIsIGkpOwogCQkJYnJlYWs7CiAJCX0KLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

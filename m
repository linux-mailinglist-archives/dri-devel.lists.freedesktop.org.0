Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B5852462
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEE889F92;
	Tue, 25 Jun 2019 07:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7053389CDE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 16:10:47 +0000 (UTC)
Received: from tschai.fritz.box ([46.9.252.75])
 by smtp-cloud7.xs4all.net with ESMTPA
 id fRRKhHRxHF85OfRRThZabg; Mon, 24 Jun 2019 18:03:39 +0200
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv8 08/13] dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
Date: Mon, 24 Jun 2019 18:03:25 +0200
Message-Id: <20190624160330.38048-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHHansUyGVXBysIw83Mx+bRjZGJT/Z8Zf6NsbpPtkX3RRqVmBXKFM6o+UHfbRcYyh+qucjbgPKjQu+b6PY7Q8ggJzLbvXhQixSiVRtNg+sEXzfaKMnhE
 5Odn//YSx8h1UhGB5hrMEbmwXveFfKHQ3stgENRQujroOMukNbwqdXxU9oEdtVD7uNn2Zbrg5jSo0kzqyU2tTk7yc0nCRenmqFiX4TpJUiKn1Ge6v+rmTfQj
 KEDgTbqGa4k/NugARg5b5+ofFOfwc08YSQu1hGcJXzBzv+Cv50gcrh/hJ0uVGfQGjP8myMa4czNvTLN5ZEtutekV4iIoa6xOPw/o6Favdak=
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dariusz Marcinkiewicz <darekm@google.com>, dri-devel@lists.freedesktop.org,
 Cheng-yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFyaXVzeiBNYXJjaW5raWV3aWN6IDxkYXJla21AZ29vZ2xlLmNvbT4KClVzZSB0aGUg
bmV3IGNlY19ub3RpZmllcl9jZWNfYWRhcF8odW4pcmVnaXN0ZXIoKSBmdW5jdGlvbnMgdG8KKHVu
KXJlZ2lzdGVyIHRoZSBub3RpZmllciBmb3IgdGhlIENFQyBhZGFwdGVyLgoKU2lnbmVkLW9mZi1i
eTogRGFyaXVzeiBNYXJjaW5raWV3aWN6IDxkYXJla21AZ29vZ2xlLmNvbT4KU2lnbmVkLW9mZi1i
eTogSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWNlYy5jIHwgOSArKysrLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWNlYy5jIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWNlYy5jCmluZGV4IDZjMzIzNTEwZjEyOC4u
NmY3ZWNhY2I3ZDFmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWktY2VjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1o
ZG1pLWNlYy5jCkBAIC0yODEsMTMgKzI4MSwxNCBAQCBzdGF0aWMgaW50IGR3X2hkbWlfY2VjX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKHJldCA8IDApCiAJCXJldHVy
biByZXQ7CiAKLQljZWMtPm5vdGlmeSA9IGNlY19ub3RpZmllcl9nZXQocGRldi0+ZGV2LnBhcmVu
dCk7CisJY2VjLT5ub3RpZnkgPSBjZWNfbm90aWZpZXJfY2VjX2FkYXBfcmVnaXN0ZXIocGRldi0+
ZGV2LnBhcmVudCwKKwkJCQkJCSAgICAgTlVMTCwgY2VjLT5hZGFwKTsKIAlpZiAoIWNlYy0+bm90
aWZ5KQogCQlyZXR1cm4gLUVOT01FTTsKIAogCXJldCA9IGNlY19yZWdpc3Rlcl9hZGFwdGVyKGNl
Yy0+YWRhcCwgcGRldi0+ZGV2LnBhcmVudCk7CiAJaWYgKHJldCA8IDApIHsKLQkJY2VjX25vdGlm
aWVyX3B1dChjZWMtPm5vdGlmeSk7CisJCWNlY19ub3RpZmllcl9jZWNfYWRhcF91bnJlZ2lzdGVy
KGNlYy0+bm90aWZ5KTsKIAkJcmV0dXJuIHJldDsKIAl9CiAKQEAgLTI5Nyw4ICsyOTgsNiBAQCBz
dGF0aWMgaW50IGR3X2hkbWlfY2VjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiAJICovCiAJZGV2bV9yZW1vdmVfYWN0aW9uKCZwZGV2LT5kZXYsIGR3X2hkbWlfY2VjX2RlbCwg
Y2VjKTsKIAotCWNlY19yZWdpc3Rlcl9jZWNfbm90aWZpZXIoY2VjLT5hZGFwLCBjZWMtPm5vdGlm
eSk7Ci0KIAlyZXR1cm4gMDsKIH0KIApAQCAtMzA2LDggKzMwNSw4IEBAIHN0YXRpYyBpbnQgZHdf
aGRtaV9jZWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0
IGR3X2hkbWlfY2VjICpjZWMgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAorCWNlY19u
b3RpZmllcl9jZWNfYWRhcF91bnJlZ2lzdGVyKGNlYy0+bm90aWZ5KTsKIAljZWNfdW5yZWdpc3Rl
cl9hZGFwdGVyKGNlYy0+YWRhcCk7Ci0JY2VjX25vdGlmaWVyX3B1dChjZWMtPm5vdGlmeSk7CiAK
IAlyZXR1cm4gMDsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs

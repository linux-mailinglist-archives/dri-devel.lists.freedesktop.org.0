Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E4D56421
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADE36E2ED;
	Wed, 26 Jun 2019 08:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net
 [194.109.24.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C876E132
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 14:45:17 +0000 (UTC)
Received: from cobaltpc1.rd.cisco.com
 ([IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b])
 by smtp-cloud9.xs4all.net with ESMTPA
 id fmh4hQwJSSfvXfmhAhHp03; Tue, 25 Jun 2019 16:45:16 +0200
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv9 08/13] dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
Date: Tue, 25 Jun 2019 16:45:05 +0200
Message-Id: <20190625144510.122214-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
References: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAkTWwsUHmfEelg/SEvUpZY9/CZ8hb8g62P3xU16qZ5ShLynhD2V0cuz9N+D/rWAcb7hKH3JmQAxiMe+WxbBdFXRGKypDOCgy+QgEzh1PEuwL4CP/yzY
 4bO33Rc1H3jlSLvijgDmV6ndF8I5T23pcjqrtNcJ08UtDOuFid/R7cG9sAYGa2Z2gef1bKviVtyoXVpZ/lZjhTh9rSagKKTpNraewI3jI4xr8Kw6NZ5WAKkc
 G6uzBcsao34AgkNYf9KFDXubk1FCdIx9VwcQo5zDsIBrK+2r5YZSk2+JuCZsBVxb7cUyFoBA7FuNnU3W9aZugv+NEoHRDSmMlRcQSKOhxzVYob3RSjmqnzVA
 lIHj2nzVCXFzTWRuygWaI3B7E5yafN8PPnBQsg2oXg+AxRxvP06311gT2XeCqrLjntonCOXk
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
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

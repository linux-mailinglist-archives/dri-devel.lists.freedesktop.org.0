Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D54615FE
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 20:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F321E89BAB;
	Sun,  7 Jul 2019 18:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487A789BAB
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 18:35:08 +0000 (UTC)
Received: from pendragon.nordic-sky.finnair.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 151A0CC;
 Sun,  7 Jul 2019 20:34:48 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 41/60] drm/omap: dss: Remove .set_hdmi_mode() and
 .set_infoframe() operations
Date: Sun,  7 Jul 2019 21:19:18 +0300
Message-Id: <20190707181937.6250-38-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562524506;
 bh=PKsP4UZ+5N7x9/n3FcA0hzPPS2xoGuTJonZ/mdMXhXg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T9/j7zfa9SmAUcc2SRazoZ67bLMrnrXpmd8z0tbGVXW0KIoJyALVnpFkVgsBBJ5b9
 Dpg+ZOBLTnu3g/ocHj1TShjck6IGxcVeuzM/0iJ9JU/nfNM2+IuUGbKcgN2s8yf3Z9
 iGLFZyQ/t9U1M9j124hXTmvk4ziBmcfdxnl/flHc=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG9tYXBkc3NfaGRtaV9vcHMgLnNldF9oZG1pX21vZGUoKSBhbmQgLnNldF9pbmZvZnJhbWUo
KSBvcGVyYXRpb25zCm9wZXJhdGlvbnMgYXJlIG5vdCB1c2VkIGFueW1vcmUsIHJlbW92ZSB0aGVt
LgoKU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLmgg
IHwgIDMgLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2VuY29kZXIuYyB8IDI2IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI5IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLmggYi9k
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb21hcGRzcy5oCmluZGV4IGNjZGY0MjYxNzYxMy4u
NWUwYTE0NmIyZjM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb21h
cGRzcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLmgKQEAgLTI5
OCw5ICsyOTgsNiBAQCBzdHJ1Y3Qgb21hcF9kc3Nfd3JpdGViYWNrX2luZm8gewogCiBzdHJ1Y3Qg
b21hcGRzc19oZG1pX29wcyB7CiAJdm9pZCAoKmxvc3RfaG90cGx1Zykoc3RydWN0IG9tYXBfZHNz
X2RldmljZSAqZHNzZGV2KTsKLQlpbnQgKCpzZXRfaGRtaV9tb2RlKShzdHJ1Y3Qgb21hcF9kc3Nf
ZGV2aWNlICpkc3NkZXYsIGJvb2wgaGRtaV9tb2RlKTsKLQlpbnQgKCpzZXRfaW5mb2ZyYW1lKShz
dHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpkc3NkZXYsCi0JCWNvbnN0IHN0cnVjdCBoZG1pX2F2aV9p
bmZvZnJhbWUgKmF2aSk7CiB9OwogCiBzdHJ1Y3Qgb21hcGRzc19kc2lfb3BzIHsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vb21hcF9lbmNvZGVyLmMKaW5kZXggZmE0ZTAwZTY1ZjlkLi44YWY4ODlmMGFm
MDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZW5jb2Rlci5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZW5jb2Rlci5jCkBAIC03OSwyOCArNzks
NiBAQCBzdGF0aWMgdm9pZCBvbWFwX2VuY29kZXJfdXBkYXRlX3ZpZGVvbW9kZV9mbGFncyhzdHJ1
Y3QgdmlkZW9tb2RlICp2bSwKIAl9CiB9CiAKLXN0YXRpYyB2b2lkIG9tYXBfZW5jb2Rlcl9oZG1p
X21vZGVfc2V0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCi0JCQkJICAgICAgIHN0
cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKLQkJCQkgICAgICAgc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKmFkanVzdGVkX21vZGUpCi17Ci0Jc3RydWN0IG9tYXBfZW5jb2RlciAqb21hcF9lbmNv
ZGVyID0gdG9fb21hcF9lbmNvZGVyKGVuY29kZXIpOwotCXN0cnVjdCBvbWFwX2Rzc19kZXZpY2Ug
KmRzc2RldiA9IG9tYXBfZW5jb2Rlci0+b3V0cHV0OwotCWJvb2wgaGRtaV9tb2RlID0gY29ubmVj
dG9yLT5kaXNwbGF5X2luZm8uaXNfaGRtaTsKLQotCWlmIChkc3NkZXYtPm9wcyAmJiBkc3NkZXYt
Pm9wcy0+aGRtaS5zZXRfaGRtaV9tb2RlKQotCQlkc3NkZXYtPm9wcy0+aGRtaS5zZXRfaGRtaV9t
b2RlKGRzc2RldiwgaGRtaV9tb2RlKTsKLQotCWlmIChoZG1pX21vZGUgJiYgZHNzZGV2LT5vcHMg
JiYgZHNzZGV2LT5vcHMtPmhkbWkuc2V0X2luZm9mcmFtZSkgewotCQlzdHJ1Y3QgaGRtaV9hdmlf
aW5mb2ZyYW1lIGF2aTsKLQkJaW50IHI7Ci0KLQkJciA9IGRybV9oZG1pX2F2aV9pbmZvZnJhbWVf
ZnJvbV9kaXNwbGF5X21vZGUoJmF2aSwgY29ubmVjdG9yLAotCQkJCQkJCSAgICAgYWRqdXN0ZWRf
bW9kZSk7Ci0JCWlmIChyID09IDApCi0JCQlkc3NkZXYtPm9wcy0+aGRtaS5zZXRfaW5mb2ZyYW1l
KGRzc2RldiwgJmF2aSk7Ci0JfQotfQotCiBzdGF0aWMgdm9pZCBvbWFwX2VuY29kZXJfbW9kZV9z
ZXQoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAogCQkJCSAgc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKm1vZGUsCiAJCQkJICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqYWRqdXN0ZWRfbW9k
ZSkKQEAgLTE1MSwxMCArMTI5LDYgQEAgc3RhdGljIHZvaWQgb21hcF9lbmNvZGVyX21vZGVfc2V0
KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKIAkJaWYgKGRzc2Rldi0+b3BzICYmIGRzc2Rl
di0+b3BzLT5zZXRfdGltaW5ncykKIAkJCWRzc2Rldi0+b3BzLT5zZXRfdGltaW5ncyhkc3NkZXYs
IGFkanVzdGVkX21vZGUpOwogCX0KLQotCS8qIFNldCB0aGUgSERNSSBtb2RlIGFuZCBIRE1JIGlu
Zm9mcmFtZSBpZiBhcHBsaWNhYmxlLiAqLwotCWlmIChvdXRwdXQtPnR5cGUgPT0gT01BUF9ESVNQ
TEFZX1RZUEVfSERNSSkKLQkJb21hcF9lbmNvZGVyX2hkbWlfbW9kZV9zZXQoY29ubmVjdG9yLCBl
bmNvZGVyLCBhZGp1c3RlZF9tb2RlKTsKIH0KIAogc3RhdGljIHZvaWQgb21hcF9lbmNvZGVyX2Rp
c2FibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQotLSAKUmVnYXJkcywKCkxhdXJlbnQg
UGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

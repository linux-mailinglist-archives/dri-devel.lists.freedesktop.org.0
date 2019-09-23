Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7975BB44B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688C06E8B7;
	Mon, 23 Sep 2019 12:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.203])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF516E8BA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:52:08 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.128])
 by regular1.263xmail.com (Postfix) with ESMTP id F0E4C3D0;
 Mon, 23 Sep 2019 20:52:06 +0800 (CST)
X-263anti-spam: KSV:0;BIG:0;
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-KSVirus-check: 0
X-ADDR-CHECKED4: 1
X-ABS-CHECKED: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P15436T140160991741696S1569243121384240_; 
 Mon, 23 Sep 2019 20:52:02 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <72d6911f116111fd1e7e8d64ada32099>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 21/36] drm/vc4: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:51:44 +0800
Message-Id: <1569243119-183293-1-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
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
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS92YzQvdmM0X3BsYW5lLmMgfCAxMCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92YzQvdmM0X3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5jCmlu
ZGV4IDVlNWY5MDguLmFkMmIwZWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0
X3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfcGxhbmUuYwpAQCAtNTMxLDcg
KzUzMSw3IEBAIHN0YXRpYyB2b2lkIHZjNF9wbGFuZV9jYWxjX2xvYWQoc3RydWN0IGRybV9wbGFu
ZV9zdGF0ZSAqc3RhdGUpCiAJCQkJCSAgICAgdmM0X3N0YXRlLT5jcnRjX2gpOwogCQl2YzRfc3Rh
dGUtPm1lbWJ1c19sb2FkICs9IHZjNF9zdGF0ZS0+c3JjX3dbaV0gKgogCQkJCQkgIHZjNF9zdGF0
ZS0+c3JjX2hbaV0gKiB2c2NhbGVfZmFjdG9yICoKLQkJCQkJICBmYi0+Zm9ybWF0LT5jcHBbaV07
CisJCQkJCSAgZmItPmZvcm1hdC0+YnBwW2ldIC8gODsKIAkJdmM0X3N0YXRlLT5odnNfbG9hZCAr
PSB2YzRfc3RhdGUtPmNydGNfaCAqIHZjNF9zdGF0ZS0+Y3J0Y193OwogCX0KIApAQCAtNjQ2LDcg
KzY0Niw3IEBAIHN0YXRpYyBpbnQgdmM0X3BsYW5lX21vZGVfc2V0KHN0cnVjdCBkcm1fcGxhbmUg
KnBsYW5lLAogCiAJCQl2YzRfc3RhdGUtPm9mZnNldHNbaV0gKz0gdmM0X3N0YXRlLT5zcmNfeCAv
CiAJCQkJCQkgKGkgPyBoX3N1YnNhbXBsZSA6IDEpICoKLQkJCQkJCSBmYi0+Zm9ybWF0LT5jcHBb
aV07CisJCQkJCQkgZmItPmZvcm1hdC0+YnBwW2ldIC8gODsKIAkJfQogCiAJCWJyZWFrOwpAQCAt
NjU0LDcgKzY1NCw3IEBAIHN0YXRpYyBpbnQgdmM0X3BsYW5lX21vZGVfc2V0KHN0cnVjdCBkcm1f
cGxhbmUgKnBsYW5lLAogCWNhc2UgRFJNX0ZPUk1BVF9NT0RfQlJPQURDT01fVkM0X1RfVElMRUQ6
IHsKIAkJdTMyIHRpbGVfc2l6ZV9zaGlmdCA9IDEyOyAvKiBUIHRpbGVzIGFyZSA0a2IgKi8KIAkJ
LyogV2hvbGUtdGlsZSBvZmZzZXRzLCBtb3N0bHkgZm9yIHNldHRpbmcgdGhlIHBpdGNoLiAqLwot
CQl1MzIgdGlsZV93X3NoaWZ0ID0gZmItPmZvcm1hdC0+Y3BwWzBdID09IDIgPyA2IDogNTsKKwkJ
dTMyIHRpbGVfd19zaGlmdCA9IGZiLT5mb3JtYXQtPmJwcFswXSA9PSAxNiA/IDYgOiA1OwogCQl1
MzIgdGlsZV9oX3NoaWZ0ID0gNTsgLyogMTYgYW5kIDMyYnBwIGFyZSAzMiBwaXhlbHMgaGlnaCAq
LwogCQl1MzIgdGlsZV93X21hc2sgPSAoMSA8PCB0aWxlX3dfc2hpZnQpIC0gMTsKIAkJLyogVGhl
IGhlaWdodCBtYXNrIG9uIDMyLWJpdC1wZXItcGl4ZWwgdGlsZXMgaXMgNjMsIGkuZS4gdHdpY2UK
QEAgLTc0OSw3ICs3NDksNyBAQCBzdGF0aWMgaW50IHZjNF9wbGFuZV9tb2RlX3NldChzdHJ1Y3Qg
ZHJtX3BsYW5lICpwbGFuZSwKIAkJCXJldHVybiAtRUlOVkFMOwogCQl9CiAKLQkJcGl4X3Blcl90
aWxlID0gdGlsZV93IC8gZmItPmZvcm1hdC0+Y3BwWzBdOworCQlwaXhfcGVyX3RpbGUgPSB0aWxl
X3cgLyAoZmItPmZvcm1hdC0+YnBwWzBdIC8gOCk7CiAJCXRpbGUgPSB2YzRfc3RhdGUtPnNyY194
IC8gcGl4X3Blcl90aWxlOwogCQl4X29mZiA9IHZjNF9zdGF0ZS0+c3JjX3ggJSBwaXhfcGVyX3Rp
bGU7CiAKQEAgLTc2Myw3ICs3NjMsNyBAQCBzdGF0aWMgaW50IHZjNF9wbGFuZV9tb2RlX3NldChz
dHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAkJCQkJCSB0aWxlX3c7CiAJCQl2YzRfc3RhdGUtPm9m
ZnNldHNbaV0gKz0geF9vZmYgLwogCQkJCQkJIChpID8gaF9zdWJzYW1wbGUgOiAxKSAqCi0JCQkJ
CQkgZmItPmZvcm1hdC0+Y3BwW2ldOworCQkJCQkJIGZiLT5mb3JtYXQtPmJwcFtpXSAvIDg7CiAJ
CX0KIAogCQlwaXRjaDAgPSBWQzRfU0VUX0ZJRUxEKHBhcmFtLCBTQ0FMRVJfVElMRV9IRUlHSFQp
OwotLSAKMi43LjQKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs

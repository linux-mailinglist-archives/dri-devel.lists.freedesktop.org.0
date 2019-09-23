Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB02BB449
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727966E8C0;
	Mon, 23 Sep 2019 12:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtphy.263.net (sg-smtp01.263.net [54.255.195.220])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B2A6E8BC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:51:45 +0000 (UTC)
Received: from regular2.263xmail.com (unknown [211.157.147.163])
 by smtphy.263.net (Postfix) with ESMTPS id 355D3122
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 20:43:52 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.230])
 by regular2.263xmail.com (Postfix) with ESMTP id A37AD282
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 20:43:46 +0800 (CST)
Received: from hjc?rock-chips.com (unknown [192.168.167.16])
 by regular1.263xmail.com (Postfix) with ESMTP id 3B792B76;
 Mon, 23 Sep 2019 20:43:44 +0800 (CST)
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
 P3051T140289744058112S1569242621440080_; 
 Mon, 23 Sep 2019 20:43:45 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <1d669510ee6b1eb3d84b0708437add94>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 07/36] drm/gma500: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:41:11 +0800
Message-Id: <1569242500-182337-8-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569242500-182337-7-git-send-email-hjc@rock-chips.com>
References: <1569242500-182337-7-git-send-email-hjc@rock-chips.com>
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
Z3B1L2RybS9nbWE1MDAvZnJhbWVidWZmZXIuYyAgICAgICAgIHwgNCArKy0tCiBkcml2ZXJzL2dw
dS9kcm0vZ21hNTAwL2dtYV9kaXNwbGF5LmMgICAgICAgICB8IDQgKystLQogZHJpdmVycy9ncHUv
ZHJtL2dtYTUwMC9tZGZsZF9pbnRlbF9kaXNwbGF5LmMgfCA2ICsrKy0tLQogZHJpdmVycy9ncHUv
ZHJtL2dtYTUwMC9vYWt0cmFpbF9jcnRjLmMgICAgICAgfCA0ICsrLS0KIDQgZmlsZXMgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9nbWE1MDAvZnJhbWVidWZmZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZnJh
bWVidWZmZXIuYwppbmRleCAyMThmM2JiLi45N2U5Mjc0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZ21hNTAwL2ZyYW1lYnVmZmVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9m
cmFtZWJ1ZmZlci5jCkBAIC02MSw3ICs2MSw3IEBAIHN0YXRpYyBpbnQgcHNiZmJfc2V0Y29scmVn
KHVuc2lnbmVkIHJlZ25vLCB1bnNpZ25lZCByZWQsIHVuc2lnbmVkIGdyZWVuLAogCSAgICAodHJh
bnNwIDw8IGluZm8tPnZhci50cmFuc3Aub2Zmc2V0KTsKIAogCWlmIChyZWdubyA8IDE2KSB7Ci0J
CXN3aXRjaCAoZmItPmZvcm1hdC0+Y3BwWzBdICogOCkgeworCQlzd2l0Y2ggKGZiLT5mb3JtYXQt
PmJwcFswXSkgewogCQljYXNlIDE2OgogCQkJKCh1aW50MzJfdCAqKSBpbmZvLT5wc2V1ZG9fcGFs
ZXR0ZSlbcmVnbm9dID0gdjsKIAkJCWJyZWFrOwpAQCAtMjIxLDcgKzIyMSw3IEBAIHN0YXRpYyBp
bnQgcHNiX2ZyYW1lYnVmZmVyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkgKiA0IGJ5
dGVzIHBlciBwaXhlbC4KIAkgKi8KIAlpbmZvID0gZHJtX2dldF9mb3JtYXRfaW5mbyhkZXYsIG1v
ZGVfY21kKTsKLQlpZiAoIWluZm8gfHwgIWluZm8tPmRlcHRoIHx8IGluZm8tPmNwcFswXSA+IDQp
CisJaWYgKCFpbmZvIHx8ICFpbmZvLT5kZXB0aCB8fCBpbmZvLT5icHBbMF0gPiAzMikKIAkJcmV0
dXJuIC1FSU5WQUw7CiAKIAlpZiAobW9kZV9jbWQtPnBpdGNoZXNbMF0gJiA2MykKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZ21hX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9nbWE1MDAvZ21hX2Rpc3BsYXkuYwppbmRleCBlMjBjY2I1Li45NWU5NzVlIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2dtYV9kaXNwbGF5LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2dtYTUwMC9nbWFfZGlzcGxheS5jCkBAIC03OCwxNCArNzgsMTQgQEAgaW50IGdtYV9waXBl
X3NldF9iYXNlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywgaW50IHgsIGludCB5LAogCWlmIChyZXQg
PCAwKQogCQlnb3RvIGdtYV9waXBlX3NldF9iYXNlX2V4aXQ7CiAJc3RhcnQgPSBndHQtPm9mZnNl
dDsKLQlvZmZzZXQgPSB5ICogZmItPnBpdGNoZXNbMF0gKyB4ICogZmItPmZvcm1hdC0+Y3BwWzBd
OworCW9mZnNldCA9IHkgKiBmYi0+cGl0Y2hlc1swXSArIHggKiBmYi0+Zm9ybWF0LT5icHBbMF0g
LyA4OwogCiAJUkVHX1dSSVRFKG1hcC0+c3RyaWRlLCBmYi0+cGl0Y2hlc1swXSk7CiAKIAlkc3Bj
bnRyID0gUkVHX1JFQUQobWFwLT5jbnRyKTsKIAlkc3BjbnRyICY9IH5ESVNQUExBTkVfUElYRk9S
TUFUX01BU0s7CiAKLQlzd2l0Y2ggKGZiLT5mb3JtYXQtPmNwcFswXSAqIDgpIHsKKwlzd2l0Y2gg
KGZiLT5mb3JtYXQtPmJwcFswXSkgewogCWNhc2UgODoKIAkJZHNwY250ciB8PSBESVNQUExBTkVf
OEJQUDsKIAkJYnJlYWs7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL21kZmxk
X2ludGVsX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvbWRmbGRfaW50ZWxfZGlz
cGxheS5jCmluZGV4IGI4YmZiOTYuLjU1NjQ0NzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9nbWE1MDAvbWRmbGRfaW50ZWxfZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1
MDAvbWRmbGRfaW50ZWxfZGlzcGxheS5jCkBAIC0xMzksNyArMTM5LDcgQEAgc3RhdGljIGludCBj
aGVja19mYihzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYikKIAlpZiAoIWZiKQogCQlyZXR1cm4g
MDsKIAotCXN3aXRjaCAoZmItPmZvcm1hdC0+Y3BwWzBdICogOCkgeworCXN3aXRjaCAoZmItPmZv
cm1hdC0+YnBwWzBdKSB7CiAJY2FzZSA4OgogCWNhc2UgMTY6CiAJY2FzZSAyNDoKQEAgLTE4Nywx
MyArMTg3LDEzIEBAIHN0YXRpYyBpbnQgbWRmbGRfX2ludGVsX3BpcGVfc2V0X2Jhc2Uoc3RydWN0
IGRybV9jcnRjICpjcnRjLCBpbnQgeCwgaW50IHksCiAJCXJldHVybiAwOwogCiAJc3RhcnQgPSB0
b19ndHRfcmFuZ2UoZmItPm9ialswXSktPm9mZnNldDsKLQlvZmZzZXQgPSB5ICogZmItPnBpdGNo
ZXNbMF0gKyB4ICogZmItPmZvcm1hdC0+Y3BwWzBdOworCW9mZnNldCA9IHkgKiBmYi0+cGl0Y2hl
c1swXSArIHggKiBmYi0+Zm9ybWF0LT5icHBbMF0gLyA4OwogCiAJUkVHX1dSSVRFKG1hcC0+c3Ry
aWRlLCBmYi0+cGl0Y2hlc1swXSk7CiAJZHNwY250ciA9IFJFR19SRUFEKG1hcC0+Y250cik7CiAJ
ZHNwY250ciAmPSB+RElTUFBMQU5FX1BJWEZPUk1BVF9NQVNLOwogCi0Jc3dpdGNoIChmYi0+Zm9y
bWF0LT5jcHBbMF0gKiA4KSB7CisJc3dpdGNoIChmYi0+Zm9ybWF0LT5icHBbMF0pIHsKIAljYXNl
IDg6CiAJCWRzcGNudHIgfD0gRElTUFBMQU5FXzhCUFA7CiAJCWJyZWFrOwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
Z21hNTAwL29ha3RyYWlsX2NydGMuYwppbmRleCAxNjdjMTA3Li44Mjc4ZGZiIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2NydGMuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZ21hNTAwL29ha3RyYWlsX2NydGMuYwpAQCAtNjA3LDE0ICs2MDcsMTQgQEAgc3RhdGlj
IGludCBvYWt0cmFpbF9waXBlX3NldF9iYXNlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAkJcmV0
dXJuIDA7CiAKIAlzdGFydCA9IHRvX2d0dF9yYW5nZShmYi0+b2JqWzBdKS0+b2Zmc2V0OwotCW9m
ZnNldCA9IHkgKiBmYi0+cGl0Y2hlc1swXSArIHggKiBmYi0+Zm9ybWF0LT5jcHBbMF07CisJb2Zm
c2V0ID0geSAqIGZiLT5waXRjaGVzWzBdICsgeCAqIGZiLT5mb3JtYXQtPmJwcFswXSAvIDg7CiAK
IAlSRUdfV1JJVEUobWFwLT5zdHJpZGUsIGZiLT5waXRjaGVzWzBdKTsKIAogCWRzcGNudHIgPSBS
RUdfUkVBRChtYXAtPmNudHIpOwogCWRzcGNudHIgJj0gfkRJU1BQTEFORV9QSVhGT1JNQVRfTUFT
SzsKIAotCXN3aXRjaCAoZmItPmZvcm1hdC0+Y3BwWzBdICogOCkgeworCXN3aXRjaCAoZmItPmZv
cm1hdC0+YnBwWzBdKSB7CiAJY2FzZSA4OgogCQlkc3BjbnRyIHw9IERJU1BQTEFORV84QlBQOwog
CQlicmVhazsKLS0gCjIuNy40CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==

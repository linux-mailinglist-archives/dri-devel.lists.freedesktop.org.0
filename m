Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E63BB445
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC256E8B8;
	Mon, 23 Sep 2019 12:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtphy.263.net (sg-smtp01.263.net [54.255.195.220])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD586E8BA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:51:46 +0000 (UTC)
Received: from regular2.263xmail.com (unknown [211.157.147.163])
 by smtphy.263.net (Postfix) with ESMTPS id CBFD4B3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 20:44:03 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.185])
 by regular2.263xmail.com (Postfix) with ESMTP id EE6061B5D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 20:44:01 +0800 (CST)
Received: from hjc?rock-chips.com (unknown [192.168.167.16])
 by regular1.263xmail.com (Postfix) with ESMTP id 3783D27E;
 Mon, 23 Sep 2019 20:43:58 +0800 (CST)
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
 Mon, 23 Sep 2019 20:43:58 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <8b85543686f2ae6693688f21f9fae196>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 09/36] dm/vmwgfx: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:41:13 +0800
Message-Id: <1569242500-182337-10-git-send-email-hjc@rock-chips.com>
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
Z3B1L2RybS92bXdnZngvdm13Z2Z4X2ZiLmMgICB8IDQgKystLQogZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfbGR1LmMgIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9zY3JuLmMgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N0ZHUuYyB8
IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ZiLmMgYi9kcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9mYi5jCmluZGV4IDk3MmU4ZmQuLmM1MTZjNDAgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ZiLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfZmIuYwpAQCAtOTEsNyArOTEsNyBAQCBzdGF0aWMgaW50IHZt
d19mYl9zZXRjb2xyZWcodW5zaWduZWQgcmVnbm8sIHVuc2lnbmVkIHJlZCwgdW5zaWduZWQgZ3Jl
ZW4sCiAJZGVmYXVsdDoKIAkJRFJNX0VSUk9SKCJCYWQgZGVwdGggJXUsIGJwcCAldS5cbiIsCiAJ
CQkgIHBhci0+c2V0X2ZiLT5mb3JtYXQtPmRlcHRoLAotCQkJICBwYXItPnNldF9mYi0+Zm9ybWF0
LT5jcHBbMF0gKiA4KTsKKwkJCSAgcGFyLT5zZXRfZmItPmZvcm1hdC0+YnBwWzBdKTsKIAkJcmV0
dXJuIDE7CiAJfQogCkBAIC0yMTEsNyArMjExLDcgQEAgc3RhdGljIHZvaWQgdm13X2ZiX2RpcnR5
X2ZsdXNoKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAkgKiBIYW5kbGUgcGFubmluZyB3aGVu
IGNvcHlpbmcgZnJvbSB2bWFsbG9jIHRvIGZyYW1lYnVmZmVyLgogCSAqIENsaXAgZGlydHkgYXJl
YSB0byBmcmFtZWJ1ZmZlci4KIAkgKi8KLQljcHAgPSBjdXJfZmItPmZvcm1hdC0+Y3BwWzBdOwor
CWNwcCA9IGN1cl9mYi0+Zm9ybWF0LT5icHBbMF0gLyA4OwogCW1heF94ID0gcGFyLT5mYl94ICsg
Y3VyX2ZiLT53aWR0aDsKIAltYXhfeSA9IHBhci0+ZmJfeSArIGN1cl9mYi0+aGVpZ2h0OwogCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9sZHUuYyBiL2RyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X2xkdS5jCmluZGV4IDI1ZTYzNDMuLmU5YjRiNDQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2xkdS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X2xkdS5jCkBAIC05OCw3ICs5OCw3IEBAIHN0YXRpYyBpbnQg
dm13X2xkdV9jb21taXRfbGlzdChzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9wcml2KQogCQlmYiA9
IGVudHJ5LT5iYXNlLmNydGMucHJpbWFyeS0+c3RhdGUtPmZiOwogCiAJCXJldHVybiB2bXdfa21z
X3dyaXRlX3N2Z2EoZGV2X3ByaXYsIHcsIGgsIGZiLT5waXRjaGVzWzBdLAotCQkJCQkgIGZiLT5m
b3JtYXQtPmNwcFswXSAqIDgsCisJCQkJCSAgZmItPmZvcm1hdC0+YnBwWzBdLAogCQkJCQkgIGZi
LT5mb3JtYXQtPmRlcHRoKTsKIAl9CiAKQEAgLTEwNyw3ICsxMDcsNyBAQCBzdGF0aWMgaW50IHZt
d19sZHVfY29tbWl0X2xpc3Qoc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJpdikKIAkJZmIgPSBl
bnRyeS0+YmFzZS5jcnRjLnByaW1hcnktPnN0YXRlLT5mYjsKIAogCQl2bXdfa21zX3dyaXRlX3N2
Z2EoZGV2X3ByaXYsIGZiLT53aWR0aCwgZmItPmhlaWdodCwgZmItPnBpdGNoZXNbMF0sCi0JCQkJ
ICAgZmItPmZvcm1hdC0+Y3BwWzBdICogOCwgZmItPmZvcm1hdC0+ZGVwdGgpOworCQkJCSAgIGZi
LT5mb3JtYXQtPmJwcFswXSwgZmItPmZvcm1hdC0+ZGVwdGgpOwogCX0KIAogCS8qIE1ha2Ugc3Vy
ZSB3ZSBhbHdheXMgc2hvdyBzb21ldGhpbmcuICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9zY3JuLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9z
Y3JuLmMKaW5kZXggOWEyYTM4My4uNzlhNzllMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfc2Nybi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X3Njcm4uYwpAQCAtNDg3LDcgKzQ4Nyw3IEBAIHN0YXRpYyB1aW50MzJfdCB2bXdfc291X2JvX2Rl
ZmluZV9nbXJmYihzdHJ1Y3Qgdm13X2R1X3VwZGF0ZV9wbGFuZSAqdXBkYXRlLAogCiAJZ21yLT5o
ZWFkZXIgPSBTVkdBX0NNRF9ERUZJTkVfR01SRkI7CiAKLQlnbXItPmJvZHkuZm9ybWF0LmJpdHNQ
ZXJQaXhlbCA9IHVwZGF0ZS0+dmZiLT5iYXNlLmZvcm1hdC0+Y3BwWzBdICogODsKKwlnbXItPmJv
ZHkuZm9ybWF0LmJpdHNQZXJQaXhlbCA9IHVwZGF0ZS0+dmZiLT5iYXNlLmZvcm1hdC0+YnBwWzBd
OwogCWdtci0+Ym9keS5mb3JtYXQuY29sb3JEZXB0aCA9IGRlcHRoOwogCWdtci0+Ym9keS5mb3Jt
YXQucmVzZXJ2ZWQgPSAwOwogCWdtci0+Ym9keS5ieXRlc1BlckxpbmUgPSB1cGRhdGUtPnZmYi0+
YmFzZS5waXRjaGVzWzBdOwpAQCAtOTk3LDcgKzk5Nyw3IEBAIHN0YXRpYyBpbnQgZG9fYm9fZGVm
aW5lX2dtcmZiKHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYsCiAJCXJldHVybiAtRU5PTUVN
OwogCiAJY21kLT5oZWFkZXIgPSBTVkdBX0NNRF9ERUZJTkVfR01SRkI7Ci0JY21kLT5ib2R5LmZv
cm1hdC5iaXRzUGVyUGl4ZWwgPSBmcmFtZWJ1ZmZlci0+YmFzZS5mb3JtYXQtPmNwcFswXSAqIDg7
CisJY21kLT5ib2R5LmZvcm1hdC5iaXRzUGVyUGl4ZWwgPSBmcmFtZWJ1ZmZlci0+YmFzZS5mb3Jt
YXQtPmJwcFswXTsKIAljbWQtPmJvZHkuZm9ybWF0LmNvbG9yRGVwdGggPSBkZXB0aDsKIAljbWQt
PmJvZHkuZm9ybWF0LnJlc2VydmVkID0gMDsKIAljbWQtPmJvZHkuYnl0ZXNQZXJMaW5lID0gZnJh
bWVidWZmZXItPmJhc2UucGl0Y2hlc1swXTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X3N0ZHUuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N0ZHUu
YwppbmRleCBmODAzYmI1Li41MmYwMDAzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13
Z2Z4L3Ztd2dmeF9zdGR1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3Rk
dS5jCkBAIC0xMDc0LDcgKzEwNzQsNyBAQCB2bXdfc3RkdV9wcmltYXJ5X3BsYW5lX3ByZXBhcmVf
ZmIoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJCSAqLwogCQlpZiAobmV3X2NvbnRlbnRfdHlw
ZSA9PSBTRVBBUkFURV9CTykgewogCi0JCQlzd2l0Y2ggKG5ld19mYi0+Zm9ybWF0LT5jcHBbMF0q
OCkgeworCQkJc3dpdGNoIChuZXdfZmItPmZvcm1hdC0+YnBwWzBdKSB7CiAJCQljYXNlIDMyOgog
CQkJCWNvbnRlbnRfc3JmLmZvcm1hdCA9IFNWR0EzRF9YOFI4RzhCODsKIAkJCQlicmVhazsKLS0g
CjIuNy40CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

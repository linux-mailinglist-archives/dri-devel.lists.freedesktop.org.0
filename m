Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8226EBB470
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011156E8C7;
	Mon, 23 Sep 2019 12:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C496E8D4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:54:08 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.236])
 by regular1.263xmail.com (Postfix) with ESMTP id 6B03D474;
 Mon, 23 Sep 2019 20:53:59 +0800 (CST)
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
 P17988T139868132738816S1569243231409431_; 
 Mon, 23 Sep 2019 20:53:59 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <262127d4a0e95fd588c6e29b5f0fe5b5>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH 33/36] drm/mgag200: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:53:47 +0800
Message-Id: <1569243230-183568-3-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569243230-183568-1-git-send-email-hjc@rock-chips.com>
References: <1569243230-183568-1-git-send-email-hjc@rock-chips.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIHwgMTYgKysrKysrKystLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jCmluZGV4IDY4MjI2NTUuLjVhZmY2NTIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jCkBAIC00MSw3ICs0MSw3IEBAIHN0YXRpYyB2
b2lkIG1nYV9jcnRjX2xvYWRfbHV0KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIAogCVdSRUc4KERB
Q19JTkRFWCArIE1HQTEwNjRfSU5ERVgsIDApOwogCi0JaWYgKGZiICYmIGZiLT5mb3JtYXQtPmNw
cFswXSAqIDggPT0gMTYpIHsKKwlpZiAoZmIgJiYgZmItPmZvcm1hdC0+YnBwWzBdID09IDE2KSB7
CiAJCWludCBpbmMgPSAoZmItPmZvcm1hdC0+ZGVwdGggPT0gMTUpID8gOCA6IDQ7CiAJCXU4IHIs
IGI7CiAJCWZvciAoaSA9IDA7IGkgPCBNR0FHMjAwX0xVVF9TSVpFOyBpICs9IGluYykgewpAQCAt
OTI1LDcgKzkyNSw3IEBAIHN0YXRpYyBpbnQgbWdhX2NydGNfbW9kZV9zZXQoc3RydWN0IGRybV9j
cnRjICpjcnRjLAogCQkvKiAweDQ4OiAqLyAgICAgICAgMCwgICAgMCwgICAgMCwgICAgMCwgICAg
MCwgICAgMCwgICAgMCwgICAgMAogCX07CiAKLQlicHBzaGlmdCA9IG1kZXYtPmJwcF9zaGlmdHNb
ZmItPmZvcm1hdC0+Y3BwWzBdIC0gMV07CisJYnBwc2hpZnQgPSBtZGV2LT5icHBfc2hpZnRzW2Zi
LT5mb3JtYXQtPmJwcFswXSAvIDggLSAxXTsKIAogCXN3aXRjaCAobWRldi0+dHlwZSkgewogCWNh
c2UgRzIwMF9TRV9BOgpAQCAtOTY1LDcgKzk2NSw3IEBAIHN0YXRpYyBpbnQgbWdhX2NydGNfbW9k
ZV9zZXQoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCQlicmVhazsKIAl9CiAKLQlzd2l0Y2ggKGZi
LT5mb3JtYXQtPmNwcFswXSAqIDgpIHsKKwlzd2l0Y2ggKGZiLT5mb3JtYXQtPmJwcFswXSkgewog
CWNhc2UgODoKIAkJZGFjdmFsdWVbTUdBMTA2NF9NVUxfQ1RMXSA9IE1HQTEwNjRfTVVMX0NUTF84
Yml0czsKIAkJYnJlYWs7CkBAIC0xMDIyLDggKzEwMjIsOCBAQCBzdGF0aWMgaW50IG1nYV9jcnRj
X21vZGVfc2V0KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAlXUkVHX1NFUSgzLCAwKTsKIAlXUkVH
X1NFUSg0LCAweGUpOwogCi0JcGl0Y2ggPSBmYi0+cGl0Y2hlc1swXSAvIGZiLT5mb3JtYXQtPmNw
cFswXTsKLQlpZiAoZmItPmZvcm1hdC0+Y3BwWzBdICogOCA9PSAyNCkKKwlwaXRjaCA9IGZiLT5w
aXRjaGVzWzBdIC8gZmItPmZvcm1hdC0+YnBwWzBdIC8gODsKKwlpZiAoZmItPmZvcm1hdC0+YnBw
WzBdID09IDI0KQogCQlwaXRjaCA9IChwaXRjaCAqIDMpID4+ICg0IC0gYnBwc2hpZnQpOwogCWVs
c2UKIAkJcGl0Y2ggPSBwaXRjaCA+PiAoNCAtIGJwcHNoaWZ0KTsKQEAgLTExMDAsNyArMTEwMCw3
IEBAIHN0YXRpYyBpbnQgbWdhX2NydGNfbW9kZV9zZXQoc3RydWN0IGRybV9jcnRjICpjcnRjLAog
CQkoKHZkaXNwbGF5ICYgMHhjMDApID4+IDcpIHwKIAkJKCh2c3luY3N0YXJ0ICYgMHhjMDApID4+
IDUpIHwKIAkJKCh2ZGlzcGxheSAmIDB4NDAwKSA+PiAzKTsKLQlpZiAoZmItPmZvcm1hdC0+Y3Bw
WzBdICogOCA9PSAyNCkKKwlpZiAoZmItPmZvcm1hdC0+YnBwWzBdID09IDI0KQogCQlleHRfdmdh
WzNdID0gKCgoMSA8PCBicHBzaGlmdCkgKiAzKSAtIDEpIHwgMHg4MDsKIAllbHNlCiAJCWV4dF92
Z2FbM10gPSAoKDEgPDwgYnBwc2hpZnQpIC0gMSkgfCAweDgwOwpAQCAtMTE2Niw5ICsxMTY2LDkg
QEAgc3RhdGljIGludCBtZ2FfY3J0Y19tb2RlX3NldChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJ
CQl1MzIgYnBwOwogCQkJdTMyIG1iOwogCi0JCQlpZiAoZmItPmZvcm1hdC0+Y3BwWzBdICogOCA+
IDE2KQorCQkJaWYgKGZiLT5mb3JtYXQtPmJwcFswXSA+IDE2KQogCQkJCWJwcCA9IDMyOwotCQkJ
ZWxzZSBpZiAoZmItPmZvcm1hdC0+Y3BwWzBdICogOCA+IDgpCisJCQllbHNlIGlmIChmYi0+Zm9y
bWF0LT5icHBbMF0gPiA4KQogCQkJCWJwcCA9IDE2OwogCQkJZWxzZQogCQkJCWJwcCA9IDg7Ci0t
IAoyLjcuNAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CC4BB47B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA3A6E8D5;
	Mon, 23 Sep 2019 12:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB796E8D4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:55:02 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.174])
 by regular1.263xmail.com (Postfix) with ESMTP id D7EDA327;
 Mon, 23 Sep 2019 20:54:59 +0800 (CST)
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
 P29405T140104878241536S1569243297686069_; 
 Mon, 23 Sep 2019 20:54:58 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <7f510e2dec1a5fec4a829d4e2f2a610e>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 36/36] drm/omapdrm: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:54:56 +0800
Message-Id: <1569243296-183701-1-git-send-email-hjc@rock-chips.com>
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
Z3B1L2RybS9vbWFwZHJtL29tYXBfZmIuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vb21hcF9mYi5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9mYi5j
CmluZGV4IDFiOGI1MTAuLmQxOGFhZmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL29tYXBfZmIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2ZiLmMKQEAg
LTg3LDcgKzg3LDcgQEAgc3RhdGljIHUzMiBnZXRfbGluZWFyX2FkZHIoc3RydWN0IGRybV9mcmFt
ZWJ1ZmZlciAqZmIsCiAJdTMyIG9mZnNldDsKIAogCW9mZnNldCA9IGZiLT5vZmZzZXRzW25dCi0J
ICAgICAgICsgKHggKiBmb3JtYXQtPmNwcFtuXSAvIChuID09IDAgPyAxIDogZm9ybWF0LT5oc3Vi
KSkKKwkgICAgICAgKyAoeCAqIGZvcm1hdC0+YnBwW25dIC8gOCAvIChuID09IDAgPyAxIDogZm9y
bWF0LT5oc3ViKSkKIAkgICAgICAgKyAoeSAqIGZiLT5waXRjaGVzW25dIC8gKG4gPT0gMCA/IDEg
OiBmb3JtYXQtPnZzdWIpKTsKIAogCXJldHVybiBwbGFuZS0+ZG1hX2FkZHIgKyBvZmZzZXQ7CkBA
IC0yMDYsNyArMjA2LDcgQEAgdm9pZCBvbWFwX2ZyYW1lYnVmZmVyX3VwZGF0ZV9zY2Fub3V0KHN0
cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLAogCX0KIAogCS8qIGNvbnZlcnQgdG8gcGl4ZWxzOiAq
LwotCWluZm8tPnNjcmVlbl93aWR0aCAvPSBmb3JtYXQtPmNwcFswXTsKKwlpbmZvLT5zY3JlZW5f
d2lkdGggLz0gZm9ybWF0LT5icHBbMF0gLyA4OwogCiAJaWYgKGZiLT5mb3JtYXQtPmZvcm1hdCA9
PSBEUk1fRk9STUFUX05WMTIpIHsKIAkJcGxhbmUgPSAmb21hcF9mYi0+cGxhbmVzWzFdOwpAQCAt
MzgyLDEwICszODIsMTAgQEAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqb21hcF9mcmFtZWJ1ZmZl
cl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCWdvdG8gZmFpbDsKIAl9CiAKLQlpZiAo
cGl0Y2ggJSBmb3JtYXQtPmNwcFswXSkgeworCWlmIChwaXRjaCAlIChmb3JtYXQtPmJwcFswXSAv
IDgpKSB7CiAJCWRldl9kYmcoZGV2LT5kZXYsCiAJCQkiYnVmZmVyIHBpdGNoICgldSBieXRlcykg
aXMgbm90IGEgbXVsdGlwbGUgb2YgcGl4ZWwgc2l6ZSAoJXUgYnl0ZXMpXG4iLAotCQkJcGl0Y2gs
IGZvcm1hdC0+Y3BwWzBdKTsKKwkJCXBpdGNoLCBmb3JtYXQtPmJwcFswXSAvIDgpOwogCQlyZXQg
PSAtRUlOVkFMOwogCQlnb3RvIGZhaWw7CiAJfQotLSAKMi43LjQKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

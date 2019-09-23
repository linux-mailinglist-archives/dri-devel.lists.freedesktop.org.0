Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8E9BB46B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495306E8CE;
	Mon, 23 Sep 2019 12:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498B06E8CD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:53:58 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.236])
 by regular1.263xmail.com (Postfix) with ESMTP id 30BDF275;
 Mon, 23 Sep 2019 20:53:55 +0800 (CST)
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
 Mon, 23 Sep 2019 20:53:54 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <454a4a62b894b008478819c2497f3d21>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Linus Walleij <linus.walleij@linaro.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 32/36] drm/mcde: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:53:46 +0800
Message-Id: <1569243230-183568-2-git-send-email-hjc@rock-chips.com>
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
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9tY2RlL21jZGVfZGlzcGxheS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tY2RlL21jZGVfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kaXNwbGF5
LmMKaW5kZXggNzUxNDU0YS4uZGEyYTNkYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21j
ZGUvbWNkZV9kaXNwbGF5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kaXNwbGF5
LmMKQEAgLTE2OCw3ICsxNjgsNyBAQCBzdGF0aWMgaW50IG1jZGVfZGlzcGxheV9jaGVjayhzdHJ1
Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCiAJCSAqIFRoZXJlJ3Mgbm8gcGl0Y2gg
cmVnaXN0ZXIsIHRoZSBtb2RlJ3MgaGRpc3BsYXkKIAkJICogY29udHJvbHMgdGhpcy4KIAkJICov
Ci0JCWlmIChmYi0+cGl0Y2hlc1swXSAhPSBtb2RlLT5oZGlzcGxheSAqIGZiLT5mb3JtYXQtPmNw
cFswXSkgeworCQlpZiAoZmItPnBpdGNoZXNbMF0gIT0gbW9kZS0+aGRpc3BsYXkgKiBmYi0+Zm9y
bWF0LT5icHBbMF0gLyA4KSB7CiAJCQlEUk1fREVCVUdfS01TKCJjYW4ndCBoYW5kbGUgcGl0Y2hl
c1xuIik7CiAJCQlyZXR1cm4gLUVJTlZBTDsKIAkJfQpAQCAtODIzLDcgKzgyMyw3IEBAIHN0YXRp
YyB2b2lkIG1jZGVfZGlzcGxheV9lbmFibGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBl
ICpwaXBlLAogCXUzMiBmb3JtYXR0ZXJfcHBsID0gbW9kZS0+aGRpc3BsYXk7IC8qIHBpeGVscyBw
ZXIgbGluZSAqLwogCXUzMiBmb3JtYXR0ZXJfbHBmID0gbW9kZS0+dmRpc3BsYXk7IC8qIGxpbmVz
IHBlciBmcmFtZSAqLwogCWludCBwa3Rfc2l6ZSwgZmlmb193dHJtcms7Ci0JaW50IGNwcCA9IGZi
LT5mb3JtYXQtPmNwcFswXTsKKwlpbnQgY3BwID0gZmItPmZvcm1hdC0+YnBwWzBdIC8gODsKIAlp
bnQgZm9ybWF0dGVyX2NwcDsKIAlzdHJ1Y3QgZHJtX2Zvcm1hdF9uYW1lX2J1ZiB0bXA7CiAJdTMy
IGZvcm1hdHRlcl9mcmFtZTsKLS0gCjIuNy40CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==

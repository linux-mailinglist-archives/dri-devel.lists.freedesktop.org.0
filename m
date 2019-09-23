Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8086DBB433
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF756E8AF;
	Mon, 23 Sep 2019 12:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D77E6E8AF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:49:33 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.175])
 by regular1.263xmail.com (Postfix) with ESMTP id 78A7F1EB;
 Mon, 23 Sep 2019 20:49:31 +0800 (CST)
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
 P28975T139999806740224S1569242970112868_; 
 Mon, 23 Sep 2019 20:49:31 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <81cc42a836c8ab33cf18b9b9ce045c3e>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 16/36] drm/tilcdc: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:49:08 +0800
Message-Id: <1569242968-183093-1-git-send-email-hjc@rock-chips.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS90aWxjZGMvdGlsY2RjX2NydGMuYyAgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vdGls
Y2RjL3RpbGNkY19wbGFuZS5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90
aWxjZGNfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfY3J0Yy5jCmluZGV4
IGU5ZGQ1ZTUuLjc4YzU4N2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGls
Y2RjX2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY19jcnRjLmMKQEAg
LTcxLDcgKzcxLDcgQEAgc3RhdGljIHZvaWQgc2V0X3NjYW5vdXQoc3RydWN0IGRybV9jcnRjICpj
cnRjLCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYikKIAogCXN0YXJ0ID0gZ2VtLT5wYWRkciAr
IGZiLT5vZmZzZXRzWzBdICsKIAkJY3J0Yy0+eSAqIGZiLT5waXRjaGVzWzBdICsKLQkJY3J0Yy0+
eCAqIGZiLT5mb3JtYXQtPmNwcFswXTsKKwkJY3J0Yy0+eCAqIGZiLT5mb3JtYXQtPmJwcFswXSAv
IDg7CiAKIAllbmQgPSBzdGFydCArIChjcnRjLT5tb2RlLnZkaXNwbGF5ICogZmItPnBpdGNoZXNb
MF0pOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY19wbGFuZS5j
IGIvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfcGxhbmUuYwppbmRleCAzYWJiOTY0Li5m
Y2E3Mzc1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY19wbGFuZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3BsYW5lLmMKQEAgLTU1LDcgKzU1
LDcgQEAgc3RhdGljIGludCB0aWxjZGNfcGxhbmVfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lLAogCX0KIAogCXBpdGNoID0gY3J0Y19zdGF0ZS0+bW9kZS5oZGlzcGxheSAqCi0J
CXN0YXRlLT5mYi0+Zm9ybWF0LT5jcHBbMF07CisJCXN0YXRlLT5mYi0+Zm9ybWF0LT5icHBbMF0g
LyA4OwogCWlmIChzdGF0ZS0+ZmItPnBpdGNoZXNbMF0gIT0gcGl0Y2gpIHsKIAkJZGV2X2Vycihw
bGFuZS0+ZGV2LT5kZXYsCiAJCQkiSW52YWxpZCBwaXRjaDogZmIgYW5kIGNydGMgd2lkdGhzIG11
c3QgYmUgdGhlIHNhbWUiKTsKLS0gCjIuNy40CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==

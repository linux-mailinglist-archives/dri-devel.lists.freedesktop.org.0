Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF18BB439
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CF06E8B1;
	Mon, 23 Sep 2019 12:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5370589E0C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:49:41 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.175])
 by regular1.263xmail.com (Postfix) with ESMTP id 51CD1340;
 Mon, 23 Sep 2019 20:49:33 +0800 (CST)
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
 Mon, 23 Sep 2019 20:49:32 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <b51224ed549f04fece0cf705ffb16e26>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Shawn Guo <shawnguo@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 17/36] drm/zte: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:49:09 +0800
Message-Id: <1569242968-183093-2-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569242968-183093-1-git-send-email-hjc@rock-chips.com>
References: <1569242968-183093-1-git-send-email-hjc@rock-chips.com>
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
Z3B1L2RybS96dGUvenhfcGxhbmUuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0venRl
L3p4X3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0venRlL3p4X3BsYW5lLmMKaW5kZXggMDg2YzUw
Zi4uYzI2NWRkMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3p0ZS96eF9wbGFuZS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS96dGUvenhfcGxhbmUuYwpAQCAtMjE4LDcgKzIxOCw3IEBAIHN0
YXRpYyB2b2lkIHp4X3ZsX3BsYW5lX2F0b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxh
bmUsCiAJCWNtYV9vYmogPSBkcm1fZmJfY21hX2dldF9nZW1fb2JqKGZiLCBpKTsKIAkJcGFkZHIg
PSBjbWFfb2JqLT5wYWRkciArIGZiLT5vZmZzZXRzW2ldOwogCQlwYWRkciArPSBzcmNfeSAqIGZi
LT5waXRjaGVzW2ldOwotCQlwYWRkciArPSBzcmNfeCAqIGZiLT5mb3JtYXQtPmNwcFtpXTsKKwkJ
cGFkZHIgKz0gc3JjX3ggKiBmYi0+Zm9ybWF0LT5icHBbaV0gLyA4OwogCQl6eF93cml0ZWwocGFk
ZHJfcmVnLCBwYWRkcik7CiAJCXBhZGRyX3JlZyArPSA0OwogCX0KQEAgLTM3OSw3ICszNzksNyBA
QCBzdGF0aWMgdm9pZCB6eF9nbF9wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUg
KnBsYW5lLAogCWRzdF93ID0gcGxhbmUtPnN0YXRlLT5jcnRjX3c7CiAJZHN0X2ggPSBwbGFuZS0+
c3RhdGUtPmNydGNfaDsKIAotCWJwcCA9IGZiLT5mb3JtYXQtPmNwcFswXTsKKwlicHAgPSBmYi0+
Zm9ybWF0LT5icHBbMF0gLyA4OwogCiAJY21hX29iaiA9IGRybV9mYl9jbWFfZ2V0X2dlbV9vYmoo
ZmIsIDApOwogCXBhZGRyID0gY21hX29iai0+cGFkZHIgKyBmYi0+b2Zmc2V0c1swXTsKLS0gCjIu
Ny40CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

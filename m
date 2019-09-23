Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3912BB455
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FFF6E8BC;
	Mon, 23 Sep 2019 12:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09F66E8BC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:52:31 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.128])
 by regular1.263xmail.com (Postfix) with ESMTP id 4931FB7E;
 Mon, 23 Sep 2019 20:52:29 +0800 (CST)
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
 Mon, 23 Sep 2019 20:52:28 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <0879891f7949fe71dcd17fbe9529da66>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 25/36] drm/imx: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:51:48 +0800
Message-Id: <1569243119-183293-5-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569243119-183293-1-git-send-email-hjc@rock-chips.com>
References: <1569243119-183293-1-git-send-email-hjc@rock-chips.com>
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
Cc: linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9pbXgvaXB1djMtcGxhbmUuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2lteC9pcHV2My1wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1wbGFuZS5j
CmluZGV4IDI4ODI2YzAuLmY3YzcwMzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgv
aXB1djMtcGxhbmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmMKQEAg
LTEwMSw3ICsxMDEsNyBAQCBkcm1fcGxhbmVfc3RhdGVfdG9fZWJhKHN0cnVjdCBkcm1fcGxhbmVf
c3RhdGUgKnN0YXRlLCBpbnQgcGxhbmUpCiAJQlVHX09OKCFjbWFfb2JqKTsKIAogCXJldHVybiBj
bWFfb2JqLT5wYWRkciArIGZiLT5vZmZzZXRzW3BsYW5lXSArIGZiLT5waXRjaGVzW3BsYW5lXSAq
IHkgKwotCSAgICAgICBmYi0+Zm9ybWF0LT5jcHBbcGxhbmVdICogeDsKKwkgICAgICAgZmItPmZv
cm1hdC0+YnBwW3BsYW5lXSAvIDggKiB4OwogfQogCiBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxv
bmcKQEAgLTEyMCw3ICsxMjAsNyBAQCBkcm1fcGxhbmVfc3RhdGVfdG9fdWJvKHN0cnVjdCBkcm1f
cGxhbmVfc3RhdGUgKnN0YXRlKQogCXkgLz0gZmItPmZvcm1hdC0+dnN1YjsKIAogCXJldHVybiBj
bWFfb2JqLT5wYWRkciArIGZiLT5vZmZzZXRzWzFdICsgZmItPnBpdGNoZXNbMV0gKiB5ICsKLQkg
ICAgICAgZmItPmZvcm1hdC0+Y3BwWzFdICogeCAtIGViYTsKKwkgICAgICAgZmItPmZvcm1hdC0+
YnBwWzFdIC8gOCAqIHggLSBlYmE7CiB9CiAKIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZwpA
QCAtMTM5LDcgKzEzOSw3IEBAIGRybV9wbGFuZV9zdGF0ZV90b192Ym8oc3RydWN0IGRybV9wbGFu
ZV9zdGF0ZSAqc3RhdGUpCiAJeSAvPSBmYi0+Zm9ybWF0LT52c3ViOwogCiAJcmV0dXJuIGNtYV9v
YmotPnBhZGRyICsgZmItPm9mZnNldHNbMl0gKyBmYi0+cGl0Y2hlc1syXSAqIHkgKwotCSAgICAg
ICBmYi0+Zm9ybWF0LT5jcHBbMl0gKiB4IC0gZWJhOworCSAgICAgICBmYi0+Zm9ybWF0LT5icHBb
Ml0gLyA4ICogeCAtIGViYTsKIH0KIAogdm9pZCBpcHVfcGxhbmVfcHV0X3Jlc291cmNlcyhzdHJ1
Y3QgaXB1X3BsYW5lICppcHVfcGxhbmUpCkBAIC02MjgsNyArNjI4LDcgQEAgc3RhdGljIHZvaWQg
aXB1X3BsYW5lX2F0b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJd2lkdGgg
PSBkcm1fcmVjdF93aWR0aCgmc3RhdGUtPnNyYykgPj4gMTY7CiAJaGVpZ2h0ID0gZHJtX3JlY3Rf
aGVpZ2h0KCZzdGF0ZS0+c3JjKSA+PiAxNjsKIAlpbmZvID0gZHJtX2Zvcm1hdF9pbmZvKGZiLT5m
b3JtYXQtPmZvcm1hdCk7Ci0JaXB1X2NhbGN1bGF0ZV9idXJzdHMod2lkdGgsIGluZm8tPmNwcFsw
XSwgZmItPnBpdGNoZXNbMF0sCisJaXB1X2NhbGN1bGF0ZV9idXJzdHMod2lkdGgsIGluZm8tPmJw
cFswXSAvIDgsIGZiLT5waXRjaGVzWzBdLAogCQkJICAgICAmYnVyc3RzaXplLCAmbnVtX2J1cnN0
cyk7CiAKIAlpcHVfY3BtZW1femVybyhpcHVfcGxhbmUtPmlwdV9jaCk7Ci0tIAoyLjcuNAoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

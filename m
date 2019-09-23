Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88080BB481
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9446E8DB;
	Mon, 23 Sep 2019 12:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 464 seconds by postgrey-1.36 at gabe;
 Mon, 23 Sep 2019 12:56:03 UTC
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0E56E8D4;
 Mon, 23 Sep 2019 12:56:03 +0000 (UTC)
Received: from localhost (unknown [192.168.167.227])
 by lucky1.263xmail.com (Postfix) with ESMTP id 0560F5CA40;
 Mon, 23 Sep 2019 20:48:18 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P14169T140710336407296S1569242883858959_; 
 Mon, 23 Sep 2019 20:48:17 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <6dc34a8606be9c4da5e7b4229724bf36>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 13/36] drm/nouveau: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:47:37 +0800
Message-Id: <1569242880-182878-3-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569242880-182878-1-git-send-email-hjc@rock-chips.com>
References: <1569242880-182878-1-git-send-email-hjc@rock-chips.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L2NydGMuYyAgICAgfCA3ICsrKystLS0KIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Jhc2U1MDdjLmMgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjUwL292bHk1MDdlLmMgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9kaXNwbnYwNC9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnYwNC9jcnRjLmMKaW5kZXggZjIyZjAxMC4uNTlkMmYwNyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2Rpc3BudjA0L2NydGMuYwpAQCAtODc0LDExICs4NzQsMTIgQEAgbnYwNF9jcnRjX2Rv
X21vZGVfc2V0X2Jhc2Uoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCiAJLyogVXBkYXRlIHRoZSBm
cmFtZWJ1ZmZlciBsb2NhdGlvbi4gKi8KIAlyZWdwLT5mYl9zdGFydCA9IG52X2NydGMtPmZiLm9m
ZnNldCAmIH4zOwotCXJlZ3AtPmZiX3N0YXJ0ICs9ICh5ICogZHJtX2ZiLT5waXRjaGVzWzBdKSAr
ICh4ICogZHJtX2ZiLT5mb3JtYXQtPmNwcFswXSk7CisJcmVncC0+ZmJfc3RhcnQgKz0gKHkgKiBk
cm1fZmItPnBpdGNoZXNbMF0pICsKKwkJCQkoeCAqIGRybV9mYi0+Zm9ybWF0LT5icHBbMF0gLyA4
KTsKIAludl9zZXRfY3J0Y19iYXNlKGRldiwgbnZfY3J0Yy0+aW5kZXgsIHJlZ3AtPmZiX3N0YXJ0
KTsKIAogCS8qIFVwZGF0ZSB0aGUgYXJiaXRyYXRpb24gcGFyYW1ldGVycy4gKi8KLQlub3V2ZWF1
X2NhbGNfYXJiKGRldiwgY3J0Yy0+bW9kZS5jbG9jaywgZHJtX2ZiLT5mb3JtYXQtPmNwcFswXSAq
IDgsCisJbm91dmVhdV9jYWxjX2FyYihkZXYsIGNydGMtPm1vZGUuY2xvY2ssIGRybV9mYi0+Zm9y
bWF0LT5icHBbMF0sCiAJCQkgJmFyYl9idXJzdCwgJmFyYl9sd20pOwogCiAJcmVncC0+Q1JUQ1tO
Vl9DSU9fQ1JFX0ZGX0lOREVYXSA9IGFyYl9idXJzdDsKQEAgLTEyMzgsNyArMTIzOSw3IEBAIG52
MDRfY3J0Y19wYWdlX2ZsaXAoc3RydWN0IGRybV9jcnRjICpjcnRjLCBzdHJ1Y3QgZHJtX2ZyYW1l
YnVmZmVyICpmYiwKIAogCS8qIEluaXRpYWxpemUgYSBwYWdlIGZsaXAgc3RydWN0ICovCiAJKnMg
PSAoc3RydWN0IG52MDRfcGFnZV9mbGlwX3N0YXRlKQotCQl7IHsgfSwgZXZlbnQsIGNydGMsIGZi
LT5mb3JtYXQtPmNwcFswXSAqIDgsIGZiLT5waXRjaGVzWzBdLAorCQl7IHsgfSwgZXZlbnQsIGNy
dGMsIGZiLT5mb3JtYXQtPmJwcFswXSwgZmItPnBpdGNoZXNbMF0sCiAJCSAgbmV3X2JvLT5iby5v
ZmZzZXQgfTsKIAogCS8qIEtlZXAgdmJsYW5rcyBvbiBkdXJpbmcgZmxpcCwgZm9yIHRoZSB0YXJn
ZXQgY3J0YyBvZiB0aGlzIGZsaXAgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L2Rpc3BudjUwL2Jhc2U1MDdjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1
MC9iYXNlNTA3Yy5jCmluZGV4IGQ1ZTI5NWMuLjU5ODgzYmQwIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9iYXNlNTA3Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2Rpc3BudjUwL2Jhc2U1MDdjLmMKQEAgLTE5MCwxMiArMTkwLDEyIEBAIGJhc2U1
MDdjX2FjcXVpcmUoc3RydWN0IG52NTBfd25kdyAqd25kdywgc3RydWN0IG52NTBfd25kd19hdG9t
ICphc3l3LAogCQlyZXR1cm4gcmV0OwogCiAJaWYgKCF3bmR3LT5mdW5jLT5pbHV0KSB7Ci0JCWlm
ICgoYXN5aC0+YmFzZS5jcHAgIT0gMSkgXiAoZmItPmZvcm1hdC0+Y3BwWzBdICE9IDEpKQorCQlp
ZiAoYXN5aC0+YmFzZS5jcHAgIT0gMSBeIGZiLT5mb3JtYXQtPmJwcFswXSAhPSA4KQogCQkJYXN5
aC0+c3RhdGUuY29sb3JfbWdtdF9jaGFuZ2VkID0gdHJ1ZTsKIAl9CiAKIAlhc3loLT5iYXNlLmRl
cHRoID0gZmItPmZvcm1hdC0+ZGVwdGg7Ci0JYXN5aC0+YmFzZS5jcHAgPSBmYi0+Zm9ybWF0LT5j
cHBbMF07CisJYXN5aC0+YmFzZS5jcHAgPSBmYi0+Zm9ybWF0LT5icHBbMF0gLyA4OwogCWFzeWgt
PmJhc2UueCA9IGFzeXctPnN0YXRlLnNyYy54MSA+PiAxNjsKIAlhc3loLT5iYXNlLnkgPSBhc3l3
LT5zdGF0ZS5zcmMueTEgPj4gMTY7CiAJYXN5aC0+YmFzZS53ID0gYXN5dy0+c3RhdGUuZmItPndp
ZHRoOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvb3ZseTUw
N2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL292bHk1MDdlLmMKaW5kZXgg
Y2M0MTc2Ni4uYzZjMmUwYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlz
cG52NTAvb3ZseTUwN2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9v
dmx5NTA3ZS5jCkBAIC0xMzUsNyArMTM1LDcgQEAgb3ZseTUwN2VfYWNxdWlyZShzdHJ1Y3QgbnY1
MF93bmR3ICp3bmR3LCBzdHJ1Y3QgbnY1MF93bmR3X2F0b20gKmFzeXcsCiAJaWYgKHJldCkKIAkJ
cmV0dXJuIHJldDsKIAotCWFzeWgtPm92bHkuY3BwID0gZmItPmZvcm1hdC0+Y3BwWzBdOworCWFz
eWgtPm92bHkuY3BwID0gZmItPmZvcm1hdC0+YnBwWzBdIC8gODsKIAlyZXR1cm4gMDsKIH0KIAot
LSAKMi43LjQKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

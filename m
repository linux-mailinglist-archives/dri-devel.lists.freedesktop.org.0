Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 679C1190070
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 22:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B8189E0D;
	Mon, 23 Mar 2020 21:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1128 seconds by postgrey-1.36 at gabe;
 Mon, 23 Mar 2020 21:35:36 UTC
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E4C89E0D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 21:35:36 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jGUR6-0004GR-5B; Mon, 23 Mar 2020 22:16:40 +0100
Received: from ukl by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jGUR3-0006TG-DH; Mon, 23 Mar 2020 22:16:37 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: imxfb: ensure balanced regulator usage
Date: Mon, 23 Mar 2020 22:16:26 +0100
Message-Id: <20200323211626.24812-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZiZGV2IGZyYW1ld29yayBkb2Vzbid0IGNhcmUgdG8gY2FsbCB0aGUgLnNldF9wb3dlciBj
YWxsYmFjayBvbmx5IG9uCmNoYW5nZXMuIFNvIHRoZSBkcml2ZXIgaGFzIHRvIGNhcmUgZm9yIGl0
c2VsZiB0aGF0IHRoZSByZWd1bGF0b3IgZG9lc24ndApnZXQgZGlzYWJsZWQgbW9yZSBvZnRlbiB0
aGFuIGVuYWJsZWQuCgpUaGlzIGZpeGVzIHRoZSByZWd1bGF0b3Igd2FybmluZwoKCXVuYmFsYW5j
ZWQgZGlzYWJsZXMgZm9yIGxjZCBzdXBwbHkKCndoaWNoIGNhbiBiZSB0cmlnZ2VyZWQgYnkgZG9p
bmcKCgllY2hvIDQgPiAvc3lzL2NsYXNzL2xjZC9pbXhmYi1sY2QvbGNkX3Bvd2VyCgp0d2ljZS4K
ClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0
cm9uaXguZGU+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9pbXhmYi5jIHwgMjcgKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2lteGZiLmMgYi9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2lteGZiLmMKaW5kZXggMzcwYmYyNTUzZDQzLi44ODRiMTZlZmE3
ZTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvaW14ZmIuYworKysgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L2lteGZiLmMKQEAgLTE3Miw2ICsxNzIsNyBAQCBzdHJ1Y3QgaW14ZmJfaW5m
byB7CiAJaW50CQkJbnVtX21vZGVzOwogCiAJc3RydWN0IHJlZ3VsYXRvcgkqbGNkX3B3cjsKKwlp
bnQJCQlsY2RfcHdyX2VuYWJsZWQ7CiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBsYXRmb3Jt
X2RldmljZV9pZCBpbXhmYl9kZXZ0eXBlW10gPSB7CkBAIC04MDEsMTYgKzgwMiwzMCBAQCBzdGF0
aWMgaW50IGlteGZiX2xjZF9nZXRfcG93ZXIoc3RydWN0IGxjZF9kZXZpY2UgKmxjZGRldikKIAly
ZXR1cm4gRkJfQkxBTktfVU5CTEFOSzsKIH0KIAorc3RhdGljIGludCBpbXhmYl9yZWd1bGF0b3Jf
c2V0KHN0cnVjdCBpbXhmYl9pbmZvICpmYmksIGludCBlbmFibGUpCit7CisJaW50IHJldDsKKwor
CWlmIChlbmFibGUgPT0gZmJpLT5sY2RfcHdyX2VuYWJsZWQpCisJCXJldHVybiAwOworCisJaWYg
KGVuYWJsZSkKKwkJcmV0ID0gcmVndWxhdG9yX2VuYWJsZShmYmktPmxjZF9wd3IpOworCWVsc2UK
KwkJcmV0ID0gcmVndWxhdG9yX2Rpc2FibGUoZmJpLT5sY2RfcHdyKTsKKworCWlmIChyZXQgPT0g
MCkKKwkJZmJpLT5sY2RfcHdyX2VuYWJsZWQgPSBlbmFibGU7CisKKwlyZXR1cm4gcmV0OworfQor
CiBzdGF0aWMgaW50IGlteGZiX2xjZF9zZXRfcG93ZXIoc3RydWN0IGxjZF9kZXZpY2UgKmxjZGRl
diwgaW50IHBvd2VyKQogewogCXN0cnVjdCBpbXhmYl9pbmZvICpmYmkgPSBkZXZfZ2V0X2RydmRh
dGEoJmxjZGRldi0+ZGV2KTsKIAotCWlmICghSVNfRVJSKGZiaS0+bGNkX3B3cikpIHsKLQkJaWYg
KHBvd2VyID09IEZCX0JMQU5LX1VOQkxBTkspCi0JCQlyZXR1cm4gcmVndWxhdG9yX2VuYWJsZShm
YmktPmxjZF9wd3IpOwotCQllbHNlCi0JCQlyZXR1cm4gcmVndWxhdG9yX2Rpc2FibGUoZmJpLT5s
Y2RfcHdyKTsKLQl9CisJaWYgKCFJU19FUlIoZmJpLT5sY2RfcHdyKSkKKwkJcmV0dXJuIGlteGZi
X3JlZ3VsYXRvcl9zZXQoZmJpLCBwb3dlciA9PSBGQl9CTEFOS19VTkJMQU5LKTsKIAogCXJldHVy
biAwOwogfQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK

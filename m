Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E88822635C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 17:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3A489B0D;
	Mon, 20 Jul 2020 15:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A70B89B0D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 15:33:05 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jxXmm-0003hE-3H; Mon, 20 Jul 2020 17:33:00 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jxXmj-0004PQ-CT; Mon, 20 Jul 2020 17:32:57 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/mxsfb: improve clk handling for axi clk
Date: Mon, 20 Jul 2020 17:32:54 +0200
Message-Id: <20200720153254.18071-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWdub3JpbmcgZXJyb3JzIGZyb20gZGV2bV9jbGtfZ2V0KCkgaXMgd3JvbmcuIFRvIGhhbmRsZSBu
b3QgYWxsIHBsYXRmb3JtcwpoYXZpbmcgYW4gYXhpIGNsayB1c2UgZGV2bV9jbGtfZ2V0X29wdGlv
bmFsKCkgaW5zdGVhZCBhbmQgZG8gcHJvcGVyIGVycm9yCmhhbmRsaW5nLgoKQWxzbyB0aGUgY2xr
IEFQSSBoYW5kbGVzIE5VTEwgYXMgYSBkdW1teSBjbGsgKHdoaWNoIGlzIGFsc28gcmV0dXJuZWQg
YnkKZGV2bV9jbGtfZ2V0X29wdGlvbmFsKCkgaWYgdGhlcmUgaXMgbm8gY2xrKSBzbyB0aGVyZSBp
cyBubyBuZWVkIHRvIGNoZWNrCmZvciBOVUxMIGJlZm9yZSBjYWxsaW5nIGNsa19wcmVwYXJlX2Vu
YWJsZSgpIG9yIGl0cyBjb3VudGVyIHBhcnQuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvD
tm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9teHNmYi9teHNmYl9kcnYuYyB8IDEwICsrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L214c2ZiL214c2ZiX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jCmlu
ZGV4IGZiOTcyZGQ0ZjY0Mi4uNmUxODViYTc0YjRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbXhzZmIvbXhzZmJfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Ry
di5jCkBAIC03NywxNCArNzcsMTIgQEAgZHJtX3BpcGVfdG9fbXhzZmJfZHJtX3ByaXZhdGUoc3Ry
dWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlKQogCiB2b2lkIG14c2ZiX2VuYWJsZV9h
eGlfY2xrKHN0cnVjdCBteHNmYl9kcm1fcHJpdmF0ZSAqbXhzZmIpCiB7Ci0JaWYgKG14c2ZiLT5j
bGtfYXhpKQotCQljbGtfcHJlcGFyZV9lbmFibGUobXhzZmItPmNsa19heGkpOworCWNsa19wcmVw
YXJlX2VuYWJsZShteHNmYi0+Y2xrX2F4aSk7CiB9CiAKIHZvaWQgbXhzZmJfZGlzYWJsZV9heGlf
Y2xrKHN0cnVjdCBteHNmYl9kcm1fcHJpdmF0ZSAqbXhzZmIpCiB7Ci0JaWYgKG14c2ZiLT5jbGtf
YXhpKQotCQljbGtfZGlzYWJsZV91bnByZXBhcmUobXhzZmItPmNsa19heGkpOworCWNsa19kaXNh
YmxlX3VucHJlcGFyZShteHNmYi0+Y2xrX2F4aSk7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHJtX21vZGVfY29uZmlnX2Z1bmNzIG14c2ZiX21vZGVfY29uZmlnX2Z1bmNzID0gewpAQCAtMjE0
LDkgKzIxMiw5IEBAIHN0YXRpYyBpbnQgbXhzZmJfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZHJt
KQogCWlmIChJU19FUlIobXhzZmItPmNsaykpCiAJCXJldHVybiBQVFJfRVJSKG14c2ZiLT5jbGsp
OwogCi0JbXhzZmItPmNsa19heGkgPSBkZXZtX2Nsa19nZXQoZHJtLT5kZXYsICJheGkiKTsKKwlt
eHNmYi0+Y2xrX2F4aSA9IGRldm1fY2xrX2dldF9vcHRpb25hbChkcm0tPmRldiwgImF4aSIpOwog
CWlmIChJU19FUlIobXhzZmItPmNsa19heGkpKQotCQlteHNmYi0+Y2xrX2F4aSA9IE5VTEw7CisJ
CXJldHVybiBQVFJfRVJSKG14c2ZiLT5jbGtfYXhpKTsKIAogCW14c2ZiLT5jbGtfZGlzcF9heGkg
PSBkZXZtX2Nsa19nZXQoZHJtLT5kZXYsICJkaXNwX2F4aSIpOwogCWlmIChJU19FUlIobXhzZmIt
PmNsa19kaXNwX2F4aSkpCi0tIAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=

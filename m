Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 858318D28E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 13:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4931B89189;
	Wed, 14 Aug 2019 11:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1E189A16
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 11:54:57 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hxrrj-00036w-Lh; Wed, 14 Aug 2019 13:54:55 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] gpu: ipu-v3: image-convert: only sample into the next
 tile if necessary
Date: Wed, 14 Aug 2019 13:54:44 +0200
Message-Id: <20190814115444.13024-7-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814115444.13024-1-p.zabel@pengutronix.de>
References: <20190814115444.13024-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, Steve Longerbeam <slongerbeam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZpcnN0IHBpeGVsIG9mIHRoZSBuZXh0IHRpbGUgaXMgb25seSBzYW1wbGVkIGJ5IHRoZSBo
YXJkd2FyZSBpZiB0aGUKZnJhY3Rpb25hbCBpbnB1dCBwb3NpdGlvbiBjb3JyZXNwb25kaW5nIHRv
IHRoZSBsYXN0IHdyaXR0ZW4gb3V0cHV0IHBpeGVsCmlzIG5vdCBhbiBpbnRlZ2VyIHBvc2l0aW9u
LgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4K
LS0tCiBkcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWltYWdlLWNvbnZlcnQuYyB8IDQgKystLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWltYWdlLWNvbnZlcnQuYyBiL2RyaXZlcnMvZ3B1L2lw
dS12My9pcHUtaW1hZ2UtY29udmVydC5jCmluZGV4IGNjMjM3YzFmMzJmMC4uMDZkNjU4YzhjYTNi
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWltYWdlLWNvbnZlcnQuYworKysg
Yi9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWltYWdlLWNvbnZlcnQuYwpAQCAtMTE0OSw3ICsxMTQ5
LDcgQEAgc3RhdGljIHZvaWQgY2FsY190aWxlX3Jlc2l6ZV9jb2VmZmljaWVudHMoc3RydWN0IGlw
dV9pbWFnZV9jb252ZXJ0X2N0eCAqY3R4KQogCQkgKiBidXJzdCBzaXplLgogCQkgKi8KIAkJbGFz
dF9vdXRwdXQgPSByZXNpemVkX3dpZHRoIC0gMTsKLQkJaWYgKGNsb3Nlc3QpCisJCWlmIChjbG9z
ZXN0ICYmICgobGFzdF9vdXRwdXQgKiByZXNpemVfY29lZmZfaCkgJSA4MTkyKSkKIAkJCWxhc3Rf
b3V0cHV0Kys7CiAJCWluX3dpZHRoID0gcm91bmRfdXAoCiAJCQkoRElWX1JPVU5EX1VQKGxhc3Rf
b3V0cHV0ICogcmVzaXplX2NvZWZmX2gsIDgxOTIpICsgMSkKQEAgLTEyMDYsNyArMTIwNiw3IEBA
IHN0YXRpYyB2b2lkIGNhbGNfdGlsZV9yZXNpemVfY29lZmZpY2llbnRzKHN0cnVjdCBpcHVfaW1h
Z2VfY29udmVydF9jdHggKmN0eCkKIAkJICogSURNQUMgcmVzdHJpY3Rpb25zLgogCQkgKi8KIAkJ
bGFzdF9vdXRwdXQgPSByZXNpemVkX2hlaWdodCAtIDE7Ci0JCWlmIChjbG9zZXN0KQorCQlpZiAo
Y2xvc2VzdCAmJiAoKGxhc3Rfb3V0cHV0ICogcmVzaXplX2NvZWZmX3YpICUgODE5MikpCiAJCQls
YXN0X291dHB1dCsrOwogCQlpbl9oZWlnaHQgPSByb3VuZF91cCgKIAkJCShESVZfUk9VTkRfVVAo
bGFzdF9vdXRwdXQgKiByZXNpemVfY29lZmZfdiwgODE5MikgKyAxKQotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

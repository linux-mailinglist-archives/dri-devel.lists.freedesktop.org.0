Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3D2B358E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 09:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5778B6E849;
	Mon, 16 Sep 2019 07:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp02.smtpout.orange.fr
 [80.12.242.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CA26E0BF
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 19:41:22 +0000 (UTC)
Received: from localhost.localdomain ([93.23.196.41]) by mwinf5d03 with ME
 id 1vhJ210060u43at03vhJXW; Sun, 15 Sep 2019 21:41:20 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 15 Sep 2019 21:41:20 +0200
X-ME-IP: 93.23.196.41
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: linus.walleij@linaro.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/mcde: Fix some resource leak in an error path in
 'mcde_probe()'
Date: Sun, 15 Sep 2019 21:41:14 +0200
Message-Id: <20190915194114.27658-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Sep 2019 07:28:04 +0000
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsIGVycm9yIGhhbmRsaW5nIHBhdGhzIGJlZm9yZSBhbmQgYWZ0ZXIgdGhpcyBvbmUgZ28gdG8g
dGhlCidjbGtfZGlzYWJsZScgbGFiZWwgaW4gb3JkZXIgdG8gZnJlZSBzb21lIHJlc291cmNlcy4K
ClNvIHRoZSBzYW1lIGhlcmUuCgpGaXhlczogY2E1YmU5MDJhODdkICgiZHJtL21jZGU6IEZpeCB1
bmluaXRpYWxpemVkIHZhcmlhYmxlIikKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBKQUlMTEVU
IDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWNk
ZS9tY2RlX2Rydi5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5j
IGIvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kcnYuYwppbmRleCA5YTA5ZWJhNTMxODIuLjU2
NDk4ODdkMmI5MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kcnYuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5jCkBAIC00ODQsNyArNDg0LDggQEAg
c3RhdGljIGludCBtY2RlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJfQog
CWlmICghbWF0Y2gpIHsKIAkJZGV2X2VycihkZXYsICJubyBtYXRjaGluZyBjb21wb25lbnRzXG4i
KTsKLQkJcmV0dXJuIC1FTk9ERVY7CisJCXJldCA9IC1FTk9ERVY7CisJCWdvdG8gY2xrX2Rpc2Fi
bGU7CiAJfQogCWlmIChJU19FUlIobWF0Y2gpKSB7CiAJCWRldl9lcnIoZGV2LCAiY291bGQgbm90
IGNyZWF0ZSBjb21wb25lbnQgbWF0Y2hcbiIpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

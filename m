Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDF09A8CA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 09:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EF56EBC1;
	Fri, 23 Aug 2019 07:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp05.smtpout.orange.fr
 [80.12.242.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6236EB11
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 21:15:29 +0000 (UTC)
Received: from localhost.localdomain ([90.126.160.115]) by mwinf5d10 with ME
 id sMFM200022Vh0YS03MFMFh; Thu, 22 Aug 2019 23:15:27 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 22 Aug 2019 23:15:27 +0200
X-ME-IP: 90.126.160.115
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: linus.walleij@linaro.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/mcde: Fix an error handling path in 'mcde_probe()'
Date: Thu, 22 Aug 2019 23:15:18 +0200
Message-Id: <20190822211518.5578-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 23 Aug 2019 07:30:43 +0000
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

SWYgd2UgZG9uJ3QgZmluZCBhbnkgbWF0Y2hpbmcgY29tcG9uZW50cywgd2Ugc2hvdWxkIGdvIHRo
cm91Z2ggdGhlIGVycm9yCmhhbmRsaW5nIHBhdGgsIGluIG9yZGVyIHRvIGZyZWUgc29tZSByZXNv
dXJjZXMuCgpGaXhlczogY2E1YmU5MDJhODdkICgiZHJtL21jZGU6IEZpeCB1bmluaXRpYWxpemVk
IHZhcmlhYmxlIikKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhl
LmphaWxsZXRAd2FuYWRvby5mcj4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5j
IHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5jIGIvZHJpdmVycy9n
cHUvZHJtL21jZGUvbWNkZV9kcnYuYwppbmRleCA5YTA5ZWJhNTMxODIuLjU2NDk4ODdkMmI5MCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kcnYuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5jCkBAIC00ODQsNyArNDg0LDggQEAgc3RhdGljIGludCBt
Y2RlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJfQogCWlmICghbWF0Y2gp
IHsKIAkJZGV2X2VycihkZXYsICJubyBtYXRjaGluZyBjb21wb25lbnRzXG4iKTsKLQkJcmV0dXJu
IC1FTk9ERVY7CisJCXJldCA9IC1FTk9ERVY7CisJCWdvdG8gY2xrX2Rpc2FibGU7CiAJfQogCWlm
IChJU19FUlIobWF0Y2gpKSB7CiAJCWRldl9lcnIoZGV2LCAiY291bGQgbm90IGNyZWF0ZSBjb21w
b25lbnQgbWF0Y2hcbiIpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=

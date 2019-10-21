Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86630DF79A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 23:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C5F6E279;
	Mon, 21 Oct 2019 21:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FBF6E277
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 21:45:56 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id w144so12420267oia.6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 14:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nG1jrqiVrLvARMweYNsyPG+j+EFZbDQxRJlgrVpfL4I=;
 b=tkzu+x32IjRhPjMpr/KbDQMA8Tq45LavPJwpewimcGNI1bYJSWQ96BEJ08p+9cMxvl
 WRAEuoivZppL4j0KhOqfghgxB+ONUlR8JUkyHbNb8vTH2dRjn44Q0VK8bMnhNIfcDfYN
 4AUts7/tTJLkZOuW7Uoea4NVFw5p6+HKiUgeX3RG/+/XVyiHcUiXSp9euqZPgU81tJTM
 oXNfYfNeirL09kp7QSwUHOF9bhsws+7+IJ23Kxi/72xu62TeL6HrwxVWYBEBJK1+hnsx
 LidrPZtB371dCkm/40qW4cy+uQ9BT6PdRZlSyULS+T3VhZAlKMOOyqhx8OXXZH2hCKUZ
 8Hjg==
X-Gm-Message-State: APjAAAVxfNgDRjYHTpKtCG6HZtl1k9r/3btv2cD7pvKY1KQDaO8qui7X
 2V0RoRzvdcOCgV3XknJ+j6hdvXY=
X-Google-Smtp-Source: APXvYqz194LkjFFcxBO2leMnWf7q2qSETO24ZDGsm0zsCS7yjuJ9BThF7g7KveiT7DMyfLh8WcF/xA==
X-Received: by 2002:aca:40b:: with SMTP id 11mr191900oie.59.1571694355381;
 Mon, 21 Oct 2019 14:45:55 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id u130sm4122676oib.56.2019.10.21.14.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 14:45:54 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/kirin: Use DRM_GEM_CMA_VMAP_DRIVER_OPS
Date: Mon, 21 Oct 2019 16:45:45 -0500
Message-Id: <20191021214550.1461-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191021214550.1461-1-robh@kernel.org>
References: <20191021214550.1461-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yannick Fertre <yannick.fertre@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Philippe Cornu <philippe.cornu@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX2dlbV9jbWFfZHVtYl9jcmVhdGVfaW50ZXJuYWwoKSBpcyBub3Qgc3VwcG9zZWQgdG8gYmUg
dXNlZCBmb3IKLmR1bWJfY3JlYXRlIGRpcmVjdGx5LiBkcm1fZ2VtX2NtYV9kdW1iX2NyZWF0ZSgp
IHNob3VsZCBiZSB1c2VkIGluc3RlYWQuCklmIHdlIGRvIHRoYXQsIHdlIG1pZ2h0IGFzIHdlbGwg
Y29udmVydCBvdmVyIHRvIHVzaW5nCkRSTV9HRU1fQ01BX1ZNQVBfRFJJVkVSX09QUyBpbnN0ZWFk
LgoKQ2M6IFhpbmxpYW5nIExpdSA8ei5saXV4aW5saWFuZ0BoaXNpbGljb24uY29tPgpDYzogUm9u
Z3JvbmcgWm91IDx6b3Vyb25ncm9uZ0BnbWFpbC5jb20+CkNjOiBYaW53ZWkgS29uZyA8a29uZy5r
b25neGlud2VpQGhpc2lsaWNvbi5jb20+CkNjOiBDaGVuIEZlbmcgPHB1Y2suY2hlbkBoaXNpbGlj
b24uY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJt
X2FkZS5jIHwgMTEgKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9r
aXJpbi9raXJpbl9kcm1fYWRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tp
cmluX2RybV9hZGUuYwppbmRleCA3M2NkMjhhNmVhMDcuLjQ5MDUzN2ExZDAzNSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMKQEAgLTk0MSwx
NiArOTQxLDcgQEAgREVGSU5FX0RSTV9HRU1fQ01BX0ZPUFMoYWRlX2ZvcHMpOwogc3RhdGljIHN0
cnVjdCBkcm1fZHJpdmVyIGFkZV9kcml2ZXIgPSB7CiAJLmRyaXZlcl9mZWF0dXJlcyA9IERSSVZF
Ul9HRU0gfCBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9BVE9NSUMsCiAJLmZvcHMgPSAmYWRlX2Zv
cHMsCi0JLmdlbV9mcmVlX29iamVjdF91bmxvY2tlZCA9IGRybV9nZW1fY21hX2ZyZWVfb2JqZWN0
LAotCS5nZW1fdm1fb3BzID0gJmRybV9nZW1fY21hX3ZtX29wcywKLQkuZHVtYl9jcmVhdGUgPSBk
cm1fZ2VtX2NtYV9kdW1iX2NyZWF0ZV9pbnRlcm5hbCwKLQkucHJpbWVfaGFuZGxlX3RvX2ZkCT0g
ZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQsCi0JLnByaW1lX2ZkX3RvX2hhbmRsZQk9IGRybV9n
ZW1fcHJpbWVfZmRfdG9faGFuZGxlLAotCS5nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlID0gZHJtX2dl
bV9jbWFfcHJpbWVfZ2V0X3NnX3RhYmxlLAotCS5nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlID0g
ZHJtX2dlbV9jbWFfcHJpbWVfaW1wb3J0X3NnX3RhYmxlLAotCS5nZW1fcHJpbWVfdm1hcCA9IGRy
bV9nZW1fY21hX3ByaW1lX3ZtYXAsCi0JLmdlbV9wcmltZV92dW5tYXAgPSBkcm1fZ2VtX2NtYV9w
cmltZV92dW5tYXAsCi0JLmdlbV9wcmltZV9tbWFwID0gZHJtX2dlbV9jbWFfcHJpbWVfbW1hcCwK
KwlEUk1fR0VNX0NNQV9WTUFQX0RSSVZFUl9PUFMsCiAKIAkubmFtZSA9ICJraXJpbiIsCiAJLmRl
c2MgPSAiSGlzaWxpY29uIEtpcmluNjIwIFNvQyBEUk0gRHJpdmVyIiwKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

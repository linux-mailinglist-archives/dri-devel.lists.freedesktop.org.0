Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69934615E1
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 20:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DF689AFF;
	Sun,  7 Jul 2019 18:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9D589AFF
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 18:24:55 +0000 (UTC)
Received: from pendragon.nordic-sky.finnair.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 252DACC;
 Sun,  7 Jul 2019 20:24:36 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 15/60] drm/bridge: tfp410: Allow operation without
 drm_connector
Date: Sun,  7 Jul 2019 21:18:52 +0300
Message-Id: <20190707181937.6250-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562523893;
 bh=xN7dcG+xq8ihI1Y4O+Y+FBttL9jC01fwi6g4I6rPCtI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MZPPdFSCnl9Uybu+9ZG5HwuuNVmAc+ssYY5LQO0mEfgRPPCvx1+snK7p1kPoXIpcO
 xhyCDRu7dICmVpxK00gy18nnUCXA9NKpuUi1nvCVXc1mqmU4FjyuPF+dyjlOsACgsP
 L/K0uC9xkO7CgQAXtzV9wYqZbrgb30/LUts9mhNI=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHRmcDQxMCBkcml2ZXIgY2FuIG9wZXJhdGUgYXMgcGFydCBvZiBhIHBpcGVsaW5lIHdoZXJl
IHRoZQpkcm1fY29ubmVjdG9yIGlzIGNyZWF0ZWQgYnkgdGhlIGRpc3BsYXkgY29udHJvbGxlci4g
RW5hYmxlIHRoaXMgbW9kZSBvZgpvcGVyYXRpb24gYnkgc2tpcHBpbmcgY3JlYXRpb24gb2YgYSBk
cm1fY29ubmVjdG9yIGludGVybmFsbHkuCgpTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS90aS10ZnA0MTAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGkt
dGZwNDEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jCmluZGV4IGU5NGM0
OTU2NzMxZC4uMzhkMmQyYmRlNGEwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RpLXRmcDQxMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKQEAg
LTEzNiw3ICsxMzYsNyBAQCBzdGF0aWMgaW50IHRmcDQxMF9hdHRhY2goc3RydWN0IGRybV9icmlk
Z2UgKmJyaWRnZSwgYm9vbCBjcmVhdGVfY29ubmVjdG9yKQogCQlyZXR1cm4gcmV0OwogCiAJaWYg
KCFjcmVhdGVfY29ubmVjdG9yKQotCQlyZXR1cm4gLUVJTlZBTDsKKwkJcmV0dXJuIDA7CiAKIAlp
ZiAoIWJyaWRnZS0+ZW5jb2RlcikgewogCQlkZXZfZXJyKGR2aS0+ZGV2LCAiTWlzc2luZyBlbmNv
ZGVyXG4iKTsKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

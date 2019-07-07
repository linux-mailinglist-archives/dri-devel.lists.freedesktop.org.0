Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24153615D7
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 20:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD8689AAD;
	Sun,  7 Jul 2019 18:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E2B89AAD
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 18:21:56 +0000 (UTC)
Received: from pendragon.nordic-sky.finnair.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64C03334;
 Sun,  7 Jul 2019 20:21:39 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/60] drm/bridge: simple-bridge: Add support for the TI OP362
Date: Sun,  7 Jul 2019 21:18:44 +0300
Message-Id: <20190707181937.6250-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562523715;
 bh=b60a61VkIPG7SdwPOo4Hdal+JIUpSg149odF6qhAxt8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jl1/u8/Ot9feEhnf8szctvBjIINaeBS0qUey1CpLDl/PWudHsxIF+yfmAQYIJSa67
 8znAhW7M/PCoU8D7jCwb7ymBXMTnLUoj2h7/Gxnon5nJYppaPCEeZAfHvBIPhc3nI/
 1rxSs890wNXcRvPvLeJjAi9G3BQZy3sLFcEZRDms=
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

VGhlIFRJIE9QMzYyIGlzIGFuIGFuYWxvZyB2aWRlbyBhbXBsaWZpZXIgY29udHJvbGxlZCB0aHJv
dWdoIGEgR1BJTy4gQWRkCnN1cHBvcnQgZm9yIGl0IHRvIHRoZSBzaW1wbGUtYnJpZGdlIGRyaXZl
ci4KClNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRl
YXNvbmJvYXJkLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbXBsZS1icmlkZ2Uu
YyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbXBsZS1icmlkZ2UuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc2ltcGxlLWJyaWRnZS5jCmluZGV4IGE3ZWRmM2MzOTYyNy4uNzQ5NWI5YmVmODY1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbXBsZS1icmlkZ2UuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbXBsZS1icmlkZ2UuYwpAQCAtMjk2LDYgKzI5Niwx
MSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzaW1wbGVfYnJpZGdlX21hdGNo
W10gPSB7CiAJCQkudGltaW5ncyA9ICZkZWZhdWx0X2JyaWRnZV90aW1pbmdzLAogCQkJLnR5cGUg
PSBEUk1fTU9ERV9DT05ORUNUT1JfVkdBLAogCQl9LAorCX0sIHsKKwkJLmNvbXBhdGlibGUgPSAi
dGksb3BhMzYyIiwKKwkJLmRhdGEgPSAmKGNvbnN0IHN0cnVjdCBzaW1wbGVfYnJpZGdlX2luZm8p
IHsKKwkJCS50eXBlID0gRFJNX01PREVfQ09OTkVDVE9SX0NvbXBvc2l0ZSwKKwkJfSwKIAl9LCB7
CiAJCS5jb21wYXRpYmxlID0gInRpLHRoczgxMzUiLAogCQkuZGF0YSA9ICYoY29uc3Qgc3RydWN0
IHNpbXBsZV9icmlkZ2VfaW5mbykgewotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

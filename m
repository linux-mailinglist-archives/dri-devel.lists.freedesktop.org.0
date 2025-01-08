Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDE7A067BD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 23:04:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B239210E945;
	Wed,  8 Jan 2025 22:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VsgxiL64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A7C10E945
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 22:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736373839;
 bh=aWW96hBbM+vgTBFltAOcnAH+sNdQl3gDyq9n/id7jYQ=;
 h=From:Subject:Date:To:Cc:From;
 b=VsgxiL64/nA+bGurFFc98mqYRHgZqviuA82W2FYoqmnjAVPdzVDA5/P2V3Ujo3JV3
 X6lw/R8gbuaufYRunRCLBGt4B0lr8+iGyf5sH8pUDAFLFHhq0hP1eI3PDtpv+dn/Vr
 tglMjCjTOJIfsztXeeEeOFcTSEXMFo0DEvMHT8VzxHvYRDsSK/CO3fQ16Ksc/81fc6
 zSiQvUmsQ4Tt/RXgRCffegLtq1eQw5ThefaoWtW7//7W4XaDFrWUOEbOC87foEz5aY
 xJMgY2r+jAUSgb3eNLMas9MWxowHj42az0abQiBxac8w9Kml30BWHqYv4xMgBw2aqQ
 vyJuBex/9BrCg==
Received: from localhost (unknown [82.76.59.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0F36B17E35FA;
 Wed,  8 Jan 2025 23:03:59 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/2] Fixup drm_atomic_helper_connector_hdmi_check()
Date: Thu, 09 Jan 2025 00:03:38 +0200
Message-Id: <20250109-hdmi-conn-null-mode-v2-0-9eeaf1109547@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADr2fmcC/32NTQ6CMBBGr0Jm7ZiWAP6svIdhQdupTFI6pFWiI
 dzdygFcvpd871shU2LKcK1WSLRwZokF6kMFdhzig5BdYahV3SqtTji6idFKjBhfIeAkjtCQsi0
 1F3JnC2U5J/L83qv3vvDI+Snps58s+mf/9xaNGr33jaGmc1p1NyshDEbScLQyQb9t2xeNdAJXu
 gAAAA==
X-Change-ID: 20250107-hdmi-conn-null-mode-be0c5e49ed8c
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.14.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a NULL pointer dereference discovered while unloading a DRM module
and provide a couple of tests to make sure the helper works as expected
in case the connector's CRTC is shut down.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Collected R-b tags from Dmitry and Angelo
- Add a 2nd patch providing a couple of KUnit tests (Maxime)
- Link to v1: https://lore.kernel.org/r/20250107-hdmi-conn-null-mode-v1-1-fff4be46d106@collabora.com

---
Cristian Ciocaltea (2):
      drm/connector: hdmi: Handle NULL display mode in state check helper
      drm/tests: hdmi: Add connector's CRTC deactivation tests

 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |   3 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 173 +++++++++++++++++++++
 2 files changed, 176 insertions(+)
---
base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
change-id: 20250107-hdmi-conn-null-mode-be0c5e49ed8c


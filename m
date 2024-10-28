Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76CE9B31DE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 14:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AA310E4AE;
	Mon, 28 Oct 2024 13:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=steffen.cc header.i=@steffen.cc header.b="JGmD6ePJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2282910E4AE
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 13:40:46 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XcZK75skPz9skW;
 Mon, 28 Oct 2024 14:40:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=steffen.cc; s=MBO0001; 
 t=1730122843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GuPaYH7muQ+6E50D/hZ/FPeAmhYFh1B9WY+/CGXP/jw=;
 b=JGmD6ePJLdyNqUmEpNYA5tmL7WTHmkPHpPd+WNxAMn3lX0JLJJmqz0Flwg/0FBdcX9jShB
 ioumr8aoo8JhrZY8ky2obBNuGIDsUiHWFpCYZ1EfSEyBgWSwUdTo9Co4MVuaGpmZWDxdiy
 Ez2ttjEQYEgkqrWs3Uhq+6+lJzQkk/nhGcngAVGinQjCygmRXvPy7NfrU46wDcOlQ7fpo8
 ExjJmnyrckkz/NQocmuZifI2zzGxQReQAFbrEn6W4ameGg7VP+i2qMva9GRuxGPZbw53to
 aSDDEm+W3+sXw9QMMcdOwttxGomeTvwWx0sbjzx1MNIwi6B8wRxobTMN+iXm+A==
From: Steffen Dirkwinkel <lists@steffen.cc>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: xlnx: zynqmp_disp: layer may be null while releasing
Date: Mon, 28 Oct 2024 14:39:40 +0100
Message-ID: <20241028133941.54264-1-lists@steffen.cc>
In-Reply-To: <79aca344-b27e-4b77-aa92-6e4c079486e0@ideasonboard.com>
References: <79aca344-b27e-4b77-aa92-6e4c079486e0@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4XcZK75skPz9skW
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

From: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>

layer->info can be null if we have an error on the first layer in
zynqmp_disp_create_layers

Fixes: 1836fd5ed98d ("drm: xlnx: zynqmp_dpsub: Minimize usage of global flag")
Signed-off-by: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 9368acf56eaf..e4e0e299e8a7 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1200,6 +1200,9 @@ static void zynqmp_disp_layer_release_dma(struct zynqmp_disp *disp,
 {
 	unsigned int i;
 
+	if (!layer->info)
+		return;
+
 	for (i = 0; i < layer->info->num_channels; i++) {
 		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
 
-- 
2.47.0


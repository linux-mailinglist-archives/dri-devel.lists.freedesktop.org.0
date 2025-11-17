Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA5AC65E53
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 20:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8BF10E3E7;
	Mon, 17 Nov 2025 19:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="aFQazYmh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E44410E3E7;
 Mon, 17 Nov 2025 19:13:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763406774; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=U8xLtUf1JkSU4irWo5t9v+N5tbr8fuIwF3WsKDv2i73F1hxoSomrPwkyikcTea/ZRjhe7IDHvX3+rJ2jPlaKfrSJViVdYUca23DPhrANSFgESmKa1Bmur6ukOxDDxxhdc62jdC9hA1ofKbxbfFK+Kgy5jtMDmfJFIbLSWKr1E1Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763406774;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=fW8y+pDMl5hGQ9sPnlF2Lcw6l0B/Y7yloEZ/f+aofb8=; 
 b=atimN2P3ElBUe2s9aDBAXsRYsfOWUFN037Epk+vi9rRmns8KeqR2Moxbik+S3rYRpzVJd0dbrkxGidR5fEfw31UZfwfSgQCPPvz0s1Pnf/rW2GKdpPsM5/c67cuXr6CBOQW83/rYUP/oafn7idxXZR3L2cv0sg3Ue5KaJNgKgcw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763406774; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=fW8y+pDMl5hGQ9sPnlF2Lcw6l0B/Y7yloEZ/f+aofb8=;
 b=aFQazYmh1rjqCYqQKNQDGpp/GUX9ytk87Lg+5AUI9ZCFWg3tGwVR8lXHvSAW1gOj
 mvPUzY+2qaGIkoy1MStW14joH1ys/4w6mHRNUip+lfAcuJ+k8OVIAbnZcSmwIm9NHYf
 fueQjxe83tbqRUaUrVJixNJy4hv0lJS8nS6lnZ4A=
Received: by mx.zohomail.com with SMTPS id 1763406772083636.4830146566981;
 Mon, 17 Nov 2025 11:12:52 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 17 Nov 2025 20:11:49 +0100
Subject: [PATCH v4 05/10] drm/bridge: dw-hdmi-qp: Set bridge supported_formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-color-format-v4-5-0ded72bd1b00@collabora.com>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
In-Reply-To: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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

The drm_bridge "supported_formats" member stores a bitmask of supported
HDMI output formats if the bridge is in fact an HDMI bridge.

However, until now, the synopsys dw-hdmi-qp driver did not set this
member in the bridge it creates.

Set it based on the platform data's supported_formats member, and
default to BIT(HDMI_COLORSPACE_RGB) if it's absent, which preserves the
previous behaviour.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index fe4c026280f0..cf888236bd65 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1269,6 +1269,11 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 		dev_warn(dev, "Set ref_clk_rate to vendor default\n");
 	}
 
+	if (plat_data->supported_formats)
+		hdmi->bridge.supported_formats = plat_data->supported_formats;
+	else
+		hdmi->bridge.supported_formats = BIT(HDMI_COLORSPACE_RGB);
+
 	dw_hdmi_qp_init_hw(hdmi);
 
 	ret = devm_request_threaded_irq(dev, plat_data->main_irq,

-- 
2.51.2


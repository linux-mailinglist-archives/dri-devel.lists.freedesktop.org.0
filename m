Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBUZBZuEnWlsQQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 11:59:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC19B185CC2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 11:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C4A10E562;
	Tue, 24 Feb 2026 10:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q4D3LJBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8410810E55C;
 Tue, 24 Feb 2026 10:59:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DBBFC61335;
 Tue, 24 Feb 2026 10:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06592C19422;
 Tue, 24 Feb 2026 10:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771930771;
 bh=la4FpxSv0KFWeFdgmjOWIalqSK0c99WldBgX55snvvc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Q4D3LJBAvHafk96/PNZtz/MiwnaNUjfo6qw8UoBnu/IK7+gXC/m3JZ/bZaKHgb3kq
 VN0c03OzB+nrVEfKWxhsEnrX8Q+Uq8/8TGLvCoa3EMNVhFVROhAx5gNnIxaEAo5y01
 1i77TF36vM4ibvc8RZ26403EZcwOSl20avxvS97h8RHoair2I42oJfzU7AJtOuARtJ
 qEOEilJfKxLtgGu54sTvEPN+XtoC4nSppia+/IXF5dh97OqqjpP+RTKs9O73HKuGIV
 FY2ZSFhITGm3j4k3Lcwm9C3QvihOt191GMfPV+IxXRrVPchqzelF8izMQZ/vP8F/17
 DQKtdFfU/8tUA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 24 Feb 2026 11:58:52 +0100
Subject: [PATCH 13/14] drm/connector: Remove DRM_COLOR_FORMAT defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-drm-rework-color-formats-v1-13-bebc76604ada@kernel.org>
References: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
In-Reply-To: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273; i=mripard@kernel.org;
 h=from:subject:message-id; bh=la4FpxSv0KFWeFdgmjOWIalqSK0c99WldBgX55snvvc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlzWzJuzo9bf+1HZ8Pbd877rk7eNvv1w5yJ148Z8M+9a
 PNk2QwZo46pLAzCnAyyYoosT2TCTi9vX1zlYL/yB8wcViaQIQxcnAIwkUtnGRvO39nIELNy/cLI
 564MEgwpz+Kdj6Slsb1N3mlepyFVP32PR+nh7YfvaNl1xlz0W/bn6TLGek/vpTa/PomINfamvOT
 ulmq8Y3CAd6ZUVc3teUtcmcXvBP/aGf/p97+asPMC2q7azsx+AA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,arm.com,pengutronix.de,sntech.de,nxp.com,sholland.org,raspberrypi.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BC19B185CC2
X-Rspamd-Action: no action

Now that all users of DRM_COLOR_FORMAT_* defines have been converted to
the new enum, we can get rid of those defines.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_connector.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index c67539708f636ae3905bb8424c63799bd1811f28..e97c8a209ef5c96ecf4bcb5f0b1b5f1bc0f35b3c 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -722,15 +722,10 @@ struct drm_display_info {
 	/**
 	 * @subpixel_order: Subpixel order of LCD panels.
 	 */
 	enum subpixel_order subpixel_order;
 
-#define DRM_COLOR_FORMAT_RGB444		(1 << DRM_OUTPUT_COLOR_FORMAT_RGB444)
-#define DRM_COLOR_FORMAT_YCBCR444	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR444)
-#define DRM_COLOR_FORMAT_YCBCR422	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR422)
-#define DRM_COLOR_FORMAT_YCBCR420	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR420)
-
 	/**
 	 * @panel_orientation: Read only connector property for built-in panels,
 	 * indicating the orientation of the panel vs the device's casing.
 	 * drm_connector_init() sets this to DRM_MODE_PANEL_ORIENTATION_UNKNOWN.
 	 * When not UNKNOWN this gets used by the drm_fb_helpers to rotate the

-- 
2.52.0


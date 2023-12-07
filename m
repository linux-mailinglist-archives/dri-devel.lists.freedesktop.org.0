Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A2E808C89
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5B910E905;
	Thu,  7 Dec 2023 15:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DF910E8F5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 15:51:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id F3808B82434;
 Thu,  7 Dec 2023 15:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C4DC433C9;
 Thu,  7 Dec 2023 15:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701964268;
 bh=lBOOj7rqrx2w/8tcNodZrBPU2IsB4Kwf5qyl3esIKfc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pMULg9EezM19uQemjGykB2QqjkS1ctKoiNhGGR2cbfcOWBWWIZedbINDk2Tki2i9x
 +d76AJZEfUCl2pxiicCExtm4UYYKzCUEPCmSse9xKlqBDtQKHZzKlglQSi31bwmYLv
 EggkQm8IbSrhT0HrwVH22c0f0spQJ6ddMQtNrX/HZfImYVqU1w5ylvh+iBZaSPHVbp
 gTimLWCT6ac51cWfNhh9QUt+rmHWbRlkEiEHQw7tvu9mFRFUp6MENxhHhccrTHQT4R
 tivxfbHpLi6t0MuUNXVG/SXDbjriDM/E+0abs25gAJ9idiGhZP3h2iQNX6zYhXIcLk
 l6mHGu4PniHug==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:49:57 +0100
Subject: [PATCH v5 34/44] drm/rockchip: inno_hdmi: Remove useless
 mode_valid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-34-6538e19d634d@kernel.org>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311; i=mripard@kernel.org;
 h=from:subject:message-id; bh=lBOOj7rqrx2w/8tcNodZrBPU2IsB4Kwf5qyl3esIKfc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL9s2S18I/2MTyeLsc+SlxqzTj7lKNQ6ku3ly+Xdwl
 T92fzy1o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABMRzmNk2Ct6xbp/kWrNtRkx
 TIoFVZPudly89GKX9v6ynGMl1pk6jAx/pZU5D960cmp5e2Xj8+PXhNN335+UqrRf7t+2SU1T/z1
 5zw0A
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The inno_hdmi mode_valid implementation always return MODE_OK which is
what the core assumes when we don't have an implementation.

Let's get rid of it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index e4fe02b79a98..59b2b676b7b8 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -400,13 +400,6 @@ static int inno_hdmi_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static enum drm_mode_status
-inno_hdmi_connector_mode_valid(struct drm_connector *connector,
-			       struct drm_display_mode *mode)
-{
-	return MODE_OK;
-}
-
 static int
 inno_hdmi_probe_single_connector_modes(struct drm_connector *connector,
 				       uint32_t maxX, uint32_t maxY)
@@ -431,7 +424,6 @@ static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
 
 static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
 	.get_modes = inno_hdmi_connector_get_modes,
-	.mode_valid = inno_hdmi_connector_mode_valid,
 };
 
 static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)

-- 
2.43.0


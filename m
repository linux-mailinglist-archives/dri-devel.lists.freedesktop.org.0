Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4DBB3F883
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00AB510E5E8;
	Tue,  2 Sep 2025 08:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nO1RXdRh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB6E899B3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:33:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 679A641780;
 Tue,  2 Sep 2025 08:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5F6C4CEF7;
 Tue,  2 Sep 2025 08:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756802019;
 bh=z+A1qZGL7VMjPd92l+hRCbPOUgjuh0UPwrQCvSvdcls=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=nO1RXdRhou3rnO387KEmD3xYdnkOSUI1KxHjtDMQZkmuaAydK7rjJtCxMp9k6cssv
 wSIluBfdrN0EVuGd/9huGJgKEe06fqefwjjknEX33ONongTLFs+9Z9vNIqWfLDizO6
 8sCSZpm5BT9rTxD+7aBJ+fuihXCnxExbwi/46KCnsIAWxMwT38zuaKqgXeNNhFY9AC
 tiuxNzw+pW+gwU6yvYgYOmaZc8bfCwPbnxUWD6YjyKbz+m/ttX1BU4UBgsDGciLiGQ
 6VrHR2YnvAhd3QfoWRHvto9OwpgD7SAclsbaxmHWzB+BEwcDhZlPELIZZqZcumEleT
 56hvMWnPaRY7Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:39 +0200
Subject: [PATCH 11/29] drm/crtc: Drop no_vblank bit field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-11-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
In-Reply-To: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105; i=mripard@kernel.org;
 h=from:subject:message-id; bh=z+A1qZGL7VMjPd92l+hRCbPOUgjuh0UPwrQCvSvdcls=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVu+svxTk6SFz0nA+r7BBWlfdUbXy0B1NfVqcUa3/Z
 NYl92/omMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABNZqs9YZ68mH/30i+Wl62cu
 eTz+fO1yEM8E62nTbBMMd8xr91rlraszN/vfhWTn2RJKgukC1XcvMtbX+f/L3P3a7n5N+I5N7DL
 LruV4Xv2w/5+Xy2kjtr1ufX81LtvMXH3yX+tt0498TBmcmowA
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

The no_vblank field in drm_crtc_state is defined as a bit-field with a
single bit.

This will create a syntax issue with the macros we'll introduce next,
and most other booleans but the *_changed ones in drm_crtc_state do not
use a bit field anyway.

Let's drop it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_crtc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index c462bd9b2f7d3ae08e669463717002e5f78122fe..11e3299cfad1572c6e507918c7cceae7a28ba4cf 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -184,11 +184,11 @@ struct drm_crtc_state {
 	 * &drm_crtc_state.no_blank == true is valid and usually used when the
 	 * writeback connector attached to the CRTC has a new job queued. In
 	 * this case the driver will send the VBLANK event on its own when the
 	 * writeback job is complete.
 	 */
-	bool no_vblank : 1;
+	bool no_vblank;
 
 	/**
 	 * @plane_mask: Bitmask of drm_plane_mask(plane) of planes attached to
 	 * this CRTC.
 	 */

-- 
2.50.1


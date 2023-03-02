Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908AD6A7C05
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 08:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE4110E385;
	Thu,  2 Mar 2023 07:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A6710E385
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 07:49:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B525CB80F88;
 Thu,  2 Mar 2023 07:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE5FC433D2;
 Thu,  2 Mar 2023 07:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677743337;
 bh=FQxdqTVGL5Tmo2kQBo5EKP1J2REHE/x51/IRsTKSVWs=;
 h=From:To:Cc:Subject:Date:From;
 b=XspEgExULtgYyT2/JSwBsz6FMWvp73M05fblk0rUDtaIkFTNpa3sdJCl6KS+PB82O
 0LdrLpkJ3AJUGRWSrxuDxTRFwww4PHuL8dwQU+E3j9ZvDAicnUkuLaraD9IcFZxu8l
 RjPkuwP7WBg+veLyRJJhKrXA00wQHuwtfLADH41PV4xo293Pe9wtVthupiOvAckp6a
 H3GgcdBwxKozZR+64id5HFNFjaFmaJoWMa3xVoHHgslcFcby4bM8TWbnU+N4yx/4IZ
 b2Ltl7/MMiFVggQcODjkdw2E6CpHAXmjw3abDL0ZKFi8jEE8PGJRw6K/t/m4eZDZO8
 0PKvdSU99bu4w==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1pXdgq-0002yX-KC; Thu, 02 Mar 2023 08:49:25 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/edid: fix info leak when failing to get panel id
Date: Thu,  2 Mar 2023 08:47:04 +0100
Message-Id: <20230302074704.11371-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure to clear the transfer buffer before fetching the EDID to
avoid leaking slab data to the logs on errors that leave the buffer
unchanged.

Fixes: 69c7717c20cc ("drm/edid: Dump the EDID when drm_edid_get_panel_id() has an error")
Cc: stable@vger.kernel.org	# 6.2
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/drm_edid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 3841aba17abd..8707fe72a028 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2797,7 +2797,7 @@ u32 drm_edid_get_panel_id(struct i2c_adapter *adapter)
 	 * the EDID then we'll just return 0.
 	 */
 
-	base_block = kmalloc(EDID_LENGTH, GFP_KERNEL);
+	base_block = kzalloc(EDID_LENGTH, GFP_KERNEL);
 	if (!base_block)
 		return 0;
 
-- 
2.39.2


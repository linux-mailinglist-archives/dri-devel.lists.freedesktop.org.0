Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DD36242E9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 14:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CD510E79B;
	Thu, 10 Nov 2022 13:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68D010E799;
 Thu, 10 Nov 2022 13:09:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 751EA1F8F4;
 Thu, 10 Nov 2022 13:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668085772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hLX1Kf1YwFIN5rhfEBJFleCYcI9ShWd8l3DAEB7UhgM=;
 b=BSyUDVgZSRZDIRTLntV01gt7BRNsEDF1S1rVWBu934pcVKgai0d+h9xcz8/z+UUk2c9XBB
 6b5teQV4sLhE69UZYpUvMP2SURMGI8yFhzsr1GOLflTaXxoAICD2jZjEmB3M8OOuZfYPSX
 NdqEkedtPAQvqd6KGM0vSRDwO7quJa4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668085772;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hLX1Kf1YwFIN5rhfEBJFleCYcI9ShWd8l3DAEB7UhgM=;
 b=k9DZQTcYod/BQInLVlKPWzfMkW9nn5RpVcIbGDFUYwhrqGMVS3P5Yn1ZBD85JjrAuCkHTM
 aNi2Lmtnfz7TR9AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5805913B58;
 Thu, 10 Nov 2022 13:09:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id W8ANFQz4bGMcbwAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 10 Nov 2022 13:09:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm: radeon: Fix audio get_eld callback
Date: Thu, 10 Nov 2022 14:09:25 +0100
Message-Id: <20221110130925.26928-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check the availability of the audio capability and mode config before
going to the loop for avoiding the access to an unusable state.  Also,
change the loop iterations over encoder instead of connector in order
to align with radeon_audio_enable().

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2236
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

Note: this is the additional fix on top of the previously submitted
audio component support for radeon.

 drivers/gpu/drm/radeon/radeon_audio.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index 71b67d4efe08..d6ccaf24ee0c 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -747,6 +747,7 @@ static int radeon_audio_component_get_eld(struct device *kdev, int port,
 					  unsigned char *buf, int max_bytes)
 {
 	struct drm_device *dev = dev_get_drvdata(kdev);
+	struct radeon_device *rdev = dev->dev_private;
 	struct drm_encoder *encoder;
 	struct radeon_encoder *radeon_encoder;
 	struct radeon_encoder_atom_dig *dig;
@@ -754,19 +755,19 @@ static int radeon_audio_component_get_eld(struct device *kdev, int port,
 	int ret = 0;
 
 	*enabled = false;
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
-		const struct drm_connector_helper_funcs *connector_funcs =
-			connector->helper_private;
-		encoder = connector_funcs->best_encoder(connector);
+	if (!rdev->audio.enabled || !rdev->mode_info.mode_config_initialized)
+		return 0;
 
-		if (!encoder)
-			continue;
+	list_for_each_entry(encoder, &rdev->ddev->mode_config.encoder_list, head) {
 		if (!radeon_encoder_is_digital(encoder))
 			continue;
 		radeon_encoder = to_radeon_encoder(encoder);
 		dig = radeon_encoder->enc_priv;
 		if (!dig->pin || dig->pin->id != port)
 			continue;
+		connector = radeon_get_connector_for_encoder(encoder);
+		if (!connector)
+			continue;
 		*enabled = true;
 		ret = drm_eld_size(connector->eld);
 		memcpy(buf, connector->eld, min(max_bytes, ret));
-- 
2.35.3


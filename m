Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 091734CC770
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 21:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B08C10E8A1;
	Thu,  3 Mar 2022 20:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CD910E72D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 20:58:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AA9A9218BB;
 Thu,  3 Mar 2022 20:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646341121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YKy18Jmuwa8ZvhW6hqDriQe/CWvhmG9VTTVexi6InC8=;
 b=RbMnhIx4xdbKEjMJ0RJBreTcz15soxeIqwSj4khO+pyKscAdUp2fz9ZfZIwnR/5zPpO+P6
 9dZQsP10My6TRD7GYoX6T0G/H6mbMyH0DDvL6OiqLnpW0SGPMVrDj361pIGhXYZsewqAlG
 KI6hycOj1m3DjBt6fybgTIc3FTvUPaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646341121;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YKy18Jmuwa8ZvhW6hqDriQe/CWvhmG9VTTVexi6InC8=;
 b=wXsuaROdXnVH1Jaw02NFbN3ceeebgacfaVo99+APG6zHbSQpd1nch4cuZyaAnkbzkEcjSw
 FAJM/FNBqiyANACg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 782A113AEE;
 Thu,  3 Mar 2022 20:58:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EN9dHAEsIWJoHAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Mar 2022 20:58:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, deller@gmx.de, javierm@redhat.com
Subject: [PATCH 1/9] drm/simpledrm: Use fbdev defaults for shadow buffering
Date: Thu,  3 Mar 2022 21:58:31 +0100
Message-Id: <20220303205839.28484-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303205839.28484-1-tzimmermann@suse.de>
References: <20220303205839.28484-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't select shadow buffering for the fbdev console explicitly. The
fbdev emulation's heuristic will enable it for any framebuffer with
.dirty callback.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/simpledrm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index f5b8e864a5cd..768242a78e2b 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -801,7 +801,6 @@ static int simpledrm_device_init_modeset(struct simpledrm_device *sdev)
 	dev->mode_config.max_width = max_width;
 	dev->mode_config.min_height = mode->vdisplay;
 	dev->mode_config.max_height = max_height;
-	dev->mode_config.prefer_shadow_fbdev = true;
 	dev->mode_config.preferred_depth = sdev->format->cpp[0] * 8;
 	dev->mode_config.funcs = &simpledrm_mode_config_funcs;
 
-- 
2.35.1


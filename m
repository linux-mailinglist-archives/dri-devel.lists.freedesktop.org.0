Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 613425BCC7B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 15:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F3C10E3AC;
	Mon, 19 Sep 2022 13:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4C410E2A2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 13:04:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F298F2233E;
 Mon, 19 Sep 2022 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663592652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ne4issFT8VYm/4OcS8saCdMfKjQMK0FF49HvEddOYZI=;
 b=cFUhYqw2ujkdQD49cqq23nsv73crqyBvwHQqwufmuEMEnalyo0iMfubwbbu+sL/i3P67HE
 aKsRW+aLsmt08u/dge9n0zGbAowpE3g9yGgi77y/IWjgZW2EDI07j50gsxH43NvJTNYwqh
 bIPrqywXaMwyAY7SpSS5DEOzsfu/X/0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663592652;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ne4issFT8VYm/4OcS8saCdMfKjQMK0FF49HvEddOYZI=;
 b=rlGuHMcQuu2Ms0E46kHynKsnZIgBDwETZl4Xdzl9/SznT5s8b/BBRo6erFMITOkO1YqJ7Q
 ybJax5oDJC1qLCCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFED113ACE;
 Mon, 19 Sep 2022 13:04:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cBbjMcxoKGMzOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Sep 2022 13:04:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	daniel@ffwll.ch
Subject: [PATCH 06/16] drm/udl: Remove udl_simple_display_pipe_mode_valid()
Date: Mon, 19 Sep 2022 15:03:58 +0200
Message-Id: <20220919130408.21486-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919130408.21486-1-tzimmermann@suse.de>
References: <20220919130408.21486-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the empty function udl_simple_display_pipe_mode_valid() and
let simple-KMS helpers accept the modes. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_modeset.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 93e7554e83fa..7f8bde89396d 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -310,13 +310,6 @@ static const uint32_t udl_simple_display_pipe_formats[] = {
 	DRM_FORMAT_XRGB8888,
 };
 
-static enum drm_mode_status
-udl_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
-				   const struct drm_display_mode *mode)
-{
-	return MODE_OK;
-}
-
 static void
 udl_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 			       struct drm_crtc_state *crtc_state,
@@ -398,7 +391,6 @@ udl_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 }
 
 static const struct drm_simple_display_pipe_funcs udl_simple_display_pipe_funcs = {
-	.mode_valid = udl_simple_display_pipe_mode_valid,
 	.enable = udl_simple_display_pipe_enable,
 	.disable = udl_simple_display_pipe_disable,
 	.update = udl_simple_display_pipe_update,
-- 
2.37.3


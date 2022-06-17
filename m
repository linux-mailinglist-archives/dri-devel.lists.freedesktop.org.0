Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3EA54F55F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 12:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF4611A7AB;
	Fri, 17 Jun 2022 10:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6250811A77E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 10:32:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 09C0721E57;
 Fri, 17 Jun 2022 10:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655461951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UX4mLF8s5smAHm3bmVyxVDUQFkvtEle1ahjzzd2/L/k=;
 b=t/gsU42gqEKzpPEz9Z3h+FKB6iHVsJ5n6BnepSWbvi5fgsZok7L0hjkAm5hzQ3C4h5U5hH
 N0R4NTrhNlSjytG0JRc2rovTE9d1up1tk0iXaGRgGO0/KP/Gtd3RxtDq2vX3thkYcoHl8Q
 hZU8pTV07yCpclaXzbS0x3eylEpk7MU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655461951;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UX4mLF8s5smAHm3bmVyxVDUQFkvtEle1ahjzzd2/L/k=;
 b=dVilIimSa0FdA0jKV77zCX9hy6D/u2SxiUrA7JQi9heT0kdhvoh7QZQgefN2436efw7tvd
 oC3fS5l686oqlJDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CBED91348E;
 Fri, 17 Jun 2022 10:32:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ALyLMD5YrGKeSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Jun 2022 10:32:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, javierm@redhat.com,
 noralf@tronnes.org, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Subject: [PATCH 3/3] drm/ast: Enable primary plane with CRTC
Date: Fri, 17 Jun 2022 12:32:26 +0200
Message-Id: <20220617103226.25617-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220617103226.25617-1-tzimmermann@suse.de>
References: <20220617103226.25617-1-tzimmermann@suse.de>
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

As the CRTC requires a primary plane for display, ensure that the
primary plane is enabled with the CRTC.

Use drm_atomic_helper_check_crtc_state(). Add all affected planes
to the atomic state so that their state will be checked as well.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index db2010a55674..e992e07a26f9 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1094,15 +1094,19 @@ ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode
 static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 					struct drm_atomic_state *state)
 {
-	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
-									  crtc);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct drm_device *dev = crtc->dev;
 	struct ast_crtc_state *ast_state;
 	const struct drm_format_info *format;
 	bool succ;
+	int ret;
+
+	ret = drm_atomic_helper_check_crtc_state(crtc_state, false);
+	if (ret)
+		return ret;
 
 	if (!crtc_state->enable)
-		return 0; /* no mode checks if CRTC is being disabled */
+		goto out;
 
 	ast_state = to_ast_crtc_state(crtc_state);
 
@@ -1116,7 +1120,8 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	if (!succ)
 		return -EINVAL;
 
-	return 0;
+out:
+	return drm_atomic_add_affected_planes(state, crtc);
 }
 
 static void ast_crtc_helper_atomic_begin(struct drm_crtc *crtc, struct drm_atomic_state *state)
-- 
2.36.1


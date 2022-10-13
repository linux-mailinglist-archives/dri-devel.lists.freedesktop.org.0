Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6805E5FD869
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 13:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF2F10E886;
	Thu, 13 Oct 2022 11:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E2810E87F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 11:29:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B535421CBA;
 Thu, 13 Oct 2022 11:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665660568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6UvEZVW6Wf2FWDq+YfPP5Mt3tNndXXCBTLTzB1gSywk=;
 b=A/ms8A6RzFwG4dfVvqqqpSFPF554kedMrnU7Vlg5ECj+ckFjXivlg07BAo3KmDk32RzVRr
 G6wzaSYH9PwFewfwJut0So/qQfmnsy52ByvNNExq7B/KxKdfYUZSPgnvVJZZ6Hdhn+3RxG
 s9/+kXZpBK7vK9U5aN6bgdQXjuyArWg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665660568;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6UvEZVW6Wf2FWDq+YfPP5Mt3tNndXXCBTLTzB1gSywk=;
 b=GoZcu9AF5T23RH3HFnI1qWnF+/gqOIQUncC5WfBLZmiePljiw49JbF7/e3D/QtAjmjiw9w
 0O6LsrPQ/PL+HHDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6948A13AAA;
 Thu, 13 Oct 2022 11:29:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id COSlGJj2R2NwYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Oct 2022 11:29:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 javierm@redhat.com, ilpo.jarvinen@cs.helsinki.fi
Subject: [PATCH v2 8/8] drm/ast: Avoid reprogramming primary-plane scanout
 address
Date: Thu, 13 Oct 2022 13:29:23 +0200
Message-Id: <20221013112923.769-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013112923.769-1-tzimmermann@suse.de>
References: <20221013112923.769-1-tzimmermann@suse.de>
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

Some AST-based BMCs stop display output for up to 5 seconds after
reprogramming the scanout address. As the address is fixed, avoid
re-setting the address' value.

v2:
	* only update offset if it changed (Jocelyn)

Reported-by: Jocelyn Falempe <jfalempe@redhat.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 1b991658290b..4355754d69b5 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -671,10 +671,19 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 		ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage);
 	}
 
-	ast_set_offset_reg(ast, fb);
-	ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
-
-	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
+	/*
+	 * Some BMCs stop scanning out the video signal after the driver
+	 * reprogrammed the offset or scanout address. This stalls display
+	 * output for several seconds and makes the display unusable.
+	 * Therefore only update the offset if it changes and reprogram the
+	 * address after enabling the plane.
+	 */
+	if (!old_fb || old_fb->pitches[0] != fb->pitches[0])
+		ast_set_offset_reg(ast, fb);
+	if (!old_fb) {
+		ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
+		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
+	}
 }
 
 static void ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,
-- 
2.37.3


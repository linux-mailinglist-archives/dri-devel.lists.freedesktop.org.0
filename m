Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C74A65F9CE0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 12:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB36710E445;
	Mon, 10 Oct 2022 10:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EF710E1C7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 10:36:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1D22621963;
 Mon, 10 Oct 2022 10:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665398189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wEzfa4S9kemnXuoai/YspeTr33knRnp/vKhsvfajoLE=;
 b=ex5Ef8AW3ir+OVRDuCtjMmqTfPEkQbOeurJOG6zYu8B0dib3w5mWudEzgijm23h4EQcF0t
 UZNOCOOpFEnhlVN242mIUL6sIQ2+WYx5ij3BumYjfNAJWnKQEFTPcBLiQtejEVGjf6Sr02
 U2N85u2FNxdwjXZmkILlBfDRxqSu0Vo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665398189;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wEzfa4S9kemnXuoai/YspeTr33knRnp/vKhsvfajoLE=;
 b=/jlVadi7h9SYriAee7Ip/nokJwhvwoqmvocGV5t/1dqNzeilapNjR7ppZ7VWaLNQtD4D8q
 z4ysMaO7wd8ZB3CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DFD5313AF9;
 Mon, 10 Oct 2022 10:36:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KHw/Naz1Q2M4LgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Oct 2022 10:36:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 ilpo.jarvinen@cs.helsinki.fi
Subject: [PATCH 8/8] drm/ast: Avoid reprogramming primary-plane scanout address
Date: Mon, 10 Oct 2022 12:36:25 +0200
Message-Id: <20221010103625.19958-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010103625.19958-1-tzimmermann@suse.de>
References: <20221010103625.19958-1-tzimmermann@suse.de>
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

Reported-by: Jocelyn Falempe <jfalempe@redhat.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 1b991658290b..54a9643d86ce 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -672,9 +672,17 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	}
 
 	ast_set_offset_reg(ast, fb);
-	ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
 
-	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
+	/*
+	 * Some BMCs stop scanning out the video signal after the driver
+	 * reprogrammed the scanout address. This stalls display output
+	 * for several seconds and makes the display unusable. Therefore
+	 * only reprogram the address after enabling the plane.
+	 */
+	if (!old_fb && fb) {
+		ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
+		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
+	}
 }
 
 static void ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,
-- 
2.37.3


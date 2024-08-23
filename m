Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6C695CCA7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 14:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E938010E5AB;
	Fri, 23 Aug 2024 12:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zUv1+YBO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iWMWHsqt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zUv1+YBO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iWMWHsqt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA09010E57A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 12:44:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 69D7022651;
 Fri, 23 Aug 2024 12:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724417065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SrNPxiRxwEy/SjB1ARH7RIYERIn6ib8/ZFvWYtDCvyI=;
 b=zUv1+YBO5L+moWBvFV/OPFVwB4NM9cQeAcgxYZPn3jpdUCeeEUl8xS7NXVCBqzdcrZbPnn
 6F+HjU8a7DWBPIR7YPp5yeYr4KQtNCuFGYPI81KJuwYKXBli9Gz0TBt83Yk6gEX45abd10
 wJeT+E4HHgHCi7dg0I3j0/JUFgEYDjY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724417065;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SrNPxiRxwEy/SjB1ARH7RIYERIn6ib8/ZFvWYtDCvyI=;
 b=iWMWHsqtR242IwLJD+oTndoru7Ogm7dcUpxwtQJ2x0CEsefZ4N17OecJOsh/tsXsNDAAAT
 sLQP0i9fK1v0fCCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724417065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SrNPxiRxwEy/SjB1ARH7RIYERIn6ib8/ZFvWYtDCvyI=;
 b=zUv1+YBO5L+moWBvFV/OPFVwB4NM9cQeAcgxYZPn3jpdUCeeEUl8xS7NXVCBqzdcrZbPnn
 6F+HjU8a7DWBPIR7YPp5yeYr4KQtNCuFGYPI81KJuwYKXBli9Gz0TBt83Yk6gEX45abd10
 wJeT+E4HHgHCi7dg0I3j0/JUFgEYDjY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724417065;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SrNPxiRxwEy/SjB1ARH7RIYERIn6ib8/ZFvWYtDCvyI=;
 b=iWMWHsqtR242IwLJD+oTndoru7Ogm7dcUpxwtQJ2x0CEsefZ4N17OecJOsh/tsXsNDAAAT
 sLQP0i9fK1v0fCCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 31B681333E;
 Fri, 23 Aug 2024 12:44:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mH/xCimEyGbKVwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Aug 2024 12:44:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/10] drm/bochs: Pass bochs device to various functions
Date: Fri, 23 Aug 2024 14:28:47 +0200
Message-ID: <20240823124422.286989-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240823124422.286989-1-tzimmermann@suse.de>
References: <20240823124422.286989-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.996]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -6.80
X-Spam-Flag: NO
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

Avoid upcasting from struct drm_device by passing the bochs device
directly to functions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/bochs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 5d09b4cb28ed..acb2652577d4 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -204,9 +204,9 @@ static const struct drm_edid *bochs_hw_read_edid(struct drm_connector *connector
 	return drm_edid_read_custom(connector, bochs_get_edid_block, bochs);
 }
 
-static int bochs_hw_init(struct drm_device *dev)
+static int bochs_hw_init(struct bochs_device *bochs)
 {
-	struct bochs_device *bochs = dev->dev_private;
+	struct drm_device *dev = bochs->dev;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	unsigned long addr, size, mem, ioaddr, iosize;
 	u16 id;
@@ -481,9 +481,9 @@ static const struct drm_connector_funcs bochs_connector_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static void bochs_connector_init(struct drm_device *dev)
+static void bochs_connector_init(struct bochs_device *bochs)
 {
-	struct bochs_device *bochs = dev->dev_private;
+	struct drm_device *dev = bochs->dev;
 	struct drm_connector *connector = &bochs->connector;
 
 	drm_connector_init(dev, connector, &bochs_connector_connector_funcs,
@@ -516,7 +516,7 @@ static int bochs_kms_init(struct bochs_device *bochs)
 
 	bochs->dev->mode_config.funcs = &bochs_mode_funcs;
 
-	bochs_connector_init(bochs->dev);
+	bochs_connector_init(bochs);
 	drm_simple_display_pipe_init(bochs->dev,
 				     &bochs->pipe,
 				     &bochs_pipe_funcs,
@@ -544,7 +544,7 @@ static int bochs_load(struct drm_device *dev)
 	dev->dev_private = bochs;
 	bochs->dev = dev;
 
-	ret = bochs_hw_init(dev);
+	ret = bochs_hw_init(bochs);
 	if (ret)
 		return ret;
 
-- 
2.46.0


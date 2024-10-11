Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E8D999D4C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 08:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4EC10EA55;
	Fri, 11 Oct 2024 06:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LdYrJmRY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZbV+lnr1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LdYrJmRY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZbV+lnr1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F0B10EA51
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 06:57:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7405F1F83B;
 Fri, 11 Oct 2024 06:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728629830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=240OxqMZ+evPhMs7RXqmZjEKRD5jfaQCPSFXvnuxXvU=;
 b=LdYrJmRYkCxJF3slT/yHNk+/L95Yi8ARolJ6PAF2OS4rzR9Zt0i2JzP3p9cKTKLnJWNlDp
 taqSdQrIx1NlpOn5HzptODcI43kVZFYNDyN/b678dENV7RJVlUjx9v/rkhDnfrexblriRu
 Ri6u6HGT8u0TpkOhzxWI7DCZXGEK9SU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728629830;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=240OxqMZ+evPhMs7RXqmZjEKRD5jfaQCPSFXvnuxXvU=;
 b=ZbV+lnr1kJGRQ+p1OA9Zh0/4I6VSdE8M4ddaCXyzmanWz8lDhquVc4KhyLhTnhN/GIN8uG
 +bmsvyFa4MdHueCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728629830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=240OxqMZ+evPhMs7RXqmZjEKRD5jfaQCPSFXvnuxXvU=;
 b=LdYrJmRYkCxJF3slT/yHNk+/L95Yi8ARolJ6PAF2OS4rzR9Zt0i2JzP3p9cKTKLnJWNlDp
 taqSdQrIx1NlpOn5HzptODcI43kVZFYNDyN/b678dENV7RJVlUjx9v/rkhDnfrexblriRu
 Ri6u6HGT8u0TpkOhzxWI7DCZXGEK9SU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728629830;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=240OxqMZ+evPhMs7RXqmZjEKRD5jfaQCPSFXvnuxXvU=;
 b=ZbV+lnr1kJGRQ+p1OA9Zh0/4I6VSdE8M4ddaCXyzmanWz8lDhquVc4KhyLhTnhN/GIN8uG
 +bmsvyFa4MdHueCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 382AB13AAF;
 Fri, 11 Oct 2024 06:57:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8LaNDEbMCGcRfAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Oct 2024 06:57:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@linux.intel.com, airlied@redhat.com,
 jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/7] drm/ast: vga: Clear EDID if no display is connected
Date: Fri, 11 Oct 2024 08:43:10 +0200
Message-ID: <20241011065705.6728-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241011065705.6728-1-tzimmermann@suse.de>
References: <20241011065705.6728-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com];
 RCPT_COUNT_SEVEN(0.00)[9]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
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

Do not keep the obsolete EDID around after unplugging the display
form the connector.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 2a2391f857cd ("drm/ast: vga: Transparently handle BMC support")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/ast/ast_vga.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_vga.c b/drivers/gpu/drm/ast/ast_vga.c
index 5c79b773af57..abe0fff8485c 100644
--- a/drivers/gpu/drm/ast/ast_vga.c
+++ b/drivers/gpu/drm/ast/ast_vga.c
@@ -29,6 +29,8 @@ static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
 	if (ast_connector->physical_status == connector_status_connected) {
 		count = drm_connector_helper_get_modes(connector);
 	} else {
+		drm_edid_connector_update(connector, NULL);
+
 		/*
 		 * There's no EDID data without a connected monitor. Set BMC-
 		 * compatible modes in this case. The XGA default resolution
-- 
2.46.0


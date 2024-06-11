Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6296903C74
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 14:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD1210E632;
	Tue, 11 Jun 2024 12:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ce+JtL15";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1BArwPwp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ce+JtL15";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1BArwPwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C9010E52A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 12:53:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AB86A219AB;
 Tue, 11 Jun 2024 12:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718110408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HM8L2if4MTBGwGCVJnOE6t8p537Zs6Zd3ep977Q7VSM=;
 b=ce+JtL15PBnpeotl/c0F+lyleAVznpIamAfoqUH9FsRLsM/pG6yy/oJUzpZkew/YvExay2
 tm+d0N9+2rbonae0vqVIsA+QZflO9kTEDhXN9UiZqiS84Xka6dOAI367C2Ug7LACu4iSiY
 is5dg+whOSNR6lHiTfghpLlH4N+y/Ek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718110408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HM8L2if4MTBGwGCVJnOE6t8p537Zs6Zd3ep977Q7VSM=;
 b=1BArwPwpHjEW+1saBckh1hezUsMdlix2tATIeYzLNeMYIfmiVmKjoVLxDhE8Z/ayjwJVqe
 4fJkwM/O2+nDkoAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718110408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HM8L2if4MTBGwGCVJnOE6t8p537Zs6Zd3ep977Q7VSM=;
 b=ce+JtL15PBnpeotl/c0F+lyleAVznpIamAfoqUH9FsRLsM/pG6yy/oJUzpZkew/YvExay2
 tm+d0N9+2rbonae0vqVIsA+QZflO9kTEDhXN9UiZqiS84Xka6dOAI367C2Ug7LACu4iSiY
 is5dg+whOSNR6lHiTfghpLlH4N+y/Ek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718110408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HM8L2if4MTBGwGCVJnOE6t8p537Zs6Zd3ep977Q7VSM=;
 b=1BArwPwpHjEW+1saBckh1hezUsMdlix2tATIeYzLNeMYIfmiVmKjoVLxDhE8Z/ayjwJVqe
 4fJkwM/O2+nDkoAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 65C9A13AAB;
 Tue, 11 Jun 2024 12:53:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MO+vF8hIaGbxMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jun 2024 12:53:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, linus.walleij@linaro.org, f.suligoi@asem.it,
 ukleinek@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 15/17] backlight: pwm-backlight: Use backlight power constants
Date: Tue, 11 Jun 2024 14:42:10 +0200
Message-ID: <20240611125321.6927-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240611125321.6927-1-tzimmermann@suse.de>
References: <20240611125321.6927-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,asem.it];
 RCPT_COUNT_SEVEN(0.00)[11]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLbaz54pzrc9psah3tsaj8ddaq)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Flag: NO
X-Spam-Score: -6.80
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

Replace FB_BLANK_ constants with their counterparts from the
backlight subsystem. The values are identical, so there's no
change in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/pwm_bl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 61d30bc98eea5..c9b5224464311 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -426,7 +426,7 @@ static int pwm_backlight_initial_power_state(const struct pwm_bl_data *pb)
 
 	/* Not booted with device tree or no phandle link to the node */
 	if (!node || !node->phandle)
-		return FB_BLANK_UNBLANK;
+		return BL_CORE_UNBLANK;
 
 	/*
 	 * If the driver is probed from the device tree and there is a
@@ -434,7 +434,7 @@ static int pwm_backlight_initial_power_state(const struct pwm_bl_data *pb)
 	 * assume that another driver will enable the backlight at the
 	 * appropriate time. Therefore, if it is disabled, keep it so.
 	 */
-	return active ? FB_BLANK_UNBLANK: FB_BLANK_POWERDOWN;
+	return active ? BL_CORE_UNBLANK : BL_CORE_POWERDOWN;
 }
 
 static int pwm_backlight_probe(struct platform_device *pdev)
-- 
2.45.2


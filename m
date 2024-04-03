Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C0C896A9E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C84B112934;
	Wed,  3 Apr 2024 09:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ciPw+1v7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K1Dmr4l5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3E5112928
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:31:21 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EDFD435193;
 Wed,  3 Apr 2024 09:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712136679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w7RTpOigsekpzNCE6feMKt6ntODpFQ02E1Wa7eaWRgQ=;
 b=ciPw+1v7MXmI9se2y0YTrqwc4inLI0nxyagmsA+wpZ2/SD5dR3bbwGYQnil0EWzT98VATP
 NHenK13XjpElppg911F+gddsN0JWqPeO5u3kJ/+ueJ24ORLHiCW00k7LJMGsRAwshhjds/
 PFqMqksYbmxCQvdmPwSrW4VJTn2cKqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712136679;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w7RTpOigsekpzNCE6feMKt6ntODpFQ02E1Wa7eaWRgQ=;
 b=K1Dmr4l5okoa4CrefJWHm3Dli1K7QQUeDsuQvk9PgttBCgpt0jzfhhGvZYoPVlehJofznd
 EoSYGgo1ATkgorAg==
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id AEF721331E;
 Wed,  3 Apr 2024 09:31:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id ENp4KechDWYteQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Apr 2024 09:31:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 08/11] drm/mgag200: Rename struct i2c_algo_bit_data callbacks
Date: Wed,  3 Apr 2024 11:24:45 +0200
Message-ID: <20240403093114.22163-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403093114.22163-1-tzimmermann@suse.de>
References: <20240403093114.22163-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.20 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; BAYES_HAM(-0.00)[22.73%];
 RCPT_COUNT_SEVEN(0.00)[9]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: 1.20
X-Spam-Level: *
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

Align the names of the algo-bit helpers with mgag200's convention of
using an mgag200 prefix plus the struct's name plus the callback's name
for such function symbols.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_ddc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_ddc.c b/drivers/gpu/drm/mgag200/mgag200_ddc.c
index 73ff94c91ca36..3fa11b190943e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_ddc.c
+++ b/drivers/gpu/drm/mgag200/mgag200_ddc.c
@@ -71,28 +71,28 @@ static inline void mga_i2c_set(struct mga_device *mdev, int mask, int state)
 	mga_i2c_set_gpio(mdev, ~mask, state);
 }
 
-static void mga_gpio_setsda(void *data, int state)
+static void mgag200_ddc_algo_bit_data_setsda(void *data, int state)
 {
 	struct mgag200_ddc *ddc = data;
 
 	mga_i2c_set(ddc->mdev, ddc->data, state);
 }
 
-static void mga_gpio_setscl(void *data, int state)
+static void mgag200_ddc_algo_bit_data_setscl(void *data, int state)
 {
 	struct mgag200_ddc *ddc = data;
 
 	mga_i2c_set(ddc->mdev, ddc->clock, state);
 }
 
-static int mga_gpio_getsda(void *data)
+static int mgag200_ddc_algo_bit_data_getsda(void *data)
 {
 	struct mgag200_ddc *ddc = data;
 
 	return (mga_i2c_read_gpio(ddc->mdev) & ddc->data) ? 1 : 0;
 }
 
-static int mga_gpio_getscl(void *data)
+static int mgag200_ddc_algo_bit_data_getscl(void *data)
 {
 	struct mgag200_ddc *ddc = data;
 
@@ -129,10 +129,10 @@ struct i2c_adapter *mgag200_ddc_create(struct mga_device *mdev)
 
 	bit = &ddc->bit;
 	bit->data = ddc;
-	bit->setsda = mga_gpio_setsda;
-	bit->setscl = mga_gpio_setscl;
-	bit->getsda = mga_gpio_getsda;
-	bit->getscl = mga_gpio_getscl;
+	bit->setsda = mgag200_ddc_algo_bit_data_setsda;
+	bit->setscl = mgag200_ddc_algo_bit_data_setscl;
+	bit->getsda = mgag200_ddc_algo_bit_data_getsda;
+	bit->getscl = mgag200_ddc_algo_bit_data_getscl;
 	bit->udelay = 10;
 	bit->timeout = usecs_to_jiffies(2200);
 
-- 
2.44.0


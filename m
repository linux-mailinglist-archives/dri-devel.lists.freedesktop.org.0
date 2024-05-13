Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C228C4130
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 14:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D95910E76D;
	Mon, 13 May 2024 12:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="BTxzCSny";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8NT1CdZB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BTxzCSny";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8NT1CdZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C49C10E131
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 12:56:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F24E75BECF;
 Mon, 13 May 2024 12:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715604990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7TNQyf7XE6NJ4BIvLzf2M+9ndtO5vATpnbwDhT6pODc=;
 b=BTxzCSnypbrPUKs7LitjO0G9EtQeL2mbD7b4vMHLWWAKkUS1/R1Rnl5bMks7YXcARCDJWI
 IyJBUUHQZfh3VGHwJ1N28YhafLAIfRq10i0y2+Lcu93ZNku8KKyDmO8GItsOIuCVaDe06B
 8VXSQQ0QABXOfDP4RobUQ0cnJ2Y/qvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715604990;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7TNQyf7XE6NJ4BIvLzf2M+9ndtO5vATpnbwDhT6pODc=;
 b=8NT1CdZBFHyqJWdM2BP5jT7kPGSwYLe7XbN4hTDMMG5LCGlN1TTwcMWShhhIRu+IvHLW1f
 lpHVL4vtPZly8RCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715604990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7TNQyf7XE6NJ4BIvLzf2M+9ndtO5vATpnbwDhT6pODc=;
 b=BTxzCSnypbrPUKs7LitjO0G9EtQeL2mbD7b4vMHLWWAKkUS1/R1Rnl5bMks7YXcARCDJWI
 IyJBUUHQZfh3VGHwJ1N28YhafLAIfRq10i0y2+Lcu93ZNku8KKyDmO8GItsOIuCVaDe06B
 8VXSQQ0QABXOfDP4RobUQ0cnJ2Y/qvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715604990;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7TNQyf7XE6NJ4BIvLzf2M+9ndtO5vATpnbwDhT6pODc=;
 b=8NT1CdZBFHyqJWdM2BP5jT7kPGSwYLe7XbN4hTDMMG5LCGlN1TTwcMWShhhIRu+IvHLW1f
 lpHVL4vtPZly8RCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B2D0B13A52;
 Mon, 13 May 2024 12:56:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wJRdKv0NQmZpfwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 13 May 2024 12:56:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 08/10] drm/mgag200: Rename struct i2c_algo_bit_data callbacks
Date: Mon, 13 May 2024 14:51:13 +0200
Message-ID: <20240513125620.6337-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240513125620.6337-1-tzimmermann@suse.de>
References: <20240513125620.6337-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLhthb38qh1ntkuzcrgoc19dwi)];
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
2.45.0


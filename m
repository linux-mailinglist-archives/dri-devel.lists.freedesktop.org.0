Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II2ZBL/FnWnsRwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B518A189210
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA27210E5AE;
	Tue, 24 Feb 2026 15:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZwcEaPX1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iH4YJOkq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZwcEaPX1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iH4YJOkq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A325110E5BA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 15:37:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 001975BCF6;
 Tue, 24 Feb 2026 15:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ina6oz1Pk1YaPYFJWWBiJA6MbklPLdYYKJcM9VS9bjg=;
 b=ZwcEaPX1cYDul/Ai313WTJI7m3sN3EiewDKXFIlvgExMrIWJ6gDh3UCkO/+ahup12EquEG
 BehdJ21UvADcadUX9BI/iV9dQWU8EiCONkTd1EjRhHpvxzCChyGPSy1plc+4ITp83f0wFZ
 0AJwZr1Igso1gnvfHUgSVX0a7eXrWCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947426;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ina6oz1Pk1YaPYFJWWBiJA6MbklPLdYYKJcM9VS9bjg=;
 b=iH4YJOkqKPo92Q3RROpqkzo3EilDIh9HqgeMHyd1pSvxI0x2RTrNbQoUk/U8sD5JeYso4U
 aK6H/jJK6DyASYCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZwcEaPX1;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iH4YJOkq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ina6oz1Pk1YaPYFJWWBiJA6MbklPLdYYKJcM9VS9bjg=;
 b=ZwcEaPX1cYDul/Ai313WTJI7m3sN3EiewDKXFIlvgExMrIWJ6gDh3UCkO/+ahup12EquEG
 BehdJ21UvADcadUX9BI/iV9dQWU8EiCONkTd1EjRhHpvxzCChyGPSy1plc+4ITp83f0wFZ
 0AJwZr1Igso1gnvfHUgSVX0a7eXrWCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947426;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ina6oz1Pk1YaPYFJWWBiJA6MbklPLdYYKJcM9VS9bjg=;
 b=iH4YJOkqKPo92Q3RROpqkzo3EilDIh9HqgeMHyd1pSvxI0x2RTrNbQoUk/U8sD5JeYso4U
 aK6H/jJK6DyASYCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D70E3EA68;
 Tue, 24 Feb 2026 15:37:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kBA/JaHFnWm0FgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Feb 2026 15:37:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, lanzano.alex@gmail.com, kamlesh.gurudasani@gmail.com,
 david@lechnology.com, architanant5@gmail.com, wens@kernel.org,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 12/16] drm/st7735r: Rename struct st7735r_priv to struct
 st7735r_device
Date: Tue, 24 Feb 2026 16:24:49 +0100
Message-ID: <20260224153656.261351-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224153656.261351-1-tzimmermann@suse.de>
References: <20260224153656.261351-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.51
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com,lechnology.com,kernel.org,linux.intel.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:javierm@redhat.com,m:lanzano.alex@gmail.com,m:kamlesh.gurudasani@gmail.com,m:david@lechnology.com,m:architanant5@gmail.com,m:wens@kernel.org,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:airlied@gmail.com,m:tzimmermann@suse.de,m:lanzanoalex@gmail.com,m:kamleshgurudasani@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B518A189210
X-Rspamd-Action: no action

Rename the driver's device struct according to DRM conventions. Also
add a helper to upcast from struct drm_device. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sitronix/st7735r.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7735r.c b/drivers/gpu/drm/sitronix/st7735r.c
index 1a34c7ba460b..9dd915765a6b 100644
--- a/drivers/gpu/drm/sitronix/st7735r.c
+++ b/drivers/gpu/drm/sitronix/st7735r.c
@@ -52,18 +52,22 @@ struct st7735r_cfg {
 	unsigned int rgb:1;		/* RGB (vs. BGR) */
 };
 
-struct st7735r_priv {
+struct st7735r_device {
 	struct mipi_dbi_dev dbidev;	/* Must be first for .release() */
 	const struct st7735r_cfg *cfg;
 };
 
+static struct st7735r_device *to_st7735r_device(struct drm_device *drm)
+{
+	return container_of(drm_to_mipi_dbi_dev(drm), struct st7735r_device, dbidev);
+}
+
 static void st7735r_pipe_enable(struct drm_simple_display_pipe *pipe,
 				struct drm_crtc_state *crtc_state,
 				struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
-	struct st7735r_priv *priv = container_of(dbidev, struct st7735r_priv,
-						 dbidev);
+	struct st7735r_device *priv = to_st7735r_device(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = &priv->dbidev;
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	int ret, idx;
 	u8 addr_mode;
@@ -184,7 +188,7 @@ static int st7735r_probe(struct spi_device *spi)
 	struct device *dev = &spi->dev;
 	const struct st7735r_cfg *cfg;
 	struct mipi_dbi_dev *dbidev;
-	struct st7735r_priv *priv;
+	struct st7735r_device *priv;
 	struct drm_device *drm;
 	struct mipi_dbi *dbi;
 	struct gpio_desc *dc;
@@ -196,7 +200,7 @@ static int st7735r_probe(struct spi_device *spi)
 		cfg = (void *)spi_get_device_id(spi)->driver_data;
 
 	priv = devm_drm_dev_alloc(dev, &st7735r_driver,
-				  struct st7735r_priv, dbidev.drm);
+				  struct st7735r_device, dbidev.drm);
 	if (IS_ERR(priv))
 		return PTR_ERR(priv);
 
-- 
2.52.0


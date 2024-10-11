Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E61A999D4A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 08:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E266810EA4C;
	Fri, 11 Oct 2024 06:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xYtoZ7WU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1yT0MI+D";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rCLyr+r0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ny8y7m43";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE8A10EA49
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 06:57:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E32F321A6F;
 Fri, 11 Oct 2024 06:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728629830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PifacVumwg9pPaDWPoP6jBh129aR6RpTxJeS75jSS5s=;
 b=xYtoZ7WUq/Oh7GFa7koLYJ/cTQpGbdTlK5//Y8o4fnn3WjcOu1g3z/bzroAarOTzsMuXv2
 Wp/XbY2JbHa3HqrnnCKmozLHrM6VDwXY+CQMXOEfWVuemWc/wtfw8xFZ9Bs5Kd9CWfZbcW
 hVTtvvToIACg33lzw/MiP04qRx0Fp2k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728629830;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PifacVumwg9pPaDWPoP6jBh129aR6RpTxJeS75jSS5s=;
 b=1yT0MI+DX+PLuApaf2shY6gsLJSuxpWCd7xKVu1lfuziv9cnG4bvFUTDqcrFna/3lMEbuo
 CrrOutv1zZSfkSAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728629829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PifacVumwg9pPaDWPoP6jBh129aR6RpTxJeS75jSS5s=;
 b=rCLyr+r0mg0rK1YCugXVaESnWECHhzbyaJ7fNaBHZRUTXGmZb0jNjbK0xj28Wwb/bl7W2/
 RBXUmx9qqZ3lgeTNR2mfwiK+FoCTgBpJVRVpFz08E5O1K6eXUWVvsGZF0lOy9YXAcKMk/T
 rA+9vTrcyxqfeYCWpZOYQkr/eJXKJrc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728629829;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PifacVumwg9pPaDWPoP6jBh129aR6RpTxJeS75jSS5s=;
 b=ny8y7m43XZP+1QhR27NvygGajYD5UsXsX5dHtoK0JtOpcxBHFIDFCrKaH4Rh4vh6m1i/iM
 tbsVASv3XNU/DYAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A47B613AAF;
 Fri, 11 Oct 2024 06:57:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IPb0JkXMCGcRfAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Oct 2024 06:57:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@linux.intel.com, airlied@redhat.com,
 jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/7] drm: Add bmc_attached flag to connector
Date: Fri, 11 Oct 2024 08:43:08 +0200
Message-ID: <20241011065705.6728-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241011065705.6728-1-tzimmermann@suse.de>
References: <20241011065705.6728-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Add the bmc_attached flag to struct drm_connector to signal the
presence of a virtual BMC output. The connector reports to be in
status connected even without a physically connected display. Fbcon
or userspace compositors would otherwise stop displaying to the
BMC.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_probe_helper.c | 6 +++++-
 include/drm/drm_connector.h        | 8 ++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index df44be128e72..83c3f2d42d49 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -605,7 +605,11 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 			ret = connector_status_unknown;
 
 		connector->physical_status = ret;
-		connector->status = connector->physical_status;
+
+		if (connector->bmc_attached)
+			connector->status = connector_status_connected;
+		else
+			connector->status = connector->physical_status;
 	}
 
 	/*
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 37e951f04ae8..ed360ae35f21 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1802,6 +1802,14 @@ struct drm_connector {
 	 */
 	bool ycbcr_420_allowed;
 
+	/**
+	 * @ bmc_attached:
+	 * The connector has a BMC transparently attached to it. It has to
+	 * report a connected status, even without a physically connected
+	 * display.
+	 */
+	bool bmc_attached;
+
 	/**
 	 * @registration_state: Is this connector initializing, exposed
 	 * (registered) with userspace, or unregistered?
-- 
2.46.0


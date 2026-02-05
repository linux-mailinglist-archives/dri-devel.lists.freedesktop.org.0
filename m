Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHD7FgSshGk14QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 15:41:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4F9F4296
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 15:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C558710E1E6;
	Thu,  5 Feb 2026 14:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="2YSH6mqm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZRiScupj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2YSH6mqm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZRiScupj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D87D10E1E6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 14:41:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B33FF5BDD4;
 Thu,  5 Feb 2026 14:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770302461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dVN9Q7X63zfknuhv2fPzKkvS2PZpsgjd0PnsI4vQ6PA=;
 b=2YSH6mqmOKwXeaOKmxVAAKyaS112+mCRL3KeR7XiSXF1ygot2mfw6y90Q5ydIBoW1aPpNQ
 1a+FMjKjqmOtHo3QsH3Hh30y20X4sO6NOSyyOCez2NnmOwtQ5ADIngazkXsH5PDfUHOkE7
 FmtDjj/+gazKXDuvYgAR7QRJq7TupIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770302461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dVN9Q7X63zfknuhv2fPzKkvS2PZpsgjd0PnsI4vQ6PA=;
 b=ZRiScupjBvGWtOxl2G8cHLx9JV+DFPvOTgyQqmt3mbA9hJi3LM4d93/hJFipVeJ2WKyYLW
 bXhmvMtD64H0osAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770302461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dVN9Q7X63zfknuhv2fPzKkvS2PZpsgjd0PnsI4vQ6PA=;
 b=2YSH6mqmOKwXeaOKmxVAAKyaS112+mCRL3KeR7XiSXF1ygot2mfw6y90Q5ydIBoW1aPpNQ
 1a+FMjKjqmOtHo3QsH3Hh30y20X4sO6NOSyyOCez2NnmOwtQ5ADIngazkXsH5PDfUHOkE7
 FmtDjj/+gazKXDuvYgAR7QRJq7TupIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770302461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dVN9Q7X63zfknuhv2fPzKkvS2PZpsgjd0PnsI4vQ6PA=;
 b=ZRiScupjBvGWtOxl2G8cHLx9JV+DFPvOTgyQqmt3mbA9hJi3LM4d93/hJFipVeJ2WKyYLW
 bXhmvMtD64H0osAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D05D3EA63;
 Thu,  5 Feb 2026 14:41:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1ZomGf2rhGnNZwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Feb 2026 14:41:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/fbdev-emulation: Remove support for legacy emulation
Date: Thu,  5 Feb 2026 15:40:48 +0100
Message-ID: <20260205144056.416759-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:javierm@redhat.com,m:jfalempe@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 9C4F9F4296
X-Rspamd-Action: no action

Remove the internal DRM client from fbdev emulation. This has been
required when some DRM drivers provided their own fbdev emulation.

This is no longer the case with commit b55f3bbab891 ("drm/{i915, xe}:
Implement fbdev emulation as in-kernel client") from 2024. Now there's
only a single DRM client for fbdev-emulation that fills out the client
callback functions as required.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 05803169bed5..845c63ca15b5 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -343,18 +343,6 @@ EXPORT_SYMBOL(drm_fb_helper_unprepare);
 int drm_fb_helper_init(struct drm_device *dev,
 		       struct drm_fb_helper *fb_helper)
 {
-	int ret;
-
-	/*
-	 * If this is not the generic fbdev client, initialize a drm_client
-	 * without callbacks so we can use the modesets.
-	 */
-	if (!fb_helper->client.funcs) {
-		ret = drm_client_init(dev, &fb_helper->client, "drm_fb_helper", NULL);
-		if (ret)
-			return ret;
-	}
-
 	dev->fb_helper = fb_helper;
 
 	return 0;
@@ -437,9 +425,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 	cancel_work_sync(&fb_helper->damage_work);
 
 	drm_fb_helper_release_info(fb_helper);
-
-	if (!fb_helper->client.funcs)
-		drm_client_release(&fb_helper->client);
 }
 EXPORT_SYMBOL(drm_fb_helper_fini);
 
-- 
2.52.0


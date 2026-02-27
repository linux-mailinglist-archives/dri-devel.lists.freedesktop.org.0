Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHm4HcicoWl8ugQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 14:31:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F371B7B46
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 14:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3549110EB49;
	Fri, 27 Feb 2026 13:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sobzLqt1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DTFWOWdp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sobzLqt1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DTFWOWdp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCF810EB49
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 13:31:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9EBE75BF71;
 Fri, 27 Feb 2026 13:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772199085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h6xIBHJ9PBQGrifF90bKfrQ0lv7Cz5JTEERldjnsghA=;
 b=sobzLqt1vVnRUVnMa6So/eHNB5jIDjQTGtVgQ1eUMMcv3TlSDHX2DUfrszL64D85pZ2+2k
 cXPCxx8SnQIgUm3ej2CuCtbJyEa1rWaInVXrjz5HtAIQ2E13vY6j89EnNIkTQsjD+XBf44
 82ngIQ4ADcinhbtaqA82wOncm6WyDcc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772199085;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h6xIBHJ9PBQGrifF90bKfrQ0lv7Cz5JTEERldjnsghA=;
 b=DTFWOWdpVmc5xyOJmRaZe2mg1NmozsDBWOnfQgFdpAHG1vZ4M6ex6v1Uz88RNz97nti3Xq
 52JyavUwNR0TCeDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sobzLqt1;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DTFWOWdp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772199085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h6xIBHJ9PBQGrifF90bKfrQ0lv7Cz5JTEERldjnsghA=;
 b=sobzLqt1vVnRUVnMa6So/eHNB5jIDjQTGtVgQ1eUMMcv3TlSDHX2DUfrszL64D85pZ2+2k
 cXPCxx8SnQIgUm3ej2CuCtbJyEa1rWaInVXrjz5HtAIQ2E13vY6j89EnNIkTQsjD+XBf44
 82ngIQ4ADcinhbtaqA82wOncm6WyDcc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772199085;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h6xIBHJ9PBQGrifF90bKfrQ0lv7Cz5JTEERldjnsghA=;
 b=DTFWOWdpVmc5xyOJmRaZe2mg1NmozsDBWOnfQgFdpAHG1vZ4M6ex6v1Uz88RNz97nti3Xq
 52JyavUwNR0TCeDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6342F3EA69;
 Fri, 27 Feb 2026 13:31:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sDUIF62coWkrLQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Feb 2026 13:31:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/radeon: Test for imported buffers with
 drm_gem_is_imported()
Date: Fri, 27 Feb 2026 14:31:09 +0100
Message-ID: <20260227133113.235940-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.51
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:amd-gfx@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,lists.freedesktop.org:email,suse.de:mid,suse.de:dkim,suse.de:email]
X-Rspamd-Queue-Id: 41F371B7B46
X-Rspamd-Action: no action

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test. The test itself does not change.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/radeon/radeon_display.c | 2 +-
 drivers/gpu/drm/radeon/radeon_object.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 5c72aad3dae7..4002a85cba3b 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1340,7 +1340,7 @@ radeon_user_framebuffer_create(struct drm_device *dev,
 	}
 
 	/* Handle is imported dma-buf, so cannot be migrated to VRAM for scanout */
-	if (obj->import_attach) {
+	if (drm_gem_is_imported(obj)) {
 		DRM_DEBUG_KMS("Cannot create framebuffer from imported dma_buf\n");
 		drm_gem_object_put(obj);
 		return ERR_PTR(-EINVAL);
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index a0fc0801abb0..2d958272d810 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -60,7 +60,7 @@ static void radeon_ttm_bo_destroy(struct ttm_buffer_object *tbo)
 	mutex_unlock(&bo->rdev->gem.mutex);
 	radeon_bo_clear_surface_reg(bo);
 	WARN_ON_ONCE(!list_empty(&bo->va));
-	if (bo->tbo.base.import_attach)
+	if (drm_gem_is_imported(&bo->tbo.base))
 		drm_prime_gem_destroy(&bo->tbo.base, bo->tbo.sg);
 	drm_gem_object_release(&bo->tbo.base);
 	kfree(bo);
-- 
2.52.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id W7JnH8icoWkOvAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 14:31:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C34461B7B4C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 14:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E6110EB57;
	Fri, 27 Feb 2026 13:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="fiRNva9T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8enDnxKl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fiRNva9T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8enDnxKl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4E810EB49
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 13:31:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3AA4B3FFCB;
 Fri, 27 Feb 2026 13:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772199086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+Wtk8do3FZe3D3LSyFE2M5SN4vcuz4Mc41a6yt0+AV0=;
 b=fiRNva9TvNcT7dBc3WY0VOMYKtlKXnQ4+ubKgcTMVPioPUaZrk9HQzqPFTHDV91562yWK8
 +TebUdXN1bcm3zBlDV68tBlZvC7h+EyNdTrSgyPqcEv7dBjjPmen+zBVTAvhacZ8ogsXnv
 MW+rDTycILpUTouix4df6T4fG9vVFPA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772199086;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+Wtk8do3FZe3D3LSyFE2M5SN4vcuz4Mc41a6yt0+AV0=;
 b=8enDnxKlr34o0t7H1io7jqwCXAHr6/XpXENb6RGTspLG75ddXkwonrroaFYD/UrQKw4Sp+
 bHdQDABFzFvwwxAw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fiRNva9T;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8enDnxKl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772199086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+Wtk8do3FZe3D3LSyFE2M5SN4vcuz4Mc41a6yt0+AV0=;
 b=fiRNva9TvNcT7dBc3WY0VOMYKtlKXnQ4+ubKgcTMVPioPUaZrk9HQzqPFTHDV91562yWK8
 +TebUdXN1bcm3zBlDV68tBlZvC7h+EyNdTrSgyPqcEv7dBjjPmen+zBVTAvhacZ8ogsXnv
 MW+rDTycILpUTouix4df6T4fG9vVFPA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772199086;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+Wtk8do3FZe3D3LSyFE2M5SN4vcuz4Mc41a6yt0+AV0=;
 b=8enDnxKlr34o0t7H1io7jqwCXAHr6/XpXENb6RGTspLG75ddXkwonrroaFYD/UrQKw4Sp+
 bHdQDABFzFvwwxAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EFE833EA69;
 Fri, 27 Feb 2026 13:31:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MFpkOa2coWkrLQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Feb 2026 13:31:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Subject: [PATCH] drm/vc4: Test for imported buffers with drm_gem_is_imported()
Date: Fri, 27 Feb 2026 14:31:11 +0100
Message-ID: <20260227133113.235940-12-tzimmermann@suse.de>
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
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email,igalia.com:email]
X-Rspamd-Queue-Id: C34461B7B4C
X-Rspamd-Action: no action

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test. The test itself does not change.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: "Maíra Canal" <mcanal@igalia.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_bo.c  | 2 +-
 drivers/gpu/drm/vc4/vc4_gem.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 1f93bc5a3d02..f45ba47b4ba8 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -556,7 +556,7 @@ static void vc4_free_object(struct drm_gem_object *gem_bo)
 	mutex_lock(&vc4->bo_lock);
 	/* If the object references someone else's memory, we can't cache it.
 	 */
-	if (gem_bo->import_attach) {
+	if (drm_gem_is_imported(gem_bo)) {
 		vc4_bo_destroy(bo);
 		goto out;
 	}
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index ad8cbd727b80..2d3df5e621c1 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -1250,7 +1250,7 @@ int vc4_gem_madvise_ioctl(struct drm_device *dev, void *data,
 	/* Not sure it's safe to purge imported BOs. Let's just assume it's
 	 * not until proven otherwise.
 	 */
-	if (gem_obj->import_attach) {
+	if (drm_gem_is_imported(gem_obj)) {
 		DRM_DEBUG("madvise not supported on imported BOs\n");
 		ret = -EINVAL;
 		goto out_put_gem;
-- 
2.52.0


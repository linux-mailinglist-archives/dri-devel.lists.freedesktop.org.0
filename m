Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35729523C7B
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 20:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B31D112941;
	Wed, 11 May 2022 18:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CFF112941
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 18:31:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5F78D1F92A;
 Wed, 11 May 2022 18:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652293887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gXpEDDo6oxnleGvDgBGc5E3Vj3H2Wu0dHCvJFp0b8G0=;
 b=WmrNHJj+cvvlI6x2OsGK810GkRggWM0PENfBeD7kXx5CHXEaWy0l51ypzdh/2xv8dKyc7D
 9Wnm3bdQFntGpnh7w2oPuWcNRBMgTePJNdWLqvBimOoSN6+mD+6zAwtJkxYC0HWMErG2el
 XdWMLg5/RuKuTeFLnljGZGZCeL/ojSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652293887;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gXpEDDo6oxnleGvDgBGc5E3Vj3H2Wu0dHCvJFp0b8G0=;
 b=32higmYQu2c+156h9UGTdz/LfvyZ5p5Lpq/fVrBfU0O1w4cc3iUQe8DpjqXfmh29+4jZGe
 2abJC7R00ScSBOAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 38CFB13AF6;
 Wed, 11 May 2022 18:31:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KC7FDP8AfGIbeQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 May 2022 18:31:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 1/3] drm: Always warn if user-defined modes are not supported
Date: Wed, 11 May 2022 20:31:23 +0200
Message-Id: <20220511183125.14294-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220511183125.14294-1-tzimmermann@suse.de>
References: <20220511183125.14294-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Print a warning if a user-specifed display mode is not supported by
the display pipeline. Users specified the display mode on the kernel
command line with the use of the video= parameter. Setting an
unsupported mode will leave the console blank, so we should at least
let the user know why.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_modes.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 14b746f7ba97..40b7b245e98c 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1328,6 +1328,10 @@ void drm_mode_prune_invalid(struct drm_device *dev,
 	list_for_each_entry_safe(mode, t, mode_list, head) {
 		if (mode->status != MODE_OK) {
 			list_del(&mode->head);
+			if (mode->type & DRM_MODE_TYPE_USERDEF) {
+				drm_warn(dev, "User-defined mode not supported: "
+					 DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
+			}
 			if (verbose) {
 				drm_mode_debug_printmodeline(mode);
 				DRM_DEBUG_KMS("Not using %s mode: %s\n",
-- 
2.36.0


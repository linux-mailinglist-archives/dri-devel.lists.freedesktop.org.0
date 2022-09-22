Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A475E6343
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 15:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FAB10EB0C;
	Thu, 22 Sep 2022 13:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1A710EB08
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 13:09:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8E34C21A2D;
 Thu, 22 Sep 2022 13:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663852186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4EngroJCPiyjgIyVd5VQ/FkcNKRlKDFfM2tCqq8QaFw=;
 b=EHUhCuMi9XM4Ax0SCuhdyagwrAsYiqjykHGgMPiRz47pOMLjBlUKiTge3YB11/+BKh5dSC
 YbFNOf3BQsIK0d8APrCR7b7lk/8SX0Kxjb76xvh6cknkmrbGbJ84v2NFs08NuJ6Po5g8wy
 RWC5RKbEJlsYWsCo9z/Y5Je+aRszWZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663852186;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4EngroJCPiyjgIyVd5VQ/FkcNKRlKDFfM2tCqq8QaFw=;
 b=wg5nmPcEWUeAVwrepZ6ymVu9uaXQxvSu8hwJ7HvB6DULfLClSoccgxkC5D6vHH3k0uBGga
 lbF6kbwQq74ps/BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 64B4E13AF0;
 Thu, 22 Sep 2022 13:09:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uCu+F5peLGMSbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 22 Sep 2022 13:09:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 3/5] drm/simpledrm: Remove !fb check from atomic_update
Date: Thu, 22 Sep 2022 15:09:42 +0200
Message-Id: <20220922130944.27138-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922130944.27138-1-tzimmermann@suse.de>
References: <20220922130944.27138-1-tzimmermann@suse.de>
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

The primary plane implements atomic_disable, so atomic_update will
not be called without a framebuffer set. Remove the test for !fb.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/simpledrm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 14782a50f816..8fab22a26e26 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -482,9 +482,6 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 	struct drm_rect src_clip, dst_clip;
 	int idx;
 
-	if (!fb)
-		return;
-
 	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &src_clip))
 		return;
 
-- 
2.37.3


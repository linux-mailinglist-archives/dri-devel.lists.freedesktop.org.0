Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A30CC9108FE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 16:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DCC10EA55;
	Thu, 20 Jun 2024 14:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="JoXin4bp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BRO0QXTH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JoXin4bp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BRO0QXTH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F6810EA5B;
 Thu, 20 Jun 2024 14:52:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C6B641F8B5;
 Thu, 20 Jun 2024 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718895163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mx6HmBHzLfcx++306iP7fMkmUJFXGoHm1hzxVMoqV84=;
 b=JoXin4bpREZza0SkpYaSLaTjH83D+uZQNYFdLgKiBf4z+ShHmZjq/BmJQAD4BM0KGfMPxL
 7rieET1f8ADKy386D94SsI+fuUO2820Lp6xkUBmN0EDxR9MGFxTxRjR0LT+FgjDJntA3IK
 JLYLKOvwCoq8UWD2Pm915U5aRuwC5LY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718895163;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mx6HmBHzLfcx++306iP7fMkmUJFXGoHm1hzxVMoqV84=;
 b=BRO0QXTHABR6n33du7fO9DtmGb0T1EEQdzq3J4cMcVG1g8F3kgqkRmeT9zgC1ceJaAtEKX
 XTWGpUe2X8O2OtBQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JoXin4bp;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BRO0QXTH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718895163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mx6HmBHzLfcx++306iP7fMkmUJFXGoHm1hzxVMoqV84=;
 b=JoXin4bpREZza0SkpYaSLaTjH83D+uZQNYFdLgKiBf4z+ShHmZjq/BmJQAD4BM0KGfMPxL
 7rieET1f8ADKy386D94SsI+fuUO2820Lp6xkUBmN0EDxR9MGFxTxRjR0LT+FgjDJntA3IK
 JLYLKOvwCoq8UWD2Pm915U5aRuwC5LY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718895163;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mx6HmBHzLfcx++306iP7fMkmUJFXGoHm1hzxVMoqV84=;
 b=BRO0QXTHABR6n33du7fO9DtmGb0T1EEQdzq3J4cMcVG1g8F3kgqkRmeT9zgC1ceJaAtEKX
 XTWGpUe2X8O2OtBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 854E313ACA;
 Thu, 20 Jun 2024 14:52:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iBk/HztCdGZ+aQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Jun 2024 14:52:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, felix.kuehling@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] drm/amdgpu: Unmap BO memory before calling
 amdgpu_bo_unref()
Date: Thu, 20 Jun 2024 16:44:40 +0200
Message-ID: <20240620145238.25295-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620145238.25295-1-tzimmermann@suse.de>
References: <20240620145238.25295-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.90 / 50.00]; BAYES_HAM(-2.89)[99.54%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_TRACE(0.00)[suse.de:+]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C6B641F8B5
X-Spam-Flag: NO
X-Spam-Score: -4.90
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

Prepares for using ttm_bo_vmap() and ttm_bo_vunmap() in amdgpu. Both
require the caller to hold the GEM reservation lock, which is not the
case while releasing a buffer object. Hence, push a possible call to
unmap out from the buffer-object release code. Warn if a buffer object
with mapped pages is supposed to be released.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index a1b7438c43dc8..d58b11ea0ead5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -58,7 +58,12 @@ static void amdgpu_bo_destroy(struct ttm_buffer_object *tbo)
 {
 	struct amdgpu_bo *bo = ttm_to_amdgpu_bo(tbo);
 
-	amdgpu_bo_kunmap(bo);
+	/*
+	 * BO memory pages should be unmapped at this point. Call
+	 * amdgpu_bo_kunmap() before releasing the BO.
+	 */
+	if (drm_WARN_ON_ONCE(bo->tbo.base.dev, bo->kmap.bo))
+		amdgpu_bo_kunmap(bo);
 
 	if (bo->tbo.base.import_attach)
 		drm_prime_gem_destroy(&bo->tbo.base, bo->tbo.sg);
@@ -450,9 +455,7 @@ void amdgpu_bo_free_kernel(struct amdgpu_bo **bo, u64 *gpu_addr,
 	WARN_ON(amdgpu_ttm_adev((*bo)->tbo.bdev)->in_suspend);
 
 	if (likely(amdgpu_bo_reserve(*bo, true) == 0)) {
-		if (cpu_addr)
-			amdgpu_bo_kunmap(*bo);
-
+		amdgpu_bo_kunmap(*bo);
 		amdgpu_bo_unpin(*bo);
 		amdgpu_bo_unreserve(*bo);
 	}
-- 
2.45.2


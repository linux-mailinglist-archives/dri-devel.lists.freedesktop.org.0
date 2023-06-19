Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D41735936
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 16:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4365B10E20B;
	Mon, 19 Jun 2023 14:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF3A10E20A;
 Mon, 19 Jun 2023 14:11:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 61E341F86C;
 Mon, 19 Jun 2023 14:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687183891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NHHjMnmLiaqjuzq8Z6sqJ8v2E+XGkYJ+F+MumdZTb/k=;
 b=FtvrIRDsMNxS42x0m+lv67YHM6AosAbZpe2JQkHeQUuodYCpQNx5sjuR08MRmaDiHmL7lg
 33IW5eVSgmRX3S7vYFQSdGI+ZMqIWH9+qlEdkxcJlyM9/tdBcBouuLbIDar/pjUxj491uh
 RR8FF7IFyIybQ3pIHjOAcRC+LPKqYvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687183891;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NHHjMnmLiaqjuzq8Z6sqJ8v2E+XGkYJ+F+MumdZTb/k=;
 b=04CtyWy0SWExfOMKWz7ztPGRkfDS2U5szTVWAC7qCO4RnD0cqTONhsM6Gdxdnc1Qd+yiys
 KNDYjrASI/H97rBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 36197138E8;
 Mon, 19 Jun 2023 14:11:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SWZBDBNikGSBHAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Jun 2023 14:11:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 jani.nikula@linux.intel.com
Subject: [PATCH] drm/amdgpu: Remove struct drm_driver.gem_prime_mmap
Date: Mon, 19 Jun 2023 16:11:12 +0200
Message-ID: <20230619141129.2002-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The callback struct drm_driver.gem_prime_mmap as been removed in
commit 0adec22702d4 ("drm: Remove struct drm_driver.gem_prime_mmap").
Do not assign to it. The assigned function, drm_gem_prime_mmap(), is
now the default for the operation, so there is no change in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 0adec22702d4 ("drm: Remove struct drm_driver.gem_prime_mmap")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 43613569801b6..07e16ad465d06 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2879,7 +2879,6 @@ const struct drm_driver amdgpu_partition_driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = amdgpu_gem_prime_import,
-	.gem_prime_mmap = drm_gem_prime_mmap,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
-- 
2.41.0


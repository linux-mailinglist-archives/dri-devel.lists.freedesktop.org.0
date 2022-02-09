Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D22E4AF5D9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 16:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E589510E20E;
	Wed,  9 Feb 2022 15:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA3510E18D;
 Wed,  9 Feb 2022 15:56:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4B4381F383;
 Wed,  9 Feb 2022 15:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644422197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=jw5vORRNedcMhyTsHWpDYLPvPJ9B0ItRnP3EWanTYu8=;
 b=WihCwBeuRVPM3B1YhfezlglyW37hYl40XsP1AZ0jTYVwIMGakIYAvqWAqh/6W0FAK2jrCF
 FLpbNGVCMPW7wqDqQrFgcegiPohXYduESF9+Fhp75zIOd57z3COVbPbwEQw9f34ZpYuRaX
 nq5tx0aDTLn9mcwvqFCxMgvOpeoB3Qc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644422197;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=jw5vORRNedcMhyTsHWpDYLPvPJ9B0ItRnP3EWanTYu8=;
 b=bAJsBNxvtaLa0PEEm+UKkM8ifw2iQ/mhjSdkt95TAlezjJV+y0xNFzsv9jKPp1TjR9A/5c
 NkEpRs2C0+woabDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E268213D58;
 Wed,  9 Feb 2022 15:56:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S3ooNjTkA2JxHAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Feb 2022 15:56:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, yuq825@gmail.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, emma@anholt.net, kraxel@redhat.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com
Subject: [PATCH v2 0/2] drm/gem-shmem: Various improvements
Date: Wed,  9 Feb 2022 16:56:32 +0100
Message-Id: <20220209155634.3994-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, lima@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two patches for GEM's SHMEM-backed implementation.

v2:
	* update drivers after vm_ops change

Thomas Zimmermann (2):
  drm/gem-shmem: Set vm_ops in static initializer
  drm/gem-shmem: Don't store mmap'ed buffers in core dumps

 drivers/gpu/drm/drm_gem_shmem_helper.c  | 7 ++++---
 drivers/gpu/drm/lima/lima_gem.c         | 1 +
 drivers/gpu/drm/panfrost/panfrost_gem.c | 1 +
 drivers/gpu/drm/v3d/v3d_bo.c            | 1 +
 drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
 include/drm/drm_gem_shmem_helper.h      | 2 ++
 6 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.34.1


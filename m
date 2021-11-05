Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 624F244616E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 10:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B649789711;
	Fri,  5 Nov 2021 09:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2780F896BF;
 Fri,  5 Nov 2021 09:36:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C91D421892;
 Fri,  5 Nov 2021 09:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636104960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nDa9zWVnZDqdiCrIxzYmPuy18f6Bp5MOv2N2VeoCCm4=;
 b=uAmrBd1t8eT0hzo+fC9iteTc3eeDTpTxrfudnMZnzhSAYEaY/VM7AQZTmH5LWVoH1NijbA
 B5vn+Qg2KFjMvjd5q0Fz/iQtWaAzHTEY6gpqYGLvCQ2ftZ+1s91bP9hFrabI9pE07ZzSfW
 w5TkvZbArtnHZzbHzCLE2pial54T1Nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636104960;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nDa9zWVnZDqdiCrIxzYmPuy18f6Bp5MOv2N2VeoCCm4=;
 b=Sxx/wgwZCwKoaoy1fE97tTWxbHRxw5Qh+z0qIWFio1T9DDMDsQq1lmWQFu99FZ9LG9hpeT
 gp5192TqyxQ+JgDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9808A13B97;
 Fri,  5 Nov 2021 09:36:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eGQzJAD7hGFTaQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Nov 2021 09:36:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 0/3] drm/shmem-helper: Cleanup public interface
Date: Fri,  5 Nov 2021 10:35:55 +0100
Message-Id: <20211105093558.5084-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
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

The interface of GEM SHMEM helpers inconsistently uses either struct
drm_gem_object or drm_gem_shmem_object for the GEM object. Convert GEM
SHMEM functions to accept struct drm_gem_shmem_object, provide small
wrappers for GEM object callbacks and update all users.

Converting all GEM object functions to use drm_gem_shmem_object enables
type checking by the C compiler. Previous callers could have passed any
implementation of drm_gem_object to the GEM SHMEM helpers. It also
removes upcasting in the GEM functions and simplifies the caller side.
No functional changes.

For GEM object callbacks, the SHMEM helper library now provides a
number of small wrappers that do the necessary upcasting. Again no
functional changes.

Thomas Zimmermann (3):
  drm/shmem-helper: Unexport drm_gem_shmem_create_with_handle()
  drm/shmem-helper: Export dedicated wrappers for GEM object functions
  drm/shmem-helper: Pass GEM shmem object in public interfaces

 drivers/gpu/drm/drm_gem_shmem_helper.c        | 126 +++++--------
 drivers/gpu/drm/lima/lima_gem.c               |  18 +-
 drivers/gpu/drm/lima/lima_sched.c             |   4 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c       |  20 ++-
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |   2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |   5 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |   6 +-
 drivers/gpu/drm/v3d/v3d_bo.c                  |  22 +--
 drivers/gpu/drm/virtio/virtgpu_object.c       |  27 ++-
 include/drm/drm_gem_shmem_helper.h            | 168 +++++++++++++++---
 11 files changed, 251 insertions(+), 149 deletions(-)

--
2.33.1


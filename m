Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C543B434BF3
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 15:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5F289FC9;
	Wed, 20 Oct 2021 13:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D55892E4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 13:19:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A1C2F1FDA1;
 Wed, 20 Oct 2021 13:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634735982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PSSae/s0vdP4zU6lEC9WIE3+NIdpDa/Xw7BPCyqUjbw=;
 b=XYtq/3rv83NMBk78bmsAyRRIR7PEyyWd5RwMQxJPALxwL2d17Prf56cVrFGpclWHIR8Ujf
 yPKQdaGpfY4kQpBPhHdEnDSMyibGAQoqdwWzOF9nBCMvbbk0A3M4YkRcYdfeOfxQhRBnoo
 NDX3kKL6lbUfhIOELKj9mRt+sMrf+EA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634735982;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PSSae/s0vdP4zU6lEC9WIE3+NIdpDa/Xw7BPCyqUjbw=;
 b=dRTce8ogiKgtjvmoSumu42c07aZtGmMBJ358qYl8ZOJRUBu0mFBKY3DA7rC31VvVWGcZOf
 4/faHkFNdYgZhdCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7DF8213B29;
 Wed, 20 Oct 2021 13:19:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zWfNHW4XcGHsdwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Oct 2021 13:19:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] drm: Move several files from DRM core into modules
Date: Wed, 20 Oct 2021 15:19:38 +0200
Message-Id: <20211020131941.15367-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move a number of files into modules and behind config options.

So far, early boot graphics was provided by fbdev. With simpledrm, and
possibly other generic DRM drivers, it's now possible to have general
early-boot output with DRM. This requires the DRM core to be linked into
the kernel binary image.

The reduction in size here is only ~1%, but the patchset is part of a
larger effort to reduce the size of the DRM core module.

Thomas Zimmermann (3):
  drm: Build drm_irq.o only if CONFIG_DRM_LEGACY has been set
  drm: Link several object files into drm_kms_helper.ko
  drm: Move GEM memory managers into modules

 drivers/gpu/drm/Kconfig                |  4 ++--
 drivers/gpu/drm/Makefile               | 26 +++++++++++++++-----------
 drivers/gpu/drm/drm_gem_cma_helper.c   |  4 ++++
 drivers/gpu/drm/drm_gem_shmem_helper.c |  4 ++++
 drivers/gpu/drm/drm_irq.c              |  2 --
 5 files changed, 25 insertions(+), 15 deletions(-)

--
2.33.0


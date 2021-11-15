Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E68984503EB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 13:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61636EA77;
	Mon, 15 Nov 2021 12:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053176EA74
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 12:01:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8E9C11FD67;
 Mon, 15 Nov 2021 12:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636977709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Roq9KIrJ5NH1GtmGpzHmXzH2zR1Gn+P59CyYumnHUwM=;
 b=hp0vnWEUm/lz8cB0nk6BROWkBGdTUXGflSl2GPm3WkAN19XWaT4Xc7ZhqR4v4krZnsvWgq
 J4gjqhFIqk/f/c3zS4yPl88gEqY+bsP9/ZivxJprOmmilGWQfjQ5vzXQquFPd9eeu0fdRu
 /eylOysvxSCcdigrdO1kcO0wrtzcLNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636977709;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Roq9KIrJ5NH1GtmGpzHmXzH2zR1Gn+P59CyYumnHUwM=;
 b=8u2IJ56Rzthay+Rv68HgqpyV0ASj334y38SnHz/7oSt6KkA5mnWOL2iipikunhXqdGU8Qu
 C0ThfnQ0IkGn0pDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 528D213E37;
 Mon, 15 Nov 2021 12:01:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TV0iEy1MkmHKVgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Nov 2021 12:01:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, emma@anholt.net
Subject: [PATCH 0/3] drm/cma-helper: Clean up public interface
Date: Mon, 15 Nov 2021 13:01:45 +0100
Message-Id: <20211115120148.21766-1-tzimmermann@suse.de>
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
Cc: linux-renesas-soc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert GEM CMA functions to accept struct drm_gem_cma_object, provide
small wrappers for GEM object callbacks and update all users. Brings
up the interface to the pattern used in SHMEM and VRAM helpers.

Converting all GEM object functions to use drm_gem_cma_object enables
type checking by the C compiler. Previous callers could have passed any
implementation of drm_gem_object to the GEM CMA helpers. It also
removes upcasting in the GEM functions and simplifies the caller side.
No functional changes.

For GEM object callbacks, the CMA helper library now provides a
number of small wrappers that do the necessary upcasting. Again no
functional changes.

Thomas Zimmermann (3):
  drm/cma-helper: Move driver and file ops to the end of header
  drm/cma-helper: Export dedicated wrappers for GEM object functions
  drm/cma-helper: Pass GEM CMA object in public interfaces

 drivers/gpu/drm/drm_gem_cma_helper.c  |  73 +++++-----
 drivers/gpu/drm/rcar-du/rcar_du_kms.c |  10 +-
 drivers/gpu/drm/vc4/vc4_bo.c          |   8 +-
 include/drm/drm_gem_cma_helper.h      | 189 +++++++++++++++++++-------
 4 files changed, 180 insertions(+), 100 deletions(-)


base-commit: 9fccd12cfac1c863fa46d4d17c2d8ac25a44b190
--
2.33.1


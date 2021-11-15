Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FADB4504BC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 13:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B296ECCE;
	Mon, 15 Nov 2021 12:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CDC6EB8B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 12:55:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F3E5621A72;
 Mon, 15 Nov 2021 12:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636980943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XOqYVfR/Sl28Bq6B8tv0SnwQcN/asOW3bafnOIzrHT8=;
 b=LfXNzom5N4jnBw+OMnw29VicjGuTa/nElI5PExLCJ0Km/C4ycJXq3tzhuzftLVbRdGvWss
 ONmmVPEeKOPhYagEcb0FTFk0JuvZFgYGHNufhugBtDOVb9D3ezFXWClzk+rOIO9+nE/1qJ
 mUzaf3ftSAb/PExR5AlzkOiPyDQ42qM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636980943;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XOqYVfR/Sl28Bq6B8tv0SnwQcN/asOW3bafnOIzrHT8=;
 b=cBqsECSeB8nb5R5rID2qLzBrj5D+C01EMUt/Ir37/VB3c1kndCa4rmPsdUyu6mzxQxNbzW
 PejonVpuzOrA+dBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA7C713D86;
 Mon, 15 Nov 2021 12:55:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nNGfLM5YkmEFcwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Nov 2021 12:55:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, christian.koenig@amd.com,
 ray.huang@amd.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH 0/3] drm: Make DRM hashtable legacy
Date: Mon, 15 Nov 2021 13:55:36 +0100
Message-Id: <20211115125539.1730-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clean up the last non-legacy users of DRM's hashtable code and put
the code behind CONFIG_DRM_LEGACY.

TTM only includes the header file, but does not use the hashtable.
The vmwgfx driver uses the hashtable internally. Copy the DRM code
into the driver. A later patchset should probably update vmwgfx to
use Linux' hashtable. Finally, make the core hashtable code legacy.

Built with/without CONFIG_DRM_LEGACY set.

Thomas Zimmermann (3):
  drm/ttm: Don't include drm_hashtab.h
  drm/vmwgfx: Copy DRM hash-table code into driver
  drm: Declare hashtable as legacy

 drivers/gpu/drm/Makefile                      |   6 +-
 drivers/gpu/drm/drm_hashtab.c                 |  10 +-
 drivers/gpu/drm/drm_legacy.h                  |  40 +++-
 drivers/gpu/drm/vmwgfx/Makefile               |   2 +-
 drivers/gpu/drm/vmwgfx/ttm_object.c           |  52 ++---
 drivers/gpu/drm/vmwgfx/ttm_object.h           |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c    |  24 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c       |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.c       | 199 ++++++++++++++++++
 .../gpu/drm/vmwgfx/vmwgfx_hashtab.h           |  54 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c    |  22 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h    |   7 +-
 include/drm/drm_device.h                      |   5 +-
 include/drm/drm_legacy.h                      |  15 +-
 include/drm/ttm/ttm_bo_api.h                  |   1 -
 17 files changed, 347 insertions(+), 103 deletions(-)
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.c
 rename include/drm/drm_hashtab.h => drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.h (58%)


base-commit: 9fccd12cfac1c863fa46d4d17c2d8ac25a44b190
--
2.33.1


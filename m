Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A706E908C90
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 15:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACC010ED51;
	Fri, 14 Jun 2024 13:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GxAYWM5o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qufAt1nZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GxAYWM5o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qufAt1nZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6467710E27A;
 Fri, 14 Jun 2024 13:36:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0304A3386E;
 Fri, 14 Jun 2024 13:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718372159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7YxgKklXCUhZY2FpOS+VKkuA6jZlEhJldardPfYZ3Cg=;
 b=GxAYWM5oeBKBE0hcgqsumG/6J3TSrXNRoHSJh2gLTnwrG/w7eDDeWAuZYRzhdcJX7RFwDu
 uYwpSLVQ99386xjwh690zD5LutA3ALB/6jRqeNR4VRz2KcbJJmQOWGlhAprksDHk3QqCNg
 5i4pAGa13EeiXXYenROqV2w2YM6DPxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718372159;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7YxgKklXCUhZY2FpOS+VKkuA6jZlEhJldardPfYZ3Cg=;
 b=qufAt1nZ42ignT3HS07EsFxjZDJiW4a3BqLviG7WSC+xezCyqpm39sUJWGYJoQ6FGMld6x
 T4PtisDcSItWy4CQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GxAYWM5o;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qufAt1nZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718372159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7YxgKklXCUhZY2FpOS+VKkuA6jZlEhJldardPfYZ3Cg=;
 b=GxAYWM5oeBKBE0hcgqsumG/6J3TSrXNRoHSJh2gLTnwrG/w7eDDeWAuZYRzhdcJX7RFwDu
 uYwpSLVQ99386xjwh690zD5LutA3ALB/6jRqeNR4VRz2KcbJJmQOWGlhAprksDHk3QqCNg
 5i4pAGa13EeiXXYenROqV2w2YM6DPxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718372159;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7YxgKklXCUhZY2FpOS+VKkuA6jZlEhJldardPfYZ3Cg=;
 b=qufAt1nZ42ignT3HS07EsFxjZDJiW4a3BqLviG7WSC+xezCyqpm39sUJWGYJoQ6FGMld6x
 T4PtisDcSItWy4CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 915EF13AB1;
 Fri, 14 Jun 2024 13:35:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FvAKIj5HbGavPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Jun 2024 13:35:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, ray.huang@amd.com, christian.koenig@amd.com,
 kraxel@redhat.com, airlied@redhat.com, suijingfeng@loongson.cn
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/6] drm/{ttm,xe}: Improve ttm_bo_vmap() and update xe
Date: Fri, 14 Jun 2024 15:21:54 +0200
Message-ID: <20240614133556.11378-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0304A3386E
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_TWELVE(0.00)[16];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,intel.com,amd.com,redhat.com,loongson.cn];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Add ttm_bo_kmap()'s features to ttm_bo_vmap() and convert xe to
use the latter helper. ttm_bo_vmap() returns mappings in an instance
of struct iosys_map, which simplifies driver code in several places.

Patches 1 and 2 allow ttm_bo_vmap() to store the method of allocation
in the iosys_map instance. This simplifies the unmap and driver code.

Patch 3 adds support for partial mappings to ttm_bo_vmap(). That's
another feature of ttm_bo_kmap(). It is now possible to map only a
subrange of a buffer object's memory buffer. This requires a trivial
change to existing callers, so that they still map the full buffer
range.

Patch 4 adds support for kmap()-based mappings in certain cases to
ttm_bo_vmap().

Patches 5 and 6 convert xe to ttm_bo_vmap(). ttm_bo_vmap() tests if
the caller holds the object's reservation lock; and therefore cannot
be called while relasing the buffer object. Patch 5 resolves this
problem in xe. Patch 6 then replaces ttm_bo_kmap() with ttm_bo_vmap()
and also updates the callers to use struct iosys_map everywhere.

Tested on Intel ARC hardware.

Future direction: DRM's TTM-based drivers use a mixture of ttm_bo_kmap()
and ttm_bo_vmap(). After merging these updates for ttm_bo_vmap(), the
other drivers can be converted and ttm_bo_kmap() can be removed.

Thomas Zimmermann (6):
  iosys-map: Add allocator flags
  drm/ttm: Store the bo_kmap_type in struct iosys_map
  drm/ttm: Support partial buffer mappings for ttm_bo_vmap()
  drm/ttm: Support kmap for single-page mappings in ttm_bo_vmap()
  drm/xe: Remove vunmap calls object-freeing code
  drm/xe: Replace ttm_bo_kmap() with ttm_bo_vmap()

 drivers/gpu/drm/drm_gem_ttm_helper.c          |  2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c         |  2 +-
 drivers/gpu/drm/loongson/lsdc_gem.c           |  2 +-
 drivers/gpu/drm/qxl/qxl_object.c              |  2 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c             | 94 +++++++++++++------
 .../compat-i915-headers/gem/i915_gem_object.h | 17 +---
 drivers/gpu/drm/xe/display/intel_fb_bo.c      | 12 ++-
 drivers/gpu/drm/xe/xe_bo.c                    | 46 ++++-----
 drivers/gpu/drm/xe/xe_bo.h                    | 23 ++---
 drivers/gpu/drm/xe/xe_bo_types.h              |  2 -
 drivers/gpu/drm/xe/xe_lrc.c                   |  3 +-
 drivers/gpu/drm/xe/xe_vm.c                    |  2 +-
 include/drm/ttm/ttm_bo.h                      |  4 +-
 include/linux/iosys-map.h                     | 13 ++-
 14 files changed, 131 insertions(+), 93 deletions(-)

-- 
2.45.2


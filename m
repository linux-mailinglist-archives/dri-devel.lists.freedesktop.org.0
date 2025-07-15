Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A3CB05453
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 10:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CD410E55F;
	Tue, 15 Jul 2025 08:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="O0gGapp0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rS3KzSV7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O0gGapp0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rS3KzSV7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA6310E559
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 08:14:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 52DB221245;
 Tue, 15 Jul 2025 08:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752567271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Icciv0uoZHCPfRN3VyukOjoDYMM0TZ9xrbuT868yP6M=;
 b=O0gGapp0tkFIjmRzq0WL1gc2pdf82ZYRvE7phJhLnCu72Zv+lmkhI+sfMqsWmUWqeXrdnK
 myhm9uJxdas4LrU+07olMGmBzbfmG/tUPn1irj14Q3uZsP4FyJqihsHO9cXZNzkpoJ/ZF/
 S8JaMTM6bUl113n1POulBDt5u1Whu1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752567271;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Icciv0uoZHCPfRN3VyukOjoDYMM0TZ9xrbuT868yP6M=;
 b=rS3KzSV7VkkpW4zopLnixkzMtc7ZD97ynP3S7fCmUCVSMFJGrUx3EXLvuK5/sbXjtqk5b2
 DQzKIF2Akr4r0nCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752567271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Icciv0uoZHCPfRN3VyukOjoDYMM0TZ9xrbuT868yP6M=;
 b=O0gGapp0tkFIjmRzq0WL1gc2pdf82ZYRvE7phJhLnCu72Zv+lmkhI+sfMqsWmUWqeXrdnK
 myhm9uJxdas4LrU+07olMGmBzbfmG/tUPn1irj14Q3uZsP4FyJqihsHO9cXZNzkpoJ/ZF/
 S8JaMTM6bUl113n1POulBDt5u1Whu1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752567271;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Icciv0uoZHCPfRN3VyukOjoDYMM0TZ9xrbuT868yP6M=;
 b=rS3KzSV7VkkpW4zopLnixkzMtc7ZD97ynP3S7fCmUCVSMFJGrUx3EXLvuK5/sbXjtqk5b2
 DQzKIF2Akr4r0nCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C0F7413306;
 Tue, 15 Jul 2025 08:14:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id S8JiLeYNdmgJUAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 08:14:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, christian.koenig@amd.com,
 torvalds@linux-foundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 kraxel@redhat.com, christian.gmeiner@gmail.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, zack.rusin@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/7] drm: Revert general use of struct
 drm_gem_object.dma_buf
Date: Tue, 15 Jul 2025 10:07:51 +0200
Message-ID: <20250715081121.34473-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,amd.com,linux-foundation.org,linux.intel.com,kernel.org,pengutronix.de,armlinux.org.uk,redhat.com,collabora.com,chromium.org,broadcom.com];
 ARC_NA(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[20]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TAGGED_RCPT(0.00)[etnaviv]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -1.30
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

Revert the use of drm_gem_object.dma_buf back to .import_attach->dmabuf
in the affected places. Separates references to imported and exported DMA
bufs within a GEM object; as before.

The dma_buf field in struct drm_gem_object is not stable over the object
instance's lifetime. The field becomes NULL when user space releases the
final GEM handle on the buffer object. This resulted in a NULL-pointer
deref.

Workarounds in commit 5307dce878d4 ("drm/gem: Acquire references on GEM
handles for framebuffers") and commit f6bfc9afc751 ("drm/framebuffer:
Acquire internal references on GEM handles") only solved the problem
partially. They especially don't work for buffer objects without a DRM
framebuffer associated.

v2:
- extended commit messages (Sima)
- drop the GEM-handle changes to be resolved separately

Thomas Zimmermann (7):
  Revert "drm/virtio: Use dma_buf from GEM object instance"
  Revert "drm/vmwgfx: Use dma_buf from GEM object instance"
  Revert "drm/etnaviv: Use dma_buf from GEM object instance"
  Revert "drm/prime: Use dma_buf from GEM object instance"
  Revert "drm/gem-framebuffer: Use dma_buf from GEM object instance"
  Revert "drm/gem-shmem: Use dma_buf from GEM object instance"
  Revert "drm/gem-dma: Use dma_buf from GEM object instance"

 drivers/gpu/drm/drm_gem_dma_helper.c         | 2 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 8 ++++++--
 drivers/gpu/drm/drm_gem_shmem_helper.c       | 4 ++--
 drivers/gpu/drm/drm_prime.c                  | 8 +++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c  | 4 ++--
 drivers/gpu/drm/virtio/virtgpu_prime.c       | 5 +++--
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c          | 6 +++---
 7 files changed, 24 insertions(+), 13 deletions(-)

-- 
2.50.0


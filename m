Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 535C63C9AB5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 10:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71AC6E59F;
	Thu, 15 Jul 2021 08:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682186E593;
 Thu, 15 Jul 2021 08:32:35 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1DAEB1FDE5;
 Thu, 15 Jul 2021 08:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626337954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cPRZqYFFDXsr1nfWshGUSVxlMQPbMs7W/lQIgkkruFA=;
 b=gexQKfyPGFYFbjrIf14YaOxc+fcjNjmRcgMsq0YFakTauMlMsSCRx8mn8F8L7uEBA1DiLf
 2Za5dGxGZeVne/EGB4ECWFuqNHydxS9Spv8D3a6fe3S6yIADZ3X8/ma5BBeoXaobx0IDc2
 WK6ZzkVDdMSP0EqnyTbtLjTrfmbDX8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626337954;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cPRZqYFFDXsr1nfWshGUSVxlMQPbMs7W/lQIgkkruFA=;
 b=TMiv4VBrwOFXpwUGUWNFRaHL7yti39ygzdgRQem82DGB3G5XYNDUJk1izlYVyCTKKUtAmb
 V71iTq0FHe7aiqDQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D4B1513AB1;
 Thu, 15 Jul 2021 08:32:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id TVcIMqHy72DocQAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jul 2021 08:32:33 +0000
Date: Thu, 15 Jul 2021 10:32:32 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <YO/yoFO+iSEqnIH0@linux-uq9g>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's the PR for drm-misc-fixes. I merged drm-misc-next-fixes into
it to pick up patches that were left over from the previous release
cycle. The vmwgfx change comes from that. The other patches fix
current errors.

Best regards
Thomas

drm-misc-fixes-2021-07-15:
Short summary of fixes pull (less than what git shortlog provides):

 * fbdev: Avoid use-after-free by not deleting current video mode
 * ttm: Avoid NULL-ptr deref in ttm_range_man_fini()
 * vmwgfx: Fix a merge commit
The following changes since commit 1e7b5812f4890ad84058bbb6c4a5deddfb2c5b25:

  Merge tag 'drm-misc-fixes-2021-07-13' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2021-07-13 15:15:17 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-07-15

for you to fetch changes up to 9e5c772954406829e928dbe59891d08938ead04b:

  drm/ttm: add a check against null pointer dereference (2021-07-14 17:16:16 +0200)

----------------------------------------------------------------
Short summary of fixes pull (less than what git shortlog provides):

 * fbdev: Avoid use-after-free by not deleting current video mode
 * ttm: Avoid NULL-ptr deref in ttm_range_man_fini()
 * vmwgfx: Fix a merge commit

----------------------------------------------------------------
Christian König (1):
      drm/qxl: add NULL check for bo->resource

Thomas Zimmermann (1):
      Merge remote-tracking branch 'drm-misc/drm-misc-next-fixes' into drm-misc-fixes

Zack Rusin (2):
      drm/vmwgfx: Fix implicit declaration error
      drm/vmwgfx: Fix a bad merge in otable batch takedown

Zhen Lei (1):
      fbmem: Do not delete the mode that is still in use

Zheyu Ma (1):
      drm/ttm: add a check against null pointer dereference

 drivers/gpu/drm/qxl/qxl_ttm.c           |  2 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c |  3 +++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c     |  1 -
 drivers/video/fbdev/core/fbmem.c        | 12 +++++-------
 5 files changed, 10 insertions(+), 9 deletions(-)

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer

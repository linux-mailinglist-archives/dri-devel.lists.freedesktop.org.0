Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9075C6D4250
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 12:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBC310E171;
	Mon,  3 Apr 2023 10:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E1610E3C7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 10:40:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 896811FDC1;
 Mon,  3 Apr 2023 10:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680518437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=koLStI/43m2vOElFCCJwnTfKs64RBtRLwtYU2PKOQ8Q=;
 b=lwwBTEq2hs7JAyC3SA6/38gpgHeW1fRyXwhigZEiwHx9MS7mvwyC28LRtS1lSwgClfzwTH
 +JLY+02xY4+QjX6PIg3BW4oeuFCUcVEQsbAXwObplt5nTyCfsuR8PKju7RiIIVqR28qcPl
 Evt+5XHZ+QRTsYImecdatQJCel503OM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680518437;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=koLStI/43m2vOElFCCJwnTfKs64RBtRLwtYU2PKOQ8Q=;
 b=VBBK0vuP371uArIZEVXcclyHCMCD1uTkCPeKEZDghjeL6OKVzQoZIdZeYISNEBaxlvXXdj
 AQLkU0f0RZtmTqCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 544C61331A;
 Mon,  3 Apr 2023 10:40:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YCujEyWtKmQsDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 10:40:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tomba@kernel.org, javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v2 0/5] drm/omapdrm: Convert fbdev to DRM client
Date: Mon,  3 Apr 2023 12:40:30 +0200
Message-Id: <20230403104035.15288-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
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

Convert omapdrm's fbdev code to struct drm_client. Replaces the current
ad-hoc integration. The conversion includes a number of cleanups. As
with most other drivers' fbdev emulation, fbdev in omapdrm is now just
another DRM client that runs after the DRM device has been registered.

Once all drivers' fbdev emulation has been converted to struct drm_client,
we can attempt to add additional in-kernel clients. A DRM-based dmesg
log or a bootsplash are commonly mentioned. DRM can then switch easily
among the existing clients if/when required.

I did the conversion from similar experience with other drivers. But I
don't have the hardware to test this. Any testing is welcome.

v2:
	* squashed patch 6 in to patch 5 (Tomi)
	* minor cleanups (Tomi)

Thomas Zimmermann (5):
  drm/omapdrm: Include <linux/of.h>
  drm/omapdrm: Remove fb from struct omap_fbdev
  drm/omapdrm: Remove bo from struct omap_fbdev
  drm/omapdrm: Remove fbdev from struct omap_drm_private
  drm/omapdrm: Implement fbdev emulation as in-kernel client

 drivers/gpu/drm/omapdrm/omap_debugfs.c |   6 +-
 drivers/gpu/drm/omapdrm/omap_drv.c     |  13 +-
 drivers/gpu/drm/omapdrm/omap_drv.h     |   3 -
 drivers/gpu/drm/omapdrm/omap_fbdev.c   | 163 ++++++++++++++++---------
 drivers/gpu/drm/omapdrm/omap_fbdev.h   |   9 +-
 5 files changed, 112 insertions(+), 82 deletions(-)

-- 
2.40.0


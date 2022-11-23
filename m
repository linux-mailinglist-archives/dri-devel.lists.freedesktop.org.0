Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6997635C37
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 12:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DE410E215;
	Wed, 23 Nov 2022 11:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205D210E215
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 11:53:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D35611F8C6;
 Wed, 23 Nov 2022 11:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669204430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2lVNhnyM3Y0Lhit9HnWwE5HyHFVdSkXnJ71T5p37umo=;
 b=Fa+RGOoumTIQ0N9UlHPCUdbU/YPcUnDEopE0IXfFN/scZ0F4RjcWtXc2TQDM21ET/7VpI6
 oqvzHeB2SS3OuRF9SeE4EvZXhVK4Bx9AxMMGDhR+PTy16dchCzwVnoO5G1kQF+e3vD34/j
 2PI6npDzKBLPJRoJqW/L1WjLuJ5eYek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669204430;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2lVNhnyM3Y0Lhit9HnWwE5HyHFVdSkXnJ71T5p37umo=;
 b=ncF3N2GgA21bYoG8J3IvVDZ8qc3wsVQGqRx6ipyEaOnO2+gqrkGsL/tZYSqg8RcUOQYSVF
 skPpaawaHsZ6zpDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7CEE513AE7;
 Wed, 23 Nov 2022 11:53:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pJvdHM4JfmMwVwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 23 Nov 2022 11:53:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, jstultz@google.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, paul.kocialkowski@bootlin.com, javierm@redhat.com,
 airlied@redhat.com, kraxel@redhat.com
Subject: [PATCH v2 0/7] drm: Fix the color-depth/bpp confusion
Date: Wed, 23 Nov 2022 12:53:41 +0100
Message-Id: <20221123115348.2521-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A number of drivers mix up the meaning of bits-per-pixel and color
depth. For each of them, set the correct values. As a rule of thumb,
the color depth is the number of color and alpha bits that affect
image composition. The bpp value is the color depth in the pixel
plus the filler bits.

The color depth is exported to userspace, while the bpp value only
affects fbdev emulation. Currently, fbdev fails if it selects a color
format that is unsupported by the driver. The fix would be to fall
back to a driver default value for the bpp. Getting the default fixed
in drivers will then allow us to fix the fbdev format selection.

v2:
	* leave out 15-bit color in logicvc (Javier)
	* minor typos (Javier)

Thomas Zimmermann (7):
  drm/hisilicon/hibmc: Fix preferred depth and bpp
  drm/logicvc: Fix preferred fbdev cpp
  drm/cirrus: Decouple fbdev bpp value from color depth
  drm/ofdrm: Set preferred depth from format of scanout buffer
  drm/simpledrm: Set preferred depth from format of scanout buffer
  drm/solomon: Set preferred color depth and bpp to the correct values
  drm/fb-helper: Don't use the preferred depth for the BPP default

 drivers/gpu/drm/drm_fbdev_generic.c             | 15 +++++++++------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c |  4 ++--
 drivers/gpu/drm/logicvc/logicvc_drm.c           | 13 ++++++++++++-
 drivers/gpu/drm/solomon/ssd130x.c               |  4 ++--
 drivers/gpu/drm/tiny/cirrus.c                   |  2 +-
 drivers/gpu/drm/tiny/ofdrm.c                    | 13 +------------
 drivers/gpu/drm/tiny/simpledrm.c                |  4 ++--
 7 files changed, 29 insertions(+), 26 deletions(-)

-- 
2.38.1


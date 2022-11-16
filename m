Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA86B62C37C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 17:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D9710E06E;
	Wed, 16 Nov 2022 16:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902AB10E4C9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 16:09:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0EBFA21FB5;
 Wed, 16 Nov 2022 16:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668614959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=vipZOzPoQPDQjgCFPl+oDJIgP90KYOCVcnA8zAJd68Q=;
 b=BT48xsaqswUVzixbLyHwgwiIGiazG+lCFd2AHmEM3en4+iONXiUWQ93KloqiJwrL6zbrwN
 gGgq5skJb3bARyS/iOpzbOq/T6ync1c4tp95zNC2dLCCUweoE1asPDVzunWGW7muW07f0e
 TSe7dZHSCSn4I6Mjjvy6mxozSdfjmT8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668614959;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=vipZOzPoQPDQjgCFPl+oDJIgP90KYOCVcnA8zAJd68Q=;
 b=Hy7+yICynZv5qj7ea8/zsrf8iPYHOoJOHeLTQVt3YqhTeWVY/NsH9lwtGzQsYzVroyGeXy
 9APgTWHcUUSmztAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9688134CE;
 Wed, 16 Nov 2022 16:09:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eQZaLC4LdWP/fwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 16 Nov 2022 16:09:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, jstultz@google.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, paul.kocialkowski@bootlin.com, javierm@redhat.com,
 airlied@redhat.com, kraxel@redhat.com
Subject: [PATCH 0/7] drm: Fix the color-depth/bpp confusion
Date: Wed, 16 Nov 2022 17:09:10 +0100
Message-Id: <20221116160917.26342-1-tzimmermann@suse.de>
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
 drivers/gpu/drm/logicvc/logicvc_drm.c           | 14 +++++++++++++-
 drivers/gpu/drm/solomon/ssd130x.c               |  4 ++--
 drivers/gpu/drm/tiny/cirrus.c                   |  2 +-
 drivers/gpu/drm/tiny/ofdrm.c                    | 13 +------------
 drivers/gpu/drm/tiny/simpledrm.c                |  4 ++--
 7 files changed, 30 insertions(+), 26 deletions(-)

-- 
2.38.1


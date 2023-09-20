Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D477A7A867B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 16:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560D610E16A;
	Wed, 20 Sep 2023 14:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4160F10E4D5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 14:25:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DAAFC21DB2;
 Wed, 20 Sep 2023 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695219937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tOtyCRyWrcBas4mGagVDJKoHLbEPzWs/jq9Jx83IFEc=;
 b=ztcBlZM9ZsUNt1knEZcik5U1Zx/80Mlktq63UdVN6+6o4LsCvJtwDovBIYwlNlbwvbfVkz
 3csA9+CScCgs8ypIEpIw9o5XsOjbF5NMPTCL2Qs7H2gie2Qy/7lH2h0nvOOFtoOOLpsv8m
 Ecq7ySkH2E9Pz/R4MBYvrd93S1Bm7jo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695219937;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tOtyCRyWrcBas4mGagVDJKoHLbEPzWs/jq9Jx83IFEc=;
 b=acvbOcKnRVEFcVr6UCzBuyAti/CFtmv+xSABvBK6GBUHrv9oN3WPplXi+75aj55FBwe0Nh
 BEzPp1lILlsoLlCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 976821333E;
 Wed, 20 Sep 2023 14:25:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tweRI+EAC2W+IQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Sep 2023 14:25:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH v2 0/5] drm: Reuse temporary memory for format conversion
Date: Wed, 20 Sep 2023 16:24:26 +0200
Message-ID: <20230920142535.19321-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

DRM's format-conversion helpers require temporary memory. Pass the
buffer from the caller and keep it allocated over several calls. Allow
the caller to preallocate the buffer memory.

The motivation for this patchset is the recent work on a DRM panic
handler. The panic handler requires format conversion to display an
error to the screen. But allocating memory during kernel panics is
fragile. The changes in this patchset enable the DRM panic handler to
preallocate buffer storage before the panic occurs.

As an additonal benefit, drivers can now keep the temporary storage
across multiple display updates. Avoiding memory allocation reduces
the CPU overhead of the format helpers.

Patch 1 adds struct drm_xfrm_buf, a simple interface to pass around
the buffer storage. Patch 2 moves the memory management from the format
helpers into their callers. Drivers release the temporary storage at
the end of their display-update functions.

Patches 3 to 8 update three drivers to keep the allocated memory for
all of a device's lifetime. Managed cleanup releases the buffer as part
of releaseing the device. As additional benefit, buffer allocation now
happens in atomic_check helpers. The driver thus detects OOM errors
before the display update begins.

Tested with simpledrm.

v2:
	* reserve storage during probing in the drivers

Thomas Zimmermann (5):
  drm/format-helper: Add struct drm_xfrm_buf to cache format conversion
  drm/format-helper: Pass xfrm buffer to format-conversion helpers
  drm/simpledrm: Store xfrm buffer in device instance
  drm/ofdrm: Store xfrm buffer in device instance
  drm/ssd130x: Store xfrm buffer in device instance

 drivers/gpu/drm/drm_format_helper.c           | 204 +++++++++++++-----
 drivers/gpu/drm/drm_mipi_dbi.c                |   7 +-
 drivers/gpu/drm/gud/gud_pipe.c                |  21 +-
 drivers/gpu/drm/solomon/ssd130x.c             |  16 +-
 drivers/gpu/drm/solomon/ssd130x.h             |   3 +
 .../gpu/drm/tests/drm_format_helper_test.c    |  33 +--
 drivers/gpu/drm/tiny/cirrus.c                 |   5 +-
 drivers/gpu/drm/tiny/ofdrm.c                  |  11 +-
 drivers/gpu/drm/tiny/repaper.c                |   5 +-
 drivers/gpu/drm/tiny/simpledrm.c              |  11 +-
 drivers/gpu/drm/tiny/st7586.c                 |   5 +-
 include/drm/drm_format_helper.h               |  74 +++++--
 12 files changed, 300 insertions(+), 95 deletions(-)

-- 
2.42.0


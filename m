Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 657CD7A7A59
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 13:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525D610E484;
	Wed, 20 Sep 2023 11:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BA710E484
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 11:25:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4D34421CB1;
 Wed, 20 Sep 2023 11:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695209110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hMWPykeNYomlrw4mSk/QxfH3QrYdCsuOWl0xW7cvi8Y=;
 b=krTiOakw0c+BkZUpIWn3kSk7Ck8XVx3KmEswhhdbeDOMe23PXyYz+q1BnPtE9a874YxSS5
 pF3f2Xy1jVIugi0HJDbBvTkhfjawve7olQK4uco3Dt31kG7nin1HNeQAxoNOk2jqWvycMJ
 KaeYV84tarFXjV9a49g+M19o0E+Lm48=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695209110;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hMWPykeNYomlrw4mSk/QxfH3QrYdCsuOWl0xW7cvi8Y=;
 b=cfFGhfWJTrYRwn78NbIWvv6AX23+09bVfc1NE3KqGvZyr06Kv4RlzCwXgw9At6qvikqS40
 dVykgbBK0WhmDFDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 10D321333E;
 Wed, 20 Sep 2023 11:25:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ac7yApbWCmX3NwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Sep 2023 11:25:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH 0/8] drm: Reuse temporary memory for format conversion
Date: Wed, 20 Sep 2023 13:10:12 +0200
Message-ID: <20230920112508.11770-1-tzimmermann@suse.de>
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

Thomas Zimmermann (8):
  drm/format-helper: Add struct drm_xfrm_buf to cache format conversion
  drm/format-helper: Pass xfrm buffer to format-conversion helpers
  drm/simpledrm: Store xfrm buffer in device instance
  drm/simpledrm: Preallocate xfrm buffer in plane's atomic_check
  drm/ofdrm: Store xfrm buffer in device instance
  drm/ofdrm: Preallocate xfrm buffer in plane's atomic_check
  drm/ssd130x: Store xfrm buffer in device instance
  drm/ssd130x: Preallocate xfrm buffer in plane's atomic_check

 drivers/gpu/drm/drm_format_helper.c           | 204 +++++++++++++-----
 drivers/gpu/drm/drm_mipi_dbi.c                |   7 +-
 drivers/gpu/drm/gud/gud_pipe.c                |  21 +-
 drivers/gpu/drm/solomon/ssd130x.c             |  31 ++-
 drivers/gpu/drm/solomon/ssd130x.h             |   3 +
 .../gpu/drm/tests/drm_format_helper_test.c    |  33 +--
 drivers/gpu/drm/tiny/cirrus.c                 |   5 +-
 drivers/gpu/drm/tiny/ofdrm.c                  |  18 +-
 drivers/gpu/drm/tiny/repaper.c                |   5 +-
 drivers/gpu/drm/tiny/simpledrm.c              |  45 +++-
 drivers/gpu/drm/tiny/st7586.c                 |   5 +-
 include/drm/drm_format_helper.h               |  74 +++++--
 12 files changed, 352 insertions(+), 99 deletions(-)

-- 
2.42.0


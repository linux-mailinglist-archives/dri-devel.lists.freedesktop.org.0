Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 144D25AD49A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 16:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1FB10E3B3;
	Mon,  5 Sep 2022 14:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6115D10E3AF
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 14:16:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 08DC2339E2;
 Mon,  5 Sep 2022 14:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662387410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=BijUO8nAqxA2goWJW3J3bePW4O+WKXrOaY0fGWKcp6Y=;
 b=mooH5+vb4hpOkqZjHvttYROnsIs4pbOfKkRi3DPZlFQyANAnJ2ffNjsU6I3jq0bUdHRh9N
 pf/aobmFX3T1OTysy6v15qh7EOn50Qwin3v7yr966TJOffoXApKJ9kuFIZYJKD7dQG3QIA
 Ve+WhtzT9RQjAvxpZYVKFn/ynBz8JH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662387410;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=BijUO8nAqxA2goWJW3J3bePW4O+WKXrOaY0fGWKcp6Y=;
 b=J+n/zG0KjJq0K4/7P0MSlOcCJ2lWzRDnwdATIT5Vppp4WZj+xpn3bZl2jbvt7t7moPqLDg
 0lVhk5RFyGkJmsAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BF51B13A66;
 Mon,  5 Sep 2022 14:16:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tkG4LdEEFmMoNwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Sep 2022 14:16:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, sam@ravnborg.org, noralf@tronnes.org, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 emma@anholt.net, kamlesh.gurudasani@gmail.com, david@lechnology.com
Subject: [PATCH v3 0/4] drm/probe-helper,
 modes: Helpers for single-mode displays
Date: Mon,  5 Sep 2022 16:16:44 +0200
Message-Id: <20220905141648.22013-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.2
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

This patchset moves code from simpledrm to probe and display-mode
helpers. The new functions will be useful for the upcoming driver
for PowerPC displays. [1] Where possible, existing drivers are
being converted to use them.

v3:
	* better warnings in drm_fb_build_fourcc_list() (Sam)
	* fix docs (kernel test robot)
v2:
	* replace 'static' and 'hw' naming with 'fixed'
	* use u32 for 4CC codes (Sam)
	* print a warning if not all formats can be used (Sam)
	* comment fixes (Sam)

[1] https://patchwork.freedesktop.org/series/106538/

Thomas Zimmermann (4):
  drm/probe-helper: Add drm_connector_helper_get_modes_fixed()
  drm/probe-helper: Add drm_crtc_helper_mode_valid_fixed()
  drm/modes: Add initializer macro DRM_MODE_INIT()
  drm/format-helper: Add drm_fb_build_fourcc_list() helper

 drivers/gpu/drm/drm_format_helper.c          | 108 +++++++++++++++++++
 drivers/gpu/drm/drm_mipi_dbi.c               |  38 +++----
 drivers/gpu/drm/drm_probe_helper.c           |  65 +++++++++++
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c |   1 +
 drivers/gpu/drm/tiny/hx8357d.c               |   1 +
 drivers/gpu/drm/tiny/ili9163.c               |   1 +
 drivers/gpu/drm/tiny/ili9341.c               |   1 +
 drivers/gpu/drm/tiny/ili9486.c               |   1 +
 drivers/gpu/drm/tiny/mi0283qt.c              |   1 +
 drivers/gpu/drm/tiny/panel-mipi-dbi.c        |   1 +
 drivers/gpu/drm/tiny/repaper.c               |  26 ++---
 drivers/gpu/drm/tiny/simpledrm.c             |  96 +++--------------
 drivers/gpu/drm/tiny/st7735r.c               |   1 +
 include/drm/drm_format_helper.h              |  11 +-
 include/drm/drm_mipi_dbi.h                   |   2 +
 include/drm/drm_modes.h                      |  35 +++++-
 include/drm/drm_probe_helper.h               |   9 +-
 17 files changed, 276 insertions(+), 122 deletions(-)


base-commit: f2c3a05d33693ad51996fa7d12d3b2d4b0f372eb
-- 
2.37.2


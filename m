Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02730595DAB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 15:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19EE94380;
	Tue, 16 Aug 2022 13:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A78AD33E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 13:48:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C89181FD77;
 Tue, 16 Aug 2022 13:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660657734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zs56Ss/bzwM57cfE6M1+UtWjH0EThvHzVH62RNeSXtE=;
 b=NFrrhA72Zo9sPhcPrtaLSez4vCGficHsFDZyizmweUMNZI54oLbK3/w++jAZlHYwWGAnlA
 QZCAX19cM9k+COME/hu/DmcAdZekt7zpg76l5HBidMBRr6xVyjVIkruG99jINF9dup1FzI
 xyV9qos0KF7zJxZGy7MBRUntWdxWqUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660657734;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zs56Ss/bzwM57cfE6M1+UtWjH0EThvHzVH62RNeSXtE=;
 b=B2o06dZU4S6NWCjDjQFFp1UYB5fvXgR4lsgKzuz7Ohocs9P+m/0ENUloqPk8+SnHDw0AMB
 nAdoD3h5vfdneYDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7911C139B7;
 Tue, 16 Aug 2022 13:48:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tvOEHEag+2KOcwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 16 Aug 2022 13:48:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, sam@ravnborg.org, noralf@tronnes.org, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 emma@anholt.net, kamlesh.gurudasani@gmail.com, david@lechnology.com
Subject: [PATCH v2 0/4] drm/probe-helper,
 modes: Helpers for single-mode displays
Date: Tue, 16 Aug 2022 15:48:49 +0200
Message-Id: <20220816134853.12468-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
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

 drivers/gpu/drm/drm_format_helper.c          | 103 +++++++++++++++++++
 drivers/gpu/drm/drm_mipi_dbi.c               |  38 +++----
 drivers/gpu/drm/drm_probe_helper.c           |  65 ++++++++++++
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
 include/drm/drm_modes.h                      |  35 ++++++-
 include/drm/drm_probe_helper.h               |   9 +-
 17 files changed, 271 insertions(+), 122 deletions(-)

-- 
2.37.1


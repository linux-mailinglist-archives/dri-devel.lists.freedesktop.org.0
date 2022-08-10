Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8694258EB22
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 13:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6ABA0349;
	Wed, 10 Aug 2022 11:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A390DB1607
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 11:20:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 075DB1F74D;
 Wed, 10 Aug 2022 11:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660130455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lcKNqOKVAPhvH3IoynIqsz4Es5ZrTuxOZigvE4DGbrY=;
 b=XGx/Wg4jt/aNJZun8IlIF1orFYqDZu5A1hQg7+6d2Tt7JOowXrwGAl9IfpZrvEAFTgE2zg
 8UW7uv2VBqs4An7ih4GUZwYCyxo1mF6pVXGDqtFdiU6tsV0Yw/DkX9/MzvV41y8dqCB0l1
 etseZKBM/UQhEk5jh0zwNCStAGlF1Vk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660130455;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lcKNqOKVAPhvH3IoynIqsz4Es5ZrTuxOZigvE4DGbrY=;
 b=YfG3A9ozgVatNY7nl5egA6rvz5tjvh7MBiJWMJZdbSjtKfJpOvVAJQW+jGfRNGH2IrHE49
 N62EDb89lfxjjPDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BE7D613A7E;
 Wed, 10 Aug 2022 11:20:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id A3+fLZaU82KAVQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Aug 2022 11:20:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, sam@ravnborg.org, noralf@tronnes.org, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 emma@anholt.net, kamlesh.gurudasani@gmail.com, david@lechnology.com
Subject: [PATCH 0/4] drm/probe-helper, modes: Helpers for single-mode displays
Date: Wed, 10 Aug 2022 13:20:49 +0200
Message-Id: <20220810112053.19547-1-tzimmermann@suse.de>
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
helpers. The new functions will be useful for the upcomming driver
for PowerPC displays. [1] Where possible, existing drivers are
being converted to use them.

[1] https://patchwork.freedesktop.org/series/106538/

Thomas Zimmermann (4):
  drm/probe-helper: Add drm_connector_helper_get_modes_static()
  drm/probe-helper: Add drm_crtc_helper_mode_valid_static()
  drm/modes: Add initializer macro DRM_MODE_INIT()
  drm/format-helper: Add drm_fb_build_fourcc_list() helper

 drivers/gpu/drm/drm_format_helper.c          | 94 +++++++++++++++++++
 drivers/gpu/drm/drm_mipi_dbi.c               | 38 ++++----
 drivers/gpu/drm/drm_probe_helper.c           | 65 +++++++++++++
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c |  1 +
 drivers/gpu/drm/tiny/hx8357d.c               |  1 +
 drivers/gpu/drm/tiny/ili9163.c               |  1 +
 drivers/gpu/drm/tiny/ili9341.c               |  1 +
 drivers/gpu/drm/tiny/ili9486.c               |  1 +
 drivers/gpu/drm/tiny/mi0283qt.c              |  1 +
 drivers/gpu/drm/tiny/panel-mipi-dbi.c        |  1 +
 drivers/gpu/drm/tiny/repaper.c               | 26 +++---
 drivers/gpu/drm/tiny/simpledrm.c             | 96 +++-----------------
 drivers/gpu/drm/tiny/st7735r.c               |  1 +
 include/drm/drm_format_helper.h              | 11 ++-
 include/drm/drm_mipi_dbi.h                   |  2 +
 include/drm/drm_modes.h                      | 35 ++++++-
 include/drm/drm_probe_helper.h               |  9 +-
 17 files changed, 262 insertions(+), 122 deletions(-)

-- 
2.37.1


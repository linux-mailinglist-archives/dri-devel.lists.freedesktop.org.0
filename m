Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F1451FA0D
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 12:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F6E10E967;
	Mon,  9 May 2022 10:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F3810E92C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 10:35:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6340D1FA06;
 Mon,  9 May 2022 10:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652092558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=cVmL313MjPem/So2ZdfHsCGSQ3RpgPdARlPy3noMXpc=;
 b=DgY0oYXi0G+75lHmb9eKJ9QpgnkLPinaDzFJpDjUKlxZ2DUJGbIC2Y5DUV9gFz2hqyFeET
 lttHTSpczb4aprPVXEchBnr2ZxDA6wF0DHe6Be3jE9+xD6BElFleqkqhy0acYqkmwQ5CN+
 Im3dUDgkjCcv8jWtEfU7ejVZHiEtP9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652092558;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=cVmL313MjPem/So2ZdfHsCGSQ3RpgPdARlPy3noMXpc=;
 b=YUVgPUBxUrhxohiAIMYXdK5H1CbERbGKkKb0Xh0A0xtoCv7tEmhjlYpuupDD1PcxIEgLZu
 gjXRvva1lmW2ZXAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E0BE132C0;
 Mon,  9 May 2022 10:35:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WvFoCo7ueGJ9AgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 May 2022 10:35:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH 0/7] drm/mgag200: Various cleanups
Date: Mon,  9 May 2022 12:35:47 +0200
Message-Id: <20220509103554.11996-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
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

Various small fixes and clean-up patches for mgag200. Tested on
Matrix G200EH hardware.

Thomas Zimmermann (7):
  drm:/mgag200: Acquire I/O lock while reading EDID
  drm/mgag200: Fail on I2C initialization errors
  drm/mgag200: Implement connector's get_modes with helper
  drm/mgag200: Switch I2C code to managed cleanup
  drm/mgag200: Remove struct mga_connector
  drm/mgag200: Test memory requirements in
    drm_mode_config_funcs.mode_valid
  drm/mgag200: Split up connector's mode_valid helper

 drivers/gpu/drm/drm_probe_helper.c     |  33 ++++
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  13 +-
 drivers/gpu/drm/mgag200/mgag200_i2c.c  |  32 ++-
 drivers/gpu/drm/mgag200/mgag200_mode.c | 259 +++++++++++--------------
 include/drm/drm_probe_helper.h         |   2 +
 5 files changed, 166 insertions(+), 173 deletions(-)


base-commit: b0b93865a24c910fcbfa6e6fa0955fae930a56d3
-- 
2.36.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5056B52859C
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 15:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A3E10F5F6;
	Mon, 16 May 2022 13:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D6A10EED0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 13:40:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9870D1F8D8;
 Mon, 16 May 2022 13:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652708417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SwkM/d997tOonoBR2ywuaXUfUNSQQMaRBQ16cdVisT0=;
 b=ocMHrS+U7mHl9c+DmxNTk/EXyIkLQLEVt3gitdXGe5r6UTKxlDNn/DybUW2nqTU1NMq1ZD
 lcsseLs/9aSMjktvqViM1cjAkX7BeaYWEljaEFAiMV7Y/b+qDe0s+kgJUSCQ9BnO/w2RlF
 VfpYvjWbzsAPx/4tiiihHmQVwDQapKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652708417;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SwkM/d997tOonoBR2ywuaXUfUNSQQMaRBQ16cdVisT0=;
 b=HX069oR27t11KGcb8iguptNGnvheQwQsHqIzbVQ3czlRDmp2aXAiW7gbezJEOZO07+jizD
 tF+3nujZEF+KV/Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F4DE13ADC;
 Mon, 16 May 2022 13:40:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wS1YFkFUgmIpAwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 16 May 2022 13:40:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 0/7] drm/mgag200: Various cleanups
Date: Mon, 16 May 2022 15:40:08 +0200
Message-Id: <20220516134015.5845-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
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

v2:
	* comment on memory constraints on early G200SE-A
	* fix connector DDC helper

Thomas Zimmermann (7):
  drm:/mgag200: Acquire I/O lock while reading EDID
  drm/mgag200: Fail on I2C initialization errors
  drm/mgag200: Implement connector's get_modes with helper
  drm/mgag200: Switch I2C code to managed cleanup
  drm/mgag200: Remove struct mga_connector
  drm/mgag200: Test memory requirements in
    drm_mode_config_funcs.mode_valid
  drm/mgag200: Split up connector's mode_valid helper

 drivers/gpu/drm/drm_probe_helper.c     |  36 ++++
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  13 +-
 drivers/gpu/drm/mgag200/mgag200_i2c.c  |  32 ++-
 drivers/gpu/drm/mgag200/mgag200_mode.c | 259 +++++++++++--------------
 include/drm/drm_probe_helper.h         |   2 +
 5 files changed, 169 insertions(+), 173 deletions(-)

-- 
2.36.1


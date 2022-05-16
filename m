Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E45285AC
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 15:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCA410E505;
	Mon, 16 May 2022 13:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1771010E505
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 13:43:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AFDD41F8D8;
 Mon, 16 May 2022 13:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652708624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=k1pJ9H8FKjIOhFKMhvGH7To7qJ7svHaTTAEONDGs7KA=;
 b=Sc1uslPR3GhQioQXmA+D92BaXcrS1LWhffMQxItzSX+4YpIIXcJMP+mBjgIpvZtEcUL9HR
 tXfATx+VKhoQTss9GfkeSybuC88e34blaTG0knqAg9Y1npFH2yiwkGQAeS1+CZBUYXPrM+
 TAmi7VqwHk4jBP9hSmPrLH86uy43O5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652708624;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=k1pJ9H8FKjIOhFKMhvGH7To7qJ7svHaTTAEONDGs7KA=;
 b=YQ1UuJLaROGvkbihR/vmg97YPzsAd32DKp/Ldoajofh6Uo/iqqVB7+bqudw0XlzYbs5+Ae
 pNmqeKSxoK0OIhAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 80BFC13ADC;
 Mon, 16 May 2022 13:43:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dz5xHhBVgmLtBAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 16 May 2022 13:43:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH v3 0/7] drm/mgag200: Various cleanups
Date: Mon, 16 May 2022 15:43:36 +0200
Message-Id: <20220516134343.6085-1-tzimmermann@suse.de>
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

v3:
	* fix commit message in 1/7 to say 'drm/mgag200' (Jocelyn)
v2:
	* comment on memory constraints on early G200SE-A
	* fix connector DDC helper

Thomas Zimmermann (7):
  drm/mgag200: Acquire I/O lock while reading EDID
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


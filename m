Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088453B9D2D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 09:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828BA89F89;
	Fri,  2 Jul 2021 07:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F9389F89
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 07:56:45 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C02D7228DF;
 Fri,  2 Jul 2021 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625212603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=T4ENtuw4fLE02SDGJF3LuMgGlwwLlrYvNQWofXHvyxI=;
 b=krNRtoHjXb1l0YrsSGQfhCfESYRKswJR+Em9ib6r9DF6uUlIHgThmnlnwo8Z6mIfPe1hIy
 7DGz9WsAGbB/GLagmL+zS72AOlOS7JcMzt/TCYe7HjkntzWk0MNSu+VzVmAn33ZIkVNZNJ
 hDQrpRgfm+t46O4cjWWtm3pP1nM3sGI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625212603;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=T4ENtuw4fLE02SDGJF3LuMgGlwwLlrYvNQWofXHvyxI=;
 b=4zCyVFTwASXLWX+cnY1ssj3WyMA3ltOgOROC5zWwoUbQgW1yfQGmTcRhqqv36DHiHZpY4Z
 XcpEk3nnBKE5HvBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 915F111CD6;
 Fri,  2 Jul 2021 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625212603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=T4ENtuw4fLE02SDGJF3LuMgGlwwLlrYvNQWofXHvyxI=;
 b=krNRtoHjXb1l0YrsSGQfhCfESYRKswJR+Em9ib6r9DF6uUlIHgThmnlnwo8Z6mIfPe1hIy
 7DGz9WsAGbB/GLagmL+zS72AOlOS7JcMzt/TCYe7HjkntzWk0MNSu+VzVmAn33ZIkVNZNJ
 hDQrpRgfm+t46O4cjWWtm3pP1nM3sGI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625212603;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=T4ENtuw4fLE02SDGJF3LuMgGlwwLlrYvNQWofXHvyxI=;
 b=4zCyVFTwASXLWX+cnY1ssj3WyMA3ltOgOROC5zWwoUbQgW1yfQGmTcRhqqv36DHiHZpY4Z
 XcpEk3nnBKE5HvBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id xTgOIrvG3mBSDwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 02 Jul 2021 07:56:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@redhat.com,
	sam@ravnborg.org
Subject: [PATCH v2 0/4] mgag200: Various cleanups
Date: Fri,  2 Jul 2021 09:56:38 +0200
Message-Id: <20210702075642.27834-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
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

Cleanup several nits in the driver's init code. Also move constant
data into the RO data segment. No functional changes.

Tested on mgag200 HW.

v2:
	* update changelog (Sam)

Thomas Zimmermann (4):
  drm/mgag200: Don't pass flags to drm_dev_register()
  drm/mgag200: Inline mgag200_device_init()
  drm/mgag200: Extract device type and flags in mgag200_pci_probe()
  drm/mgag200: Constify LUT for programming bpp

 drivers/gpu/drm/mgag200/mgag200_drv.c  | 62 +++++++++++++-------------
 drivers/gpu/drm/mgag200/mgag200_drv.h  | 14 ------
 drivers/gpu/drm/mgag200/mgag200_mode.c | 16 +++----
 3 files changed, 36 insertions(+), 56 deletions(-)

--
2.32.0


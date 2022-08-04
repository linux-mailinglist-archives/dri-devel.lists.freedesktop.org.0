Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A47A5898E6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 09:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356DB9076C;
	Thu,  4 Aug 2022 07:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D633690336
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 07:58:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B16443745A;
 Thu,  4 Aug 2022 07:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659599913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WsPHXUyR5svouL2wdPIh4vTdx2ko6UbWtKcIEYKt+Bg=;
 b=hJul8wcNtwKy5log79W9x8J/1P3jd2Bas9ZJvMywg10BumVT5TCkDuk0h2SQHuPdAJAvNO
 5oT4C0B8MaCNh/mlIztLHECfWKiuXVDoyRLaKmTarqrmyTwC41ZyXxgi1Qj3J1f7dSFaOE
 LHcg58SGFd85hDgvFTZcCZxUTQhxlGk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659599913;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WsPHXUyR5svouL2wdPIh4vTdx2ko6UbWtKcIEYKt+Bg=;
 b=0cwHv9Gczc7T10d56RWREKwdS6Bgev2S8czj41iT2ObiarjW8XZq+ygnhgiPNPawdjAR2E
 iYCSdv8L4MBohEBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8AB1A13AE1;
 Thu,  4 Aug 2022 07:58:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JOULISl862IlJAAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 04 Aug 2022 07:58:33 +0000
From: Takashi Iwai <tiwai@suse.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm/udl: Fix stray URBs and cleanup
Date: Thu,  4 Aug 2022 09:58:22 +0200
Message-Id: <20220804075826.27036-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this is a series of fixes for UDL driver to address the leftover URBs
at suspend/resume.  It begins with the simplification of FIFO control
code with the standard wait queue, followed by the handling of pending
URBs, and replace BUG_ON() with WARN_ON() as a cleanup.


Takashi

===

Takashi Iwai (4):
  drm/udl: Replace semaphore with a simple wait queue
  drm/udl: Sync pending URBs at suspend / disconnect
  drm/udl: Kill pending URBs at suspend and disconnect
  drm/udl: Replace BUG_ON() with WARN_ON()

 drivers/gpu/drm/udl/udl_drv.h      |  14 +++-
 drivers/gpu/drm/udl/udl_main.c     | 125 ++++++++++++++---------------
 drivers/gpu/drm/udl/udl_modeset.c  |   4 +
 drivers/gpu/drm/udl/udl_transfer.c |   3 +-
 4 files changed, 79 insertions(+), 67 deletions(-)

-- 
2.35.3


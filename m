Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A62A6FC9D4
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 17:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88AAA10E386;
	Tue,  9 May 2023 15:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D588E10E023
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 15:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jHa6CPDFuj+jx40hNfLAmMtwCq8EHXIxRo6PzzN2Gck=; b=SYCyeIQ2QII/9xh5k1eXBEa1A5
 dku+ea1M7sPSF/XGUHPk++tZjXsCfKaPJxVZZwI+R930jfdz787J0ROOW3nLvG9fahZNeuPXpFtSD
 Oe3SgJa3NzbNbYQCCxJO5cP/r4HN9rkTkSqj82YAqfm7iz9i7wgobKJYVv0UjvuXzyuZParCzuF6Z
 u6+K+OUz4lJ1L600NUErLjj1cByn/CPK2z63K40um3O+piJCqsZpxlNl8BETEjeW3eUQYou0NI7WW
 rK/d8jaYh+0aEOSS0X+ceO4eGoGtOnlTruY+MqQPbV1FtAaM15CfxBpSSupCOsh/Ct8RT0y4EI+AC
 22Hzgu7g==;
Received: from 179-241-20-132.3g.claro.net.br ([179.241.20.132] helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pwOuQ-004xfg-MO; Tue, 09 May 2023 17:05:47 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH 0/2] drm/vkms: Enable Virtual Hardware support
Date: Tue,  9 May 2023 12:04:59 -0300
Message-Id: <20230509150501.81875-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.40.1
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset is a rebase of a series sent a while ago that intended
to enable virtual hardware support on the VKMS. The original patchset,
developed by Sumera Priyadarsini, is available on [1].

From the original patchset, not much has changed. It was essentially
just rebasing the code to the new VKMS composition structure.

The virtual hardware mode can be enabled by using the following
command:
    modprobe vkms enable_virtual_hw=1

The first patch is prep-work for adding the virtual HW mode. It
refactors the plane composition in VKMS by adding a helper function
vkms_composer_common() which can be used for both vblank-mode and
vblankless-mode.

The second patch adds the virtual hardware support as a module
parameter option. It adds a new atomic helper functions for the
virtual mode and uses the existing atomic helpers for vblank mode.
This gives us two sets of drm_crtc_funcs and drm_crtc_helper_funcs
structs for both modes, making the code flow cleaner and easier to
debug.

This patchset has been tested with the following IGT tests:
kms_writeback, kms_atomic, kms_lease, and kms_flip and preserves
results, except for subtests related to CRC reads and vertical
blanking. In which case, tests skip or fail.

[1] https://patchwork.freedesktop.org/series/93277/

Best Regards,
- Maíra Canal

Maíra Canal (1):
  drm/vkms: Refactor vkms_composer_worker() as preparation for virtual HW

Sumera Priyadarsini (1):
  drm/vkms: Add support for Virtual Hardware mode

 drivers/gpu/drm/vkms/vkms_composer.c  | 55 ++++++++++++++++++++-------
 drivers/gpu/drm/vkms/vkms_crtc.c      | 38 ++++++++++++++++--
 drivers/gpu/drm/vkms/vkms_drv.c       | 16 ++++++--
 drivers/gpu/drm/vkms/vkms_drv.h       |  2 +
 drivers/gpu/drm/vkms/vkms_writeback.c |  8 +++-
 5 files changed, 97 insertions(+), 22 deletions(-)

-- 
2.40.1


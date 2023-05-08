Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A036FA1A0
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 09:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF23310E139;
	Mon,  8 May 2023 07:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F7D10E106
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 07:54:02 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f05:8115:9300:9eb6:d0ff:fe91:8037])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5FC706603232;
 Mon,  8 May 2023 08:53:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1683532440;
 bh=11SkSAyKOmL3uxYuvs//YeaeAKEWXNjZfXGo5TEkTuc=;
 h=From:To:Cc:Subject:Date:From;
 b=M+pnJ7S6hakLD3oW/atzCa5e5zeroFFOtnktTdQ2+QKa1R19vOGEKyav1VFCQT7Mo
 cvKNTvdXTDd3ghN0t47w5FA3i02hEyNhcmD2PrXf/xtiQL8ThG2Cixw5Ow/mv6HI8g
 D3wk3yFB+Jmxb3hVksJtBfetPHSfwCq++gHjbYclsJxBdwGOIeQ6cMw4Aimr/ldG94
 JWLRyLWy27Bhy6+LIAaw27UsFO2a+3vCcqXR3BGICl1UTrkfQkOJ11WWd/7wsrIM8R
 gql52gfc7ywlaMOGWd81wQSUaFVoberfX5r0GqUzYoVA8c1HINKv6/wEXsvqorKICY
 j14PyZCzmsLsg==
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/4] drm/vkms: Add support for multiple pipes
Date: Mon,  8 May 2023 10:53:52 +0300
Message-Id: <20230508075356.6511-1-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.39.2
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
Cc: mwen@igalia.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 yixie@chromium.org, mcanal@igalia.com, melissa.srw@gmail.com,
 jshargo@chromium.org, brpol@chromium.org, marius.vlad@collabora.com,
 igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With multiple pipe available we can perform management of outputs at
a more granular level, such that we're able to turn off or on several
outputs at a time, or combinations that arise from doing that. 

The Weston project use VKMS when running its test suite in CI, and we
have now uses cases which would need to ability to set-up the outputs
DPMS/state individually, rather than globally -- which would affect all
outputs. This an attempt on fixing that by giving the possibility to
create more than one pipe, and thus allowing to run tests that could
exercise code paths in the compositor related to management of outputs.

v5:
  - Rather than shrinking the number of pipes to a maximum of 3, adjust
    the maximum overlay planes we can have. Adds a new patch to allow
    doing that. (Maíra Canal)

v4:
  - Avoid a WARN_ON() in __drm_universal_plane_init() that happens when 
  passing 4 pipes together with overlay planes enabled. (Maíra Canal)
  - Another rebase on top of drm-misc-next

v3:
  - Apply the series against drm-misc-next (Maíra Canal)
  - Add a lower range check to avoid passing negative values to
  max_pipes (Maíra Canal)

v2:
  - Replace 'outputs' with 'pipes' as to use the proper terminology 
    (Thomas Zimmermann, Maíra Canal)
  - Fixed passing wrong possible_crtc bitmask when initializing the
    write back connector which address kms_writeback failure (Maíra Canal)
  - Add a feat. note about moving overlay planes between CRTCs (Melissa Wen)

Marius Vlad (4):
  vkms: Pass the correct bitmask for possible crtcs
  drm/vkms: Add overlay_planes config
  vkms: Add support for multiple pipes
  Documentation/gpu/vkms.rst: Added a note about plane migration

 Documentation/gpu/vkms.rst            |  5 ++--
 drivers/gpu/drm/vkms/vkms_crtc.c      |  3 +--
 drivers/gpu/drm/vkms/vkms_drv.c       | 39 ++++++++++++++++++++++-----
 drivers/gpu/drm/vkms/vkms_drv.h       | 13 ++++++---
 drivers/gpu/drm/vkms/vkms_output.c    |  9 +++----
 drivers/gpu/drm/vkms/vkms_writeback.c | 24 ++++++++---------
 6 files changed, 63 insertions(+), 30 deletions(-)

-- 
2.39.2


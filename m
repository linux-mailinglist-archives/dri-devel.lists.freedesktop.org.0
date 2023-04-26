Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00036EF243
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 12:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6182C10E914;
	Wed, 26 Apr 2023 10:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4379710E914
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 10:41:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [109.100.38.211])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CC62B6603270;
 Wed, 26 Apr 2023 11:41:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1682505666;
 bh=6bTWip1eOwYcV2/OoZ8YbSCljG8G/2UWH6paR9Rweuk=;
 h=From:To:Cc:Subject:Date:From;
 b=l0OlUWXLzZYd2+8ykOFh2d7/l/Xj9d+JExS/x/u6ewG3VnjBN4+33yYgxJtQ8y/4z
 ImylWCgcAcexoKBGbNVJG20OaJGuQnUmVbVAsHUL7gBFkMsawgK7/8t9PbGrTzl3Fy
 i9XhUFLOOv3thLWC2MMPiW/I+ah2HxaEeLLK0QOajWUtNLdEUR6+mTsEAMaj0U8De+
 NZbPdeHRb5qd7fZ1VNx2hIsdyeUWrsL+ayF7Hasw6nDf1SV2SQFnOkrmiiVeu2rtT7
 2b1zNAsns6nSCTkthLAqNMEl47qRYRavvcXMyPYRIrdRPPyV4zVcw0H/F1y5zYj0iw
 MUAm1eG01i8Aw==
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/3] drm/vkms: Add support for multiple pipes
Date: Wed, 26 Apr 2023 13:40:56 +0300
Message-Id: <20230426104059.28732-1-marius.vlad@collabora.com>
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
 brpol@chromium.org, marius.vlad@collabora.com, igormtorrente@gmail.com
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

Marius Vlad (3):
  vkms: Pass the correct bitmask for possible crtcs
  vkms: Add support for multiple pipes
  Documentation/gpu/vkms.rst: Added a note about plane migration

 Documentation/gpu/vkms.rst            |  5 ++--
 drivers/gpu/drm/vkms/vkms_crtc.c      |  3 +--
 drivers/gpu/drm/vkms/vkms_drv.c       | 38 ++++++++++++++++++++++-----
 drivers/gpu/drm/vkms/vkms_drv.h       | 12 ++++++---
 drivers/gpu/drm/vkms/vkms_output.c    |  7 +++--
 drivers/gpu/drm/vkms/vkms_writeback.c | 24 ++++++++---------
 6 files changed, 59 insertions(+), 30 deletions(-)

-- 
2.39.2


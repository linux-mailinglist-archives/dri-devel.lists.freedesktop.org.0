Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BDD8C0018
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 16:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA5F112D82;
	Wed,  8 May 2024 14:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UZpyP80R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE70112725
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 14:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K5Jyz2HcHnd4qjoQGkHoDRw9E/O/0f/1V5mi4Cz+mbA=; b=UZpyP80RFXxMkbdmtv8MQmlayD
 a9Cak50mp0N28mybxirngR2oL+npx9nBxlxMdG/0We8FCkypSPy4iatE1fnIV2LrEWj7FrwVtYdCw
 NlS+h3VSLtvecK5NwoB3P+JhrYwK4ALH/YA5JgxBnfa0jS3GdYFUZpfqh6py8Odm7KWRTgfTXZlBR
 knmhWaUQmNBE84czf6/2B45CdZRyar425javotrxGDwiU5kAm7zgAoi6lpBrbUSjlHf5HEiOOvtDH
 1mTOuFfp8zCVZa7wKd6/IOE3kyKcsGSlZiQZdc/Xfo5AdQ6JdzSh8R8H+gV6z6NsM1dzxAIG7+vnt
 5ohh1uEA==;
Received: from [179.234.232.152] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s4iNh-002ogv-JR; Wed, 08 May 2024 16:34:54 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 =?UTF-8?q?Juan=20A=20=2E=20Su=C3=A1rez?= <jasuarez@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 0/6] drm/v3d: Improve Performance Counters handling
Date: Wed,  8 May 2024 11:30:42 -0300
Message-ID: <20240508143306.2435304-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series has the intention to address two issues with Performance Counters
on V3D:

1. Update the number of Performance Counters for V3D 7.1 
	
V3D 7.1 has 93 performance counters, while V3D 4.2 has only 87. Although the
series [1] enabled support for V3D 7.1, it didn’t replace the maximum number of
performance counters. This led to errors in user space as the Vulkan driver
updated the maximum number of performance counters, but the kernel didn’t. 
    
Currently, the user space can request values for performance counters that
are greater than 87 and the kernel will return an error instead of the values.
That’s why `dEQP-VK.query_pool.performance_query.*` currently fails on Mesa
CI [2]. This series intends to fix the `dEQP-VK.query_pool.performance_query.*`
fail.
    
2. Make the kernel able to provide the Performance Counter descriptions
    
Although all the management of the Performance Monitors is done through IOCTLs,
which means that the code is in the kernel, the performance counter descriptions
are in Mesa. This means two things: (#1) only Mesa has access to the descriptions
and (#2) we can have inconsistencies between the information provided by Mesa
and the kernel, as seen in the first issue addressed by this series.
	
To minimize the risk of inconsistencies, this series proposes to use the kernel
as a “single source of truth”. Therefore, if there are any changes to the
performance monitors, all the changes must be done only in the kernel. This
means that all information about the maximum number of performance counters and
all the descriptions will now be retrieved from the kernel. 

This series is coupled with a Mesa series [3] that enabled the use of the new
IOCTL. I appreciate any feedback from both the kernel and Mesa implementations.

[1] https://lore.kernel.org/dri-devel/20231031073859.25298-1-itoral@igalia.com/
[2] https://gitlab.freedesktop.org/mesa/mesa/-/commit/ea1f09a5f21839f4f3b93610b58507c4bd9b9b81
[3] https://gitlab.freedesktop.org/mairacanal/mesa/-/tree/v3dv/fix-perfcnt

Best Regards,
- Maíra Canal

Maíra Canal (6):
  drm/v3d: Add Performance Counters descriptions for V3D 4.2 and 7.1
  drm/v3d: Different V3D versions can have different number of perfcnt
  drm/v3d: Create a new V3D parameter for the maximum number of perfcnt
  drm/v3d: Create new IOCTL to expose performance counters information
  drm/v3d: Use V3D_MAX_COUNTERS instead of V3D_PERFCNT_NUM
  drm/v3d: Deprecate the use of the Performance Counters enum

 drivers/gpu/drm/v3d/v3d_drv.c                 |  11 +
 drivers/gpu/drm/v3d/v3d_drv.h                 |  14 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c             |  36 ++-
 .../gpu/drm/v3d/v3d_performance_counters.h    | 208 ++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_sched.c               |   2 +-
 include/uapi/drm/v3d_drm.h                    |  44 ++++
 6 files changed, 312 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/v3d/v3d_performance_counters.h

-- 
2.44.0


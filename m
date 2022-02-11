Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C6A4B2E64
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 21:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299E610EB81;
	Fri, 11 Feb 2022 20:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6710310EB81
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 20:27:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 06D791F47319
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644611257;
 bh=OKPbToKLl5qDQixsLdzU8Yzc6P3QWoP0M2AzQsCH5mI=;
 h=From:To:Cc:Subject:Date:From;
 b=EtvdcoeiUyS3P3B/O+MdJKy6qR9Ldll4n5GZ1GB/jGm/e0QzP2+UJniBXE7gkJXun
 Ea6LNtNMmEI4nyGoGuc73cQnXaZ0bAy3k0jFEIsHaF/Gkta0NVSuDq10vFi57cBEcA
 AToMwpsDV+AfW64aW0Owt4KLDeY2zmqeUf4qrzzpuWUwqKpVYKsFgJTzHXazktWkzP
 CnY1CU/j4PQYbQpCS2XEpIsxwzsleRXWPkMMCLJ9PsMvf8+soCdhxLnKjKPhfbhzuw
 xPBA9niciHBua6jWcFowi3h84mji0d+zjaY+wfBg19Bdtwh/3wsD0HPF+jPUXKF875
 3KsMQu1I19dow==
From: alyssa.rosenzweig@collabora.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/9] drm/panfrost: Initial Valhall support
Date: Fri, 11 Feb 2022 15:27:19 -0500
Message-Id: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.34.1
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, steven.price@arm.com,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

This patch series adds preliminary support for Mali "Valhall" GPUs into
the Panfrost kernel driver. The series has been tested on the Mali-G57
on a MediaTek MT8192 system. However, that system requires additional
MediaTek-specific patches [1] as well as core mainlining for MediaTek.
I'll post the MT8192-specific Panfrost patches soon; they depend on this
core series.

On the userspace side, pre-CSF Valhall (what is supported here) uses an
identical UABI as Bifrost. Mesa support for Valhall is being worked on
in parallel [2]. I'm hoping basic support for Valhall will be available
in Mesa 22.1.

[1] https://gitlab.freedesktop.org/panfrost/linux/-/tree/mt8192-branch
[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14795

Alyssa Rosenzweig (9):
  dt-bindings: Add arm,mali-valhall compatible
  drm/panfrost: Handle HW_ISSUE_TTRX_2968_TTRX_3162
  drm/panfrost: Constify argument to has_hw_issue
  drm/panfrost: Handle HW_ISSUE_TTRX_3076
  drm/panfrost: Add HW_ISSUE_TTRX_3485 quirk
  drm/panfrost: Add "clean only safe" feature bit
  drm/panfrost: Don't set L2_MMU_CONFIG quirks
  drm/panfrost: Add Mali-G57 "Natt" support
  drm/panfrost: Handle arm,mali-valhall compatible

 .../bindings/gpu/arm,mali-bifrost.yaml          |  1 +
 drivers/gpu/drm/panfrost/panfrost_device.c      |  9 +++++++--
 drivers/gpu/drm/panfrost/panfrost_drv.c         |  1 +
 drivers/gpu/drm/panfrost/panfrost_features.h    | 13 +++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c         | 17 +++++------------
 drivers/gpu/drm/panfrost/panfrost_issues.h      | 17 ++++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_regs.h        |  1 +
 7 files changed, 44 insertions(+), 15 deletions(-)

-- 
2.34.1


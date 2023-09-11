Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A9379A1D1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 05:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC23510E105;
	Mon, 11 Sep 2023 03:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CB110E104;
 Mon, 11 Sep 2023 03:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EsQxGpmTl6fVVk5TnRnxhwh5yeoTGl0hLF5hWy+ixQ4=; b=GtCN67Yv/GOJLHfyipWkUzzY4T
 ysJ3Par1ipJ15UCgHTxqnyIIi9tPyTandW31WqjGovb0EIh+sKzD3dixrFhktXC2O6Q5ToSWI9FUV
 285ISMlLzJuU4ns2+VjuEus26/7KI0bQc5NvgxSp6INZFwG0U+4Is2zwFFL8KohF2pOfdYqfsqO6v
 8H8eA+4TEahEPCLkNbJ4AaybzsbChV4hIePyUNlDpipoJTLfV/0xuYNrIFvO4/s1MT+zpEbnRPDSa
 Jywnx3Cv45ka3+n4ZlvitCSj3TMDGN0sX6/fZW4CLI9K5U9jWVC3SXKBhF5WHTHKDYGPSzDk3jnte
 KeQnn80A==;
Received: from [187.10.204.7] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qfX9z-002C6C-VD; Mon, 11 Sep 2023 05:00:24 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/5] drm/amdgpu: Rework coredump memory allocation 
Date: Mon, 11 Sep 2023 00:00:13 -0300
Message-ID: <20230911030018.73540-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.42.0
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Shashank Sharma <shashank.sharma@amd.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

The patches of this set are a rework to alloc devcoredump dynamically and to
move it to a better source file.

Thanks,
	André

Changelog:

v5: https://lore.kernel.org/lkml/20230817182050.205925-1-andrealmeid@igalia.com/
- Added Shashank Sharma R-b tag

v4: https://lore.kernel.org/dri-devel/20230815195100.294458-1-andrealmeid@igalia.com/
- New patch to encapsulate all reset info in a struct

v3: https://lore.kernel.org/dri-devel/20230810192330.198326-1-andrealmeid@igalia.com/
- Changed from kmalloc to kzalloc
- Dropped "Create a module param to disable soft recovery" for now

v2: https://lore.kernel.org/dri-devel/20230713213242.680944-1-andrealmeid@igalia.com/
- Drop the IB and ring patch
- Drop patch that limited information from kernel threads
- Add patch to move coredump to amdgpu_reset

v1: https://lore.kernel.org/dri-devel/20230711213501.526237-1-andrealmeid@igalia.com/
 - Drop "Mark contexts guilty for causing soft recoveries" patch
 - Use GFP_NOWAIT for devcoredump allocatio

André Almeida (5):
  drm/amdgpu: Allocate coredump memory in a nonblocking way
  drm/amdgpu: Rework coredump to use memory dynamically
  drm/amdgpu: Encapsulate all device reset info
  drm/amdgpu: Move coredump code to amdgpu_reset file
  drm/amdgpu: Create version number for coredumps

 drivers/gpu/drm/amd/amdgpu/amdgpu.h         | 21 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 10 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 75 ++------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c   | 77 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h   | 13 ++++
 5 files changed, 114 insertions(+), 82 deletions(-)

-- 
2.42.0


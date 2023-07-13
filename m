Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DA2752C25
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 23:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC0A10E787;
	Thu, 13 Jul 2023 21:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C658410E785;
 Thu, 13 Jul 2023 21:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XaUH0inLzPLEoGiySyQaMSAIFD67nesdBt9LTsWi9os=; b=J51neSaiPnQHH/bS0IFUW+Oeuv
 b5McKZXjM7b2Xb1ryUAAeV0Sm5/TtNxf+rxkdvhBfXXVrBQ4eCMIQhx8RDiS+SktRwbsDIfkJFrn2
 eenRqX5uuSoh907mpBriWBn/3jiwlUHrBvz5b7O6/IVz2Y+ziAqhebN3BhM6Nbnpx0EjGlSRlSg0S
 mK4zrf+yo7uPaoHCz+KfqQkwjlaQZVD4frrpLErblDihr6KszESMuQqDkU/0GM7OmbDl6xHS/CqDe
 QtMsGJy+plTrR+645aHVMRGndzlb+YWAMWFTqtcIXrwPaeG500Ww1yNTXquxkRMMYrWYjWcUyD6lC
 auhy4+tQ==;
Received: from [187.74.70.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qK3w2-00EDEa-MT; Thu, 13 Jul 2023 23:33:15 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] drm/amdgpu: Add new reset option and rework coredump
Date: Thu, 13 Jul 2023 18:32:36 -0300
Message-ID: <20230713213242.680944-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
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
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 michel.daenzer@mailbox.org, Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

The goal of this patchset is to improve debugging device resets on amdgpu.

The first patch creates a new module parameter to disable soft recoveries,
ensuring every recovery go through the full device reset, making easier to
generate resets from userspace tools like [0] and [1]. This is important to
validate how the stack behaves on resets, from end-to-end.

The last patches are a rework to store more information at devcoredump files,
making it more useful to be attached to bug reports.

The new coredump content look like this:

   **** AMDGPU Device Coredump ****
   version: 1
   kernel: 6.4.0-rc7-tony+
   module: amdgpu
   time: 702.743534320
   process_name: vulkan-triangle PID: 4561
   IBs:
   	[0] 0xffff800100545000
   	[1] 0xffff800100001000
   ring name: gfx_0.0.0

Due to nested IBs, this may not be the one that really caused the hang, but it
gives some direction.

Thanks,
	André

[0] https://gitlab.freedesktop.org/andrealmeid/gpu-timeout
[1] https://github.com/andrealmeid/vulkan-triangle-v1

Changelog:
v1: https://lore.kernel.org/dri-devel/20230711213501.526237-1-andrealmeid@igalia.com/
 - Drop "Mark contexts guilty for causing soft recoveries" patch
 - Use GFP_NOWAIT for devcoredump allocation

André Almeida (6):
  drm/amdgpu: Create a module param to disable soft recovery
  drm/amdgpu: Allocate coredump memory in a nonblocking way
  drm/amdgpu: Rework coredump to use memory dynamically
  drm/amdgpu: Limit info in coredump for kernel threads
  drm/amdgpu: Log IBs and ring name at coredump
  drm/amdgpu: Create version number for coredumps

 drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 21 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 99 +++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  9 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c   |  6 +-
 4 files changed, 106 insertions(+), 29 deletions(-)

-- 
2.41.0


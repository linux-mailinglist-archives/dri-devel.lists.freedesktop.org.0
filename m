Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A0289B103
	for <lists+dri-devel@lfdr.de>; Sun,  7 Apr 2024 15:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDF210E1A6;
	Sun,  7 Apr 2024 13:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I962Q8yr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FFC10E1A6;
 Sun,  7 Apr 2024 13:12:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 42164CE0A47;
 Sun,  7 Apr 2024 13:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28208C433F1;
 Sun,  7 Apr 2024 13:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712495525;
 bh=dRchvoO2syoNRVVAjgj+vST9WW44gcdsEwYNqJsk+Cs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I962Q8yr79kAQb89XjSGhPpDZwFWEq9P4Z5U4Sp/XGaTiLd0WA2w38G4quBx4cSNG
 YtUxLNibKlgm8nZ4CTW9s050mzqb9XuNbQ106tHiUBqDyGN9Wxk73Ucg7je1n3TUzz
 oHtb2oNTTn84F/Esr3pfU5GuLpA2VJjnPVhTVUWceHQnditcQul4AZIzz/kW2Hyi9m
 8nrCovWNgMi4R1vhISGJVhMEDvO1fFi+jHp1iKvfjrGBWy74uKg59hMR58y4fKv1Oj
 RkI8GrcDECxLpl4+14Qt9Lu23kF0cF77JDD9jO4N/8Xs2xlItpfRtg3GSvuY2g29GR
 nx/dmYzNlOx2g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mukul Joshi <mukul.joshi@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 20/25] drm/amdkfd: Check cgroup when returning
 DMABuf info
Date: Sun,  7 Apr 2024 09:11:08 -0400
Message-ID: <20240407131130.1050321-20-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240407131130.1050321-1-sashal@kernel.org>
References: <20240407131130.1050321-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.4
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

From: Mukul Joshi <mukul.joshi@amd.com>

[ Upstream commit 9d7993a7ab9651afd5fb295a4992e511b2b727aa ]

Check cgroup permissions when returning DMA-buf info and
based on cgroup info return the GPU id of the GPU that have
access to the BO.

Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 80e90fdef291d..9a88b35cd8966 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1522,7 +1522,7 @@ static int kfd_ioctl_get_dmabuf_info(struct file *filep,
 
 	/* Find a KFD GPU device that supports the get_dmabuf_info query */
 	for (i = 0; kfd_topology_enum_kfd_devices(i, &dev) == 0; i++)
-		if (dev)
+		if (dev && !kfd_devcgroup_check_permission(dev))
 			break;
 	if (!dev)
 		return -EINVAL;
@@ -1544,7 +1544,7 @@ static int kfd_ioctl_get_dmabuf_info(struct file *filep,
 	if (xcp_id >= 0)
 		args->gpu_id = dmabuf_adev->kfd.dev->nodes[xcp_id]->id;
 	else
-		args->gpu_id = dmabuf_adev->kfd.dev->nodes[0]->id;
+		args->gpu_id = dev->id;
 	args->flags = flags;
 
 	/* Copy metadata buffer to user mode */
-- 
2.43.0


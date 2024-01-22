Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0C583666A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFCE10F2D8;
	Mon, 22 Jan 2024 15:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C9F10F2D7;
 Mon, 22 Jan 2024 15:02:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 955EFB80E6D;
 Mon, 22 Jan 2024 15:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB06BC433C7;
 Mon, 22 Jan 2024 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935722;
 bh=m3q+ToFjWwnp4WpJ/Dy/2htLcjii7Ow9i0kIm95oHuU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vApEiu8CZDbT0UWpEKSuJT4fdK2xH6bDQReFXEALAbX66/UqWavRmgpnJhpAO3zs3
 x5ebo1K85oN7wUnPyiUT6q3ysn2ZxtJOh5irWouLdfa6fkXIzdv+Dxi9FzoDofMCAW
 VsdBNm9lRxgAFw5ecCQJuKtBILOFDJlKbcby55InVJr9Wn2oXefqW0GP/7g/3HfItR
 rnuJmHu2HgXfYIF9DBo0MoEVZ8k1Xr/dwmM6ATXg7kC8hojgs9lDJfCjuSE/eKxtf3
 o3U6lR4C0Fx/vCpabphL7R8v/E34Mkk2zMaezr/5B7cZRuQYbcVYW9K4rvQasEJ1tL
 XH6gch07DioaQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 82/88] drm/amdkfd: Fix iterator used outside loop
 in 'kfd_add_peer_prop()'
Date: Mon, 22 Jan 2024 09:51:55 -0500
Message-ID: <20240122145608.990137-82-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122145608.990137-1-sashal@kernel.org>
References: <20240122145608.990137-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.1
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
Cc: Sasha Levin <sashal@kernel.org>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

[ Upstream commit b1a428b45dc7e47c7acc2ad0d08d8a6dda910c4c ]

Fix the following about iterator use:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1456 kfd_add_peer_prop() warn: iterator used outside loop: 'iolink3'

Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 24 ++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 057284bf50bb..d18dff7bb889 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1449,17 +1449,19 @@ static int kfd_add_peer_prop(struct kfd_topology_device *kdev,
 		/* CPU->CPU  link*/
 		cpu_dev = kfd_topology_device_by_proximity_domain(iolink1->node_to);
 		if (cpu_dev) {
-			list_for_each_entry(iolink3, &cpu_dev->io_link_props, list)
-				if (iolink3->node_to == iolink2->node_to)
-					break;
-
-			props->weight += iolink3->weight;
-			props->min_latency += iolink3->min_latency;
-			props->max_latency += iolink3->max_latency;
-			props->min_bandwidth = min(props->min_bandwidth,
-							iolink3->min_bandwidth);
-			props->max_bandwidth = min(props->max_bandwidth,
-							iolink3->max_bandwidth);
+			list_for_each_entry(iolink3, &cpu_dev->io_link_props, list) {
+				if (iolink3->node_to != iolink2->node_to)
+					continue;
+
+				props->weight += iolink3->weight;
+				props->min_latency += iolink3->min_latency;
+				props->max_latency += iolink3->max_latency;
+				props->min_bandwidth = min(props->min_bandwidth,
+							   iolink3->min_bandwidth);
+				props->max_bandwidth = min(props->max_bandwidth,
+							   iolink3->max_bandwidth);
+				break;
+			}
 		} else {
 			WARN(1, "CPU node not found");
 		}
-- 
2.43.0


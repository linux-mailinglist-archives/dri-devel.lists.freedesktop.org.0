Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8151836751
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64A010F3C1;
	Mon, 22 Jan 2024 15:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2D510F3A6;
 Mon, 22 Jan 2024 15:12:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 402E2611C5;
 Mon, 22 Jan 2024 15:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD15C433C7;
 Mon, 22 Jan 2024 15:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936343;
 bh=biNwyGk6r3Q/OhWpjELm0PNyjZfVoAdPzTO0Gz/tMtE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Op/rCA8lqK67wnsVUXQZr48d2F5O7XoyQtp/hvXGuX+c26XUddnYPZgSIxhdgDB6V
 BbhVFIKGzuXY1ZVkCYm9gYZme/xw6BIFc+TqjrSN1PB/QmsIpjfLDV+ik2ymGc4U55
 IF9aKmIdDRm7ciJtJAjkXk3sZff+ejCiLV20uWECpc8HGxKcGtVSWvgKe62B1GVYZq
 Uug3Y35ZBdTdrkxOvlczZvDiwpu1NsEPBvO6sty213wzUDroxiEUT/GLtFHoV9HefQ
 N8keqNq5gkqQv3N7wrjvWTmLdrC2gyXuDi/gzLP1wKvWnTZCzyvQnLGgE64ZVWo8fU
 F1vTKmXr57JZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 49/53] drm/amdkfd: Fix iterator used outside loop
 in 'kfd_add_peer_prop()'
Date: Mon, 22 Jan 2024 10:08:50 -0500
Message-ID: <20240122150949.994249-49-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122150949.994249-1-sashal@kernel.org>
References: <20240122150949.994249-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.74
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
index 713f893d2530..977e13cd36e8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1510,17 +1510,19 @@ static int kfd_add_peer_prop(struct kfd_topology_device *kdev,
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


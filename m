Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D77BE6E2AA8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 21:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE4410E1F2;
	Fri, 14 Apr 2023 19:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB8610E1F1;
 Fri, 14 Apr 2023 19:32:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXINpRJeijmu4ZYvb51XZ0Es5JscDLvk2yfFV23Qdn5BtHiLaClXYF0mJj+gjBiiJAvLPGGq3f/7Fm90Zu2BgxrUEE1CI/Ek+CrgNiQC3Q2svjAkBfOAFQe0821mBJF/5uXBNnWrMFD5IFp1WaTIo8wtQ7y5OpU7gZu3OmzZOB3cvilbV5nwU+2y7WmiwrO34wc6swmF6QHufFqPypiNB4QZYChsg5L48Evyjo5LBgBMiah5nbxRtyVinWIOhly7Jdu9Iel9keTfBrLOSaVOCG8dcER1+GDoW4eLyYhyZVkrerqfZv9kBqxfzOsvktYSRHyc+Z7aywEJvuCFoiXVog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5EB0oU/HjXCu0AXzOTxVbcwfaphnJ+Fu3kmEw3Hwkw=;
 b=mPsmH0Fic3CJ5vGZj+MAc7zj/ymh0PH6AiIcmvfgpAo/MA+EqnF7XYASB7MgxAVeiU6so3L7i/hNhGFQBYZwCz/7rIEQY5USCErD1YaHf2FKHFSKlu5JRCUfkg2L44NeXauNxRIUkvbk1riLwfJOUgttU28St81o5rV2s9uhPmMwlFq1/Y7hFdW5MbBZvGC1/19PTZH4iDV8/VmCH7fvJzwVSuxfaTs7j2yoNiQEZhHCZqcVjpy/83VYj6sr2LfJwwZDKfOo2UQ7yACNAyJwJI81u9JNFWKZeoB3lsY7cBqPPT1dQ1DlEH09/u8m5AFi7pMRAcZHSM0ZcqhIU5KPjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5EB0oU/HjXCu0AXzOTxVbcwfaphnJ+Fu3kmEw3Hwkw=;
 b=nBKmcH0r1HSGgPzMHHAc0VWYJbsJQsU2GfgG9O8H8Bzl3sXCqUUVcWVFIMX5iJ1Z4DppXWa+a4Azz3LENUnBaZl8L75iuqoVXMntbWFe4CVLTJ/Z2E5+SEHCumYpB7pNRRfTbgeS1gGtbAzN4plp/EDPwyXgOntHPzakBhrx67I=
Received: from MW4PR03CA0331.namprd03.prod.outlook.com (2603:10b6:303:dc::6)
 by IA1PR12MB6649.namprd12.prod.outlook.com (2603:10b6:208:3a2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 19:32:23 +0000
Received: from CO1NAM11FT072.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::d1) by MW4PR03CA0331.outlook.office365.com
 (2603:10b6:303:dc::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Fri, 14 Apr 2023 19:32:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT072.mail.protection.outlook.com (10.13.174.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.33 via Frontend Transport; Fri, 14 Apr 2023 19:32:22 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 14 Apr
 2023 14:32:20 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: fix flickering caused by S/G mode
Date: Fri, 14 Apr 2023 15:33:30 -0400
Message-ID: <20230414193331.199598-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT072:EE_|IA1PR12MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: cb746c1c-4254-4691-0c06-08db3d1ef862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HNsC69rnygQyaf79v1wCLlVrlBsUUJWae2I1teJoLJ4ofXIzhmnbnCzULf6ArKS9u4THg7mvKCgZZkQfqsZFAKYHIZVpgy626zV6Jk+WIuBIjOtIbB+kNrPDVXNpef9RHE/l2LXAX6kEG9D4Bw6vCSH++tAqRCy0/7YYtcOI8g5GCntW9uXORGwIimtlzhpzukDpk5IGtiG3lHrVh9tgeLmayY4SeF2foiX2xF6PiTQi2FlLkZugrLH8fIC3IWvEMIVYOlcXvzGoJ0nD1DWSm0Xh9QjwUAiOrGrtZ8I/9YiWxSi0KeyDZIcnd8R3Bq8gCk2tyHQR0YZ5XOZ/EaWfaBN0vhW0YPUnYmUfK3krac3okEZgjNxLCvC9CU5Ak3vIh4gwzG0umqQ6RnyvWBeeE3RUr5yxi5n05emFTn5amguLvKM+m700NKx/EujNT/U72cWyx3RbRSvu0SOSpws5l21PKoE1NL4Nsn/SQ1/qufUpClnKwikuhOmnb0aa/NQgd0noRNY2BUTW+KVj8KNk4t4lezH3m7RQB38BS8qjmqcXJb5MklNhxEohJR7hvA5gxyrEw7Y50IXY5FoSNKYktctY0AcrAxbbAjQQMaRyZaH4rBN/BQ5vAjYb7MbtyMj3w8kRxe48U3yd9LAbRxz4Y0c2hMYuBLPqoQyMg15fjCixDCtnFQ046Sj1OjwaHAUU87gG2epDBshjZyGO+EwCGMVAr1NAQ6LX5qx5JcpwuIvGTQnIxOl0ypUzc03J5YRcvwHWnjfQ5hZAp+GO3thyxw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199021)(36840700001)(40470700004)(46966006)(36860700001)(41300700001)(40460700003)(36756003)(82740400003)(5660300002)(356005)(2906002)(40480700001)(86362001)(8676002)(4326008)(6916009)(44832011)(8936002)(82310400005)(81166007)(70206006)(70586007)(54906003)(1076003)(2616005)(83380400001)(336012)(47076005)(426003)(26005)(478600001)(186003)(16526019)(6666004)(316002)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 19:32:22.7139 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb746c1c-4254-4691-0c06-08db3d1ef862
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT072.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6649
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
Cc: Stylon Wang <stylon.wang@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 dri-devel@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Hans de
 Goede <hdegoede@redhat.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, we allow the framebuffer for a given plane to move between
memory domains, however when that happens it causes the screen to
flicker, it is even possible for the framebuffer to change memory
domains on every plane update (causing a continuous flicker effect). So,
to fix this, don't perform an immediate flip in the aforementioned case.

Cc: stable@vger.kernel.org
Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)")
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 41 ++++++++++++++++++-
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index da3045fdcb6d..9a4e7408384a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7897,6 +7897,34 @@ static void amdgpu_dm_commit_cursors(struct drm_atomic_state *state)
 			amdgpu_dm_plane_handle_cursor_update(plane, old_plane_state);
 }
 
+static inline uint32_t get_mem_type(struct amdgpu_device *adev,
+				    struct drm_gem_object *obj,
+				    bool check_domain)
+{
+	struct amdgpu_bo *abo = gem_to_amdgpu_bo(obj);
+	uint32_t mem_type;
+
+	if (unlikely(amdgpu_bo_reserve(abo, true)))
+		return 0;
+
+	if (unlikely(dma_resv_reserve_fences(abo->tbo.base.resv, 1)))
+		goto err;
+
+	if (check_domain &&
+	    amdgpu_display_supported_domains(adev, abo->flags) !=
+	    (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_DOMAIN_GTT))
+		goto err;
+
+	mem_type = abo->tbo.resource->mem_type;
+	amdgpu_bo_unreserve(abo);
+
+	return mem_type;
+
+err:
+	amdgpu_bo_unreserve(abo);
+	return 0;
+}
+
 static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 				    struct dc_state *dc_state,
 				    struct drm_device *dev,
@@ -7916,6 +7944,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			to_dm_crtc_state(drm_atomic_get_old_crtc_state(state, pcrtc));
 	int planes_count = 0, vpos, hpos;
 	unsigned long flags;
+	uint32_t mem_type;
 	u32 target_vblank, last_flip_vblank;
 	bool vrr_active = amdgpu_dm_crtc_vrr_active(acrtc_state);
 	bool cursor_update = false;
@@ -8035,13 +8064,21 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			}
 		}
 
+		mem_type = get_mem_type(dm->adev, old_plane_state->fb->obj[0],
+					true);
+
 		/*
 		 * Only allow immediate flips for fast updates that don't
-		 * change FB pitch, DCC state, rotation or mirroing.
+		 * change memory domain, FB pitch, DCC state, rotation or
+		 * mirroring.
 		 */
 		bundle->flip_addrs[planes_count].flip_immediate =
 			crtc->state->async_flip &&
-			acrtc_state->update_type == UPDATE_TYPE_FAST;
+			acrtc_state->update_type == UPDATE_TYPE_FAST &&
+			(!mem_type || (mem_type && get_mem_type(dm->adev,
+								fb->obj[0],
+								false) ==
+				       mem_type));
 
 		timestamp_ns = ktime_get_ns();
 		bundle->flip_addrs[planes_count].flip_timestamp_in_us = div_u64(timestamp_ns, 1000);
-- 
2.40.0


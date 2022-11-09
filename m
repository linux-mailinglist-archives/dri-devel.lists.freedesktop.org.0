Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E3D623248
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 19:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE95010E622;
	Wed,  9 Nov 2022 18:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F47C10E02C;
 Wed,  9 Nov 2022 18:20:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mG4d8U5Ohs9QJhUcHfAyNEsjcMjw3ro9OFouZjAwRu+3Jctj6c7THao6V9o2EkBkJBqAet+o4ZIMES3jdetK0QvNLTekhoW2fUUma1tvF64I9KzNJqhr0P8RMj+FbQO2iz38nKbOub19M876yfQNRP/tF9llPg+vYdSLqIPb7dyr1/X72FkNZ4ku/4ROlfTcdBoi9gTGgvXFjdrghKWSyMxxD4hcac9NPVjYuBH7i+tnZ30XXzR7jLSQDRleun9hiYItHRasvRATfCytYbFrD7Bn/OY83lf/JdPFl+Hq+zb1cbmuu42SbJtiaplAdsGcszYHhihLglEgw+T6hkB2qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGeok/wWfvdo7M5b8nIFNKz0dMXnz4uaTsigUy2pkGw=;
 b=QZW9hcGvNS28naoBjYMgDdgMhk5KHG/NaLRbLlx7Mw103Q1OBTy2xi5tEtHyKcb0lS1D6obpA+QNyUwZgEXCRe44ip1U+zo23l1GUgrJHeeF+X6dk8m3sYKgChTXmR+jb6kJzgGpxYFJfNw6tmGUSPNdNFm2DvHsh6sleKfw4ytsOhICvnI0UKFYIdYn5cWP0xvJyc+tEu4QW+rVA5ZHyGyOIZTH7k97sbdi3WKJjZfbrS3e4dLqzczKMHJzzABDSDJGQqLf3pQHxx8gSe4GdnWw2AtfIIchE3i3TVZFnH2eJXFdM/byA0LZEdLE6LLDdS8N8xYoQ+1qmJGOYE6ECg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGeok/wWfvdo7M5b8nIFNKz0dMXnz4uaTsigUy2pkGw=;
 b=Ca2+W3a2zP/EWGVgyqm5l1UYd7pF/D0Oi7f3Ijy5OSyLCug9fxEMuC7plSx6Ic67eyjaaGXARMTFZt5KOVnX9luHK1JyGwvQzL5pAfGjARvMNvcdgm/7uku0qU8GAA1cKwlFX9qWQ9WhftX11qraBPhYN0s9w2RWozz7GCh8eV4=
Received: from MW4PR03CA0134.namprd03.prod.outlook.com (2603:10b6:303:8c::19)
 by CY8PR12MB7338.namprd12.prod.outlook.com (2603:10b6:930:52::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Wed, 9 Nov
 2022 18:20:05 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::6e) by MW4PR03CA0134.outlook.office365.com
 (2603:10b6:303:8c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Wed, 9 Nov 2022 18:20:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 18:20:04 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 9 Nov
 2022 12:20:01 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/display: only fill dirty rectangles when PSR is
 enabled
Date: Wed, 9 Nov 2022 13:20:09 -0500
Message-ID: <20221109182010.171534-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT012:EE_|CY8PR12MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf720c9-ee66-4adf-1362-08dac27f0677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VLQy3eDGdCehxIBWbVgHgCrOvrZcN4KS6eC9lPueCp8ra/GZrsaJ2bSKFs7qYfJgbWi91IbZCLQ+DzbMbpuaZIbYI00ZmabD/LX+fIkf9aFRZY3TVaGoMyvLzS00fLmYYjxFNixAIxV+nv+A4UAn5HjiRZCNWSszO61ZP7VU3oI8QuRo/IYhMonXdr9r7pT0fgu31LSWkjrLLzauWGZVpzdE4d+uLBY0MwgDo1mmyeOihw6hfsNu1RHm9DfwuQJ9iyInXai5wkyA5TqVM6PhngSc0YqJ9KkdfMhMIXF61kGSuyPDBrwDZz1bocsAv8CKAzBa6rmvMKOYfPWohN1w2T99zdpEzYSkQ5ziRuXJhAYvtfMFlXd0EbP97sU+b+UA8OIFtR67nZrgqmacP/KGAPU/7eLgPpZzwzwm8/xRFlS9i10nZ6u+mho4Slq3e0KCHSVg6VzveafO+dO6veJYRY5wURef4f6nA+lsSeMQMiEy6fepqSAu7rs7YGTKXYIOAfdqb8SAZHVVwV+yy/NvqO2VHAo7wHZRNbHPS9Je6YHW5rA8Oy2jik/jkoM18d77DpRhGpBAU4mCREw72VCiLSkJyUwN83I34sbZLdkHSfmSXBO2IN4Ng6vvByTLng0kLPc9xjsqvrXiy4ROZ2+pHSWIgLymh9b21YitjMpr1XydQXtLAXCdy7ZJUeNi1ReB86xH+yHvDFIIhRtEVLbR8hUDBh5BN8xLZsDZfITkH3vE1Zhov9DDrpMdASDzlx8pEt3dxQ3Lsmi2W5jdGR07OxwWtnMgXTh0mcTuGbV7JFgtOwl0qMSDr+TD7A8hpukmyAX9kGtYT6RXH2UzdR/PhVgSToFeOFbWQFgEFRws8w4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199015)(40470700004)(46966006)(36840700001)(86362001)(26005)(7696005)(478600001)(36860700001)(8936002)(316002)(41300700001)(36756003)(6916009)(54906003)(2616005)(1076003)(8676002)(16526019)(40460700003)(83380400001)(426003)(47076005)(336012)(186003)(40480700001)(70206006)(82310400005)(44832011)(5660300002)(2906002)(70586007)(82740400003)(4326008)(81166007)(356005)(14143004)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 18:20:04.9886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf720c9-ee66-4adf-1362-08dac27f0677
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7338
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <roman.li@amd.com>, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, we are calling fill_dc_dirty_rects() even if PSR isn't
supported by the relevant link in amdgpu_dm_commit_planes(), this is
undesirable especially because when drm.debug is enabled we are printing
messages in fill_dc_dirty_rects() that are only useful for debugging PSR
(and confusing otherwise). So, we can instead limit the filling of dirty
rectangles to only when PSR is enabled.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v2: give a more concrete reason.
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 66eb16fbe09f..956a6e494709 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7697,9 +7697,10 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		bundle->surface_updates[planes_count].plane_info =
 			&bundle->plane_infos[planes_count];
 
-		fill_dc_dirty_rects(plane, old_plane_state, new_plane_state,
-				    new_crtc_state,
-				    &bundle->flip_addrs[planes_count]);
+		if (acrtc_state->stream->link->psr_settings.psr_feature_enabled)
+			fill_dc_dirty_rects(plane, old_plane_state,
+					    new_plane_state, new_crtc_state,
+					    &bundle->flip_addrs[planes_count]);
 
 		/*
 		 * Only allow immediate flips for fast updates that don't
-- 
2.38.1


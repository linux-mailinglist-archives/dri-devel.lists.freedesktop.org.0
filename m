Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9027966E803
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 21:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738F510E356;
	Tue, 17 Jan 2023 20:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB8810E356;
 Tue, 17 Jan 2023 20:54:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5rGtkvmtdII4ctZxqLo7bGId075bzYEQ/KJ232bwjZoSR5ukyXk8fpHqsSXNElTSHx77bvnXHuXXFkyJN5c5BeNoR3JpLhHWz2mDN1eREaPsyCyEMShUp2qCjsbwiyfVZCbJZ1ZFhXpr3kkdVGUeoaUlYll+tKOrc45SpSwStlQQkSKFNym6miC7Rf0gW/RfPdNItTXvl5TPQUg8wmzWWnYR78KRcfgzYHOx1PEncDKMVTrvVjD7YWAOzMsj9P/6G51agtOZdpc6rduAufk47Jk86eJ1VZ3SQM/RFzHchxapFgh07Bd2qJvCtS2Q7yauEYsHvbEGrU+hywCcvqCpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjsEJxCIiNQrr3lC3kqt+LaH6vRabUEFOrfiLlZ39qQ=;
 b=dXpQc1B/Vy6j7WjcYJUa7uvnDd0Td2yyidUX3FKKkFmxbNw0CCLnQjB6j7QGWPzA9ON4PPk8INA1trurDZ62elzpUkQpqbPqgwGUeEeC3zZsjyF7mPODjphwDjPdywDLuKbSrVVOxcxbg+eRuK55V01pKQIYxUgZnHrGyzuoR9bdUtm5UntAd2JvAh6pW1SiWdBnhcxZ8QSJWe3SkKhrldoDioY4jQ+Zb2ncxSEJhptAUmf1RGLLdH5YdjfJgIKL2fYWBp7F9XQJz/P4FUYDX7Nbx5yHp9oXfP8f235Muis5NoPYDDm6mDLzXvKR3aoPmbC5xKwdYw3GWdYY0dl8ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjsEJxCIiNQrr3lC3kqt+LaH6vRabUEFOrfiLlZ39qQ=;
 b=m6eUFKfCCMc/2Dk4y9JKsGLZyBFmZjmn/CkP8YG0weVsddQVmt6fD2vNQ0ih+Z6b1yNL2XSDMc8a3Y6/1RvAxqEzgxPL6/AV6CKwXnJgDPCQdr5TL7pcBtXJXdMEe4i/77n0dVa4We7pQwMFikV/L/EGyQlkvW+/WSjoVkC/iIs=
Received: from MW4P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::16)
 by DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 20:54:55 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::dd) by MW4P221CA0011.outlook.office365.com
 (2603:10b6:303:8b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 20:54:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 20:54:54 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 14:54:52 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: fix issues with driver unload
Date: Tue, 17 Jan 2023 15:54:51 -0500
Message-ID: <20230117205452.195298-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT025:EE_|DS7PR12MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: a774ee50-c2d3-4d9b-1e3c-08daf8cd15d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IIJXRV0xL4/PuhjQQR2BETjTrEUgUQnFxJGvNplZMIVYU1jZV/cg7LmhYWVBjA1rfNywbuMg6EGHp15aE/pfO4lefHGcXgv1czktYhQP6ghPI3+3zYlBkPfMFWkMQZWRxvZNReo8nlSGc3uEiF2gq0MUCa22VcRfODxZAYjSUZhQagRYqA060ffpWhz5sOG4W8NDHeKderzdq8a3mjwCX3czTsu+88xBgBgMG2zGfn7YgFJUz4zrjeXOz8wQXwoabWt4P178xMkbATsug5jXEn7l5Z5qH9OE71g3jfmImCxYkgaStNjhozcb++lfc1DpKJ5NKxd+ZCYyYKMpEGGiUaBHuWZ8f74DoOKxI8cvj1MuI/Ua0ZTyVTDVtvI4OA1MohPU26YmIrHHoxs3VSKD6Tpq7afrRgP61jLR3wQcN3diMqD2Jx4nv5anj9rg07FGaGyoxAlyhQ47CQAMYjzGU/6Sj6JUCsot1vk/rfbKrX0ZwVa5IbEP6f5mUG49IQN+RN78Pp2BHaq5ow1I9XUc/L0mJPl9knoj6GJg3RHH5Q4cdcpIs+o9thJiR9hmkAW0rZzCfFcSTRhe/ZGsSuRNozHCBKHdMHOZnDRYs5FvfMK+T2CjYh5/N6mFIPGnCiyGCCovNFvRb6v0euiHY7wA9uB4k48FyYB/HCoqAoPiRQtstUxAT/I3gMVFjRI53M6yMV+Hje46z+0j9LVaN10is8/YjabL3yj19tXLiTmVehTRPC458Qw5a4kxTsqPpDLzTXBjYZnFivZkyJynnxwLpA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(36756003)(356005)(86362001)(6916009)(8936002)(8676002)(4326008)(44832011)(70586007)(70206006)(5660300002)(2906002)(36860700001)(82740400003)(81166007)(83380400001)(478600001)(316002)(54906003)(47076005)(40460700003)(40480700001)(41300700001)(82310400005)(1076003)(26005)(16526019)(336012)(426003)(2616005)(186003)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 20:54:54.2860 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a774ee50-c2d3-4d9b-1e3c-08daf8cd15d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5984
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, we run into a number of WARN()s when attempting to unload the
amdgpu driver (e.g. using "modprobe -r amdgpu"). These all stem from
calling drm_encoder_cleanup() too early. So, to fix this we can stop
calling drm_encoder_cleanup() in amdgpu_dm_fini() and instead have it be
called from amdgpu_dm_encoder_destroy(). Also, we don't need to free in
amdgpu_dm_encoder_destroy() since mst_encoders[] isn't explicitly
allocated by the slab allocater.

Fixes: f74367e492ba ("drm/amdgpu/display: create fake mst encoders ahead of time (v4)")
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c           | 4 ----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 9547037857b6..5cc14ed2e93e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1733,10 +1733,6 @@ static void amdgpu_dm_fini(struct amdgpu_device *adev)
 		adev->dm.vblank_control_workqueue = NULL;
 	}
 
-	for (i = 0; i < adev->dm.display_indexes_num; i++) {
-		drm_encoder_cleanup(&adev->dm.mst_encoders[i].base);
-	}
-
 	amdgpu_dm_destroy_drm_device(&adev->dm);
 
 #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index bbeeee7c5d7c..5fa9bab95038 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -492,7 +492,6 @@ static const struct drm_connector_helper_funcs dm_dp_mst_connector_helper_funcs
 static void amdgpu_dm_encoder_destroy(struct drm_encoder *encoder)
 {
 	drm_encoder_cleanup(encoder);
-	kfree(encoder);
 }
 
 static const struct drm_encoder_funcs amdgpu_dm_encoder_funcs = {
-- 
2.39.0


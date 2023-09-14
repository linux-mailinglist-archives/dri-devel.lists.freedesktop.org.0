Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E677A0C06
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 19:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC5010E2A6;
	Thu, 14 Sep 2023 17:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::612])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BDF10E2A1;
 Thu, 14 Sep 2023 17:54:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWNKpuTWbL7SilmsOkWwJVOQ81uunu86MmlBPJcBwkYWKscfs3nr4w0A26vVYM60sU0y3QeWPvuA+y7B9f+/fhbrJjNQHB1Ra54kwRIJaTREWyTwHX+RdhtBvlslMs3kKRo/GGlu4EB5HeYVAaBIBuXima9UMrwmwUW1TtF/tk7uNHFRaLlBJlGAIkq9z1Wszd5hWzvlgkOAfxH/q75zbyThLgp8WbTvOMbiE31VYF/kvzA9ePrchPqRdHvG/X5Y6X3RaA7V7oDXJcHXrHAJ6Z1m1g1nu6KQc31LrtUfydlJ52gjoGV8aKn92qKW8ipYh8of25Hga3olUvKcchx9mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4jGPU9cQORcjUs95P54KkeJwuA4VPdM47qnWdx3zRw=;
 b=FwYTWYl+neTcYIU1+nit9KS7HW9oa8+EG3dRq39t4j32kaxlv7KKTJrmAizfHCfIApkQzsq/CAob0oEmaxnJIbZWUlkMg50hBuBh+YaoFbPW7q0b9muq+aVG1ktF49f94vTv+nBqOJa6L9zCDj8ztcWpZUIv9y+w4PZwGwsOUGsZjrNboDGO1ba2joy2isu88RYijffkUfINy0Z9f5T8qrgGtKPdp7pozkgYoIKHKD2Nt+yVU3RtYFm+RySQ+kbrh0EFRGIyHrhVvXj/VwNx9h3PXKhSc7YFaCeJI/WJvc7Uv7bPgTRGRI+v6BrAB0BZn/Su/hkFLKwvrBl0jLTFMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4jGPU9cQORcjUs95P54KkeJwuA4VPdM47qnWdx3zRw=;
 b=izkdGNszYBpxy+MkwI76LB2OAqe5MO5ctYayGVuXvdXU37awwR5j6vESAsGBGTahK8+lpyz/IwaxkrZa9ItaVU13d52oo//ik3kv0aVKYwAXE0y5ai3UuPqjkd+h7QNa79ouUe1+h+rFLsWT2ouQi3eP1XxsG+SkuWaZUdcFGuk=
Received: from MN2PR04CA0022.namprd04.prod.outlook.com (2603:10b6:208:d4::35)
 by MN2PR12MB4376.namprd12.prod.outlook.com (2603:10b6:208:26c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 14 Sep
 2023 17:54:28 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:d4:cafe::f5) by MN2PR04CA0022.outlook.office365.com
 (2603:10b6:208:d4::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21 via Frontend
 Transport; Thu, 14 Sep 2023 17:54:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Thu, 14 Sep 2023 17:54:28 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 14 Sep
 2023 12:54:26 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: fix the ability to use lower resolution
 modes on eDP
Date: Thu, 14 Sep 2023 13:53:51 -0400
Message-ID: <20230914175354.102709-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|MN2PR12MB4376:EE_
X-MS-Office365-Filtering-Correlation-Id: 13bc4920-7bd5-4f53-8b30-08dbb54ba401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6PbH5+20S08uXpxe0buxod1XajMQbZnrUj1wwMUYj8fuGeMYnupaKgdnQMAoimMm9/M4iWQWgIFfFG5E9JSURJzZ26olhttS7wreFwciEFuyxwdp6x3J5eOcCFGMd69EWxe+3pd7bHFV4syImdPj9/HFZUUlMs3WsELgHTHfMiYnJgX9BfytQhrNE2iEjUljrb5mLWoK261Zv7zxddY5pDIn3ItXMFobi6MlSZ2B8m69p94XL3pF28c3F8hgFX1gNQ8GUJNydanbAiaB91Di/1cz+AdUPh8UbI+JFhq4SrWu/3KM39UHxdhe0vGJqcs3LVO012BV4R0Io7fcx/3rDctH+93AQ71Io78DVbJR5YukZN1md9MM6GfyYha/cKpKdepHDnZMn8S1ZKijxk865StgzI5ClibnVVRp2EhjpJLPSNWA9HJncpM7TDOCPIQthpEp8YI0aST8TS+IgZO0nea4bbbH4rTFR35XltJZ9oQ3Q5+whZPUZisgLsgaqWvoeTBi0v74YEuuTwCRfLNJg3gj6/xEeXD8BxJPtbvviqEJHuObElUrEVitYiYnr9o9vkZUGvClSMYg/ujI2pCfgtUc+NbVPhUMqmJOVvBYhkCI6fqiu4lanIw1NriEzr4eZ5VXSkSVRlOFa7RUyAtuexsPvBbKGM3uQ9I+PXyiC4xFthsnZCz1XGvPwXPTikdQVFneXJC+5QHSbEtkdZZut+UzIDoc/t28llkxTn8RpHsQnE3Nr+hSkm0Rx/0sEQistOgPaS1BJSGdQ/OHO2xYfz33kjjlYzGmT1lYNApzE3Q=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(376002)(396003)(346002)(186009)(1800799009)(451199024)(82310400011)(46966006)(36840700001)(40470700004)(8676002)(4326008)(8936002)(70586007)(316002)(6916009)(70206006)(54906003)(44832011)(5660300002)(40460700003)(41300700001)(36756003)(36860700001)(426003)(16526019)(1076003)(40480700001)(336012)(26005)(356005)(82740400003)(6666004)(81166007)(2616005)(478600001)(47076005)(966005)(83380400001)(86362001)(2906002)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 17:54:28.1327 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bc4920-7bd5-4f53-8b30-08dbb54ba401
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4376
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
Cc: Stylon Wang <stylon.wang@amd.com>, Alan Liu <haoping.liu@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 dri-devel@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen
 Wu <hersenxs.wu@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On eDP we can receive invalid modes from dm_update_crtc_state() for
entirely new streams for which drm_mode_set_crtcinfo() shouldn't be
called on. So, instead of calling drm_mode_set_crtcinfo() from within
create_stream_for_sink() we can instead call it from
amdgpu_dm_connector_mode_valid(). Since, we are guaranteed to only call
drm_mode_set_crtcinfo() for valid modes from that function (invalid
modes are rejected by that callback) and that is the only user
of create_validate_stream_for_sink() that we need to call
drm_mode_set_crtcinfo() for (as before commit cb841d27b876
("drm/amd/display: Always pass connector_state to stream validation"),
that is the only place where create_validate_stream_for_sink()'s
dm_state was NULL).

Cc: stable@vger.kernel.org
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2693
Fixes: cb841d27b876 ("drm/amd/display: Always pass connector_state to stream validation")
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 933c9b5d5252..beef4fef7338 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6128,8 +6128,6 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 
 	if (recalculate_timing)
 		drm_mode_set_crtcinfo(&saved_mode, 0);
-	else if (!old_stream)
-		drm_mode_set_crtcinfo(&mode, 0);
 
 	/*
 	 * If scaling is enabled and refresh rate didn't change
@@ -6691,6 +6689,8 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
 		goto fail;
 	}
 
+	drm_mode_set_crtcinfo(mode, 0);
+
 	stream = create_validate_stream_for_sink(aconnector, mode,
 						 to_dm_connector_state(connector->state),
 						 NULL);
-- 
2.42.0


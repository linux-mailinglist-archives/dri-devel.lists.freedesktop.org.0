Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD38D6AE423
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B574910E5BC;
	Tue,  7 Mar 2023 15:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F5D10E4FF;
 Tue,  7 Mar 2023 15:11:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIJFvY93XceTe6Dt4nlzlemDk9IwIH0ShsICYoP8TwUdRQXJzR7KLjwnmQnFi4FISXq0+Iw6Dp6XSDz7fGbUIl4uXkeTfBdZvfbk4sVQ0DpzPncsF+J0ftk68Ob84YTQ/QgwrRXCbexxgobloQ623Z1Fs+Mj12lDj6lztEUK86gQQGwnNayJO174IL0JPe6X2Iwvady2SSHkRbMeUzqGojrdIGX97QeAtoIJVCb8rTMuUGMJGDrq2aoWEwzWjM6xBCCYKjeE14W0LASD7Ivt3p2BFRA18KxxbXj1IbW5fyDPD9nkB+Dpnt7fNeh6MTIMIgBTPWI/lWwjRNqGPfaz9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HdVyesRcI6OoWo1nlZ7KABr+hq5iWU+Yl9X+Wtf2ow=;
 b=Optxz+zRtTpFVGt9FRTy0lF/HlfyNsy/w7QmvPQ7t7B86H044zYu0g+kWVQU8eaul8GZfOXf3HAzqiEcPzDfE6bg/Pk59+qLapn/NoRe3yE4cjCPZsbTNoQ4VmRx3H4zpnjNw7+V4h1Qac7T7eksJTfikGp09fDAYrsrYi+Khu8pOFTE1T1Att5BOpT3RedkE2YDjrfSkP3zNTX1B5w8EMvEZ6kpGeU1eJcNGHe7ir61w+LDLGsoqq50DCQ2bjB2iKx7F7r2tr0VQ3QfoAj/mFwE+SUCT+xiBc5CgK8RHlzfsvOqBrLpe9lC5teH7jw7M6vV/PjL25yCAHm8hr+xxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HdVyesRcI6OoWo1nlZ7KABr+hq5iWU+Yl9X+Wtf2ow=;
 b=XIxpzfX3pbB7JKKTxHBI4/nGRloGwv1Bz0GugURAq5T7/8MogXdiHAoMNZz0raM4tdlOkUtxhgPxj9sT0shndVjf2smJSQ2Gdq30z80WMLVXOMYmFX2LpeUObqYSVKuKJJP70Lx89wgHEyQQCKaIfFYs4FPUDEhR0cbTW3YqWuM=
Received: from DS7PR07CA0012.namprd07.prod.outlook.com (2603:10b6:5:3af::20)
 by SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 15:11:31 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::65) by DS7PR07CA0012.outlook.office365.com
 (2603:10b6:5:3af::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Tue, 7 Mar 2023 15:11:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.16 via Frontend Transport; Tue, 7 Mar 2023 15:11:31 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:30 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 07:11:30 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 09:11:29 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 16/17] drm/amd/display: Fallback to 2020_YCBCR if the pixel
 encoding is not RGB
Date: Tue, 7 Mar 2023 10:11:06 -0500
Message-ID: <20230307151107.49649-17-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307151107.49649-1-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT027:EE_|SA1PR12MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: 43d9be23-a1d3-4ad0-1232-08db1f1e3b94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u0PjWXjkJvqjPvJqUQI8bUYAv8fOFD9B6ZBcfURaKOQ2cDkQDwkOadkwT4BYlv1O7/6qetU0aDyKDBLWQsjPZj9T9e5kfwVR3ERSR4GMj3WzmOX4z38LD55Sw5fd45zmL1pJu9Z4eyvQr7/Fadr9oJCzM/GJb5Q9E2zyibRRNZbhM1Hrj4d0qyGiqOibBzL/RWh8ZSbO38MA+L8Rfmsb9Rj9nJA6tM1hj1/fE7T5/6DzK3Y3lKw2RIZbG+ZCw2ops+x7jLRu/CUr8GWaEwgMaePOWNeqHJM+BXp0EaKAsamx1oyNOnxpnHHmrEkOHaZpWS049HI6TjcD+r2GTKeExPsdEn4LD61frkxt66CDKLLGb/7MeB4wNahXbNZWC4Tc3x1Hz5V36MX8SwzAq+UhpBnssI7x24S0vnTe9aVjGRbK+UEws2zjxqH7CV6p4rKLxLvYjbRzkzG4gOIUXvg8YVmVIgafaBV/hpaortdo69xMewcMLImxmhw0K+NvstMW0Dydfj44sMEPIs8EU/bmF634Z0O2GqNxhShi7QHCbdZ4/b6LOM9znjxh9AQrETeIZH6XG9SFrbuD0XlLwPI97+AW3zogSycNaDEdomBNPHdj3etIneURQ3yyc51pOPGjAfDkn8VreK2A7cZZkxo+q94IYgGcr8cg4z6OQzlxeDoBWxjC9FUz+DJkS+Vg93R4dv67zEDDh8agGJRiNp3crpaGP2e2WdrWaAcTUdWusJU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(36756003)(70586007)(70206006)(41300700001)(4326008)(8676002)(8936002)(40480700001)(44832011)(2906002)(5660300002)(82740400003)(356005)(81166007)(36860700001)(86362001)(1076003)(6666004)(110136005)(54906003)(478600001)(316002)(47076005)(82310400005)(40460700003)(83380400001)(426003)(336012)(186003)(2616005)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:11:31.1315 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d9be23-a1d3-4ad0-1232-08db1f1e3b94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8599
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joshua Ashton <joshua@froggi.es>

Userspace might not aware whether we're sending RGB or YCbCr
data to the display. If COLOR_SPACE_2020_RGB_FULLRANGE is
requested but the output encoding is YCbCr we should
send COLOR_SPACE_2020_YCBCR.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a15b26962496..d5e1f3423cce 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5324,10 +5324,11 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
 		color_space = COLOR_SPACE_ADOBERGB;
 		break;
 	case DRM_MODE_COLORIMETRY_BT2020:
-		color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
-		break;
 	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED:
-		color_space = COLOR_SPACE_2020_YCBCR;
+		if (dc_crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB)
+			color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
+		else
+			color_space = COLOR_SPACE_2020_YCBCR;
 		break;
 	case DRM_MODE_COLORIMETRY_DEFAULT: // ITU601
 	default:
-- 
2.39.2


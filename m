Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBE376FA8E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 08:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D7D10E25E;
	Fri,  4 Aug 2023 06:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2041.outbound.protection.outlook.com [40.107.96.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D4210E25D;
 Fri,  4 Aug 2023 06:57:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKummgBS0ISIe/v6yxUBETESTJDkY+Dt6z5JCmCbLI07GgUQ/VdeIDdZMOEtXk0Q9JAgCbiyvZDjpey2Z0Eet6KMIYMEOpvorMNMX9BAlU6RLQoBEQZxEzInR+S/NpFQHgi35mqIoNLz9ur73OvKk7RN7bh8yW9SPRXT4st7j36U9TnU+PgYHQNYkHk/XyHh+tdG+LPXK8SelRaiTCwLPPvC7xu15UryPmAyZb5Blg2DQxtTxCH59wGU1BcP/h9Qo9yegjdWiuRT7pF35e5AHXGMxnhVZI1rz7Sz/OZ8LELw4pTC2PKJjPMNV16B0rs04/x1LkuRa1hAOIspbav53w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fqgTVDRn77SaRUq7q01GF/e8Dhdpcruf084U87kQIA=;
 b=C2vhlQrDVDKNvuitwIFmu6Jppn5weMkTEDYT5JvK/TT8Vp9MaT6Dh+7ZAkGWmk5hsSs+m0eSZU2qKSbE7c3xddgyxug4ge2uV/TI354bOumFXvSuiKsD8Vj7ig+iMG+p6OAUxC4N8yZX9OLaaINOEHVSQ4Txeomi+01Xi30g2Z9m6Qn5bQqRja/DFJLbHOvLjOEOdjB6N7pL4t/58+EuFZm6KKvBOpx0DvhZq2QCIkUXJe3if/jNCfQSm7Hd3mKtxrEhpCisQp5NEazgBmRVqMGILNlBU/wTmrVgKHEM5NDwAnzMjkDAAuqcrzqE70CIaVTSw//RUSDS5XwdEkfX5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fqgTVDRn77SaRUq7q01GF/e8Dhdpcruf084U87kQIA=;
 b=VYykxby6kQ7XFc/1PdwoyYeT0tHZIzFRG1zbe5ERVPH/uwPsRJa5TCR2wMkkZw5xa17/twPWsUY2WgjZCWDr9S10TyRYh0jSwWSyyipI9FNaIcjYXxz0CZLhuxG3So0vbLwgG6lh9iQWRo131retAuaZydKH2tc5/OmJLidIy84=
Received: from SA9PR13CA0070.namprd13.prod.outlook.com (2603:10b6:806:23::15)
 by SA1PR12MB6947.namprd12.prod.outlook.com (2603:10b6:806:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 06:57:41 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:23:cafe::99) by SA9PR13CA0070.outlook.office365.com
 (2603:10b6:806:23::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.10 via Frontend
 Transport; Fri, 4 Aug 2023 06:57:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Fri, 4 Aug 2023 06:57:41 +0000
Received: from majun-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 01:57:39 -0500
From: Ma Jun <Jun.Ma2@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>
Subject: [PATCH] drm/buddy: Fix drm buddy info output format
Date: Fri, 4 Aug 2023 14:56:47 +0800
Message-ID: <20230804065647.4096957-1-Jun.Ma2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|SA1PR12MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: 9452bcdf-8bc6-4dcf-1c6a-08db94b818ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AuYE786BP+IYQXkhJLdqmpHpi12u4TEZNw+vgD2oDl+jwuxdlzLjF20/jnl/gd1f4wvxc2X23j2Y+jd//2np9iBG0izdNnmqesSehfzCsKw3EFgBYpWnsMsGg+gOSHVR6hS05fHVP5A66OSfazYOZcJZZ82OY2ZwIcNUUo72DbnLU/4hfsLduigb5+jvITQ/BM8dukHYTsCTrq9nAU1CJ26WNnnf7r+lEX79EAU6uA7AkVJgd9XugjPCTSp+VsShzMvoTIelQVM2czGJl7SiKlNhCtA1QM0qhXy/23AF8ObF/WbaxfZe5NcwZX+u5FaafxDvIX2UHNtnNDjoOQBHClFk9M5ZJtkXv2xjP3jLtetzW6pnmrFm2oeb2Dzb4fs5JkmbWoL5tB0ExMjNPkhRe94z9DgsHtE0ci//lxvAc+wgoS2B2oJjAzGpyzJedsNGpa8qevwTxEeMB/pAF36UjdviFseoEL7mjI+ZSGXAqXDVeYH4yrGT35v0Trd4hGflWMaqqOFX/1Q1AyauDwiMQYrAd/acTKSie6htDy9wl5K17WT7rylmcrMULRnB/E41s41tVop4Eupp+6IQjZgud3E4lABlOKhCDQeJAyUhGo8lFFiT1sX3VqNu1a2gztaU3GpMn0B017LW78ex6bKcNHxtNEltH2EyBQlHIh1JU/RFNT3nCL3lz7iB9AJaBYujA0taYnAbT76FhOMHgRKmPyRgIEcI4+qCEsMeluqgmY79N48yAhZM1HKx5gnU0EYoWM3I0Db2UVmZVV5G6P+w/Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199021)(1800799003)(186006)(82310400008)(46966006)(36840700001)(40470700004)(40460700003)(16526019)(2616005)(426003)(1076003)(83380400001)(336012)(26005)(47076005)(8676002)(36860700001)(316002)(2906002)(6636002)(70206006)(5660300002)(70586007)(4326008)(450100002)(41300700001)(8936002)(6666004)(7696005)(4744005)(54906003)(478600001)(110136005)(40480700001)(356005)(81166007)(86362001)(36756003)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:57:41.1389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9452bcdf-8bc6-4dcf-1c6a-08db94b818ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6947
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
Cc: Ma Jun <Jun.Ma2@amd.com>, majun@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[1] Change pages to blocks to avoid confusion.
[2] Fix output format to align the output info.

Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 3d1f50f481cf..ef3dd15c334a 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -781,15 +781,15 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 			count++;
 		}
 
-		drm_printf(p, "order-%d ", order);
+		drm_printf(p, "order-%2d ", order);
 
 		free = count * (mm->chunk_size << order);
 		if (free < SZ_1M)
-			drm_printf(p, "free: %lluKiB", free >> 10);
+			drm_printf(p, "free: %8llu KiB", free >> 10);
 		else
-			drm_printf(p, "free: %lluMiB", free >> 20);
+			drm_printf(p, "free: %8llu MiB", free >> 20);
 
-		drm_printf(p, ", pages: %llu\n", count);
+		drm_printf(p, ", blocks: %llu\n", count);
 	}
 }
 EXPORT_SYMBOL(drm_buddy_print);
-- 
2.34.1


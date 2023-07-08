Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFED74BAF5
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6054710E023;
	Sat,  8 Jul 2023 01:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9126B10E023;
 Sat,  8 Jul 2023 01:14:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPnxdjDYV7GWdLFBKAjvgzFu8v8QgaiFzyCnkVeI6QV81+JiGf4YKG0SmJJY7+v1nFAvqeVuW+Lwp+56dragdjvwyl/Kz3EskTIRBepKxSEmwd8H0o3ADc0hYnBA2svMXNvdp1rJFt5lZI88cFCd6euNyZ85oNvJ4UQxAhSCYUx917eAVHBcqAvoYE+5I6lUVUMo6dkP2xzaKOLPGw1b0gTdOVmfJImXt3afk+6Jw5y9u+apZ8ZCQzXM6OBupxdMo181JnIPXEDaOhqYqkkONPZP7M5r2J1or5CSzvv2GqQ5Ep6EutAdrjNfbHpBdn++TvsfCu+kvDgyXOjxuYgY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpQeih26Wz2un1957Euk0SftecHZ2izGVaWRNzlAjBM=;
 b=Y3P0vW0Q+mVbhbKyKARj6f+JbNbATyl5DlIdKih2wmAj70xt/D6UcrmtY/Ssl/phaORIbyroxXcWrjt3LtuoPZhyQsKIJUszFIGlYRqI0amo4I+REaWi9NHrFMtSUd3FNrWFfVvKFoLjYBib14lf8TC+oG0QT8flnywP/lACTiTBkJsmBXygVVtH6gfJsCJ0+AMmIDWcW2HWnyznjADlMIbvca+RGzj5NRgdPTXpW8hr+DFgBNMbKIhiOvajyBtAvBDOcqsbP60VUmAo90j5kwYyZGC1gAmngwCovw1z5FzHlt0y4JeoDzaSkcoblyyv+R8qYpS6OYhRimLRwpXLoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpQeih26Wz2un1957Euk0SftecHZ2izGVaWRNzlAjBM=;
 b=1udxRiOpiVpPlHMg1tnwFvYpQw5F85ErvthmXRRoPwmia9mf8T2lZx90gGozhjZP4kGhCyzgEjuUaA52arMhaZJ2v2CFgVheGfbNSucST/Iu4cjcxj23dk1glXqu/vw4FzHHvArddZPANtCQyBuGADNKMLAuEuEn43fLrLoCe8k=
Received: from DM6PR14CA0068.namprd14.prod.outlook.com (2603:10b6:5:18f::45)
 by SA1PR12MB7038.namprd12.prod.outlook.com (2603:10b6:806:24d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Sat, 8 Jul
 2023 01:14:09 +0000
Received: from DM6NAM11FT090.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::d6) by DM6PR14CA0068.outlook.office365.com
 (2603:10b6:5:18f::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25 via Frontend
 Transport; Sat, 8 Jul 2023 01:14:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT090.mail.protection.outlook.com (10.13.172.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Sat, 8 Jul 2023 01:14:08 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 7 Jul
 2023 20:14:08 -0500
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v2] drm/ttm: Use init_on_free to delay release TTM BOs
Date: Fri, 7 Jul 2023 21:13:55 -0400
Message-ID: <20230708011355.853-1-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT090:EE_|SA1PR12MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b6f2d51-4349-4ead-35df-08db7f50a1bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0g77yM+kcBxkij4FcMb2DyVGNIgakNMsvWwWwDrhOOGMJLioBriQDmpqyIbNKwPTS7UIX/WmvCSZg25L7kNHKi42OeeAE5IkTakkGDuQD9XXRnoFChqAJ4uTY5192/gdURt48L2TZ1GuuEAs1flV/CSCDVd6wCqeXQOHhV0Mp8Xe/DWH+XDUfSCsq07vD7ekO8T4W4RGdrC1RXx4gwu9GDT6R7e95Bzmfvq3lw9lxowb4VjK6M6Wvpzb2/YGNh2NMI2ULELXnyuTnSejGeSBOzHTIV5LP5J61qUX3KKUBu60qoLrtiLFS0uL+gDzvLoNi2X7aGT35YpJ1hf116ZKj+qWhc2MCxhAqOzYgs5uVc5f5TWR08A8vIBnyrZkase33U9nuA8j8uG94wi7ls4JbOxqeaw6EAc0+IHf9GuPYQGBba51WWLddJo+DTiihmYCULoEAdEVpIMtukymBt08sHLlIlsNAm1yAnBpBNPdWtTDTOt4wjiLXd/+a2a/Io5uD1S5CdTJqtrgiiBCtwavqaZUwBThp93kwF8c0CqkrwwHDvEGFHpt82U1g3xzASs0AdOY56/hMHczyYApdH308AIwWk5XNIrAevms+1N7Mmw+Dv8iJqNKg5PRgCOL+DpY3kM8HLQVq+A5ztTDmXNkudG4oDyqbZV5yq50Jok4CKBV0Ni6Ilia3HLLwAYlSziFYfkcRLJdt36GxXKLCL5ezttdQgDAkWmYRoJZSKTHcWMWvHWFa/pBznn4+lzid6n0QGitVZO1TZOiaKpu+7fyUw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(40470700004)(46966006)(36840700001)(478600001)(7696005)(6666004)(450100002)(54906003)(1076003)(26005)(16526019)(40460700003)(186003)(70586007)(2906002)(82310400005)(70206006)(41300700001)(4326008)(316002)(5660300002)(44832011)(8936002)(8676002)(6916009)(81166007)(356005)(82740400003)(86362001)(36756003)(36860700001)(47076005)(2616005)(83380400001)(336012)(426003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2023 01:14:08.9697 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6f2d51-4349-4ead-35df-08db7f50a1bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT090.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7038
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
Cc: felix.kuehling@amd.com, Christian.Koenig@amd.com,
 dri-devel@lists.freedesktop.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delay release TTM BOs when the kernel default setting is init_on_free.
This offloads the overhead of clearing the system memory to the work
item and potentially a different CPU. This could be very beneficial when
the application does a lot of malloc/free style allocations of system
memory.

Reviewed-by: Christian König <christian.koenig@amd.com>.
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
Changes in v2:
- Updated commit message as per Christian's feedback

 drivers/gpu/drm/ttm/ttm_bo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 326a3d13a829..bd2e7e4f497a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -347,6 +347,7 @@ static void ttm_bo_release(struct kref *kref)
 
 		if (!dma_resv_test_signaled(bo->base.resv,
 					    DMA_RESV_USAGE_BOOKKEEP) ||
+		    (want_init_on_free() && (bo->ttm != NULL)) ||
 		    !dma_resv_trylock(bo->base.resv)) {
 			/* The BO is not idle, resurrect it for delayed destroy */
 			ttm_bo_flush_all_fences(bo);
-- 
2.17.1


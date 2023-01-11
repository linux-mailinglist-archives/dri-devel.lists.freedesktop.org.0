Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1482C6654A8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 07:36:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CE110E6F0;
	Wed, 11 Jan 2023 06:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD56D10E2BC;
 Wed, 11 Jan 2023 06:36:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0EvZW8FsNnO91erBkkv67fZX1nfp48uL8p/BtSV418nGCCAwXkcdPqsiGd/MZsbDtjuuFWkyeDgxdVQJHdTgmw0+xEVA588fgPrcqCgmlFgjSZwQZEfXsS7lILEgkrWjVrmAdDb+E1katAnnvtNINVvVJCv8QgQkfxvocU0Kk1HdRKrIAQVIAw+B3uQMeT2hCqgh3qTSqmScw0QpbreQZvtTQ2p4puqq0ohj2ONICOGyQLl5+MUAno4UyzkSRjP3Hfq1pG4R+0Or8iSwdnPpSfU/DZK/2Yp64nD5bClF5mKDBK9xhB1lq3Ib0V49snxQq1FaB/0lRVkoVG1XbLOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hetaPhZ5dF/7AGPeBD+AD90OMXHyltCN49kcCozdtsg=;
 b=Rnkpv/D/ssA+CFAS+j0sYs0ScSQNAkIyDWJcy61GDSQKdYqaQoOlgRgN5W42u8TuSN7+ZRI0cDvFh3vskMzsJe6KncgwsL4Z5REGtMhEiGMQ3EcZBoN7nbu8eLICfrfny2OVW7Ot5sCcw731cx5pUEimr6rt+UrNGXiYzTPp3q/FvBsjnqQkKuuMZugZSvhMFm6cC7UUmf6ARfA1FFMApvjWgKFrzFI/SUqGSmvJpUjyzj/dIFSPEnjxB2GFWbOvW4ChRZYoD9wih6iNfsAf29OpjjsTxHLi/eK2ZhKaCngWolGona9JeHHqG5Ptpnnqstsmvte7DsV4Jk9WvRaKUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hetaPhZ5dF/7AGPeBD+AD90OMXHyltCN49kcCozdtsg=;
 b=SWJN9In/Ywh02YtMJXDv6ZcAJgbW9vYb1qfNNvgE2IVx+HMaColf93bVmTmCre+mzHgP15FHoteVFOtTHe9v4eYqUeUf5xNSgh4oOXvDPh64JAEiO56zaeC+0QOVTYbMgyZk4SsvpadNp5j0GZCIynfSgMgJnLOeTrkpQtmddTw=
Received: from DM6PR13CA0067.namprd13.prod.outlook.com (2603:10b6:5:134::44)
 by SA1PR12MB7152.namprd12.prod.outlook.com (2603:10b6:806:2b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 06:36:17 +0000
Received: from DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::2f) by DM6PR13CA0067.outlook.office365.com
 (2603:10b6:5:134::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Wed, 11 Jan 2023 06:36:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT085.mail.protection.outlook.com (10.13.172.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Wed, 11 Jan 2023 06:36:16 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 11 Jan 2023 00:36:11 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v3 2/4] drm/gem: Remove BUG_ON in drm_gem_private_object_init
Date: Wed, 11 Jan 2023 12:05:22 +0530
Message-ID: <20230111063524.2374038-2-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230111063524.2374038-1-Amaranath.Somalapuram@amd.com>
References: <20230111063524.2374038-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT085:EE_|SA1PR12MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d56640a-6317-4812-1dc7-08daf39e2458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j/pQxbeQUVQTA5hb8tzREdTIluU5tAMZ2w1bFTFIGSzEVrvIrmXP6G0d95L90g/8BqXsazD0aqs0syt8DV4CdUBLEr+DW7++VU9Z4WrWZI6o3DPQC7yuQbnRPO09+b9P1VxE+XRfniO0j7EHlwJEprX2m34//a9fQUzO0sFE4JzN5RGx/0wC0Z+VAheYLXJq76dPE4w+m5cv0iVsrNHL4vXv00LKB39xxJrdqbUOU1vZK9rJLt+ix7Q8s1MxUXns21GPOAPhqbX8yIGEiInXlADwOjt0trCMMK7cQjjXwjDsYlpccwVcSPAdbbNw2j1OZk4bLOiIHydzRfUOYHhJjbing/XZ42CH32/54weSyJ3PG9oe7/htwrynqWWAPBKtmb7aP8IJShw/qILHufOt3VMG+P8qc0SvkjcXTfl10AtNZNxqOm9Wo3PqmkTMQXPOcqpBOrZ9YyYrLIymj+ObjTA42VMbD7QqGPtWr/RLp8X0vJ/W5/zMGdR/M/Jk8iwh7GdUET0UJkZLo+NGxB2P8A9c/az9cAEuiVMEaELY+6WDLBh31i7gXeGCxS1Dm6a455viQ8aMq4aHPn678z8rrNpL7yW2P2UwgD+6ZXJLjC7CemV01UVG472GHkOADS+5uHDnbXOp+vdvA+1ikQeGBP8vykkZnvVpJhqn51F25f4CJWP0TaGa9PAVArFpDm+BEb0wfwHYxCkeIqqC7sGGsVVF2xkN5RitlRpCxxC9d0U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(82310400005)(47076005)(8936002)(2906002)(5660300002)(426003)(41300700001)(450100002)(81166007)(4744005)(7696005)(70206006)(4326008)(316002)(70586007)(8676002)(356005)(110136005)(54906003)(26005)(16526019)(82740400003)(40480700001)(1076003)(336012)(2616005)(40460700003)(86362001)(186003)(36860700001)(83380400001)(36756003)(6666004)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 06:36:16.5858 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d56640a-6317-4812-1dc7-08daf39e2458
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7152
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
Cc: alexander.deucher@amd.com, Somalapuram
 Amaranath <Amaranath.Somalapuram@amd.com>, arunpravin.paneerselvam@amd.com,
 christian.koenig@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ttm_resource allocate size in bytes to support less than page size

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/drm_gem.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 59a0bb5ebd85..ee8b5c2b6c60 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -152,8 +152,6 @@ EXPORT_SYMBOL(drm_gem_object_init);
 void drm_gem_private_object_init(struct drm_device *dev,
 				 struct drm_gem_object *obj, size_t size)
 {
-	BUG_ON((size & (PAGE_SIZE - 1)) != 0);
-
 	obj->dev = dev;
 	obj->filp = NULL;
 
-- 
2.32.0


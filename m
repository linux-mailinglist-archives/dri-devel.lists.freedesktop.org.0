Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE7D717637
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 07:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366E310E083;
	Wed, 31 May 2023 05:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4043910E083;
 Wed, 31 May 2023 05:31:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqciNz4GHHp5LjEhlNuw/VFijdC2Bw/m2mdl3/eZZ83rWi/gaBdzOF/ntxwHVd6mfdJAImlCz4mzuAXKLQtIhSK3RGBw5ULttzahDG5jjMepK3yIou1QYQDDsR6xQ8FsTF0vVasfy0a7/BAzIK8Qr3T5hWYIgFHCQ4cF/BnPoKQBNsecRnrxWkYhFopKZhZKOkkLcJN72ifCMxw+otcZ666wgowCvOggXMlr75xK/IEuyjosMpPbtkxAvfkfJbNpqGb0yd7m91yzXitaD4oKI2LYafF+DtAfS7wmqjwtR51qC0rRSvzoJqbKu8+JIrdmdeWa15q00J04rqDdsuIMvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXMA0+4ozOdpDYWkhWH3cg9DK6x8OJILyPFUR6G/U3I=;
 b=TlEy6JbhsXqrdpNZHAsB7cH/BbNwEm6B9lRmF2GnOjP+qnp8RwRFUX3/1CGxbKLHrrwIw0EfVsUZybvWWghDEoI49jYUKVu81E+7KmRGRXVD2GSGzkvLAmtMjsTTj1KdBoobULytiZx4KI5UAzxr8T61QOxuBIOgA0VxHuXTxgj0DXOMZq92byuMRvh+DjMFnLumDforMYG1zlbHa5ofusl59u2lF7BGcx8uD5s++ADbTKUR2P6NqvOf9urmf6TztiG6ygMqrieZDAWsKNAGrfYhcyBvAU7vJAKQKWcNnyytbYOy3x3wENJUaHy4mjFaLS3Pc8DJ+7t10ls0F1bwmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXMA0+4ozOdpDYWkhWH3cg9DK6x8OJILyPFUR6G/U3I=;
 b=j3LM7HIOn6lZgKAFIRInz84PrJzZHRh3mWaulx+xfaviIv4wk3OuPSSSoQgRet80yqS7WpqvK50XbyTaT5ofewVcXvZrSmcEama4zMHZ0yUP6l53tMO76pzkLve6/6gYfAXrvetvgI1PoCz+snOpG6ZU4kCx0TG3Lo6te0KNsK0=
Received: from BN9PR03CA0888.namprd03.prod.outlook.com (2603:10b6:408:13c::23)
 by IA0PR12MB9046.namprd12.prod.outlook.com (2603:10b6:208:405::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 05:31:20 +0000
Received: from BN8NAM11FT075.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13c:cafe::5d) by BN9PR03CA0888.outlook.office365.com
 (2603:10b6:408:13c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Wed, 31 May 2023 05:31:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT075.mail.protection.outlook.com (10.13.176.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.22 via Frontend Transport; Wed, 31 May 2023 05:31:19 +0000
Received: from majun-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 31 May
 2023 00:31:16 -0500
From: Ma Jun <Jun.Ma2@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>
Subject: [PATCH v2] drm/ttm: Remove redundant code in ttm_tt_init_fields
Date: Wed, 31 May 2023 13:30:51 +0800
Message-ID: <20230531053051.3453509-1-Jun.Ma2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT075:EE_|IA0PR12MB9046:EE_
X-MS-Office365-Filtering-Correlation-Id: 92aaf095-df24-48b6-91d9-08db61984399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OUoS35AZs/06pmC2dQYzToFK6wp/rVoOQjBi/05XrrzB53oOVwXlaQtcwexfN2jtqNmxhKmteq7yzh9aQaXCfcLskoukruXWHTSpKCGfkjsQcxJdKVmQj4SgG9vYViIMNF56OwgZpIupEjg+hyjnjUoz9Xii9eHlrrBKC8LHtkwR4wwLwftdFFMIGzDis7TpBUijl8I/rIToWW3Q7cAAiTLfM4CG1FkwYcJPF9UgmY4CTfthzHaUP/eAeYWVrZJeH3iJRYL5PC+UEauzbBxmWJjuHriy32ciCRbZeEcPpuf3z8pT+N3FO+yrbqO3q06Zc3XQ4xpS47e7huyfgn8pwBmuSBnBwgd7c++yKG7P/C/3zqjqqyItQwMy4020InEScrnoM6sxzTUij6IlJQyTwDSN22OcKVecoS52xRfLXoZK388wDu6/z89Jpm/EDsxTQTMlZk5fEtb6uCJix7PpuZ55lsRRJHGWBprL045dfkj1XxG+2sn4djqItUNvJ1ze1qtgqp2txyn06MF9UwP5+6zFtDHzrRl9jO4bzl73tU7y0CbSExQYv3CHE3NsCykFnTd5S9Ale1fvB1qwMAcnyllbkpZ9pFfxEtc21iZHpBe8tGhF7NFWlhPKgny2eejUHCoTFxqs2Vc/gI11tI1LSeDG4D85cxenUSWrXIESBMSJ3t28OG6o3aqVQGcDHgNjQRH3w6PY1TaMe4upXFuConw1dS7nB5s+tz3LdSK/K2GpkyZtVe0so1vswnVt8gJNxF5Dl28xooGMM/S+n1K7wg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199021)(46966006)(36840700001)(40470700004)(47076005)(16526019)(83380400001)(41300700001)(6666004)(1076003)(2616005)(186003)(36860700001)(26005)(336012)(426003)(7696005)(54906003)(40460700003)(478600001)(110136005)(81166007)(6636002)(450100002)(82740400003)(4326008)(356005)(70206006)(70586007)(40480700001)(316002)(5660300002)(8676002)(8936002)(4744005)(86362001)(2906002)(82310400005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 05:31:19.9649 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92aaf095-df24-48b6-91d9-08db61984399
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT075.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9046
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

Remove redundant assignment code for ttm->caching as it's overwritten

just a few lines later.

v2:
 - Update the commit message.

Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 02b812dacc5d..45a44544b656 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -143,7 +143,6 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
 			       unsigned long extra_pages)
 {
 	ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + extra_pages;
-	ttm->caching = ttm_cached;
 	ttm->page_flags = page_flags;
 	ttm->dma_address = NULL;
 	ttm->swap_storage = NULL;
-- 
2.34.1


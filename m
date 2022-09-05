Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFBE5AD79D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 18:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D5210E436;
	Mon,  5 Sep 2022 16:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1650D10E436
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 16:35:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPgSA6z9J0O+7PSGNqJoBDHqkZNw9V+7P/tL+d9vpoqSDmSRdDxo18n62jeZCBxRzh7A9ver4p6UcxU6Zw4+e6xrKtfBDmoH2c+27iTQo+in2f9S4R37Ped46sPAGk+FR48BJvdF6xngwWOrWUAlivWmkq56Bcw4BVWddgtlKAny/i6VeDN6Rr7tFBklSbgDdjAQOIh4sinHP5GrdmMvWJjjRXrppoViKQXlWH7FoqXqC2/djEzkUqW1wul4rc89ioNh7K4g+2wRpUA32+uWdFWb8xwYC6GeEiSPWzynE1hkj4YyCj090LOm8kAa1IwFkCJWzGAw6oR1djSH+UPkMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnVNPUuHP170ocIwgDxILHO+8+oRYs7NJQgQ0eUAG1A=;
 b=mbe1iot4xuU35WHAaiMzHqMfguChD6b3eT0WClWZg+8CeByeVd4jzm0oz6VxnlftnHHgAYLBinTIYmD3Pu92znoqNDdc28vlB5M5J07TM1WwlKnpoAa1YTPQ3nje/XQsmvWq+21CI+a+ISfXa+OuV+h3IgvsTUVaZMezZROlA84l5xoFVP2FmQ0G3VvGADu634EeL+RVCwjByLFS9jrcbJTO5h/3IbIKEcqFs7eaAP4J8XiSBcU1qaB3Q+heL0zDT3nwK48nj8tmDCTMXC3cZAa5DBWfCWNIOQrCXkWlyWPUm8o3WWsLfz/7GM6KPCEQihYbUVMieBohJJzrHD4zBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnVNPUuHP170ocIwgDxILHO+8+oRYs7NJQgQ0eUAG1A=;
 b=wdrYixAtk7zC5R1M7v/DtnPB5VA3YmkgxZvYorSDqJz06Qd+6fPynsLKmyGrDpHXsbeiD/8Gr8h6V1xaX42mDXfN2Bw4sHQinFIw+EXe1XsKyYXhL3cY3ovdnrp345EcUy327zIimu1/tHI7B/DOh5MUhoG3MokmNUMqGj9Ni80=
Received: from BN0PR03CA0044.namprd03.prod.outlook.com (2603:10b6:408:e7::19)
 by BN9PR12MB5131.namprd12.prod.outlook.com (2603:10b6:408:118::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Mon, 5 Sep
 2022 16:35:44 +0000
Received: from BL02EPF0000C402.namprd05.prod.outlook.com
 (2603:10b6:408:e7:cafe::83) by BN0PR03CA0044.outlook.office365.com
 (2603:10b6:408:e7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 16:35:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C402.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.10 via Frontend Transport; Mon, 5 Sep 2022 16:35:44 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 5 Sep
 2022 11:35:40 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/4] drm/sched: Enable signaling for finished fence
Date: Mon, 5 Sep 2022 22:04:59 +0530
Message-ID: <20220905163502.4032-2-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905163502.4032-1-Arvind.Yadav@amd.com>
References: <20220905163502.4032-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C402:EE_|BN9PR12MB5131:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f5b680-64a4-4fd6-6472-08da8f5cadde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n0xAtG+OW5DpT7nvzEluo24UGAPfU3Mzt873UF/fmHYt2nG0oNxTAgrjrIyujEDCMtRgT0f/3puYQI0i9FTbTVVqvZMywfn8NsvBj8941q68z4EmrWr5fFkqTG1yipPBUsPA5kGvTDoXwd6dhCyP6RAWOxhmcvCQihhFPLGUAoBveszocmFD6hbC4FrJr8bh3f/4bJ0ii2sWted2F8U0tBpwK27o3tH3/1hYUoyua3Rydf0fgcm6i7vdDd9bN5XUU1JOhP6YvAcpMnaOoVnFl0XPIyc7R2kMKjGcZ4CwKyGrXRPps0mBjYulLx+r9OSEVS9ymwKKcjd3KijUGXH4NhPvj9SMNIdsz598WjPej2+I17l1hXP0Vb7YqD6b6KSNiHWX2lVYaA7eTZDho7FDELI9yVGZsoZ78qbCaibz1j3BVv7/9C7UtXHLqKckX68Av8cJvHX+PUBmu70bPj+5zdk2ZKfIT4++6xL9hs7Ws0UkrXt+NlERMKq0JPgnpBE+4RxFnmis8RE1bbYdzsrOpGZC7ADDmcNWki1AOt3ZmcaZLC0+g9iQipJL6a0Oj9Moc6cQM+b0e29MwH5G6G4bpNw8wnbRbAVBAh76ZtlpHf46LRfGCHZdlucU29KxcP4n0PW85OQ9WMkJvGSRrG2arRQ777m+cs/nX4dgsDagvxVmY6PI4s3b0eqfvaMlSXaJsofXycCra3Ltx7t1c/F7IiewYnCxcaxhcWQQYXGOA+Lcp7YK259xpaokzNsCjuE/iOYD9b+lSBp7DKuLraKJVo79yvl5mvFGWB6WQzxDEx1fm9KGfUTR2y55lbN4TIRmDM8Z+qDG0gQxPmQgUwEf0bYmpuFvPkX2UcMqzR0fq91yPs8pboLBxDETIVvHGfmw
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(36840700001)(40470700004)(46966006)(426003)(36860700001)(26005)(70206006)(70586007)(86362001)(47076005)(4326008)(8676002)(7696005)(40480700001)(81166007)(82740400003)(336012)(316002)(110136005)(6666004)(356005)(921005)(40460700003)(16526019)(82310400005)(5660300002)(41300700001)(478600001)(1076003)(186003)(36756003)(2616005)(4744005)(2906002)(8936002)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 16:35:44.2361 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f5b680-64a4-4fd6-6472-08da8f5cadde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C402.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5131
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here's enabling software signaling for finished fence.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---

Changes in v1 :
1- Addressing Christian's comment to remove CONFIG_DEBUG_FS check from 
this patch. 
2- The version of this patch is also changed and previously
it was [PATCH 2/4]

---
 drivers/gpu/drm/scheduler/sched_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e0ab14e0fb6b..fe72de0e2911 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -962,6 +962,8 @@ static int drm_sched_main(void *param)
 			/* Drop for original kref_init of the fence */
 			dma_fence_put(fence);
 
+			dma_fence_enable_sw_signaling(&s_fence->finished);
+
 			r = dma_fence_add_callback(fence, &sched_job->cb,
 						   drm_sched_job_done_cb);
 			if (r == -ENOENT)
-- 
2.25.1


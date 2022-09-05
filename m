Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FF25AD0DF
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF8E10E2E4;
	Mon,  5 Sep 2022 10:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4629510E2E6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 10:58:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPt8vqfqgI9pzuGHs5rdVX/uyzSxP3hoUIDFTabb65KrhCHgZNGEPMDPU8MbwvluinnkCFCZosmR9Lt4HSoMRfGdvocge6V9WilsNGSvKM5cwghvde6I/IxoafpEZFaOz0K7Yt1cWrI+X+2SSNxMzUO4h9hsdZHcq+dV/SMZfFaX7brIWZdKuonu8vRC5ZZ929Lz5SShW81FrPfUH9JbwA29ozz/NvW99DOcIlRvPnR6mOJy1bWGYA9mWYsZqAEJ/VoJRUHGf9XxC+3HHDnMZjZCW/fkBZYXZTS0nAXpI2eKSlUTGF05fjFNzn85EtzkHv96209zOf1gPuDBE2NexA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pd3YKTi1QnWIwrhIbThqG/jNGpb7GfrRp9aQt7mObKA=;
 b=KNJc6Y2+iFua/oJHLEbGQMPg2R8dplMILFcUtxNaGKwY4FPP4uHINSJ4HRJY1bG2RlydX1RLMgq7yrwmvOdzfG3SwvdmzcKP6ZTr8sneQYgrcRWaFez0xafLYdROV94vHi8OmMeMHeqG7QZwDiBCSh+HB4UpMgA23U9ZU0NPoAMNvzKkGZZCF61QHQVlXfP6m0xOPq5TXZW524/lmdQ1P4bG85LWH1QE6iUvZE7hpIdvK4anzzmGX4xhlsWgqnIfV2C6tEr8qKaI+8l3OMWO8Lcp7y2DQYVv7y91ViAcuvaoI53uns+C3o9gSb7eV4O9oEmPDaFj2P/9F3Hzcva3UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pd3YKTi1QnWIwrhIbThqG/jNGpb7GfrRp9aQt7mObKA=;
 b=xBG0e++Mb5bGjdjcKoiCaaIPR4URJ01BuIcqt5/bXe//Xwl6UZlEt1iBoaOabe940y04xI42ks29PBJA4+1DEIY6H0tPSq2YELy7Wibu3u/9ntKtva61IZEU131Bb0m+Dp//BhkNhy3KpluS0evGB8/PC5e6kyZADEkX5jQy0kg=
Received: from DS7PR06CA0027.namprd06.prod.outlook.com (2603:10b6:8:54::6) by
 PH7PR12MB5853.namprd12.prod.outlook.com (2603:10b6:510:1d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Mon, 5 Sep
 2022 10:58:01 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::e5) by DS7PR06CA0027.outlook.office365.com
 (2603:10b6:8:54::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11 via Frontend
 Transport; Mon, 5 Sep 2022 10:58:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 10:58:00 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 5 Sep
 2022 05:57:56 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] drm/sched: Add callback and enable signaling on debug
Date: Mon, 5 Sep 2022 16:26:51 +0530
Message-ID: <20220905105653.13670-3-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905105653.13670-1-Arvind.Yadav@amd.com>
References: <20220905105653.13670-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 996ba616-27e5-49a9-f042-08da8f2d7fe1
X-MS-TrafficTypeDiagnostic: PH7PR12MB5853:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uFBS+y0KKnmUl0IKhXzRpiZAipXgej0FtWuqxHBP2yMGTkkNDGwmaMUI9Lp7JBrUNHYlEqT2ctnhR9U/bOPymsfN/O+fioYAOptsJ6qAGinnV9l8vZ+DmT49Y0l2io2iZNIWfRjq0qFJKaWWaj1icLQQ4J/lo6vuMaBFb8mF/foeGBQJN37Go3puQGtHQkD/tznAH6hdj7FrI1cj7DfU/uguzxmQ5mBDef0xWXpuNda07Yh9J99eIEg5AQsJry5cnu70LyEHsj2Gzyl8tFG6BNc9QrIUMCN+RrKIlxvp+xoD3/KfAbnE12lTEwV9Ov0TsIgQbyxZxuIkVRX5pdT9NkR8lb5gPQSIr5Z7jO1ExZMyESFAbt2uSlT8mK33tEePsz1PoF9AuSwlHi4/ov3AlYun5cg/EJtXtC/2Vv35Frhef+LTMA4O70KLiv0pixw2cZp/QBomCWcDvlTXQbyKAoKe9Fd4uswoIBpX4lJTcUWSFz26dKCihXgI6itztP6pVJy1RTZc7ShVwWVJbwZeDqj1rmhyX6Wu/nPpotJRifg+bCPQPNoYPzDtRx960387j1yv1G4W0v3Na1Yf63NxJIRDF2jDFW5ZS/FLmdUJvo3WCn3i5uoCvFXP1COqlPmDqu4sgZ99gvV2W7J9pJklASfpPy0mW1/X2PYdsDZzKiRlMjaliYfpqJz40+/m6tIoJAgUMm0uABFahZt9uDsD4Sa1akzeudU2+fBtShMslPOr+wW13iYo2WCTvtj5vaQHKt8JDGOQahHom5EIRrH0vFF8U/Ra5kdXlSMI6ecve0x6KDkZFr7dY4ntwklpq+cKs8XOWSGJwII0SnM8rMl2aN4M5GD+6di5LkAn5lyWFNhsSDNWa4qKS25AIMfIMEIg
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(346002)(39860400002)(136003)(40470700004)(36840700001)(46966006)(40460700003)(82740400003)(356005)(81166007)(921005)(70586007)(36860700001)(83380400001)(82310400005)(316002)(8676002)(70206006)(110136005)(4326008)(2616005)(336012)(2906002)(40480700001)(47076005)(426003)(8936002)(186003)(5660300002)(1076003)(16526019)(478600001)(6666004)(41300700001)(26005)(7696005)(36756003)(86362001)(2101003)(83996005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 10:58:00.7222 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 996ba616-27e5-49a9-f042-08da8f2d7fe1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5853
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

Here's on debug adding an enable_signaling callback for finished
fences and enabling software signaling for finished fence.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 12 ++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c  |  4 +++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 7fd869520ef2..ebd26cdb79a0 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -122,16 +122,28 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
 
 	dma_fence_put(&fence->scheduled);
 }
+#ifdef CONFIG_DEBUG_FS
+static bool drm_sched_enable_signaling(struct dma_fence *f)
+{
+	return true;
+}
+#endif
 
 static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
 	.get_driver_name = drm_sched_fence_get_driver_name,
 	.get_timeline_name = drm_sched_fence_get_timeline_name,
+#ifdef CONFIG_DEBUG_FS
+	.enable_signaling = drm_sched_enable_signaling,
+#endif
 	.release = drm_sched_fence_release_scheduled,
 };
 
 static const struct dma_fence_ops drm_sched_fence_ops_finished = {
 	.get_driver_name = drm_sched_fence_get_driver_name,
 	.get_timeline_name = drm_sched_fence_get_timeline_name,
+#ifdef CONFIG_DEBUG_FS
+	.enable_signaling = drm_sched_enable_signaling,
+#endif
 	.release = drm_sched_fence_release_finished,
 };
 
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e0ab14e0fb6b..140e3d8646e2 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -961,7 +961,9 @@ static int drm_sched_main(void *param)
 			s_fence->parent = dma_fence_get(fence);
 			/* Drop for original kref_init of the fence */
 			dma_fence_put(fence);
-
+#ifdef CONFIG_DEBUG_FS
+			dma_fence_enable_sw_signaling(&s_fence->finished);
+#endif
 			r = dma_fence_add_callback(fence, &sched_job->cb,
 						   drm_sched_job_done_cb);
 			if (r == -ENOENT)
-- 
2.25.1


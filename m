Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16304E9807
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 15:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE4110EAF0;
	Mon, 28 Mar 2022 13:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3B410EAED
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 13:25:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhZi1czfm+YzGlUJG5pQrsTleY96uMH3XcWq6LkBNTvezSV87jXmimBSslWfLyOUSeOlvRJywJ3Da1xoH2zjqlTKGYFB33H43plnsQ8C2Q4hkf6/1XiSeVi8fLmtdiTbvpl57m63N7UHNr6VR8/EjudfgEGNrIPbWz9m20HvTsSgmsDab3mnvFvybug2OXUdpALui5fzGoxuPw+YjxNuO0ipNrCaKnNjdV0vLGLqIVEvjNW5ptDsfeAXf2CL9SEhG+YH90vaS1bF4YoLdTEPNN/LcR0sF1WEbMs4H+3M44+MeSkn9vIwpldEYuD6KocwfhZDCg+SsksdXS3Ft2Cw+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaeWznX5pxF+RLOOjJsX+0O01Ey2RyGZUqNCHo1IcGs=;
 b=eSeXMJaeH6u+fVUldwtLQyF1DKyfJRrmgaF7kgOviWP/ESq1z/8UQfwQ71auyDnpW5mmHBPnbBiWBmhXcaph34SH1LwOD/hUfe/UXyPsb73Naqd9hV2okLrefaVRxNNw6GxHC6OKlj9gg2t2GBvCJJKM7em0VXjLsQl1H+aeGQMxZbAnZdLtb0xU2FFasKTlbMVk6ipwHXyqjL3LX0XbVj+hsj/UIrQbYTpWMBuuSpFQEZq9aWx5Gf52dBuqSNOFTHTZMFhNDipgOYIPV8nvIkNusznz9DziGF5nbjtukCozKQ5A9S/7IJA+KF8cnzlrbLkXWad/VzlOwZknhkjnFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VaeWznX5pxF+RLOOjJsX+0O01Ey2RyGZUqNCHo1IcGs=;
 b=tnq67tUErGR4m7N9g/luq346raWhT0zPnxEp8PuxqDDw2I8//+dEoHBt+yzaObrWdfvAUEX79J1oLIAXIB+fITPSQRPTYWR7kqGuH64CmYEGGoA6SZ6pcG99TMPzw4w8sE96gvqt0dBOt2GMSGpEay8HoYGL+RND1kQqtvRchqU=
Received: from MW4PR04CA0076.namprd04.prod.outlook.com (2603:10b6:303:6b::21)
 by MN2PR12MB4469.namprd12.prod.outlook.com (2603:10b6:208:268::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Mon, 28 Mar
 2022 13:25:45 +0000
Received: from CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::62) by MW4PR04CA0076.outlook.office365.com
 (2603:10b6:303:6b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Mon, 28 Mar 2022 13:25:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT016.mail.protection.outlook.com (10.13.175.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Mon, 28 Mar 2022 13:25:44 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 28 Mar 2022 08:25:42 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/sched: Fix htmldoc warning.
Date: Mon, 28 Mar 2022 09:25:32 -0400
Message-ID: <20220328132532.406572-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7cabea2-ae72-488f-2b45-08da10be768e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4469:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB446909B41645A18DB63D0E72EA1D9@MN2PR12MB4469.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 24vpDOTFrwEEuUQX0gh7pirXkttOZXq0bkjjG8DxvTSczdIeOgmgi+h4fE96lw/ASJDLsNDze3kbiTJNqJpoUcundsBcfs7T5Y6NB9GiKBkOekQaBeZk2zSSyMPoJ7k33W3s3E+rEzRMVh+tPPiV6C/p45gBqUjUUwcIwS5jY1LYxIeChSEWQ/u0ntwcnCDMlFA91jRjyo+nTvkMVqzvQvIJaCh6fW03nByXqAczGQtsz3/fDxVuZ6olQC0kz/fkMKXYUXTTFiffN8AtW44IHc6ooVrc5tXEDSNUrw6ycro0tDROUOw6K2btZJeRB5MNrVIBFj+/dRCXbS5rBOtlKUEKx115pesUshZ5XwUeEZWYIvwiRDvqGA4MlKCtsgZhaibJYibonJyWQzQxeWWoatv92v47GyV9keuIu/SusRIJPYqAG4cLFwG4xKGAgre3/MzwMwEW8Xqcyf6/6O3CnELNFsyGvCXrJe4zRlZpoMoJZMKTEGwjd1PQXemLWPQOgKxK2g0aA1jyhD0BlbuSsfBGep3JKHR4rr0K+4AAWgLANm3c3yDY6Yzb2wDEXCDoXD7r0bJJwWV5FCnN1//VpBlpd4ah0buizabXN0vWhDjn7cOwZXWDSSGM8r42ppQb4Z2WC0cJlwz7ZZZPVwkp1ZY3vhIXfXthjSRDDKfQ3lc96Na+7NASCfhBVn+k6wgIIW9CQ0+UJPeB4teCJvK43Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(508600001)(86362001)(36860700001)(36756003)(6916009)(316002)(426003)(54906003)(186003)(16526019)(1076003)(40460700003)(2616005)(2906002)(26005)(336012)(356005)(47076005)(44832011)(81166007)(4744005)(83380400001)(6666004)(7696005)(8676002)(8936002)(5660300002)(4326008)(70206006)(70586007)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 13:25:44.2393 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cabea2-ae72-488f-2b45-08da10be768e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4469
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
Cc: sfr@canb.auug.org.au
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the warning.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 include/drm/gpu_scheduler.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 944f83ef9f2e..0fca8f38bee4 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -270,6 +270,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  * @sched: the scheduler instance on which this job is scheduled.
  * @s_fence: contains the fences for the scheduling of job.
  * @finish_cb: the callback for the finished fence.
+ * @work: Helper to reschdeule job kill to different context.
  * @id: a unique id assigned to each job scheduled on the scheduler.
  * @karma: increment on every hang caused by this job. If this exceeds the hang
  *         limit of the scheduler then the job is marked guilty and will not
-- 
2.25.1


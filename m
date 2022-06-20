Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AAB5526CB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 00:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E7D10F71D;
	Mon, 20 Jun 2022 22:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE6110F718;
 Mon, 20 Jun 2022 22:03:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqZHdvQdBHcFDOptYJSa3Kdaf8f1cHNKRQLZV1BqlLALJPsxyFaeVy+mfHfrps/lChYFUk1+wRlm47ph5Ow29gxICo5ROF5pY/kRtGpac2CjW0ot+gc4DTgIjS7p+2JA9vkarDkooGl/vjT3k5WbEt7jiRzTeJYny5k2chJNKM/32Ub6Z7FhbRBl3QX1/uRnVipunJrnwDNeu08MERBwvWJn/O+yVJIcJ9BQwvG6qfYgNuUVzPmzMbdg61giqF9df6gJuHVhvbVBw+SJc/u8CwHo9CRwDHQTrPVBOFmBX5hcndqopNtwIJxKnmShuIeZ95HiyAGGCStmgYMfGDlzJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RV0YUMW9SNKkAa8QkRXi5B/1Uaks4SJhT2zFLoCd9kw=;
 b=AjvI+Qh0ruar9BaZaSOVe6mx4VlxIAzsOwunLQCxUvMz8D6AciDHqk7FQw0OesO03YCIbNt4qQumeOWM/5JS4FQSXxayiZi0xwQ2wOLs9pacROxxsBa1sDjyRWIHTHLkTPQPcBlsy9SIY1IGlOPFjl/GtNBJWGMYm8E1iyX1LhRjaACHVtsf9zSw2gC/h3w2vqpir6DvZtyic+SFVJWWJm88ztvmoYo+wq7Qm+khj4+D7ZXHcUjJtsqiTkPpCVJ18mJM/c1JNyEidOYT63gwRFaDsXFz73t5grCvnKAo6sHT7eokR6TzMjFCu/ZGcDbBsPyuJGAA1xYPWQ15i4rqaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RV0YUMW9SNKkAa8QkRXi5B/1Uaks4SJhT2zFLoCd9kw=;
 b=ggsl39z86YgmPUymQ0mYDB0tOt7itgd5uEXK38RsiAclS5XBz67bKq0NdpFmvIFtjlKZuCIA4YUexxrhrbA86fYXjFkQAO3CTqWNGag4qlEYqErpzQLyzmFZvz6ENo/E0lwEKGCkUBK9JhhP5ERDLLOVMKH7aTd/K9T43Jixerc=
Received: from MW2PR16CA0042.namprd16.prod.outlook.com (2603:10b6:907:1::19)
 by MN2PR12MB4534.namprd12.prod.outlook.com (2603:10b6:208:24f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Mon, 20 Jun
 2022 22:03:37 +0000
Received: from CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::e6) by MW2PR16CA0042.outlook.office365.com
 (2603:10b6:907:1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22 via Frontend
 Transport; Mon, 20 Jun 2022 22:03:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT021.mail.protection.outlook.com (10.13.175.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5353.14 via Frontend Transport; Mon, 20 Jun 2022 22:03:37 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 20 Jun 2022 17:03:36 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/5] drm/amdgpu: Fix possible refcount leak for release of
 external_hw_fence
Date: Mon, 20 Jun 2022 18:02:58 -0400
Message-ID: <20220620220302.86389-2-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e964e1f1-2f49-4d35-0a7f-08da5308ba34
X-MS-TrafficTypeDiagnostic: MN2PR12MB4534:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB453491344394953947D2CE31EAB09@MN2PR12MB4534.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X4Djdpp2NFlXGyuXfSKNtk89Zs720NxUp0kI+Zx1I4VC3+dgzJIiuPg2kUPvoxxP9RY97BCsUss/aoD59Y9IEGb79oGMOC0tD5sMFjm5+miDQ9aBoaIXQCD6gG5hr5o739zvZrOXBWdKzDKTuUvOjNzjO0xJrsIlrZ27NIH+OoTCZd4B9LHA1vCvshb838PFXMUBcqiGVLX5cFdycramj/3zZqLotIUoRCT6GJ0+4BvQURRKsB1mGgrOHWatRyDbVG9dCD2WLKcYBF4Xb2QC8pzoO/T3pL5igz8MZLrZyO/VpO7WO6NrTMC/32TASGQM2mkD8WAxKBAghcLj3HHpoWJ3SkhEHrVzaJcV8hVsUjvR7EPmKNfpVVbS9DbA0SbCKrzg+fW6ymDnHlHvFa/uXlpDIKgir058RcsbCa4tQ60jecuFrZfbkiXj7/QIb0YJVlhZTVUhj59d9pK7fIQuoTBK1wiLkBryR8lPqNbF7P8Gy7YE+4MEEloaCwvaswM7EH6gW6t6n4qigJcOKqm46IQLxewAdYUW7xaRZVEqaWC0MuE0/6P1e1BJ2VYJIVTBK9HnhA+fSZjLkmfYBMgQ0r25doHQBDjLverkaDFiegUYh2U05HNs6wGXG3BAali5QEA7qSjAbjE5yITX+qGf0a9oILivVh0Od3Q+t1dcySPv0ccQ544sDWdN8MIRagZIS13/LDlVqZ1PjwCzf6rkgngsWlwamw4iggwvfEoKIpSi11AgutDv4tECk+ZdAzvc
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(39860400002)(346002)(136003)(46966006)(36840700001)(40470700004)(86362001)(36756003)(7696005)(26005)(54906003)(2906002)(6666004)(450100002)(44832011)(356005)(110136005)(1076003)(8676002)(82310400005)(4326008)(316002)(70586007)(70206006)(36860700001)(81166007)(478600001)(5660300002)(8936002)(40480700001)(16526019)(40460700003)(426003)(47076005)(186003)(41300700001)(83380400001)(2616005)(82740400003)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 22:03:37.3288 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e964e1f1-2f49-4d35-0a7f-08da5308ba34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4534
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com,
 yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Problem:
In amdgpu_job_submit_direct - The refcount should drop by 2
but it drops only by 1.

amdgpu_ib_sched->emit -> refcount 1 from first fence init
dma_fence_get -> refcount 2
dme_fence_put -> refcount 1

Fix:
Add put for external_hw_fence in amdgpu_job_free/free_cb

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 10aa073600d4..58568fdde2d0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -152,8 +152,10 @@ static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
     /* only put the hw fence if has embedded fence */
 	if (job->hw_fence.ops != NULL)
 		dma_fence_put(&job->hw_fence);
-	else
+	else {
+		dma_fence_put(job->external_hw_fence);
 		kfree(job);
+	}
 }
 
 void amdgpu_job_free(struct amdgpu_job *job)
@@ -165,8 +167,10 @@ void amdgpu_job_free(struct amdgpu_job *job)
 	/* only put the hw fence if has embedded fence */
 	if (job->hw_fence.ops != NULL)
 		dma_fence_put(&job->hw_fence);
-	else
+	else {
+		dma_fence_put(job->external_hw_fence);
 		kfree(job);
+	}
 }
 
 int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
-- 
2.25.1


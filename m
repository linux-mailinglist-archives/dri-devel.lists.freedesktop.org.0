Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEFE569C61
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 10:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5607D14A1E6;
	Thu,  7 Jul 2022 08:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B2114A1E2;
 Thu,  7 Jul 2022 08:03:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MnETVMvw3Vj6ZwNvsfKFdPs6WXmLFPin2fGhCfRAv9l2hX1YbO6GivBEw6m9MFLBxivbrKPthuEHcIdUiA7vLfwKNcnWuRPtSzMMwrC+eQl3wknwsipI+t+IZMT2+2mohZNFpRWzWjAl4I5dHWVdXvOsku6VY2DXTDbo6bURCWd6BvvIOH+XziD++1hbR8TOHx3g+ZAtb8e51fnov1CEbcAfSxhmkBSOKXU0yqBW95u7e6jjXDdztzJuHRzVdxpmh5BB01+SZhXD9xSVg+aaVg3IyvwsfN/H8DZuzZcEGvIYDZ9BsphLor6594cFCckipHa56AUVzi//K5Edx7v6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/a2NPUWi+dL/0YhMCaHKu1QT9WAQTZoF/8kfMszB9s=;
 b=iPeCji0o3gnVTP/BonrSZq6Le03wu/ZS2TWBW7hPuhmgjm8YEWZqr+qy6QiQ7Xn/N74FQ4SwepRo1kDipNQFcQKISwJNGQg1KQMQkXUP9fgCTHzOoKWWLFbb90t0DDR+bT6nGbdXqi71FoFZLG8CtC1JvXJfqbdGW4u5R5uWxU9S2hcQeTxSRIbJt7+fO6JLdG6864ImksxnCIy7pRuHpbxMIWrCCrQK4IfDGq8iPh+pLJZxzwySBxRyNKKtaKHyrrC+Hn4gUTv6nOtXcbiypdY8yJiUEhWMyVaLkfAcCKk4/derLudtdmIo4ts/EzaVC8ZzRh8EE1V9t8P3YZVKPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/a2NPUWi+dL/0YhMCaHKu1QT9WAQTZoF/8kfMszB9s=;
 b=Ki5BA5J2/ufQbCOhpN0jA87xIuRB3CQWsI5C74afs+32DmLCrYbONMBZBw0ErcAbNlcgEN6sfEcs2IbxoacTwbVjEzk9cyzmxykQOCCDvt3a+594qZAVdivqZJfuGiulT7WWZnWLOQxtjIRCY2W9fGmdcRBVQFXfKHQ3yhjAbps=
Received: from MWHPR22CA0072.namprd22.prod.outlook.com (2603:10b6:300:12a::34)
 by CH2PR12MB4858.namprd12.prod.outlook.com (2603:10b6:610:67::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 08:03:31 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:12a:cafe::f0) by MWHPR22CA0072.outlook.office365.com
 (2603:10b6:300:12a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Thu, 7 Jul 2022 08:03:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 08:03:31 +0000
Received: from pp-server-two.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 03:03:28 -0500
From: xinhui pan <xinhui.pan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] dma-buf: Fix one use-after-free of fence
Date: Thu, 7 Jul 2022 16:02:41 +0800
Message-ID: <20220707080241.20060-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e039e72-a477-4c57-d6dc-08da5fef2eb7
X-MS-TrafficTypeDiagnostic: CH2PR12MB4858:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T+nuer8Qe8tIIdXjc7HrHf01YktwbDAFnRHv9fWNDgpQNHkzUR8NdFG3xv1johNPTUQ5JQ1gqmc+gU5VBOjEtnOEablPl2DnVNhFTAd5O3pTIn86zUqxOQs4ow7y5h7vQvmyAx3UrgqGYgHh1X+7DsIYnNDyUJ/22jGyd3vdL/8TKi0/MLKVa7JltUX9GRc777iPdHv4V6Ne6Mux8UadlVhEKSiAA/dssnJs44JgxPFRD8wyreniLrXXZbUNcwmFsz1nN6QLvQleQB5tDwmnbmi5H/VBd18sBRdFmq0sGyo3Y9h3sSp4CcWvm076ioD3m7j6luKIG/J1RzIlz3jkg47/cl2lhRrEmveE5auuInNxJN5BrEGCsp5+KpgBOubuuCStK211DCiXE1Z+1juhdeJTFJiJDTUxfX/fxPuNqokGU2TzNGLW8BKqJowL1c8QGYxiAboGZgqLAZckwQK52Gsf/oC72zbSMXvaIXw4COUx6BehJet2YNWojL5ew12d1W/kXfJzKOPU+e+geSkDNDARKtHRoJ4hTYNrak1TNmG5xAqB0vOkZJ93NQAsNYv5EeIzpqNBLoGkbNi1z/yh7yOTRe7dMhBeT1cWCSIlhXCwbCxrOxm3l0RQeIn2Wuy5V5M3OXjNQzS3RZEX2/A+tlPRN0/WUglvsh/fqyBXyOWR1YWbWx4sf9MqIpCwXz0ptZGbkC21HAn7U7Gr2bxDVOZ+2mvX46h6m1qdQ3W5lmchFVu3768QAMKRQbPM0SAUf9r1S3q8uDsIKEvK6/6ii1uEoO4UX5SrDKiHxtZGFMd1Wh/SippoJn/wGvwanNsBzlzdu97a8LqSgRWR28PO6v1ZDhynqw1IMvvhU9FU0q26K32OFhQIPEOWmfCwP2iX
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(376002)(396003)(346002)(46966006)(36840700001)(40470700004)(82310400005)(41300700001)(83380400001)(6666004)(8676002)(4326008)(316002)(40480700001)(70586007)(356005)(36860700001)(47076005)(86362001)(6916009)(54906003)(478600001)(70206006)(8936002)(336012)(40460700003)(426003)(1076003)(2616005)(82740400003)(26005)(2906002)(34020700004)(16526019)(7696005)(36756003)(81166007)(5660300002)(4744005)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 08:03:31.0094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e039e72-a477-4c57-d6dc-08da5fef2eb7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4858
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
Cc: daniel.vetter@ffwll.ch, xinhui pan <xinhui.pan@amd.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Need get the new fence when we replace the old one.

Fixes: 047a1b877ed48 ("dma-buf & drm/amdgpu: remove dma_resv workaround")
Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
 drivers/dma-buf/dma-resv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 0cce6e4ec946..205acb2c744d 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -343,7 +343,7 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
 		if (old->context != context)
 			continue;
 
-		dma_resv_list_set(list, i, replacement, usage);
+		dma_resv_list_set(list, i, dma_fence_get(replacement), usage);
 		dma_fence_put(old);
 	}
 }
-- 
2.34.1


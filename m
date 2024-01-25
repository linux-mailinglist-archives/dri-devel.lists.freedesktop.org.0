Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC0D83CB3F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 19:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B93910EDD3;
	Thu, 25 Jan 2024 18:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD89110EDD3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 18:38:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOl6pfrhZ1o/OYS0JkIXQSHDlEIY+6kulsJIhyMv6QfAsEXWzDe3Ti3qVGE+qof/mln1aREVAVNphwC4NK/CE6t+c/aJW79kGM8Z4vM7LGVvkUB+UMEnQKF8DfSqi6mpHKsjPYyOTKqDMMjS4rnMmd/SB+EzUwFjDSRozspqTXRrJ1+nW0y+7bpHV+/EPubPp9jtiacfYJnrmVtp7Jcith19WfmF6fud7Qs0Lb8chqYh3gOuVml4sqj3rgmnRfSg8A4EyMCUx0GwUoG2ycWHx2XXfii2mo+F6z107au2CiRKHL7aprVU376vBrGzX5RVFAmKSBfyBehZZyVjJ2sI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wa78kXWD5bKHJCfW1fDY1tTwlmuvB/UjN7qVk7C0Og8=;
 b=BjzAEO06giD0o0GQ29M/V7dpIsUkGrqPnt8JUlnHLQ6myCnxYLFaRFJNkJ1GgyOQbBds3meth0HfvgVSqLSs6EtUH+3jdd/7OFmUO6TWSF8oYxwGK6IMnh1jX5pa9JGUdT4o4aZLgyoUcuckcD5EEI3u9hrVEBTZWdgswZnhWD9PD3ZYrrGvkqCTPq7VlkuaBFPEUGHZ3PvY5yiHhR80QwiWpBZL6PE9RuWgA1RIfBPPf8SxMDLlqZJyN1Ql3HMMsufTTbimpSIGofSm/n0hZhhxa/4AqVYxf+L1bVM/uAxTZMMItUbbHiJ2qOKpw1nLRoSDAD3cucthaYwY0fKT3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wa78kXWD5bKHJCfW1fDY1tTwlmuvB/UjN7qVk7C0Og8=;
 b=SH92+nTOqgk4pHNqjH3o4EDhCB441zHyk2w2M2NZeOTw4sUkJq3UnSMTo3IktKH5vBm8nO2eCX9t1wnnMczZU3+UftYBEEYfFz1xzMzsn952mSwnWNEdEvUDCX8yiS6h/l6MJSNeBvC802LnB/YT3R05qzTxYQ7Tty960zwr0Fzi7TCLe3bUOb7Tbgw0YiphT59BwwiW5cAtlPNCpsnElZ83YuclR/xiZb5w5Sn8se5G2FsU4ly/L394YqkNB/Yi7GYbeHNqbQHQpNj6IHi04iMf5bOVUKkfpT/6GcGFOzD5ZV+Xtkif51oyzHUBnGHzIAlFj13JMO2sLawGHRTfkw==
Received: from BY3PR05CA0027.namprd05.prod.outlook.com (2603:10b6:a03:254::32)
 by CH2PR12MB4168.namprd12.prod.outlook.com (2603:10b6:610:a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 18:38:11 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::c0) by BY3PR05CA0027.outlook.office365.com
 (2603:10b6:a03:254::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.10 via Frontend
 Transport; Thu, 25 Jan 2024 18:38:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.16 via Frontend Transport; Thu, 25 Jan 2024 18:38:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 25 Jan
 2024 10:37:55 -0800
Received: from precision-5760.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 25 Jan 2024 10:37:54 -0800
From: Erik Kurzinger <ekurzinger@nvidia.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm/syncobj: handle NULL fence in
 syncobj_eventfd_entry_func
Date: Thu, 25 Jan 2024 10:37:47 -0800
Message-ID: <20240125183747.53020-1-ekurzinger@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|CH2PR12MB4168:EE_
X-MS-Office365-Filtering-Correlation-Id: 57c77873-c628-4083-1a43-08dc1dd4c822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7fWR4kI7BPLrYnNMz9QQtdxIMRll2iwMWLoNnND1t63INNJ32SNtLIMPn4WclAsfvjAQfC7U2CDkrb3TVWiWZJU8OPAsEI1kEGpSSSR8TWefw1E1vtUXrD3RuIe6xtJygAChHLsQG41Fk3j3/HBa8nsQ9ePD6Kagt7INuTM05eJAyUdHm0xG7mY8Zk2mFc+LBT9odZTqp6kxdalziqP+yB8C7PWLfauLGUtbO2jbHD/1lAVUD/lf2PikPB14B0hcJXBGtbEprBqChmF3uOj6zTBxN3hlfcCJrsOzeQxIPttKorjwyYHOyPtGxTRjnyAh2xvT+ujbLzzl8d1YqzAnVdZGLcDnyQZgNFTJd8ve+uFJY/Xo3kG6dXJWIYIE7QHDm0FMZmEIbwZ1CYIyq3FbUnJQxsGkyOFN6yVQ10Eilzx5s1aNCoCCBrZvUF/7Hp0It1uknXWKerQjUJINSxFuLuUfWAHCA3Ax8By3m1pqsZtl+S/w7zLjtMIdnYwPTZkkVNIO8Lx1C8Fmm4GtOc291uvnOvZYTj0kxsFqJOsgZwcNkeCBBWhleV+Dtw0NrwJ2jCCvSk4uhVHb4+86CYRk4mgH/+DAY2OBPTany7Fo76BJ4493+XfpYFIETE233aKAo4gMgwW+FmlbJIwQMVcl2m9B2ROSLqptu8pLjJMtxiAlKFMMTpRk4ORNWFp7761zw0wrLbfZe/GDuSZ6hiulzANy7G4zyDMeIXYzbpdmkRFynLN/908ARo1KinqDxgqw
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(82310400011)(186009)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(66899024)(426003)(83380400001)(5660300002)(8676002)(6666004)(2616005)(70206006)(70586007)(316002)(6916009)(7696005)(54906003)(478600001)(8936002)(336012)(4326008)(16526019)(26005)(1076003)(107886003)(36860700001)(7636003)(47076005)(356005)(82740400003)(86362001)(41300700001)(36756003)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 18:38:10.6155 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c77873-c628-4083-1a43-08dc1dd4c822
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4168
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
Cc: Erik Kurzinger <ekurzinger@nvidia.com>, jajones@nvidia.com,
 kbrenneman@nvidia.com, ashafer@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During syncobj_eventfd_entry_func, dma_fence_chain_find_seqno may set
the fence to NULL if the given seqno is signaled and a later seqno has
already been submitted. In that case, the eventfd should be signaled
immediately which currently does not happen.

This is a similar issue to the one addressed by b19926d4f3a6
("drm/syncobj: Deal with signalled fences in drm_syncobj_find_fence")

As a fix, if the return value of dma_fence_chain_find_seqno indicates
success but it sets the fence to NULL, we will assign a stub fence to
ensure the following code still signals the eventfd.

v1 -> v2: assign a stub fence instead of signaling the eventfd

Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
Fixes: c7a472297169 ("drm/syncobj: add IOCTL to register an eventfd")
---
 drivers/gpu/drm/drm_syncobj.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index e04965878a08..10476204f8b0 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1441,10 +1441,20 @@ syncobj_eventfd_entry_func(struct drm_syncobj *syncobj,
 
 	/* This happens inside the syncobj lock */
 	fence = dma_fence_get(rcu_dereference_protected(syncobj->fence, 1));
+	if (!fence)
+		return;
+
 	ret = dma_fence_chain_find_seqno(&fence, entry->point);
-	if (ret != 0 || !fence) {
+	if (ret != 0) {
+		/* The given seqno has not been submitted yet. */
 		dma_fence_put(fence);
 		return;
+	} else if (!fence) {
+		/* If dma_fence_chain_find_seqno returns 0 but sets the fence
+		 * to NULL, it implies that the given seqno is signaled and a
+		 * later seqno has already been submitted. Assign a stub fence
+		 * so that the eventfd still gets signaled below. */
+		fence = dma_fence_get_stub();
 	}
 
 	list_del_init(&entry->node);
-- 
2.43.0


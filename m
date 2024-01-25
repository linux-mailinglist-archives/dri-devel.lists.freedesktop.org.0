Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149ED83CA7E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 19:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7395310E89D;
	Thu, 25 Jan 2024 18:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2080.outbound.protection.outlook.com [40.107.212.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B13D10E89D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 18:04:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONUNUSldSBXQ+Z5ifdKR1f1i2q5P3PUvW6MbrYAOWMhnf47kPwNzfLTtb0R8xuOTs1+lfAwOx2ziLJnEDBUxbs3mgPrinWTeJSSmYOocBBRc1JVTLJZdvH/hvTfyjHiZTapiN7IkuSs0jr7he4bFZ5RI4aVB69tzgLWqJJMiCh2BESn8aatCF5UiX5nLboS5e+TE7Byg4rTT1vZ+G7F/OMMhPSIAiGZWCao3Lfjr8rLSrXEoZ/poxt6vglIUZsimW2bKkVEHCVZdKW4yvFFc4C77OYQaKDapaLkN1Y/zj6BBVIv26Nko4509tLtkWnyesHFOSO/f2w4B17hRlvsbXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FR6eXOKL70+857vOlxgbKnQeyglSrHYce78JHccYV4=;
 b=cBsyU+rFH9lJAz73af2aWvUgjKimoI1LKcu9e1hnCeyLye+nunLVrLMDDrKFU99EswflZ0cLE/9w56BDrJk7+eS3BkPRgQ9rNpMjWpH3GHsBMDA+fLJsnI8P4PtAW7lZ9+oTesH+iA9bRHn52mKILr2oHva6oSEZbZDUIWAf/bjsqzT3oZXHTsXXc2WvRyX55sNE1rbtxmgmPK8mj0jv1c3HmYJgbzU9HmwXmCE9ItQcNA4BaY03dXJv89WVmC24s9Co7jEE5beP6lI7tfq7O/imgrQtF1d9qn9NLyJmQFgbJ3wM8QDnGffrXnP5jgs+awxhJiWfLMOh9hqaSu5uUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FR6eXOKL70+857vOlxgbKnQeyglSrHYce78JHccYV4=;
 b=TeWDz8Rn28B5r2XH9ng2c3mHoDBWmrId0/3LF9lM6ULwhDzz5j+Iyy5rwApauuTOwgWXKcy/2nW/MlyH8WSOgGTqqTbmZvDGswnJZ/c9AWF1I7uyHSSX5uTrD4vndYn1gU+d6AWMf0ArqrL+L89FxtdZSt/mVGyjjLK65/b7vwS2fFMO7YDct8yeqrEQpHkGk9iiXuClPIIGQQitPEuX6Ei/gOCAV7lVxjoGqNYIEi3b86R9hY/Uo0r7woougubgC87+e6iDHZXD9mXrhEfeJP6rZg+oNXbFEXEAYXl3Kj5/pWAkulqQiTw5ewUJOKPIBn5O4zEaSiI5/elMsZtfCA==
Received: from CH2PR14CA0057.namprd14.prod.outlook.com (2603:10b6:610:56::37)
 by IA1PR12MB8224.namprd12.prod.outlook.com (2603:10b6:208:3f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 18:04:12 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::f1) by CH2PR14CA0057.outlook.office365.com
 (2603:10b6:610:56::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26 via Frontend
 Transport; Thu, 25 Jan 2024 18:04:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.16 via Frontend Transport; Thu, 25 Jan 2024 18:04:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 25 Jan
 2024 10:03:54 -0800
Received: from precision-5760.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 25 Jan 2024 10:03:53 -0800
From: Erik Kurzinger <ekurzinger@nvidia.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/syncobj: handle NULL fence in syncobj_eventfd_entry_func
Date: Thu, 25 Jan 2024 10:03:21 -0800
Message-ID: <20240125180321.41173-1-ekurzinger@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|IA1PR12MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: 04732636-3ada-449e-5695-08dc1dd0091c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g9dL2A/7P6N9PNDbRKy6mGfQZd6LdGQEsDaZUeQycHGKIlwa+SX3JxhU8P9SaM3MVWgv5lh1N6ghY7PE8Tk1lJY6POiucFX/tqTOt/FoGA/n5wR7yqTGKtWnrZSul36RfZvtOBTQgc9THdye+xR7iFXlYRYQNIvzTKQFWDkLQXptZhSBgfL8lt3yyl24L3rtV2vu/HPw7m+H/84aH8ModcA+e6iG80nU207adAXXOc2ouOnSwCqQaMgC0crj+uHG2M64EQsD2kboLwFSSuCXxmQl+XiihzUplC3T5XPsnEy0hPvo2Uev1OKT4ltHz5IiayVdabehPqX3u2gUZqejIapMAf4pSGRcW/lGfycJpcOcGfaxCSGvuM7QY1LZjaB+sKY6iYG/12bpqCUWRmR8NqkoLIuP+27v5jl+T5CgE1bF65dtLKwBXZwenabfZ4z3xG5uh3lCLxGgbK9AGMK3et1hL59n+pL8eS0AT4WKZM0aTuxblMw7VNuH3A7MTk+iDyhdb6L/8iP7SzatktIpoY6q1r8CaNiaSKPO9Uy2BI3QCqjU3TCE79t7GOGxSUrTQsLhyfoPAdEcAbgEx5S59YVV0ggTW6a/TCN5Wphicdvbt0rLZAkkeLnlpFqxWGWkNFvLVXZ84XdAqXQ2KwGOnYNS4LlazRRdbp0/+H3UMw2ASEWpK40bxXIXAVNpUNVE0Ifcc94epYf2WDf2fDmroE8pRlRDU0SDE2hwig/Fs+HH/jiU8rG7YSm9cTqPkBpT
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(1800799012)(64100799003)(82310400011)(186009)(451199024)(46966006)(40470700004)(36840700001)(66899024)(36860700001)(2906002)(47076005)(36756003)(41300700001)(86362001)(7636003)(82740400003)(356005)(54906003)(7696005)(6916009)(316002)(70206006)(70586007)(478600001)(4326008)(6666004)(83380400001)(426003)(5660300002)(336012)(8676002)(2616005)(8936002)(1076003)(26005)(16526019)(107886003)(40460700003)(40480700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 18:04:12.1459 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04732636-3ada-449e-5695-08dc1dd0091c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8224
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
success but it sets the fence to NULL, we should simply signal the
eventfd immediately.

Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
Fixes: c7a472297169 ("drm/syncobj: add IOCTL to register an eventfd")
---
 drivers/gpu/drm/drm_syncobj.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index e04965878a08..cc3af1084950 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1441,10 +1441,21 @@ syncobj_eventfd_entry_func(struct drm_syncobj *syncobj,
 
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
+		 * later seqno has already been submitted. Signal the eventfd
+		 * immediately in that case. */
+		eventfd_signal(entry->ev_fd_ctx, 1);
+		syncobj_eventfd_entry_free(entry);
 	}
 
 	list_del_init(&entry->node);
-- 
2.43.0


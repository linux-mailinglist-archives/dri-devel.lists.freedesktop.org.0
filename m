Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A34808F50
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 19:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3F310E947;
	Thu,  7 Dec 2023 18:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7D610E948;
 Thu,  7 Dec 2023 18:02:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9oaDsiCx+iZaGi5BFx8wWLOkVAihovJJdEEdwlllL9jQSCh/O1L5AqwThVY3ExuvTrUxvAU1Be4CNVYyBE0oln9kKilEL62cYVinjsYlB3H2045rfV1oaUZ0xJkhPuyjbt+qbNDuL14wk9FTUp/lxMaI/eIBCOvWt3zKWNIvbQF+oFMs7JXIj+YlrtlNagBk4gyxhriPiHW92mW9A7GtN056hR155ywV4CoUPl5P4Jjdf732y16fILi6/FqPD8tqgezu43VOYURl/zIxr1LKdnrgnj33S5A3pEAOR5BaTW2XXuW9t1eFBLIHpL4ZvXrOhBmQp2oZPGvFayX5yN4sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akyE4KSE7dwxwzJljMLnw9Khqx1hFPo5imO56otWRl0=;
 b=U30w/HWAuMfPOg5xhYoa8hFamkgOjfdRrSdx+MKdpSVj7rHvHRV6OUhex/ex6Hgxae5tFzF+95LdLkkWQOy4Z5V9k5OwUMIePauhMWLCbFIpm45bgIz+gvq48i2SqvYJm7R5Jt5UnJp2mCohAL1Z/3V0Xz4JY+dhG1aZbWiaP/T4xXtL5ZoZjHHfWoJ2CT6mDlUGD+hO9o6GMKwR8cp5nLxtAtx5ZHtafmr4dWzmcJA/z7NZzB4JhlIJ3ZhLy6Vu3lClv5KWYPyWtbjm13h82txvPx/TOa9Z1PnQIhQDIEGMIhEQBcw7hyYzTMKsMn6HfZnfw9o1pYdhHqegIdgmAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akyE4KSE7dwxwzJljMLnw9Khqx1hFPo5imO56otWRl0=;
 b=AXurlL2P1tuqlx7vp4iwSmkhw7lcYb2gBUuIPC8SJ2uQ/Nv0YMgYB5PGb4qUAEVAjiRM4UNiQEp5o8o5BiGuhv69D7IpHpqTZk1GNsk3dnC50+2Ja3YLH9itBcMdL5gDhoZWrxmB4ds6/4osLrIxOFd2PizShMBWEmy1NKZ8N8w=
Received: from CH0PR03CA0363.namprd03.prod.outlook.com (2603:10b6:610:119::32)
 by SJ0PR12MB6736.namprd12.prod.outlook.com (2603:10b6:a03:47a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 18:02:41 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::f4) by CH0PR03CA0363.outlook.office365.com
 (2603:10b6:610:119::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Thu, 7 Dec 2023 18:02:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Thu, 7 Dec 2023 18:02:41 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 7 Dec
 2023 12:02:40 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm: update drm_show_memory_stats() for dma-bufs
Date: Thu, 7 Dec 2023 13:02:24 -0500
Message-ID: <20231207180225.439482-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231207180225.439482-1-alexander.deucher@amd.com>
References: <20231207180225.439482-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|SJ0PR12MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 4230c895-46a4-4bb1-87c1-08dbf74eb482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yFOYlmMJVNSKrx42hncq1aB6vILs/wYYptIklDsKVHgsoCD/yN/mH6xkFQWkUDDfv8QZ37LtDj1Rwfpw3Bs+LLa29soJkGJKZM2WnWuMaf8hznZsBfV2+sva8mkOoA2PkSssZhJRhiISTFnpOz9Whv1Zm5mDaiRhGZ6JBTHxznp+BL6fcSN4WVscXRx3nsjxCa5ZkIQmNtUM12AVYfTShJbjGyNA/2PD0wbY83pEvlQ7JAst78rlgmzpqWsG20KjL6aeoNOYTAiIO0JnJhoO/lGGztBXYrFqj7RBdc8NXXN65/tDaHvVExNuzQ/SiqXb+ykXLp+ryyJWF3yzceq6T9MdW9zrkabJkeZzC7VVKXWWzTyowhekjIq76OYNgoY7kJI2hyw9lippD8WeTkcxn2QWSxR2zpTOXKgA16aeLKko1q4jrMCTClgE2JX9Fe90lSphpuWBjlSbcknU5T/VFra8LYk9IJf5oVQfP2YqqihLiTcSMfnXusnVeM6WW9lpfoneUArM/t5Id5jvvvaM83hhHjXoGWWahkDv1ohg6sXn7lXbpiKCGLEdXJ525yiALWpqGPe/+nQvlq0q3PIYnZPDTlKDKLpHg398dEoGsTMU4n8jC/pUVzwomVCFjKfOodvdT9Hq/FONcDXZyTl7Lokz5+md5+QOFpgTnvHNfJtkMMrCPQKioNXQzsLe+m5jbus46U/wt7AHnajB7u2m+IjIi0jj2AN/gEYxqPzz7xvJtS6jrNVlnVnbeQZL0QiLruaP+bXyffJB3VJ2YZFtVw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(396003)(346002)(136003)(230922051799003)(1800799012)(64100799003)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(82740400003)(41300700001)(86362001)(40480700001)(81166007)(356005)(40460700003)(36860700001)(47076005)(426003)(83380400001)(336012)(7696005)(1076003)(2616005)(2906002)(36756003)(6666004)(8936002)(8676002)(4744005)(478600001)(54906003)(110136005)(316002)(16526019)(26005)(70586007)(4326008)(5660300002)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 18:02:41.0082 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4230c895-46a4-4bb1-87c1-08dbf74eb482
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6736
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Show buffers as shared if they are shared via dma-buf as well
(e.g., shared with v4l or some other subsystem).

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/drm_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 5ddaffd32586..5d5f93b9c263 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -973,7 +973,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 					DRM_GEM_OBJECT_PURGEABLE;
 		}
 
-		if (obj->handle_count > 1) {
+		if ((obj->handle_count > 1) || obj->dma_buf) {
 			status.shared += obj->size;
 		} else {
 			status.private += obj->size;
-- 
2.42.0


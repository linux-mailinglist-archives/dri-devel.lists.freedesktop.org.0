Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC44B4A8128
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E43710EA8C;
	Thu,  3 Feb 2022 09:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1561010EA49;
 Thu,  3 Feb 2022 09:09:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyEYTarO+pVVLio5jkBVpPu9UwQ5l5dkfPsgcXbms0Y5RAhhGNiTnRTRJUWWTvYtD/b17q7WKhEUSrbNM5baIuC+i22CyK7XpKjWLM45GOZEH1PR4ZGOmw4fkoi0cL3lMPDCozj5EhuCUnLe1r5gJcrzX7Xj8w9PhIP7fq53RhLxpFf8evgJFmYPz9C92Z/ccKYWA3azQzADphWqtqkHi0q+N5fcc5QxwhMR97KWIkgwhTR05f3hIdN3uTatDaAZXn35LLPga3PQTWGuQn7cSxOrHPzGGLc6IN0pBAH83yyEpcoLKZLQkPl0iw5mT99qYQ9Cfux/UqFuPz74KRjqjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7apuhowqTfa8EJVi8jWumZvO+tBrFjQZxi91S5zJ14=;
 b=N5UWxhu/siJUndDyig2kadD8ysISmpLnYmlXwljiNOhODdREmKrI6ecAnG7r8XMty/s7zq8IXBMjHog5ryn3vAvvCAuzkCXw4JTmSC8nziJzj9cD+9V6D5tcH0rCmm5SW2hJDfDZHYblLd/uqsoDGX62TUgowmt+qLeBOYjkZ0OASBIA+R/97kvcFG4bzgau+MAOWcHXSV1/EGSnwE1D5hYpTNsNYo022LcGejsIHiaDJrl3CNq0/WQehtYt+jJuXn1C1sr/ybXaL22ybI9TE+cuyrvZ2/h4KoQWQMczzw77r73Uv73XuMl/NNtcFShXPxkH+WisL41EFkMR9yDnhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7apuhowqTfa8EJVi8jWumZvO+tBrFjQZxi91S5zJ14=;
 b=Q4LAV/R3l360b7Dxl5FWB6xx0cxqdTx2Kn8N1XMZGNLdCnbj+UIiDl+mMdVpXj8S5n1IgwA6dyYrddRS+eu1yoYebApCcoAR7MVy0p/8OU478o3VCngiA8iQK3oJR2Cv6gA21IX4kpeQBwwYydEKKwon2ertSlKp4N0HQQp3FqA=
Received: from BN6PR11CA0068.namprd11.prod.outlook.com (2603:10b6:404:f7::30)
 by DM6PR12MB3755.namprd12.prod.outlook.com (2603:10b6:5:1c2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Thu, 3 Feb
 2022 09:09:46 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f7:cafe::c8) by BN6PR11CA0068.outlook.office365.com
 (2603:10b6:404:f7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:46 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:45 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 24/24] drm/amdkfd: Bump up KFD API version for CRIU
Date: Thu, 3 Feb 2022 04:09:18 -0500
Message-ID: <20220203090918.11520-25-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
References: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8b9935d-dd44-402d-1f64-08d9e6f4ec7b
X-MS-TrafficTypeDiagnostic: DM6PR12MB3755:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3755000BA9C3F2518F9C0338FE289@DM6PR12MB3755.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4GJrDIXHecC11MGoLiFLHaAs2VgwQTzjCu0DhSJgnz7My69nTS7T2vAZ/3m8VDZQ0f1lSXJ3P5Gm0q6AZDg5wks98NhkOYD1VWxS8nqt4zB/JpRc0S1Efl63FCry3n2sVu7XPb5sg5NkXrzWZSljcor7JEsU/Te+djoOiyOPrjtlkKZZllovTvOAGllO5kAajk0Unq51jJ/RQYG9eAA8acgI7WgjagWYrJQwUM7F8BxEfbbR2a0aPF9QUgsaqby9LL0KDvPBrofgYuoaMW7oDkxDRYpFGg8ECv7hWvYnoxNg/wMqaAD7KQG3EevdjmdqBvvbWpYJUnjdhcHtf6W0BsIJmC057jel+MXwUDDFwYyfD9mxosOOvBKIIb0IRcMLISKO7atoynpJLIdGEjkpVgCMJJNUt+KxBeEXZi/pOSuH8yaRGM6mjUVs/8ORFYIsxCf0IlWwWymZNl4vVW0VWJW9xYL+Ir4X5X17Np3qabbZBeC/4KkqdOsQnBEPmyKoU8APTZxloy8nT1eDsQF7iLo+yNJmMMGUWdtrqkI8sFaLtl6ubi1XzuwAaPgsE90tr0Ig/62JW2mliGJkob0ePS2XWhroS9PwXYfFukyTvXvQphHcPHsrihC8bdq0LoukUSNq90kPU+uJjQC84bLqoJ5Pv3N3aI+75l8yiu13bD3RwYzvKk/6xzV1hWkzSy/9+VXu9/SrwmEzvOIHqY7CVr0T/RoV6+Dui40tVYI6neMmyS7t3fzUD58eNn9On0lz3w+jPqPSA0glZNYsF/FBQSJC1OMyJEVR6wkIHWMxQB4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(44832011)(16526019)(450100002)(5660300002)(6916009)(966005)(4326008)(36860700001)(54906003)(47076005)(40460700003)(316002)(4744005)(508600001)(86362001)(8936002)(70586007)(7696005)(336012)(36756003)(26005)(426003)(82310400004)(2906002)(81166007)(2616005)(186003)(356005)(70206006)(6666004)(83380400001)(8676002)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:46.2911 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b9935d-dd44-402d-1f64-08d9e6f4ec7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3755
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com, david.yatsin@amd.com,
 Rajneesh
 Bhardwaj <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 - Change KFD minor version to 7 for CRIU

Proposed userspace changes:
https://github.com/RadeonOpenCompute/criu

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 include/uapi/linux/kfd_ioctl.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index 49429a6c42fc..e6a56c146920 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -32,9 +32,10 @@
  * - 1.4 - Indicate new SRAM EDC bit in device properties
  * - 1.5 - Add SVM API
  * - 1.6 - Query clear flags in SVM get_attr API
+ * - 1.7 - Checkpoint Restore (CRIU) API
  */
 #define KFD_IOCTL_MAJOR_VERSION 1
-#define KFD_IOCTL_MINOR_VERSION 6
+#define KFD_IOCTL_MINOR_VERSION 7
 
 struct kfd_ioctl_get_version_args {
 	__u32 major_version;	/* from KFD */
-- 
2.17.1


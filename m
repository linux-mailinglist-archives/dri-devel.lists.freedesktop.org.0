Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D403896B50
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8513A112981;
	Wed,  3 Apr 2024 10:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tv/Xub7A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E27112981
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:02:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dF5e0Qh8F/4UJoltvULttvyrgrZhuiBPcmxnCNWlVbwR8aCR8UGgclPSAH43tlCZL/m2RtvE2ljhGZqDSQVgwBQCjzXGADfVS+9EMzarcqwh3aTAI+q1RjOC/9MmmbZnieTiX5Pk00v6/rgI1tMXfhPCUe8L0uPt8qSEf7AzJGkXQsHaf216IEfQ9wPbcWHctYMQyoz11BYqQha4/jj7M+MVeDa2rdl3BOxDvgFS+pXjHRG9F3PNSCmovv+DRU7K20elKPJsgiA0D8Vmd1de6mBo5e2p7wzSh8EYFzAY5RZjqVjPRtHS2ydZ4/qDKWLhFD5+nKdjBYPUrQbdixku6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfu8fInnNBhPuA4WVCxmhq7yixSV4IpD3ZmHzXMU2So=;
 b=eY3o+gbPqA8pNVQJmzgddFpIoTK1nRVjPGRVCURUcFlicWuFYdrY4tJkkTcObZaFai5ZtRsHCivCOCq3mlycD/AA3NIrvdEEUI3wWSTHNfA7gPaczV9Q1SgNFZtM/vNXXexR3vsGDiHV9pJaNUx9r1PyCTEZ5e6JLvORaZpVYt6b5ol0drT/b0qBOreV1gDK5tYW3nD/3jPLPWxqjxWZP+cBsd9s8zxPs/+LhrtSb2/wPv5RpBdT9ZqWoLFAHwsY7x9kcJnxiWB6GELc5CAywUCP2tNbI7kh3ZneycYDirxp5Pzn1LWmDtwuyB6mOmX246vSWwcMk/QZt429uYnVrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gondor.apana.org.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfu8fInnNBhPuA4WVCxmhq7yixSV4IpD3ZmHzXMU2So=;
 b=tv/Xub7AZGcBBwUjgRY/LtP0kv9FBXY5c8IpLJhyyMtfOJOGtpP5zbHpOHEv9Fn3+nNgtYkTTjQXO9PT9hC4DEqMl5hNvcq3zysTqDKxhQvP9uqfPixNFnmv0/bvxCgbtt0ovyiuPB6gFnfYsIWv9oebCztBYOvoqXFm7/Mew6NEcAjrfYoLxLNKXznQzSwawFRXUQ6v0QsfkYSMP98mjvbknEAJC6f+vpxd+d42+/HBI99HsXRu2VTftSTRlpdntVCHWfkuGQt7jBcmkvD1U0JHurlsxKd8nFKMcrbD832PH5DpKnQNk2E2z+3nNbz/FohcyODRAwZt3y/jh/zK+g==
Received: from BLAPR03CA0179.namprd03.prod.outlook.com (2603:10b6:208:32f::33)
 by DS0PR12MB9059.namprd12.prod.outlook.com (2603:10b6:8:c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 10:01:58 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:32f:cafe::e8) by BLAPR03CA0179.outlook.office365.com
 (2603:10b6:208:32f::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Wed, 3 Apr 2024 10:01:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Wed, 3 Apr 2024 10:01:57 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 3 Apr 2024
 03:01:34 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12; Wed, 3 Apr 2024 03:01:34 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1258.12 via
 Frontend Transport; Wed, 3 Apr 2024 03:01:29 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <mperttunen@nvidia.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <linux-crypto@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <dri-devel@lists.freedesktop.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v7 2/5] gpu: host1x: Add Tegra SE to SID table
Date: Wed, 3 Apr 2024 15:30:36 +0530
Message-ID: <20240403100039.33146-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403100039.33146-1-akhilrajeev@nvidia.com>
References: <20240403100039.33146-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|DS0PR12MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5debf5-c54a-4805-8f10-08dc53c51986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oIk9FAGtYoPTy3Wwioaief4lFMCa535RNMKExTCZqHqMJ1WqcgB6rcL5KfSum+pJQRzF7wGCmcACdSXVlcM0rplI5AevYcaZ6im63ohcLE6SHxequFfEtp81aq2eDYp0QJbegsxHOz8n42VeJAtIM+aHcSYen2NuHbG2yNvRHM5CEwO5/CiuKwr2g1RiYEnAXiBJ1fEpQCYRSjaEG+nDKet1zGt6H9CWGFhStUp1SLbzzbmnmCMlqeDPg1efk/fWkrDo2YQNyDfv2meRu6ohVHaHHMz8OZhoTbcd3svKHwCzOqGingpP6Acau3ECqFdFmoLJWNL2ZvsnVh84TAh82JmrPXEMeb4lVEoqo0dcOkTYf05s6CrOa4i4tYud+PulthS6VrWds1OSx2Pi9PrSDsRiNPvwDVo37bJ1sREt6GxI0+zoPpG565TH7Z2kzJkRpthBLysOr5KnZq5aBsQ8skTd0wGY6KHpBIcdN2VfNaHyYPdVqWm3ypwWHzbnQTIfcRVhCKM1DkbngkDRrAYVFZDnqRgRhQFdKfeE1UrdZoGGk8vo0ckIw60i2gcjY/rh34kp2s3mSMb/aEeTWuCOx6gzbpqMkX+lCqKSTTi6iG2kbEx1Scv0+v2jsy/MIgzT2tVBMZ6ACWrAQwZmiAScodTnq2mwAJPXqHitmUiuE8xpFR5tlf89EP1fHkkFa/e4UfqGcHwslNrGRUELlXVKgvuM/dQXFnz5yfasYPW1ed4wYhZR5YUhHhHHnJMi0cToMN2rSONw4//Kbw6qn/eF5Q==
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005)(7416005)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 10:01:57.9648 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5debf5-c54a-4805-8f10-08dc53c51986
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9059
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Tegra Security Engine details to the SID table in host1x driver.
These entries are required to be in place to configure the stream ID
for SE. Register writes to stream ID registers fail otherwise.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 89983d7d73ca..3a0aaa68ac8d 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -215,6 +215,30 @@ static const struct host1x_info host1x07_info = {
  * and firmware stream ID in the MMIO path table.
  */
 static const struct host1x_sid_entry tegra234_sid_table[] = {
+	{
+		/* SE2 MMIO */
+		.base = 0x1658,
+		.offset = 0x90,
+		.limit = 0x90
+	},
+	{
+		/* SE4 MMIO */
+		.base = 0x1660,
+		.offset = 0x90,
+		.limit = 0x90
+	},
+	{
+		/* SE2 channel */
+		.base = 0x1738,
+		.offset = 0x90,
+		.limit = 0x90
+	},
+	{
+		/* SE4 channel */
+		.base = 0x1740,
+		.offset = 0x90,
+		.limit = 0x90
+	},
 	{
 		/* VIC channel */
 		.base = 0x17b8,
-- 
2.43.2


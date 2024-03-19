Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794FF87F98D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:24:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C78E10F700;
	Tue, 19 Mar 2024 08:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OagVWmtv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6735610F714
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:24:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1DbaLmGeP0XlRj9GwlrOeX5Bm7fBBWMd44XTRIapfYZIFypbUmEx9u7lj/OOgEpq34OSwTH91mr1BwNGa2Zk+ICDbQENXrlrmDwTG9ZphoGwY7p9PMV/fmHKtuC+4jkMZ+O+B+UjVco6/DMihxyqpxJJuZmM6pDxNhwsfzHy+HfIixEo+gNOOo4XFaMn1eDJ/mqhhhyMalKN6OYPyhRyLGXUNmBxnIsMPs+SeX4pXfjdfVNXE3zp3DRfsYcxffz4YOLa6NYdRa2ymPFYfvcE3b5J3YqO7YlaOXMD7ZD6+cM9fD2nPQ9/Im6bXr77hISRNur4dzKhUvCYDNXVEIglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfu8fInnNBhPuA4WVCxmhq7yixSV4IpD3ZmHzXMU2So=;
 b=g/PGJEz+lYFZhmG1e4PTuyBtuGE1Rl0hqdHIFmdc9Bk6Q60FAytWejTZZ0tTTzubkYTrGMnQhykG0i4i5U75+pd+5IChIypb3VEXlt5YWVg2HZ4+uXCbupTO48iELxD1jRlEU0Zd7pZF85PVrboSkQTr49Te7W+P1wtXo4vrHecp6b1c1WIeWKmGzRa+u8O2UR3j/8KlMDrWQ2/cznPCmgi7U7MKtMC/sp7773WHNPfTQjJC5wcOBBKN2H+qPV+BtfqM2Owy4+nJ30pnibcbYpaMF2Zfq91DA/q7aKTaARiC+gxpD/y+KUHn946pFBqgnBQgPXqWs7oafPTqai3e/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gondor.apana.org.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfu8fInnNBhPuA4WVCxmhq7yixSV4IpD3ZmHzXMU2So=;
 b=OagVWmtv65qui4tPKTYqrqIkyykw+YRZmnOhgAbqGnCRGcctco3JV+GKOsfVZ7b+SwOz4WQCuXm0pzHRMv9WXQB5l7NH1xov+SrAjuFOX7/YB3QC5fXvRkleAbiJ19xoM+//m4bRYmKkltw6g33JRQA2TFwaGLY6FcAQQvVVxcxN6QznXJrg5lxg0eXvz9hA2XhzXVujmR38i931p2zH6h+3KEs+f4eIMk4H5eh2Ojx+HH4P3rQkk9n6Z3sYY8sLD4tDl6pTR7UIkrakIJm6eIvjUlbdBT9cRw451EzMnx/HpXZTWkO7x7nTAlK34zGjtPajfyH2kI7PYXIw2S7XBg==
Received: from MN2PR18CA0029.namprd18.prod.outlook.com (2603:10b6:208:23c::34)
 by CY5PR12MB6430.namprd12.prod.outlook.com (2603:10b6:930:3a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Tue, 19 Mar
 2024 08:24:38 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:23c:cafe::ad) by MN2PR18CA0029.outlook.office365.com
 (2603:10b6:208:23c::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Tue, 19 Mar 2024 08:24:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 08:24:37 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 19 Mar
 2024 01:24:20 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 19 Mar
 2024 01:24:20 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 19 Mar 2024 01:24:15 -0700
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
Subject: [PATCH v6 2/5] gpu: host1x: Add Tegra SE to SID table
Date: Tue, 19 Mar 2024 13:53:03 +0530
Message-ID: <20240319082306.34716-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240319082306.34716-1-akhilrajeev@nvidia.com>
References: <20240319082306.34716-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|CY5PR12MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: afcb80b5-cc52-490c-5314-08dc47ee0421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZGx3M8sTcEtYhk6CrbCVEeHwfMdGGza5YGucomDiSFDGuFlaFR/Va7nXpx7E3FNQ6zRWXejrW+zG37pFHRWCPEqahXd5mmcuS8MHViHui+iLNT/B2rdvd0X/nTYA61/pY+jVr+3AYm7tmtdM68dHUYsHnYcb0xC6PUsxf5nk3Q/D1uPj9W9ZU+2sZDOGHkD5QsoAyxuvZiJcQiuUhzmq6X8xMcc7YZNdBKk8+qlNp5tSk0Hib7ZLS6ypU67aRQ8AldYNvuG+ac2/sfrwx13wt5xlfBHsk2taD4ECA/BQDrZZE+BgkUtPN5ZqsP78JVzZoeSi8F7UaD7l2UfHUL9ApDWvNNuhsSXvaq/BfJR4M/RfK3YUG8w+AwlYyM4BqKqFXdhVbqr38iGUCaoCqEXa7kPmKu3ttD8we0wDWX067lBl8Qse0rEK/a+Sma3JaFQBJbvrxNNUH/ChalBd1cM6C0B5TWGOEp3IWG2DSmbq8ItBxACurjCbBw03Hr7JrkNptCuZEEMizAvtfeQb1RYgHsQabxMXDTa7FA3/0OwB5aaXfhsjBijXthGaN0xM5IFIOasQucHzg279C8Oa3BJ+DeTYpiOLzw53VF4RlJGGDpPDWgI5q9Gwxk6ud0Ci/Fx8GVQl/PxZ4qckmoNIh5V5oQer3uQR9myBLPOKndhmjBoObcLiOc2GWJj1T4sowxA8BkJQf6KLD6kZoRlJUZAJcGdFXynDMTfWgWqswDNs4VVZ2uFf4z71uH5EgUsaMz0Ce/kR3D8MJqTJxNqcvS+KYA==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(36860700004)(82310400014)(376005)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 08:24:37.4505 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afcb80b5-cc52-490c-5314-08dc47ee0421
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6430
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


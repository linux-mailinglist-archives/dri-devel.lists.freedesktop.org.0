Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D552F9F8B44
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4825210EAC6;
	Fri, 20 Dec 2024 04:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p2aXtkGN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9D910EAC6;
 Fri, 20 Dec 2024 04:36:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J25mU238ENkzEEPJwueD34nBTrZeqH+Zws6+aMiFT78gKJ8ZgBpoqm8+VPc1rG5d1o3ZeqpXcRHjBNrFaIjtTFtbJ0K3418qB0ffCudmgdWw1tcCIZyLwteTuIMIGvMoHOCbNWbK/ztmJ/2+UoXmD9huhb/NP+TKbQUc6kVP1067+O/1U2qI4GkNUKNhV4Scs3ncmNZokbrO+HckvH9boyGtXOfj9r/YmOJ5SVyrRmqKw4yCDNc83sRPK1D6BJSDAt+Zv3RiOSMX5yPwhXJFzGjTCJtkIP20FMQCX6QKQXt/XOSqQXfhBf/2x7tafFoApSzCtGXgSvl4NsXD+bBB1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UE2HvkvPQjXnasl6XTZptxybD93JK74TUNlzsOJS/6A=;
 b=u4+2fdLatPE3C5UkQWsjgiiGNV0if9gicDn7vRcHtmSL3rBa4u5VVlxVqV8qmkzubjiM5gIwnDyvhHHtNvz80ZOrm0ZLqDzUeG3TF7MD/9yg28xdmqxupPZsOysZdCap5K41gEdZhfHEnAnpaUT/E40HIoZfGkv251dfFz9Yhp/TsJxNN5ebrB3epdVE5aSyRQSxeHDCa/mt0Gw3eDvm+8WAno85TslZp2K+buvtbOxKe4NVwfv+NemYIT2iysi9k+Mr/49cnG7tam2lbGLSSXAzk1yeADSSkBtGGh0igGg1Dt2oK/Kv0e7ysJkiQbkmFmsZuogkcV7UAGxbVBQGvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UE2HvkvPQjXnasl6XTZptxybD93JK74TUNlzsOJS/6A=;
 b=p2aXtkGNS+rs+tawWjs5FiNNevtG7Uz2ndYlUNVL5SiKpU/TG/NHg63Ct/cyjzD2m4OILeSMLWiZnOq+t77HiMNP7ubs77jBWx8sqyFYZnMCzNEF8fsGzzOtqzMdS+7Hlqgn2TPSh5TLxpzg3X+umVxHL2IfGKGuU3kbxYvL6PY=
Received: from SA0PR11CA0048.namprd11.prod.outlook.com (2603:10b6:806:d0::23)
 by CH3PR12MB8509.namprd12.prod.outlook.com (2603:10b6:610:157::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 04:35:52 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:d0:cafe::85) by SA0PR11CA0048.outlook.office365.com
 (2603:10b6:806:d0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Fri,
 20 Dec 2024 04:35:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:35:52 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:35:50 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 01/45] drm: Add helper for conversion from signed-magnitude
Date: Thu, 19 Dec 2024 21:33:07 -0700
Message-ID: <20241220043410.416867-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|CH3PR12MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 30fbac6d-66df-4961-303d-08dd20afc947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MJYzB+jt/Zsy4nmwUVAfLDlsJnbjiByuNG8JoGFla8eyu90VpSMBzeR6eKS9?=
 =?us-ascii?Q?IEkbD+yZcTEwWNB17oXM9O48xca059JwhwBuLgJi6J8b1eNH7M/HOf4dRBR5?=
 =?us-ascii?Q?FO5jpEG09EZeW+nVu2ic/uOlZ0suDGUFfyB5CLnHbOdlcr/8am4T2giofBNb?=
 =?us-ascii?Q?t+qfkpxsnAvCl93diPvAyVp9cTRCA7JUnpii/n6frsw222czLzXf2E3irpGj?=
 =?us-ascii?Q?dllWez9orbjGPZ5ExdJAtYRJFx9tn1JfC/fARb7gVm1VFFxQZjKvner6z9ui?=
 =?us-ascii?Q?K1D/DBJrSILx64is1rUgQDotLH3gJkSK+7vEw7G6UhGiM+S6v3C9zRwtoJb7?=
 =?us-ascii?Q?ASpw9DmgWbAcA7qn5jCnaFeJHOvFWLib2QOwqRcDtPJhxvtq4v7xCcmwMNIr?=
 =?us-ascii?Q?QPH0RlMCVHnIBYQPZpelEppOmp8s6YwJJVSHM81Jq4kOLiOFLWQ2n7i8IvAQ?=
 =?us-ascii?Q?FsdtKndufqTZZrqzXjhxqIw2yxIkYSnEFr9NzQAg+BFnauIZJZYO1//T9QWk?=
 =?us-ascii?Q?NeAGhssryr/ngcpbEVsmzU1fDYZRUvjCtDgfcDC12zmPW4GqbMvGmCv3PpyV?=
 =?us-ascii?Q?2FdfLzCHbpXfIglh2NWWL2egTHnNe5PdE05rsG8j2tLSUKDmRwIuhV7LJRQt?=
 =?us-ascii?Q?bL755ffSuZUS/fs3XVuTChCW4YfoadXi2vRBpFYIZJm/f8QgGL+febHdRnYb?=
 =?us-ascii?Q?erIntn13JWO7SXk1ZEYpHLBiGRbnpnXqsCCLZ45/t1np76Y6Y2v4fRQFDMb+?=
 =?us-ascii?Q?FxuDJoHlAzpeiIIJLvta8RqOlwWcB8MHOJs8YQur2OY37zPHb54+dMIiYGf9?=
 =?us-ascii?Q?ArhAqW0/RwNYmQLZYx9eCjvfPSsdl4YDFVaPC25Xc375EDYbpLdDT3MTnImb?=
 =?us-ascii?Q?OmJnlLaZsTajRAUxzJpiXM7yjjVWnwr8JL6op+S+klsYx++EY7Sr6dFd/nzL?=
 =?us-ascii?Q?UulDT0JMxIjH2TTzu6I+sUKSSlOOeKrPfdzIFhkcwL1fWkrxS8huQc3Km2tt?=
 =?us-ascii?Q?L8wJol25gtEANV/XrwGozXJZaNFMy5viaPLytwV6CVAJvxWcRPeSPRwavfJa?=
 =?us-ascii?Q?IG6LwBtx5l5E8uV3oqGihYHhPv+LFJG14vEWGUqUjnRUKb17zDNDKTxvFqIe?=
 =?us-ascii?Q?MsJ38IqP4TQSP5OSY5IxlZS8qwbepnho6pGwt58FDaVfYoA9bhu0l8ya33yH?=
 =?us-ascii?Q?0ABxKdFwqtLx78Tr6mZVdVOmVPMAWwLIzTQIU1Hdp1OXlD7oSdIboq0Rh5Mm?=
 =?us-ascii?Q?3ZBni7JoVXybYxbay6eadjWLK7aXgZG+KKEyCgqmhgRfahfy4zLcoAUmRmUh?=
 =?us-ascii?Q?xnbBbhFqYYidpKw/t51Zc+7NnO0v2BYApYBb4oOiiHZ8A+5Vp5AkiCzId5NE?=
 =?us-ascii?Q?o7w9jGuYva7JOSxora/hScUbI7XHYBcK2fVWBQxHcg/XYOcQaV2R+DKOEH2U?=
 =?us-ascii?Q?gblYyn1q20irfoZtYvqA36LXAk2FLBD6dO+AorU8e6b6PfFA2UR3BpQGt9KQ?=
 =?us-ascii?Q?Os7CLRuu0BDE3yo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:35:52.3948 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fbac6d-66df-4961-303d-08dd20afc947
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8509
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

From: Harry Wentland <harry.wentland@amd.com>

CTM values are defined as signed-magnitude values. Add
a helper that converts from CTM signed-magnitude fixed
point value to the twos-complement value used by
drm_fixed.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm/drm_fixed.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
index 1922188f00e8..0b44f2f294ce 100644
--- a/include/drm/drm_fixed.h
+++ b/include/drm/drm_fixed.h
@@ -78,6 +78,24 @@ static inline u32 dfixed_div(fixed20_12 A, fixed20_12 B)
 #define DRM_FIXED_EPSILON	1LL
 #define DRM_FIXED_ALMOST_ONE	(DRM_FIXED_ONE - DRM_FIXED_EPSILON)
 
+/**
+ * @drm_sm2fixp
+ *
+ * Convert a 1.31.32 signed-magnitude fixed point to 32.32
+ * 2s-complement fixed point
+ *
+ * @return s64 2s-complement fixed point
+ */
+static inline s64 drm_sm2fixp(__u64 a)
+{
+	if ((a & (1LL << 63))) {
+		return -(a & 0x7fffffffffffffffll);
+	} else {
+		return a;
+	}
+
+}
+
 static inline s64 drm_int2fixp(int a)
 {
 	return ((s64)a) << DRM_FIXED_POINT;
-- 
2.43.0


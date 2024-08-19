Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 024C99575ED
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B63B10E374;
	Mon, 19 Aug 2024 20:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EH2gnvPm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A202010E372;
 Mon, 19 Aug 2024 20:57:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ykiZ17h/xP9u3w+PTy4si/c8v4PeL19Yz/GwAdUEuw12CphLsONMoZKncHWBXFxQyJ7Q6xx0pfP+EK2tQ20CBxxgzE3190a4X6gWWPIFP18nTR+pfR0CBuqhoo9C5dXFIkYTDEfGrzHMWWiywKB/pyLzoMl6ehNgJNEXfty36BsO0/0BlXv6+8nLB5gUV9ktBUA4nWasSMqRg4wUCmFQkK5NVnwA/C6OJO+9Q7/b+MpWOkLN8U8XECY0HQB1ee3XslDQUXtWhsD5O1BQTO9d5+TeXHzTVwnPaI5RPiS/eu0sr1iX1kxhcMiknjIks7C/CCiTjhiO1j9FMrUiAB5HsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdOccGs6aU9L4rPu4P4SBXWXOH+goe+i0KuW8i6Hpjc=;
 b=GUnvYNj/GHvA7b64IUf6x+567qnSuOqSlISLhkej7kvHK+Hm5OWjhyDt1ydybwnbAaheGA0Ho3UYdEssNBgm3LMkIf4QOfr+KHbzrEpLzR6BJ3xxqhTZ2AUAazFVYWZpIe6vko4NqOgrBIlpAi8Z6Y2mGEu4RqibInQjfYZUlYLvMC181W7rOcVFiMDbVXv2/ICIcvCAuwGwD1G5ODzBQDxo49vbQe8Rn+J0fogdXhbMNhLZnCBOQy4hB4b/7Wbaj05SCg2RBOLI7rDwXQZV5G8yY06UunBEiyxxHl8cVpPEupvE3EzWy5srLg9xhMaqvP6nam0cPTbItiVbCrDUog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdOccGs6aU9L4rPu4P4SBXWXOH+goe+i0KuW8i6Hpjc=;
 b=EH2gnvPmVMcHzwFl0EP3Q003mE7G4sXBrw87mZVi1Y8fKwOu7ENmhgQ4tHyVoboZZrvMJVwO1yjhXrdK2faO9CTLyAEs4sFu7VohMqRD98QXwHF1zFf/XurtND6Hvrk6gF52/T7oDXx030THsQTHj7EE9nwGfyOOal7eG8Qrasc=
Received: from MN2PR17CA0022.namprd17.prod.outlook.com (2603:10b6:208:15e::35)
 by LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:20 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::d5) by MN2PR17CA0022.outlook.office365.com
 (2603:10b6:208:15e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 19 Aug 2024 20:57:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:19 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:18 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 01/44] drm: Add helper for conversion from signed-magnitude
Date: Mon, 19 Aug 2024 16:56:28 -0400
Message-ID: <20240819205714.316380-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|LV2PR12MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a63ede-c451-4ced-f3cb-08dcc0918482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4owasCf7iFzGQ+8rNCm3vV7q+Oo/upH5F8vH50HHO5iQRLw2BJiuG4F8iNIZ?=
 =?us-ascii?Q?gGk5u+Pod/rufN1LPgaVgAPl1Gy+WtS2bi33ZzKbVO/IWQgvGJTH0ffajLoM?=
 =?us-ascii?Q?6uL7WfWFaoRuGCBIYEpn6tucrrM7uj0hTHSrsazhgmXNT/6pUii7EvoqBBRJ?=
 =?us-ascii?Q?V3th3v1Vyvr3yZmMxidTNK8vl0GygbUN6LPv7/2q9sW+bpAi8MOjseQXN3ly?=
 =?us-ascii?Q?AC6ewcpQ3ac7hBQ3S2gS6CoeJgYf6yZ/Mt2PKNr4JRycjKtgzcsiHVkVNz+S?=
 =?us-ascii?Q?vPgA4HLp5ShraKYG7LwC1FW5iwaF8ruta6MDR9MSD+2guJyaPG/Ur7kT2ilm?=
 =?us-ascii?Q?Nd2/79T2KWOeeAQ4z6/k5AMAiF8hTK92iqRho8cQxp2cOWaaliGMCxQ4euXp?=
 =?us-ascii?Q?rZgHm4YrGX5pzWPpH4JmqurHyXKwz6mKQkPt4OOqEn1ePgvi66rAjRkZ0yi8?=
 =?us-ascii?Q?GxSk+uR5fFmLOUyCnyUeJ6JWLz2RAsSiZTWNU/5NgC7ESkg+ZZ64FK7bAwsb?=
 =?us-ascii?Q?nrO892fDH+AA6PnOJ4pKa33XMOM0QOhc+sgMfkk2zIsA3p5f6c63+TtxUqa9?=
 =?us-ascii?Q?e48AwhLNqoqoh+NFNT/3vO1y3REh5VQSWybi+20RB8BH5ugQGkYcINm3KBPM?=
 =?us-ascii?Q?ZMEUUuGCWHxiFd7Cnzm4gxy9m/u0B6AABBeiOhg1VGGlvFtnwDlrpK5ule7R?=
 =?us-ascii?Q?BMi7rN8s4AMnZqTF82adC/uUo/sZI/JXGVPXwsFX405A+OaYTY1AzeUIlNDa?=
 =?us-ascii?Q?AkyXE3UCMsXd/4dpRBeRHfX7s9oK0dNK55CyKJ89NX8V0jaZY1KklaQhatoZ?=
 =?us-ascii?Q?R4Mp2ep6JLOZzC0BwTGyLC1eu6A+9TgdoMVsW6iKJNKbDreeki5c9xJ98i40?=
 =?us-ascii?Q?wVkbGGXgnGaDgkpSiQwWEWKTrK7wRFknW8NjJDBeedgBZv60ABvoHdEOuPKb?=
 =?us-ascii?Q?KEdyO9h2Haz0kTDsB1nElALObg5/HzAsqBj9K32vh/sLoY0oZEX4JLmvM3qz?=
 =?us-ascii?Q?OdHUrrXJocQhlymP62CXe9cD7NgUhfCgNAULAAmJbMKShHvnaX3G6Xn61Gkc?=
 =?us-ascii?Q?8s7BzlMPFEWMAgKzB5GoOVQYJUfeCj2cC5uGnC3psaWSmP+983Ny2eRgaoXi?=
 =?us-ascii?Q?Bz/CcxM1LbDa75Ur7fJDs/fKqvBeoV+dWH36kYKnagWdKdq7Q73qrE4ctKCv?=
 =?us-ascii?Q?37vqa6J8bkl+THxjBLJFykg6NGAlMS87VzsA9dgL+tGUSJ+ELX1VCl0phGgW?=
 =?us-ascii?Q?lByjKtv4dEX46nrPat8dssoI/VpXk77h0XndFYzugvMmvOuyyyDn9wHie23C?=
 =?us-ascii?Q?kf1D/rGhulxkdVV0TrcThDu4qeyyRhcF/BqlyjvN8uoDvDjeHAym0lQLzSjA?=
 =?us-ascii?Q?S5k9Hr1PHq5R0h4m+XnauiojFsDz6P9PSjUCRaLPLLApW1BMKZnWnZhZQ75L?=
 =?us-ascii?Q?9T4l4YQ8FMcB5jCEbZ3vnAZP+4FrHGjr?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:20.4952 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a63ede-c451-4ced-f3cb-08dcc0918482
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5869
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

CTM values are defined as signed-magnitude values. Add
a helper that converts from CTM signed-magnitude fixed
point value to the twos-complement value used by
drm_fixed.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm/drm_fixed.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
index ef8bc8d72039..793768c1e776 100644
--- a/include/drm/drm_fixed.h
+++ b/include/drm/drm_fixed.h
@@ -77,6 +77,24 @@ static inline u32 dfixed_div(fixed20_12 A, fixed20_12 B)
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
2.46.0


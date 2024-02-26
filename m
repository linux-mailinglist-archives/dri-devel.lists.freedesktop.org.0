Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB53A8682A6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C3810F257;
	Mon, 26 Feb 2024 21:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0r7FijqR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2047.outbound.protection.outlook.com [40.107.102.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5257610F238;
 Mon, 26 Feb 2024 21:11:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJ3ugi7SmMNDHZzy1t7JUh7zJUms8U0kwbv6klvxvSATAEdZzlE+fuyi/lioJuZKsqa0HEWVjDz+P0aj1aYkXw4YkgTtukMbDSSrS9pDUmpj2dneVZzvwZIpy0vNrg3gWZGALhnAZn1HlMQzbCUVzN8zQh8M/5lp6fU62aVugHSzdPpDaLVX3Dft4b3d9RMljvpzKw84rmkEAYbbiXVaM9E/otxPeK0XLOass4DcLWOSgtaTF0WoZSEOXlBMzXReYJuSWhwg9RAN3qY139O7NrwBFtwtz2Eb5NdnIf6DEvTCD6gEA0iLBf74HB5sxAj9rOqRRK1p0y+HblA1b734jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRII35rF68akEvBAyp1AEjbZqXmRfBES8lqQu6ldNj8=;
 b=kuFAo/WGgFuq/TP1yrTU3tthfzrxUqMppgN5ccG8JU9H8+kSj1HHzO8rTqtuSuX95kYqOmCZHXu4x+hafIAZgGXrSxe3lxybvfzD+DZoOsqtix0pOqbdiT0p2ZRoI6KIJvu+Pi3z715/HqMjVayILkVmzZw7KOEDgkv27aLLDEbwjJ1/fHQvJ6aUgcK11mFS9FAO3G+vUQajAf+o/iK52UsgInzTBBSKg1+QJ1HJ7DkCPxO0JkHq/Ku3f5dRdjMDtpfRfFl28uVHilafi1ZK2LZ6RXEQMajVoDGWcu7WI4t2yMB1W2hExJhBuRmoGcnB/G/Vama3CGEFWqTJtagl8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRII35rF68akEvBAyp1AEjbZqXmRfBES8lqQu6ldNj8=;
 b=0r7FijqR4MAD8zmUmCZ3iQok5b2lJU+/4Dlug9PIu/jSoCKnXJZUfupPTljpfseoBRE8Ui3Bemznd4wl8mu0cEh5TLu+I47VjnsxzNThQK9oAHswI1V8wBdmPKxIuqae8yj6FqHM3tKKEB453c0a4bruQ+iR7ZWj2GKHp0o2TCE=
Received: from BLAPR03CA0101.namprd03.prod.outlook.com (2603:10b6:208:32a::16)
 by DM4PR12MB5772.namprd12.prod.outlook.com (2603:10b6:8:63::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Mon, 26 Feb
 2024 21:11:28 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:32a:cafe::4f) by BLAPR03CA0101.outlook.office365.com
 (2603:10b6:208:32a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:27 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:27 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:11:27 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:26 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 34/42] drm/colorop: Add PQ 125 EOTF and its inverse
Date: Mon, 26 Feb 2024 16:10:48 -0500
Message-ID: <20240226211100.100108-35-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|DM4PR12MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: 362dad8e-99c9-4f5c-2e97-08dc370f7f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yKhPPB+QQ4ZTK2P/ZVPP2pfAF9LA3XQKkGfUzYgMqZ4pNU64k2n6eBhI1jNm2Sxz/rXr5pCjJTGDmo8AP56PIAE7du0O5T08gni4Nyy2aVYP+zZHwYlt20SWxeMY6y7aTcVWGB6M2aQ/6LPSirBbIYHzuYvdLnYvQli+E67feTuOGJHpyM6ejauqIG1sK4z9Ka0psgCCPQN1wXUVlecQSCGFPRByOHqlaDiPq1IbXJXkTYUPRxDl24NTVH9gQ4E1F3ub5SsjWkcxfogaQezCmngs6foCkxQt1Z+8hP3o73S0Nui0c9uiktqXyR0QM/SyOv8cfBUzjHqlBOUiVrKe8n0vKhkd5XUeptPhERt07L6ER4BBtugSSpmxguqMjR0weW5Z/fINNanBmc/3TlaWUB7V9GXNRUzfLul/rOU1OSPf9dfh+ndElPjnu3ovvBQB6InFz6iPrn7sFfAGFIolQz9EjFC76DxqwyLco4V85j8gWz8jibueU0w9DVgkcoyFkKhdjKC+N9biH+uTaoEyGnzOJ7A3KDFykpt4nPP1GpaL+oiqchtDsIK5XpKWAz4J8OjBMDldJsWZTltQwyK7y+BbYiStnS3hizY8HADyZAqLEstxzhrlxkLhanxYSKCQj2yO21jME0lmdX0hKu2wPZ4ozGw6I2/LJCjToimCnBZXLQubjgOZG/jf7dxll+zchgLae4pKxqx6RKWhW/oJeIFWRlHNwVXhhBVegdbUXpTSZieG+aRoGeP2FSnguqpL
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:27.9428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 362dad8e-99c9-4f5c-2e97-08dc370f7f52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5772
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

The PQ function defines a mapping of code values to nits (cd/m^2).
The max code value maps to 10,000 nits.

Windows DWM's canonical composition color space (CCCS)  defaults
to composing SDR contents to 80 nits and uses a float value of
1.0 to represent this. For this reason AMD HW hard-codes a PQ
function that is scaled by 125, yielding 80 nit PQ values for
1.0 and 10,000 nits at 125.0.

This patch introduces this scaled PQ EOTF and its inverse as
1D curve types.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_colorop.c | 2 ++
 include/drm/drm_colorop.h     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 77777baa1eba..781947e42b02 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -40,6 +40,8 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
 	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
+	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
 };
 
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 8710e550790c..e06d9ea28efd 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -33,6 +33,8 @@
 enum drm_colorop_curve_1d_type {
 	DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
+	DRM_COLOROP_1D_CURVE_PQ_125_EOTF,
+	DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF,
 	DRM_COLOROP_1D_CURVE_COUNT
 };
 
-- 
2.44.0


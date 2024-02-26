Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97FD868280
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA1C10F063;
	Mon, 26 Feb 2024 21:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J05aymU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6016E10EEC3;
 Mon, 26 Feb 2024 21:11:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tn5r2jYn1EJEGpx6bj+BJY3ATFxbqYuJ2o5m5YLfaRF+FFfNS80CdK9ti6Rr4waZ5IxIkuP+45/S3uXKvhzVDZhYlhjR1ZRhXm38RNX2Fm8dLsDX6qzN/0VzB5LJ6wyqsswYPPUM/NX19RQZ6/UpPGDPtYo90z6T2H4fza7cVuVkonZIU9Sj9LHoxHenkonfeJXdk+K06q6oOGMU/WTsov+8/1h+Pm4wLCWFL7HMI7ndBTdLqHLWqJLZf3oksf4mYBOMHHsF3BW10KQJTgmNmoFQ7jaJLTrYGNQBTtZqWK5HxpxENa9FMNmCInEV2uFwt/Z0ddh/R8/UoOWGs+Re1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fy3XXTMfRUetwO7a8Iv7/Qyy76LmDE5/9QeuSJEvYno=;
 b=PUUjplzskSy/BB7b3mPDcY8kYxwKy28EQBE4U09XLFo3vOoxlw1dwV1NzmDXAD6FabwyKPnV9CL/RxQGchmG19Bc/pLnNZ8wNiQFNi+2lFpQ5LZgxF+2qHH+u+ReaaEpFOdDlAQd8OFTFy+AThiXe9bovPk78kNOEO5EdIwawkhu/7hFZ1/dTW5bfjI79Q9cXD0xsT23KaBpyKR6TR//0ptktNu4dQhaTqpVrsfmoSQ8iqr/CNetlQaNXl4KfJj6LpPWyPEFFCE7fa30wRxeqd7mcvVMbeg9Ukp3PZjsSJT0gE1fpvz7yln3r26/+CPyDcOoc2Uq4NPaRDoWT+kAmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fy3XXTMfRUetwO7a8Iv7/Qyy76LmDE5/9QeuSJEvYno=;
 b=J05aymU16P2Abwb1hXV2NguFgkZgvYMpddfkST79eIdoO5Pna9XdWUYytYALthJcrPSNY12vyf4D1jrShQuBsA/q4oknAOV8JLAr7MA0hC43dkXOsO0SVy7ATbuOTWUeYaA80/PL/R5cTpCAUUwDM4Fb48rg+c7rrQE3xUcHlag=
Received: from SJ0PR13CA0074.namprd13.prod.outlook.com (2603:10b6:a03:2c4::19)
 by LV8PR12MB9136.namprd12.prod.outlook.com (2603:10b6:408:18e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:11:08 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::61) by SJ0PR13CA0074.outlook.office365.com
 (2603:10b6:a03:2c4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:07 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:06 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 04/42] drm/vkms: Round fixp2int conversion in lerp_u16
Date: Mon, 26 Feb 2024 16:10:18 -0500
Message-ID: <20240226211100.100108-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|LV8PR12MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: f4bbeb79-0e15-4396-0dce-08dc370f73a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ncqXcheKWeCv9KLOuYphlwInKwfR8Wl2LQkQMOpBvOqlfnOA5yLj+La1HgihRBydc3j8yLEAg6sZCmgU059RrMYUNcIwM2BS6CqCRfaUZ9MWLGFo5iXItq4nghL7Zr0iH4AMBFKWvMLGpJlY6JsnFMkrGWPKzDOUL2Za4fTfyjwCAbO0j9xZ7IrRyeOR6ODy1PsQtFndsXkSFyJvBl4MqYYg1yIzHoa5dW/1v9IJBnhW5bOavFYOYXzNTG5h74sSzCsSIXxSCLAA67PzZjOohT1ZQHyaREZiWFMwYJL424Mn4tR4U6rOR2kTwRvAeuBNf/6EwiFNR3lsJK2rRT9PJdNvebS6SfgmBdCdC8BUH0Gn0oo2VdGaWULbWS9mw5c6fXcYPYOvo7oYYuzyWxwNVT+YGPdAkAu3LoE6N8fW4TuB+OKbz1Bu2OQycvNJs6Eia3E2Nc4iD82qMU0fA5hvcPVnMkdehgIJvOTyQ8POxkBLI7pMuigIXf5rJZOUnHMOTCwYDnUo14Ma7QBlEehLPp6le1I5HVrBExCG3pxzJMghyfBU/bEGsrMFYH7EzMbH5p7VPYMU9mfau0GI/28jKR2eTzuiocfVQkq6o4qOXRspu337llz6klEjVzRvyOES544pPmdewaXVRUUhqPmhp3kcnWneyoZTsK4aS71n6i37ursqmNBiToXc2IQqIN54YMoBM/GXCLMnv2c8k5oAIJx6G8IW9QEKLeIxVHoh2P0GhdwamsT08EC7ZD6d+yJi
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:08.3023 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4bbeb79-0e15-4396-0dce-08dc370f73a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9136
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

fixp2int always rounds down, fixp2int_ceil rounds up. We need
the new fixp2int_round.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 3c99fb8b54e2..e70cd473e3be 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -98,7 +98,7 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
 
 	s64 delta = drm_fixp_mul(b_fp - a_fp,  t);
 
-	return drm_fixp2int(a_fp + delta);
+	return drm_fixp2int_round(a_fp + delta);
 }
 
 static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
-- 
2.44.0


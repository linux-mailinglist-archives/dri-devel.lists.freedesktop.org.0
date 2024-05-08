Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1638C067E
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 23:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C85910FB87;
	Wed,  8 May 2024 21:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VxzklLl9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2071.outbound.protection.outlook.com [40.107.100.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621AD10FE91;
 Wed,  8 May 2024 21:46:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcfJq6ECr3cnM5tBIxsiJ5h6+s90GdipxNSjniGvjPUVc2ENc5mOTOMUd/Snd5bVwNFO0QLlzqF42GJabCoBFoejKpR5BP5xp++NQr3tunSONt0vO2ma9jrQCEKpbCt8748biqB1TpoLvpQAR0yKICHn8EZPZdV4ym2nzoK8YdKExOKMaue0iQ4In01g/ByG3E9V1s11dxz0P1s25tdjgw1EYABkr3wAtzzB91L/DesAvAD77Sa96Y5mIitKE/b0/Uy7o6L9XX8GzrXn1VXyxJpJAxra5JaHAvP4hdIZNLxhuEXEB+mrQJL633YV36jRM1bRW6aUylKSNMFoqjbfJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7igv+HwvqcHayPwa2WpYbYYtnoemNpLM3K5dnjJ1Vv8=;
 b=E4RMbG9Fn8u57RBl3eYoA0UG7+5mkG0Yx7bjyBZycsofXCv2qLw+LzUhSe1w5A81FIfJwGzM3Ryya1QL+Cc9oGwbFyBGbjfCGyT06m0xHx5C2RAZMBsufHuAG+MehfXYeVaFSTqIO/ScC8hUqgthKUKqKo14dDxicG0YSObI1aP5XmD2NucMF3QKucglwnIA5WQvAsxE8hF5bpNeL7yvlh0z+2StXJpkyQBd3asyLmPTQgjRQL9ci603sCwnxKaB14XUaigeseHV2jlmfV3+d5u5kt+V1n3Ds+nURFhMwC9ge2RIwbtFn+5OgEgcCPImXILZf3uru5IBnctSst+OZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7igv+HwvqcHayPwa2WpYbYYtnoemNpLM3K5dnjJ1Vv8=;
 b=VxzklLl9NNWKf444m7LArscRty8SKjr2RLgICCHkkoSsGgLtbRDqtOyx6nKggXQ2xHvNWwD89irM9C8SZvNFYX4Pu+kLt6ysRk7IKDxT3xc4ukfoHSfxg6+t3MyAQp+fWh+/wExxfF9eLlTxIcxYtAJudjFRJtHE48qkjYVFIwA=
Received: from BL0PR02CA0056.namprd02.prod.outlook.com (2603:10b6:207:3d::33)
 by PH8PR12MB7158.namprd12.prod.outlook.com (2603:10b6:510:22a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Wed, 8 May
 2024 21:45:55 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:207:3d:cafe::94) by BL0PR02CA0056.outlook.office365.com
 (2603:10b6:207:3d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46 via Frontend
 Transport; Wed, 8 May 2024 21:45:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Wed, 8 May 2024 21:45:55 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 8 May
 2024 16:45:52 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
CC: <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 "Aurabindo Pillai" <aurabindo.pillai@amd.com>, Daniel Wheeler
 <daniel.wheeler@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=
 <ville.syrjala@linux.intel.com>, Tyler Schneider <tyler.schneider@amd.com>
Subject: [PATCH v2] drm/amd/display: Enable colorspace property for MST
 connectors
Date: Wed, 8 May 2024 16:45:35 -0500
Message-ID: <20240508214535.356-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|PH8PR12MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 735b1263-f0f7-4b7c-95df-08dc6fa83d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|376005|1800799015|36860700004; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0FkN3NSZ2RkZ2VESGFLSndnL0lvQXBHSGpOaHR6NzhnNTE5MEtIZHZHQk1p?=
 =?utf-8?B?WHU0RmFlazM2NmszdEhQRnA0b3ZWL1BYZUxWSXhYR3hZNkRhZGdFM3FzOFY4?=
 =?utf-8?B?SGp4QzhhTGYyQk1oOGhvWUdMWlVqTDlMTzN5bXFDVGI2Qm1ianQxT1BETkpM?=
 =?utf-8?B?WnBFVTZzcFRGcHBmdG93ZVBRNTIzcW1tNUdYTXlGd09PNFVjTldEZTBhaHg3?=
 =?utf-8?B?T0RGZ01RTWt6UHdNNlFrTWZDNG9VbkdJWTNwY2svdXBCSFpEL2Jld0VTN0dG?=
 =?utf-8?B?bWYyR1B4VlhOc2FRZ3d2Q2JBejY0WHFaNXlCUWlJMGp1U1VoNEVXZFV1WUI4?=
 =?utf-8?B?cGdDZ0t6VXZwb01oSVhhS2NtTldTNnJTb29JR1IzUVB4elliQ21qVjdtdEV6?=
 =?utf-8?B?cHZrVVJhOTV4NFdINDFaaDVHOHZvWUZVa3dNREpINzk3eWxieU1iRHRsRVh4?=
 =?utf-8?B?QjB1c29kY3BCWWdxdnBBVFhEdld2YlVWS3pBSEtyTjk1TXN4Z1RHcUcwSUpF?=
 =?utf-8?B?VnFqZ0lPZTI1aWxsUUw4czJqNXpjRUhnS1pLN253eHhHY2RiQ2NzWjZGaHlr?=
 =?utf-8?B?elZPK0dZc1FEcHNYVUxaWFNIL3ZWVldLdEJZNnJRalk3NTFjUVk5dHA3N3Ex?=
 =?utf-8?B?ZXVkZnlFeHUrb29pdnk4MmY2dFFJZ2lzc1k0cW54OWx6WFNIeEpIUTB4SnJW?=
 =?utf-8?B?UDRMWldQM0E3Z2R3Nlk3cVFzd29ZUS9mZEY4R3JTZUNkcUFmbERWb3g2VUlJ?=
 =?utf-8?B?TkJhb0E0aWZpN05QOXdBc2g1ZFVySmNsMXAxYXVxK21idkJTNG9LMnI3bmhP?=
 =?utf-8?B?aThQbXh5elJnakJpNHNkdGhJelZuSkcwRllxZE1aMFcxZHRGak9UenlvaGhE?=
 =?utf-8?B?M2RkRkNxVDBacmtXWHJsY0IvRnFsZ082dC9ySEo3SkVYdWxkcDhxcUVCQXlP?=
 =?utf-8?B?RFZxRGExRHFSa0xiRjd5MXFXdm1mVzdVUy9vUjlMb2tRRWhHVFN0d281SVZ5?=
 =?utf-8?B?YWJGdndjRkNaUlRKbVpzZzdXUk8vMS95T1YvcWZPcGlvOU5oU0RWR3VJdDdk?=
 =?utf-8?B?eFdSNUlVeVlQRkk3V25ibUJlanJXVE0zZWo1M0NwQ2Ntc3lKK1RyNHZMdi80?=
 =?utf-8?B?WllZcHY5WE5NVHp6NDJTWXdOd3phZlp2eHNTWTZQU21BWVhBYnpiZG5JUXF1?=
 =?utf-8?B?VEdYeGRPdjMrL2lyclJvSEo1amR2VUVrU3ZPV2dEekthN0lhbm5LMHJrb0sr?=
 =?utf-8?B?NERkeHd4LzkrbkxuYmcyMzYzclFWU2YwNkpScFB2N3liL2FnaE9sa3JYa2wv?=
 =?utf-8?B?OU1hdFZySk4vZGthVXowWkVNSWFjYU1CTnBXWmRnbnZZazRoRDJDb25IcGho?=
 =?utf-8?B?a2NSK2krMFpnSDUwWHN3U2tSNUJhYWw5Q0RXVGJLdDlrbUpHMnl3aFJkdVR3?=
 =?utf-8?B?N051WTVWcUZmbmV6N1pmRDQ0ZXlwWHFFcFkrSWt5cTJVcXZ1Tmt1TzNSUU9l?=
 =?utf-8?B?UWpZN3JXajdWRlFRR1JiZ1JPN3dNN3I3ZDkwVGkxdzIyclJITGh3YmxqZnhh?=
 =?utf-8?B?c2ZYTWRIenQrbXBVVXBOU2IrRzRORkZtZXl3Z3djNWluRjdvdW92N3c5OE91?=
 =?utf-8?B?U0IzN01XTWtzcDI3aTN0TldqWDVPNVZJTkJmVFcyZkFxNG4rMjdVUFJOQ2Va?=
 =?utf-8?B?SDhPMHd0c0YwV3ZXK1AxMHZZR2syZkVXVzNaazBSdWo2YnhHV1g2eTFoSTRY?=
 =?utf-8?Q?QzrKYnYlT/zDwJgQzNlv+up+vJPbejWSIxTGVta?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(376005)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 21:45:55.2130 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 735b1263-f0f7-4b7c-95df-08dc6fa83d40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7158
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

MST colorspace property support was disabled due to a series of warnings
that came up when the device was plugged in since the properties weren't
made at device creation. Create the properties in advance instead.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Fixes: 69a959610229 ("drm/amd/display: Temporary Disable MST DP Colorspace Property").
Reported-and-tested-by: Tyler Schneider <tyler.schneider@amd.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3353
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 941e96f100f4..12b036d511d0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -613,6 +613,9 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 		&connector->base,
 		dev->mode_config.tile_property,
 		0);
+	connector->colorspace_property = master->base.colorspace_property;
+	if (connector->colorspace_property)
+		drm_connector_attach_colorspace_property(connector);
 
 	drm_connector_set_path_property(connector, pathprop);
 
-- 
2.43.0


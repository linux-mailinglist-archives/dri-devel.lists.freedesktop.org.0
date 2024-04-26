Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5748B2E6B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 03:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F7811A95C;
	Fri, 26 Apr 2024 01:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="28aR4mJT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2048.outbound.protection.outlook.com [40.107.102.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397CB11A95C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 01:47:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCJBHA5aTlGPSGSY8hAcNOeWcT2kD6yBt2ilDyRRJh41nPGCmA90fn3LvlvruxkaiLobt2J45MeZgbgANN8s9VQiwa6OaHPsWIMrosjXNP2k8gsYGl9nPlyR58GeBuNaDM+hfb5hHkvbVVOOSk6ZcAIXyq4Yu7FVjkGlBk4ig6xM1nPYEHXLZZjYNJzT8HILXpQBT4wP9B+30E6Lt+HwZ/SaFmz6kKBpCO++65P7AzrL/dRZyBEDjQa8QMslpwzIAarqFy82A1+OEAhYDP0qXFBmYWQFAD2jwPONDOu0j1LzRQ/hXbvw95USpdp8KvunL4FBCbjX4WnI6Is9jLxvtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42ED7G604v//c+W0hrRlCRdQghjY3epGqV/vPa6O1m8=;
 b=TzK7p6Lkxfx6yN07KsCWSt2cxh+t2Gu0KHkL/2Tu1N3PMBFj2RGVfkSTFI9LOwBihRSkc0TSN7ZT9wdoVW2HeGsIH8u2bFOMH5qdq2SDaN6GGHPi6amIoNAdqWSIiFulxKBJgsTBfL4NijB8gb9HbovC/XjANl481O3jEsxDHdTj4ydH/6ZBZsQzlHpCtaB0mQVuK24TZsD/VmS38SocKBOhdfnQ22tBr2PFJTlhml47wWwThDxvxBQkcGJKBCMdV2+DnMKvnIxYxo+W6PVg+mhmMJcbvjfIjUXjIonYCItnoUSRU1/wp+0ILUD+crMObvLGoOw+eoF65OwQRI4iPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42ED7G604v//c+W0hrRlCRdQghjY3epGqV/vPa6O1m8=;
 b=28aR4mJT9B65EhbrQIb/HcoSJ8oYxGtC5VpbbEFDuOIrVlVrBIiRlk1MkTgfa+I1/bcMTJjJ1Pp6foSCYQQOwiO+Yo1qbv3D/RRITyW6USsXzxUBcyczqcMiK3d4qKSAyC9yvY0Y5B6jaBz6MFa9bQ7MBFAyDKvKNEKjqqfNJNo=
Received: from BY5PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:1e0::24)
 by SN7PR12MB8148.namprd12.prod.outlook.com (2603:10b6:806:351::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 01:47:05 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::d5) by BY5PR03CA0014.outlook.office365.com
 (2603:10b6:a03:1e0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23 via Frontend
 Transport; Fri, 26 Apr 2024 01:47:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Fri, 26 Apr 2024 01:47:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 20:47:04 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Thu, 25 Apr 2024 20:47:03 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Thu, 25 Apr 2024 18:46:50 -0700
Subject: [PATCH v2 1/2] drm: xlnx: zynqmp_dpsub: Fix few function comments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240425-dp-live-fmt-fix-v2-1-6048e81211de@amd.com>
References: <20240425-dp-live-fmt-fix-v2-0-6048e81211de@amd.com>
In-Reply-To: <20240425-dp-live-fmt-fix-v2-0-6048e81211de@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Anatoliy Klymenko
 <anatoliy.klymenko@amd.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
Received-SPF: None (SATLEXMB03.amd.com: anatoliy.klymenko@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|SN7PR12MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 28e43bd6-3295-469e-f9b8-08dc6592c6ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzBBU3ljYy80WDFxVVQwOFRiUG14TzA4eDZyaDkrdldyWFZjd2M4dWsyWHhT?=
 =?utf-8?B?ck1jNHZUSlhZSU1peFNTZFgrSkxZKzZ5UjhUbk1hNHRJdFFXdEJwMHFiUXhw?=
 =?utf-8?B?eXIybTV5QVR6cndDWWZsNzhoay8zaUNRL29ZK1dJWmVxS3Z5SmkrQWdrMEVr?=
 =?utf-8?B?bFRIR2h1Z3JtRGE2aHhZN3l0NXRweWlJZndYbUxLVFEzYk92SzRBb1FuNDg0?=
 =?utf-8?B?czk2bWtKOFpNZ0YwUGIwMFRsS0lpLzF1ZXZUL0N0dzYvWERrQ2pMcGcxWldk?=
 =?utf-8?B?aTI0WmgweEJwYjMvdXUvQWVBV2RzK3VqNFVPNFRQSXVOSWdGbSs0ejdSWEdo?=
 =?utf-8?B?ak42aVFUUXNiTjVYSEx5ci9FS29nWVRKWHF5aUdIVUVBdWhWZHkzQk9pcVFw?=
 =?utf-8?B?azFlMG1mZ2Zvb3hXNTl0MFBOam1maVNHSFoyTjdqRWVWMm02TTJjU2VJQlF5?=
 =?utf-8?B?aGtrcmhqRkNDLzdiT0lQZFBnT1hTczM5eGlTYXpuRm9kbDZRZGw2ZjQwSk5F?=
 =?utf-8?B?Rm13dU5XWjd1YmRmV1IxZW5vZzFTVlU3UVp6Rnp2SzhNWGtxTXFkZjlZMVZw?=
 =?utf-8?B?dlduNC9GaHRKenVGN1JVZ1hiZWhyWGNHb3ltZE54cUdjeTFCTllRTjdNbTBz?=
 =?utf-8?B?WGhRU2NDL2J1OXZmMkVRc0dRZEdRRXBYNHFxSkt2RVE2UzB1aWhrekt0OEY5?=
 =?utf-8?B?UmozaW5zVStlcEZVWWhtRlZOQXN6YWt4VGIwdVNYa0JJcnVQSWNVdTl2Z2RU?=
 =?utf-8?B?engvM2U3N2tidDhCSTE5bW1EczhnaGFqMWw2ci9yRDFVQU9EY1BhelJUUjZq?=
 =?utf-8?B?TGp5d0dJeEliMUtkMitVR1JZMzJVcWpGbFc2VHVlT3BEeGxVOEZFMGFsZXlE?=
 =?utf-8?B?T0pLS05tdWlITkJUbEhHMnJXb2RIU1A1RjdnWFBMbDNka3h6cEdVbFBxYUU0?=
 =?utf-8?B?RHlINFp4ZUs5dVdxdnNTR3d5cjQzdUJ0MWVhTldhOU1BdWc2aC9QRzAweEJK?=
 =?utf-8?B?ZmJSK3hRcU52bGNEaXBGeVkya0hhRENaQW9IUC9QeXRxK05GaEVqeHJYeHNZ?=
 =?utf-8?B?Y0QzUVI2YUJBeTBNR1F0QmdLNVBZR1BlblZVNFJ2bk4yZldlK3VacG90WERV?=
 =?utf-8?B?OHhoYll5MUtUSWRWUE1LY3c0cHp2R2JvOHVxeldSTlR5Q0hhdEdWM0dTNWxh?=
 =?utf-8?B?dVEvYXpwM291Mzk2S2dOekhwUko3cTM2SktadXdQUDQ3Sng4OXdOQjU4NVdk?=
 =?utf-8?B?NUhVZHNDcWQ2MXBqc0h4UkF0WjMzZTFxdVNJa2o3c2VydGc4WThKSmcyYzlx?=
 =?utf-8?B?dVBTUmM1Qk1vWlVGSkpETkU0cWpqNytWY010ck9ES0xSRkNWZEsrTDVhU3RL?=
 =?utf-8?B?TCtFbzZDY0M4Tm9OemFlTVA3b29KZDFDZTBVaUhiZU03OGkxR25WQlVWVU1a?=
 =?utf-8?B?Q2xWa1ZYSE54UjVOck93YnZmZDZTMUhUZDk3ZXBmWTd3Z2hFZ3JCbzBHREdj?=
 =?utf-8?B?V2NmWE95eE03S0h1RlNLVXVrbmtRL2trb3NyVlJXYnFOVHI2bEJzYU93THUy?=
 =?utf-8?B?bnJhRFo4d0JsRFRVTXRHNVNKbDJjSU1zOWhiYTczM2tkU0FRMllBWHA1U0hB?=
 =?utf-8?B?Z1VGWDZPQW5WSEFuKzlsV2VsSEpVUGlJa2Z4S2xINGFra3JYY2pQYWlPa0FE?=
 =?utf-8?B?NXVuRFd4YXRxQ1lvQUNoVEVIVysvUkNZdngyb1BBWlQvdmltanhIOEE3dDF0?=
 =?utf-8?B?MWl3U1NMbWgrN2hRbkExY1RmeWY4dkllUTBlUkVTOVhwMEhqbG9mWkZDLzBs?=
 =?utf-8?B?R0FWdThxeUtuaTE5V2Jpc3VPQ1IzU2lZQW5SUUJDS1lsa0d3UDVUd2Q0R3pz?=
 =?utf-8?Q?WtK1QCKvhgPfK?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014)(7416005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 01:47:05.3339 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e43bd6-3295-469e-f9b8-08dc6592c6ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8148
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

Fix arguments description for zynqmp_disp_layer_find_live_format() and
zynqmp_disp_layer_set_live_format().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404260616.KFGDpCDN-lkp@intel.com/

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 13157da0089e..423f5f4943cc 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -940,7 +940,7 @@ zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
  * zynqmp_disp_layer_find_live_format - Find format information for given
  * media bus format
  * @layer: The layer
- * @drm_fmt: Media bus format to search
+ * @media_bus_format: Media bus format to search
  *
  * Search display subsystem format information corresponding to the given media
  * bus format @media_bus_format for the @layer, and return a pointer to the
@@ -1117,7 +1117,7 @@ void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 /**
  * zynqmp_disp_layer_set_live_format - Set the live video layer format
  * @layer: The layer
- * @info: The format info
+ * @media_bus_format: Media bus format to set
  *
  * NOTE: This function should not be used to set format for non-live video
  * layer. Use zynqmp_disp_layer_set_format() instead.

-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C8F8CDDCB
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 01:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7F510F5C5;
	Thu, 23 May 2024 23:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ifjEPms6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3B710F5C5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 23:49:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djokf7vgvDr+DCccOPq5p08g++c9VIbgui1gOD358RuJz7Ei/OUCocSCV7GaZ6F77z1PS/kEmsq9wGSSAgN3GYzXMM0TMxTV0zKE6KLQa+w+qycH5c/tUZbS40P6/sqj5rEi7jZI7yN+uePm/zyc6apkH/RgqN/uodQ3UFlqGCFu4c23Bznb6kih0hsxeM/bpC3dTKofqtJoO27xxb8SJODIIBHVzPw6ltcWNeQ+HR3ZT60cMKZi/2sHyYPlofS2c7DAdBjOsXb20ygedSmXpedvW6ee7O8gWI0qQXOzxd3O3mRpqgDaIM0ModQ0mUpA2dfhopzfcE8ZzC+6PCc87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsBGLuXMbm/RHm5dN/OALKTOpOocKeDS5y32UysOmFQ=;
 b=aQY80akmBCxwIFRO15O+vtGY//Ow4ryuZ3s3cJdqqxUgls54Zxsc73CvINl/Ep/FFUnjp1iFpxqbzyjDJFZ9UGR302Mu2pcngkKbvc0blOreHZIrccE4r6URxnkkw8SRrx23iTN6eHAkqg2fT7Q+RuOt9DnhpyphPiwBuk35vd+mpJC9r1NaupFsM5gYt8/fiNqwtM/qWIWywgOz9ZCadMPx3GrjIEReB7HkgpPt/MBFBQQ6mTso0cBdzLKETL3ZtgotSan3tNDEHh7oYf29hlpmT+4As90kGmhIwUoNuK2+dwDuDc+fZFzNLJxHAMdu07XfHltlmTgt3B1epAV8iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsBGLuXMbm/RHm5dN/OALKTOpOocKeDS5y32UysOmFQ=;
 b=ifjEPms6Wu7/5TSINYvOuw75Lp9Clkbp5SVfWpPcxoeZA9Zxa9azlOxlRvy7d+Atq3tbyGGJ5GkK9cQ/oolNI225gor3KuoMmerOkl4/3fIhMan7tC1bKEmYNreyIh09AK1p64Pc/LyhsoggHmNvH3CX4L14fGtN+kv/ITUwrbs=
Received: from DM6PR02CA0090.namprd02.prod.outlook.com (2603:10b6:5:1f4::31)
 by IA0PR12MB7697.namprd12.prod.outlook.com (2603:10b6:208:433::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 23:49:35 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:5:1f4:cafe::88) by DM6PR02CA0090.outlook.office365.com
 (2603:10b6:5:1f4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Thu, 23 May 2024 23:49:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 23:49:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 18:49:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 18:49:34 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Thu, 23 May 2024 18:49:33 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Thu, 23 May 2024 16:49:28 -0700
Subject: [PATCH v2] drm: xlnx: zynqmp_dpsub: Enable plane in atomic update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240523-dp-layer-enable-v2-1-d799020098fc@amd.com>
X-B4-Tracking: v=1; b=H4sIAAjWT2YC/3WNQQqDMBBFryKz7pRM0NZ05T2Ki5iMNaBRkhIqk
 rs3dd/le/DfPyBycBzhUR0QOLnoVl9AXiowk/YvRmcLgxSyFo0UaDec9c4B2ethZrwPzY30KJX
 RLZTVFnh0n7P47AtPLr7XsJ8HiX72fysREho11C1JoYiaTi/2atYF+pzzF5PIuq+sAAAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|IA0PR12MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e6e6c12-5028-431b-aa5b-08dc7b82ffca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|376005|36860700004|82310400017|1800799015; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nnk0SE9GZm1ySUhqa3FzSzhWbDZuWjNZLzdBMzNhYlRKU1ZYVUl1LzFPOXJs?=
 =?utf-8?B?K0owT1BzTWlpSkJ0OGhoSWJmV0FsVndmQWNzSGtISGlSNmVrcHJIdHZVZTM5?=
 =?utf-8?B?TE9TMDZJa213Ymx6VVNQWUZkK0lrOTdRUFdLN3E4ckFGZzV1WUNvQ3I2bGNx?=
 =?utf-8?B?aVg1SUkvdDdFUzk1REFDTW1DM3Fpa25nSmc2SUJhV2w2OWNydlE5TDd1RVBv?=
 =?utf-8?B?cUhlYVd2YVc0SDFHTTczRjQ4NWlpVFlDZmxRUXBKNG54UHpaTSt0Q3REOHgz?=
 =?utf-8?B?UDdpaW55Q3RPd05IY1M5L0RMNlRNY1RPMUZGaDducUEyTjJlV3FTUS8xK1pw?=
 =?utf-8?B?UEZQWVB2UlVBS2pVVjZBUENyZG5TaVhkbk8rMUJlQmcyN01Mb3FMQTF0WUJ2?=
 =?utf-8?B?SjRMZmVJdUZWY0daRllaNTdNbUNKRWF2U0RPVDBteU1rN3lobUl3amRmd2RW?=
 =?utf-8?B?cGh3bGVqOC9GMHBvRm9LanJNdjFGOXo4TkdDOGZtUStCYWtOYTZERTBpUFZ3?=
 =?utf-8?B?YzdtV1RUMGxFUjMwMzNlRmthTFRIVWt5RUFXcVpCUmhubU5wUDQrVkxDYnBa?=
 =?utf-8?B?MHptRXBIQ3VLQlloVHpxSWtNd0REcXdSQnhTWEhwZzc0SFZ4eVAxakNRT0VN?=
 =?utf-8?B?bXFNMTRJTGg1a1RMaDU3cFJTRkR4d2dHQXVvNGtUVmlrM1RocEtJQTFCV1FT?=
 =?utf-8?B?WmJaMHlNa1NXL09iWXRMWG9WZkZrMU5NVGwyOVZ1VmlQNFplZVg3aDkwU2Za?=
 =?utf-8?B?OE5KejMrbk5JWUhFNFpSRTJMUDRubk5oaDE2R1B3YTlrNDNkdWs5K3VyV1hq?=
 =?utf-8?B?L2J5VTBxRCtOenFOVGpWK2JOYStMM2ZQeEtESUlTV1N0TmZHZWx1NVN0d0RB?=
 =?utf-8?B?ZTdDY25xRjlIckpTRGloRWxmSFB4azNUczJzMCtUUVpISENOZnBhWmRBc0Zw?=
 =?utf-8?B?NnBwVnl4aXhtVml6WTloU2R0c1V5T01WSmtsL0FqV2FFZmtIdVkwMU9acy9E?=
 =?utf-8?B?d3Y3M1FjaStta0NxLzMyYkZCelczOVBOQ2RqekgyaWJoVnV0bzd3RlJtcUJW?=
 =?utf-8?B?RVdKTWMvUVIxT05LcEJaM05ZMTg1R3VhWjk5Q2FSR3NmbUgxRnhrTEZEWTF4?=
 =?utf-8?B?NS9hMExEcURUck84QllhY00wMU85bGZ4dzNUc3BSNkExK21TQzlobEJ5dC82?=
 =?utf-8?B?eFY2YTc1WS9ENHN1YlpSUktlSlpVNk41Tzl5NW9ZWUQ4RHZrK1ZDTnJsMS9o?=
 =?utf-8?B?UTg3bzdKelNHZjNza3A2MGMreXBkZkVqV1pPWDF1Q0lQc0J4alBTaGpLTEJ3?=
 =?utf-8?B?UFpmdlM1TC9Fc29ZSzlrWU14Ump4OGw5Skp1TnhDOHhHS1lKWnNVK25WOCtD?=
 =?utf-8?B?V0Vienc4ZnI2UWRkN0VmSWxrL0gwYTA3V2NDMlBlNlNzZnEzRmtFVzlvSVlQ?=
 =?utf-8?B?N2Z6RlRMQXdTVFZBVHJmWXFMN2QvTTVrcWxSbFQrQTZDQXV3ZzhPODJZd3Fq?=
 =?utf-8?B?R2Z5YUJ0aDhya3E5ZTJ3SUpKUEl1YWdLQjRRd3hlRWlWUWRIQ1VvN0g4b1Vj?=
 =?utf-8?B?ZzFJeEtTYUp2R3dnMlM3ZWFzNXhNMUNwNDRuSGFqTHFWYldNL1ZLZ3UyQzNi?=
 =?utf-8?B?cEJLQXFwa0FERHZTNDFGL1hiSFpxUEJBRnQ0OUEzaHVVQmVIVXYvSklNYmR6?=
 =?utf-8?B?SXFnMjlRamp0WS92UTc2MVNWaWNYTHd4cFhCeG9QOCtZL1kydVJVM3c0akdL?=
 =?utf-8?Q?TOAIg6g3ZMFuhk4xXqBFoLyt/HAO/ow77XxugWh?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(36860700004)(82310400017)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 23:49:34.6579 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6e6c12-5028-431b-aa5b-08dc7b82ffca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7697
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

Unconditionally enable the DPSUB layer in the corresponding atomic plane
update callback. Setting the new display mode may require disabling and
re-enabling the CRTC. This effectively resets DPSUB to the default state
with all layers disabled. The original implementation of the plane atomic
update enables the corresponding DPSUB layer only if the framebuffer
format has changed. This would leave the layer disabled after switching to
a different display mode with the same framebuffer format.

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
Changes in v2:
- Added comment around DPSUB layer enablement explaining why it should be
  done unconditionally.
- Link to v1: https://lore.kernel.org/r/20240520-dp-layer-enable-v1-1-c9b481209115@amd.com
---
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 43bf416b33d5..0b57ab5451a9 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -120,9 +120,13 @@ static void zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
 		zynqmp_disp_blend_set_global_alpha(dpsub->disp, true,
 						   plane->state->alpha >> 8);
 
-	/* Enable or re-enable the plane if the format has changed. */
-	if (format_changed)
-		zynqmp_disp_layer_enable(layer);
+	/*
+	 * Unconditionally enable the layer, as it may have been disabled
+	 * previously either explicitly to reconfigure layer format, or
+	 * implicitly after DPSUB reset during display mode change. DRM
+	 * framework calls this callback for enabled planes only.
+	 */
+	zynqmp_disp_layer_enable(layer);
 }
 
 static const struct drm_plane_helper_funcs zynqmp_dpsub_plane_helper_funcs = {

---
base-commit: 673087d8b023faf34b84e8faf63bbeea3da87bab
change-id: 20240520-dp-layer-enable-7b561af29ca8

Best regards,
-- 
Anatoliy Klymenko <anatoliy.klymenko@amd.com>


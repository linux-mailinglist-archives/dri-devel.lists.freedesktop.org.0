Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3538CA6EC
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 05:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BF610E0C0;
	Tue, 21 May 2024 03:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FOQRTBf4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B1F10E0C0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 03:23:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqYpnPfp53tVdv2XVCzDQ80Lol+8tFnbT2+sUDHnDm1/BAQIJ0k7a6UHhC1WcgFccBAVwSZUgsPNR16bUA8ojwQJo6e7CgtgH5bHaJd2UT80I5n0PbmjJAn1uvxSNAxIQZ4yMOUFXPJEpRg9ykMLZtMyY+EAsSC4T3yFTxJ4Cq4XtA7ZKJn/dvWyUJIHoUwVIbtZ6GaQ/tEmBxRN3qsCGrvdt458xF9z8War4JgdF+6+KJ3ChfAwHFo11F5RBmmH6RrVhM+PJdLaqJJcrPob52VXgIeUxXRtEDlLWEtpfTs+GDGEcOIA+ZXr90qzyjw74BdbH+Olf8tmN/bCGWXJLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILcX6jCnY1c7du0HMR52kxAwqcIOD6lLrdm3u8+eZV4=;
 b=CZxm0REpAYu1Wx427W2TUur5C+WNf2unkXrVT/7/t/BKYUGr4BPfnn8b+Lcj2rqWB3DOF+Yxa29RSHqo5XgOnduAy7zYHYNBBzN6hVFIPmnI1D8RblD/JQG/ICbiDc+XSXn+BUcDWw/ZJew/6+Ts9wiOlj0eXQjYhEFVG34ScV9Z03/maUWOsr7LZeX1HZbA2Ix7cnWNrM08Rf6jYHMwylAn8ZWexz3mPOcspX1AdmOUyznt5Rn61oSXhqMdOAHGyejg3B3av7QysIn2hH3yDV4CWvd2bCBFnwx3CbHWH2GA4RDvjki1hI6W2XVbQl1LANlVTaE6QHHyPc1HsvZ9IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILcX6jCnY1c7du0HMR52kxAwqcIOD6lLrdm3u8+eZV4=;
 b=FOQRTBf4afTdr39BJRUMhI05EhPsxxEimGKVzSsAcLzX5AZ3zInaSRmUE8coS1X1n0v0dSMyOZ1ubO+XYLuGNOwtjpI5UHd11+BoSd6ztUuQTsYmc1XNQv/yEdTkVIWLCW5pfIGKV5b5TcybhWDd19rdqaexBAny9LxCzlYAMmM=
Received: from MW4P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::31)
 by LV8PR12MB9269.namprd12.prod.outlook.com (2603:10b6:408:1fe::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.31; Tue, 21 May
 2024 03:23:09 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:303:8b:cafe::34) by MW4P221CA0026.outlook.office365.com
 (2603:10b6:303:8b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Tue, 21 May 2024 03:23:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 03:23:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 22:22:35 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Mon, 20 May 2024 22:22:34 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Mon, 20 May 2024 20:22:31 -0700
Subject: [PATCH] drm: xlnx: zynqmp_dpsub: Enable plane in atomic update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240520-dp-layer-enable-v1-1-c9b481209115@amd.com>
X-B4-Tracking: v=1; b=H4sIAHYTTGYC/x3MSwqAMAwA0atI1gZqsf6uIi5SjRqQKimIIt7d4
 vItZh6IrMIRuuwB5VOi7CGhyDMYVwoLo0zJYI0tjbMGpwM3ulmRA/mNsfauKmi27UgNpOpQnuX
 6j/3wvh/BmHVXYQAAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>
X-Mailer: b4 0.13.0
Received-SPF: None (SATLEXMB03.amd.com: anatoliy.klymenko@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|LV8PR12MB9269:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea75946-8e13-4d67-95fa-08dc7945563f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|376005|7416005|1800799015|36860700004; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmxmOS9GM0lBeFczM0JhZHBJOWRZMElyWk1UMGdyQkQrNElSU25XekZjNlln?=
 =?utf-8?B?WktWVmVUWkhna1NHdm5GbVV2S3YzNU45bXBOOWpjeStMcy9yc2xCSmt2eWxy?=
 =?utf-8?B?elNORzRsYVdBdFQ5Sng1MTMrSVR2aGhzVXZ1MFZpTTByM2w3a0d0ejdPOTMw?=
 =?utf-8?B?dUFmVytwbGVRS2hDcHNkTG92djB4RVMwWlJYeDdaZTROcElzNEc1SmRmVksr?=
 =?utf-8?B?NzhwcHJQRmdmdmJzdVRLNk5QM1NaaHRwSWdOV05UWWVNazUraEJScnNGTlFD?=
 =?utf-8?B?cTBldms3Z3JOT1RSY0pWaDZaVktzc1BXYlJBOGxMV2ZLRUNEWlYzK3R5dGFr?=
 =?utf-8?B?UlgxZjlHUFc4OXYzMHFHMW0xTUpMTkxqVkpIVlJ2ZUlBSkU5L0w1bURVUGRk?=
 =?utf-8?B?WTVMMFp6eTR5VnR3dUtPN1FCcG9MSXk2TU1JSUlHWXhJbVVZUnI4anJHUHpi?=
 =?utf-8?B?UHIyZC91SGYrZXVKbTY1QmFXRmQwN2xkOHVHZjl6eXpldnJZUkREbHFVWkFR?=
 =?utf-8?B?TGRkMVYwaGJvT3k3Njh0L1Nsdkw2SlZSL2V5VnpJa2lTV0VLNVI2bXBOdFlp?=
 =?utf-8?B?SHdCOG9TR0x2RDNtRkV4MEdteTQ1YUFaampleUJzeWR4bFlibTN0WE5IaG1R?=
 =?utf-8?B?bHI2cmRINUkwa3Q0NklwMnNXd25RUkd1cU5TY1lINEE5Z1Z4Y2IrMUxuRTV1?=
 =?utf-8?B?em84UDdxV3RUY3d6aFFDVHZ5NTJvUmdCQzhqY00vaUtEeVg2Q1FKdTFMR25z?=
 =?utf-8?B?dEk3YmFZSURjZkFsZ3N3MWlOTVdtQnJSV2dOeVpzZXZEQS93MG1YbXR4QytE?=
 =?utf-8?B?SVBYY1h6ZzdqVi8rUlJ5WUE4MlFyVGdQZWM3dXZTNkJpQjBwVm9lbTFyK3Jp?=
 =?utf-8?B?WFZ4K1dlZGdsTHdyUTF3eHZvWCs2NkxpbVZJNmVZa25EalZ3cVVjV3BXNURa?=
 =?utf-8?B?T1pieWNZaUdmU21JVU0rcU05b2didThSMEIyT20wNHB6TnZ6a3c3bDAzQlA5?=
 =?utf-8?B?QmFYSUtZY2QyREJkd3A2ZG94OWhKQk1hWmxLY1JQMGhMQW5xUzU3YmlYazk4?=
 =?utf-8?B?R2dGSm9VeVRNT1VxeTJOZjc0STBnU0pWYXo3SWkrSVJOZW9kYVMyVkFlTWx1?=
 =?utf-8?B?c1UyNGNjTVJkek1hOG91c0NicXF6YVdKem5MMkkyYWJwZzFkbmRWb3pudkNH?=
 =?utf-8?B?SUJhbkJDeDM5NWZlNnZ6SHdlWitvNzVsTEZmWnJLNEFXdmZYUVZReHZ5ZjVy?=
 =?utf-8?B?V20zZHlVZVNhMmEzcDhwTFJFK2VuM2JKNzBnWXFMRzdtK05ndWNXR0dwd2pw?=
 =?utf-8?B?b0MxazRzSjlVcWhaRFBnOE1rZUp5bnFyblhUSkZyVDk2eWtTY2pRdEgxdEJO?=
 =?utf-8?B?dURvM0VqdnZnUFhab0laYmFMeVRFZGxQd0xqVjU3RXdVTFVIaUppSUw1NDZ2?=
 =?utf-8?B?RHhTZzlXUFJ4WHVGNlVIWEZaR1NrQ0owZEdMSXQ2T253eS9CRE4zcW5rK0pv?=
 =?utf-8?B?Tk5pNzdZWkZpODJnd2RPbmlxS1F2eEM5ZDRkcFYzTlhoY2VWL3ZkdWVxUk9D?=
 =?utf-8?B?d3ljaXlXcy82NUhJZkh0ZEZBOXpBQTk0NExIVVd5OGQ5S1p0RGQ1SzIxN3Nq?=
 =?utf-8?B?NkZ1Kzc1YWxZc1BUbzF3YTBIMlpnd3FUZ0VwM0UxTzdLTFVIMStnc3FFRXpa?=
 =?utf-8?B?STZaODM2ajlNdWVIUkxPeFNXUDdnYWZ2MG5remNld3dJRlJ6cTZGaFVvYzJ5?=
 =?utf-8?B?c3JUVDJnSk8vck5lMTFJckhVU1IrMHdWRUZGVGMxelNLazhXdkc5Q2svZHZ6?=
 =?utf-8?B?RXFsemxOT0E3RHdkaEdrZUp4RDd4ME9jNzRQekErWU9rUUNTcFpiM01WZ1Vn?=
 =?utf-8?Q?n+OZcguTO0dcU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(376005)(7416005)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 03:23:08.4292 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea75946-8e13-4d67-95fa-08dc7945563f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9269
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
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 43bf416b33d5..c4f038e34814 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -120,9 +120,8 @@ static void zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
 		zynqmp_disp_blend_set_global_alpha(dpsub->disp, true,
 						   plane->state->alpha >> 8);
 
-	/* Enable or re-enable the plane if the format has changed. */
-	if (format_changed)
-		zynqmp_disp_layer_enable(layer);
+	/* Enable or re-enable the plane. */
+	zynqmp_disp_layer_enable(layer);
 }
 
 static const struct drm_plane_helper_funcs zynqmp_dpsub_plane_helper_funcs = {

---
base-commit: 673087d8b023faf34b84e8faf63bbeea3da87bab
change-id: 20240520-dp-layer-enable-7b561af29ca8

Best regards,
-- 
Anatoliy Klymenko <anatoliy.klymenko@amd.com>


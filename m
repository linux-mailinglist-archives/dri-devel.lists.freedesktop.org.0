Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 026368B4024
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 21:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4487011A96F;
	Fri, 26 Apr 2024 19:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GrtT88xe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BD710E5A6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 19:28:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBwP+2U+noWpvCWvumMpRZRgq8qGcMXhGGTsZlncXXrz14u/jf4j9gqVlis3c51ehHRgYxKhdP3On2ANYXrkac/NfTHiX/lgNA1n/Ev72WL/o2DU+DBqxQtXqshuJMCFx4jrM0eVEe8xxVxbLdqTRzGmPoY/SgIYn6gz2szpzIjcymXK2Q+OjYyAXhdXdvxWu6HV8QsAz4Lhk1cHMlMVTru//vkK39aimN13BSXaAgLs5zmqIJHJd49Omtqx0rxeJDSdu+cmcBLgV/2iEdnegGbu4lGYJPevqUSeIK6vDm/FQyquJvTDtwhbGwpWhPpj+uFblpTMWO5O2NCDqBKoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42ED7G604v//c+W0hrRlCRdQghjY3epGqV/vPa6O1m8=;
 b=JI27HE2JiUdSGsNxoh1r3BOKmXtCATeucBIf4gfkNXvIV1xgjTgg18veJ2kK2J2KR3rEZUm6mydXYyqJVfUjX1ZdoXUuFtOF3CELo0HW/CUY8szV9NuIMR3YtVopQzDxzxXeWw7dj49drH3ORRRhk8XLWnjE29hKPaqnu5OsXqzLebyW7J7/qvb2ofxQ2MxkZl2Aab7dd0/IwQkKhfnTVCtNp6tYOgUD5lDQmWEXhqiMkalMJd5T/T+iHHYzpO/qBKExNLEGybjYaFYKqI0A55X+uclQ27peKp1zJcnORHTzYcvh0da6nYL7xLk+NE+xI0aLonRH3bjRul21B2hxXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42ED7G604v//c+W0hrRlCRdQghjY3epGqV/vPa6O1m8=;
 b=GrtT88xeYk0Qr9PfCKZRy6YpCcwkVyqKxfjAwtk3H1U3CAdxBDKsLGfDeyjBbOnZUofD+KzM8hmynm7Q7/H5jdF0lmXeYrRNyAb2h+xV1AWV+/D/YNVz5rOBGtQShmZutbwpicpxBSfhycx+vh/xwlSO7Ciz4Pgm8EPrYcTLKZg=
Received: from CY5PR19CA0069.namprd19.prod.outlook.com (2603:10b6:930:69::15)
 by DS7PR12MB8347.namprd12.prod.outlook.com (2603:10b6:8:e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23; Fri, 26 Apr
 2024 19:28:03 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:930:69:cafe::93) by CY5PR19CA0069.outlook.office365.com
 (2603:10b6:930:69::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.31 via Frontend
 Transport; Fri, 26 Apr 2024 19:28:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Fri, 26 Apr 2024 19:28:03 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 14:28:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 14:28:02 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Fri, 26 Apr 2024 14:28:01 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Fri, 26 Apr 2024 12:27:56 -0700
Subject: [PATCH v3 1/2] drm: xlnx: zynqmp_dpsub: Fix few function comments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240426-dp-live-fmt-fix-v3-1-e904b5ae51d7@amd.com>
References: <20240426-dp-live-fmt-fix-v3-0-e904b5ae51d7@amd.com>
In-Reply-To: <20240426-dp-live-fmt-fix-v3-0-e904b5ae51d7@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Anatoliy Klymenko
 <anatoliy.klymenko@amd.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
Received-SPF: None (SATLEXMB05.amd.com: anatoliy.klymenko@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|DS7PR12MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 147a7f51-ba70-43ae-6f6f-08dc6626fde8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|82310400014|7416005|36860700004|376005; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bG1oQ2ExM0tPMlhwa2l4QXRGbDdrbldEVC9TZm9nbXFMcjhPVVJoU0gzTmdP?=
 =?utf-8?B?MDNaNno0QS9hTHFlWVhEbXJmYW9hVGFtaXEyTGQ1ZjFMV1BVaUJFQ3c4Qm53?=
 =?utf-8?B?YitKdXk2MzNOSWFHZVlRdWxYNG5FeE9NSlhHdTlpL0lWN0lmK1JDQk50YjUy?=
 =?utf-8?B?cGN3Tzg4enRMZUpocFV3amdwN0pzdzlmaGVwaG1IMDRGNktkd3FMRlRYTURP?=
 =?utf-8?B?cmU3V2M4bG5MeGcvaU9IRHNjZGdvelZMSnZxeEVlS2ZKWHl4NFpZZTVvZjNI?=
 =?utf-8?B?WE52dWVKMFBtM1F6NlA1UmpVb21YdnIyRW40MVZYdXdQbk8vQjZ5RUVXUUZy?=
 =?utf-8?B?Uy9xV0Q3Nm84TVB1TTFqSUtSMFAveGdkWjZtelpBdWxsN2JLaHpoODFZYnls?=
 =?utf-8?B?aWQ1YlJjZmZFSWhZUFFVWElsUEQrV0I5VFFQclphU3BXSHhWdEQ1bUhJUVor?=
 =?utf-8?B?S1owV3BTU1FxdFRSc0NSTU5uN2gvN012MDV4Y2h6NWw1QzVjeDRQclY1U0p4?=
 =?utf-8?B?QTUwbEhPT0ZQK2ZPZkEyb09keEZxR3dSRTh5MkV3QmIvV3NBdXpubGhlR3Fk?=
 =?utf-8?B?REw5ZFJUWjZQc0JTcTdvUFAvMnpWRTNPVUN5azlSMWp1MzVIYkUrRGJEcjU2?=
 =?utf-8?B?SkVucHJLSWQ4ejQ3RlNicXdvdTdIemNleVNEeDE4dzNDelFXejJMSys5dnIw?=
 =?utf-8?B?U2lHbEUySDRuRWpId0dvZk5PK2ROek92ZWVVUmhGaTBvZUg4RXRwQXBZcjNF?=
 =?utf-8?B?OTdwWG1WQldvYXFLVEY5WGNaRUR1a2V5U3Q5cWZWRHlVOUlIRXNUaHVqRDF4?=
 =?utf-8?B?MVBrN2pDTVNRY2IyeXRmRE9zMDJWRm5mZ0ZWMmh4UjRnZXlXVVVwYzBGR0w4?=
 =?utf-8?B?Q0hocUFKRmV2TE9YREdLWkx6TmNXUnVCa2dXQlFWRWhHMGt2Uk9NdHVFSTFX?=
 =?utf-8?B?U1NENHBvb2lMbDFlTEhpbEd0eHFMNnBwWGZ2aHU5ODl6VmF6djRXSFFSdFE2?=
 =?utf-8?B?VkFSa2wxWjRKRndVUUNERkJRVHR4Y01WWGliUW4rSUgzZjZiRDB1MWhpWXQv?=
 =?utf-8?B?RHR5NWRzdmV3YXAvWGtTVDhBYlBuU1EwOXNJOEdwems4dU50MlU0QmVjeklE?=
 =?utf-8?B?Njlud1R5YnJaclRGL200TDZMcFlJNDNrckF3TXFwbDlHWlJ3dURRQVpLR2Ir?=
 =?utf-8?B?Ym1ITXRnUXUrbUVGRVZ1RFpzdUIzUm5sWDZYVWxrb1JKbVZuZ2w2L01pNmFz?=
 =?utf-8?B?VzZCR1BpMEtubW1MSGdvc215K1RWZWJzR1lwNklDZTFwTUQxVkQzYWtUME41?=
 =?utf-8?B?WkM3eDNzNzhWenpCd1kxQlJUUktmdi8vOUpTaTB4TzErTUpOQlZzdFZPSER3?=
 =?utf-8?B?a3dkd1QzVjhiS1NYSzQyN0hQRTlRRWI1ZTJQN1h4VEhaRU9Sako2UUd3SmRT?=
 =?utf-8?B?cmx2R1hIbWRlY1JtRkY0MHNKMG81NlJnNjdHTEY5bXRHeWIra3Y2eko1K1Ay?=
 =?utf-8?B?NkxCdk93aUxxNUJpU01JZTZRRmVneXNjNTFobUovUUdFNzl3WnJ3VU5KSHJv?=
 =?utf-8?B?aGVsS0dBT2tJVjRDYU5GTjZtRlBRZHlDWjV5bmFpR0prRDV0dTFxK2VKZTI5?=
 =?utf-8?B?d21HVHNpeG82dUxxRTQxSGxCcGUrakpkN1VWeW1lK056SlNuVFB2aXdGczdr?=
 =?utf-8?B?R1BqeHV5UU5ac2M1aFpXcHVKTHRvSmFjZHJHazgwQXZCU2k2YXpaOEhKWmJa?=
 =?utf-8?B?VTc0OXd4elF3L2xkR25HVVcvcWFrMmk1NnI5WS9UZ0xINkk1ODJ2MHNKNWdT?=
 =?utf-8?B?Q1ZxNDBLdWl2b2VtVENGY1dOVnVNYU4yZmQ5REkrSEowSnZhVVlvajVNT0dv?=
 =?utf-8?Q?2spfHv2cpsvs+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(82310400014)(7416005)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 19:28:03.2707 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 147a7f51-ba70-43ae-6f6f-08dc6626fde8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8347
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA64C2A6A7
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 08:54:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9868E10E37E;
	Mon,  3 Nov 2025 07:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zeTv01pT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012001.outbound.protection.outlook.com [52.101.43.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC20810E37E;
 Mon,  3 Nov 2025 07:54:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIT4hyEcwsOyjVpHK1y67O2q7sri/XRJE9DpUf0AVfmRnZxEmlrKYl8nNvdpldIxNRik9W372DtFDcabr2e3lJaj8ksD6PJ9zgRtmR4AsNoec4hjy4WrbL9dq8z4wfw0WNlxGtbiedfpg0j2K7EKgtkDv1tjtUcl56r6ZfIszUQ7T0+/rFl6e3nIDcBcg5z/SMhzWjVbCkBQeOWq2CBf3iVQAwtE/YcP4EMyfgnHC0b0U1LznEwyu2LqLQ8xcvON50MZb3AUeeMYvO+vaE65bquVXnAs2XvBPXUg+6t40aw1CvvFVTPtGsY9CcfXGeVyWOTCIeMkq2j0tsuO2PLZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGZhJJUhQy5W37dpo0YD4fGOW0zN9cobZGucdcAE/8M=;
 b=plNg44sjNHDwdCFjRgp4D4x0O7PAJQZ9OOgmucaWLIpfFXxt+Rje7Fe6n8zVAN4nUFg//wOqH/t9dnSFCtqn8+dhjfAS7kbWLcnB4e6p7har4ZdcCSf3TYmXTs9l9kyF5vD72VzUc085FHiFl5B/owfg9mBTsQEt/kNqgN6e2c/xY/Cz0NUuDQxr9pgRBwHxZGFyVj6CkrezDtpK90/iyqFcz6wyaolz9JPHejEqIwhSd0ZqrYaWq8RkN0dUiEFrlqx8zUw4ZvzsZMngHvPUaNYUWh87R84nNEodJGmROAS0md5TluN5jhQJIEjyz2P6oov2H+2Y/+L0oWfA20ya1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGZhJJUhQy5W37dpo0YD4fGOW0zN9cobZGucdcAE/8M=;
 b=zeTv01pT4DarT015AYDNsY1bXemcWF6fAzknRifVl1I0sHac5wZDm1/WZvpsI1s/VfcjUspabFgrmw79LlzCWgSLtxAYRN78TavWA1rIq73vhpJY8a639GaeeR3u0m50tpK5c8WILAUcCb3o7Ndv57ilB79BqLFn2zucjXinpXg=
Received: from DS7PR05CA0002.namprd05.prod.outlook.com (2603:10b6:5:3b9::7) by
 DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Mon, 3 Nov 2025 07:54:08 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::57) by DS7PR05CA0002.outlook.office365.com
 (2603:10b6:5:3b9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Mon, 3
 Nov 2025 07:54:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 07:54:08 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 2 Nov
 2025 23:54:00 -0800
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Mon, 3 Nov 2025 15:51:05 +0800
Subject: [PATCH 2/5] drm/amdgpu: add helper to read UMA carveout info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251103-vram-carveout-tuning-for-upstream-v1-2-17e2a72639c5@amd.com>
References: <20251103-vram-carveout-tuning-for-upstream-v1-0-17e2a72639c5@amd.com>
In-Reply-To: <20251103-vram-carveout-tuning-for-upstream-v1-0-17e2a72639c5@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Yo-Jung Leo Lin
 (AMD)" <Leo.Lin@amd.com>, <anson.tsao@amd.com>, <superm1@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7312; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=6UdGsQIlECHxX7f7krA0ZU/+dNVNkZTX7+jP417nVWI=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpCF8LQ8D0iMJ0EjNZc/aSujuyQxlNoeJyt4z82
 FnOysO7gtuJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaQhfCwAKCRBfF7GWSinu
 huq+D/9qAkNj1pz3nVUBb/F1XESDL8VvYlBSPKyJU5B+YvhzB96R5tFVhYYcMeBiZoRf4TqOS2u
 YuUyxNHdr+GZs87mi9uNlOKccmNfiIfbXp0l9vk5Ci9+HJwwI+EJ0Wao7qaI7xyKyVKcZDqgiVG
 BsOgJFvVNn596V8+plBx8sQ9ag9nF9MCgU5MmZmtNfr4uVb3PXiw+6f5LfPJh+lCB9p3eDgari1
 P6wc0+wRFXBPSTKPM1tjnpUc6fQx2eFhKjbe8MnYs36eDW7L7fK+2dYgPg/oXDJvAkFwhgZceBw
 ArVmUc2y0BZJD99gft4xVHFexvcbbxKFfX7oX9sRHc8sMg5TG0xyIGzUuoR2E2LYPZhS7JVnSJt
 P5W+InbDhr96dMp1q1qQ6THxIFd4zmN8zWb30GZ5YUHClbyKVqV8Kt6w57jS8iFu4AbQWC4w0T/
 c8+N7tmPQPO4aNhjCt3G/dmpQocfmnF2171HBTeuTZBvGXwV9lzHlm/ovv50Dbj5j/pq01w2ZzF
 w4Y+eADU1qSB9D4rDJaRd1CfW0HeZXmH+DFKGv+tEkS0igX/qd79y0x3ZxXWS9SAa4SSiLxAsAb
 M0om/3+n4YEWdiuKel0jixE2QoIsOvkq8SiziKwhvWCD27Pn3zJBjvfzQh/DThIPsmgZ0Gndebs
 lrLclyIa3S33BHA==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|DS0PR12MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: 439c37af-f27c-403a-fca4-08de1aae2b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T203T29yVFl4bVlIdDBXaVhYb0lETHZkTmRGcEs0K1NqUkh5Y1NHOG1JL1Ey?=
 =?utf-8?B?dlo4VlZnWGNOSjNicHVtcXUrYWEzU3MvcUU4dXZuWU1XSENoNTRqN1JOQVA1?=
 =?utf-8?B?NG1VNWV6Rlk5NkZLSjlpaTlqb00yOHJ1R3RBZEl2aWd4OFk1dk5KcUUzOTJz?=
 =?utf-8?B?L0ptTW42MzJkQ2p0WlAzWnFlWjhKeGZYNzVySGt5TjIwZ21Tb1ZUWUIxNUNy?=
 =?utf-8?B?TG9pU2tCZlBYT0x1ekpqY1N2SDA2NHBGTlorckhSR0U2YVJOQ01uYmZZNS95?=
 =?utf-8?B?Q0VUN1dock5vUzhqblBDTExRZnkwandXRXJWMnlvVXhzM0pEc2Nicldwb2o5?=
 =?utf-8?B?VDhRanlabTVjR1phS2hhV1FoYjZBMGdtQU1idGx0T3BJS0lpSENjLzVFSG54?=
 =?utf-8?B?WUFySzNzaXdkYXdpTUw3TmZPOUdSaG1QRDg5ZVNpdm40V0s2WkNCZDFndWZH?=
 =?utf-8?B?UGVTTUVaTkhLNTN0b1ExVE44UlBXbE1PWURZdEZ0WW16RFk2VEszOVYrRE1P?=
 =?utf-8?B?aEVRT0tPaThyVTdSamZmZk81YWVrWXVwVWhnQVM2Q3RpY2NhTDdtNzkycUsy?=
 =?utf-8?B?b0E2T0dUWUFPTWZra3F5aktCSnE0RzBRYUF3dGI1eWpjL1o5ZzgwYVdhbXBC?=
 =?utf-8?B?YUdYSWQxYjhublpkRHg1N2FPQlMreEkwNm55amVkMHBYdUxHUGc0d01KYzFm?=
 =?utf-8?B?dGYvS3hiWFVzbU1XUEc2aysvejc1Q2t4ZzhCd2tkU0VQTUF6OU9MUlRNZjRZ?=
 =?utf-8?B?Z2EydmZBeHlPdnNCZDZWaVowNjJNb3htc0ZWVW42SlFXVWZyZmhNeUNNMk4v?=
 =?utf-8?B?cFB0M0RoemduVTdUUDdMMGw5em5NOVlUWGZSa0ZocTJCci91OXhkTURTZjZz?=
 =?utf-8?B?TTN6WllFVlZPdWFESGdaYmRYR09Ua3d4K1hEM2RjaVUzK2dTWTFTYkhaYU5i?=
 =?utf-8?B?aUtXV3NMVy9qK2hsaDBkcURKYmFDTmNvYnR5dUhDT01tcmVqWmRlY3VVYVJt?=
 =?utf-8?B?UFp2d2NjQnpoQzN2MHo2S2QzZU5KYlh6YmMvUVppTm5QK2tRZWhBOVloTXZH?=
 =?utf-8?B?emRPd3JKM290MUladVprSDJLQWtmTnR1Y2RtL0htT2sxOGdVUXp0QjRDV0tC?=
 =?utf-8?B?ODdDU0xQV3p0RVRqRExjWERkdW4xV0tSSHBzSXJhNlYyZUtMcWl3WFZjVStS?=
 =?utf-8?B?dncrMUdlK25ZQlp1Qy9kQmhPVzB5NlN6cklIYkpsTnZYdWRhc1FIT2MwWmpl?=
 =?utf-8?B?Z0dQU2V6cm80QjFNQWEyZkdrajBPRmpjT21oZ2dZcmxSV3lMVVVFV1dZNGV2?=
 =?utf-8?B?T1FqNE5aMWtEWkRwek9Ba0RrVlNtZStYZW4wMnVGbjZQZXEybFNVVWRrYkZM?=
 =?utf-8?B?c0xLYzNseDlFLzdVNzFJWmlUSXNBdk8xMjlnRTFhTGtNT09leWZkUHVrWDR0?=
 =?utf-8?B?NlNQd2VMTUo3V0xPRXZwM09JSTJHUUd6U3dwNWZxdFYrV2d2SmtlK1hnaUtN?=
 =?utf-8?B?WjFVclA0OFJ5VmZTeVphMTdXbGNIRGNSQVp1NTB5Nys0SHRMUXV3MEhqVGRn?=
 =?utf-8?B?Z29na0ZFTTgwTjNEZW5JK2c0NUJxcFNyZjdyTm9NQnBIOUo2VmNTSGFvNjFl?=
 =?utf-8?B?UDlwbGJhai9hNE1DL2F4Z1RlaVAxU1FDVHVNbEZCTlM0MHVFT0JtZk4vVEpP?=
 =?utf-8?B?YlF0ZkM3QXlMWnRqNlBTcHBGVHJWaklnaXVNYUxZcjQ5R0RkbjdQREVMVlhD?=
 =?utf-8?B?RCtvWGNRMlc3eUxucm94c0VJaE9pVjlDc09LcWE5UnFLcndHZlV0bjY2MmlD?=
 =?utf-8?B?ZE53b0dEa1B2OEZiaUtVSWVWcVE5MitNN1pSUG4xcFJYK0gzNzlHOEYzSUtt?=
 =?utf-8?B?aHRDeW5xN01JeUJuL1ZYWTlwMStZZWxVbEVHbUhRdlV4UG5JeTBOMEMrYisy?=
 =?utf-8?B?SkhUcG1seHBYS1dkUGJEcmY1L0ROYUppVTB3ODBROU5KVXFRUUswNG1yNDNh?=
 =?utf-8?B?SWhWL2hqZVNMeUV5dVQzR3dYT2ZoUGxxNzF0ditRQjVpU1l5dVV5ekQxZnRR?=
 =?utf-8?B?Q1JoVWxZQjJKT3BMZzdIRmwxUlE3am12NnNoY3pjMzhJeGtJUlJEK1l5TVNx?=
 =?utf-8?Q?pLbA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:54:08.4042 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 439c37af-f27c-403a-fca4-08de1aae2b36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6440
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

Currently, the available UMA allocation configs in the integrated system
information table have not been parsed. Add a helper function to retrieve
and store these configs.

Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c     | 32 ++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c | 75 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h |  1 +
 drivers/gpu/drm/amd/amdgpu/atom.h                |  4 ++
 4 files changed, 107 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index 763f2b8dcf13..58cc3bc9d42d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -28,6 +28,7 @@
 #include "amdgpu.h"
 #include "amdgpu_atombios.h"
 #include "amdgpu_atomfirmware.h"
+#include "atomfirmware.h"
 #include "amdgpu_i2c.h"
 #include "amdgpu_display.h"
 
@@ -1877,6 +1878,10 @@ void amdgpu_atombios_fini(struct amdgpu_device *adev)
 	if (adev->mode_info.atom_context) {
 		kfree(adev->mode_info.atom_context->scratch);
 		kfree(adev->mode_info.atom_context->iio);
+		kfree(adev->mode_info.atom_context->uma_carveout_options);
+		adev->mode_info.atom_context->uma_carveout_options = NULL;
+		adev->mode_info.atom_context->uma_carveout_nr = 0;
+		adev->mode_info.atom_context->uma_carveout_index = 0;
 	}
 	kfree(adev->mode_info.atom_context);
 	adev->mode_info.atom_context = NULL;
@@ -1891,16 +1896,19 @@ void amdgpu_atombios_fini(struct amdgpu_device *adev)
  *
  * Initializes the driver info and register access callbacks for the
  * ATOM interpreter (r4xx+).
- * Returns 0 on sucess, -ENOMEM on failure.
+ * Returns 0 on success, -ENOMEM on memory allocation error, or -EINVAL on ATOM ROM parsing error
  * Called at driver startup.
  */
 int amdgpu_atombios_init(struct amdgpu_device *adev)
 {
 	struct card_info *atom_card_info =
 	    kzalloc(sizeof(struct card_info), GFP_KERNEL);
+	int rc;
 
-	if (!atom_card_info)
-		return -ENOMEM;
+	if (!atom_card_info) {
+		rc = -ENOMEM;
+		goto out_card_info;
+	}
 
 	adev->mode_info.atom_card_info = atom_card_info;
 	atom_card_info->dev = adev_to_drm(adev);
@@ -1913,8 +1921,16 @@ int amdgpu_atombios_init(struct amdgpu_device *adev)
 
 	adev->mode_info.atom_context = amdgpu_atom_parse(atom_card_info, adev->bios);
 	if (!adev->mode_info.atom_context) {
-		amdgpu_atombios_fini(adev);
-		return -ENOMEM;
+		rc = -ENOMEM;
+		goto out_atom_ctx;
+	}
+
+	rc = amdgpu_atomfirmware_get_uma_carveout_info(adev);
+
+	if (rc) {
+		drm_dbg(adev_to_drm(adev), "Failed to get UMA carveout info: %d\n", rc);
+		if (rc != -ENODEV)
+			goto out_uma_info;
 	}
 
 	mutex_init(&adev->mode_info.atom_context->mutex);
@@ -1930,6 +1946,12 @@ int amdgpu_atombios_init(struct amdgpu_device *adev)
 	}
 
 	return 0;
+
+out_uma_info:
+out_atom_ctx:
+	amdgpu_atombios_fini(adev);
+out_card_info:
+	return rc;
 }
 
 int amdgpu_atombios_get_data_table(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
index 636385c80f64..698416e84f1f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
@@ -21,12 +21,14 @@
  *
  */
 
+#include "linux/slab.h"
 #include <drm/amdgpu_drm.h>
 #include "amdgpu.h"
 #include "atomfirmware.h"
 #include "amdgpu_atomfirmware.h"
 #include "atom.h"
 #include "atombios.h"
+#include "atomfirmware.h"
 #include "soc15_hw_ip.h"
 
 union firmware_info {
@@ -296,6 +298,79 @@ static int convert_atom_mem_type_to_vram_type(struct amdgpu_device *adev,
 	return vram_type;
 }
 
+static int __amdgpu_atomfirmware_get_uma_carveout_info_v2_3(struct amdgpu_device *adev,
+							    union igp_info *igp_info)
+{
+	struct atom_context *ctx = adev->mode_info.atom_context;
+	struct uma_carveout_option *opts;
+
+	opts = kzalloc(sizeof(igp_info->v23.UMASizeControlOption), GFP_KERNEL);
+
+	if (!opts)
+		goto out_mem;
+
+	memcpy(opts, igp_info->v23.UMASizeControlOption,
+		sizeof(igp_info->v23.UMASizeControlOption));
+
+	ctx->uma_carveout_index = igp_info->v23.UMACarveoutIndex;
+	ctx->uma_carveout_nr = igp_info->v23.UMACarveoutIndexMax;
+	ctx->uma_carveout_options = opts;
+
+	return 0;
+
+out_mem:
+	return -ENOMEM;
+}
+
+static int __amdgpu_atomfirmware_get_uma_carveout_info(struct amdgpu_device *adev,
+						       u8 frev, u8 crev,
+						       union igp_info *igp_info)
+{
+	switch (frev) {
+	case 2:
+		switch (crev) {
+		case 3:
+			return __amdgpu_atomfirmware_get_uma_carveout_info_v2_3(adev, igp_info);
+		break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return -ENODEV;
+}
+
+int amdgpu_atomfirmware_get_uma_carveout_info(struct amdgpu_device *adev)
+{
+	struct amdgpu_mode_info *mode_info = &adev->mode_info;
+	union igp_info *igp_info;
+	u16 data_offset, size;
+	u8 frev, crev;
+	int index;
+
+	if (!(adev->flags & AMD_IS_APU))
+		return -ENODEV;
+
+	if (!amdgpu_acpi_is_set_uma_allocation_size_supported())
+		return -ENODEV;
+
+	index = get_index_into_master_table(atom_master_list_of_data_tables_v2_1,
+					    integratedsysteminfo);
+
+	if (!amdgpu_atom_parse_data_header(mode_info->atom_context,
+					  index, &size,
+					  &frev, &crev, &data_offset)) {
+		return -EINVAL;
+	}
+
+	igp_info = (union igp_info *)
+			(mode_info->atom_context->bios + data_offset);
+
+	return __amdgpu_atomfirmware_get_uma_carveout_info(adev, frev, crev, igp_info);
+}
+
 int
 amdgpu_atomfirmware_get_vram_info(struct amdgpu_device *adev,
 				  int *vram_width, int *vram_type,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
index 649b5530d8ae..fb3f34a36569 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
@@ -32,6 +32,7 @@ void amdgpu_atomfirmware_scratch_regs_init(struct amdgpu_device *adev);
 int amdgpu_atomfirmware_allocate_fb_scratch(struct amdgpu_device *adev);
 int amdgpu_atomfirmware_get_vram_info(struct amdgpu_device *adev,
 	int *vram_width, int *vram_type, int *vram_vendor);
+int amdgpu_atomfirmware_get_uma_carveout_info(struct amdgpu_device *adev);
 int amdgpu_atomfirmware_get_clock_info(struct amdgpu_device *adev);
 int amdgpu_atomfirmware_get_gfx_info(struct amdgpu_device *adev);
 bool amdgpu_atomfirmware_mem_ecc_supported(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/atom.h b/drivers/gpu/drm/amd/amdgpu/atom.h
index 825ff28731f5..f07c612f0386 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.h
+++ b/drivers/gpu/drm/amd/amdgpu/atom.h
@@ -153,6 +153,10 @@ struct atom_context {
 	uint8_t vbios_ver_str[STRLEN_NORMAL];
 	uint8_t date[STRLEN_NORMAL];
 	uint8_t build_num[STRLEN_NORMAL];
+
+	uint8_t uma_carveout_index;
+	uint8_t uma_carveout_nr;
+	struct uma_carveout_option *uma_carveout_options;
 };
 
 extern int amdgpu_atom_debug;

-- 
2.43.0


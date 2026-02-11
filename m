Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RbUDKvpZjGnelgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:29:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1DE12355B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4A310E36E;
	Wed, 11 Feb 2026 10:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TF5mTeUQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013002.outbound.protection.outlook.com
 [40.93.196.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4E810E36E;
 Wed, 11 Feb 2026 10:29:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqXRySTxwmzMwUzaPFNIQybYQKrFGJUa6Gjk2wJEG6k+4m14kdq0xyb4E+sKZbv0MutWJBdQD5Uv6LKj8At+hyBdS6YAEcT128xDIqcJsKc+BuUJDfHT5T/6bP6qvwKYRbKKVHc9oZA+qE7nDJ0j/UuAqv7Yl8QemmICOQXkFa/wdm8h06j3wNrtRFLq1x6wAs22PERkpr9kYbgybV8IXJPI4PdcPVRTZtb0fJZk0NZIgbFoKe0vUXNsqt/Y3TQhB9oS+ykV+wQzRwKk/hPtmX57uAkwqMYijiwQP+VosANWBqFA9L7duke27W+kQ60X68CcIXPFE/zDD560BJ05SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86/zL5TQwlM6/fi6q/tmYL2cP/B+r+SshKxlXw6z4sY=;
 b=ZhRJbYJb075BCP+lMTYzVAZC4SNGf9o/qBqFHVS09kjTCm7hDfHAUn0STZBGu1H+HTD9qinenS6KFvZRsqDgbleQtk8AfRJdGhS0j3F+jgSBmpimse4NN28Mtln3/+KLjtO9WtZ7WK01BjSdM0D3XRX/0+yEvuC3gRw1l5dTOHBm0tGMCnhx5FU0po1KutkT6RbRFSKPGYhG9VvZ7bWmN2NcVfYyo5YNEMUsDqASqLvHCK7s4Z5E8e9vZbfViA/u1qqeBZS4YgkXDUTQW9GYo9wsegCuqV6PXDNtWv/QAIz2AoEkdZCuOko/IH4pf9zXJQriCz4BkK8OZHId4CkmcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86/zL5TQwlM6/fi6q/tmYL2cP/B+r+SshKxlXw6z4sY=;
 b=TF5mTeUQDqacM8pSBk4edO44x25nbJi0MZ/YDgajkzWMhIXQDybcxNAudWyYE9/WjSH8VrS0oHXVDi8ZSC0ufLzjM5OpljSNo1yCBKbxVGGtKxe72yYo+QDAYAH4w507aSUwbyyw1Jsqm+sAANP9w4x7wi7ZiBf4biQauo4TDqg=
Received: from SA9PR13CA0002.namprd13.prod.outlook.com (2603:10b6:806:21::7)
 by CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 10:29:06 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:21:cafe::cf) by SA9PR13CA0002.outlook.office365.com
 (2603:10b6:806:21::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Wed,
 11 Feb 2026 10:29:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 10:29:06 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 11 Feb 2026 04:29:04 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 3/6] drm/amdgpu: save ring content before resetting the
 device
Date: Wed, 11 Feb 2026 11:26:50 +0100
Message-ID: <20260211102657.4180-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|CH3PR12MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a210e20-4162-4b0b-3129-08de69586296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MG1CgzJdYZmIOVN9FpC61X4LcO6ZXba+2DSx7L2VgF7r4GvKColwjFmBCWi2?=
 =?us-ascii?Q?Xgfq3hjYBKN/GWO0Z+OMxP2Xg3GISWeXroAdiiEwEQt4ODgMci8MZij8YG64?=
 =?us-ascii?Q?GeGu7fpWG8SzopsgPSZAEH0KK14ghTp2gCtBbMj7w+dldkNAv3Nt7otcQ4+B?=
 =?us-ascii?Q?sGC0oks5/BNnVxdqO8F1kPGWa/92JwGPYrjrptl5LhCMKhsswcONx9zzVuS7?=
 =?us-ascii?Q?OCS7Ej338TDIH+dNDxm5ydxQqr4ifJmcllE3kMyyBVnnU+e35ulJI4L1tGSD?=
 =?us-ascii?Q?JSaSHoQ/IarETFjC+pdXY0MGdmvWQnqe5Ow0IiY2FGZHyxmsqrKhj3nx46px?=
 =?us-ascii?Q?6jMbSWN9MF2g+FWHOWC/Xt2raLWkCsfueDsMtzdJj1sGvsZirfrR3/Y+wvZA?=
 =?us-ascii?Q?WZfgT83SFhq8Dl9F3Fvf5RTM45fPFhFaZg4rRwPRnYUtQYfGk1Tf4MmS6YdB?=
 =?us-ascii?Q?CjeW+BGHvB/y0JeHIuNyJuX1UOpKnO0IRyG49HY5UjbfZTIEgthWHJCwNqkh?=
 =?us-ascii?Q?Lw1gRnAVuTo51agHuC/p8YiOY4Qy8s0HXR4hV6u7VbZ32DWuOUAh4vaLuGrF?=
 =?us-ascii?Q?lvkcz3h/rnB0A1WFj4N/DKWMF4lV+Bwz+21kw8G8u3oojIKcF/V+vXhBVSrb?=
 =?us-ascii?Q?nJcLgJmcgD5+2LPzbQ9k5/fJjaobV85fdDSNHNq2O5kVtV6g1D2gVCgebiuP?=
 =?us-ascii?Q?5zyxUNWpgcAOHMR0/xz53oDcUBGq4xNj4n+hooknZbn7Ji0mKkDmvLfe7H7k?=
 =?us-ascii?Q?gS9FFvuZnZsoBXdsvNGOpheR3C5p7YIVTVXP62AvR3JIqQ8wDtq4HyKcSCV9?=
 =?us-ascii?Q?h4A4pRUuIhuomPijR63h/4Dmgi8W3w8hXwVqOZm3ajL6xprHq8viu/wdbGzr?=
 =?us-ascii?Q?JsOgWbFysinLj/lvzjFo78fva3gR0RePc6dIuWBgVtaNbAloEhc9sze8od57?=
 =?us-ascii?Q?ZwqgQH4WNBsQ4CShwFYZO/PbxOKwTEmYPWU1aoTOS+c/S1RgJsl7dOZ8PXgS?=
 =?us-ascii?Q?M9tVV0EOnfGTaLizjK3Vs8zzACsjfid7Vt1kNIN4RXJXRT+GpBJrXJ9dGNQb?=
 =?us-ascii?Q?A7ra+9afDzvkODZgxgkX87I7xrrbVkIF1zhEyhM/AZR9kAXjRMDJzgVLHbFL?=
 =?us-ascii?Q?coLS50yiqVxaloGQoIYgg0/k0EJyvI2TsQ7JqB1QGcD/5fWiYtVy3jx0xgVE?=
 =?us-ascii?Q?Yk1ORM78gx7ETNpyPFOfeX4UfruwqsSaxqd8XvDcoJMWD64yHeE7PkvFMCIY?=
 =?us-ascii?Q?z6tcl2MP7XyfoK9+V3ktiZEQ34j/DgImC0WXvOHHD0LvSViHCym4yAd2xujM?=
 =?us-ascii?Q?8rnyhrf0SEKmjOWUh8H6liK3Y1z5q1oRIjeHijrcVP7w26knc2h38SgdjMcw?=
 =?us-ascii?Q?a2D6i3gp93XK0q+OWpQEpwxBifDxJuVMxwwLMifrwyutJA3JJuZ+w0wyAk8c?=
 =?us-ascii?Q?liH1C/iJ1UJLTn8lLb3ReEj2SCSNFAdkS/fjfeZakMc22WuEo4lkum/5v5nz?=
 =?us-ascii?Q?v/qh/UEmBAbz8VOeXIxNxg+I9YU31IK/4fAiXDxDDR9dFjORIwsNr1sMCjul?=
 =?us-ascii?Q?PaUpSNlzy5N6ePoUQJU9MBodaUKzh0oyDRS6TglX5snsHqbFgNZxsKGWkc0u?=
 =?us-ascii?Q?+UIKR0W0KoaK9txVPnX7gjak8mU3mu2GnSQVWP+UOX9hJYwQmNJJOFq9AjQK?=
 =?us-ascii?Q?FlIJnQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dNec984NgEv0EyQn37x5awmX4TFOQlb/qjenHGcA7s8u8zjKwlaV+WsHthpMA6rxoOmNDhoyOLelV1WRZ9tjHpiWSr2YVvJ3d8W9efVcmPMGyKVDByAJ+qCwtTD8+lRTGFwi2u1ZAnB+Y9uMXkI55p2ZxormPErxwpSDCO+jtFVn969rvao9uekH3fspSFfbf0XH690Dw8mjG4GeI+meOD4uFeP6CByJUJM0taNWTMVrURgV0ikLfuRRUaIwb8b+4jKJJxM8LZJphYNs8Xq0mhepxmPsq3te13fO/XeH4PVMOsWyyn246PadVMzZ+YrFpp6Q8o+KNALpQES6uApWeJgsSWf7AymqaeuEJsMsFHzj7bOxXnyfXr77pbXFMaGwp8xPFV1+85Xy/nGP0qvi4K0mVMyuV4MKBL51vKyEYkSl1KTm0H6d+NtQLThM+h0Z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:29:06.4593 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a210e20-4162-4b0b-3129-08de69586296
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EF1DE12355B
X-Rspamd-Action: no action

Otherwise the content might not be relevant.

When a coredump is generated the rings with outstanding fences
are saved and then printed to the final devcoredump from the
worker thread.
Since this requires memory allocation, the ring capture might
be missing from the generated devcoredump.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 85 +++++++++++++++----
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h  | 13 ++-
 2 files changed, 81 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 0808ca98ccd9..0bf85ab43204 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -204,7 +204,9 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 	struct drm_print_iterator iter;
 	struct amdgpu_vm_fault_info *fault_info;
 	struct amdgpu_ip_block *ip_block;
-	int ver;
+	struct amdgpu_ring *ring;
+	int ver, i, j;
+	u32 ring_idx, off;
 
 	iter.data = buffer;
 	iter.offset = 0;
@@ -294,23 +296,25 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 
 	/* Add ring buffer information */
 	drm_printf(&p, "Ring buffer information\n");
-	for (int i = 0; i < coredump->adev->num_rings; i++) {
-		int j = 0;
-		struct amdgpu_ring *ring = coredump->adev->rings[i];
+	if (coredump->num_rings) {
+		for (i = 0; i < coredump->num_rings; i++) {
+			ring_idx = coredump->rings[i].ring_index;
+			ring = coredump->adev->rings[ring_idx];
+			off = coredump->rings[i].offset;
 
-		drm_printf(&p, "ring name: %s\n", ring->name);
-		drm_printf(&p, "Rptr: 0x%llx Wptr: 0x%llx RB mask: %x\n",
-			   amdgpu_ring_get_rptr(ring),
-			   amdgpu_ring_get_wptr(ring),
-			   ring->buf_mask);
-		drm_printf(&p, "Ring size in dwords: %d\n",
-			   ring->ring_size / 4);
-		drm_printf(&p, "Ring contents\n");
-		drm_printf(&p, "Offset \t Value\n");
+			drm_printf(&p, "ring name: %s\n", ring->name);
+			drm_printf(&p, "Rptr: 0x%llx Wptr: 0x%llx RB mask: %x\n",
+				   coredump->rings[i].rptr,
+				   coredump->rings[i].wptr,
+				   ring->buf_mask);
+			drm_printf(&p, "Ring size in dwords: %d\n",
+				ring->ring_size / 4);
+			drm_printf(&p, "Ring contents\n");
+			drm_printf(&p, "Offset \t Value\n");
 
-		while (j < ring->ring_size) {
-			drm_printf(&p, "0x%x \t 0x%x\n", j, ring->ring[j / 4]);
-			j += 4;
+			for (j = 0; j < ring->ring_size; j += 4)
+				drm_printf(&p, "0x%x \t 0x%x\n", j,
+					   coredump->rings_dw[off + j / 4]);
 		}
 	}
 
@@ -354,6 +358,8 @@ static void amdgpu_devcoredump_free(void *data)
 	cancel_work_sync(&coredump->work);
 	coredump->adev->coredump_in_progress = false;
 	kfree(coredump->formatted);
+	kfree(coredump->rings);
+	kfree(coredump->rings_dw);
 	kfree(data);
 }
 
@@ -382,6 +388,12 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 	struct drm_device *dev = adev_to_drm(adev);
 	struct amdgpu_coredump_info *coredump;
 	struct drm_sched_job *s_job;
+	u64 total_ring_size, ring_count;
+	struct amdgpu_ring *ring;
+	int i, off, idx;
+
+	if (adev->coredump_in_progress)
+		return;
 
 	if (adev->coredump_in_progress)
 		return;
@@ -410,6 +422,47 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 		coredump->ring = to_amdgpu_ring(s_job->sched);
 	}
 
+	/* Dump ring content if memory allocation succeeds. */
+	ring_count = 0;
+	total_ring_size = 0;
+	for (i = 0; i < adev->num_rings; i++) {
+		ring = adev->rings[i];
+
+		/* Only dump rings with unsignalled fences. */
+		if (atomic_read(&ring->fence_drv.last_seq) == ring->fence_drv.sync_seq &&
+		    coredump->ring != ring)
+			continue;
+
+		total_ring_size += ring->ring_size;
+		ring_count++;
+	}
+	coredump->rings_dw = kzalloc(total_ring_size, GFP_NOWAIT);
+	coredump->rings = kcalloc(ring_count, sizeof(struct amdgpu_coredump_ring), GFP_NOWAIT);
+	if (coredump->rings && coredump->rings_dw) {
+		for (i = 0, off = 0, idx = 0; i < adev->num_rings; i++) {
+			ring = adev->rings[i];
+
+			if (atomic_read(&ring->fence_drv.last_seq) == ring->fence_drv.sync_seq &&
+			    coredump->ring != ring)
+				continue;
+
+			coredump->rings[idx].ring_index = ring->idx;
+			coredump->rings[idx].rptr = amdgpu_ring_get_rptr(ring);
+			coredump->rings[idx].wptr = amdgpu_ring_get_wptr(ring);
+			coredump->rings[idx].offset = off;
+
+			memcpy(&coredump->rings_dw[off], ring->ring, ring->ring_size);
+			off += ring->ring_size;
+			idx++;
+		}
+		coredump->num_rings = idx;
+	} else {
+		kfree(coredump->rings_dw);
+		kfree(coredump->rings);
+		coredump->rings_dw = NULL;
+		coredump->rings = NULL;
+	}
+
 	coredump->adev = adev;
 
 	ktime_get_ts64(&coredump->reset_time);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
index 4c37a852b74a..1c3d22356cc7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
@@ -31,6 +31,13 @@
 
 #define AMDGPU_COREDUMP_VERSION "1"
 
+struct amdgpu_coredump_ring {
+	u64				rptr;
+	u64				wptr;
+	u32				ring_index;
+	u32				offset;
+};
+
 struct amdgpu_coredump_info {
 	struct amdgpu_device            *adev;
 	struct amdgpu_task_info         reset_task_info;
@@ -41,12 +48,16 @@ struct amdgpu_coredump_info {
 	bool                            skip_vram_check;
 	bool                            reset_vram_lost;
 	struct amdgpu_ring              *ring;
+
+	struct amdgpu_coredump_ring	*rings;
+	u32				*rings_dw;
+	u32				num_rings;
+
 	/* Readable form of coredevdump, generate once to speed up
 	 * reading it (see drm_coredump_printer's documentation).
 	 */
 	ssize_t				formatted_size;
 	char				*formatted;
-
 };
 #endif
 
-- 
2.43.0


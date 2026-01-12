Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A351D12579
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A8E10E3AB;
	Mon, 12 Jan 2026 11:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R0y7hwsK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010045.outbound.protection.outlook.com
 [40.93.198.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA2F10E39F;
 Mon, 12 Jan 2026 11:40:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFHC467iXEw9rPCxVnY4UB+MfCPC++F1XKeXRZfwTv65nM6nPzqNkta6kiQL1UHh9RlsFqi7f8YBrklPkOksVHSPArI7Joc3liVCefng1te1T39NDi69UTHypAmFn4lpQeS4Jm8s5gJWdiiVyuLjNpMEXJlh7AsImTnKRlzuyHkmDfSeIzm9BWAZiwNftzcyRpbXRt6H9I5bBJTPAIssciNVrVv2QoI3VsrHL1FUcWOWyC/kY0ta1u+j5iDr0soOhKG2WVxQy7G+4FRsbfsGNE9Xf1EoyOjYQlu3suw1+WZyhonvKIiqgHHZJB4yOzGrQTxBJoNQsj/5BNKQfpejkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6a0CVgZCkSVQg8Gk7DxEwGxV/NQ0c9gcxWFpY/P/IBc=;
 b=gq+208zPmDk64rBXIcgsIiTnqL1Tg2TGs3DJN38JF60RZkEqQjUWt9ZrlnG1/D/IBnKLfVg/Hg1X5CxMT8SjT41TZkMc70KZ4BJQ1mlhMmShPPdQoE4ONBPOeb7E1CtajLuplRp6IySVGb8ZwpLTArzojkEIMNb3vt2m/Q6M692lrkvK6VaojfOrZxuiBVLd9D+MfhEM61TJEOWwa9pTw1fexR1qgaEwgL0EmqIwLMgV8sV5y3JhBiX3aajFtIWyMjyXBrjiB0g3tNwXOYTsGYMASMW7Oc/leUCz3h+9SVvysZ5/pZgXSTFViyziU06x4NAnL8GUD5Mq+EBv5UYHAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6a0CVgZCkSVQg8Gk7DxEwGxV/NQ0c9gcxWFpY/P/IBc=;
 b=R0y7hwsKB49dh+Kb9H9R1YV/wGqxZ/ilHkTUxEOoMJQySywHgeOXfbFBJoY6P+lKpyuD+aC7EE30ao09sY4ehDvnQkMzWFYZkouyj2ISAPFrxcN2fIziy8mQsdwa175idsFLvEba67dwDTXB8En326oaD4OE3nTnUXoRpbzJy7M=
Received: from BL0PR02CA0077.namprd02.prod.outlook.com (2603:10b6:208:51::18)
 by SN7PR12MB7155.namprd12.prod.outlook.com (2603:10b6:806:2a6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 11:40:45 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:51:cafe::bb) by BL0PR02CA0077.outlook.office365.com
 (2603:10b6:208:51::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 11:40:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 11:40:45 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 12 Jan
 2026 05:40:41 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <matthew.auld@intel.com>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v2] MAINTAINERS: drm: add maintainers for DRM buddy allocator
Date: Mon, 12 Jan 2026 17:10:22 +0530
Message-ID: <20260112114022.315139-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|SN7PR12MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f66efb-b6b0-4497-8936-08de51cf6c58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDVrajFtdG1xWmhJRzZMeTJ6UHJkY0h4NWRlNnc5blhVMXBoSDJPR2EzNldy?=
 =?utf-8?B?VkRnRFVqdjlqZ1dQRjNBck81YXZ6blRhRzNYV0tYNno4dk9la3YycTFOeXZH?=
 =?utf-8?B?MUF6VUQ2SzNmR0tPbFFhTTRyV0VHNUp5TkxUYVhQSGFkenN3RlJsZkJBQmFo?=
 =?utf-8?B?Z1BwZ05QS3lXdkhTN0xLTHNrb0VzUjE5SXMxay9TdCtaY21HUUZGVStWb0d4?=
 =?utf-8?B?bjc3RWRETm4vdTNOUDlSRUQvYW04K1pLVUJvOTdCOWQ1OUkxMlB0dzhSVmFB?=
 =?utf-8?B?M3VzOWZFajU1Z0QxY3NpNmlqUVYySmJpMkVmQXhiQ2c0ZUIvbUNKQmxBNzIw?=
 =?utf-8?B?ZnZJTHNlZTZPMHFTNWpRMUtvTWVMUFQrejR1dlE5eTQvcjBpSlFDbEIzcmd6?=
 =?utf-8?B?R0VIYzJZdGNGYzdyeTBnQzN5aElySmVOMDNERW9QWGZRa2d2Uk9IOHNuRito?=
 =?utf-8?B?R05sUEZ6aWw0Mk1aRkFmQkluNkRGaXBCWURuWWRkOGkrVzlFdjJaZDdGOW9T?=
 =?utf-8?B?Lytra2E1dVFVbWphYi9TcjVzcUQwUXlOY3Z1ejdnajFYdVhtL1lFM20xU2p3?=
 =?utf-8?B?dmNNc29qaUI2dTAzRW5rQjBTNnRuRjc5VWVBbG5leFBWOEpmMzBpSXBXMzN4?=
 =?utf-8?B?bjh1OE5xVm92eUt2Zzk2TC9JeTBLOXZ2OHA4NVdPU3pKZ0w3dmdRUHM0QXU2?=
 =?utf-8?B?VTRKNURsVXJsUXpPL0JqSXRRRmh5SjRiWjJtOUpWQ1gyVVFwNWhtbXljV2dN?=
 =?utf-8?B?UGY3bjVqc3E5V1dhT0dzc3YvNDZjazJReGo4R2pGR2dBZjZpYTZCVlVMeFZt?=
 =?utf-8?B?UDNFcEdPUkNRS3ZTd3FtZTdOd2Nac2ZvOGZwZGRUK0YxL2U0Z01UY1dHckRw?=
 =?utf-8?B?bk00OWh3UHM5eURtTm42Szdzb3NaVThWYUk2N2diZjROdEpROGNJTlZpWGhW?=
 =?utf-8?B?WUEyeTcwcGdOVDV3RW5FZUZ3NDhhSHg1THA5bGRaM2VDMThvMlBmb3FwYTJD?=
 =?utf-8?B?VDg4UmRWSDJvcVllZVYrSVhHQ3owc2lqVlRRdFEwc1FtaWlDcnJvVmhUalkx?=
 =?utf-8?B?enNqdkZWcTJEcXg0MkZRYld4bW1FNEk5LzhBOUgvZTh1Tm1hNnZKMVQwMFh4?=
 =?utf-8?B?YVNWbGdidCt5QVNwN2N4cGE1SS9pNTFMSjJWeS9WQmtQZE5RYlhrTUdVYTk3?=
 =?utf-8?B?TXRRQ214WE15NXVHWkJGL2lRNDkrc2RkcjJhQVFBNUhDUWZxUWxDVFJWempF?=
 =?utf-8?B?enNVdHVDV0xPZnBiOFBFbmFJR3FzR2FzMUFka1d1NU9UVEx6aFNBZzRwMmdt?=
 =?utf-8?B?cTF4c0lpQmZxcTNJZWhiNFFQL0drTlo0Z0pRTW00R1pKRmNWaXNJeFYvMlVl?=
 =?utf-8?B?TmlDNWZyc3FVcFIrdmJITGQ4Nm4xQ1VsTlVtK0FUYUhPYjVNSGh1THJmZE1k?=
 =?utf-8?B?ODVPMWx6blhrZEo5c1pRVTIxb1hiWXpxeTR6VEhJYU8vQUVtZzJ0ZXY2UlBT?=
 =?utf-8?B?cVFlNXI2aHVIR1FxN2pWQ1hPaElGSm9FYVVYQnd2bDNpQUt5Uk9lKzkreVd5?=
 =?utf-8?B?Mms4NUtvclZndFNCclI4c0k5SkNORXZsd2NFWHptaW1naS9WNUNDRFNpMlgw?=
 =?utf-8?B?S1FnWTByNU9ZbUlQTTluQUN4SnRudS81VXVUbS9LYzkxYUFyT1VWQlA4ZEFX?=
 =?utf-8?B?aWVuRCtKSzUxZmJuSlZQRzNKMFdLR2ZDL2lscHJXRzVza1ZVdHdzc05qRk53?=
 =?utf-8?B?a1YzbExpaVVNdm4rb0lYcTA2S1F5WFludElNVUFaNUZHTE1qajRhWUU0dlR4?=
 =?utf-8?B?VnFDOXRYaEdyV0pGU2kwNG96ZW9SbFYxT1VncUw0VkhqdUJENXE3NjVLc21o?=
 =?utf-8?B?T1V2eXdQdEhDLzljdEZFWGZyVDFra3QvRXplNW1Lb1dRT1VMQzQ2NFduSVha?=
 =?utf-8?B?ZE90SHJVS0JVVll1anV5VTQ4bzgvQjVoYU1BcVMzZkdUanNBM2Z1V1NqNFB6?=
 =?utf-8?B?ZjljVlh0VGJsU3ptOHVKeTY2Y1k0VXlnNmNVUjQ2dkV4QjJIdkE4YU13V0Fk?=
 =?utf-8?Q?peSlrV?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 11:40:45.0569 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f66efb-b6b0-4497-8936-08de51cf6c58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7155
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

The DRM buddy allocator is a shared DRM memory management
component used by multiple DRM drivers.

Matthew Auld and Arun Pravin have been actively involved in
maintaining this code, including patch review and functional
changes.

Add a dedicated MAINTAINERS entry to reflect the current
maintainership.

v2: Include drivers/gpu/drm/tests/drm_buddy_test.c file (Matthew).

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Acked-by: Matthew Auld <matthew.auld@intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6169bd4d7bac..3b84ad595e22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8780,6 +8780,17 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/ttm/
 F:	include/drm/ttm/
 
+DRM BUDDY ALLOCATOR
+M:	Matthew Auld <matthew.auld@intel.com>
+M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
+R:	Christian Koenig <christian.koenig@amd.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/drm_buddy.c
+F:	drivers/gpu/drm/tests/drm_buddy_test.c
+F:	include/drm/drm_buddy.h
+
 DRM AUTOMATED TESTING
 M:	Helen Koike <helen.fornazier@gmail.com>
 M:	Vignesh Raman <vignesh.raman@collabora.com>
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 593E635FF86
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B086E9B5;
	Thu, 15 Apr 2021 01:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680047.outbound.protection.outlook.com [40.107.68.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74756E9BD;
 Thu, 15 Apr 2021 01:24:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JeXs8aFMmXZ5b2ZezLJVtNB50C7lF9YX7E/NGxDgkxgngMQIvhwQhf23XIhvPnxm4EozKj2ax3QEw8dyY4UfbFerNomWkDDMCUOSkEypOdxBkZ7ydKBZAQmxmUpcEigzi02PGBeyIiPnTy0GI9bNeDdIPAbjX4vB8JTAl1Nuu9dQs7HdszJA/GeO5dujoz8i1xKedTRHTAv2uVGtWZUl4+osYlbSSLfmqy3UnvcdUymJKzaO9C/ATpngIV8SoMgOOWvid5JpszxkGx3LY3/zcpsHeFj18p2tARIvzFCZbM3nV2X+bhDonQaVGz1n3D+uLBSuE/EZ1fYAjVK6h01Ejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/P4UzAd5fV3bYFCoPtupnGv93qLFyil+oXtDITRdeC0=;
 b=LJ/kqjZGmTWJkOD/Dy+QMT8YkVpw07C6ACIvLV6CRsfZroYV36k5U9w7x4nZOWQ5RBSdNSuVZPKW6/PhRpEo7QkzLykVBLgAnbnhDlovzOmSOKyiSL8KrwyZO1vZ2ky7jVY5CinPHBh7eC9vuyjJ8SusaaG362sfIWbLYn6nPWVQHCZXYyafxijDDX38vuRB1VVF94ApzD/1U95LC7Bq/rig9/CD0zLqDL5rq28AYeCVGUBeQUaUTHK0ZxiXHBkvxLH0xjji+AMDhGzWvt6lZ4B9QSMhVvEmvw8BUprNUFluGsEJKZ1NazbbTcx5OcXpIWOOr6ufg+hXimPEeMwHiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/P4UzAd5fV3bYFCoPtupnGv93qLFyil+oXtDITRdeC0=;
 b=utmhvbeesgVir7LsaLyR6NccKcDKnw8OKbjzVG6IembCvlrA3jdOJGl8dAXJuWUK7ZWPjTU350gcC7YiwSvt/JWtTY05aLOyC2QjAQh3QeWRR1WyX1KQBxCl+VeTx6ExOSkEaeBUvXAO/+QzO+N85qGYmzt3ZYbfIZzKgOtcEfc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4797.namprd12.prod.outlook.com (2603:10b6:208:a4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 15 Apr
 2021 01:24:40 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:40 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 33/34] drm/amdkfd: Add SVM API support capability bits
Date: Wed, 14 Apr 2021 21:23:36 -0400
Message-Id: <20210415012337.1755-34-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:24:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42c379e1-e3d5-49f5-4a08-08d8ffad2bde
X-MS-TrafficTypeDiagnostic: MN2PR12MB4797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB47973A0FFA183F11B87D8C65924D9@MN2PR12MB4797.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KgbxU0MSTlA2I16BHn1/O1x0fBjDo6cMOE+nUboMqwfWvhjouDpR1YbVhJ1OWhJPByiJUxEyIgWb7KLPdxD5T+5Vm0HqNa4STdOFpnI01pAAm5Ioot7h90Qj9/RK/y5YxXcCdb0bdK8FifnvE+/3T3d4nJQvKnV740ASweQako1HtjIfBueGSY1kIaZZFaWA+/2MLzREe0sfIP/pax1E1l3+jEaa8IcZc1unKC+FBm2WoF26wdUAqc5YjLUlUfCevYG1oMuBz5eyCi1pB6tQ9Drfn2QY8YMm/6ndTss81zo9vahQQBfJBp+bLtql7SKijftK9ZPSX6MzhJYvyh69eeQF0H5ZH4Sg/wPhcIasIx7gymyJf4RvTSrUoWsFfJk9Xo7u+AMpro3FmlyzWIkxlIjnnC2Hck+14FOk2rdMLGJBYuFkSnio1fFoTC5zbdd6fx0igEgJ1XGeTN8CMjnuvDaFjMN2BLPj1PByrGYzfks6qHEnkhnICTJCHnT77mL8X6/RVAZRZFVH1Y8bBvudfw0F9eyRuyP4BK3kO0eunm2q2TWtvMu2Ve74y3vn/DRBAStnJRFzMNhK30eZH4sEDpd591qL+ej1t3fvdKYFpWvdtocJZlSKdKTkUOWDmSRAMOKKywI2I/Gt70DFiYsP/N8Z7xi/LsrcVFFVe3y/jN0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(86362001)(66476007)(66946007)(2906002)(38350700002)(186003)(36756003)(16526019)(450100002)(38100700002)(5660300002)(83380400001)(66556008)(4326008)(52116002)(7696005)(478600001)(6486002)(8936002)(2616005)(8676002)(1076003)(6666004)(956004)(26005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8zfmNmX1BnhlNFK+3RIWmmBg7Xj6LRWOWM8jrENPfWw+I5J9vr2iqq39gGAO?=
 =?us-ascii?Q?9xPxXIaN/P5vx/KPtNZJZCfgL03MzcfXC7wT6YWadrx6TPhw+j3TF8UWiR0u?=
 =?us-ascii?Q?cnPkB3fdvfkq5GRi5JMl68Wc2obygOMYSZKyfvygKZsohuBrdPLeEFFukQ0X?=
 =?us-ascii?Q?ZrymYxV+b+xWuRzQP8xlHMKBdCeO56IZox7E7xTVRchIKm3QyJ3BPtujJW13?=
 =?us-ascii?Q?lc8/UgqFpUtC9fBQnhoLbsMlsnZRm68CeKA55maJawyPehljDFbEbMgD1pNG?=
 =?us-ascii?Q?9+MBj0gfDpZ3tgkZ4ubcQQyx/vFR/BdTtBQrAyAGch6bLZ3RrfdFOUXKzEAt?=
 =?us-ascii?Q?WKNlbCay6X1kdlwzqYDN3R6QpHjiOWFPEmtw1tn7nETOJjPcnj+1NyzyHikh?=
 =?us-ascii?Q?CNio1CPWZlN8YSMaMNtgSGSyFbMIZuYhzDyozwcD9qGbJtYh4aVTDtOIL/HN?=
 =?us-ascii?Q?rxyVelyG+7hS0QyaorIZ3qPD7kpCQ+FFC0B28UPC3/kBq1ry/idOs9uCpBPy?=
 =?us-ascii?Q?YtB01qfEVeK6jAgl89bqQBxAS6GyXWEFNHQy+Kl91p2TlD4BPrprml+LlzEh?=
 =?us-ascii?Q?QUCxpaRuLOz5tQcpYWDEAhYFxeY4obMZOAxMFumj9tfxglYuNNXz/r/cQIpN?=
 =?us-ascii?Q?tS1CHwEqu+xDE24RuTNgpYHKDUe0EWOhQDJJoXF+mOB9v/Nv3Nd/0wtHWPLd?=
 =?us-ascii?Q?HecRmhprbhjmaZ2GjgW0tZkPN3IisFg1EStN2yVrgVUGuiRSzafMUvPBOXok?=
 =?us-ascii?Q?jrgGcsw9H26/+LL8w0mHJ0eCTy55tnzOb+K/wGJgiFBLx8S4xoaCAPDfgoTQ?=
 =?us-ascii?Q?N7wIDXEI5WnNMcScEx9LQevIYkiO74r8E+tBlNGiLkKelD7X8kPfjrHD51UG?=
 =?us-ascii?Q?qkMbGLPFpU24AbnP7dm8XDqPU7B6Om6OGvBS8d96+evXjNveeV2+COIAPvLY?=
 =?us-ascii?Q?diCLFiN2NyM8b/JxtoxnmlnLmu8t+KH2rDY4yM8m+5WoEerxmf6FexA31vVW?=
 =?us-ascii?Q?4kQghz6h9VDL1ScFy2JRjc7fnUWB1Tq8CVomipgMsv9NedaKh1Qiq7/89IqF?=
 =?us-ascii?Q?FDAsQSflfjvAO9vntjWYKOzy+ygmgQpGhDCz3xs3AC6RVO+U/iQVUYjP6deX?=
 =?us-ascii?Q?wm5Ku7eN1cITz3MJXzC4GvRK0G8te5uIXb3HVMxmYS1v0ExOAZ9qDsq5jGG3?=
 =?us-ascii?Q?ygzQGLqApMsK5mNiHqfBa2fgpE7DkAwmukaPD6lm7uH+MAFTSLL9VlORuhV3?=
 =?us-ascii?Q?WLNEMlK/T1+kypkDaUttf2fhGu8nS/luRp9NsdObc7ZjNb7ObG5gqvfGfw5B?=
 =?us-ascii?Q?YqQsxZ6PYK3U4N7E5C9KYxHU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c379e1-e3d5-49f5-4a08-08d8ffad2bde
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:10.4981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8ycJS+ft4bQf5u0rYd52t8jYwqcwvW/Qs/uNueyNlsf4Yz4PmpnZrbLajaJz2gMHjoePryH8d7c347mskXiog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4797
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
Cc: Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

SVMAPISupported property added to HSA_CAPABILITY, the value match
HSA_CAPABILITY defined in Thunk spec:

SVMAPISupported: it will not be supported on older kernels that don't
have HMM or on systems with GFXv8 or older GPUs without support for
48-bit virtual addresses.

CoherentHostAccess property added to HSA_MEMORYPROPERTY, the value match
HSA_MEMORYPROPERTY defined in Thunk spec:

CoherentHostAccess: whether or not device memory can be coherently
accessed by the host CPU.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c |  6 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h | 10 ++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index cdef608db4f4..ab9fe854b4d8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1419,6 +1419,12 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
 		dev->node_props.capability |= (adev->ras_features != 0) ?
 			HSA_CAP_RASEVENTNOTIFY : 0;
 
+	/* SVM API and HMM page migration work together, device memory type
+	 * is initalized to not 0 when page migration register device memory.
+	 */
+	if (adev->kfd.dev->pgmap.type != 0)
+		dev->node_props.capability |= HSA_CAP_SVMAPI_SUPPORTED;
+
 	kfd_debug_print_topology();
 
 	if (!res)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
index b8b68087bd7a..6bd6380b0ee0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
@@ -53,8 +53,9 @@
 #define HSA_CAP_ASIC_REVISION_MASK		0x03c00000
 #define HSA_CAP_ASIC_REVISION_SHIFT		22
 #define HSA_CAP_SRAM_EDCSUPPORTED		0x04000000
+#define HSA_CAP_SVMAPI_SUPPORTED		0x08000000
 
-#define HSA_CAP_RESERVED			0xf80f8000
+#define HSA_CAP_RESERVED			0xf00f8000
 
 struct kfd_node_properties {
 	uint64_t hive_id;
@@ -98,9 +99,10 @@ struct kfd_node_properties {
 #define HSA_MEM_HEAP_TYPE_GPU_LDS	4
 #define HSA_MEM_HEAP_TYPE_GPU_SCRATCH	5
 
-#define HSA_MEM_FLAGS_HOT_PLUGGABLE	0x00000001
-#define HSA_MEM_FLAGS_NON_VOLATILE	0x00000002
-#define HSA_MEM_FLAGS_RESERVED		0xfffffffc
+#define HSA_MEM_FLAGS_HOT_PLUGGABLE		0x00000001
+#define HSA_MEM_FLAGS_NON_VOLATILE		0x00000002
+#define HSA_MEM_FLAGS_COHERENTHOSTACCESS	0x00000004
+#define HSA_MEM_FLAGS_RESERVED			0xfffffff8
 
 struct kfd_mem_properties {
 	struct list_head	list;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

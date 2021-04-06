Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D95354A93
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1406E584;
	Tue,  6 Apr 2021 01:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE4A6E25B;
 Tue,  6 Apr 2021 01:47:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYgZ9R8VNf8SVSrMUyr7FoQ6EOSPGVhWd9mQ6YBjAqgMUoMrrZnI75VJrNoSXz8Qmyn8hz1bJP1LFPS3uJR9+LMrFuSsNuhQZpj1cnHvkzBUaHHcaV1P8nSl6tGg2MgfVTLEkL4m6P9I4UgcLCGRIeZBYcKJ+rEgVuPPIY33/fEO467UkuO88OCwleuRqYPSjtcYFwCeL/kGPTxbGEK91js8grSbtGdSzvnM8FQf5I1RIK79UZs/wArioMj5n08Q5egdy9BgJ5YjKndEdASf3YPlrUWK4bgZV6nVVZYdSnx+YAzGM7fUmiFCPiUVbK95h96Djnm7M7tIFdueTyb+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/P4UzAd5fV3bYFCoPtupnGv93qLFyil+oXtDITRdeC0=;
 b=RhtmlJX0sehHV59peeCUuv41rfLX2qYQfA5KT+DGGTwa+1awheUG6iRYr40mm2/CRlX+YQU4fVJGZ/VNtuj6CJCO8NY59X1k9orYQmsSpdcbwIdwww2xZtrXqb6ZQDr3MCeLmjMexOI66nAVYKyA01B9IGqXCqr9XUhMf++f22tvNJshg3aQpjw7BtQpVJQ8yIY9GkDsljWi/kaPOEMcD5KS2pGlwwDZAepNaf1ozO/S4I5bN9maUHDm9tJxdZ/QE75J4267XbbItpZtLZearq1q+h2fUfwar/bvZi0KrxdnATKV/NF9uvQhGRaVHWUjHJjbF53ZrekAEQO/J+N6gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/P4UzAd5fV3bYFCoPtupnGv93qLFyil+oXtDITRdeC0=;
 b=TETX98Kel2g1mc3Rqu14fL9X6RRXBtpqf0nV37SjKuRPhvteUl7rFmZyi53abji9q9am6IRk6wOqbsPmS7dPyOkrJzrlW6phnUmWl0slTe4kqk60FID2gONV9UNBK2yepeFQIqup5gfDU0HCg8meMJEq+5FxTE/lZz7VAg5J9Nk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4159.namprd12.prod.outlook.com (2603:10b6:208:1da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 01:47:43 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:43 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 33/34] drm/amdkfd: Add SVM API support capability bits
Date: Mon,  5 Apr 2021 21:46:28 -0400
Message-Id: <20210406014629.25141-34-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f461bc1e-d23a-4661-e339-08d8f89de585
X-MS-TrafficTypeDiagnostic: MN2PR12MB4159:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4159752FBFA0E8743A12C0A992769@MN2PR12MB4159.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N4ZdcOx/gWiKZku/Di1xzocMFk5X0qAmPtvrfMxIvkLFO0M3m3i9R8cQ7PZY2ZcMhRrDoL8FFW03sidCZ3rqJI7bekupzMIigXRwSyOdLlJs4U5wWaG3IJuplHA9p/bXPqMJzXhowswYRYobe19B0wVfkTBPi9FDwvdve95qB1czaa1g+M5J7T41I1EzA+1Lg8wYZqnfVYsMtQN/jYt7BEZZsgvj8J70bGYvoNc/jH5JgLwwh7LW/ogarB21T1fRUoTvZre/S72b7aviuLB4gOQXN28h/36wdzk1t4j2Ff0JZzo//oh3GDHCjycUgYfxvdAUtQ6bBTt1ygIjaQ0RbVYTHUNWAcHBUS2DcKnjTibHM3NaGCkiGyUeAOMaORbg8ZYRBuhrYeGSqX0FcZXw1fR6pfSYSp1M/sgDztwqu/0DAghBjKqiwI/kaMny0BSRwA7s+tAQgcp06u8Du0EAm/zXHqa2v93rwcma8yqdRgNR0rgTSj8DYUgGr4hsNcXwYnCwgGavYUFL9EyAYXxfxiR6lpTqkjkgoPzONJinvqioA/zMk91q2W5iTPmiCpNixyDgiS2Ed6fEbUWWwWS/mt89HeCNkqvyPOfLn4bjvgU+Uf5Bt3yVHJYeUkXQhL2IiGQBBIvx7513dYoDRi1f3MfwKrPhpc7Jt6B0ALf6jREqfbWJvQ50dzdlH2S/jvs3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(66556008)(2906002)(66946007)(66476007)(5660300002)(8676002)(26005)(6666004)(186003)(8936002)(316002)(4326008)(83380400001)(478600001)(450100002)(52116002)(7696005)(38100700001)(36756003)(2616005)(956004)(6486002)(16526019)(38350700001)(1076003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5P2Xsrm0mIdFcGwZMdFQ5rfBrqVRPZfpZ8uN/YsyUcouV0FWX8/shRsigjsa?=
 =?us-ascii?Q?1hCdHylRCg8HuMEpTMYzxNYewnVPno7N+xIY0mTnt+kLwUixyWHY2emtKVF3?=
 =?us-ascii?Q?TNFaelxJLItC2sEfRmwNQ8902oDMLHoigQXLiuaCp70hfqxKczCozym5R06o?=
 =?us-ascii?Q?35KbFa2rnfQs3kKZ1hSjTUtasgw4deimTkpPrxrkqs/FFbyhFwM5Z0B4M6Zw?=
 =?us-ascii?Q?KBy5E0Ea971OXHFvItiPsSr8TGZwaxDgrCACpFN4U4JO4W4Hy8m+u5adM2MZ?=
 =?us-ascii?Q?5wtFxxt2s4F8UCGhXwO1WFGeZoHrihg2nvfCSe6BNgoFv+pn/jWv7U7zOYLk?=
 =?us-ascii?Q?RdHok+73Y2aZhl8X9Bt3JkGtqkWn5LsutrSkjzdY+5L66pp25CQ+PB8TcdgO?=
 =?us-ascii?Q?jRlNCECgKGu+nCRbUCe0Yf9hcmWGxmOUUFPo/snxLPltwbKXti6E7EIPSEQo?=
 =?us-ascii?Q?JSBUDIF4jFEw28Sm3aasQkOSblpitvmjDRpi61osUhwoPNMnYhsC7fe1Kl5b?=
 =?us-ascii?Q?rDlqEPaaZL6+pFDtSMI1LAetTurXNoFV8bsMAZ9xdyDRt7okJK4Hwrpwsq0P?=
 =?us-ascii?Q?Sersz3Blez5vFIm7NHMYLICVOuQm+N7cjsZpCkeR8WDxTdjQSify25f8/aPJ?=
 =?us-ascii?Q?HC2IxvEz9eo0hBDQkMmgCt5yfZKW4dS0x1sbgyX9Hy1v1szY+1K9n6J0pLfQ?=
 =?us-ascii?Q?OOE+eUgPGFjLUtN/Txwuccb3FQENQVbaq8zi3PZjeXCZgLqNY/EmUp0ApL0r?=
 =?us-ascii?Q?QZGQTMYWOiVu06pqZJRk5gMY3a9vkwYQ6n+1VqzJ5J1ZuWTcQS0cdpaQdbJx?=
 =?us-ascii?Q?ovqRYBJ8WsS29X2Vi9uitnzKST/8PU/ig18T+0g3soICebVCTpX6cVS9DH5O?=
 =?us-ascii?Q?CrOVvd95crlI9X3HZGaf30U6BpJ87QMbPms21xQHV2mC/blVaJ1JREVkC8op?=
 =?us-ascii?Q?u/P0ehvwkpmjelBNKDbNKyBaPJpdHp38CyGL1ZVcI4e3YBImBKynlmih/9AE?=
 =?us-ascii?Q?+OVluBLr/IHKCtHJUbBf/iYptHwRInMr5Jh6QfMl7W0KenzrWgcYpKdMrV37?=
 =?us-ascii?Q?r2bpXORXSl//t7xWEd/UmqM9zuc+UWTi2j0TpF1KyyaaMZEncNV5XLMwJiG+?=
 =?us-ascii?Q?w/pb83TiI5jKJIQlPkF98oVWhGLL+ZXxKbdbyvXJc9qvKoHlidBnr6FyA8xx?=
 =?us-ascii?Q?u5Vu/1/cS+V4AFdkK5DVwCsWON3dmku9lIMRzPnGg/TaVx8+r4AJKgvBx5dY?=
 =?us-ascii?Q?izQ85n7yD09Gyn+FSIz2I5g4AG8xHrSlcLqEPZc4xog3e/j6f9qkGwdLUBsD?=
 =?us-ascii?Q?Wf4CjgdnRkIo+wxYky7yfPLF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f461bc1e-d23a-4661-e339-08d8f89de585
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:12.0521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VD0o24bEsotCe4lki/lAWx2flVAwvmXfSGf7nlWX6zpXuhuN+oFqQRNDsPcBXAr3k38apy2a0vnDQYg+kjDAZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4159
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

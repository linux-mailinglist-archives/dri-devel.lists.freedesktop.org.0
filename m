Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42105306E51
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 08:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859AD6E0E1;
	Thu, 28 Jan 2021 07:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50DA6E0E1;
 Thu, 28 Jan 2021 07:13:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hu4H2hTZbI9Xm9luqtRAR7PezpAtfnL8lcZ+hj62tO++KX1j3jidANMwnQv7IGwqOu72sggP98JEwavkKwCZjZuCJ8mhC0Gt/NOVUAs8u0WzNnXT5Tl3p8LupRZNDhkR4szRvWJ1Gi3REl2P84WeSy7dGj34dELUr3W9vE1SN0FfcnMuxDc62QVdYEekWyaG8mNi0EfxzFDCPOZZAoyMBnfmrfDPqrZwSAOLurI4OPjIm2r9F6xYq/Pzlyg7gSa7BUk9EBXV78Mi1Bn01YD3tanB5fEtQUkIi15C5Yta5sYd2aEQdBCbbpeaL9CNwGCLg6sWmr7pVfgfUVMbQs8iwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwpnTFg1v4e74KuO9gjvbUPmsqazLRKFsxCLv/r0wRY=;
 b=Pep1m4jSkbXhD+qciLx2d7b+actcyChKqJNTZHV4VeCGMkW2KwfbhGGOJpmIoFdZC05lJPhofGtwuiLa+Ec7gSlaekjk35o0ppTkoYncoph2Dq5qE1dLiy3H7jehnPXS+2U8OB7ZaT84r1Ref+R0EiUcspN9tyFpJc01H9Kov10Uzl+WIgGhyypnFNrw4dUjYRIvqt9DE+UEmaVeZ+h9HV6hz5aSaazxOOY2IpzDn1W3C2vVZOA9ST0jB5EyG2RnBbY9Cb+4BqJDgbtbrwULMzzeSnL6OQmHT4UTJOEKtH9Pgu99xtgNps847Cn0F8IZvYuPZ5JQR4+34EeCtGpUnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwpnTFg1v4e74KuO9gjvbUPmsqazLRKFsxCLv/r0wRY=;
 b=0x7YtFIf6PKSNcTFMaUE9KVnS9Luyg/Y4VwymdjFnPpvLOTCvMjS6a7Pzl24OTM5lA3eqAPCyZdJKzrfRCApbtxCUGsCbaXzNlqJ5CjwhXV8sbRzT02SOtpcynHsZUrLLSlCYvG+QX2SXlHzVKRJWsf3VRhURVSXWADJA9nhuiY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3022.namprd12.prod.outlook.com (2603:10b6:208:ce::32)
 by MN2PR12MB3280.namprd12.prod.outlook.com (2603:10b6:208:ad::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 28 Jan
 2021 07:13:53 +0000
Received: from MN2PR12MB3022.namprd12.prod.outlook.com
 ([fe80::709e:b0ae:fbde:fcc6]) by MN2PR12MB3022.namprd12.prod.outlook.com
 ([fe80::709e:b0ae:fbde:fcc6%7]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 07:13:53 +0000
From: Kevin Wang <kevin1.wang@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [RFC PATCH 2/3] drm/ttm: add ttm vm bo trace event support
Date: Thu, 28 Jan 2021 15:13:21 +0800
Message-Id: <20210128071322.24313-3-kevin1.wang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210128071322.24313-1-kevin1.wang@amd.com>
References: <20210128071322.24313-1-kevin1.wang@amd.com>
X-Originating-IP: [58.247.170.245]
X-ClientProxiedBy: HKAPR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:203:d0::20) To MN2PR12MB3022.namprd12.prod.outlook.com
 (2603:10b6:208:ce::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from MZ01-CE0.amd.com (58.247.170.245) by
 HKAPR04CA0010.apcprd04.prod.outlook.com (2603:1096:203:d0::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Thu, 28 Jan 2021 07:13:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dc0fbd10-3b97-4457-f91b-08d8c35c44b3
X-MS-TrafficTypeDiagnostic: MN2PR12MB3280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3280DCF5B949E070A02EE941A2BA9@MN2PR12MB3280.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:78;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GirmfxFEtqlDPpcStA29u+4PbM+qdB1KgRHPHGl0gUXjsu9SXKPcIGZF84GXrdVAYhCO/vSxOJPaa2gK9XyyCuaqrbfPpEalW2rraBH0RCbyP/6vuMPw+yR4wv+ZaAJXqEg0OaKdfoT8QAFamCuYQLPgwjj406Enifd0qLC/J66ge9DW1y7O0DlvC2QhF5TM9sOzK9sWBbjtSNuNjh7ExjRrsU6kEYgkt07HoMnFiDArCLFqPCCR0agngDH62rd5keAYOVQaSAKhuICrCF9YvKFK7bnqjjs0lUMvl1oI9MgVd9Uq3uh8xe8bTzEaeakXzw4ADUOuZ/q6MOA4W3Tfe90uS1ihqyOw5wn7YIFsGrbwQnZ9fCiqTV04RO76kkvEBmZFBZLQM2M+oSqJNzljI1g9Uxz121z2f7rQCju9ByYw8/y2aQyvPkWsQ2kJvYQiQa92+ENCHb8TvU1Wy/60nz51fsicjHRsUUuuDkaJR/HcrmofTRvyxX4i7hXIoQCzL3Rxqw0pkHoHyaqghFl6e1G/j+Vvxj14DJawiEfvbQJA8Vq1Z+8Wm3hLytXZaBuL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3022.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(186003)(450100002)(66946007)(2616005)(66556008)(66476007)(6486002)(26005)(316002)(8676002)(5660300002)(36756003)(8936002)(83380400001)(1076003)(16526019)(2906002)(86362001)(478600001)(7696005)(6666004)(956004)(52116002)(4326008)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DFZMwpiE7ao/nBmDytoN/xvP1IbKpCF4DkEQANXJs6T79Ql69k4LTFZi3GxV?=
 =?us-ascii?Q?xEr1fBpPBPLdaRT8NIbFNICDbYzQcM6qKrpgT9GZAipMqCm5n9a9XNch7YRP?=
 =?us-ascii?Q?AzsSPzLa1YyD4EjmGz5mLIpUKkcAFlY59fRbjYDhQZ8U4AcOdeZeEAsT0K4P?=
 =?us-ascii?Q?rFByDR0O9AIqI9WNaiVH2koR+fn0dZzsGPgtKBTi5E9jXamz0/jCfTbTM+Sh?=
 =?us-ascii?Q?NnFDwzn8UBzaTLjqV3mN+fdIijradWE5r7wS1AA974ekhuFdGz7WI9TvV0vB?=
 =?us-ascii?Q?10EvKYqaizSyeFV+MS6ZjBhqUPm2EZ5xQy5orFAIUF+/4Zq2k8CQheVDjSub?=
 =?us-ascii?Q?XMH/nVs7kS2IID3oRYg5eHycqiD38ofmfBtny24I70NpumnvlMV8e51zx3UV?=
 =?us-ascii?Q?80blopsGKjMkTU/z9euZFXZir3TvLknD2+QOnauZ9QHkhvGBkFx4akhdFF7f?=
 =?us-ascii?Q?83HES+aE7p/bmjoIaxJaaZ4e/rGvV0deZkx9kycZa9zA+DxUdh/XhYmkvNmc?=
 =?us-ascii?Q?pEpa7gbqmTly1S6IHCvA9ZnH4kxzv/TbG/PlXBW8FfR4VqPWGFmqnxPQCKFK?=
 =?us-ascii?Q?Em1pJ8SHMf6URqybQdTj2Dy/3TUzAJbarotVrFRWyzHN4mRxTm4+naQuAZoS?=
 =?us-ascii?Q?J4gfpa8cRv/mVsFk/XPPUTOR/G9laHQHdfeWnnRuhBRFyu6Q7Zyp6u3CjJbZ?=
 =?us-ascii?Q?ohSMQVRZ7Qjiz8ALxDE8QtXJSUYQErJ/XmQohI3pOroiieRjj/oPhIFygxHq?=
 =?us-ascii?Q?U5ZhG8ZpaWl1KEbPobp1d+/Bf0HJ5jdvpgzYuMoSO79IAbTyNwT4rdDeWg7z?=
 =?us-ascii?Q?ntxovmlZidanV9o5PeNSVMnZY6DYS7EyzF42KWd/CTA6p0Q5uIL32K3yUtCU?=
 =?us-ascii?Q?C1Yj+QryejU83DDa8ihwg9McZX+8TRJugqVjvHg9YuO26XH7wRd8zIcNjepN?=
 =?us-ascii?Q?se8rNUAHZWWn3P7HM5bYmjCrCgPpvAubwkevx+t8OCn7q28q7d0FVqsLP5nL?=
 =?us-ascii?Q?tJv5e7L0oAtP1rRO6Rk7C8zLSPs3eIwDDeCddibz1juMZQHVnthdqS+JTfh+?=
 =?us-ascii?Q?vbN4sC9i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0fbd10-3b97-4457-f91b-08d8c35c44b3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3022.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 07:13:53.3486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ezul4EBW27NPwla0AD7Naj6FVL4sqEsPXHzskJfGfyYEcWr2Yb+PU7iMFNbvw8ek
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3280
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
Cc: ray.huang@amd.com, christian.koenig@amd.com,
 Kevin Wang <kevin1.wang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add ttm bo VM related trace event support

trace events:
ttm:ttm_bo_mmap
ttm:ttm_bo_vm_fault
ttm:ttm_bo_vm_access

Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 12 ++++-
 drivers/gpu/drm/ttm/ttm_trace.h | 78 +++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 01693e8f24b7..aece2024c1fd 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -42,6 +42,8 @@
 #include <linux/uaccess.h>
 #include <linux/mem_encrypt.h>
 
+#include "ttm_trace.h"
+
 static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_buffer_object *bo,
 				struct vm_fault *vmf)
 {
@@ -429,15 +431,17 @@ vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
 
 	ret = ttm_bo_vm_reserve(bo, vmf);
 	if (ret)
-		return ret;
+		goto out;
 
 	prot = vma->vm_page_prot;
 	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
-		return ret;
+		goto out;
 
 	dma_resv_unlock(bo->base.resv);
 
+out:
+	trace_ttm_bo_vm_fault(bo, vmf, ret);
 	return ret;
 }
 EXPORT_SYMBOL(ttm_bo_vm_fault);
@@ -516,6 +520,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 	if (ret)
 		return ret;
 
+	trace_ttm_bo_vm_access(bo, !!write, offset, len);
+
 	switch (bo->mem.mem_type) {
 	case TTM_PL_SYSTEM:
 		if (unlikely(bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
@@ -618,6 +624,7 @@ int ttm_bo_mmap(struct file *filp, struct vm_area_struct *vma,
 		goto out_unref;
 
 	ttm_bo_mmap_vma_setup(bo, vma);
+	trace_ttm_bo_mmap(bo, vma);
 	return 0;
 out_unref:
 	ttm_bo_put(bo);
@@ -629,6 +636,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
 {
 	ttm_bo_get(bo);
 	ttm_bo_mmap_vma_setup(bo, vma);
+	trace_ttm_bo_mmap(bo, vma);
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_mmap_obj);
diff --git a/drivers/gpu/drm/ttm/ttm_trace.h b/drivers/gpu/drm/ttm/ttm_trace.h
index 7c5e55725e8e..9f7cc34b243b 100644
--- a/drivers/gpu/drm/ttm/ttm_trace.h
+++ b/drivers/gpu/drm/ttm/ttm_trace.h
@@ -34,6 +34,7 @@
 #include <drm/ttm/ttm_page_alloc.h>
 #include <linux/types.h>
 #include <linux/tracepoint.h>
+#include <trace/events/mmflags.h>
 
 #define TTM_PLACEMENT_FLAGS_TRACE \
 	{ TTM_PL_FLAG_SYSTEM,		"SYSTEM"	},\
@@ -310,6 +311,83 @@ TRACE_EVENT(ttm_bo_release,
 	    TP_printk("bo:%p", __entry->bo)
 );
 
+TRACE_EVENT(ttm_bo_mmap,
+	    TP_PROTO(struct ttm_buffer_object *bo, struct vm_area_struct *vma),
+	    TP_ARGS(bo, vma),
+	    TP_STRUCT__entry(
+			     __field(struct ttm_buffer_object *, bo)
+			     __field(unsigned long, vm_start)
+			     __field(unsigned long, vm_end)
+			     __field(unsigned long, vm_pgoff)
+			     __field(unsigned long, vm_flags)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->bo = bo;
+			   __entry->vm_start = vma->vm_start;
+			   __entry->vm_end = vma->vm_end;
+			   __entry->vm_pgoff = vma->vm_pgoff;
+			   __entry->vm_flags = vma->vm_flags;
+			   ),
+
+	    TP_printk("bo:%p, vm_start=%lx, vm_end=%lx, vm_pgoff=%lx, vm_flags=%s",
+		      __entry->bo,
+		      __entry->vm_start, __entry->vm_end, __entry->vm_pgoff,
+		      show_vma_flags(__entry->vm_flags))
+);
+
+TRACE_EVENT(ttm_bo_vm_fault,
+	    TP_PROTO(struct ttm_buffer_object *bo, struct vm_fault *vmf, int result),
+	    TP_ARGS(bo, vmf, result),
+	    TP_STRUCT__entry(
+			     __field(struct ttm_buffer_object *, bo)
+			     __field(struct vm_area_struct *, vma)
+			     __field(unsigned long, fault_address)
+			     __field(unsigned long, fault_pgoff)
+			     __field(int, result)
+			     __field(unsigned int, flags)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->bo = bo;
+			   __entry->vma = vmf->vma;
+			   __entry->fault_address = vmf->address;
+			   __entry->fault_pgoff = vmf->pgoff;
+			   __entry->flags = vmf->flags;
+			   __entry->result = result;
+			   ),
+
+	    TP_printk("bo:%p, vma=%p, fault_address=%lx, fault_pgoff=%lx, fault_flags=%s %s",
+		      __entry->bo, __entry->vma,
+		      __entry->fault_address, __entry->fault_pgoff,
+		      __entry->flags ? __print_flags(__entry->flags, "|", FAULT_FLAG_TRACE) : "none",
+		      __print_flags(__entry->result, "|", VM_FAULT_RESULT_TRACE))
+);
+
+TRACE_EVENT(ttm_bo_vm_access,
+	    TP_PROTO(struct ttm_buffer_object *bo, bool write, unsigned long offset, unsigned long len),
+	    TP_ARGS(bo, write, offset, len),
+	    TP_STRUCT__entry(
+			     __field(struct ttm_buffer_object *, bo)
+			     __field(bool, write)
+			     __field(unsigned long, offset)
+			     __field(unsigned long, len)
+			     __field(uint32_t, mem_type)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->bo = bo;
+			   __entry->write = write;
+			   __entry->offset = offset;
+			   __entry->len = len;
+			   __entry->mem_type = bo->mem.mem_type;
+			   ),
+
+	    TP_printk("bo:%p, %s offset=%lx, len=%lx, mtype=%d",
+		      __entry->bo, __entry->write ? "write" : "read",
+		      __entry->offset, __entry->len, __entry->mem_type)
+);
+
 #endif
 
 #undef TRACE_INCLUDE_PATH
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

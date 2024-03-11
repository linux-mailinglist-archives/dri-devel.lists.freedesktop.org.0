Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB558788EB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 20:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6F5112C36;
	Mon, 11 Mar 2024 19:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YoGhPOAT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DEE112C35;
 Mon, 11 Mar 2024 19:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710185278; x=1741721278;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OrrHyJLcdjUrpBj/xTQAC2i01vhnAs6IYElTyq3rUpo=;
 b=YoGhPOATgxhOkYJCro55S3uJmb3tnVdS7TZO6H7igK8hvblaru2BxSkW
 ckuG/hD1aNIFSUE65qyWQ9mJWNMUWS2DroG0qKww9xZkQXGJRX30G4gs9
 bKw89rnRuZh33RWSoakYUfK+7bkLIBmaeH1NOip331th7il/onHdiUel2
 60rJCZUq9U9JayL5XKoiLkUV+APvqdHMk6e+Gni8D1kE8tvU/di8uMPaZ
 C622ngt+h81YTk7rG/tN/GW8YUw4srgHdyXXnlBv/GmPvI9FQkbCbO6lq
 8ilpyHA36MruBx/Ak7EMG5YffUC+0ct/k58cwhPjcLWdNPdXcFJA3UOJ3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4793243"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="4793243"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 12:27:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="15924119"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 12:27:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:27:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 12:27:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 12:27:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMPv602PgIoPPYbeA6T8hDeko3HgAQhNNe5soNKkKlL6u0w/cr9WSKiHE440jQHwQPgNCOj57L6x7RMfZsOfHOsW28yWqk8RjJLQUaJxHB+L4f+fd75he+I5Vz7HeXuLmX7Mt0DbBJEqkO04+ap/DHxP9sqSNLOKBAk2aCutNtwEDZxk/NCdM+qvSyYick9h5s7u9f0tABpcds78rFg62na74Znjo20ycNp8SxIC5dJ5PryC0YbCijOxgXkkLDOqqckSj1ZYNGN01elBcYIJPeiOkfCATX2+kHweYCiN8Z+rwUzcasbH6ZIRRUORNi0XHYYDpcZVlP7zZFJhrKxQ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QP8zKWPwqNgRwx65afasiemtG9AQDpIV/k8wMjM0w1s=;
 b=JArTxbF49uf2NI8Td3gyB2CustkZByXe8eVG4Ftl+rSKdeod24XbKcktASASjDRSAL+Ll80R/f+slb9D/yZ4BpFa2PaE/KB+E/o9cQvfBYU0UwlTX9sxB6moHdSO3zx9chAqSFLF4eVxIoPJPci/cXLA/96qbOutG43/+nEfeENrwn06eN6hKOhs2O/hcWTdPolIKS5rnDbQ2eIQMLXByiwABYkOsjHEro8CLD+5uoSgd0ZAZyAvrAg3lKKeoTP3xEdH+lSVp23lPfZnLIpqKITWNgC+UKT/szKHU5iYCPXjVqMLoh1P5gGzuFnx6ZRwFZI6HhG9wso0qY39WSBNmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7530.namprd11.prod.outlook.com (2603:10b6:8:146::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Mon, 11 Mar
 2024 19:27:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 19:27:51 +0000
Date: Mon, 11 Mar 2024 14:27:48 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 0/5] drm/i915: cleanup dead code
Message-ID: <ib5axtjg4z5tdteclrvisvmjvvtvfytw6onisbt3jes4lvfsk2@afattpxmdnqn>
References: <20240306193643.1897026-1-lucas.demarchi@intel.com>
 <3e260fe4-9e21-4997-a41d-8b547612b65c@ursulin.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <3e260fe4-9e21-4997-a41d-8b547612b65c@ursulin.net>
X-ClientProxiedBy: SJ0P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: ce5a69ac-15d1-4197-a81b-08dc42015773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ez7/tBBFmyC9cylc6XL9VBlX7GetgLW9oeFyxF1eStdbC7RoyIqfh5ZM3oUh/K/Lb1bZqJ5SAQh3oBISaQTAYxbLo/pDJxls38Z+Jqq3TO5YPWztUmUqEkAbUl94MET4GTgk9UA/cVbY/UH9uXEY/SnCtyHGw9Es7WKZu8mdZrZiAsd96mKfp1iwy5+gJCu0VRXRXyTw535PhfTgAENel0knxg4lRny8h9xrpQmXdT+zmHOzHofrJwnZjvEYupzAYlr8HS3l6c1UfR/tr88b8dOLR0ihZH8IkbLsuB9bmWrZFxbRPWWGe1RQdK5QefXjsPp3Hxcoanup1DR1rHykEC+9vzumF0J596sqpHILyUI4/TDsAq8iOGh977kmCgiC/K66X23RrxXxLGM8o56JBJw+a+aCenUP4NxrDVXgvRf9bDM/tDac5WcKyfv6hn5rXMGqR2OJRpptAN+5/XACb6tegUWr+8SsdQNOVcE5KRSY74ElbpmC/7a+/R6f0jyQAyJFn0l0US8021L14M6XAgAsbru4lDJcsq0cvVpoPqOE6CxZd/NIECRq4Kb5UepWUK+nX6C1EPsjbwYWDHcBGz3wIQttV8qKpLZs/2TZJ1hQQXqgrhsznLLf2NR/1DO6pbvs00JVyEmI2847GjBHFTmWCBF3q8Ka6pfm7SMsgQU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F+VKhgnz4PlVLS9F3owd01qGHPwTIUIR03S2evl3Ys0iys+4Qrie/vvZfbui?=
 =?us-ascii?Q?bR/LYsftBacVJNI6uA/U1kGuNvNj/UOacpWomDVV6oz1SOrXFsiK6lAxKuhN?=
 =?us-ascii?Q?Gjq5J027XlIwB7Yzh2SdfQh/Mz4AR58eIBQaGU19Ww4n+VDW1LHXzrqG/I29?=
 =?us-ascii?Q?7cav2wdta4qA5cfsmTC0FTO+q1QZauUGJJMTd5P0G6hL797UcKHDXZwkyiB+?=
 =?us-ascii?Q?8lXBvGz+DyWkZbyImfCusKpuNk9f8cBd6j3A4uqO1v9ziGpKN65IXlbwHyno?=
 =?us-ascii?Q?2mKqON9pFmqHSlxwrh08wonmwfrmdu5lj6YreVPU38oi5jDBnv4weUuSix0Y?=
 =?us-ascii?Q?VDpXmh4P0+lWKCd1xoDlFDdbMcT8ttJEO1UxOjukCfxVaZhpUkBap91pdqLp?=
 =?us-ascii?Q?UrC4Dk4vrCvwMNokS8fAEd9UZ3tG95Ju04oADB9WMcbd6VGfLJnn+U2zjQLR?=
 =?us-ascii?Q?izt+NCHWQiYlpe/vSyecYzKqN3HIqw5c4QlwGCC3E7/SgAIxYAqy2ltZNfVy?=
 =?us-ascii?Q?nCmQZ0c9g1MiHy4CY63d8Y5SNAB0nJPzJSNl35YgyGrqsCJnkkkbUtXoCeE1?=
 =?us-ascii?Q?9RDqxSk4VXAWBysM7/Ofiy88cUQBlnbSCHlwE67fYdSh+LFjJn/5GgD/qxd3?=
 =?us-ascii?Q?i4xTtg1qpIHN9E0H310HpeuvxR9L9ahS5qMypwxPPCYoZ/2S+LbKPUVOyUW+?=
 =?us-ascii?Q?xpUiAtFNBlhBxVDCRfql05uz8ZlY8bt4nViE0QgbBs0uPPtC7pdseMnCTR1K?=
 =?us-ascii?Q?kHKJpBkhxSSli1ivEEUrUVdI1p/oiF1l/tuCYBrxkzCCMIlvA0hkHSbrGncb?=
 =?us-ascii?Q?5fDOvMbjGwdZFu3b3t+4rMtFGXs7d9bWlG2vhIWyDnSVzUqWFZxDi0Il6FzQ?=
 =?us-ascii?Q?QalozJPY7qKegWzUY9kP2a8uMKBACgAWNMsNq+2NoFaexouw9zniXzY2Njkd?=
 =?us-ascii?Q?DDCv+6XslhH9hYLlisNgI8cJfhTuEya1jaDPY3kiFhowOjHv9w7+WVXjpHWx?=
 =?us-ascii?Q?lVkh1LSx8mBh2HlWsWR1uImNGw9T3qLhjFK+ko15gsqo8C3eWQO/arGZ6dQG?=
 =?us-ascii?Q?Zn4473DhX//WAinEuOFDGtHg+va9pyU3UuRVkzTYIDp+AVXF0BGUXXDl6eX4?=
 =?us-ascii?Q?xk/LYwJJhhHoDSpE0Vbq3WEjasXCpdkqDlZnRKAV3gZAkhpDllAvPRFilF/H?=
 =?us-ascii?Q?0MqHQOgmGicJaWh3oxTnA2NczKr/jIlYaXZOJx4CH39MxNL8MO1zMqNjG86/?=
 =?us-ascii?Q?kCQmQbUUhXeJsl3Zu5/lIAVzHX4F//PEnI7GEOyUQ38VZLBOgU4wgv+fZldA?=
 =?us-ascii?Q?+kEYc8VzBtp202HLksln536Ym3rp4N+OOgPlMFP1LjO1nAKsgTH3SA3B0fzp?=
 =?us-ascii?Q?gVzu2MAZH6WiLnvvrbtg4KhVL6r7ZxFD6/Li+2o+DOAht+IX4SL3dQIZcX3N?=
 =?us-ascii?Q?igShsLQavogJcSDV/o4sxKSJGskpa2Ih1MNee6BjV33hajl7+Zd3dNTHiWp0?=
 =?us-ascii?Q?EMipU484FMsv/Lf8OvqvEfFI9CYl/zd9tlq3KN+5d+V0WAnkYrjZxKOTpIAf?=
 =?us-ascii?Q?dwop9LxkSI3RZXCCapLfUushecKdtIP0nfIQBDSGJ4vf0WQ7Jnd/FKF6lVgK?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5a69ac-15d1-4197-a81b-08dc42015773
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:27:51.1675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYXHscEHFoIBSQQM8OyqAt5yPiQLiR8Dt1yqXJ2dm3vQZnr4zaFywvpbZ2WW0pT4Lb56viCHSGyPlzxDvuddlSbediw1oA7yK8O8nIgnJnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7530
X-OriginatorOrg: intel.com
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

On Mon, Mar 11, 2024 at 05:43:00PM +0000, Tvrtko Ursulin wrote:
>
>On 06/03/2024 19:36, Lucas De Marchi wrote:
>>Remove platforms that never had their PCI IDs added to the driver and
>>are of course marked with requiring force_probe. Note that most of the
>>code for those platforms is actually used by subsequent ones, so it's
>>not a huge amount of code being removed.
>
>I had PVC and xehpsdv back in October but could not collect all acks. :(
>
>Last two patches from https://patchwork.freedesktop.org/series/124705/.

oh... I was actually surprised we still had xehpsdv while removing a
WA for PVC, which made me look into removing these platforms.

rebasing your series and comparing yours..my-v2, where my-v2 only has
patches 2 and 4, I have the diff below. I think it's small enough that I
can just take your commits and squash delta. Is that ok to you?

my version is a little bit more aggressive, also doing some renames
s/xehpsdv/xehp/ and dropping some more code
(engine_mask_apply_copy_fuses(), unused registers, default ctx, fw
ranges).

	diff --git a/Documentation/gpu/rfc/i915_vm_bind.h b/Documentation/gpu/rfc/i915_vm_bind.h
	index 8a8fcd4fceac..bc26dc126104 100644
	--- a/Documentation/gpu/rfc/i915_vm_bind.h
	+++ b/Documentation/gpu/rfc/i915_vm_bind.h
	@@ -93,12 +93,11 @@ struct drm_i915_gem_timeline_fence {
	  * Multiple VA mappings can be created to the same section of the object
	  * (aliasing).
	  *
	- * The @start, @offset and @length must be 4K page aligned. However the DG2
	- * and XEHPSDV has 64K page size for device local memory and has compact page
	- * table. On those platforms, for binding device local-memory objects, the
	- * @start, @offset and @length must be 64K aligned. Also, UMDs should not mix
	- * the local memory 64K page and the system memory 4K page bindings in the same
	- * 2M range.
	+ * The @start, @offset and @length must be 4K page aligned. However the DG2 has
	+ * 64K page size for device local memory and has compact page table. On that
	+ * platform, for binding device local-memory objects, the @start, @offset and
	+ * @length must be 64K aligned. Also, UMDs should not mix the local memory 64K
	+ * page and the system memory 4K page bindings in the same 2M range.
	  *
	  * Error code -EINVAL will be returned if @start, @offset and @length are not
	  * properly aligned. In version 1 (See I915_PARAM_VM_BIND_VERSION), error code
	diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
	index 1495b6074492..d3300ae3053f 100644
	--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
	+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
	@@ -386,7 +386,7 @@ struct drm_i915_gem_object {
		 * and kernel mode driver for caching policy control after GEN12.
		 * In the meantime platform specific tables are created to translate
		 * i915_cache_level into pat index, for more details check the macros
	-	 * defined i915/i915_pci.c, e.g. TGL_CACHELEVEL.
	+	 * defined i915/i915_pci.c, e.g. MTL_CACHELEVEL.
		 * For backward compatibility, this field contains values exactly match
		 * the entries of enum i915_cache_level for pre-GEN12 platforms (See
		 * LEGACY_CACHELEVEL), so that the PTE encode functions for these
	diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
	index fa46d2308b0e..1bd0e041e15c 100644
	--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
	+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
	@@ -500,11 +500,11 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
	 }
	 
	 static void
	-xehpsdv_ppgtt_insert_huge(struct i915_address_space *vm,
	-			  struct i915_vma_resource *vma_res,
	-			  struct sgt_dma *iter,
	-			  unsigned int pat_index,
	-			  u32 flags)
	+xehp_ppgtt_insert_huge(struct i915_address_space *vm,
	+		       struct i915_vma_resource *vma_res,
	+		       struct sgt_dma *iter,
	+		       unsigned int pat_index,
	+		       u32 flags)
	 {
		const gen8_pte_t pte_encode = vm->pte_encode(0, pat_index, flags);
		unsigned int rem = sg_dma_len(iter->sg);
	@@ -741,8 +741,8 @@ static void gen8_ppgtt_insert(struct i915_address_space *vm,
		struct sgt_dma iter = sgt_dma(vma_res);
	 
		if (vma_res->bi.page_sizes.sg > I915_GTT_PAGE_SIZE) {
	-		if (GRAPHICS_VER_FULL(vm->i915) >= IP_VER(12, 50))
	-			xehpsdv_ppgtt_insert_huge(vm, vma_res, &iter, pat_index, flags);
	+		if (GRAPHICS_VER_FULL(vm->i915) >= IP_VER(12, 55))
	+			xehp_ppgtt_insert_huge(vm, vma_res, &iter, pat_index, flags);
			else
				gen8_ppgtt_insert_huge(vm, vma_res, &iter, pat_index, flags);
		} else  {
	@@ -781,11 +781,11 @@ static void gen8_ppgtt_insert_entry(struct i915_address_space *vm,
		drm_clflush_virt_range(&vaddr[gen8_pd_index(idx, 0)], sizeof(*vaddr));
	 }
	 
	-static void __xehpsdv_ppgtt_insert_entry_lm(struct i915_address_space *vm,
	-					    dma_addr_t addr,
	-					    u64 offset,
	-					    unsigned int pat_index,
	-					    u32 flags)
	+static void xehp_ppgtt_insert_entry_lm(struct i915_address_space *vm,
	+				       dma_addr_t addr,
	+				       u64 offset,
	+				       unsigned int pat_index,
	+				       u32 flags)
	 {
		u64 idx = offset >> GEN8_PTE_SHIFT;
		struct i915_page_directory * const pdp =
	@@ -810,15 +810,15 @@ static void __xehpsdv_ppgtt_insert_entry_lm(struct i915_address_space *vm,
		vaddr[gen8_pd_index(idx, 0) / 16] = vm->pte_encode(addr, pat_index, flags);
	 }
	 
	-static void xehpsdv_ppgtt_insert_entry(struct i915_address_space *vm,
	-				       dma_addr_t addr,
	-				       u64 offset,
	-				       unsigned int pat_index,
	-				       u32 flags)
	+static void xehp_ppgtt_insert_entry(struct i915_address_space *vm,
	+				    dma_addr_t addr,
	+				    u64 offset,
	+				    unsigned int pat_index,
	+				    u32 flags)
	 {
		if (flags & PTE_LM)
	-		return __xehpsdv_ppgtt_insert_entry_lm(vm, addr, offset,
	-						       pat_index, flags);
	+		return xehp_ppgtt_insert_entry_lm(vm, addr, offset,
	+						  pat_index, flags);
	 
		return gen8_ppgtt_insert_entry(vm, addr, offset, pat_index, flags);
	 }
	@@ -1042,7 +1042,7 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
		ppgtt->vm.bind_async_flags = I915_VMA_LOCAL_BIND;
		ppgtt->vm.insert_entries = gen8_ppgtt_insert;
		if (HAS_64K_PAGES(gt->i915))
	-		ppgtt->vm.insert_page = xehpsdv_ppgtt_insert_entry;
	+		ppgtt->vm.insert_page = xehp_ppgtt_insert_entry;
		else
			ppgtt->vm.insert_page = gen8_ppgtt_insert_entry;
		ppgtt->vm.allocate_va_range = gen8_ppgtt_alloc;
	diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
	index f553cf4e6449..423d72115af0 100644
	--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
	+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
	@@ -839,38 +839,6 @@ static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
		}
	 }
	 
	-static void engine_mask_apply_copy_fuses(struct intel_gt *gt)
	-{
	-	struct drm_i915_private *i915 = gt->i915;
	-	struct intel_gt_info *info = &gt->info;
	-	unsigned long meml3_mask;
	-	unsigned long quad;
	-
	-	if (!(GRAPHICS_VER_FULL(i915) >= IP_VER(12, 60) &&
	-	      GRAPHICS_VER_FULL(i915) < IP_VER(12, 70)))
	-		return;
	-
	-	meml3_mask = intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3);
	-	meml3_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK, meml3_mask);
	-
	-	/*
	-	 * Link Copy engines may be fused off according to meml3_mask. Each
	-	 * bit is a quad that houses 2 Link Copy and two Sub Copy engines.
	-	 */
	-	for_each_clear_bit(quad, &meml3_mask, GEN12_MAX_MSLICES) {
	-		unsigned int instance = quad * 2 + 1;
	-		intel_engine_mask_t mask = GENMASK(_BCS(instance + 1),
	-						   _BCS(instance));
	-
	-		if (mask & info->engine_mask) {
	-			gt_dbg(gt, "bcs%u fused off\n", instance);
	-			gt_dbg(gt, "bcs%u fused off\n", instance + 1);
	-
	-			info->engine_mask &= ~mask;
	-		}
	-	}
	-}
	-
	 /*
	  * Determine which engines are fused off in our particular hardware.
	  * Note that we have a catch-22 situation where we need to be able to access
	@@ -889,7 +857,6 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
	 
		engine_mask_apply_media_fuses(gt);
		engine_mask_apply_compute_fuses(gt);
	-	engine_mask_apply_copy_fuses(gt);
	 
		/*
		 * The only use of the GSC CS is to load and communicate with the GSC
	diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
	index 2f386f531c55..ee5115b12a21 100644
	--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
	+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
	@@ -57,7 +57,7 @@ static const struct intel_mmio_range icl_l3bank_steering_table[] = {
	  * are of a "GAM" subclass that has special rules.  Thus we use a separate
	  * GAM table farther down for those.
	  */
	-static const struct intel_mmio_range xehpsdv_mslice_steering_table[] = {
	+static const struct intel_mmio_range dg2_mslice_steering_table[] = {
		{ 0x00DD00, 0x00DDFF },
		{ 0x00E900, 0x00FFFF }, /* 0xEA00 - OxEFFF is unused */
		{},
	@@ -153,7 +153,7 @@ void intel_gt_mcr_init(struct intel_gt *gt)
			gt->steering_table[L3BANK] = xelpg_l3bank_steering_table;
			gt->steering_table[DSS] = xelpg_dss_steering_table;
		} else if (IS_DG2(i915)) {
	-		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
	+		gt->steering_table[MSLICE] = dg2_mslice_steering_table;
			gt->steering_table[LNCF] = dg2_lncf_steering_table;
			/*
			 * No need to hook up the GAM table since it has a dedicated
	diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
	index 0635c9288742..8d8d781b44b6 100644
	--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
	+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
	@@ -723,38 +723,6 @@
	 #define   HSUNIT_CLKGATE_DIS			REG_BIT(8)
	 #define   VSUNIT_CLKGATE_DIS			REG_BIT(3)
	 
	-#define UNSLCGCTL9440				_MMIO(0x9440)
	-#define   GAMTLBOACS_CLKGATE_DIS		REG_BIT(28)
	-#define   GAMTLBVDBOX5_CLKGATE_DIS		REG_BIT(27)
	-#define   GAMTLBVDBOX6_CLKGATE_DIS		REG_BIT(26)
	-#define   GAMTLBVDBOX3_CLKGATE_DIS		REG_BIT(24)
	-#define   GAMTLBVDBOX4_CLKGATE_DIS		REG_BIT(23)
	-#define   GAMTLBVDBOX7_CLKGATE_DIS		REG_BIT(22)
	-#define   GAMTLBVDBOX2_CLKGATE_DIS		REG_BIT(21)
	-#define   GAMTLBVDBOX0_CLKGATE_DIS		REG_BIT(17)
	-#define   GAMTLBKCR_CLKGATE_DIS			REG_BIT(16)
	-#define   GAMTLBGUC_CLKGATE_DIS			REG_BIT(15)
	-#define   GAMTLBBLT_CLKGATE_DIS			REG_BIT(14)
	-#define   GAMTLBVDBOX1_CLKGATE_DIS		REG_BIT(6)
	-
	-#define UNSLCGCTL9444				_MMIO(0x9444)
	-#define   GAMTLBGFXA0_CLKGATE_DIS		REG_BIT(30)
	-#define   GAMTLBGFXA1_CLKGATE_DIS		REG_BIT(29)
	-#define   GAMTLBCOMPA0_CLKGATE_DIS		REG_BIT(28)
	-#define   GAMTLBCOMPA1_CLKGATE_DIS		REG_BIT(27)
	-#define   GAMTLBCOMPB0_CLKGATE_DIS		REG_BIT(26)
	-#define   GAMTLBCOMPB1_CLKGATE_DIS		REG_BIT(25)
	-#define   GAMTLBCOMPC0_CLKGATE_DIS		REG_BIT(24)
	-#define   GAMTLBCOMPC1_CLKGATE_DIS		REG_BIT(23)
	-#define   GAMTLBCOMPD0_CLKGATE_DIS		REG_BIT(22)
	-#define   GAMTLBCOMPD1_CLKGATE_DIS		REG_BIT(21)
	-#define   GAMTLBMERT_CLKGATE_DIS		REG_BIT(20)
	-#define   GAMTLBVEBOX3_CLKGATE_DIS		REG_BIT(19)
	-#define   GAMTLBVEBOX2_CLKGATE_DIS		REG_BIT(18)
	-#define   GAMTLBVEBOX1_CLKGATE_DIS		REG_BIT(17)
	-#define   GAMTLBVEBOX0_CLKGATE_DIS		REG_BIT(16)
	-#define   LTCDD_CLKGATE_DIS			REG_BIT(10)
	-
	 #define GEN11_SLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x94d4)
	 #define XEHP_SLICE_UNIT_LEVEL_CLKGATE		MCR_REG(0x94d4)
	 #define   SARBUNIT_CLKGATE_DIS			(1 << 5)
	@@ -764,9 +732,6 @@
	 #define   L3_CLKGATE_DIS			REG_BIT(16)
	 #define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
	 
	-#define SCCGCTL94DC				MCR_REG(0x94dc)
	-#define   CG3DDISURB				REG_BIT(14)
	-
	 #define UNSLICE_UNIT_LEVEL_CLKGATE2		_MMIO(0x94e4)
	 #define   VSUNIT_CLKGATE_DIS_TGL		REG_BIT(19)
	 #define   PSDUNIT_CLKGATE_DIS			REG_BIT(5)
	@@ -988,10 +953,6 @@
	 #define   GEN7_WA_FOR_GEN7_L3_CONTROL		0x3C47FF8C
	 #define   GEN7_L3AGDIS				(1 << 19)
	 
	-#define XEHPC_LNCFMISCCFGREG0			MCR_REG(0xb01c)
	-#define   XEHPC_HOSTCACHEEN			REG_BIT(1)
	-#define   XEHPC_OVRLSCCC			REG_BIT(0)
	-
	 #define GEN7_L3CNTLREG2				_MMIO(0xb020)
	 
	 /* MOCS (Memory Object Control State) registers */
	@@ -1045,20 +1006,9 @@
	 #define XEHP_L3SQCREG5				MCR_REG(0xb158)
	 #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
	 
	-#define MLTICTXCTL				MCR_REG(0xb170)
	-#define   TDONRENDER				REG_BIT(2)
	-
	 #define XEHP_L3SCQREG7				MCR_REG(0xb188)
	 #define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
	 
	-#define XEHPC_L3SCRUB				MCR_REG(0xb18c)
	-#define   SCRUB_CL_DWNGRADE_SHARED		REG_BIT(12)
	-#define   SCRUB_RATE_PER_BANK_MASK		REG_GENMASK(2, 0)
	-#define   SCRUB_RATE_4B_PER_CLK			REG_FIELD_PREP(SCRUB_RATE_PER_BANK_MASK, 0x6)
	-
	-#define L3SQCREG1_CCS0				MCR_REG(0xb200)
	-#define   FLUSHALLNONCOH			REG_BIT(5)
	-
	 #define GEN11_GLBLINVL				_MMIO(0xb404)
	 #define   GEN11_BANK_HASH_ADDR_EXCL_MASK	(0x7f << 5)
	 #define   GEN11_BANK_HASH_ADDR_EXCL_BIT0	(1 << 5)
	@@ -1108,7 +1058,6 @@
	 #define XEHP_COMPCTX_TLB_INV_CR			MCR_REG(0xcf04)
	 #define XELPMP_GSC_TLB_INV_CR			_MMIO(0xcf04)   /* media GT only */
	 
	-#define XEHP_MERT_MOD_CTRL			MCR_REG(0xcf28)
	 #define RENDER_MOD_CTRL				MCR_REG(0xcf2c)
	 #define COMP_MOD_CTRL				MCR_REG(0xcf30)
	 #define XELPMP_GSC_MOD_CTRL			_MMIO(0xcf30)	/* media GT only */
	@@ -1184,7 +1133,6 @@
	 #define EU_PERF_CNTL4				PERF_REG(0xe45c)
	 
	 #define GEN9_ROW_CHICKEN4			MCR_REG(0xe48c)
	-#define   GEN12_DISABLE_GRF_CLEAR		REG_BIT(13)
	 #define   XEHP_DIS_BBL_SYSPIPE			REG_BIT(11)
	 #define   GEN12_DISABLE_TDL_PUSH		REG_BIT(9)
	 #define   GEN11_DIS_PICK_2ND_EU			REG_BIT(7)
	@@ -1201,7 +1149,6 @@
	 #define   FLOW_CONTROL_ENABLE			REG_BIT(15)
	 #define   UGM_BACKUP_MODE			REG_BIT(13)
	 #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
	-#define   SYSTOLIC_DOP_CLOCK_GATING_DIS		REG_BIT(10)
	 #define   PARTIAL_INSTRUCTION_SHOOTDOWN_DISABLE	REG_BIT(8)
	 #define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
	 #define   THROTTLE_12_5				REG_GENMASK(4, 2)
	@@ -1678,11 +1625,6 @@
	 
	 #define GEN12_SFC_DONE(n)			_MMIO(0x1cc000 + (n) * 0x1000)
	 
	-#define GT0_PACKAGE_ENERGY_STATUS		_MMIO(0x250004)
	-#define GT0_PACKAGE_RAPL_LIMIT			_MMIO(0x250008)
	-#define GT0_PACKAGE_POWER_SKU_UNIT		_MMIO(0x250068)
	-#define GT0_PLATFORM_ENERGY_STATUS		_MMIO(0x25006c)
	-
	 /*
	  * Standalone Media's non-engine GT registers are located at their regular GT
	  * offsets plus 0x380000.  This extra offset is stored inside the intel_uncore
	diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
	index 90644e47d261..d7784650e4d9 100644
	--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
	+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
	@@ -582,9 +582,10 @@ static ssize_t media_freq_factor_show(struct kobject *kobj,
		 */
		with_intel_runtime_pm(gt->uncore->rpm, wakeref)
			mode = intel_uncore_read(gt->uncore, GEN6_RPNSWREQ);
	+
		mode = REG_FIELD_GET(GEN12_MEDIA_FREQ_RATIO, mode) ?
	-	       SLPC_MEDIA_RATIO_MODE_FIXED_ONE_TO_ONE :
	-	       SLPC_MEDIA_RATIO_MODE_FIXED_ONE_TO_TWO;
	+		SLPC_MEDIA_RATIO_MODE_FIXED_ONE_TO_ONE :
	+		SLPC_MEDIA_RATIO_MODE_FIXED_ONE_TO_TWO;
	 
		return sysfs_emit(buff, "%u\n", media_ratio_mode_to_factor(mode));
	 }
	diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
	index 7c367ba8d9dc..7f1b00cb9924 100644
	--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
	+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
	@@ -546,47 +546,6 @@ static const u8 gen12_rcs_offsets[] = {
		END
	 };
	 
	-static const u8 xehp_rcs_offsets[] = {
	-	NOP(1),
	-	LRI(13, POSTED),
	-	REG16(0x244),
	-	REG(0x034),
	-	REG(0x030),
	-	REG(0x038),
	-	REG(0x03c),
	-	REG(0x168),
	-	REG(0x140),
	-	REG(0x110),
	-	REG(0x1c0),
	-	REG(0x1c4),
	-	REG(0x1c8),
	-	REG(0x180),
	-	REG16(0x2b4),
	-
	-	NOP(5),
	-	LRI(9, POSTED),
	-	REG16(0x3a8),
	-	REG16(0x28c),
	-	REG16(0x288),
	-	REG16(0x284),
	-	REG16(0x280),
	-	REG16(0x27c),
	-	REG16(0x278),
	-	REG16(0x274),
	-	REG16(0x270),
	-
	-	LRI(3, POSTED),
	-	REG(0x1b0),
	-	REG16(0x5a8),
	-	REG16(0x5ac),
	-
	-	NOP(6),
	-	LRI(1, 0),
	-	REG(0x0c8),
	-
	-	END
	-};
	-
	 static const u8 dg2_rcs_offsets[] = {
		NOP(1),
		LRI(15, POSTED),
	@@ -695,8 +654,6 @@ static const u8 *reg_offsets(const struct intel_engine_cs *engine)
				return mtl_rcs_offsets;
			else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
				return dg2_rcs_offsets;
	-		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
	-			return xehp_rcs_offsets;
			else if (GRAPHICS_VER(engine->i915) >= 12)
				return gen12_rcs_offsets;
			else if (GRAPHICS_VER(engine->i915) >= 11)
	diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
	index 576e5ef0289b..86ba2f2e485c 100644
	--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
	+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
	@@ -35,9 +35,9 @@ static bool engine_supports_migration(struct intel_engine_cs *engine)
		return true;
	 }
	 
	-static void xehpsdv_toggle_pdes(struct i915_address_space *vm,
	-				struct i915_page_table *pt,
	-				void *data)
	+static void xehp_toggle_pdes(struct i915_address_space *vm,
	+			     struct i915_page_table *pt,
	+			     void *data)
	 {
		struct insert_pte_data *d = data;
	 
	@@ -52,9 +52,9 @@ static void xehpsdv_toggle_pdes(struct i915_address_space *vm,
		d->offset += SZ_2M;
	 }
	 
	-static void xehpsdv_insert_pte(struct i915_address_space *vm,
	-			       struct i915_page_table *pt,
	-			       void *data)
	+static void xehp_insert_pte(struct i915_address_space *vm,
	+			    struct i915_page_table *pt,
	+			    void *data)
	 {
		struct insert_pte_data *d = data;
	 
	@@ -120,7 +120,7 @@ static struct i915_address_space *migrate_vm(struct intel_gt *gt)
		 * 512 entry layout using 4K GTT pages. The other two windows just map
		 * lmem pages and must use the new compact 32 entry layout using 64K GTT
		 * pages, which ensures we can address any lmem object that the user
	-	 * throws at us. We then also use the xehpsdv_toggle_pdes as a way of
	+	 * throws at us. We then also use the xehp_toggle_pdes as a way of
		 * just toggling the PDE bit(GEN12_PDE_64K) for us, to enable the
		 * compact layout for each of these page-tables, that fall within the
		 * [CHUNK_SIZE, 3 * CHUNK_SIZE) range.
	@@ -209,12 +209,12 @@ static struct i915_address_space *migrate_vm(struct intel_gt *gt)
			/* Now allow the GPU to rewrite the PTE via its own ppGTT */
			if (HAS_64K_PAGES(gt->i915)) {
				vm->vm.foreach(&vm->vm, base, d.offset - base,
	-				       xehpsdv_insert_pte, &d);
	+				       xehp_insert_pte, &d);
				d.offset = base + CHUNK_SZ;
				vm->vm.foreach(&vm->vm,
					       d.offset,
					       2 * CHUNK_SZ,
	-				       xehpsdv_toggle_pdes, &d);
	+				       xehp_toggle_pdes, &d);
			} else {
				vm->vm.foreach(&vm->vm, base, d.offset - base,
					       insert_pte, &d);
	diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
	index 7889147b44b7..804654ab80ec 100644
	--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
	+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
	@@ -2661,6 +2661,7 @@ xcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
	 static void
	 ccs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
	 {
	+	/* boilerplate for any CCS engine workaround */
	 }
	 
	 /*
	diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
	index f68ec0a1c17d..1637c1d235e9 100644
	--- a/drivers/gpu/drm/i915/i915_perf.c
	+++ b/drivers/gpu/drm/i915/i915_perf.c
	@@ -2881,7 +2881,7 @@ gen12_enable_metric_set(struct i915_perf_stream *stream,
		int ret;
	 
		/*
	-	 * Wa_1508761755:xehpsdv, dg2
	+	 * Wa_1508761755
		 * EU NOA signals behave incorrectly if EU clock gating is enabled.
		 * Disable thread stall DOP gating and EU DOP gating.
		 */
	@@ -2911,7 +2911,7 @@ gen12_enable_metric_set(struct i915_perf_stream *stream,
		/*
		 * Initialize Super Queue Internal Cnt Register
		 * Set PMON Enable in order to collect valid metrics.
	-	 * Enable byets per clock reporting in OA for XEHPSDV onward.
	+	 * Enable byets per clock reporting in OA.
		 */
		sqcnt1 = GEN12_SQCNT1_PMON_ENABLE |
			 (HAS_OA_BPC_REPORTING(i915) ? GEN12_SQCNT1_OABPC : 0);
	@@ -2971,8 +2971,7 @@ static void gen12_disable_metric_set(struct i915_perf_stream *stream)
		u32 sqcnt1;
	 
		/*
	-	 * Wa_1508761755:xehpsdv, dg2
	-	 * Enable thread stall DOP gating and EU DOP gating.
	+	 * Wa_1508761755: Enable thread stall DOP gating and EU DOP gating.
		 */
		if (IS_DG2(i915)) {
			intel_gt_mcr_multicast_write(uncore->gt, GEN8_ROW_CHICKEN,
	diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
	index bdc409085b9a..f62573d48c76 100644
	--- a/drivers/gpu/drm/i915/i915_reg.h
	+++ b/drivers/gpu/drm/i915/i915_reg.h
	@@ -5399,7 +5399,7 @@
	 #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
	 #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
	 #define GEN12_PCODE_READ_SAGV_BLOCK_TIME_US	0x23
	-#define   XEHP_PCODE_FREQUENCY_CONFIG		0x6e	/* xehpsdv, pvc */
	+#define   XEHP_PCODE_FREQUENCY_CONFIG		0x6e
	 /* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
	 #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
	 #define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
	diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
	index 58d6c68195e0..40d56f02b5c6 100644
	--- a/drivers/gpu/drm/i915/intel_uncore.c
	+++ b/drivers/gpu/drm/i915/intel_uncore.c
	@@ -1497,17 +1497,16 @@ static const struct intel_forcewake_range __gen12_fw_ranges[] = {
		GEN_FW_RANGE(0x13200, 0x13fff, FORCEWAKE_MEDIA_VDBOX2), /*		\
			0x13200 - 0x133ff: VD2 (DG2 only)				\
			0x13400 - 0x13fff: reserved */					\
	-	GEN_FW_RANGE(0x14000, 0x141ff, FORCEWAKE_MEDIA_VDBOX0), /* XEHPSDV only */	\
	-	GEN_FW_RANGE(0x14200, 0x143ff, FORCEWAKE_MEDIA_VDBOX2), /* XEHPSDV only */	\
	-	GEN_FW_RANGE(0x14400, 0x145ff, FORCEWAKE_MEDIA_VDBOX4), /* XEHPSDV only */	\
	-	GEN_FW_RANGE(0x14600, 0x147ff, FORCEWAKE_MEDIA_VDBOX6), /* XEHPSDV only */	\
	+	GEN_FW_RANGE(0x14000, 0x141ff, FORCEWAKE_MEDIA_VDBOX0),			\
	+	GEN_FW_RANGE(0x14200, 0x143ff, FORCEWAKE_MEDIA_VDBOX2),			\
	+	GEN_FW_RANGE(0x14400, 0x145ff, FORCEWAKE_MEDIA_VDBOX4),			\
	+	GEN_FW_RANGE(0x14600, 0x147ff, FORCEWAKE_MEDIA_VDBOX6),			\
		GEN_FW_RANGE(0x14800, 0x14fff, FORCEWAKE_RENDER),			\
		GEN_FW_RANGE(0x15000, 0x16dff, FORCEWAKE_GT), /*			\
			0x15000 - 0x15fff: gt (DG2 only)				\
			0x16000 - 0x16dff: reserved */					\
		GEN_FW_RANGE(0x16e00, 0x1ffff, FORCEWAKE_RENDER),			\
	-	GEN_FW_RANGE(0x20000, 0x21fff, FORCEWAKE_MEDIA_VDBOX0), /*		\
	-		0x20000 - 0x20fff: VD0 (XEHPSDV only)				\
	+	GEN_FW_RANGE(0x21000, 0x21fff, FORCEWAKE_MEDIA_VDBOX0), /*		\
			0x21000 - 0x21fff: reserved */					\
		GEN_FW_RANGE(0x22000, 0x23fff, FORCEWAKE_GT),				\
		GEN_FW_RANGE(0x24000, 0x2417f, 0), /*					\
	@@ -1588,10 +1587,6 @@ static const struct intel_forcewake_range __gen12_fw_ranges[] = {
			0x1f6e00 - 0x1f7fff: reserved */				\
		GEN_FW_RANGE(0x1f8000, 0x1fa0ff, FORCEWAKE_MEDIA_VEBOX3),
	 
	-static const struct intel_forcewake_range __xehp_fw_ranges[] = {
	-	XEHP_FWRANGES(FORCEWAKE_GT)
	-};
	-
	 static const struct intel_forcewake_range __dg2_fw_ranges[] = {
		XEHP_FWRANGES(FORCEWAKE_RENDER)
	 };
	@@ -2442,10 +2437,6 @@ static int uncore_forcewake_init(struct intel_uncore *uncore)
			ASSIGN_FW_DOMAINS_TABLE(uncore, __dg2_fw_ranges);
			ASSIGN_SHADOW_TABLE(uncore, dg2_shadowed_regs);
			ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
	-	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
	-		ASSIGN_FW_DOMAINS_TABLE(uncore, __xehp_fw_ranges);
	-		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
	-		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
		} else if (GRAPHICS_VER(i915) >= 12) {
			ASSIGN_FW_DOMAINS_TABLE(uncore, __gen12_fw_ranges);
			ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
	diff --git a/drivers/gpu/drm/i915/selftests/intel_uncore.c b/drivers/gpu/drm/i915/selftests/intel_uncore.c
	index c998f15d505c..41eaa9b7f67d 100644
	--- a/drivers/gpu/drm/i915/selftests/intel_uncore.c
	+++ b/drivers/gpu/drm/i915/selftests/intel_uncore.c
	@@ -118,7 +118,6 @@ int intel_uncore_mock_selftests(void)
			{ __gen9_fw_ranges, ARRAY_SIZE(__gen9_fw_ranges), true },
			{ __gen11_fw_ranges, ARRAY_SIZE(__gen11_fw_ranges), true },
			{ __gen12_fw_ranges, ARRAY_SIZE(__gen12_fw_ranges), true },
	-		{ __xehp_fw_ranges, ARRAY_SIZE(__xehp_fw_ranges), true },
			{ __mtl_fw_ranges, ARRAY_SIZE(__mtl_fw_ranges), true },
			{ __xelpmp_fw_ranges, ARRAY_SIZE(__xelpmp_fw_ranges), true },
		};
	diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
	index a86d00a9758f..a01d1b869c2d 100644
	--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
	+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
	@@ -85,9 +85,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
	 #define IS_DG1(dev_priv)        IS_PLATFORM(dev_priv, XE_DG1)
	 #define IS_ALDERLAKE_S(dev_priv) IS_PLATFORM(dev_priv, XE_ALDERLAKE_S)
	 #define IS_ALDERLAKE_P(dev_priv) IS_PLATFORM(dev_priv, XE_ALDERLAKE_P)
	-#define IS_XEHPSDV(dev_priv) (dev_priv && 0)
	 #define IS_DG2(dev_priv)	IS_PLATFORM(dev_priv, XE_DG2)
	-#define IS_PONTEVECCHIO(dev_priv) IS_PLATFORM(dev_priv, XE_PVC)
	 #define IS_METEORLAKE(dev_priv) IS_PLATFORM(dev_priv, XE_METEORLAKE)
	 #define IS_LUNARLAKE(dev_priv) IS_PLATFORM(dev_priv, XE_LUNARLAKE)
	 
	@@ -130,7 +128,6 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
	 #define IS_DG2_GRAPHICS_STEP(xe, variant, first, last) \
		((xe)->info.subplatform == XE_SUBPLATFORM_DG2_ ## variant && \
		 IS_GRAPHICS_STEP(xe, first, last))
	-#define IS_XEHPSDV_GRAPHICS_STEP(xe, first, last) (IS_XEHPSDV(xe) && IS_GRAPHICS_STEP(xe, first, last))
	 
	 #define IS_TIGERLAKE_DISPLAY_STEP(xe, first, last) (IS_TIGERLAKE(xe) && IS_DISPLAY_STEP(xe, first, last))
	 #define IS_ROCKETLAKE_DISPLAY_STEP(xe, first, last) (IS_ROCKETLAKE(xe) && IS_DISPLAY_STEP(xe, first, last))


Let me know what you prefer. If squashing these changes to your patches,
then I'd add the other patches in this series on top.

thanks
Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
>>drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h is also changed on the
>>xe side, but that should be ok: the defines are there only for compat
>>reasons while building the display side (and none of these platforms
>>have display, so it's build-issue only).
>>
>>First patch is what motivated the others and was submitted alone
>>@ 20240306144723.1826977-1-lucas.demarchi@intel.com .
>>While loooking at this WA I was wondering why we still had some of that
>>code around.
>>
>>Build-tested only for now.
>>
>>Lucas De Marchi (5):
>>   drm/i915: Drop WA 16015675438
>>   drm/i915: Drop dead code for xehpsdv
>>   drm/i915: Update IP_VER(12, 50)
>>   drm/i915: Drop dead code for pvc
>>   drm/i915: Remove special handling for !RCS_MASK()
>>
>>  Documentation/gpu/rfc/i915_vm_bind.h          |  11 +-
>>  .../gpu/drm/i915/gem/i915_gem_object_types.h  |   2 +-
>>  .../gpu/drm/i915/gem/selftests/huge_pages.c   |   4 +-
>>  .../i915/gem/selftests/i915_gem_client_blt.c  |   8 +-
>>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |   5 +-
>>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  40 ++--
>>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  43 +---
>>  .../drm/i915/gt/intel_execlists_submission.c  |  10 +-
>>  drivers/gpu/drm/i915/gt/intel_gsc.c           |  15 --
>>  drivers/gpu/drm/i915/gt/intel_gt.c            |   4 +-
>>  drivers/gpu/drm/i915/gt/intel_gt_mcr.c        |  52 +----
>>  drivers/gpu/drm/i915/gt/intel_gt_mcr.h        |   2 +-
>>  drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  59 ------
>>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   |  21 +-
>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |   2 +-
>>  drivers/gpu/drm/i915/gt/intel_lrc.c           |  51 +----
>>  drivers/gpu/drm/i915/gt/intel_migrate.c       |  22 +-
>>  drivers/gpu/drm/i915/gt/intel_mocs.c          |  52 +----
>>  drivers/gpu/drm/i915/gt/intel_rps.c           |   6 +-
>>  drivers/gpu/drm/i915/gt/intel_sseu.c          |  13 +-
>>  drivers/gpu/drm/i915/gt/intel_workarounds.c   | 193 +-----------------
>>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   6 +-
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |   4 +-
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |   2 +-
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   1 -
>>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   2 +-
>>  drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   4 -
>>  drivers/gpu/drm/i915/i915_debugfs.c           |  12 --
>>  drivers/gpu/drm/i915/i915_drv.h               |  13 --
>>  drivers/gpu/drm/i915/i915_getparam.c          |   4 +-
>>  drivers/gpu/drm/i915/i915_gpu_error.c         |   5 +-
>>  drivers/gpu/drm/i915/i915_hwmon.c             |   6 -
>>  drivers/gpu/drm/i915/i915_pci.c               |  61 +-----
>>  drivers/gpu/drm/i915/i915_perf.c              |  19 +-
>>  drivers/gpu/drm/i915/i915_query.c             |   2 +-
>>  drivers/gpu/drm/i915/i915_reg.h               |   4 +-
>>  drivers/gpu/drm/i915/intel_clock_gating.c     |  26 +--
>>  drivers/gpu/drm/i915/intel_device_info.c      |   2 -
>>  drivers/gpu/drm/i915/intel_device_info.h      |   2 -
>>  drivers/gpu/drm/i915/intel_step.c             |  80 +-------
>>  drivers/gpu/drm/i915/intel_uncore.c           | 159 +--------------
>>  drivers/gpu/drm/i915/selftests/intel_uncore.c |   3 -
>>  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   6 -
>>  43 files changed, 110 insertions(+), 928 deletions(-)
>>

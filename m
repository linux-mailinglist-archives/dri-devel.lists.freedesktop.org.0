Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65504629E9E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 17:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A96110E144;
	Tue, 15 Nov 2022 16:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1777810E144;
 Tue, 15 Nov 2022 16:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668528955; x=1700064955;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N1oDWEOn8CAAONA90L6FPzEnXGGXlA/tdScd4SXyLfo=;
 b=ApvCc3VbRlWQR0uhzBfEPuvWPRnaBU17d8T5Z1Mp4D2/emQU6PmlHQ2b
 FI7shelSr5bxbKaSvBzUUH1VWHH2BwcfU9rgx0uF1Vs6+XZ2iyw0RdC1j
 WjFlfcv5kn5lSIFH8Ino47qaxBpmEIx/be/HWqdOfp9ACPfgVuvNMdCHL
 FVQLTtG2opK+OrqKx6QFmLfEFtqILPV4EiTQbO9acPE0o4zDtrOEts/P9
 lgMZapp3K2/mM2JPr0css5qRG8ln6XmZqtZ7yOTGd+CPyf5UJboeonG9W
 PscNds9MBR39fPWeoxxsssriqLpwtpPNqJTTaoBRRHqaoHMH96e+vlr4q w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="312297304"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="312297304"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 08:15:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="641260405"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="641260405"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 15 Nov 2022 08:15:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 08:15:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 15 Nov 2022 08:15:54 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 15 Nov 2022 08:15:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avoLdz9L6xxjiOlCYAohzjiZXRr0WGKTdR6Bv3p+yjhUvCqOYiwKZWbgf+whWve4NPXPhWWO7K2YQEy1/lUazq02saX+jmJKeFkDI4HllPmVq/N6QAdnYD4WYH2/nwnW/MMiRjJM/isRhkatYs3COi0p0YU0mgoe0pLb2LJE91GTFEaelvTax6P5Kzc4Arz3EonRnuGlAyzqk8GmeNxhcafrgaDRRR/1nHcrQNJpxmMoeRfBB28ZYJ38v8pIyDT+fgBFwvuEWljjnyE6/F3g3TjPy0hODex/pd3suCJaMIQTUZ3DfmY26dTPx71YP7MJX1Oo3ghnXjDQf/C0dQw/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dL49ro6Sx+IB4l6UYw6iXF5kcvD9I2xU8Gr3NJA4h6U=;
 b=MHZoPbO1Ag6XsN7CWzAEKfXkFbVW48KAmsQZD0z/8Pt1jaWli1QKZoEpmiVx57rwHzT65ELK6jX81XRgemFb2AKUIg+69isSRUg9xWWm5qv1RmQbZ4KsS2TgqDCDsZ6zrnms7m0ceppnJa7UsSHEI/unh85Oz1b0UxAhnYYGJUSnHkGA5jxvhG4q6MlLi3j1goiYsRvB/61Qn+sivA1a2X+5mZmzxyTt8R+U1nqmupdQQRCN8YipnU4VnawY6DW1G8tfRKtj7GTJuvEvwxXMMczgh9CKDy4MzZMn8F69GB00P5YLw7pac0qrEHW8lFX53QvqYcmKuYMbRPHRjeYu2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ0PR11MB6576.namprd11.prod.outlook.com (2603:10b6:a03:478::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 16:15:51 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713%3]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 16:15:51 +0000
Date: Tue, 15 Nov 2022 08:15:48 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v7 20/20] drm/i915/vm_bind: Async vm_unbind support
Message-ID: <Y3O7NCxiZHjjmyN7@nvishwa1-DESK>
References: <20221113075732.32100-1-niranjana.vishwanathapura@intel.com>
 <20221113075732.32100-21-niranjana.vishwanathapura@intel.com>
 <a828c36b-8f89-24b0-b287-dabf62f82085@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <a828c36b-8f89-24b0-b287-dabf62f82085@intel.com>
X-ClientProxiedBy: BYAPR06CA0060.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::37) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ0PR11MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: 80fba8fd-ef17-4aa7-ae24-08dac724aa41
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dJtPwfuy3GUVpPC7kgz0wXVhpHpm+lIXrMQr6ckZAmtVz5Zrof/yz/lelJQdRdwJD0Df9ISI5b1P+ADBobDDsc89QcE9fa+I894gg+RQO4o3VBgXgdZrL4zJqi80VQnWchx1l8zNL+y8oi+fDMqywfJjpMD3A4eFYWwmlbYSO3QnG5NtTZjxcgN18YLaApO9RCcXL3HABRR5IM6nLMPaFrvh/wFoi82cfx451nJIvzeZ4dtQi0nhjhMTcKAPQn8ZNYZlSbhzBurfsMcpWJFceGqJooqbRsRYlYABzEBAjnsADNxM/oro0lQQaCtrdNAxNQzTszDyk7YzOFUHAWyCnApNOQEF/Fg3mX85Na8ZRsG8V4SNFGZORCyh6g4BhMg7mqPCfE+NIj4I3HYtuqcgpanARVS9E2PK6YHO1kks2/eI8Mz7zosPkv9VHHjcm2FutZ87RAa7XKUcaYv45Tq3ENnFe2gvgTUlID2SaL8EgOtrwEOOEM3DQyrNTrU2e/AqpEl4iWbFKyx/ylva/3+chg3x+4QU1rL4nLNL5LX/xP0FiLcLvmoriz+6KyKuk0//HR7qaC8snIuIIyigiAWQ1TGnTQTYS1RUrQCCC659IPYanbwVNHUfGJvbFwzs6KU9aZ9rLHcZmtFHj1hABtiviybckoB3BNglN6qaQliKU89zpExDHIBbrnTQokSwtrOIWseRseV5eIaWAPSUF2vEaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199015)(33716001)(83380400001)(86362001)(6512007)(9686003)(26005)(6506007)(6666004)(186003)(82960400001)(38100700002)(6862004)(8936002)(66946007)(8676002)(4326008)(5660300002)(66556008)(41300700001)(66476007)(2906002)(6486002)(478600001)(316002)(6636002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GTMEBTD1Im9AHzjBVgD53Jx/tig33Jq0WOII8iySy/fGRMQwQoufAGYGF6jF?=
 =?us-ascii?Q?NnLQcYBEDU0OIMAf051LsdXCC1+YrxwKCZa/ZE2z7YjDbPzs50M6clPLpymb?=
 =?us-ascii?Q?r/NKAtlqRGJpKvaSA+hJ+D3xooq6wV/fDKkOEqtg/BfSXnpN/dN9uXxWICwB?=
 =?us-ascii?Q?GfXhm9NloWQ0jtaRQcBGUvyHNVY/pJWIDtrjKcrX6y2TOmT6epX9TNb13xpf?=
 =?us-ascii?Q?kWHijwreZjc0l3UAZeqbqOckW+b6Hn4Qmp0pkY67/AQQ0IKRPTQbjtgRFSbz?=
 =?us-ascii?Q?QMq22FnoHCevD5zmYJDTvlHuCczN5MSIxqsmkw/ygmlxYtacB8TqoV+epLuA?=
 =?us-ascii?Q?kfzQJ0cIrrWRLazxfE0w90ZODspGAeI1QFdx1pk7AnmjKTf3lRo5OHqsEWk3?=
 =?us-ascii?Q?Nzwvtotl6nuHmI4NknlotdD5GFg0ox+ywTRnKdVOwQTBZyZqcCbv+7XworeL?=
 =?us-ascii?Q?F38rTxiXjOWxQmNPLsvilQavstoJMouitvowCVT+yBjON+c5dczG7WoVvhIV?=
 =?us-ascii?Q?9bZf0sISX77kQ0NWS4pGLhywgRCBeJ95bd7wyAWq9J1NgxZqQlF+Nvn1Ko8r?=
 =?us-ascii?Q?/G8PMsmumwYqdbtpX5uYf7mmG17bUgTqgTPmQleBUg8TkiCi/HcAHaHT6QDm?=
 =?us-ascii?Q?A7sCzfP6ln4frD6Y/rq+pt6CDSs7OfjPx9Tq0lox6kdMwLf7Fx9KaozYiZG/?=
 =?us-ascii?Q?pEyB1MCzwEGiOsgk5dv50i/oFc0BdhnftTjiFZprhAk6yy+LEyiPaib+/jN2?=
 =?us-ascii?Q?vKLxrZ8C1JmryPXVx84t3Ao9M5agxV0tfc9u7v5vE0bIyxszlDuhl5yDNM+q?=
 =?us-ascii?Q?IW9CnITF60S/oEzAvjJ98xN6pkEbP8/DRdg1ZS4uqs55HHsUYZIjKReeBOuc?=
 =?us-ascii?Q?M/BxhFnoofjHAnRU9HXznXhGaFDZLlWQhX/4+HFEUsWcGr8U7cvzgNCMdre4?=
 =?us-ascii?Q?2NXHN7haaLRRnLj4yyDVCJOjb03Xkm9I2dw2wUIEdynMrNlBG4jDIIFPErlA?=
 =?us-ascii?Q?KN99EWlP35mrcyb+t1afQL2nR9bze9VvD4Fpih/hgkQL3j1QPx449pGJ/djb?=
 =?us-ascii?Q?NlE0qIetCNxawfMgKNAala2SMne7Lie1JlAD9FOogXgziopOfCUkiEM3Bryd?=
 =?us-ascii?Q?duhFZbIhRnRPHIpXqTQJ2WiSlHxgapXuQne//Ga+q04MPEfBFbEpg6Nt+6JL?=
 =?us-ascii?Q?zeXpifOll2yUzBcmnrsACtis7/QEWM7nJhLtY8YJiOuRzkoa1vc6tOf46Nk8?=
 =?us-ascii?Q?altf0+YcEQ2q035CfdkP1c1GWmCoDJMgaIyTX3j/COx9Wx8Gvl2T/7lP7w6z?=
 =?us-ascii?Q?YezZEfJ92wiuvxY+f15f86+HlkglCSb8iR2TKpLRxth4qWKyDsFukOKHJowu?=
 =?us-ascii?Q?nV5IQ3IDEiNiwvYXidK/IsCHZ4Nv1Bq54ll7M/LvBpaJO/p8CQM8TSdo5/KT?=
 =?us-ascii?Q?QCPQXHfq4qVXXc1cZOwQcY5c0ogGVpbl97oFLDILjMOEq7x8zP7cCRCXc/Il?=
 =?us-ascii?Q?YpPYou0lVOIRj2h0lpBqmT5tsHZsmFWO4Bdw/dmN1x+0jEWstvLUH+D5lnSp?=
 =?us-ascii?Q?1aO2T7i3LWAT4LuSVlMDHY7C7B9CXiniNBMbHW6oAGH61RBae1PWjQCYkc3Z?=
 =?us-ascii?Q?49N2xtQZFr+sbRGSsLqT/Fg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80fba8fd-ef17-4aa7-ae24-08dac724aa41
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 16:15:51.6620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2m52DP8VkvqQ9J9XE/6CBVa96Z2/E8QrztAjEdMCFnWE3h/rq6f8C9NYvVNA8JX4qZOxjujcyEF3KGewQpnbnr00sqlih+A8HJInBR6Q5ehtYg5ExJ8f27s3OE+0fkg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6576
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 lionel.g.landwerlin@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 15, 2022 at 11:05:21AM +0000, Matthew Auld wrote:
>On 13/11/2022 07:57, Niranjana Vishwanathapura wrote:
>>Asynchronously unbind the vma upon vm_unbind call.
>>Fall back to synchronous unbind if backend doesn't support
>>async unbind or if async unbind fails.
>>
>>No need for vm_unbind out fence support as i915 will internally
>>handle all sequencing and user need not try to sequence any
>>operation with the unbind completion.
>>
>>v2: use i915_vma_destroy_async in vm_unbind ioctl
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>This only does it for non-partial vma, right? Or was that changed somewhere?
>

No, it applies to any vma (partial or non-partial).
It was so from the beginning.

Niranjana

>Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
>>---
>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    |  2 +-
>>  drivers/gpu/drm/i915/i915_vma.c               | 51 +++++++++++++++++--
>>  drivers/gpu/drm/i915/i915_vma.h               |  1 +
>>  include/uapi/drm/i915_drm.h                   |  3 +-
>>  4 files changed, 51 insertions(+), 6 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>index d87d1210365b..36651b447966 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>@@ -210,7 +210,7 @@ static int i915_gem_vm_unbind_vma(struct i915_address_space *vm,
>>  	 */
>>  	obj = vma->obj;
>>  	i915_gem_object_lock(obj, NULL);
>>-	i915_vma_destroy(vma);
>>+	i915_vma_destroy_async(vma);
>>  	i915_gem_object_unlock(obj);
>>  	i915_gem_object_put(obj);
>>diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>>index 7cf77c67d755..483d25f2425c 100644
>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>@@ -42,6 +42,8 @@
>>  #include "i915_vma.h"
>>  #include "i915_vma_resource.h"
>>+static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma);
>>+
>>  static inline void assert_vma_held_evict(const struct i915_vma *vma)
>>  {
>>  	/*
>>@@ -1713,7 +1715,7 @@ void i915_vma_reopen(struct i915_vma *vma)
>>  	spin_unlock_irq(&gt->closed_lock);
>>  }
>>-static void force_unbind(struct i915_vma *vma)
>>+static void force_unbind(struct i915_vma *vma, bool async)
>>  {
>>  	if (!drm_mm_node_allocated(&vma->node))
>>  		return;
>>@@ -1727,7 +1729,21 @@ static void force_unbind(struct i915_vma *vma)
>>  		i915_vma_set_purged(vma);
>>  	atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
>>-	WARN_ON(__i915_vma_unbind(vma));
>>+	if (async) {
>>+		struct dma_fence *fence;
>>+
>>+		fence = __i915_vma_unbind_async(vma);
>>+		if (IS_ERR_OR_NULL(fence)) {
>>+			async = false;
>>+		} else {
>>+			dma_resv_add_fence(vma->obj->base.resv, fence,
>>+					   DMA_RESV_USAGE_READ);
>>+			dma_fence_put(fence);
>>+		}
>>+	}
>>+
>>+	if (!async)
>>+		WARN_ON(__i915_vma_unbind(vma));
>>  	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
>>  }
>>@@ -1787,7 +1803,7 @@ void i915_vma_destroy_locked(struct i915_vma *vma)
>>  {
>>  	lockdep_assert_held(&vma->vm->mutex);
>>-	force_unbind(vma);
>>+	force_unbind(vma, false);
>>  	list_del_init(&vma->vm_link);
>>  	release_references(vma, vma->vm->gt, false);
>>  }
>>@@ -1798,7 +1814,34 @@ void i915_vma_destroy(struct i915_vma *vma)
>>  	bool vm_ddestroy;
>>  	mutex_lock(&vma->vm->mutex);
>>-	force_unbind(vma);
>>+	force_unbind(vma, false);
>>+	list_del_init(&vma->vm_link);
>>+	vm_ddestroy = vma->vm_ddestroy;
>>+	vma->vm_ddestroy = false;
>>+
>>+	/* vma->vm may be freed when releasing vma->vm->mutex. */
>>+	gt = vma->vm->gt;
>>+	mutex_unlock(&vma->vm->mutex);
>>+	release_references(vma, gt, vm_ddestroy);
>>+}
>>+
>>+void i915_vma_destroy_async(struct i915_vma *vma)
>>+{
>>+	bool vm_ddestroy, async = vma->obj->mm.rsgt;
>>+	struct intel_gt *gt;
>>+
>>+	if (dma_resv_reserve_fences(vma->obj->base.resv, 1))
>>+		async = false;
>>+
>>+	mutex_lock(&vma->vm->mutex);
>>+	/*
>>+	 * Ensure any asynchronous binding is complete while using
>>+	 * async unbind as we will be releasing the vma here.
>>+	 */
>>+	if (async && i915_active_wait(&vma->active))
>>+		async = false;
>>+
>>+	force_unbind(vma, async);
>>  	list_del_init(&vma->vm_link);
>>  	vm_ddestroy = vma->vm_ddestroy;
>>  	vma->vm_ddestroy = false;
>>diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
>>index 737ef310d046..25f15965dab8 100644
>>--- a/drivers/gpu/drm/i915/i915_vma.h
>>+++ b/drivers/gpu/drm/i915/i915_vma.h
>>@@ -272,6 +272,7 @@ void i915_vma_reopen(struct i915_vma *vma);
>>  void i915_vma_destroy_locked(struct i915_vma *vma);
>>  void i915_vma_destroy(struct i915_vma *vma);
>>+void i915_vma_destroy_async(struct i915_vma *vma);
>>  #define assert_vma_held(vma) dma_resv_assert_held((vma)->obj->base.resv)
>>diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>index e5600f358a15..431d40bb1dee 100644
>>--- a/include/uapi/drm/i915_drm.h
>>+++ b/include/uapi/drm/i915_drm.h
>>@@ -3969,7 +3969,8 @@ struct drm_i915_gem_vm_bind {
>>   * any error.
>>   *
>>   * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
>>- * are not ordered.
>>+ * are not ordered. Furthermore, parts of the VM_UNBIND operation can be done
>>+ * asynchronously.
>>   */
>>  struct drm_i915_gem_vm_unbind {
>>  	/** @vm_id: VM (address space) id to bind */

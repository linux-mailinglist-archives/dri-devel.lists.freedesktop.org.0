Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 166B385ACD1
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 21:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A158910E198;
	Mon, 19 Feb 2024 20:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VZUCbZQx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A1510E198;
 Mon, 19 Feb 2024 20:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708373545; x=1739909545;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ea3vXubvwWGs5KaP90TP0NRvZjX4EH41eAcXDQD0xLs=;
 b=VZUCbZQxZBUCkZBoR4yJ4+UBeJXLgCpyDHJ+Gz6StScIzcscQzPF6LbJ
 eaXGY5a/N6Hs5ls7CRvmgyKZzKBoTNeFQ2WT9YyGUBOOcic5Lo05tHwFq
 eVCA1O35jTtAIXowolbH3M2SVU0n5gLJmjxOIQSk3m0t0fIsYRAvPD7QH
 AtlZfL86RbtSt1gKPO/ea1cXboTGfmXTgCWxxgdW+61KRJjjbs+wud+rR
 xfm7bAcemGGE7B9FfZQ/FS6Y9avHU0QK42DDjBrjN7QIMkHQkl7NYDmfL
 IvVAW+ao4yLbsjURV0Ns2Tu5m0jlUBcmWawrI1P8DzLOBr0qf5OVz2QDZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2330885"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2330885"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 12:12:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="35349566"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 12:12:24 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 12:12:24 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 12:12:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 12:12:23 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 12:12:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQazH+AQRriMwWNDf/+Sk0VtKzBYOdOgPRdH+hQziCGKQcrwg5Fl4pfyqH7opBtzUpZdB7EpSpGyykw5CyPPPvqfPLIv3qIHVPpDr2SnW5MaIiG80WJAxXKaQ/DadpH1W3Xvul7NmlpFINv5a085bsBrJ9lyyZzlv+hJ0AeOD+5E7VSJmSS4t+5azfPgDJ8GBT96cmZ5MHFIBagr6p9Z8sFPFdQro7IbL6MlFTDNpfUaHwRPCvrVfhT5QWEmcZWfGSfqYHnV1z641+cg8fOzKM4PkFX1OCBSHylU/KFvFy20bj0+tUTzGumECe6KleYHsUKLudgzBQ0h9a/hYt/GwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKjtDWPoBC1iqmAfyss+HW6Fw8rTJvdEkT8jitzYOdU=;
 b=YjQ3Q7w0lwRMyrzWCKDm2gRwgQcY8LdL13f3rK8yxO85f+dnmUI88Nz3gxz8rhtThZ1X6rByv3OWVbUaOISoTfFLn9RZrN3DmcTmSY7ReCjHlBYQu1W6s9odXkJ6s2XJT6zI9Ew5TfcBTB9gkXLDcrNOcn5aP9NAbv381r2Aj9D4SFlIocuGPtJw3loJTOjWIulEBlbNrj+/eUI0zaaBvtm+i2HcTFkJhSEVEUHp+iV7s0LaFhWEEdueeTHc/3NWbtjN5rZ88SSYXpDuFjJh/uAMHjkT+JIsDTDx0W9Rg1Sd2HWFu9BogDs1KbFEGNq6yKAFW+dcrcBewCo2LG8pNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4919.namprd11.prod.outlook.com (2603:10b6:510:34::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Mon, 19 Feb
 2024 20:12:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 20:12:22 +0000
Date: Mon, 19 Feb 2024 15:12:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Andi
 Shyti <andi.shyti@linux.intel.com>, Shawn Lee <shawn.c.lee@intel.com>
Subject: Re: [PATCH] drm/i915: check before removing mm notifier
Message-ID: <ZdO2IYev7Amcbtt1@intel.com>
References: <20240219125047.28906-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240219125047.28906-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR01CA0052.prod.exchangelabs.com (2603:10b6:a03:94::29)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4919:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ec227b-7f1b-4aa6-ec76-08dc31871486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w0x9iQK7E74t/ZRLBSa34u+MPcHPGSQpT8t16HYy/ut/npW1FE8tRVsRDEh7S7i12ZkJc6qGZ5VbBo2HJ9zWFiiI3cVudcexxCEgCtfPWYoR7UH0m2HbnJxTIoGVdElz83jNapbtQQFJjLGxB9/dVWOTnQZlmX02mEbfOq+ZYoPzPxAmBZC3gzp+ikU+FOChHvyO1q5owTYQ8lX3vj4Av1kDB4i3AF6N/Om53T3ULtnor4S/2fPk8WXxF8qP0ja8npR7MmMQLMjKBrUZnu9DKHy12V911VtuYtaDXyLTWhLcgP2qUvfmkiTyVXaxq/8+1BicnwrpD1qYma00XT2hq9GgT14SGHEdHCrMmqmbvk1qSEOXemrgj0KyOERIKroSxIX3pMiqS9yGz5/y5SXmWmnX6dsI/JKMuLKncPXC2EK81AVNKxYuSdqPMhVlITFJnSvGo8dzf7aEidCfUdto/puPu1uq6ciTj1sfOHCz5JhotbJiI/dKejsX9BCjhRuF0iMKvQbvcQnOi3OME3T+lvoBLCTq4fH16+3Xlbg+9qI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s2cmcx4ipZpTdHxZFk2FEi1dYlGB/9MjSjepMCFYneHCi3St97Ya42oJIxh7?=
 =?us-ascii?Q?YoiwmOWwf/Ezkjf9NNNXGCORS3vdW0sJO3UwXsw3QeS/KriidBonlmes9Oip?=
 =?us-ascii?Q?NJWvJ3joqCl5yiU7H4ice/ts0dser/JVtxv8Ogm5QZQ5RNawSj4kdO5zE54b?=
 =?us-ascii?Q?EEZf3UghcW6oCpkXrzF/S7Y+jJdPO1H/tR7BwYhTJVivQJA0u3OAz12KhEOb?=
 =?us-ascii?Q?RpWQQoAVVmoG2Z1KM8vWf2ZHrc1tMhWKrn/JnjzIybG3L85dKq6GiBKk1yB0?=
 =?us-ascii?Q?f7vGMjLl/xR86LxKwY7cCBGEiUXi4yftdoEjAyl8AZsieChcV4tjn6tu3Q+c?=
 =?us-ascii?Q?MnZpzMt16FUkZfo63LNSiLPZIae6SyANX4cX4jh1N7MPFGuDiN0/9DAM96Yy?=
 =?us-ascii?Q?19DWJxG9Prapp/yXQkJ+TXhouc3xc/3hM5Kebf5o++gZ2AU5V4KTtKE1k5FV?=
 =?us-ascii?Q?hXZxO+R1sxDZQqQ1qZABvKw8arBP9JekjaU/N58z/dK0b/jIwoSlx8lWW5DG?=
 =?us-ascii?Q?F1xpkZecKQTrqS5ZEZr3UEDTSVbCGOKAkpzl7DEYHudOen5HwPlSSP6bX6mU?=
 =?us-ascii?Q?0cN1XRCCaZNi0s+eLZ8+TxyLYhBqwAfFhqzyHwei77qk1UuMdd85a/NZb0Ak?=
 =?us-ascii?Q?ohCUVZ5lyJpl9e1Nd08p+mUIZ2lBOIMmQXvLpWMwv74Zf/VRtPfY/iwRQ32+?=
 =?us-ascii?Q?kxBz6wfrSsCeaUVgAmUlq+WD79Hq8Hqo2InBw8HlP96lIwzuF//GQGDYmZXp?=
 =?us-ascii?Q?DpKbN4r5kVYWx/r+TJUnKXA2DCerOEFoaKQZiylBJzg/3NorJxBfhQy+vLRc?=
 =?us-ascii?Q?BGFT2RIuzBMgK90o/XEFzE0nrmRTn30g6OouNYWxuiEcUHL5s+d4OVeh4IMU?=
 =?us-ascii?Q?R1ekn35qy4dbe+Ao646fR1d2ALyWLNsZLEZcLH38gWg1vP2mUMhUb/IX6oet?=
 =?us-ascii?Q?s7sseO7MAi6XJwPwlBJGLv1OrTalletyLbe+a3j3Ky/Z0lMcbdGWXEytQAY1?=
 =?us-ascii?Q?pgLLBzcsqZme2OAxbi9uTukwDjmn39vrR1gfkVvkw21vm9s50n9HOpIvITgv?=
 =?us-ascii?Q?QIIDS1gEJpwrJ+2zN6pzKdvZ0DW5NCypjuYN1b56xNG02U4xvucWoB0er9Nv?=
 =?us-ascii?Q?Z2/R8ntaRUDCOgiCdZ6DreqUw2MoVBeBwv6+mFV+17E5RKRLHv60F2dmMrTa?=
 =?us-ascii?Q?kU65bD4UfTo+q9TqE7YZF3JNGtuWAG3F2SbHdHPRNsX/TphIm+QFuo17ngzy?=
 =?us-ascii?Q?LTNoxCTZuLVmhXNgwryG8qXHNgGUMengOMn7YoMm5WEXlbb7eXPMv7L5KvNw?=
 =?us-ascii?Q?Qf0NEd83DUhrWzMpzrbrnNt4ZTBg++mG4kjr8l6ES2R6/O439QX79K6bsBK1?=
 =?us-ascii?Q?PlhQQrUr/7kGBWx/18eVSuJGKQQrzmc/wyAKUB4pLRk1W16tXMTySiYIEmjJ?=
 =?us-ascii?Q?JfX8IVBkp5ItAIh2hAftJgzUdEob9PnP7mp6JOLvzVrFZDRcWszKQiE3uCW5?=
 =?us-ascii?Q?N6PF1Ks8sNb5faqtE1efYNWl72o+dNQgBBcLvf3WRFW4782g7swFEDhK8Kgo?=
 =?us-ascii?Q?SbN71vPMOFrFW9cR5fHQsg2AZj/vQjxjjr/INkll?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ec227b-7f1b-4aa6-ec76-08dc31871486
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 20:12:21.7110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3pWQzH/5ZeqiyyDI6TH7rIRTc+2rzjjvPcoQPvs1PD7qlWjTzgY6W5qTlqeu7AlUd3HLwWnZc+OB5f80O/Zvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4919
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

On Mon, Feb 19, 2024 at 01:50:47PM +0100, Nirmoy Das wrote:
> Error in mmu_interval_notifier_insert() can leave a NULL
> notifier.mm pointer. Catch that and return early.
> 
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Shawn Lee <shawn.c.lee@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> index 0e21ce9d3e5a..61abfb505766 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> @@ -349,6 +349,9 @@ i915_gem_userptr_release(struct drm_i915_gem_object *obj)
>  {
>  	GEM_WARN_ON(obj->userptr.page_ref);
>  
> +	if (!obj->userptr.notifier.mm)
> +		return;
> +

hmmm... right, it looks that we need this protection. But...

I mean, feel free to use
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

for this patch,

but I believe that if this mmu insert failed we might have other
deeper problems like when checking i915_gem_object_is_userptr() ?

No?!

>  	mmu_interval_notifier_remove(&obj->userptr.notifier);
>  	obj->userptr.notifier.mm = NULL;
>  }
> -- 
> 2.42.0
> 

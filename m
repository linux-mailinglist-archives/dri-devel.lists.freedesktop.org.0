Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490FE781C51
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 06:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28ED10E0D0;
	Sun, 20 Aug 2023 04:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB9210E0D0;
 Sun, 20 Aug 2023 04:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692504462; x=1724040462;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4QIYpmBgFGbcgHawk8ZsIMmpLhnNVjUDUJyJJ+8mLWE=;
 b=ADp1XMHBcrZ1qjwetkVJd1ZlBhRYTkkzyOCrmXzj2intzIh33qkTPQsh
 HXs8brxk9/moNNf/STeewsnnOO9tmtjHAkRGBegpdcqET2u8bROou/dEg
 Ir9p0UPUF9Z1ZCOfFO7rX1Y0cafqU2W0dLkMiHKW2beSQv5yjOamE4M17
 qrdqIM7Qx0EpPwMHfwN1Zm+4KJZoPRQ3mAI7Lf75kgGH2Uzi2qfngMbAP
 ygK/f71MGUkVVVN4u2Vz1O+1Ta7DflWITepDrLOLzWiatc+EUwCvHL9bM
 9EqO4iFlRSv+8RMXJRI0aMtwI3Y1ao5pKkVMLOt81ROtXo2FhCm4GfQ5X Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10807"; a="352953623"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="352953623"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2023 21:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10807"; a="712399931"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="712399931"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 19 Aug 2023 21:07:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 19 Aug 2023 21:07:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sat, 19 Aug 2023 21:07:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sat, 19 Aug 2023 21:07:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIInpZ4yApFLafASMcPt8aoX0mVwvsU1AID9Sx6+nR7WmVU47rNG+FRIYYy0i6GAVkUZzfRIn5B31q4g36pk5St+/Vn4pwDmhx+7MnX737ynNm87pdmj4kpJxK6WRzWrK8LBRlgct2ys1KlYygLeAG3q+mbK7n9HVAKoHs9r7ZhLQ54WWurzcw//Kzrng6YgeaC6g4vYmXRkE9WWAjguhhH2xjF4nvDa0vL3zdT17CHOMKyPD20QmyHWZPM2VrKOd9+u1eP9+YQFKxhW9gnSyCYEooG/C5Bpk0ipqNKWxhdbGallymDge4OR7Au3Z0KlvcCQD1TXq9x+q6mi7Dc9iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBzTN1coxHTFJpft28KgRzHrJqZ0nj7ehuketigrt5U=;
 b=kqz0oJG8fmaSi4hYS5QdWlc+7BJ6p+n8EFZ3RUKrf/HoTOlysnf51BEwten7UiOvAG63FSE6M6EwZfvLNT1WqvzutjFnEEK1Bw8DSl8o2+6Q/DnquIqom8HAQPL1utdYnhaiy3mVP4tTqphlFuvvPTE8rnyb2mTM8RCa1cqX0Uz1EnENpVQL3KfaYjH+ZU0rBUB+MxYSkso7tV4woZg5R1lIJs41MDtVq/K0nnqF3x6A/u2oTzLvomBSBlgPg42l/LvqpdzVEVyThj7YlomNEoM8fGX2cVdE7v4+js9HMOpO/4GKI8f/oURtAj+dgCkLOdVRBjGeE1fxSM4Vo1LA/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5339.namprd11.prod.outlook.com (2603:10b6:408:118::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Sun, 20 Aug
 2023 04:07:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%5]) with mapi id 15.20.6699.020; Sun, 20 Aug 2023
 04:07:29 +0000
Date: Sun, 20 Aug 2023 04:06:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/4] drm/xe/vm: Implement userptr page pinning
Message-ID: <ZOGRQX0d6tl1Q+V3@DUT025-TGLU.fm.intel.com>
References: <20230818150845.96679-1-thomas.hellstrom@linux.intel.com>
 <20230818150845.96679-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230818150845.96679-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR08CA0048.namprd08.prod.outlook.com
 (2603:10b6:a03:117::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5339:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a6dc4b-70a3-4806-1008-08dba132f8ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eg92Arlg+MV54XIOyBC58cfInYk23qh76wSoOPDL1yJfSb8ipvyQali8jMml3R4QiRCudXOxUwqWWTtTHR2HJmEOg1lFhl+w21jdPi4FvmzM9YeU2Zn82ozcEGjb2mHn3n/cv1rL0ESv1m9+V4Zvzxe+tqrdPEMWo8ha8ZTfhZTLSOnBxaFPUqtCme15/rXPL+5W7fB07gCUF+67TE/GpiK1E8KWx1pnDHcwTbba+YeKoZ476u/XR/mt4RIU4qgzgSvtcNiuGGFdRYuAXYoVjPhNYfU+gBAanM7x+LRPr8sdvZNrr6/tdPz/+2pqFIpWqdQuh+2wt3cmyHeXxrv2uvEtB8BjgNY7Fm1ns8OZawrZutEmWBY6p3td4xpsg2yiknCwhONPejVKBhkAYWVisOJWn1Sgv3AqndzT9SrQeZBkf3CE+Po05jbacJo5zGiUH0GUx+pBCsJW4XbEL4eHt3lXlZx74mYrjL7IUpk+Fp5ZOaEN24PbiwQhiHVQko+Hj59C3hlLhezzPX2MylxfR/6zJWMXZCepMjMF6hbn4mYN9gmfRv6Fu9p6ZiVbMtMyQ9wnZsUo/mxJmHuVg0f7uaV02+VBb7kO69ypzuaU4R8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199024)(1800799009)(186009)(86362001)(44832011)(5660300002)(41300700001)(316002)(2906002)(66946007)(6916009)(66556008)(54906003)(66476007)(8936002)(4326008)(8676002)(478600001)(82960400001)(6666004)(6486002)(38100700002)(6506007)(6512007)(26005)(66574015)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wxxFxFeEa4mlDfX/64snwby4UAKX6mvl072fUrbsqlB84bcTUr51zxkpk3?=
 =?iso-8859-1?Q?00h0GlP3mADT+DgMmXPAly4EX007PrZPTVdEDNq1S6jFjfGi0CsAfwBCz2?=
 =?iso-8859-1?Q?0rmijEBnsva50jVkRlJkZzSLau6LG2/coJpyLjMY3VwD+dFTj8Jsk0aK97?=
 =?iso-8859-1?Q?WAQRcf3zKqCZvyXGeAs/bT66Tvel3GKrx/p7aUje6B8jGOH1FfpSnegofm?=
 =?iso-8859-1?Q?1ahiITOxA7bXEx1aKLpIbx96Ahb2jBU3zhCcn9EmgXcQ+VMh0ZKVdlRukb?=
 =?iso-8859-1?Q?Nr5QGaKv2j0TR3LZqSJyU/oeGL5xizP5G6Up4XtBJyBTnmZkMu3AbjgoR6?=
 =?iso-8859-1?Q?6GecTZq0LPyY8LNwUdf+D96BjdTS2KZdnQo3AePgcf20uSj9qA5MzV0p4b?=
 =?iso-8859-1?Q?1ezgtkdlIFqEXWSiqSHUS2GRfPCUeE7teX2YdYysup0/reElH5rOak5UEQ?=
 =?iso-8859-1?Q?r9pONnssXWNxznYxPThWjYzy4L/gvVM+mVWM8MT+eJ4VhxRln8RUwX0Bub?=
 =?iso-8859-1?Q?vpb/uX7rv9Zlww6JfSRASCt50k7aoAyVUbRscYBpyl4dqB+bdSpWvwfLS4?=
 =?iso-8859-1?Q?uN/sTBS+27KIQYKFWA+6sAxySqtBTKzWYKcCPAv4JuGzxwdHPmSLUg+HVJ?=
 =?iso-8859-1?Q?PqJbz8wy3BbfErWoE5eIOMxwM99/upe7CQohRFX5Nb/fNiFXGjj8Klr0Cr?=
 =?iso-8859-1?Q?vBjSaEz+iPsebOoVqxk74SvtUONQl3y4UCuClZ6zdX+5uvqrCWRtfqd5Us?=
 =?iso-8859-1?Q?cM3hTdXOpxAwqf1vHFnLYaK1586YOR/Z8Bhv5A2m72o0ilU85AX0VBVOrc?=
 =?iso-8859-1?Q?dGrW0fdbqKkWvvTk7c8Ldp+258tm8tFDQQi4RtAmKwUGu3+ZG+Jp/9pSef?=
 =?iso-8859-1?Q?NkR22vFbnEykzgZTsafjS6XYI8OW709AjOmM1sUvtDMghLG2YjEth+328v?=
 =?iso-8859-1?Q?fmBaYg2M+m7qHVu/BvD4V7d36zIXIb8VcLmpBtUi2Fbsq+7i3SugfOmYYQ?=
 =?iso-8859-1?Q?VQTm7hG39X6cQFlyMeIyCrq9C12xiPkR/c9oYgelsbLjVM4mqfg9O94xxg?=
 =?iso-8859-1?Q?yxVPyqhO8E+1qb76TCQz/7Py4Okrb/QCUu3ANwf/CPjdqYs0GVpNIx+1SD?=
 =?iso-8859-1?Q?om50Kp1EtcxiXYCX83YQGnI8hRgAG7XWZ2enjIIEl1r5B2msi2xBRuMwT6?=
 =?iso-8859-1?Q?IEzvcxG5L0DQzuszwagv/e4fxRt8carX0FaCKCVxJOtD13HVB6tKp3LzvW?=
 =?iso-8859-1?Q?p/t6fQR1JZvLII3RwnzOhPmQIr7mdxc0OP4rRpdmBlPqogXrK1yXvqmrpp?=
 =?iso-8859-1?Q?Uc0FIrocvIBbiv9Ap7Fbgx5krUI9FY3tmCR94QdEHArolMEXRy7OJ9bWhw?=
 =?iso-8859-1?Q?1Un7nZlkdQ82EwDw5PeDn4X7kFOQRjyaj+gxJp4kym5Yeouz6LoxAEMB2s?=
 =?iso-8859-1?Q?mVNq9S6IFvQO12K0BwpviLagBgO3oiCQVl1tgd9HlTCjtagyEODhNP/Yxi?=
 =?iso-8859-1?Q?vDbX5uxpRDIMoUZobwJ76IkG1NlYmEuBmxDrpQ2b+7lXPx98hIeZu6bWi/?=
 =?iso-8859-1?Q?LcRJrn9mZRjTkGA+6IQnOByi1M4eIhWatw253sNmYX5IVzUdA2yNz6TOhg?=
 =?iso-8859-1?Q?V11akTdtef/o1fETHcpFlhsGrMvjzT+71Y7hxFuPp4gAEkV5Dn14zizw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a6dc4b-70a3-4806-1008-08dba132f8ab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2023 04:07:29.6985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S9+phIfEIM56WTWddQaymQlFlTJvErHGfev5ifQ+HMiH00cCSixOeELzc9i9yDJV9Qaf4Xa29o+LvoIQG6b9tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5339
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
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 05:08:43PM +0200, Thomas Hellström wrote:
> Implement pinning of userptrs between VM_BIND and VM_UNBIND, which will
> facilitate avoiding long hangs on non-preemptible workloads. But don't
> hook it up to userspace just yet.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 76 ++++++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_vm.h       |  9 ++++
>  drivers/gpu/drm/xe/xe_vm_types.h | 12 +++++
>  3 files changed, 74 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8bf7f62e6548..ecbcad696b60 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -74,10 +74,6 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  	if (notifier_seq == vma->userptr.notifier_seq)
>  		return 0;
>  
> -	pages = kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
> -	if (!pages)
> -		return -ENOMEM;
> -
>  	if (vma->userptr.sg) {
>  		dma_unmap_sgtable(xe->drm.dev,
>  				  vma->userptr.sg,
> @@ -87,6 +83,17 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  		vma->userptr.sg = NULL;
>  	}
>  
> +	if (vma->userptr.pinned_pages) {
> +		unpin_user_pages_dirty_lock(vma->userptr.pinned_pages,
> +					    vma->userptr.num_pinned,
> +					    !read_only);
> +		pages = vma->userptr.pinned_pages;

This implies that we can repin already pinned pages, I don't think that
should be possible, right? We shouldn't call this function twice nor
should the retry loop be trigger - both of these cases require a
invalidation to occur which shouldn't be possible if the pages are
pinned. So we likely should have warning if vma->userptr.pinned_pages is
set, right?

> +	} else {
> +		pages = kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
> +		if (!pages)
> +			return -ENOMEM;
> +	}
> +
>  	pinned = ret = 0;
>  	if (in_kthread) {
>  		if (!mmget_not_zero(vma->userptr.notifier.mm)) {
> @@ -97,11 +104,18 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  	}
>  
>  	while (pinned < num_pages) {
> -		ret = get_user_pages_fast(xe_vma_userptr(vma) +
> -					  pinned * PAGE_SIZE,
> -					  num_pages - pinned,
> -					  read_only ? 0 : FOLL_WRITE,
> -					  &pages[pinned]);
> +		if (xe_vma_is_pinned(vma))
> +			ret = pin_user_pages_fast(xe_vma_userptr(vma) +
> +						  pinned * PAGE_SIZE,
> +						  num_pages - pinned,
> +						  read_only ? 0 : FOLL_WRITE,
> +						  &pages[pinned]);
> +		else
> +			ret = get_user_pages_fast(xe_vma_userptr(vma) +
> +						  pinned * PAGE_SIZE,
> +						  num_pages - pinned,
> +						  read_only ? 0 : FOLL_WRITE,
> +						  &pages[pinned]);
>  		if (ret < 0) {
>  			if (in_kthread)
>  				ret = 0;
> @@ -137,19 +151,24 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  	if (ret)
>  		goto out_free_sg;
>  
> -	for (i = 0; i < pinned; ++i) {
> -		if (!read_only) {
> -			lock_page(pages[i]);
> -			set_page_dirty(pages[i]);
> -			unlock_page(pages[i]);
> +	if (!xe_vma_is_pinned(vma)) {
> +		for (i = 0; i < pinned; ++i) {
> +			if (!read_only) {
> +				lock_page(pages[i]);
> +				set_page_dirty(pages[i]);
> +				unlock_page(pages[i]);
> +			}
> +
> +			mark_page_accessed(pages[i]);
>  		}
>  
> -		mark_page_accessed(pages[i]);
> +		release_pages(pages, pinned);
> +		kvfree(pages);
> +	} else {
> +		vma->userptr.pinned_pages = pages;
> +		vma->userptr.num_pinned = pinned;
>  	}
>  
> -	release_pages(pages, pinned);
> -	kvfree(pages);
> -
>  	vma->userptr.notifier_seq = notifier_seq;
>  	if (xe_vma_userptr_check_repin(vma) == -EAGAIN)
>  		goto retry;
> @@ -160,9 +179,14 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  	sg_free_table(vma->userptr.sg);
>  	vma->userptr.sg = NULL;
>  out_release_pages:
> -	release_pages(pages, pinned);
> +	if (!xe_vma_is_pinned(vma))
> +		release_pages(pages, pinned);
> +	else
> +		unpin_user_pages(pages, pinned);
> +	vma->userptr.num_pinned = 0;
>  mm_closed:
>  	kvfree(pages);
> +	vma->userptr.pinned_pages = NULL;
>  	return ret;
>  }
>  
> @@ -721,7 +745,7 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>  	mmu_interval_set_seq(mni, cur_seq);
>  
>  	/* No need to stop gpu access if the userptr is not yet bound. */
> -	if (!vma->userptr.initial_bind) {
> +	if (xe_vma_is_pinned(vma) || !vma->userptr.initial_bind) {
>  		up_write(&vm->userptr.notifier_lock);
>  		return true;
>  	}
> @@ -976,10 +1000,16 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  			vma->userptr.sg = NULL;
>  		}
>  
> +		if (vma->userptr.pinned_pages) {
> +			unpin_user_pages_dirty_lock(vma->userptr.pinned_pages,
> +						    vma->userptr.num_pinned,
> +						    !read_only);
> +			kvfree(vma->userptr.pinned_pages);
> +		}
> +
>  		/*
> -		 * Since userptr pages are not pinned, we can't remove
> -		 * the notifer until we're sure the GPU is not accessing
> -		 * them anymore
> +		 * We can't remove the notifer until we're sure the GPU is
> +		 * not accessing the pages anymore
>  		 */
>  		mmu_interval_notifier_remove(&vma->userptr.notifier);
>  		xe_vm_put(vm);
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 6de6e3edb24a..913544d7d995 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -139,6 +139,15 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>  	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
>  }
>  
> +/**
> + * xe_vma_is_pinned() - User has requested the backing store of this vma
> + * to be pinned.
> + */
> +static inline bool xe_vma_is_pinned(struct xe_vma *vma)
> +{
> +	return xe_vma_is_userptr(vma) && (vma->gpuva.flags & XE_VMA_PINNED);

Nit, I'd name this xe_vma_is_userptr_pinned based checking both userptr
and pinned. Or just check XE_VMA_PINNED here with the current name.

Matt

> +}
> +
>  #define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
>  
>  u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 3681a5ff588b..9b90e649cd69 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -33,6 +33,8 @@ struct xe_vm;
>  #define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 5)
>  #define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
>  #define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
> +/* User requested backing store to be pinned */
> +#define XE_VMA_PINNED           (DRM_GPUVA_USERBITS << 8)
>  
>  /** struct xe_userptr - User pointer */
>  struct xe_userptr {
> @@ -54,6 +56,16 @@ struct xe_userptr {
>  	 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
>  	 */
>  	bool initial_bind;
> +	/**
> +	 * @pinned_pages: List of pinned pages if xe_vma_pinned(),
> +	 * NULL otherwise. protected by the vm lock.
> +	 */
> +	struct page **pinned_pages;
> +	/**
> +	 * @num_pinned: Number of pointers to pinned pages in @pinned_pages.
> +	 * protected by the vm lock.
> +	 */
> +	unsigned long num_pinned;
>  #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
>  	u32 divisor;
>  #endif
> -- 
> 2.41.0
> 

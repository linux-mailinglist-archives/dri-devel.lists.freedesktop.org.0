Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78D7ADB4C3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 17:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0012010E3D4;
	Mon, 16 Jun 2025 15:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzVAz5ZY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864CD8961D;
 Mon, 16 Jun 2025 15:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750086161; x=1781622161;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LdcwUe5eVqlxgiohYK5zjXP4EG93KYu43vNUyyB/58E=;
 b=nzVAz5ZY5JR8J0SrjM24vi52k9HUhX7mTHPTsA+RKJyUDpbZG9QMAGt9
 EY8qeKki+DK0rRbZ1qOsw0Ggqb9LWSC2iYb2qW0rjsYPUpQe5yC3ZVRTN
 b4Wt+r5vIc4L0wczJAm/+Pam8R4JfyUzfMJvkc6ek3VGd+Bzm+QUPzkc2
 Uj4/hVICDoCBeKZ+T2ncVelCQxDGDmBe6BiJOeJm9mLtrgwPWSA90w4aK
 /Q1hwSr9HARfmJRfS01Z+tMdg5peZbb9SMfDpQ/lMn9v2QOWhDVC0TbFG
 MvJiPkUviM4wUoo4iF43SYvrdL8UHMdTcIrLUpmeU/0xcSOts+6lBG5d8 g==;
X-CSE-ConnectionGUID: Mp4fidThQD6GBmG3Ef7hKg==
X-CSE-MsgGUID: /myIEzjTQq++TBGo8kH9hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52369231"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="52369231"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 08:02:24 -0700
X-CSE-ConnectionGUID: oU44syG5SdSEmcvLt7iKTA==
X-CSE-MsgGUID: wH4TS0GIR5G6BMw9to6Anw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="179389090"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 08:02:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 08:02:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 08:02:20 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 08:01:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjr0Z5E4KTBP0IHqP+ncqPlZcJSSOdr+p54WU0t4wLmSgHS10F4X1Slplw06NT9e2ObLo6Qjdp3iuBu6bn8b8Lfl2n7H4W568P6Z/guwRYKRAY5ZCPevd0/KcY6wI1/j4sPMRmvJfG/D0dn4iRaQw7/OI9xgCaHGDAjSfnYVXi99ZKn8a6bLklroz6ueYeLjtEA3pVWSLIzfp2/EdcRp01qiMY30yXLir/MKy5Y1gZWcRN+ylx7fgGt9CrFIGZYNWT0EGCjqCMEjXGJ595JnG0rHuL2BmAaW9z+taGhfcUFCt+3KSyFyxgKjSG7iuEXQzxwNoNQMvDaU/CkScpuT5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jx4Du5yAWLCC7/Rdd02AYHePrt+LJZLFedVzttFyXRM=;
 b=jqXnUUWI+aS3NyeGQ/y8UFmFZnZlQjgkOqEuSpyAVWPYRLHTH1uLvJcRF72pZIxQfReGlgQMU2nqPg8U+TOnbwqUk03UX/8cNNnH84c9DA59xyn5E8YmZNSwQ2we2mMXUMSgDakRvy8oTbIecUJi42YBrzVM6KuBu3jTdGXGlXxxplP3VCV4FFoDMjFEoz4wY/JnnbK6979kunDvL96uHkX1c3urHSMHI+oRssR3sKrdHUR11e+yLvFytbZut4+3SR/dqCw25nNuU4s4an9nKmFyai6moDgtminyatGzDIMkdHKi7DhO0XRkdNMPAMRXTehwjDq/ZBbJpeu46yShYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB4826.namprd11.prod.outlook.com (2603:10b6:806:11c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 15:01:22 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 15:01:21 +0000
Date: Mon, 16 Jun 2025 11:01:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Chris Wilson <chris@chris-wilson.co.uk>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Frederic
 Weisbecker" <frederic@kernel.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] drm/i915/selftests: Fix error pointer vs NULL in
 __mock_request_alloc()
Message-ID: <aFAxtBT7z4XphADq@intel.com>
References: <aEKvMfJ63V7i-6xU@stanley.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aEKvMfJ63V7i-6xU@stanley.mountain>
X-ClientProxiedBy: SCZP152CA0016.LAMP152.PROD.OUTLOOK.COM
 (2603:10d6:300:52::9) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB4826:EE_
X-MS-Office365-Filtering-Correlation-Id: 46330775-de1e-4f5f-498e-08ddace6a7c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2abdCfm3BnLzNfJ+Zi7rK5NKzyzMxvpOuW6DL9PPtG6LYvoxL+9qTc906/J3?=
 =?us-ascii?Q?zfac5jhPzM9D62kqAXanCaJODWln0dX5RRibgsZoiMnjqlnBE/50Qb+GgAVk?=
 =?us-ascii?Q?rYXiV1dkcAUGB3k2RY8Iov5npyCT0e5SKhC20K8QqlX7RQwvzd0pge1Ljmja?=
 =?us-ascii?Q?DFZgAc6PebNZxHoRgeROGPRQ4amoWDGFG3evmG6VEIbY4qVfB9ioRgbTsJOd?=
 =?us-ascii?Q?s3HQNd1FRwDxUtmbJZMa5XCMbQNPYMmDHZwHjUUBH1AJ9R4K1I7tlIH9IjC3?=
 =?us-ascii?Q?HmIFdDmA9VWGk9WYrIqsnmCAMuMntmaFq7uP4f4m3KZQfMqJlhSJuENse517?=
 =?us-ascii?Q?LMYH1tRrG4ApE2S6n3cjvsFxBg2k7iaqqYY4Rc826sgfvrDd+tJ87nAaRviw?=
 =?us-ascii?Q?Ctax8RlQsVFjNevW3rZqgVjz4AOLY39Yoc5wIuBLyB1ZxVwxhAp9Z6DbLTMv?=
 =?us-ascii?Q?J7jRwnHOJvQRcMs9Db9Hh2fGWh9cmXCZX55c97+Qku8TXwvlfSl+TMUAZM9M?=
 =?us-ascii?Q?xtAZ2X5La2AM6Ej42Nym/BTkGURGxQINMXZ/R4fjmBn/q/oX6YDVriQE1aop?=
 =?us-ascii?Q?4Q8qs/AoYlRyJ/rcBNxqRERxAZOgIagQBj7iugwzdjZWGL48N/U5s0jdyNOm?=
 =?us-ascii?Q?L0L+wVFnLq9KdkE6sowYiWpds8ECLCXQ5ZN9Npb+9OcC5uRVgZC1yW0oLiCc?=
 =?us-ascii?Q?qfnq3sBzvF44hW+uRiNYkNv9FFkXkLhcNf1zRr1x4/DD72QRlqLaP8qrO148?=
 =?us-ascii?Q?Sq8rUpf9RebgYWrSb+GI4ptXbzPH1YbtE/orwGuT2A8eoLBHGvUjzBn5PiLb?=
 =?us-ascii?Q?k5P1bof0NSoxuVC0427oPwpbBJcDAJHU3Y4f/BZcRjQtt2fMkuwHwrWAybom?=
 =?us-ascii?Q?GYW7wV87/eitgTU1oIXkI7s7qpubVNO+W8DsYUuwNj6VMtCtNJcIP4B460Lr?=
 =?us-ascii?Q?2YuEvs6T9fATkwGTeaNSTrX+QZaqeIrzTqltlXSUr/wJ4CLPUKP53zGBzVVl?=
 =?us-ascii?Q?VKrIFPwzcR0Usd4avB79mUlUWdqFseQK5VmG7cXSI+0vkqOVEvvxKGdzqxj3?=
 =?us-ascii?Q?a6VklkP57UikyXcwMmPkaZtXB5RBrMGVm5HkeJbBN26C00wUeKHGda0MPXF1?=
 =?us-ascii?Q?S1MYiChCIYZhzATKslu21VQBT5FCe2QfJRa8szqBEv+Ctlkulca7DKLbKtjj?=
 =?us-ascii?Q?yixXAQdnJe5yewip9nFGcV+KWJ4ohgAXKvjte+mffbhby7yIl+kGr9IEhVwF?=
 =?us-ascii?Q?nwLbhZOXSQcLQTvHxQahOzf4urqC0cZbVcVrnDmAXoI8Gz2Z7w3GlbcPgb6y?=
 =?us-ascii?Q?chlw9Hp44sJc6AYLtvsCASZlFGb4rXO/y2J8zfzCPO5ZovUkrD/DG8jvdCk/?=
 =?us-ascii?Q?fo3h+ph5VQFwnF/nSmBoco4K8rvGYNyzhnaZ/h/lmofGyE0rRw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RrvI3HITXHYieGwn1VUdV36GO2609xGXeugi+KTx26AfzRiZjfW/mzX9z3U/?=
 =?us-ascii?Q?0ccl17tUh+XvhQOqU/1FhV92yelI+Me9jM0cbojSgx8oRJd0/n+RWX5QYED/?=
 =?us-ascii?Q?H7jrtt+stlEYECiSELmIdnTwWBme2OCwuZ5S7BFc11A8cvzN9KflntPUXuoG?=
 =?us-ascii?Q?/6wQC8+vmCo2OWbf9TcASSnOaKW0M4nkJnnMzu/6pdj5vkUhIG7nSftHeeAb?=
 =?us-ascii?Q?rWh9WgB5G08zt7k3V6zMD9v4GO8BN50ZzAn7dV1UjTzOCNeybNo5i4agZuxp?=
 =?us-ascii?Q?hFDGbfV1V/p0jXHC4NGqPL8YfgxIhhJGGVvASBhMhtJ0GgsljisIAJXnTP89?=
 =?us-ascii?Q?zcmZStmbZpD3dgo9r3XSmio35tQCEyIIyeWe+0L+Tc1rAwOVW82bL/OXbq3P?=
 =?us-ascii?Q?gZMhqsb4SYairwYJy5uFPF+TpoVxabgYtw+uTwaUBpy3d6SR51e6MRTKctD2?=
 =?us-ascii?Q?Or5kl3tTKZCi1/Ye+ksntGuV3V61uX2wluM3Ir65GWE6hsMo4RxuOmGU/e4N?=
 =?us-ascii?Q?p6GhSnyyX1fgBUVJAELfraO3NDsBHuSIeN/FPIJw7WCKoOymNU0lXLrz6n1D?=
 =?us-ascii?Q?CSr8o2XKPe/k1NiF8utDxiA6OtbHXqM/olX2d9Nnbalo/9diZjzkl/AMSt7r?=
 =?us-ascii?Q?cNKtrLwZkMWrTRbf3gQDChzYvv9djj0Zlgjwj0qFVS4FSxA+i5BO3sBqL6tr?=
 =?us-ascii?Q?9i2YdkkAJiv/PFZshv3ihezGXUYfGEUsXjLqPAWO9eH81/onIf+q9Kkzt0ev?=
 =?us-ascii?Q?LXR6DtOQM5TAmuPCvnew6ZTp75C3OKEYL4kYdgQ2lfuJlgY0eEJ7R9ac2VNg?=
 =?us-ascii?Q?sjJ3FsKhmRWhgj2burGW4M/bk8YfPbD4pEPCmTwtmTD4ML4ahZ3EBc0d0jkt?=
 =?us-ascii?Q?/DBHcMGe223CmcG7RHrwpn88I93kZGXsLZElL1VEExPBXwK7jHfboGtBbHEe?=
 =?us-ascii?Q?6pYQ4CsJq+mms9AZN+YZMcf4rzqqABCI9AVw4xv/bvX7j89Q/pidKx1K9Tin?=
 =?us-ascii?Q?WAad7UpkySTHwzswsJb3hxyVaphVqWFdHjeedG4OEJQad5qW+tPui44r2ZYI?=
 =?us-ascii?Q?6Wn91kYzb3NPpfNBVobPvVJnUMEt21ossbAi+OmO4YJRuFxKVvghGM5ZAHjN?=
 =?us-ascii?Q?YnAZbvY8PhX7ltXvoiDy4+2VH41P4QZnFFSt4OJv0KXgs+j1o5pcpwkXvH36?=
 =?us-ascii?Q?vTMx/85ug9k/Nxdw84j3e4dkOXNRnkhs7Vqd4v5K6hNYGutEa5qeBjQLJ89b?=
 =?us-ascii?Q?FZTmFKEPjvvgrbdtimDHAYcptdsav1mnuRscy5JEP6WhPNlUIl8TRe4UDbvK?=
 =?us-ascii?Q?/YNSdzQCKQg552GBwzvSEzkG1wn8WFxJ5dhfO4jqvOW4Jlc1OF+Ho5nwR1Fq?=
 =?us-ascii?Q?oRZ2xAgiSTQt+VmjKesSUbn6HcUWtNEvH2wIUFvxuujR7TpAgmrzd7+7VxXi?=
 =?us-ascii?Q?Bx/gdlk2V4Y0G+clSHEFqzAahvhGMvFDey5h9i3QXQO1I2Z/GiWGLpMZcqnj?=
 =?us-ascii?Q?ZeFcUnnFZ4a68rCkmtUpLyL2LMVVBh/Iw4zbS+GGAHiPuzIfSo3YGVmf8Qng?=
 =?us-ascii?Q?dxj1E3kvvlXAxAgR4CtMV1xM9Cn8acZBBfWXtsK2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46330775-de1e-4f5f-498e-08ddace6a7c9
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 15:01:21.7389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZKKDrJoAIZ5E6aMKYx/oeG4BdnivfUy0gY2EApYAAysXMTUFfrP7L1sN91fX+YBpSC5CH+cQ2fGUpioSV5SGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4826
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

On Fri, Jun 06, 2025 at 12:04:49PM +0300, Dan Carpenter wrote:
> The __mock_request_alloc() implements the smoketest->request_alloc()
> function pointer.  It's called from __igt_breadcrumbs_smoketest().
> It's supposed to return error pointers, and returning NULL will lead to
> a NULL pointer dereference.
> 
> Fixes: 52c0fdb25c7c ("drm/i915: Replace global breadcrumbs with per-context interrupt tracking")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/i915/selftests/i915_request.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index 88870844b5bd..e349244a5fba 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -290,7 +290,12 @@ struct smoketest {
>  static struct i915_request *
>  __mock_request_alloc(struct intel_context *ce)
>  {
> -	return mock_request(ce, 0);
> +	struct i915_request *rq;
> +
> +	rq = mock_request(ce, 0);
> +	if (!rq)
> +		return ERR_PTR(-ENOMEM);

I believe we should fix mock_request and make it to stop replacing the
error per NULL, and make the callers to check for IS_ERR instead of is not NULL.

Then don't need to make up an error here.

> +	return rq;
>  }
>  
>  static struct i915_request *
> -- 
> 2.47.2
> 

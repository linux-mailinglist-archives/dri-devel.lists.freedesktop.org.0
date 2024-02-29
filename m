Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCA786CBA4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 15:32:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027A110E1CC;
	Thu, 29 Feb 2024 14:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqaSM1RH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9614310E1CC;
 Thu, 29 Feb 2024 14:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709217129; x=1740753129;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wMf7sFJVt/XuijSdp6odt/zy43GSnY+Qy6bmhUC5aD8=;
 b=QqaSM1RHIuiuviwIZVpqOiakz4NgU9oNFu8kclDztU4b1lgG0mkjpNdl
 uUMFFz/TjHDSUPxtZXJlPXQ/CfYzQ8t1JD5qWQUFBBQIPoCMlc/25AjIj
 ajIEyweRaHwDEC/ywJOav9QDy2yJPxbhCRSaOtbBYI2Sw0Ddk/rHLPt5+
 khzt6zHpPEYv8QHVFIam3Eyb5O8w/zJ/2Dm+DSwo33oM6C2iKq5VM094/
 ljikHTT+/Xj766FYMbwjp3wc2Nwbdt0ABOlUMvWAluxzmmtyrTRSkoNPh
 tq70TN7L++NUYiYjOZjpotI2EI60hd57FhCmvAlv2PukJUFjoXGBrDRsu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14395754"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="14395754"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 06:32:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8075233"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 06:32:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 06:32:07 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 06:32:07 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 06:32:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F79z0+pR5MYOkmXLPZAXeRcbKlWaXOOLtgZJghrECH+ZrGXeHWw1U9s+BVpTXpyFWkM86h3I44II3OSJ2tq+dDJGaO+vobtpoIzE/gMisisZeJ6TI3MozMwcJQLZXAzTmMJe6gqB2Oja1DcUx2EAqu4x4/Xb/W5z7FpZrU5y0T94xneZ4e05eeLbjHep7OaVd8jy7ZYWKsdM9W9XebBQJfJ0Jh3vrCjdaZjliJs3XYvs3/r73TbjtF46Fe/v30m8P6ZWYOekEZ9mzO+EDmmRuZfLvDs15gb3ZbYUK1FuUBtmAX9IIKGqZiFl5GCHR1xQwhFlwCGpFDZ4a/xndb8byA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XORuQLkGPDTWmIwvUw6vPmC9VGbarZg0mRq8agr2WTc=;
 b=dcEjx09rF9V+Y6c4ypxIsVkzth0OehczuT+6v7E8S40A78VL7B/yu9LsPauxfbLV4Jn/q9k7HEer49a1BIQ+TSq6F3WdfBYinZy5+Pa4Jog5ZwrqkuYue9P9byENHXNjNzX32+UPZncPPixeoD/VL/1iygMn9/JPQnypNINVNjDyptuleOveyIx4Y5UF29eWAEdB0hT+qWVacRCIZHXIa7MNK5WX+4ZtlY45zhyop9Ojn3D7y0XnpaPXlFQhSjSWS9qwF/7oF15g/L0+ipo3ERlxMHCzahl51j4nw4BCYOpAzRam6EwGz2Q+tS2AzvyF8TyZAscmyREgyYVM9Hfy8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Thu, 29 Feb
 2024 14:32:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 14:32:02 +0000
Date: Thu, 29 Feb 2024 09:31:57 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
CC: <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>, "Jani
 Nikula" <jani.nikula@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: Update email address for Tvrtko Ursulin
Message-ID: <ZeCVXUw35tPZikMN@intel.com>
References: <20240228142240.2539358-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240228142240.2539358-1-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: f038a901-e1e1-4b40-2ffc-08dc393331d0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CO1wMBQa3kDNg17cwiooXJ9QyZD0TUHfZw8UKj2wfEjSHpMcxOKPUoY1je+M0XJC7FzVYRtT1d9dCR23c2V90ZNN32IZudMrKZbKs4OkYY8dsTtmcZLf3JAFXcVlfgbiYZPTxvIp0DisqVICRsw3aMszRVYA/1qwHhay+EQAkt2xMb/Azk3aNWsLs8x3Yllh1R5wc3yoKn4ZWkAYOQ3c9fV4cPi6I12gucFsZ4D/zSOA20TKT6WQFBmj6OM3itUMSluy0oDRMVYJZGz0fLw5zXmrz93WBOVpPpCXDx7bUohPcRTKRh5Oo0/zjfgGV1vkjuYgwKOi8NfOn24GSRb+/p194Z43XdG7+YUZKR93FOGBG6FE6Bms9LUKwlHzOyPaNQQ07yPsEXKqDKegTgcDoEVQf+82EkV30qwUPdvaPpPWDLl9h7wYEET9pp9S0yhE7MokWOVrgIaUVEbuORVfDyPfdcfwbb7ro+RBrdgACFqr9ttjQA9REJQBeyk5KnHUcuQN4U7tFuMJEjY8ZNiMN0qGW8mhO0uTz3Hiv93QTxciqzkNIVAshX757ZO3ryNdWILBmq7Bp57zbr2XAUu6tA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LCNnx3iWsF/gvIboC7FJ/xaZRRFVWiLmTjzdUv36Gvl01LOhLuJybemZSo?=
 =?iso-8859-1?Q?a45+YDmUUVfuoeejeWxxfjl7TWz3gQUZzLMBADzwk6WiY28U1AGZavsfwj?=
 =?iso-8859-1?Q?UMKJYbz65DxYb01hKp2is+5PW/Lu2twegpvJMlm7XUYYf3x+pSlJlMM6H+?=
 =?iso-8859-1?Q?H71ZzetKx4tu7gCQc8U5VmwSxF44SaKOBoojpXAyfeaFDFXuLPPopQo8Eg?=
 =?iso-8859-1?Q?vUJAlitbTrp2UEDpqaauG/aec86erd6I/X7RkDLQ/5XZwP9NbNO2lMlpan?=
 =?iso-8859-1?Q?LC8+mZYpT5fyn/oIpTtZjvhFIWFY/on3i7zaF09D6ob8j1QBQYyhOjQ3cb?=
 =?iso-8859-1?Q?JblPiTcwCwrSXtiTzigqaWm0rBKsPGlpaXQvSLJezvXhvb8l/id7KoLvEK?=
 =?iso-8859-1?Q?lncGkZEBSzB0fI3fY9s26tLFs4Uq7OMcfLwKLVYfaRfMfWiBr97SmWMKAj?=
 =?iso-8859-1?Q?l9ouaviMi/2QnxbYCAUgmwPo5f/d+BvqGMVcjLm5PtOIqB33gKk5bVqbMG?=
 =?iso-8859-1?Q?7Zy16jjxuDh8dY2ZWYzuWvPtcnHxKU3nLNy444wzVJa8f4aNP04anbXyU7?=
 =?iso-8859-1?Q?YzoqcPbsA/gRMu7NhTG0tgAYEmMNmu0s3wOXNCKnc+eq+X1KwMWJZZWuAV?=
 =?iso-8859-1?Q?Sol7YNZeMQjBKZTaDSu8QA5cq4keyKUM7bBlG1sgcwMbuCtQ9t9b86XRal?=
 =?iso-8859-1?Q?GeP0ujSSDpiGeNqd+ivELgKJyNezzrp7meM0iltlbs4/dXkffwUMqQAdDx?=
 =?iso-8859-1?Q?+5LHwTG4+e0XsHSfBsgW+M5ClkyMNIoLSMxWS0DxcrrnwiQdJDLGnNJics?=
 =?iso-8859-1?Q?WCb9F68xOmzxO0WfvvCtudSQEaa8klPsRbU0Lr/X9EsixVLe9XzzjPo0kh?=
 =?iso-8859-1?Q?u3n5qEHigaId0IczkMnPnF4E2rkJtTWOcndwXQGedvhOHNcrb0YegBAxON?=
 =?iso-8859-1?Q?eTqaKBMM2ajLvdwmvtQOXuG66Ua2SEUztkYUcfLw6gFILyl/WOI4LfKZng?=
 =?iso-8859-1?Q?ddR7nsDkJHtkZgeDpsSe53+OXCD0IwBBO1R/3kNXTkjM7E8e8iOPKhFAJj?=
 =?iso-8859-1?Q?AF3AVRbPohraaL5q9bKblCJ0CUW23pKo/LdSd4d1X+0ry6iu1wNikFC2B0?=
 =?iso-8859-1?Q?KoHVCMkq94h1iFvQ4yYAsbpuFCakipm/8boJlCNop637vtEfqFOLAPXb8u?=
 =?iso-8859-1?Q?Lf7NoDy3kYXV53fbKgzgFCljQs8dlHpHjVi1VptxU0hLZEyX6ZadWdcQru?=
 =?iso-8859-1?Q?qcyXwns/EYD6k6leZIcXubMm5CEmoXo6iYg7gn8OH1dVK1j4kSRwMgLFab?=
 =?iso-8859-1?Q?Q+CQzlb6gMfUSODNNzgIQeyTeorf5SAeZwBkpJlcW+vMTRETq4m7XL4oqS?=
 =?iso-8859-1?Q?IAHbdb1HOXViIQ0QsQwTkfvVxXqQmideWTDRPT8KfDZV2KKiajMPdxz/8q?=
 =?iso-8859-1?Q?73GIpv/XnHSiz13jGo7240QBERF3El38H3C+wsUpLFsKY1NKCH3Uhk6R0w?=
 =?iso-8859-1?Q?cS6okOKOS2QLBr0dfZG6qIZNHNdsVL6+O/L6vP6JYX3jx2ILyqiKFSFGXd?=
 =?iso-8859-1?Q?1ZAaEoB7VnXpOhCK+66gJmu40UbVoXhyhxwtKN183qYkHb9zxi0gWnSeyk?=
 =?iso-8859-1?Q?2SeCOgn590q1kybP5Q/bfswTblKt12IS4f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f038a901-e1e1-4b40-2ffc-08dc393331d0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 14:32:02.4806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+Xk6Byb+1k1nsn/huiOKLJ3ss95V8UDwxztDtvhp/5e0bJoDmlleqgtAJoHG+ogIiXvWhNQnDgtrFioP6MjLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8414
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

On Wed, Feb 28, 2024 at 02:22:40PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> I will lose access to my @.*intel.com e-mail addresses soon so let me
> adjust the maintainers entry and update the mailmap too.
> 
> While at it consolidate a few other of my old emails to point to the
> main one.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  .mailmap    | 5 +++++
>  MAINTAINERS | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/.mailmap b/.mailmap
> index b99a238ee3bd..d67e351bce8e 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -608,6 +608,11 @@ TripleX Chung <xxx.phy@gmail.com> <triplex@zh-kernel.org>
>  TripleX Chung <xxx.phy@gmail.com> <zhongyu@18mail.cn>
>  Tsuneo Yoshioka <Tsuneo.Yoshioka@f-secure.com>
>  Tudor Ambarus <tudor.ambarus@linaro.org> <tudor.ambarus@microchip.com>
> +Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@intel.com>
> +Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@linux.intel.com>
> +Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@sophos.com>
> +Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@onelan.co.uk>
> +Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko@ursulin.net>
>  Tycho Andersen <tycho@tycho.pizza> <tycho@tycho.ws>
>  Tzung-Bi Shih <tzungbi@kernel.org> <tzungbi@google.com>
>  Uwe Kleine-König <ukleinek@informatik.uni-freiburg.de>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 19f6f8014f94..b940bfe2a692 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10734,7 +10734,7 @@ INTEL DRM I915 DRIVER (Meteor Lake, DG2 and older excluding Poulsbo, Moorestown
>  M:	Jani Nikula <jani.nikula@linux.intel.com>
>  M:	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>  M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
> -M:	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> +M:	Tvrtko Ursulin <tursulin@ursulin.net>
>  L:	intel-gfx@lists.freedesktop.org
>  S:	Supported
>  W:	https://drm.pages.freedesktop.org/intel-docs/
> -- 
> 2.40.1
> 

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4142664B8D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 19:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A986510E185;
	Tue, 10 Jan 2023 18:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3518A10E185;
 Tue, 10 Jan 2023 18:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673376608; x=1704912608;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E96XxHyC7utlvi+vVrGbuu//pcUN8/nY88otrZrVJ0Q=;
 b=ObnFH8K0sSFNzJsCUS2fMZUNbCm2QdPbDg8+f9g6XM7u10WkBaBTYY9P
 3HP24/95tZAhj84ntXwD6tDMvOlv97r0T9ckpVhida19LNzSfyOcJwiOD
 BYeEvouyKnB3G6QfeUayt/iACVx3ey6xIohmgOB5aiqaifdPS6NKCVSgB
 BOCuyqmE4RFF7w84XEcHxs14VYXr+/+aL9fJGweHk3EdxDJDK+a8IQBFb
 dIN0fbqnPD0XK76vy3Kq62oM0Mjm7Z5qGJdI5L523b4a0H0ciBFlhACs4
 I0HxmDYWDc+WPYjLLvvmC9rmumRVE3CvqEqrNpdyxkB6c+1eIRqMdriye g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="350452119"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="350452119"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 10:50:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="659085919"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="659085919"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 10 Jan 2023 10:50:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 10 Jan 2023 10:50:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 10 Jan 2023 10:50:06 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 10 Jan 2023 10:50:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=foKZihhJmpv2OTT7tDYWd5f8Z78Ro2+wXO6fkhFtcs0UfBqp+Rs9vDgAYjB1pp7THuSKMHk9QaA7lLZDYK6/IcwhNVABqdlqAXuBMLiqGC0VCs16IMHuB5rhK60HK+LsFM/V5WDvpDM06ujxOqKGhKiVI2xJlZrzzgc9cShP8u3P65r2+Afl5KDV7PA8MYm++Q2iLpoOOC9nuw18tJAHSvflnxBiN6GJhTHdy4ZpTFGVaEXe43YjKW71V+Upoc1F5zh53ZU3jQ1VutcX8YQrm2X/qDMwtvpA7zB04hvdzVtxaxOpqf2hXmMqYjHQbOJVZM1Tc9btz5t53huspUxRww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLYQxx8x5uo7FB3E4mQ66LNYXkimZHIOCRZBxP8E5W0=;
 b=aVN+/XFx+ALWK6a6zbFn1j+rHWpGvZKuKPPWml0kxJY46qXQSPys0IXe5i3pk505bxwE++lH877RtlJHmoXEg3aizJv26cVlInvjTySDzVDqw2tQQc+Jg0gXezOOKDICvNw/L7zuKS2/+baZHNYM9s3AahcD/MfuTEGuNKXzV1UezajEgQL//O56FrZLDQDCT3NzbzsE/QiLrVNi2hP5IMvrrTlq2/vBinFJCh8KPHKAWl6wwLFtKkLQXDCxQrG4iZ/6KfykZIUW6jnrMWwVF6VkhmIMISSngMisUZ9zWN9XcrCmQlSmdinqAVcUtWhnDu/cmCcoZdi1uqQzQmbguw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7089.namprd11.prod.outlook.com (2603:10b6:806:298::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 18:50:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 18:50:02 +0000
Date: Tue, 10 Jan 2023 13:49:57 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: Avoid full proxy f_ops for vgpu_status
 debug attributes
Message-ID: <Y72zVXYLVHXuyK05@intel.com>
References: <cover.1673375066.git.drv@mailo.com>
 <188df08e0feba0cda2c92145f513dd4e57c6e6cf.1673375066.git.drv@mailo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <188df08e0feba0cda2c92145f513dd4e57c6e6cf.1673375066.git.drv@mailo.com>
X-ClientProxiedBy: BYAPR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: 79008600-26fb-4861-122d-08daf33b7b32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1wPBK6aMq8UoQPX3b/6EK1LNkAgs7Qz89JR3icfvy6s9W/JKBcZHmoOg5qFwXEuBkIalglgi/YlHC6U1WKXCRJ/zEVtWUpRqN18yiLXkWnnsZzxmpmsZE894NPlbzjtDM3pTL2C/na5Ye7lLyV00KnsLewE0dHosz+2fQUypk7d9GC0b5HFtYL4szvp1A3Rj5iYRZXiyLf2dQVZrfCvW6rlkSr/VPkPvjdWT+D1B/wMLSOu2CRbKLscMZP1l1ts0mnBYyKhQC5c7N3aiUY9T1lLUfBDaIZTs9NAu6VuiIbjkdH87Kw+TknXQ5asHNR1NGjRovvw64JtVoEkRWvw4T7doVj7ansnMoCpWRnaCL4g2GBsBar65V183xGW/pg/WmKzfan79fdMh68O98PAQiAlW2gOfzp63BGG06mBp670ijIYAqcKRoQ+goIFNIuMqsUMdZtUDVtZaGpMMDwhE2JnQK7MpL9InbAiIgyt0Nq0RrSckQZSTCyKAmraefaz9/ft4nnj6MPcP6NaOYBTYkw9HqdOqyFbNDXkHpqhPiLMZPWQBzffv5TK27vwxGiubrXq+D+BgAlfigGNlB2WXyzI/2gb6l1dt1kCCUVAUL7yxVR2/iNnwaLamIgBO0Jl2aCgYDYuODnedqDJgtjRgtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199015)(2906002)(6486002)(6506007)(6512007)(26005)(6666004)(478600001)(186003)(54906003)(2616005)(66556008)(66476007)(36756003)(6916009)(41300700001)(8676002)(4326008)(316002)(66946007)(5660300002)(44832011)(82960400001)(38100700002)(83380400001)(8936002)(7416002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6FmxYUQXK4xCMaDJBhoC/DvXnejbz6DJrVzrNHZasW3i0Ghd4vJ5FoqFm9lc?=
 =?us-ascii?Q?+/eAR62rP5MYKJccnQd+z1KQO3Jz9aeoa/td3fcZ9oWvSxAIZgoBU/BvOM2i?=
 =?us-ascii?Q?IAAVKEb3qZT5ECvytL1AVSqRwHfqKoAuCDs3OydQDNTH6B+//Ubrb3LBMGhs?=
 =?us-ascii?Q?L3E+ltZ/On5PzSLqi0tGAHxHdOb55Y9/iutVLvY5miMIbrllPz1A9ZKAlTv9?=
 =?us-ascii?Q?ytVRjHLKkxgu659j51BxlyDNqj79CqL970AKYXVGRUR1pueSmPVrAvlB+0bF?=
 =?us-ascii?Q?1bsVgD24X08Y7lkq4PdlQF2jM8fEhJhc2iuUizwJzROeYllQD/3wI9Dp5/Lt?=
 =?us-ascii?Q?+HMabVDamYaObj0LtU42z1c+3KEYRF/AVM1pypuU5zKIo8c5eaQcQ+OZVdzp?=
 =?us-ascii?Q?fsTNM/Q8MLuuupGBsSQXHn7A1Tk0uArlp4L9D9s4Pxpl2tUGjlyWjT1iG/Oj?=
 =?us-ascii?Q?zconCt5LuyZS+YFyr34rYmbiYTGIoG+GS/XEPGHmibzaHkK4RXbeyovps2RZ?=
 =?us-ascii?Q?nYNRimRBuswD+KhxO1B8BCrH0IXfpNl7kyBZkfz9lQe7alNfkPlbOtSva6ql?=
 =?us-ascii?Q?nXwicSq8AxtfO8IewGIYlls2KbwWj8EBx2Svo5EoTm2JppMtlPQSQRO8TmPp?=
 =?us-ascii?Q?pd7xVb6D0ypvNqnAKOFUYUUW2BxWd6MW7Qsj0CbuU6t8TYX7taU+s3uD/WEo?=
 =?us-ascii?Q?c4rBVKH3sCOY+gR6+xC8dcRmQsKz69kW4sj9gTU6b1kcvQfDEjCmh9zxSLmC?=
 =?us-ascii?Q?0CDopD1RaDA2G6qHqmgf+M4ozBsEM6DXi2JtOGgItbI9HYIDtDNc2QAwoXt8?=
 =?us-ascii?Q?mO+tKc8PKFScU8MA0HNt1UQTwgRhMygJKS7DrMzBKSBZFT8Q9oqMmyndhPlI?=
 =?us-ascii?Q?mSkde2TT8Zdb1L6V+tQS2KasrciFAbyjFjlLJei08EyiUbOVNEAa3xvC77lZ?=
 =?us-ascii?Q?9Ipna5ezU9qJdIEcDBsO8k8VrqhQPPRJJzL23XVahF5+btR8k7Cgx6rclSr4?=
 =?us-ascii?Q?XOdbmmfRWXEqwuP4ZEPcTrwJ4Mb8dO1YUQMasjT7ejwbT5YgaEcDSUYApux1?=
 =?us-ascii?Q?Z8alVQWLYWlSVrbCtuj2aIfJJlBn3ny35E8V6PLSPwj3bJkZqqAobH0geGDZ?=
 =?us-ascii?Q?38Xo23MhoAwYlkO6ob5VkkozvmWShfHBFWHZ8GxzdJOcH8QNL4t2Ejvxcyhz?=
 =?us-ascii?Q?Khl7iGdZ35K3F9BAOv3AN5itJ5Ziz98anV63eOFuod6MZlOZ+0D7hYzUKS9L?=
 =?us-ascii?Q?tylNm74Pgx4EX12X5cR0TUodAGCemo9UytHRpIngpQ7VqR7RGF2cepf6TRb7?=
 =?us-ascii?Q?iHhJh3gkATryXd5B5cFZTbD+VLglSpu1u6Dh2SXBvLluvUHFbmF5Fd6951f7?=
 =?us-ascii?Q?hEaPcyz2p4KgNjWNl+ESPIiLfjIzjUlSzeTo1f7vyDatGMXF38qMu2oK7i6I?=
 =?us-ascii?Q?Z5aqKR8H6MwBdoJD4VKEtbrx5CBkVfqaXMlHX1XWWrJcW0CvZsnai8i542LC?=
 =?us-ascii?Q?OOQZoeAGY45XwlTj31BBO+IfGCjBTyzSAqOLBDjyjBZh2R84RUDO9dQibW2r?=
 =?us-ascii?Q?kl2r+0kbKK9yY3dWbYSInWaNmRpHpoyR/yVcbY2kNAYDW7/dTErWKHYk06NI?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79008600-26fb-4861-122d-08daf33b7b32
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 18:50:02.4969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pUE0iLyOk6uKp8oMBHiQsZtw/8LrlFNGwi/FejBGbIazfoXixQdDGoKO/XpwL3TTomYID5RvXGMwT33vfMOMRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7089
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>, dri-devel@lists.freedesktop.org,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 12:00:12AM +0530, Deepak R Varma wrote:
> Using DEFINE_SIMPLE_ATTRIBUTE macro with the debugfs_create_file()
> function adds the overhead of introducing a proxy file operation
> functions to wrap the original read/write inside file removal protection
> functions. This adds significant overhead in terms of introducing and
> managing the proxy factory file operations structure and function
> wrapping at runtime.
> As a replacement, a combination of DEFINE_DEBUGFS_ATTRIBUTE macro paired
> with debugfs_create_file_unsafe() is suggested to be used instead.  The
> DEFINE_DEBUGFS_ATTRIBUTE utilises debugfs_file_get() and
> debugfs_file_put() wrappers to protect the original read and write
> function calls for the debug attributes. There is no need for any
> runtime proxy file operations to be managed by the debugfs core.
> Following coccicheck make command helped identify this change:
> 
> make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>

I believe these 2 gvt cases could be done in one patch.
But anyways,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

for both patches... and will leave these 2 patches for gvt folks
to apply. Unless they ack and I apply in the drm-intel along with the other ones.

> ---
>  drivers/gpu/drm/i915/gvt/debugfs.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
> index 03f081c3d9a4..baccbf1761b7 100644
> --- a/drivers/gpu/drm/i915/gvt/debugfs.c
> +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
> @@ -165,7 +165,7 @@ static int vgpu_status_get(void *data, u64 *val)
>  	return 0;
>  }
>  
> -DEFINE_SIMPLE_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
> +DEFINE_DEBUGFS_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
>  
>  /**
>   * intel_gvt_debugfs_add_vgpu - register debugfs entries for a vGPU
> @@ -182,8 +182,8 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
>  			    &vgpu_mmio_diff_fops);
>  	debugfs_create_file_unsafe("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
>  				   &vgpu_scan_nonprivbb_fops);
> -	debugfs_create_file("status", 0644, vgpu->debugfs, vgpu,
> -			    &vgpu_status_fops);
> +	debugfs_create_file_unsafe("status", 0644, vgpu->debugfs, vgpu,
> +				   &vgpu_status_fops);
>  }
>  
>  /**
> -- 
> 2.34.1
> 
> 
> 

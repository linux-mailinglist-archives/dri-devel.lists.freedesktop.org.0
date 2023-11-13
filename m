Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945A07EA4D4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 21:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1CE10E41C;
	Mon, 13 Nov 2023 20:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD7D10E17C;
 Mon, 13 Nov 2023 20:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699907525; x=1731443525;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zx1dlxvsNtozJQDyNuB5aHzbJpMbY4nMJeph1AXuLLU=;
 b=g6Ooo4Bi3J0g3yK7weQ3mI2UuJsyHkXtzjKz79kSxBvxlTry8wEL5HNp
 KxwAJjLugEtZLVpDLTKX9ReL3eIdU9Yy0Dau0JuogWRge5sJUoPNtzP/y
 Ry3OJ87Kk7o33B3z1CdMTIXU575uU2yfY5gRS4gTC6s63AE/ipYFhXpHd
 z78F/J8dgGyrujNdqvORtqmBwWrySgIQapf3f04MI1pIW76wdzSVGcVhx
 NBw0ymZYvxDtVHxQaO6zNFUsJjCZIfMthz70KBxNj2WfGKry0eD5fiRH2
 xOQgotcfjP1FHz/1dscZUjoLp7jKF1iimVGkU3Q98/zQl+sfFSO5BuEQW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="476724210"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="476724210"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 12:32:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="5779285"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 12:32:05 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 12:32:04 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 12:32:04 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 12:32:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2Tq33wPMb1zz+Xbqwd+kVKUIcXghETxcKc8+6hNFE0gF32Oini1IhV6ozHJbTyBK/4ZdCY15QgPa1Wo1teK3fK9sePpqHDOHkerJPmf6LfdEZLAX6NdAn1yCBS/WA6nfQYwKrMRhZPrwP9nGv0CJJwLbiMXQhMlKx64NOqKiQSBFlASl+PDZY/2NctyyFjCdt6llCLEQqGi2w6ElLiUkFH7/Mk09hwqy0SiFPvrTn43pFBlfnVG6VSoKEHkjYcOeumw4a6GbchENAPqxg/W1jJJlMmuez8FjtIVy/xa2eS7ggz7WeOakgpUT8RT+XrrHkzn5BhEaxck7AzMqvGLvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dx7kXjM7I6gF0IfE/jHdGpTL/dlpL+opQ0EXmjJrwE4=;
 b=E7a8WMmGwFeOzb8P8BiEAMMCI6tgAwO0UxqMnPpAeO39WgvRqrSe5R7QXmHoT0W0x1Di2HcVQ+x7Nv35lJpKjsaZMBzBlLO6TqcV4JDCHAbebr38ACxCam18Oygq4jfADXUt2X7fBzufvSIwgNO0ghvyh6y1Qcy5VXxIHzAKImXhwqa36wTA/V2V2sAYItoB+AHPwPfqutj0zBhHG4n2SVV8uLXCf3tUIEE/O5wqAGAgREgBqfhwBcylmmQbfT0ohANg5lEsgozGf1sBDPMLT481P3Lj/E+peEBaxuJQYaaJ8U/1n102TLuEUJd088l5U0BD3wxKNQLD9UOYP1nLpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 20:32:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.028; Mon, 13 Nov 2023
 20:32:02 +0000
Date: Mon, 13 Nov 2023 15:31:56 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: heminhong <heminhong@kylinos.cn>
Subject: Re: [PATCH] drm/i915: eliminate warnings
Message-ID: <ZVKHvNqDsblTfJ8A@intel.com>
References: <20231113033613.30339-1-heminhong@kylinos.cn>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231113033613.30339-1-heminhong@kylinos.cn>
X-ClientProxiedBy: SJ0PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: e453e042-321c-45a8-7ceb-08dbe4879785
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2d37S3/P6nAneF2nOf6YAWVqLHXpxywCOMVpH0Tl2wnuAWLTxF4z5/SzTR5bHcm2UmDeISkHmrs587au7xBz2969dTYDeAzYFGac8PUQ8daVdNA90njbzIBbZlxQilXC1voG0KphAodd04vtxmU2cu04YCg11Bl8V8D+/dXPmFlsGrU+oHYSAek7FrDw3ivDKim/QwDQkdxwoMtV7hI7fA79gqIqBfeoH6/1IbpiMEkcDC7V3NM8Ch87ePXNmUfkheQSquok4p3ZZjzLy2wPdJROxP0bg/U1UGMKp1Aul7h2QPIAtgKVsqxuYlfMKhFKy6wVgfYzV0PTVb2QsME1K+D+j9u3hz9aoPxCDZiAfiEIdx3T/I1hwCSTXcbqKgKnLaleZ1dFlFwFpArY7YeSyj2ExZlpkG3al/i23sBoFWTEV5fGU6Pc3JMh2AJcnNdo+75a0nfTXoCIK4KZXCWAyq+wx9QYwAk0D81jVd2Q/I4TwMPipR1nUQS1Zhghl4AGb9l6HKrHtYVB1MGPfxyxC+k354Byp7CaQ1vB2iW581B53gL/NiXueF6pLrKkfdHy3JAU+EzYOm6sbY5Zt6Cr+f8wu8ikRhHlXhgp7WqLcI/ie05KgW4NWN5h1gQB1v1C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(136003)(346002)(39860400002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(66476007)(66946007)(66556008)(6916009)(316002)(38100700002)(26005)(86362001)(82960400001)(36756003)(6512007)(83380400001)(66574015)(6666004)(2616005)(6506007)(2906002)(478600001)(6486002)(5660300002)(7416002)(41300700001)(4326008)(44832011)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?w054hm4jYO/fFq74mCNfQ+ZCqepGgIl6HYpRMjjCbKGKAg60qDj+nKY8/v?=
 =?iso-8859-1?Q?g24+KIMJNreOGC6BMNWrVn9DTeRuO5vMebi96N4HUdedyyM22xRnIbeyb1?=
 =?iso-8859-1?Q?yHCP7W8C4hxVywprdXLBN+700HlN6nae8CL642ZmRTa8i4o8Wew6worjBy?=
 =?iso-8859-1?Q?FlBsrUkBqU+0U/oOfqG1W8eZjKZmYn2Te6yVMiIM4u1BSoiu6cfrEcyoUh?=
 =?iso-8859-1?Q?U+LkfGnFHySRt7oZaH/WZnR7zmI0AL1Ie40A/dUC9N71nMbt+5jaz2QwxJ?=
 =?iso-8859-1?Q?2hqv6HoEOhRoCQ3aFt5zZx3eQBdZhqHl67rmJS5X/5I/8b4v7swhMVVFfX?=
 =?iso-8859-1?Q?D03dMNhnzbIyvAUtDdg+dm8wD6wzGxl8e+bwccztZ6ZJqhAK3BpicWXN09?=
 =?iso-8859-1?Q?6aBSaVqboWdO13PobvyEvCrp7P6EtZmO8jjKF2WxJbiYTz1WYXX70wzqX5?=
 =?iso-8859-1?Q?hdWEPpqmuYEp3MvwsZhNwgaiDaXBV9XL3vYnl+ISvsvQPayczu0xyZ7Odg?=
 =?iso-8859-1?Q?dnz64XIC/Iq6g9wF9ouMBfHZi4nMWNub1MtqUMD5pal/NW+WbmtyAZ4PuG?=
 =?iso-8859-1?Q?//mgMROU/WuUrmmFAZPTv7gMhTXO5eNKdYVZ+354osezO+gva2gYtVGjOD?=
 =?iso-8859-1?Q?a+hkwxcA+oclupkagM0ukbBI8/totxZ9vOot/YDjVBhbeineeIQ+65z3jZ?=
 =?iso-8859-1?Q?WDqFfJu6a9h6lihLq0jF2moFzKWQAjhxCJYEx5lwaIWMLBt+yLdYNfpj1N?=
 =?iso-8859-1?Q?pa0g9sLIoQcDE6Fmh4uttMDIOGzHmze23GruFI86ETEbhoTLQpuhtN5FtQ?=
 =?iso-8859-1?Q?NAXf1hXR6WEdvZeGq3xKFuVyzEOPy+wVjn4qj3i+0yjwn9Pym24jQnetUg?=
 =?iso-8859-1?Q?bGNl3wH8gdacA3/ufZvYpzOQWCmQWJm8vH/4EUOCwl1IXAwlpb1aqN4IcU?=
 =?iso-8859-1?Q?LIMwAWXTRHp9xW8VYAs2ljPixn0e34dBiJDSPGiX7SNtSHElsfX6nxJA3r?=
 =?iso-8859-1?Q?6aIKwKUP60VZrzuKtVJVGdejZGH/nsp762CTsaXtJA1X0SrWxSi7GDQ+xM?=
 =?iso-8859-1?Q?OEHglXp+VFxriFoI/+fyibVbMmuJg0U4APcrsBmJ7jv1H7QCTjLzeR3Eim?=
 =?iso-8859-1?Q?dKjA4PHH82l5JYm58Rg1MFErahYGxhPEhUgXuWK0iwkQCUIyinKCJEZYTO?=
 =?iso-8859-1?Q?K+sZ6/BwbAOPgLfDfSNtQOQfL8FwxtQPGUvB+vu7F405QQATksPV0nARkX?=
 =?iso-8859-1?Q?Bb5G/dntxgStBwhoWVFXItXURNJMGU4tFseoGiepwo1bf1nc5MCyJ3rSXq?=
 =?iso-8859-1?Q?DB7EAWONCFDTTtOV67cFaD16T+pb5HxTXD7YAQQJYC8esOW8hcY9O3o4V7?=
 =?iso-8859-1?Q?zXytzgfr+9WzC+0XnKHNioR4Wzc+XsDZCKM8ismrgNbGBc3y5Y7PTG+r7l?=
 =?iso-8859-1?Q?GEtR65iKjwUoKUAj0iX4nCNyunZ293TbsLRVRy+i6WAGGzecd0J4Gf9vH0?=
 =?iso-8859-1?Q?E5Pm9z1SBllTes3V2JkLDKgaoKWvG3BXUnY0UoxrFR6gJF7g0ciuoEgz+i?=
 =?iso-8859-1?Q?uwnfyCO7xA9mGoXtQ4OgvG5KIHt04Db4rfYyV+oMyQ7VGpg1WCFG8e0jSw?=
 =?iso-8859-1?Q?3rvUDcd4UIeAeQpRZEN7/RgiAR/LvlpH8k?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e453e042-321c-45a8-7ceb-08dbe4879785
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 20:32:01.8855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7dDpRWY/ltTwHMqZMBGlIxZuqme8Yq7clIFk6bTQZ4T3EEaOF96/+Q0bGocCTwhrOfVwduVqH14fv/fu40/9Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
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
Cc: tvrtko.ursulin@linux.intel.com,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>,
 animesh.manna@intel.com, linux-kernel@vger.kernel.org, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 13, 2023 at 11:36:13AM +0800, heminhong wrote:
> Current, the dewake_scanline variable is defined as unsigned int,
> an unsigned int variable that is always greater than or equal to 0.
> when _intel_dsb_commit function is called by intel_dsb_commit function,
> the dewake_scanline variable may have an int value.
> So the dewake_scanline variable is necessary to defined as an int.

A good catch. But this patch deserves a better commit subject since
it is not just fixing 'warnings' but the behavior of this function
accounts on the -1 that is explicitly given as input in some cases.

> 
> Signed-off-by: heminhong <heminhong@kylinos.cn>

also perhaps:
Fixes: f83b94d23770 ("drm/i915/dsb: Use DEwake to combat PkgC latency")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>

?

> ---
>  drivers/gpu/drm/i915/display/intel_dsb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
> index 78b6fe24dcd8..7fd6280c54a7 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -340,7 +340,7 @@ static int intel_dsb_dewake_scanline(const struct intel_crtc_state *crtc_state)
>  }
>  
>  static void _intel_dsb_commit(struct intel_dsb *dsb, u32 ctrl,
> -			      unsigned int dewake_scanline)
> +			      int dewake_scanline)
>  {
>  	struct intel_crtc *crtc = dsb->crtc;
>  	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
> -- 
> 2.25.1
> 

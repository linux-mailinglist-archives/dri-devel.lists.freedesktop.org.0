Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 503786D4EF6
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 19:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CA310E04E;
	Mon,  3 Apr 2023 17:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A937410E04E;
 Mon,  3 Apr 2023 17:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680542980; x=1712078980;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I6ifycd3uLuzWuQMkS/GOfIW3y2X+G63j9PqqI/eHps=;
 b=T2zaWcurPnrRoi4lATha0zjh6cxIbh7bBNm+7sSXIUxw13dgrlt5Xjnh
 4ncWgtCnON/QBdKKBI3+0R8ZUEMR4VRQKzOHDcEsd22Do0ZjkYGiMW4FJ
 6YRCJwZDayP1dH4TvpdgQJGo0S79urOPyRQuJMNs5RnB9G2ZYIAqivFm6
 mNyx9AVdMhOUN+ZfognO3gScDxzDpLoOko4hpUXb7xILm9vz6qeCUnPep
 XYRCVE18fWkYwSDE4FJqmL3JM6dG2GIxac+gdtZwjaxHg7Uo5jOiLYYfs
 y9wAHlOLdfO3QyEcNRcmME6hf3Kb0jv9X61CFIrR9/6dNKO0p9UdbzHXY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="428255121"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="428255121"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 10:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829650660"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="829650660"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2023 10:29:39 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 10:29:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 10:29:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 10:29:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLL+gT49barnOEUKVU/oM1rOQo+unPE72B1puyz/j6sVS7cWXq4+73dI9EWZgyBm0TjdhE8S5yhUMH/74LNAAm94JatxzipPb9O2c3iWprTxr1dBhMtJWYZ90yKnuQNb2QAZJTOa+hkAv4mygZSUkzHJCjLKqDpVlBkbkV+G0aSPkGgeE4gLqa2rCoxFjc/dimxIvGzDoLSL0bOtGiGROOjKOk529JN1t1BjVkD28qZeVv4IlL6YLxW0J8Odx04yV7xAIk7t2NBNcWDPzm5oj8haH+7QsZGa2SpFv09vHlkanMPWd+8MAMWbDntbCaQcE6tLcK6urkjBR1Z0ptEpgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foQrcJjtj9m4YficDzMevjDQnboPA24vD/s0wOLnKDA=;
 b=YibCQDxuyEB0aGnsowqpE588UzP6wEumPiZkQGbtY/8rxHp1Kr7bYHJDLR7qgnfTvMWxlI2CUk8OY0zc0x4xHAmRKA1rplrjpmBN8k/jC1Yf+9G8ujodtDUzEYGbGrME/nCSOUnVGd49pf4RtYiJPhFT9UgvjY3wSVmnZYuDYG0KluWejmKkhcNUdOIwx8G1d+JQtrQlmDs9J0nV8jGnxBaVUKySwYNgIIYJ2n7zii54UbwGzOdLY7RFCcUx1L7GoEWZwgBCY1NQ/I48mVPyHIsaqmsdTKY1Dobuphojra8O1lwk4+pUXIWHdCD7DMgUEjSNP6JuiFyNJhLxVvVgrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5868.namprd11.prod.outlook.com (2603:10b6:a03:42b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 17:29:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%9]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 17:29:37 +0000
Date: Mon, 3 Apr 2023 13:29:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v3] drm/i915/hwmon: Use 0 to designate disabled PL1 power
 limit
Message-ID: <ZCsM/JDVFmcTTSIT@intel.com>
References: <20230401024146.1826092-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230401024146.1826092-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 1133e7d3-88b3-40d2-a7ca-08db3468ff3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JZm8SZ2QAPuQtA+AjcQ9KXrPBEr67viaEtQOIv9XVBzfZWkNMvRZtKU1R7bzPiTlnApPCerjcV/L2Nrzx8VTQ02TGNx7srHOSvptRhuuAAaj09clx+MYtzLnof0YoxqE2yKntsN0mbYIQNPKwV/PXL2im/jCGnPYyforrWKSSkHgu9Yz7IzUP2KrdKzsf29L11xsuAgbQ8/Qzu1O1oqCoN1KhfrmyxHPL1MOs7XsnaL+EDKQl2QM7429HKc2h2+5GcU6ZAuVgR6iTHZMsxl5b5mi0bOkNZuOGkjx0n7tf2MSC4p05r7DxRMb48LhbslW7xDsuy935wWDCABhvUT+J/+2kJTNOvs3TXSPJbSXD4XD7epcb8M2hW5pdKza7csPY0c+9ilQPMNun6qpDLExo8ZT6umBeELEawq66wASI6qR9yAQxom99c7rqFxj7q69DkhWu7Fn1P/k5q2iqcIxm5nMNEYqFXPkufP1qU5Jk6XdMCBqdPU2+Lr2TXGeGg9d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199021)(6666004)(26005)(186003)(83380400001)(6506007)(2616005)(41300700001)(478600001)(82960400001)(8676002)(6636002)(4326008)(66556008)(54906003)(66946007)(37006003)(316002)(66476007)(6486002)(966005)(38100700002)(36756003)(2906002)(86362001)(8936002)(5660300002)(6862004)(44832011)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cXCb7+LuYXCkJCtE8EZ1yz6fw64t1RVtUNPZ8XSpyIPRW+Ty0dWxTtzb/us/?=
 =?us-ascii?Q?KiZuCWALVGtjx5q1mlOGO3bxsPZ/Wwzs5S6c+Q5ooW0vGtg6gIyeMrL8K2F7?=
 =?us-ascii?Q?ulkSEkSiy555SIz5Tw0eo2etVTYhSWhScMQLJvVMru6YJIS2d1m/d0wc5oFC?=
 =?us-ascii?Q?lpN63w0v3Fl4Td8hAxfdhatRsNzLbnqM3/CfFuFRCCuEMgPOpuxcpyPJXHqe?=
 =?us-ascii?Q?FJ6YR2E0z2TVwio9BzdKozt+oLfLPK989+QsLoRkbRxsxMgmvFCq/FLRrgts?=
 =?us-ascii?Q?nlVcOuAvHEQl4qmdY5hVrFCKUG+L8u6Mbkiu04b3RDg6iPaoI9Sh8LyfBvFV?=
 =?us-ascii?Q?JBIGUtxqbU0akUr7TT5O/jxQpmoyasXynKQisEOrIEqmsscl98KZVJf1BF/0?=
 =?us-ascii?Q?TEzwVWZtTainSSf6Bwbo7miT6F7iJxQP0aCSpD1WC0wsNU+VozTmaqNMErPG?=
 =?us-ascii?Q?IUSNNHsazjtVlzUEUsQu18X6nqRKeWpjPSiL7HhzEeRyeDT7pCCOFGNalSBR?=
 =?us-ascii?Q?1cyp7BUIfJoQAZdQBotwXcwtykIJH2G0cNVLN/OzcQsALIuE7aBieqL/fpVW?=
 =?us-ascii?Q?oiWzAWc9ByaYp+66711QocSRl06YcRlzVAtblN5QFXZP3oGtDDuZDAcotV+q?=
 =?us-ascii?Q?q2JO0mnjl06rbYmGwvTiGo0yw8mRnmFaIRGWXqEXi6F3tPB+u4YL4qk+87uI?=
 =?us-ascii?Q?P6bGuiZfleGF7o2fxXqsDRlK/G9JDL3dVDQOSG8RnSYwLIs8QsYoD81yXlgv?=
 =?us-ascii?Q?KIWFBKkBhuTfjp4sUhKGrF9VALf2E1RUtNcOF1CUxAYhPfdmGK7lkC/iK3Eh?=
 =?us-ascii?Q?Qt6gDOauqytnRnQebVjE9f2esye5+gOWqs323AdlrO8yvjV36Axp7C1EV8Qf?=
 =?us-ascii?Q?gF7k/Kwh7KGNzYYXkORnwwPv/K607YuzdOaRJ+TKYE5GrzXf+0i1r4q70XIR?=
 =?us-ascii?Q?PijU1yTTtP7e7DvbtOef6Ef4pat2y1AJ4xfKVtAwQlGGjb+e6FCpdtfDwVzS?=
 =?us-ascii?Q?OuEdtDNxeETLZVV2w9sZU/9xS7bhc0h/0njVBOhALUFPjJ7wdubO3RQjIXpE?=
 =?us-ascii?Q?7IAAPprU3Q8sR67fVdvrsU4JHf2KfCcQ3EgfrkspZ5UV2/Vstfvg6ofj/M6y?=
 =?us-ascii?Q?2GCvKCdO1dZ4Nt1Tvm6vR/nZ0tsurBCh4SnGiIqjVJieLWVNckh4CN/Sw1Zv?=
 =?us-ascii?Q?16KmJ59zd5g72MWLlQUvLXa32yT9oPRePzAkOo0ZsFOo6heSj/PLOM8LZvIq?=
 =?us-ascii?Q?gzH3P9D6KpIR1LTx+b31DXd8CgmcA9nOwmIx1zz1UHySJfmLDJ7YlisNQQjM?=
 =?us-ascii?Q?knlxTkmdgdaE2ywKK5wuB0qGshjfc8qj6uWQCCfMFuyKio5MTejuHgesvN5y?=
 =?us-ascii?Q?CXrlIvfPyTHe5ykqKLSKvQgwm5XUvMqpwJzlgL94lRGcE5vku5fVSGE1f1zS?=
 =?us-ascii?Q?B2QJlmP9fm+C+KAi06p1E6zg9WSJCuS3P4JdYEiuMm+k4pE7wGjW9dAjvXDd?=
 =?us-ascii?Q?zI/bwXgo3eigDghHn+2DZFFAPn16ei4A6eY4aLSINHVF1IcYIE37Umm3aVSN?=
 =?us-ascii?Q?qzDglJZ2yvMDmgAEcSviZB2s4Qmr4jZVRgArdXaU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1133e7d3-88b3-40d2-a7ca-08db3468ff3c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 17:29:36.9733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJco5Z+PYlAWVSV/fsuIE5skFBnLKlrYdAjSFu83LuI4uqXoZ1NRMbX/hU0vcRfsdq7ZyKfWRGDUX8JJdn6FiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5868
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
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Badal Nilawar <badal.nilawar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 07:41:46PM -0700, Ashutosh Dixit wrote:
> On ATSM the PL1 limit is disabled at power up. The previous uapi assumed
> that the PL1 limit is always enabled and therefore did not have a notion of
> a disabled PL1 limit. This results in erroneous PL1 limit values when the
> PL1 limit is disabled. For example at power up, the disabled ATSM PL1 limit
> was previously shown as 0 which means a low PL1 limit whereas the limit
> being disabled actually implies a high effective PL1 limit value.
> 
> To get round this problem, the PL1 limit uapi is expanded to include a
> special value 0 to designate a disabled PL1 limit. A read value of 0 means
> that the PL1 power limit is disabled, writing 0 disables the limit.
> 
> The link between this patch and the bugs mentioned below is as follows:
> * Because on ATSM the PL1 power limit is disabled on power up and there
>   were no means to enable it, we previously implemented the means to
>   enable the limit when the PL1 hwmon entry (power1_max) was written to.
> * Now there is a IGT igt@i915_hwmon@hwmon_write which (a) reads orig value
>   from all hwmon sysfs  (b) does a bunch of random writes and finally (c)
>   restores the orig value read. On ATSM since the orig value is 0, when
>   the IGT restores the 0 value, the PL1 limit is now enabled with a value
>   of 0.
> * PL1 limit of 0 implies a low PL1 limit which causes GPU freq to fall to
>   100 MHz. This causes GuC FW load and several IGT's to start timing out
>   and gives rise to these Intel CI bugs. After this patch, writing 0 would
>   disable the PL1 limit instead of enabling it, avoiding the freq drop
>   issue.
> 
> v2: Add explanation for bugs mentioned below (Rodrigo)
> v3: Eliminate race during PL1 disable and verify (Tvrtko)
>     Change return to -ENODEV if verify fails (Tvrtko)
> 
> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8062
> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8060
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushed to drm-intel-next

> ---
>  .../ABI/testing/sysfs-driver-intel-i915-hwmon |  4 ++-
>  drivers/gpu/drm/i915/i915_hwmon.c             | 26 +++++++++++++++++++
>  2 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index 2d6a472eef885..8d7d8f05f6cd0 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -14,7 +14,9 @@ Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
>  
>  		The power controller will throttle the operating frequency
>  		if the power averaged over a window (typically seconds)
> -		exceeds this limit.
> +		exceeds this limit. A read value of 0 means that the PL1
> +		power limit is disabled, writing 0 disables the
> +		limit. Writing values > 0 will enable the power limit.
>  
>  		Only supported for particular Intel i915 graphics platforms.
>  
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 596dd2c070106..8e7dccc8d3a0e 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -349,6 +349,8 @@ hwm_power_is_visible(const struct hwm_drvdata *ddat, u32 attr, int chan)
>  	}
>  }
>  
> +#define PL1_DISABLE 0
> +
>  /*
>   * HW allows arbitrary PL1 limits to be set but silently clamps these values to
>   * "typical but not guaranteed" min/max values in rg.pkg_power_sku. Follow the
> @@ -362,6 +364,14 @@ hwm_power_max_read(struct hwm_drvdata *ddat, long *val)
>  	intel_wakeref_t wakeref;
>  	u64 r, min, max;
>  
> +	/* Check if PL1 limit is disabled */
> +	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> +		r = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_rapl_limit);
> +	if (!(r & PKG_PWR_LIM_1_EN)) {
> +		*val = PL1_DISABLE;
> +		return 0;
> +	}
> +
>  	*val = hwm_field_read_and_scale(ddat,
>  					hwmon->rg.pkg_rapl_limit,
>  					PKG_PWR_LIM_1,
> @@ -385,8 +395,24 @@ static int
>  hwm_power_max_write(struct hwm_drvdata *ddat, long val)
>  {
>  	struct i915_hwmon *hwmon = ddat->hwmon;
> +	intel_wakeref_t wakeref;
>  	u32 nval;
>  
> +	/* Disable PL1 limit and verify, because the limit cannot be disabled on all platforms */
> +	if (val == PL1_DISABLE) {
> +		mutex_lock(&hwmon->hwmon_lock);
> +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref) {
> +			intel_uncore_rmw(ddat->uncore, hwmon->rg.pkg_rapl_limit,
> +					 PKG_PWR_LIM_1_EN, 0);
> +			nval = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_rapl_limit);
> +		}
> +		mutex_unlock(&hwmon->hwmon_lock);
> +
> +		if (nval & PKG_PWR_LIM_1_EN)
> +			return -ENODEV;
> +		return 0;
> +	}
> +
>  	/* Computation in 64-bits to avoid overflow. Round to nearest. */
>  	nval = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_power, SF_POWER);
>  	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
> -- 
> 2.38.0
> 

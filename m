Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD2C6FB4E0
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 18:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9F889186;
	Mon,  8 May 2023 16:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CD289186;
 Mon,  8 May 2023 16:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683562416; x=1715098416;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z00ffjsCN0pRnXp/dMprA80rE1rC/IIhQIIWh9ys204=;
 b=j94LhTpaGckxtrhsnlqJKRXWdxLJGVBEArRH2/ax++6Sj85AH7yJExcD
 MYnogZyPh7bMQmeFEo6JKWjOL5UJ8a5Dd2LbD5Pz4o5Tta02vw0316Tyi
 E1N33WDetSQkjKaIKdxpGvK4M2Is5LrqV0GIoIf2pNKss698+BXJ4MVhm
 +eAaNcP52ruOwknTgXY2XyuLk9lGuPS0SPytgtiV0ZnH3rp0A8OLxdkln
 49PNbFSWLwbKop86rNUGYa0LGomEX5HTmZI2K3Lt2uNkb8c2vcC89pdO1
 tx1hcw80yesgt5XmBZXxh6R9v5F9dc/q7gbm/OOKlQ6dRf5RTHkyk3Rql w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="347156185"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="347156185"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 09:09:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="731350403"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="731350403"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 08 May 2023 09:09:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 09:09:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 09:09:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 09:09:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PA23+LiuySe4gtfN/js4YBUXdvV+BWfg3qsAMaxMtKSd2Y/RIjlb61BeiSzB9vl2n1Wr+2yFPWNpRQGbQzo+66e34JyytK29XGg+iFqhLhkvoB+QkGksJ9ABduXFxvR/CHNfoVhKcr8Ti2Pmt5lcwjNv1axHrrYYfJk0zH6pojrr12InjiQ34ikSGCR88diV9UYV97AW7yqSY8qYzAYvr+c26ByYw2UmmecAqY2n+CH7qPTAHnvrRkWqeFhkkQqbvEwEj2g/3l6Fd/11tPEV40Ecy5Yh76IB/ui5c92hHvHaZ3+1ugedmjM6WSu/S75akjLqe4J8cZQyoo3yaq23qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McVf+9GzqzF0TBq1SFGlHlkUihSARgVM63STxEQBlwA=;
 b=aNtiSx+ivIWq8Kg14m+pMrSKagoyus5xuIfnh5RNAi6Zijyw3C46lscCiQc0bLKh0MnBitIqxQr2QeK9UcUNC3CMQUc59S4cT3TcQyKYOHuUNSS3jGREG+3Ay3w41d+CK4VFM27wapDR+BAXERJF4oONgd27WpnpUu/jsM4b6zjN+xAFwB1glsmFuw88yGoHJjw2LN/e0vdmmvt3POhj+z3fJ4OceIpO+gKpCFxDKqy99/E5/NF8mXBeWOQeqkbElvw0NQZWDtqxOZn2G6rjtwmVbd3zmDhEkcXrscwpHcbZ77a876OYx8EwtYVBMmbSyP6OVrn2I+ZMS7EMedv78w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB6350.namprd11.prod.outlook.com (2603:10b6:8:cd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.27; Mon, 8 May 2023 16:09:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 16:09:00 +0000
Date: Mon, 8 May 2023 12:08:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Cong Liu <liucong2@kylinos.cn>
Subject: Re: [PATCH] drm/i915: Fix memory leaks in function live_nop_switch
Message-ID: <ZFkeltVDB4rSHj1n@intel.com>
References: <20230508085016.437836-1-liucong2@kylinos.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230508085016.437836-1-liucong2@kylinos.cn>
X-ClientProxiedBy: SJ0PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae4e3d4-572e-45f6-5a12-08db4fde88e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /v1SJXzpIFpiyRFCf0OKFKcY/oDmp5GU6pcDdAPB8qNpLYcYVWpa/+jUiaaoSMwnlRJ/eKRT5fIfOraKs9bmJSZB9fF3EGf50f0IToPtaB3JsPK+M/Hl49sqrWGCzVg7/bQBQfxvJJW4MR7MOIPGwwhD1GHiBt4vwG08jDpZPti9s/zQGrnwrakosX0iD9BRnAHZQjFk/PYOIwJ2mAEQY5R/lbElM0RF9UQKFDFMcAttPWVmIeGeOuu0c3USPGBnoKNpUjD4RvbR4TAdgCYWF932vJA7x4UtDuoCKmDBt7CIGyklnyBouQzSkAoWOg5tb/8F8pv1EvW0JtiRMt97kVMLu0GVOT9+K1L21R57x/ZLRvUBKWtrdO+gajOHUFRwYy/iez3emwyHYKnZ4jyoH4dm/4lw9NJSXwE4AtRGXj7jjGllao1BktBLzp10svPv6UYw1ET9J+YIgHhyEwDRWUREbjVsp8kMqhrpheQ/ONXvoSXiy8uJUleoNWaihE2PBAM9e54Vizx7jYQfV3m7dH+cE4RcLwkoJuMP1RmswP+SBVaNlr57dUb9iG48yAQ/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199021)(6916009)(66556008)(6486002)(66946007)(66476007)(4326008)(316002)(54906003)(6666004)(36756003)(86362001)(478600001)(66574015)(2616005)(83380400001)(6512007)(26005)(6506007)(41300700001)(44832011)(8676002)(8936002)(5660300002)(2906002)(38100700002)(82960400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y7yltPQnXhx9wNGAwB8vyXzqnQnEBW240k4EfFzuhLKDD5JuyprZ1zeS6uQ+?=
 =?us-ascii?Q?UyNfpsfHqzXKoJuECMZLIUjfxCBIaVufBAfGGV42uj5wnZhfzUA6hJxcpHdc?=
 =?us-ascii?Q?4eoNHs7EbeFY1iMHrFLkLfVIah+ffsGyNf9m7KCNnWxGaknDkTDw5oQo26sa?=
 =?us-ascii?Q?w9GNzaUdKhdUaTrGooN7SGLzAZdrCErFyL+GZBNuMGXDpeD4hK3s54FoSynT?=
 =?us-ascii?Q?vS2+A6e6FnanEOiEVb7YWRPaVue54ufmKdRuEGshkBQ150B3GEjdoOY/yTCr?=
 =?us-ascii?Q?2/0gws4UnicXCvmo1AVdP2Jc6W22IBp+GHWuEZoqorLoSoZuHkc57T7koNnd?=
 =?us-ascii?Q?nw2SRUWvVymVwa9OzutUfmcXzbQX10v7pwlXggH+nhzdPxUPIHfaJ6dMGw9F?=
 =?us-ascii?Q?zgrjnKX6wJ1XQE2dlnxpvFqEY5R0ZrOy2zPG/gMnqjBxnXMcjiZv2BYTvLHH?=
 =?us-ascii?Q?onjWnO8246nk9zRaI+N5WNpm6zCCbFiMfYgeKvp5ZouU/zEOpZkfB7ixapde?=
 =?us-ascii?Q?mKLej7zQ6GcnLvdswJTfNquVy6WhazgxFveiOVBKoi78jpRbeN3hrUDiSmbA?=
 =?us-ascii?Q?Lmuu2tngOgc39tBFAIy1Ae3OUDnIgJNI+FzgFoWTUl5uhcPOaf5sYY0ESX/V?=
 =?us-ascii?Q?888tt7I6u2mLuf48IfjuA3d2APsK/B/Ubr5tuYiRzy5daZnmt0WJfTkpp1YY?=
 =?us-ascii?Q?IIi8ubWDH8X65UcU7k+ZGw5+vGZzOVRGSRqydQXqNl6Hy2k5JwxxP5jPYGgq?=
 =?us-ascii?Q?w6Rz37UiJqlYKtb0fdOi7j1ZxHlv1TE8ixtfr43zf2oQUyvyGSeW9D1LzwYQ?=
 =?us-ascii?Q?85sRddpV14mJDH32sQ65rhWlQb+Qx/6pG461ht/q/U8kSSv7uP1bHcR78snU?=
 =?us-ascii?Q?T9gUKhZSyfcpuSH+W+AGJoSX23uUBdpMo3joJzLEGztUfF1zUL9zSIyinzwK?=
 =?us-ascii?Q?XbYtOBf5drF9qYsAfys/sqY1YKYArmrElK5HBCBMPf950jqdbkqMmxlhDX5m?=
 =?us-ascii?Q?6xkTNxBb8w2H06cZu0kOvi+NvPsDIEib8QP7ao7zatlm0eJhaPiL+JsHoM4G?=
 =?us-ascii?Q?VMes1MugxytaaDuAwC5NFgb1bqK9wLi9PcJ/tJL5dUrOh4II/xMRuSs2cK2X?=
 =?us-ascii?Q?XTGiQMSYUFUJE4LYYPeG/ntG2ZpY32K81y6iJQcKEewkTQrUsxPOu3NJ7DuJ?=
 =?us-ascii?Q?Qebtyv6qoH5W7cz5wDKt5iAb43o/0Tg5fA+tq8SnoNeKYdMasxNuH04pfRQr?=
 =?us-ascii?Q?89FmDOlrLwKESE40NCVBPBJurD8jVN2WQyR2K7PbmfGBgBFpThPD/FCUvjTX?=
 =?us-ascii?Q?uGSdVr+RjA83bL6p/uhpQf1zPH8NMYbKAz03INcFccpVQCfmiUvM6u1Uemwp?=
 =?us-ascii?Q?RF4WRPqAjI/Sqhz1EYbgG0v9WsdDxlg3sUqTfh8Kp+xdEr6PTg8OZiLve/Np?=
 =?us-ascii?Q?EsO74aStP2M8OgtOP2E5UpphY50yauJtGzz1eni6BUdfJngwAEN3OPAb3QNC?=
 =?us-ascii?Q?UXNsGvY8wjWMphomCTG3ccnfXOJ4DdW0Qfma6hA1+KbclfjhnAnBsB5ID4Nr?=
 =?us-ascii?Q?AJwf3nr9wP/xfYmc2Pl0RjOwPN37u7sUbEX1IHTc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae4e3d4-572e-45f6-5a12-08db4fde88e7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 16:09:00.4096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ki4dzqIx67aEU+k8nlBY01kPeEkAU7T31+nK63nb2jgMp0p8sJc/2oU2SKHM7DHVsVODl9idrIG/YavZLoIlew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6350
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
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 08, 2023 at 04:50:15PM +0800, Cong Liu wrote:
> Be sure to properly free the allocated memory before exiting
> the live_nop_switch function.
> 
> Signed-off-by: Cong Liu <liucong2@kylinos.cn>
> ---
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> index a81fa6a20f5a..54eddbe7f510 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> @@ -59,7 +59,8 @@ static int live_nop_switch(void *arg)
>  	ctx = kcalloc(nctx, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx) {
>  		err = -ENOMEM;
> -		goto out_file;
> +		fput(file);

This looks strange...

> +		return err;
>  	}
>  
>  	for (n = 0; n < nctx; n++) {
> @@ -175,6 +176,7 @@ static int live_nop_switch(void *arg)
>  
>  out_file:
>  	fput(file);
> +	kfree(ctx);

You are right... we have a leak in this function...
but the way to solve it is by adding a new goto point
above kfree(ctx) ('free_ctx:' ... our 'out_ctx:') and
calling it from any place below the succeeded allocation
instead of the 'out_file:'

Something like:

--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -66,7 +66,7 @@ static int live_nop_switch(void *arg)
                ctx[n] = live_context(i915, file);
                if (IS_ERR(ctx[n])) {
                        err = PTR_ERR(ctx[n]);
-                       goto out_file;
+                       goto out_ctx;
                }
        }
 
@@ -82,7 +82,7 @@ static int live_nop_switch(void *arg)
                        this = igt_request_alloc(ctx[n], engine);
                        if (IS_ERR(this)) {
                                err = PTR_ERR(this);
-                               goto out_file;
+                               goto out_ctx;
                        }
                        if (rq) {
                                i915_request_await_dma_fence(this, &rq->fence);
@@ -96,7 +96,7 @@ static int live_nop_switch(void *arg)
                        intel_gt_set_wedged(engine->gt);
                        i915_request_put(rq);
                        err = -EIO;
-                       goto out_file;
+                       goto out_ctx;
                }
                i915_request_put(rq);
 
@@ -107,7 +107,7 @@ static int live_nop_switch(void *arg)
 
                err = igt_live_test_begin(&t, i915, __func__, engine->name);
                if (err)
-                       goto out_file;
+                       goto out_ctx;
 
                end_time = jiffies + i915_selftest.timeout_jiffies;
                for_each_prime_number_from(prime, 2, 8192) {
@@ -120,7 +120,7 @@ static int live_nop_switch(void *arg)
                                this = igt_request_alloc(ctx[n % nctx], engine);
                                if (IS_ERR(this)) {
                                        err = PTR_ERR(this);
-                                       goto out_file;
+                                       goto out_ctx;
                                }
 
                                if (rq) { /* Force submission order */
@@ -165,7 +165,7 @@ static int live_nop_switch(void *arg)
 
                err = igt_live_test_end(&t);
                if (err)
-                       goto out_file;
+                       goto out_ctx;
 
                pr_info("Switch latencies on %s: 1 = %lluns, %lu = %lluns\n",
                        engine->name,
@@ -173,6 +173,8 @@ static int live_nop_switch(void *arg)
                        prime - 1, div64_u64(ktime_to_ns(times[1]), prime - 1));
        }
 
+out_ctx:
+       kfree(ctx);
 out_file:
        fput(file);
        return err;



>  	return err;
>  }
>  
> -- 
> 2.34.1
> 
> 
> No virus found
> 		Checked by Hillstone Network AntiVirus

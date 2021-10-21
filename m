Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A047F4360B2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 13:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E246EC38;
	Thu, 21 Oct 2021 11:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78096EB34;
 Thu, 21 Oct 2021 11:46:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="228961072"
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="228961072"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 04:46:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="721282186"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga005.fm.intel.com with ESMTP; 21 Oct 2021 04:46:43 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 21 Oct 2021 04:46:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 21 Oct 2021 04:46:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 21 Oct 2021 04:46:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HeMhd/g/pbpWqI9LG8PQxaWA+S7wJuPndfKCqyLYX7usvamODkkgooe70hebAzGedPyg6jeYSUwqhIgRouNnkdu3IefGD3eg3hRGJHFLTnrQsWmoYBLqXP6uYEd7Ws4sbj7l0dpGyH2ywyXKRpGP9d+axBoOmzA/OJnipOayWMGBJsr8wto+oRpEF29QNLJRCpx4k1RkgDQCTPnyIQ3IiVFIvI98C8xQmwow1+gnhkS0moVul+uhpIXaLn1OTswzwt18UVdAtcO4MiZ8ZFiL/qmTmgdszQ64l/YIKt2WFSQeIgzjDD37BSOrnOK/ODDzSD5+Wt5Nd9zsDqUrg3fgCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OH9G7ra7SMky76E9Xok0901peuLEK8uww8gpEQ8D7J0=;
 b=PWngv9n934tfLlB1Zcf/e8rKY6eD39EMAzswbNGrkJ3CtpolSjmtd0RQf0Rc6ikdv2GUYth4+FmuWK0g8uQaY32QaiQMe82UpCJtJ5MoFoAJXG5yu6OWg48/5CPWicF6T/vtmJQ96PBM3ybQ0G6JhC8z1aETCXMd997nPv4BpSj4ZOrcZHaOylGu655NsAabt+YsQJLYfb4j96NV130kZhnW4OL0M8zZnzK/FxLym+DUVqI+C/+RZIoAAxeY62WhSNfCBUwA4LQrIV+iiI0xoSVqFMUb0kPa+bRHuSJ0kbDVW6KUsr3MVSz/7BHdCuinNo/By73G+/yttKXaat2AIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OH9G7ra7SMky76E9Xok0901peuLEK8uww8gpEQ8D7J0=;
 b=WquiRmdw6y/MOflgr8jMJUo6BXbKpYCEKB7bJY1cP8UCTEvxXIvs1WIzrrb2X2PKyeO63YZbjP2ohbP/1h5RdsTlfTEz4R/bWOoqBIcfgXsQF29BI2mAdqYJYcf6Bki6h3/hHBPuTA6m26vNZump1l5RphHQ3hdQK12qGpXrZ70=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5460.namprd11.prod.outlook.com (2603:10b6:610:d3::9)
 by CH0PR11MB5362.namprd11.prod.outlook.com (2603:10b6:610:b9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Thu, 21 Oct
 2021 11:46:42 +0000
Received: from CH0PR11MB5460.namprd11.prod.outlook.com
 ([fe80::8c11:3a1c:c63c:d6ba]) by CH0PR11MB5460.namprd11.prod.outlook.com
 ([fe80::8c11:3a1c:c63c:d6ba%9]) with mapi id 15.20.4628.016; Thu, 21 Oct 2021
 11:46:42 +0000
Message-ID: <aa5a420b-92c0-dcfb-12e0-9ef33b2dda55@intel.com>
Date: Thu, 21 Oct 2021 17:16:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/3] drm/i915/guc/slpc: Update boost sysfs hooks for SLPC
Content-Language: en-US
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211020195216.36173-1-vinay.belgaumkar@intel.com>
 <20211020195216.36173-4-vinay.belgaumkar@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20211020195216.36173-4-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::7) To CH0PR11MB5460.namprd11.prod.outlook.com
 (2603:10b6:610:d3::9)
MIME-Version: 1.0
Received: from [192.168.1.100] (124.123.189.243) by
 PN3PR01CA0089.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:9a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Thu, 21 Oct 2021 11:46:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de4066cf-7eec-4a46-18e1-08d994887301
X-MS-TrafficTypeDiagnostic: CH0PR11MB5362:
X-Microsoft-Antispam-PRVS: <CH0PR11MB53624F4E1AB4B33B310D1996E5BF9@CH0PR11MB5362.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uuiKD/mJyFMd5c8TzlNpM26hNFtq9pKzZyZi5+UMQBBjfcg8RDbSETlC1qUhFxp6GyuSao0picp3J222YcuM60Ka6vn/hl+dgn1Ca/VFgiaqLem2MA04aU2xbU4i5U+2I9bmC8EtP8drzuzXatI2AqUhFmaWjehhaMqEwo3X8OYWQJJzy46YhbVNM7pRIJJFXbJDMf3Db54py5Kb1VJViu08cIUucVr9cVhP5K/as+04Fr6wdqCcLxEoqUy7smsrK2xjQZL3iZNKDfSYQFviPa6mGLJB/l5xi2yJvHdNxn+QTe+HVAKMFiItYlWosjYegTfChoDIqWSwgCso9yCNtYqk8AwdJToqllolnO08e+oWavBXzKWRf7aalmVqSRBWKmcy2ezWBnkIbnVHEdE8BlbTPTCTD0acCEX0qvrguOsJPeYaY8Y2t1vVRe6Nr588im0OM+4X1i1HlRGY5fH6mIfPQxGe1ACYPA0mNxwIybP4C8H/pn+0YOuwa779+nVZzibzwhNYsxkg7mUqH9K8keW4tmZ0xuL0mmxS3/HyMIRsu9ncGZw6N6IpGs6EQsYWoEUjMXEhqANZq/OfykkmmqNaaiaQX25uYV2v/LyQzaxK5sl379KcsiN3h15vqnejC5D+FTaYuhT5lj9PjKA4rbAF02DR815UIxc0/jRbTQLYfLhOceNJb4lSmnCI2jpq2kHG2gqw+CM14GQWCIvVgvUwp2qMVtg+qnBBYk5I/AM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5460.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(16576012)(8936002)(6666004)(2906002)(508600001)(36756003)(316002)(31686004)(38100700002)(956004)(450100002)(66476007)(6486002)(66556008)(26005)(5660300002)(2616005)(8676002)(82960400001)(86362001)(66946007)(186003)(15650500001)(31696002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fYz6sGWVB8aVK5xOzikTje+HTOK41q0tB1upy31YiOVHN7xpt8e9VlCNIkIBmmyuPgFYJY9bPVm15fGxSJbync2CB7ayO0ovbOaL7flQRn0qIc6qD76L9j9sJPqnj6VPxzkOZH+Fv0u59qqt+D8kSwEJBvoI9bWaFzK38GQ0X3Vvy3YjiMSnwI210Yk446VVDyZoPls9drsPIQvX/eo20QbWOb3aXqWpjFZu/TxaXIFxIdbNCnNBeqYaJ63Ghv4EAj3rQf4XDLChlpYkO6ow6qDiF2YIymyEnyO+UP+u7m0luPSVuADS6gFWkhsXvjUPELS4k9/r+xByXg13ISiXNnFSfq4oFGyaUtzdF0s1nOERCc0iOu3zHGMJ9wx5b0gcaEB64QLgH2o8LEG3nYppWHOkiCukus7MF1xInnVEk9o=
X-MS-Exchange-CrossTenant-Network-Message-Id: de4066cf-7eec-4a46-18e1-08d994887301
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5460.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 11:46:41.9344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: badal.nilawar@intel.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5362
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

Please fix code style related warnings and errors from checkpatch result.

On 21-10-2021 01:22, Vinay Belgaumkar wrote:
> Add a helper to sort through the SLPC/RPS cases of get/set methods.
> Boost frequency will be modified as long as it is within the constraints
> of RP0 and if it is different from the existing one. We will set min
> freq to boost only if there is an active waiter.
>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_rps.c         | 44 +++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_rps.h         |  2 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 18 +++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  1 +
>   drivers/gpu/drm/i915/i915_sysfs.c           | 21 ++--------
>   5 files changed, 69 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 023e9c0b9f4a..19c57aac9553 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -935,6 +935,50 @@ void intel_rps_park(struct intel_rps *rps)
>   	GT_TRACE(rps_to_gt(rps), "park:%x\n", rps->cur_freq);
>   }
>   
> +u32 intel_rps_get_boost_frequency(struct intel_rps *rps)
> +{
> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
> +
> +	if (rps_uses_slpc(rps))
> +		return slpc->boost_freq;
> +	else
> +		return intel_gpu_freq(rps, rps->boost_freq);
> +}
> +
> +static int set_boost_freq(struct intel_rps *rps, u32 val)
> +{
> +	bool boost = false;
> +
> +	/* Validate against (static) hardware limits */
> +	val = intel_freq_opcode(rps, val);
> +	if (val < rps->min_freq || val > rps->max_freq)
> +		return -EINVAL;
> +
> +	mutex_lock(&rps->lock);
> +	if (val != rps->boost_freq) {
> +		rps->boost_freq = val;
> +		boost = atomic_read(&rps->num_waiters);
> +	}
> +	mutex_unlock(&rps->lock);
> +	if (boost)
> +		schedule_work(&rps->work);
> +
> +	return 0;
> +}
> +
> +int intel_rps_set_boost_frequency(struct intel_rps *rps, u32 freq)
> +{
> +	struct intel_guc_slpc *slpc;
> +
> +	if (rps_uses_slpc(rps)) {
> +		slpc = rps_to_slpc(rps);
> +
> +		return intel_guc_slpc_set_boost_freq(slpc, freq);
> +	} else {
> +		return set_boost_freq(rps, freq);
> +	}
> +}
> +
>   void intel_rps_update_waiters(struct intel_rps *rps)
>   {
>   	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
> index 4ca9924cb5ed..ce81094cf58e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.h
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
> @@ -24,6 +24,8 @@ void intel_rps_park(struct intel_rps *rps);
>   void intel_rps_unpark(struct intel_rps *rps);
>   void intel_rps_boost(struct i915_request *rq);
>   void intel_rps_update_waiters(struct intel_rps *rps);
> +u32 intel_rps_get_boost_frequency(struct intel_rps *rps);
> +int intel_rps_set_boost_frequency(struct intel_rps *rps, u32 freq);
>   
>   int intel_rps_set(struct intel_rps *rps, u8 val);
>   void intel_rps_mark_interactive(struct intel_rps *rps, bool interactive);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index a104371a8b79..7881bc1a5af8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -613,6 +613,24 @@ void intel_guc_slpc_boost(struct intel_guc_slpc *slpc)
>   	slpc->num_waiters++;
>   }
>   
> +int intel_guc_slpc_set_boost_freq(struct intel_guc_slpc *slpc, u32 val)
> +{
> +	if (val < slpc->min_freq || val > slpc->rp0_freq)
> +		return -EINVAL;
> +
> +	if (val != slpc->boost_freq) {
> +		slpc->boost_freq = val;
> +
> +		/* Apply only if there are active waiters */
> +		if (slpc->num_waiters)
> +			return slpc_set_param(slpc,
> +					      SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> +					      slpc->boost_freq);

As per comments from some other ML wakeref may be needed here.

CC: jon.ewins@intel.com, ashutosh.dixit@intel.com

> +	}
> +
> + 	return 0;
> +}
> +
>   void intel_guc_slpc_update_waiters(struct intel_guc_slpc *slpc)
>   {
>   	/* Return min back to the softlimit.
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> index 25093dfdea0b..d8191f2b965b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> @@ -34,6 +34,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>   void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
>   int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
>   int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
> +int intel_guc_slpc_set_boost_freq(struct intel_guc_slpc *slpc, u32 val);
>   int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val);
>   int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
>   int intel_guc_slpc_print_info(struct intel_guc_slpc *slpc, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
> index cdf0e9c6fd73..c62eb0c8eb45 100644
> --- a/drivers/gpu/drm/i915/i915_sysfs.c
> +++ b/drivers/gpu/drm/i915/i915_sysfs.c
> @@ -280,7 +280,7 @@ static ssize_t gt_boost_freq_mhz_show(struct device *kdev, struct device_attribu
>   	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
>   	struct intel_rps *rps = &i915->gt.rps;
>   
> -	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->boost_freq));
> +	return sysfs_emit(buf, "%d\n", intel_rps_get_boost_frequency(rps));
>   }
>   
>   static ssize_t gt_boost_freq_mhz_store(struct device *kdev,
> @@ -289,7 +289,6 @@ static ssize_t gt_boost_freq_mhz_store(struct device *kdev,
>   {
>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>   	struct intel_rps *rps = &dev_priv->gt.rps;
> -	bool boost = false;
>   	ssize_t ret;
>   	u32 val;
>   
> @@ -297,21 +296,9 @@ static ssize_t gt_boost_freq_mhz_store(struct device *kdev,
>   	if (ret)
>   		return ret;
>   
> -	/* Validate against (static) hardware limits */
> -	val = intel_freq_opcode(rps, val);
> -	if (val < rps->min_freq || val > rps->max_freq)
> -		return -EINVAL;
> -
> -	mutex_lock(&rps->lock);
> -	if (val != rps->boost_freq) {
> -		rps->boost_freq = val;
> -		boost = atomic_read(&rps->num_waiters);
> -	}
> -	mutex_unlock(&rps->lock);
> -	if (boost)
> -		schedule_work(&rps->work);
> -
> -	return count;
> +	ret = intel_rps_set_boost_frequency(rps, val);
> +
> +	return ret ?: count;
>   }
>   
>   static ssize_t vlv_rpe_freq_mhz_show(struct device *kdev,

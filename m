Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F4081B206
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 10:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A5010E65C;
	Thu, 21 Dec 2023 09:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E073610E65C;
 Thu, 21 Dec 2023 09:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703150496; x=1734686496;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yf0mZN2mtUSrnAfsUL0iES0BFpw2yjKZZIYyFFmga0g=;
 b=bL5Qi79wn+TDlhWJnuNesLssCMSHA7kFaOid8aZ/ws/NkorGKz+RAA9e
 mjBEaHdXId/h/yiPWEXu6wdP70meo1k61s0AYVtR3eObyuiHNwObqcpW7
 w1SFuB3+T5nbt0BScPfzSm7tNA3SC4jTIjfRvxuArmoqk3ypPYrRoNgI/
 wYEv+TDqgL9apEIdL4qmJYAztVUV1MsD+cwlJT8sHupslpdK7cxlmx++J
 V66d7hjTyqy1mVxlGkSSkkjwWa5VwF3dbvTTBgZE5P1Px5Ap4NcZiU3jq
 i9NrDxepJ9rrLrmvob0aNlmvVVfC/MB5Bvee8fko34gJxOKKx1dp8y6bm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="386374698"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="386374698"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 01:21:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="895035319"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="895035319"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Dec 2023 01:21:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 01:21:31 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 01:21:31 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 01:21:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzUjv7wQwZ9nzhkghZWip4Q7yDJNRFOFG7xXgb/XT8EQfTQY0ZYyHcyNs41Y294AwJuh49VsKdYnbNPhcWv+JU8S8rSQhefYpOxduwLzQggVipCtAK6k9bVPMaAanwv7ZaLsAlhSzxw0AAXSjFn3bq5Ojz2vEKpqtZMAjJmjLXYlipScLDGPt3R94zUlzdtjjOWfmya9m/EZ6X904iMP9xOzHGTlaz7e1kGudkS5IoPV1ckoRVWfhAYkHZj9p/xONHLISpF9KSE5hgTU25ri3LUBoTmERBB6JgWb5qglMMsMhwLrXnZ98EpU+KJKGblMRP2ofU5FvD9E3h2yuOd53A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyDr7pMzEKaPusURloxU9E2F9H3x9bjwgDSg3+NMwJE=;
 b=aNqVdAQlwByNMrBFjLMA0GM7X/tDzC6Mx2bkHM9qTZTxduYsdWB0QTFpyl9/NGAHanRQo5LwW3AHZZDaVZI9mcK7aDqhA+60UczfS70F+bb/YQsmH/CCLzUmNbXngVHNBVve96gmRpSQaPaWF1tJynJNDBuFTU5IGTMaqBPDXF8+vmvfDxUL1/CUxKAdgK2llkEpUHEaaJ7hoFIPqA5+l76lxDF1fRSEylic3o0DXDphnE7tgNaR7yHV6aI9hPHMsi4iY0SbVSN2RGT8Rla9/8DAI58so2rrF5NWSfSHbAK0F6Mpzaqxp8OwSHO1bEX4rk/y5SIqidINsWyPgWtD1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by MN2PR11MB4696.namprd11.prod.outlook.com (2603:10b6:208:26d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Thu, 21 Dec
 2023 09:21:14 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::c4b8:c08:c263:c2cb]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::c4b8:c08:c263:c2cb%5]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 09:21:14 +0000
Message-ID: <4035a6ea-b80f-4e65-86f2-3172dec42a97@intel.com>
Date: Thu, 21 Dec 2023 10:21:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/i915: Use the new gt_to_guc() wrapper
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, John Harrison
 <John.C.Harrison@Intel.com>
References: <20231206204644.105064-1-andi.shyti@linux.intel.com>
 <20231206204644.105064-4-andi.shyti@linux.intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20231206204644.105064-4-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR06CA0064.eurprd06.prod.outlook.com
 (2603:10a6:10:120::38) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|MN2PR11MB4696:EE_
X-MS-Office365-Filtering-Correlation-Id: 8092063e-cf17-4c32-b92b-08dc02062def
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oKPrVfh66GDHvuXE2BZmHUWrbhwslO2cmT33lEXE5gSTx9wfOtTv63X7vlyapyVcT5alpOpKpUslA3nX/nvbppBGVzYmfZZUp46enZ+3XVEfPUbaXkk45q0PqXO5ca0HE297qGJwqIMytHAILF0QQD/lO7LKZP6i5NC+Bgwc0B6UcylK7bW+TNPffBPqknTkmAQiJUSWTeOR8TKbz4Ymz176HAowOyeDuvplqSb/D7E5s8P6syHkuwvPZCqZdNI0Fx6jDx/eAB2YEMdc4ONrnHn8WKXaWszJfjC5lqPfHBWFeXT6dZipRs6aRj1K4vQIroP6YJtL28aa9Il+QkXaBPMju0O9fXmncBc3j+xOLUYuXKtfElIW9YDWwV42QLDC79pZZx6CTkfPNgZA5fV85PBlXTdIr15oso25gmIKJEDN+hEAD913CF5rDwUOUUGM0FVjpm8Qmutz+Nn4MSAdz9jwQlQoGqV8Xr9eIJRhYHojSGeTBkrvLPdnded9pAFPggqyvCnzU7yAG5eRTLQGOE0rqSdFSYHyg+ls9NW2dzEBrf1GY7KHre/BXZoP2zXZsCk35OepRrfBr1yyIngh9+KQs9U2JmwVF2a0x4xBH/Gf/HsNVr/k9DhqKa2SWUDPTyLoV1tOXKPdAcx/4EJgew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(6636002)(6486002)(66946007)(66556008)(66476007)(53546011)(6506007)(6512007)(478600001)(31696002)(36756003)(31686004)(83380400001)(26005)(2616005)(2906002)(5660300002)(316002)(110136005)(54906003)(8936002)(8676002)(4326008)(44832011)(86362001)(38100700002)(82960400001)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmhFeGZOc01ZYkVWRjJtWVlEQnhvTGNSRW1Ud0tKa0JjNDZlZGtnWnVRQkMy?=
 =?utf-8?B?SjMwL0hGeXIwd1JYQXRhSzk0dEI3Tk16K01zRlhQeVE3NjVTYzZ3T05WcGp3?=
 =?utf-8?B?a3NFUDVqcFFkclpTUEVtdjZjUjlEc3k2aFROUkc3RGZ6b0FQN2NqK3l0MnpY?=
 =?utf-8?B?SVJjV0xoWUMrTHhYVklqTU9vbDM0MWFTRmtrYzIwM3dwMVZjL3hRa3B6WHVT?=
 =?utf-8?B?N1dVNGJpajlPR0V5cVFlVURMcWxBbGJNY2F4ZkZ3a1lIV2VvRXZuVG1RZWtY?=
 =?utf-8?B?WUpZOExVUGNncVBRMXpuMCtyUnVOWVkxam1ZN0d4NTZkK3B0bGgvdU9qdzFs?=
 =?utf-8?B?NjcxdTlDWURhM0xIeU5uMW1na3YrMGFWaVN1cEtBcTNCUlMrZ0dRRXNFbzZi?=
 =?utf-8?B?djd3aTR3U3NnSHhmbUtlU0U0Nks5b2dhNHBkVTlJSlBCVDNFOEU1ak8xK2Nh?=
 =?utf-8?B?a2d6eHQwbmQxU0ZFTGNWdE5wMkFHRGk4S2VtZWRwdWdoNUZiK2NscEhFdVNz?=
 =?utf-8?B?dGRJTkprWDBqWSsvR1p3a1BuYStLUC9nYXU3cDVvOHJiNW50aDlCV2lyZ1BS?=
 =?utf-8?B?cnNZMnN1UW16K09YWHZPYk1lWXN2NUMvaWxtK2FuUnloL1RtZzJFTkc4KzlB?=
 =?utf-8?B?RXlvSm55NFArWHhWdUJWclVWS0RoM0JLVE4wd0xCNU54amdNWmZlSkpXQ0ZY?=
 =?utf-8?B?YlhzOW1FTHhNRGZJZi9KYnpDSnFjN3ZEeGQ2N3N2bzgrcEtBK2dITklTRUZY?=
 =?utf-8?B?UVZ4dnByRGdJQkxjSzlHalMzNHl4empZb2UrSDA2Z0s4RnNraTJjb2dWRVc5?=
 =?utf-8?B?bU1QTWE1NktZRklhd3BQeEFROHZreEo0YjMzaUUzaHpZZjcxaDBIek9ENEdO?=
 =?utf-8?B?MDAyelFqNmh1QW4xOUg0blFHZmtzSy9BemQ5ODNOakYydnFzbmZUVmxkeG84?=
 =?utf-8?B?Y1FQUXRTbFhFRE52L1VFR1FxcTFrenhPUnZWd1RFZUxsc2dvbHF4L2lUdjZo?=
 =?utf-8?B?d3NZeDFUOHpTRjNlY3puWWpnNWVUVldtQTMyMm1MSjBJV0p6RC9LWUV1VXZM?=
 =?utf-8?B?T1BET0N3OGpIWWNvY1RVMkFLcmVFRmxrMEZwWHIvUkhpdmRHUnBtd0pnREQ0?=
 =?utf-8?B?cjJLQWlyaFFLQ0NHZ0thOVRzM0ovVkN5dzBGZnBEL20xaG9kcHZTWFRPd01l?=
 =?utf-8?B?Sk8wYTNGSEJOaGYrLzUxWldwOXpxMXNZd3pPRVFpc2NOdEZyTWFraVZTeWx4?=
 =?utf-8?B?TDlHMTJ1Y3BQNDczVWJHZjlDeDZMc2ZRN3ZDaEpDd2p3dkpWQnpmSmc2Vit0?=
 =?utf-8?B?b1VWSnE1alNPWWh6V1dsT01BR1RsVDd1QjA2OGNUUGhPeC9Dc0RnUDg2cEZo?=
 =?utf-8?B?d3B5RGwzVkhmYXBhRi8ycy9Rc1oyeU8wa010SUtaWXg5SnJ6RWdhWExMVS9W?=
 =?utf-8?B?Zkl4SnVOMjludXprY3VIckRmRy9XdkhveWR1MEIyRUQ0T1ZlMDhURU0rMWJX?=
 =?utf-8?B?ekxNVzhQcEZCejVKWTZQSzdZcWFlcjBWNDNMRUpYa0g2L3FWdit4YnZ3V0JH?=
 =?utf-8?B?VVVERE5lVndPck1oQzF4Ymk5SmptNEx3YkdLOG8vYmNEQzAwbHIxUXVLN3N6?=
 =?utf-8?B?YW8ySFFveWJycE1uK0VNdVZOcVlmSkRBejBoTTZ6S3o0TFdvRUxFWFVQUSta?=
 =?utf-8?B?dWdzb3dJWHNIY0ovTlJwMkpzdVFlWG9HZEM3Nk9nTEthTktaTkEwNUJ4U0w4?=
 =?utf-8?B?MUF1YWNQbjhDWDYwazN1cFhKNUNUVlRpNzFwSlJyWCs3Tzdpd2cwNmdGOTZT?=
 =?utf-8?B?eEY1U1loaHZIZmcvMjRQbFdJUnFVSkJKdlVXSFNOVHduUmU5cGpPS2xUaHNp?=
 =?utf-8?B?bjZIZDkyQkJYcitWUlM5bnNTeGtoY0ljWHBsUExBbnphT243YVdmZmdEcUdD?=
 =?utf-8?B?dFdGcHhuVlQ1cnpJWDM4Uk9YY2tVdTFXNW81cDR3SjJja25TMGlhbzY2N2I5?=
 =?utf-8?B?VXZCZVBzQmt6ZFNwaFB5VkdaUDdOVXp4YzdHTC9YOEltK3pTaHM2KzJKVU51?=
 =?utf-8?B?UmFUVStYdEJqQ3RRWlcyZ2F4Zk85MGt2V1BLOEdkaWYyZnl1NXk5UDJJV2xE?=
 =?utf-8?Q?aRsazbf7fqeENeU3KttkfOTRP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8092063e-cf17-4c32-b92b-08dc02062def
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 09:21:14.5310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+pkFFPGVAOerh4QkyOr1zGbqnM45Cw7ehZAx/t9+SkUdT7X4XNK7qwnkDNb16k0PGPQvCNLe+fELJ3Q3jMmww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4696
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/6/2023 9:46 PM, Andi Shyti wrote:
> Get the guc reference from the gt using the gt_to_guc() helper.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_debugfs_params.c               | 2 +-
>   drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_debugfs_params.c b/drivers/gpu/drm/i915/i915_debugfs_params.c
> index 8bca02025e09..74b7f2fd8b57 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs_params.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs_params.c
> @@ -43,7 +43,7 @@ static int notify_guc(struct drm_i915_private *i915)
>   
>   	for_each_gt(gt, i915, i) {
>   		if (intel_uc_uses_guc_submission(&gt->uc))
> -			ret = intel_guc_global_policies_update(&gt->uc.guc);
> +			ret = intel_guc_global_policies_update(gt_to_guc(gt));
>   	}
>   
>   	return ret;
> diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> index 2990dd4d4a0d..d9d8f0336702 100644
> --- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> +++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> @@ -65,7 +65,7 @@ int intel_selftest_modify_policy(struct intel_engine_cs *engine,
>   	if (!intel_engine_uses_guc(engine))
>   		return 0;
>   
> -	err = intel_guc_global_policies_update(&engine->gt->uc.guc);
> +	err = intel_guc_global_policies_update(gt_to_guc(engine->gt));
>   	if (err)
>   		intel_selftest_restore_policy(engine, saved);
>   
> @@ -84,7 +84,7 @@ int intel_selftest_restore_policy(struct intel_engine_cs *engine,
>   	if (!intel_engine_uses_guc(engine))
>   		return 0;
>   
> -	return intel_guc_global_policies_update(&engine->gt->uc.guc);
> +	return intel_guc_global_policies_update(gt_to_guc(engine->gt));
>   }
>   
>   int intel_selftest_wait_for_rq(struct i915_request *rq)

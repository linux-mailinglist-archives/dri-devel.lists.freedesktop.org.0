Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5268AA5F0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 01:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4062511A0BA;
	Thu, 18 Apr 2024 23:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HCBYaN28";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A163911A0B9;
 Thu, 18 Apr 2024 23:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713483550; x=1745019550;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eq4nDR5sUhp7jveX7Ax65y1yt40eu/w/7EOYeW+iIbE=;
 b=HCBYaN28qWS6B2t/0p1v7pTdwXxa2vxduIup4cJLtIjBGH/RaUfnvfb0
 WjVv48H3O9k0/J5I0FrOZov9NP0dXnofIQIU0tCCqXqlGN20xTfQhOcRO
 4wPXtQEvJlLBJYM9hkn3NqZd1XMgN9SwbG6i/2pnauubQLGiwcAcQqccu
 jm/lkwUUmVQaboDbkMTSblJw04oZPHa3C26U7X2EGN0sX7ex8ubq0Ecsr
 D3mZraEXm3oOu/LT8LGHZJCEj+b9LEqZDmicChm/n9rRNX0yTsS6gt+Bw
 zQWcpVSr5m2m2kxIl4ZXKiNAkCS3hD76N1iCSchAYvXtzdJKmKQIIsjtL g==;
X-CSE-ConnectionGUID: PenRELq8Q8618rVAALv0CQ==
X-CSE-MsgGUID: rJp52m0NRim8woRhDL7xpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26578646"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="26578646"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 16:39:10 -0700
X-CSE-ConnectionGUID: V9dtnDNGQCe+bIRJOnJLEw==
X-CSE-MsgGUID: cy4xFEdYTqqYbnq7m5BFPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="46438275"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 16:39:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 16:39:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 16:39:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 16:39:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsBn2VddazAyTAF90oenJG1f3E7l8MaottXs4QgrBTMjHf9cCYOI/AMDpbSfZ8rMjMp45W3IfHcewPLwJmM6p5E5NaM60euFTnkoVDoZwb+BP26kfxaSVtXr5BVSvP/y3YB95EtErxQtG0DeOBh0Wv3RSqjj+0Au505S6fkzEy9SEYKa0S9jzZdUeXWc+tOrR+3Tv1l7GWx8nMzw5hv/YBZAydZVACRxgoXUZDK0z0FCc9sz/XmyqsgJeH9NA8VcGWEfyvww1EXjUvoUHluz3ieR8GFBYRnYZC+4gR6mzhKYbcbmJTzmKUYA0dc+1nOVX6U1Oj1QkS0QVv98BOgOWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyBF3hYAoSdsew3mLfGGtYj0zXDkTiTySy8l/rml2x8=;
 b=lJn415OHwPzUUSrJYW3cjgCcpzgUBLU5FQ2ZNN2hdLwlb9dgdtP8v2/7uEqtAJRSeivDwTf0jrWT1I1YKh2WH9Kr++xY5fHB/+kHXTrgZhAyS81ZJi1XhUymLnIWIPdnxvYoVttQbDLJbqc2ekJ0e6bN3wH3CgJHqAg18Id5OLrczzUA6vlKO55sRO3p+YniDdjMJ6pgX7XmYFMAJfeBIkdcl4qnBaJQ+Qv1tYM0cYMXQJtlk5WQ8CxGjbxuFVbQm6NMvlppCUKpkIkB39Cj6fEoj8/oxMPRBSnRFV9jk3VDkDkmWfEVKF41sw4V74CWrtwyl9+trOuFlQ6VNltuAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA0PR11MB7354.namprd11.prod.outlook.com (2603:10b6:208:434::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Thu, 18 Apr
 2024 23:39:07 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7519.014; Thu, 18 Apr 2024
 23:39:07 +0000
Message-ID: <13043328-20e9-4e6f-bf52-8e275af4015f@intel.com>
Date: Thu, 18 Apr 2024 16:38:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/i915: Fix gt reset with GuC submission disabled
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240418171055.31371-1-nirmoy.das@intel.com>
 <20240418171055.31371-3-nirmoy.das@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240418171055.31371-3-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0014.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::27) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA0PR11MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: f0872168-facb-4b2d-f113-08dc6000ba1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bfEqcy0kDe3FbNMc6mWZ02OkiZ9u4LnuBNgt6Rbjhuy55Kgo6YULBFHLBMtfZsA+Ug4cbTzvACSUmrhFznUW8KQGZZ0exDHnluoSP69Rfwl1ErgVQ5MoLLRRT+k296qRRK6YYmbel5D1BMF9ZFijv5/ZqSAL8j5O4EBSyajSGxflxCnsCgg7z7YAaN8TzOo/jyal004xaa+VdmUhowBcOrGLPyorXRImLtY8cz2apWm9P7lzXIisFZPlSne230+oc4wY6kBPGBDIUtEvMgWVavlY25NOyUs+EXewA6jutOhHBn/6Gp5kU71ExkEfwt1zmKAQABThbpiWqzxiXkfvJk4sUxvy33agf1CTAzdZILn5nVUsw40I7p4stRc5H3C08l6Ecy+zzdjMSN/0mHsSUmZrBMpCq9Zs5R6u5xTDgVP6WsOfYYxzGUMBerU/Q7pA0Vu174AVk4hl7wlhBYUxY30HmIvjm46j2TRdRMev3h0fOrM0+QqXlZGicvf+UbDwf8uhe2zQ4KAPd13svMT9qajlvz3tmAn5Ueq1uRHoI4HxAPvQFfxFwi8wyKxlo2rJalWbiF6w1w3sPT6n0zA/u7+gTFMWVbIe4naXo1Rc0v6b4X/Jekaha9s3Ae+Kl98A/6w1HWyxmB5sh5eH8NLmiGlngx2pMxw+wZOyX74txe4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEZ4NjdJZWJaMm9BcktORm5RUkV4dFZvUHRVWlZ2SG5xRGxQT1g1a2RDeEhT?=
 =?utf-8?B?L2kwZU1SVHhLTzU1aXp4Tm9jZU9FYytsOWZuVVE4SjVjVTBhRE1OcFFxL29J?=
 =?utf-8?B?aWFZbWd6dWtQTGxobE5INUh6azF3ZGxMVG41WHFZTWVXRVVPMmdxTTFKQVVk?=
 =?utf-8?B?RnN6T294bXpnZmtHUHBWMW10bnZCdTBJNDlRd3c0c0ZYZDRHWktJQkFTVG5Q?=
 =?utf-8?B?dFdGWGtlclBRd2JveU5RK2NMS2p6TzNiYWpTMlBrZ05qTC95Nnlranp1U1Zi?=
 =?utf-8?B?ZTR6K1hVK3g3WisrU2FHNUl5NFZteWlFUExzQ1NYeVlseDRSRk1qMzc1aHZU?=
 =?utf-8?B?a1hNZ2tEUTF2OTV2WXdObHFuKy81Q3R4UmxEM0cyY0FqNGlMeENRNWZINlp4?=
 =?utf-8?B?Uy8rNFFWWVJtdEtBbmtzZmhrNG1DVGd3QVlDZ1B4VTYwVnVyclRua0U4MitD?=
 =?utf-8?B?SElRSVMvTHhONDE1TFpRcEt0VjgxcmNvRVlLZm0zQ1pKOXRRVmNyM2N0aHpK?=
 =?utf-8?B?NmxyaXFnTlBCWGZsbExHYnNrYjYzUUI2dDk4amZZZFdMbS9jekIxd3dyaTAy?=
 =?utf-8?B?L3pCbWxDZ1lMZVFZbWhQNkN0MnJLQ0pqQXM5QlVjYkhWUjI2cDlQQjM3VEVV?=
 =?utf-8?B?SXJ2R3JKaW1HU0hYWkpKWEQxaUpGZTBwV3ZOMEppTWU3UUx6U05XOC96OHN0?=
 =?utf-8?B?QUFZVlFlYWdQQnMwQzdWVXNhQTUxd1VsRTZodnNFc3E2WmRzUVNxc2ZtMXBt?=
 =?utf-8?B?WUdRYTZtaStBZ3QvTWRHdG1HaUx2M1pONWtodmhLZmVsWDJUUlhyZVJmOHZu?=
 =?utf-8?B?TEVCdXA5TS9iSEtJTS93dzYrWktWcUxDakIzNHFBRVpQRzdKdmN5bXJ1ZmY4?=
 =?utf-8?B?a3E0LzdEcVFNSStWanBjNVFST3A2Zk5ZdWlZNzlSUlpZSURBWExFTjBjaE82?=
 =?utf-8?B?KzNpbTZWQWwwc0FhNG5qaTF0T0J4ZDR1V1dGTzh3czhQbmJjWG12WWxJK1Er?=
 =?utf-8?B?RmFBTVN1c0hQMjQzcnpnTVNYelAwYU9jWmxBWXVWNzhOaTU5Qzd3VlJlc0p3?=
 =?utf-8?B?QVNNejFBVjc0eTdNMFZGUUYvNWhocEFrditPTGNIN3FqNUpHRGY5WTNPRHRD?=
 =?utf-8?B?eW1nekp6d0d6L2VyZHNCaFI3eDVhZWVkOGxTVENuYkZvc01xb0E4UzJRaC9r?=
 =?utf-8?B?RlZRQ3hnQXAwY2tOYUpqSDFNZGxSWDYwVHpWY1BxbVpwcXZUZDlSeW1XSmc0?=
 =?utf-8?B?TVFqY0trT2t1SHZsRTNtcVBTcW9LcTFUdGFidHVoSkFYeHNMSEQ1Qitoc0lH?=
 =?utf-8?B?WmdIR2ZjdlhvWTZ6R1FEZkx1WHYwaVp5NVJSdHRodG9jUVp4ZHQzU2dNNlJF?=
 =?utf-8?B?UGxFRkxDOVF4T3lUNVlZdFo5aUM1a3dvYzh0Slpqc2lQRjZXcWVnVVl5eVFC?=
 =?utf-8?B?VHlLd01Gc0FZZ3lSK3dDc1ZPL20yOTVoYUYvSHNMamtMek5pVWdWVFpnZWNp?=
 =?utf-8?B?RDlZZ3JyelRGZkZLMXV3b2I2ZnczRno2cVJFM0ZUS29VS1RvZU9QNkduSzht?=
 =?utf-8?B?OFpHd245WWd4dHB6MVI4dXRzajduVUMzSHFYSFp3OUV6d01IWTBmbTJrUFN1?=
 =?utf-8?B?d1VLQXY0cXZuVVJQSjFPenRnb2pjaTVkUy92ZmVPMkxQVkFMSkgrOGxUNnVR?=
 =?utf-8?B?dmVIRkhqRFI0M240bWhQRUJ5aXZjWkpzSjJUZWJGZ2tESEFHK2t1b2FoQU5X?=
 =?utf-8?B?ZlVyTDVjRmhzeUJOeXlTY01Lamx4MUhwQ1NQMm5lMzNMYmljNTJab2dYaWhv?=
 =?utf-8?B?MzArVGozN1Fic0toalRjZGt6KzJvV2gxVHI3WVFGK1B2VjJqNFdVNGhsYWlZ?=
 =?utf-8?B?ZUdLSnNEaS8zSFlkaGVMYVVmczlQUEdsNVZVQVVwNm9ERlhLNkZ3VVhEMmRU?=
 =?utf-8?B?UVovZHRUM0gyQ0VpNnd0VHhsMmFQbVZpL2UxTCtwL1hoWUtNN3BCZUhsYUFa?=
 =?utf-8?B?NW95bm04NEhSREJhL0l1Y0x3ai84RmpubHVKb1ROM0dDdGgxeFplRWtrUzFR?=
 =?utf-8?B?NEVrVHZ4NHoyTHcwS1NDeTM0Ui9NcjBtSWNENTZEQU9LZ0s1ZllxZmFlY2F3?=
 =?utf-8?B?QSs3QUttQ05pUXNpdHI4UGpBY1YzQkFlaDhrRThFbUt5bENnalpHYS9CelNp?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0872168-facb-4b2d-f113-08dc6000ba1e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 23:39:06.3226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +N7mrwJpiUFSZBvMiVQ0tBYvFnF9YN/qs+tI+QKfJIHq9es90O8aWIpfjww3sDSDHgNj3wGmCi1WjDsP3qhSTKvqC6k48nHHy+bcRP4Fe6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7354
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

On 4/18/2024 10:10, Nirmoy Das wrote:
> Currently intel_gt_reset() happens as follows:
>
> reset_prepare() ---> Sends GDRST to GuC, GuC is in GS_MIA_IN_RESET
> do_reset()
>    intel_gt_reset_all_engines()
>      *_engine_reset_prepare() -->RESET_CTL expects running GuC
Not technically correct. There is no direct connection between RESET_CTL 
and GuC.

>      *_reset_engines()
> intel_gt_init_hw() --> GuC comes out of GS_MIA_IN_RESET with FW loaded.
>
> Fix the issue by sanitizing the GuC only after resetting requested
> engines and before intel_gt_init_hw().
You never actually state what the issue is.

The problem is that there is a dedicated CSB FIFO going to GuC (and 
nothing else has access to it). If that FIFO fills up, the hardware will 
block on the next context switch until there is space. If no-one (i.e. 
GuC) is draining it, that means the system is effectively hung. If an 
engine is reset whilst actively executing a context, a CSB entry will be 
sent to say that the context has gone idle. Thus if you reset a very 
busy system and start with killing GuC before killing the engines and 
only then re-enabling GuC, you run the risk of generating more CSB 
entries than will fit in the FIFO and deadlocking. Whereas, if the 
system is idle then you can reset the engines as much as you like while 
GuC is dead and it won't be a problem.

>
> Note intel_uc_reset_finish() and intel_uc_reset() are nop when
> guc submission is disabled.
>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_reset.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index 6504e8ba9c58..bd166f5aca4b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -907,8 +907,17 @@ static intel_engine_mask_t reset_prepare(struct intel_gt *gt)
>   	intel_engine_mask_t awake = 0;
>   	enum intel_engine_id id;
>   
> -	/* For GuC mode, ensure submission is disabled before stopping ring */
> -	intel_uc_reset_prepare(&gt->uc);
> +	/**
> +	 * For GuC mode with submission enabled, ensure submission
> +	 * is disabled before stopping ring.
> +	 *
> +	 * For GuC mode with submission disabled, ensure that GuC is not
> +	 * sanitized, do that at the end in reset_finish(). reset_prepare()
> +	 * is followed by engine reset which in this mode requires GuC to
> +	 * be functional to process engine reset events.
-> to process any CSB FIFO entries generated by the resets.

John.

> +	 */
> +	if (intel_uc_uses_guc_submission(&gt->uc))
> +		intel_uc_reset_prepare(&gt->uc);
>   
>   	for_each_engine(engine, gt, id) {
>   		if (intel_engine_pm_get_if_awake(engine))
> @@ -1255,6 +1264,9 @@ void intel_gt_reset(struct intel_gt *gt,
>   
>   	intel_overlay_reset(gt->i915);
>   
> +	/* sanitize uC after engine reset */
> +	if (!intel_uc_uses_guc_submission(&gt->uc))
> +		intel_uc_reset_prepare(&gt->uc);
>   	/*
>   	 * Next we need to restore the context, but we don't use those
>   	 * yet either...


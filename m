Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C934C3F7FA1
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 03:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1274D6E44E;
	Thu, 26 Aug 2021 01:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F64F6E44E;
 Thu, 26 Aug 2021 01:03:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="197878364"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="197878364"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 18:03:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="684704674"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga006.fm.intel.com with ESMTP; 25 Aug 2021 18:03:16 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 25 Aug 2021 18:03:16 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 25 Aug 2021 18:03:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Wed, 25 Aug 2021 18:03:16 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 25 Aug 2021 18:03:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hby2hCRLBgVq9XMlsuc3Q1V10qjUqvGpGVw+HAnoVDCs3nxFeM9Jev4McpNeO7qUN12Tquvh1L+Ly7/rnrzsaqqmw1AVlytRGs8j8fDwDdjPkc/czzY1RZqfXkKcaRtdXzsK+IWa42P8jfH8TcqFtYddCb+++khqavAriVN7C7LgDEi3aKXiIzL5WUxlxZmjMx0mH3/ZmLaZp6qi0yX3aQQCEhEieJPEq/Gyjsw2O9rC3EJGOzIfUw4l2MfKhh8DvFaAOAQYiJClNH2YFep9q4xwPqSeJRAZh3ChOI7XCpFoZ5Y9A5u2DGLsXcR9n6sKUjj8C8nfNVRMBZ2N9BBGcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gXmk9LPmoW+UKVWTa7LFZTgw19TE3nMywTVLCxiF/w=;
 b=FcLuIcpVLjMRjbkkCZiAf7uX0YfiA7joa3Vweht1ymMpukehDGg/ScI0cPuLpy42RVXC/mDx+QgyPBdB8xXBC86sy6M8uZ8G2ZRWwojwDf5UjUTIK6Aq5DXPLuFIsAyGJcv+/R8gwl5XD06sfoDhHqsmSNMTC4wAp9X+fUczc/1nas7/pgan4NFwy/D0klJBPEoUkgyIGX+k50fyLJjDhbn3yIzta9NmKOmfZt2G0CJ2iBHmfGuKmqld8HpSVmEnr1USzDCSUGUsOu7+iZxRbGOsN8rxEIYxMG2IIYQZ/YvqXuZJgFi+xMgeQS9lsU6J7ztT1rRQ+q+jhpn8oh21Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gXmk9LPmoW+UKVWTa7LFZTgw19TE3nMywTVLCxiF/w=;
 b=ABRvONpfG8V2cCCKAJK73kaSKKG2zQMDw4wn4N5V5Ff+awJZOEmlg11vuRU09c7Tr6fo05yVQ9Z90DCOUF42qzS4ZFy5f+PSwJ4NOJNMZUppxPRHwLzmtXktLcKBbPt6jvnSFZmeb1vavv6HeNl7ZeqR2k+UbvvfEoY5e4DXc7k=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB3083.namprd11.prod.outlook.com (2603:10b6:5:65::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Thu, 26 Aug 2021 01:03:13 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165%7]) with mapi id 15.20.4457.019; Thu, 26 Aug 2021
 01:03:13 +0000
Subject: Re: [Intel-gfx] [PATCH 26/27] drm/i915/guc: Add GuC kernel doc
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-27-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <c65ab504-8c74-5ec8-7ae9-2f747310c95c@intel.com>
Date: Wed, 25 Aug 2021 18:03:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-27-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR05CA0077.namprd05.prod.outlook.com
 (2603:10b6:a03:332::22) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 SJ0PR05CA0077.namprd05.prod.outlook.com (2603:10b6:a03:332::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.9 via Frontend
 Transport; Thu, 26 Aug 2021 01:03:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eaf3c0bb-fde9-4465-7924-08d9682d47a2
X-MS-TrafficTypeDiagnostic: DM6PR11MB3083:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB3083E345E29B76BFE00BDC13F4C79@DM6PR11MB3083.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j27FdRR8GkCaDq1sGmTBvPmWlN+RNTODlRfOFQluFv/lBLrfAdkGO1rEohxm25Rm815GHR5BqY3C40B3LM4GFffGKOjJNfcFi3sHqTfhACYKEudofY1EMeWGxwrkAx8RdEpYKU/jZLiN9swDBZAyuSsnltzhLVfPPP5utdudYIOXnk8Ek+DocCHXhKrKjjV5aE2UL5Il1o5fivLNP/Thp2yBI8/eQX53pEEo15FcQJcVu9l5YK67Av0UqNWsuMkXm6ube7UkWWCGhXkkuNYMoK31fPPTMXfGkIpOujQHRLdGOBnUgjrjIc2Y59i3e91+ieBkge3MRgzbvbdD3GooJXRLC/QJq7y4lRSe6QJhRwBa0xgy4+NsCNOool52WfjsICA/v2dBF5aMMf7+4PJqK6jjuBZocCqzF3gO6i2URxPCh6deA/3DuDPJruJdrwp1Tnzr7Fwk3a0B4DIw0Rep/CE19D4MyB8pZhT5C+clhwTk2KmO1zSijr6XScBcko2+ErC7Gak5x1J9PowT92oEvInxZ02NsGzMVAn3D5VXM3Nr8Ad6+zY6xCFY/4v02Z0BnH01QGEo9FwULcBYy5qitGSjfh7awRB8K6ve1V0yDg9IePGJpdT/pctlKByKxhZWZlxIj6H4KsoUzuXjkEwiF7MOVf0V8tJYcBgo7b3XjgVXjDdSYKuii5VU3iYJ7MjTPMg2ZhaXM13qkhh6CFkh6NBhHaCzvSh53v4LKfpXHXoyDX4u1God6uxSxG7HmkZ6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(5660300002)(4326008)(956004)(6486002)(30864003)(83380400001)(2906002)(8936002)(2616005)(66946007)(66476007)(66556008)(36756003)(8676002)(186003)(26005)(478600001)(31696002)(53546011)(316002)(31686004)(38100700002)(86362001)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDRjV0xOSUorYXJuTVBPWFFSL1pyVmpweTNiZXVTb1RsT3VIaW1pQVV6dzBj?=
 =?utf-8?B?eFZxQ000aFh5ZytVWGtBdUxVcUJCejVUWkJRdXpjRVVrRmhFQjFrSjlRVC9r?=
 =?utf-8?B?L3U3bGlSamRsS0wrMDVLZkRFU1R2K2kzU1BzdkFPallVbXl4Mmd0R2N0TVB1?=
 =?utf-8?B?Q1BScWR4OHhvS0Q1a3AyME1nSEthQW9GQnFTWkhCN3JNeWRQdlBwREIyZkN5?=
 =?utf-8?B?Z0xabENST0xXaldzQzEzUm5UZzlKQU51QitEOTl1ZGcxNEp5V0FJaUhCckZn?=
 =?utf-8?B?MWlMY1FTWXU1RzBWL1BlcWJVbUl6TThxQ0tHZlRjU08rUCtmUU5VQm1wVGFr?=
 =?utf-8?B?cTJkRGZmRmxtQ0xyTm9LM0NuSW0ydTFaTWFURExnb0ZSMytTR1dUYjIxZnJr?=
 =?utf-8?B?MmRmWE0ySW1RMlVCMTlJMWYvMm9taWN6T1UwYnFJZXA5VWhidWJpcy9DenBp?=
 =?utf-8?B?U3VoZTZDWTJpdjdjcGIycGp6U3RkMUJob2k2MG5jalpPeXlrOWs0OG0wRmRZ?=
 =?utf-8?B?MWY3b3F1ZU5ndGw2ZGYzdU1EaTZ3OTZJNW1vYnpKSGoxZlgwT2pGbzBpOUh3?=
 =?utf-8?B?cHhDMDFhazk0ZHpJUWVsbHFDdmNZT2t4WEkzZytSN3MxZFpBaURVZDgwS0ZX?=
 =?utf-8?B?SHNreDVndGkwNmVzQUswMjVuZTFhL3hzVlZyOU9aN3I3WmwwRUU0Ni9KdXNQ?=
 =?utf-8?B?YmFDV01XMisrMWo3NFBmeThEWW1TUE9uVFV3S0NPUFcyYW1ZOUZOdzB5WHJa?=
 =?utf-8?B?S0pHSkY1V1lDS1hKV1o3a2grWVBTQW9kYUtMRVd0bU40Sk92YlFCYUR2cFc3?=
 =?utf-8?B?Z2VDVnBDL0Q5NWtobTJqMjhjdnpaVVl6a0NxU1g0Y0ozK2pvcFpkYVZva0pz?=
 =?utf-8?B?ZGwwMkYzSjdqV09nenBCZUk3NHQ2VTlxUlNHTFJuRWc5WGZiT29xMVg2cDgr?=
 =?utf-8?B?b0tSM2RNZ0V6N3JPSktCNWg5QnoxMVVXQ0hIUmtqWUZSd1plV2FkTE1vdVZn?=
 =?utf-8?B?bktYeHczMmNUUTJTVDRlTjRnVjljdkJhdm1aWlJPaDl6VHJIbzBmM21EdEpw?=
 =?utf-8?B?R1ozeDBLWlhRUVpDa2ovaVR6a0VsdFhEckw0MDhFa3hLZ0JtVTRraWlNTVpO?=
 =?utf-8?B?NUdmK0x1TkV2Tis4ME1YSFl0dW5RaFJ2amdlYzVCd0VTL1JUeHR1eXhrM012?=
 =?utf-8?B?QjQ4UlZ6OTVET1VrTkVpZjJFNk9FWkhSMWc3RkhRL2Jua2NUcTY3Wi9Kb2FQ?=
 =?utf-8?B?eUtpWEhKZU9yc1Z3VEkzZVFheXRZa0xMVEkvaWhjbmRFZVIzUE9qWC9JMmpi?=
 =?utf-8?B?bE5IVU5PSWZtM2pnc1BJRFM4M3l4Z2pNTE1xdkpKclRnQUxjcFZTdGRSYW5v?=
 =?utf-8?B?ekIxS3pQbEhndzAzenhXM3VQdktkbllqL3RNenZzYUs5UkN4V05qSXkvcFdT?=
 =?utf-8?B?N0FLYVJmUUJjNFdGOXYxSkkrMmt1R2ljRUFUV2l4KytKKzNvekt3bGw1N21m?=
 =?utf-8?B?Nm9EUUdacThkRXVLckhwbG9STkkyMzFtclk5NE5hN0pRL20wYWt0ZjlmQTlx?=
 =?utf-8?B?NC9qY1RCZGlQRWN0Yk8zaTY4eDBWNVQ0UjIrcmNFd093MmR4cjNxa1pFb0JP?=
 =?utf-8?B?UytVMStnYUVacXBnbTV1ZVpuYU1aNzdJemxlbUJIUUptWFR4NG5Wbjd2TkZW?=
 =?utf-8?B?QkV4NmdHS3NMYUdaajRZQ2xvMkorbmZUWjZqd3k0akVBQ0lKTzZqRDhlSkx1?=
 =?utf-8?Q?bdRM3WJIdTikxN7PjWE/x4v7lS79HqW70z7vkAS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf3c0bb-fde9-4465-7924-08d9682d47a2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 01:03:13.6075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JPMDWfUBPXXqKiPcL7FnxCh9amK+Dy0oJgC5mXKjcsjOpsOtE/2fPtNl1Bv5TKwYZE/MEsGNwNCCCLyofIAzqY1+LpdTfF2Gs9B2/UuzYto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3083
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



On 8/18/2021 11:16 PM, Matthew Brost wrote:
> Add GuC kernel doc for all structures added thus far for GuC submission
> and update the main GuC submission section with the new interface
> details.
>
> v2:
>   - Drop guc_active.lock DOC
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context_types.h | 44 ++++++---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        | 19 +++-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 97 ++++++++++++++-----
>   drivers/gpu/drm/i915/i915_request.h           | 18 ++--
>   4 files changed, 128 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 66286ce36c84..80bbdc7810f6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -156,40 +156,52 @@ struct intel_context {
>   	u8 wa_bb_page; /* if set, page num reserved for context workarounds */
>   
>   	struct {
> -		/** lock: protects everything in guc_state */
> +		/** @lock: protects everything in guc_state */
>   		spinlock_t lock;
>   		/**
> -		 * sched_state: scheduling state of this context using GuC
> +		 * @sched_state: scheduling state of this context using GuC
>   		 * submission
>   		 */
>   		u32 sched_state;
>   		/*
> -		 * fences: maintains of list of requests that have a submit
> -		 * fence related to GuC submission
> +		 * @fences: maintains a list of requests are currently being
> +		 * fenced until a GuC operation completes
>   		 */
>   		struct list_head fences;
> -		/* GuC context blocked fence */
> +		/**
> +		 * @blocked_fence: fence used to signal when the blocking of a
> +		 * contexts submissions is complete.
> +		 */
>   		struct i915_sw_fence blocked_fence;
> -		/* GuC committed requests */
> +		/** @number_committed_requests: number of committed requests */
>   		int number_committed_requests;
> -		/** requests: active requests on this context */
> +		/** @requests: list of active requests on this context */
>   		struct list_head requests;
> -		/*
> -		 * GuC priority management
> -		 */
> +		/** @prio: the contexts current guc priority */
>   		u8 prio;
> +		/**
> +		 * @prio_count: a counter of the number requests inflight in
> +		 * each priority bucket
> +		 */
>   		u32 prio_count[GUC_CLIENT_PRIORITY_NUM];
>   	} guc_state;
>   
>   	struct {
> -		/* GuC LRC descriptor ID */
> +		/**
> +		 * @id: unique handle which is used to communicate information
> +		 * with the GuC about this context, protected by
> +		 * guc->contexts_lock
> +		 */
>   		u16 id;
> -
> -		/* GuC LRC descriptor reference count */
> +		/**
> +		 * @ref: the number of references to the guc_id, when
> +		 * transitioning in and out of zero protected by
> +		 * guc->contexts_lock
> +		 */
>   		atomic_t ref;
> -
> -		/*
> -		 * GuC ID link - in list when unpinned but guc_id still valid in GuC
> +		/**
> +		 * @link: in guc->guc_id_list when the guc_id has no refs but is
> +		 * still valid, protected by guc->contexts_lock
>   		 */
>   		struct list_head link;
>   	} guc_id;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 2e27fe59786b..112dd29a63fe 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -41,6 +41,10 @@ struct intel_guc {
>   	spinlock_t irq_lock;
>   	unsigned int msg_enabled_mask;
>   
> +	/**
> +	 * @outstanding_submission_g2h: number of outstanding G2H related to GuC
> +	 * submission, used to determine if the GT is idle
> +	 */
>   	atomic_t outstanding_submission_g2h;
>   
>   	struct {
> @@ -49,12 +53,16 @@ struct intel_guc {
>   		void (*disable)(struct intel_guc *guc);
>   	} interrupts;
>   
> -	/*
> -	 * contexts_lock protects the pool of free guc ids and a linked list of
> -	 * guc ids available to be stolen
> +	/**
> +	 * @contexts_lock: protects guc_ids, guc_id_list, ce->guc_id.id, and
> +	 * ce->guc_id.ref when transitioning in and out of zero
>   	 */
>   	spinlock_t contexts_lock;
> +	/** @guc_ids: used to allocate new guc_ids */
>   	struct ida guc_ids;
> +	/**
> +	 * @guc_id_list: list of intel_context with valid guc_ids but no refs
> +	 */
>   	struct list_head guc_id_list;
>   
>   	bool submission_supported;
> @@ -70,7 +78,10 @@ struct intel_guc {
>   	struct i915_vma *lrc_desc_pool;
>   	void *lrc_desc_pool_vaddr;
>   
> -	/* guc_id to intel_context lookup */
> +	/**
> +	 * @context_lookup: used to resolve intel_context from guc_id, if a
> +	 * context is present in this structure it is registered with the GuC
> +	 */
>   	struct xarray context_lookup;
>   
>   	/* Control params for fw initialization */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 4b9a2f3774d5..7e0a32e729c2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -28,21 +28,6 @@
>   /**
>    * DOC: GuC-based command submission
>    *
> - * IMPORTANT NOTE: GuC submission is currently not supported in i915. The GuC
> - * firmware is moving to an updated submission interface and we plan to
> - * turn submission back on when that lands. The below documentation (and related
> - * code) matches the old submission model and will be updated as part of the
> - * upgrade to the new flow.
> - *
> - * GuC stage descriptor:
> - * During initialization, the driver allocates a static pool of 1024 such
> - * descriptors, and shares them with the GuC. Currently, we only use one
> - * descriptor. This stage descriptor lets the GuC know about the workqueue and
> - * process descriptor. Theoretically, it also lets the GuC know about our HW
> - * contexts (context ID, etc...), but we actually employ a kind of submission
> - * where the GuC uses the LRCA sent via the work item instead. This is called
> - * a "proxy" submission.
> - *
>    * The Scratch registers:
>    * There are 16 MMIO-based registers start from 0xC180. The kernel driver writes
>    * a value to the action register (SOFT_SCRATCH_0) along with any data. It then
> @@ -51,14 +36,82 @@
>    * processes the request. The kernel driver polls waiting for this update and
>    * then proceeds.
>    *
> - * Work Items:
> - * There are several types of work items that the host may place into a
> - * workqueue, each with its own requirements and limitations. Currently only
> - * WQ_TYPE_INORDER is needed to support legacy submission via GuC, which
> - * represents in-order queue. The kernel driver packs ring tail pointer and an
> - * ELSP context descriptor dword into Work Item.
> - * See guc_add_request()
> + * Command Transport buffers (CTBs):
> + * Covered in detail in other sections but CTBs (host-to-guc, H2G, guc-to-host
> + * G2H) are a message interface between the i915 and GuC used to controls
> + * submissions.
> + *
> + * Context registration:
> + * Before a context can be submitted it must be registered with the GuC via a
> + * H2G. A unique guc_id is associated with each context. The context is either
> + * registered at request creation time (normal operation) or at submission time
> + * (abnormal operation, e.g. after a reset).
> + *
> + * Context submission:
> + * The i915 updates the LRC tail value in memory. Either a schedule enable H2G
> + * or context submit H2G is used to submit a context.

I would elaborate a bit more here. something like:

"i915 must enable the scheduling of the context within the GuC for the 
GuC to actually consider it. Therefore, the first time a disabled 
context is submitted we use a schedule enable H2G, while follow up 
submissions are done via the context submit H2G, which informs the GuC 
that a previously enabled context has new work available."


> + *
> + * Context unpin:
> + * To unpin a context a H2G is used to disable scheduling and when the
> + * corresponding G2H returns indicating the scheduling disable operation has
> + * completed it is safe to unpin the context. While a disable is in flight it
> + * isn't safe to resubmit the context so a fence is used to stall all future
> + * requests until the G2H is returned.
> + *
> + * Context deregistration:
> + * Before a context can be destroyed or we steal its guc_id we must deregister

or "if" we steal ... ?

Looks ok part from these nits.

Daniele

> + * the context with the GuC via H2G. If stealing the guc_id it isn't safe to
> + * submit anything to this guc_id until the deregister completes so a fence is
> + * used to stall all requests associated with this guc_ids until the
> + * corresponding G2H returns indicating the guc_id has been deregistered.
> + *
> + * guc_ids:
> + * Unique number associated with private GuC context data passed in during
> + * context registration / submission / deregistration. 64k available. Simple ida
> + * is used for allocation.
> + *
> + * Stealing guc_ids:
> + * If no guc_ids are available they can be stolen from another context at
> + * request creation time if that context is unpinned. If a guc_id can't be found
> + * we punt this problem to the user as we believe this is near impossible to hit
> + * during normal use cases.
> + *
> + * Locking:
> + * In the GuC submission code we have 3 basic spin locks which protect
> + * everything. Details about each below.
> + *
> + * sched_engine->lock
> + * This is the submission lock for all contexts that share a i915 schedule
> + * engine (sched_engine), thus only 1 context which share a sched_engine can be
> + * submitting at a time. Currently only 1 sched_engine used for all of GuC
> + * submission but that could change in the future.
> + *
> + * guc->contexts_lock
> + * Protects guc_id allocation. Global lock i.e. Only 1 context that uses GuC
> + * submission can hold this at a time.
> + *
> + * ce->guc_state.lock
> + * Protects everything under ce->guc_state. Ensures that a context is in the
> + * correct state before issuing a H2G. e.g. We don't issue a schedule disable
> + * on disabled context (bad idea), we don't issue schedule enable when a
> + * schedule disable is inflight, etc... Also protects list of inflight requests
> + * on the context and the priority management state. Lock individual to each
> + * context.
> + *
> + * Lock ordering rules:
> + * sched_engine->lock -> ce->guc_state.lock
> + * guc->contexts_lock -> ce->guc_state.lock
>    *
> + * Reset races:
> + * When a GPU full reset is triggered it is assumed that some G2H responses to
> + * a H2G can be lost as the GuC is likely toast. Losing these G2H can prove to
> + * fatal as we do certain operations upon receiving a G2H (e.g. destroy
> + * contexts, release guc_ids, etc...). Luckly when this occurs we can scrub
> + * context state and cleanup appropriately, however this is quite racey. To
> + * avoid races the rules are check for submission being disabled (i.e. check for
> + * mid reset) with the appropriate lock being held. If submission is disabled
> + * don't send the H2G or update the context state. The reset code must disable
> + * submission and grab all these locks before scrubbing for the missing G2H.
>    */
>   
>   /* GuC Virtual Engine */
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index d818cfbfc41d..177eaf55adff 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -290,18 +290,20 @@ struct i915_request {
>   		struct hrtimer timer;
>   	} watchdog;
>   
> -	/*
> -	 * Requests may need to be stalled when using GuC submission waiting for
> -	 * certain GuC operations to complete. If that is the case, stalled
> -	 * requests are added to a per context list of stalled requests. The
> -	 * below list_head is the link in that list.
> +	/**
> +	 * @guc_fence_link: Requests may need to be stalled when using GuC
> +	 * submission waiting for certain GuC operations to complete. If that is
> +	 * the case, stalled requests are added to a per context list of stalled
> +	 * requests. The below list_head is the link in that list. Protected by
> +	 * ce->guc_state.lock.
>   	 */
>   	struct list_head guc_fence_link;
>   
>   	/**
> -	 * Priority level while the request is inflight. Differs from i915
> -	 * scheduler priority. See comment above
> -	 * I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP for details.
> +	 * @guc_prio: Priority level while the request is inflight. Differs from
> +	 * i915 scheduler priority. See comment above
> +	 * I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP for details. Protected by
> +	 * ce->guc_active.lock.
>   	 */
>   #define	GUC_PRIO_INIT	0xff
>   #define	GUC_PRIO_FINI	0xfe


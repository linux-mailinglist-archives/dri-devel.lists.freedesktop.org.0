Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB4143A574
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 23:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A9489A14;
	Mon, 25 Oct 2021 21:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF6689973;
 Mon, 25 Oct 2021 21:07:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="209848460"
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="209848460"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 14:07:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="721806039"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga006.fm.intel.com with ESMTP; 25 Oct 2021 14:07:15 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 25 Oct 2021 14:07:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 25 Oct 2021 14:07:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 25 Oct 2021 14:07:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQSNj1kk5psBEWCy5CpZFUbIGUrQMVxSP6tr3Je9tEc7KSySdKjHtHpcZlRbLVknPg326it/sx3X8ze0OgnElvQ5IZ5b1jVGfyLIYQGZSD1PWnofB0iUfsJvMgBsOrXLtm4cZKDmbOEH+Vge9II42RNET5r56Aak/PNPWEO8duuhv40b1O2WPd9JWLjxGkvn7A2OTwukNcdU5oEiFZkL6HCF3Axx/OeQ2D9ZJ43oF87g3+FWeSMN9BuZ8hDvzhncqvgfEKQtSphok9KsnGgrkV8EUvyMZ/SmtZ7c9nNng2/tR9BbYFzrspOKUhcjeIZYXFkVzWQVfO+pUPyDfswIxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p18GWMWYVeKmVUXf4hqkUEnapiW7XottLOlCyNyepW4=;
 b=kI/zcVVxtm0+zc+KbsLVR3nrPeHnOk84/9dEtwu7af1xUgW+UpNNt+QliwOzZLhbcu6BSkJVVYnLq4xFzfofI2oLEbOgwu1KBnBXuYB2ECQ5RGfCHsCLxTdR4JbEqdrBHEn013l9NWKBS2m+fDEbbgirOe5zVLv1eV4Gmu/7rl+muKETmLLkrQ7pyKl+MFRN0AhTZxXe/i8iY5GBZpyM/Tl+MANsyOizzzne3hJKqjDDOk1M/wTiXfsRVMOfDVCoiqnV2QtAeo7qtBj98+E9poQ9IRmMYXZdrqyM8souF9hjB2lT8snFNfiQlhPDBe4E0OMGhR0Pedd8cQzmS6Ry/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p18GWMWYVeKmVUXf4hqkUEnapiW7XottLOlCyNyepW4=;
 b=UR3ucEiA2Plx+XdSi2CjdxqvrUD1BQMzNNCurqP/AFyvsFBvNuB02lwt+qQx1roJe8B+3conQJnG3zBsYtC0PNEbHW8yT2z1Ff+HGsNc0bnKl3OYSQTyhh/FdqZecaMOwIWoR979XclN4l/7/gdzWDAze8K2DkG8YFTD05nMlgU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5660.namprd11.prod.outlook.com (2603:10b6:510:d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 21:06:57 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4628.018; Mon, 25 Oct 2021
 21:06:57 +0000
Message-ID: <fd148c6c-4bd9-6a28-f096-80d9a41778fc@intel.com>
Date: Mon, 25 Oct 2021 14:06:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/i915/trace: Hide backend specific fields behind
 Kconfig
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <joonas.lahtinen@linux.intel.com>, <daniele.ceraolospurio@intel.com>
References: <20211025163404.2774-1-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211025163404.2774-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR22CA0056.namprd22.prod.outlook.com
 (2603:10b6:300:12a::18) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR22CA0056.namprd22.prod.outlook.com (2603:10b6:300:12a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Mon, 25 Oct 2021 21:06:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6397cd0e-2c61-4d57-2175-08d997fb60f2
X-MS-TrafficTypeDiagnostic: PH0PR11MB5660:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB5660919824D3610F09FA32B3BD839@PH0PR11MB5660.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b5O8DlL9Y5NBb6LZXGLPKjVb8fzbjGnxImyqT412YBAApauf3Q7Cfx5J6ndUskDhhRhb+UA3z0ufL+Qic4RyZqH9/V2YTaIeLVFyS8ITnNYGnI9PrYbixK6GvDddmLT8amAxVoIGuYVqUMW0HQ8povhtNjDGuwNYIyMxUG0EIGLe2StWfFjDvupBxMldcUL7h0xYfko1Oz3fWe//PQhrudmw1k71gzrEswCEL0FbdOHffnWz3//w6XFiIgbvFfam5UYLqsbI0ETxbVmwtlr8TleSOOq+MkjWc42gx3CTgvcCNO1GId0qtHr+uzlziRDfF3Cb0q0pHT5OwtZPRRkgrjVgOxu0LVDiHGAvVrtqLdi6FG2B6tIxkr+YAS78sbkM5lV73BJTgjzyTJkIf5ocRR0b7xWulkLUZilAlH0L5zVmfNIwFLVJnEc4oIxf5/ArR/Qosbo9FieG9R0wFzzeTSvXIjXz3hmJTiOB/Qj+x1Wi0H8LxpzHDbWRGi2uCB2yof+HnWirLIZJFUco3fwtmx9mgIupG2SZdKZF/jei7lbzsNHmrla8S20pPwllB8vh4427loXeFEoVEaK3pb0V5RZ/MVvJ16xuCPKOtu18D6e5lgG/sK2qRQZmiyJpLzjmHmq09GVxIhshOlAfgBYfzKXefCJX8q7KHtvp9+a0sGtRiMthFdKfCh2hOGIQq43RpDfmiN3TA9w/GTfmquxwec4TDy2ic1VWiLs0/TmErX1O2s19S/7xg8EgzJVlCwzg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(66946007)(4326008)(36756003)(956004)(66556008)(86362001)(31686004)(83380400001)(6486002)(8936002)(2616005)(508600001)(8676002)(38100700002)(26005)(5660300002)(186003)(53546011)(316002)(16576012)(31696002)(2906002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWpESlIwVWVRQm1IaDB4YjN6d3Y5OFk3RjN5S0JtMTkyOUwxdGlCMXdBenBx?=
 =?utf-8?B?MXh3OHlEUW5wRW1pYVJmd3ExbzIrVHlKWHFaMWdCMDlhckg5cldpdXRxbDJy?=
 =?utf-8?B?TGxmc0pVakFWYXVtbWdINUJMM0lSZjJCVE5yWkphZG9RbGRUbmpzWXY5MWdJ?=
 =?utf-8?B?UUxzQmJ2VlJaTlJJUnU3MHZtK1EzSHZKYkJ3TXlabklCanFDeTJSUGhrZEpn?=
 =?utf-8?B?aHRrZXNOYUU3NWd6eG5zclp5Ti9vRVNYUjR5VVkxbU9NV1Bhd0E1dUJWY3Yr?=
 =?utf-8?B?ZUkzTVkrczRwdHhoZERKQXJ6NDZoNEtlVkNCcVVFN092ZEc4Q0R0VjFEMlRG?=
 =?utf-8?B?K2tjQ3VIdXViUWoraUQrYmhuK1VXMEVWNUNIMU9lNjNHTkkwV25IYmp0Tm96?=
 =?utf-8?B?anhwd3VQZEdLaGdMTFlLRW4zY2FwQ2hDejFrb3R3TE9JU0NERnorOGswQmli?=
 =?utf-8?B?R2NSdFRoQ0RJZ2pVNGRRazdjTG13a09acWY4Ymg1ZVMzVUttR3RmcjQ2Y0w0?=
 =?utf-8?B?UVRiL05uN2JpTGNiVTgwdVFFdEFZdzJ2eXRKZDdRME83TmVPMkNIemRybExG?=
 =?utf-8?B?Q0txSGFFVEJSZlhSN3FNWWtmRDBQSkZQbHZadnlpSUJ6OVFtd2hrVlRjVFU5?=
 =?utf-8?B?RGRPZy96L2lTQWRjUTBPSjcrQk9SVE9HdERZQkkrQUZRcVdPMldtS3VTdnNX?=
 =?utf-8?B?ZVJZek9UeUEvV0t6RXRSemU2b2M1STB5ZndDQXMyTS94YmhQZUVpSFhxdHBn?=
 =?utf-8?B?N2kycUd0dVh4VlMvWkxmejZTdWdxSGFlTE4ycENDNWxhOURqN0JCOHpSdkFr?=
 =?utf-8?B?STVwNHFhemU4ZURlQXM3c1k3VjJTUExGNGF1Y0RJa3R2eW9NUnhKSjU2T1Bt?=
 =?utf-8?B?NHBlZEdhMjllSjh6SVN2SFV6ejZKOHB2a2VyWVJweXJjdXY2TFUzVVhVVEM0?=
 =?utf-8?B?MWloQm5SaVI3OHU4VlpCL3VpTGxpQzh0TEk4dyszL3BiZXBMSGFRcmp4Q2Zi?=
 =?utf-8?B?VXYyb2pPZU5LcG52K0MzQzNnQVpkUzJzZkI5OEsrUk5ULzM3U1k4OXJNSE41?=
 =?utf-8?B?QlBFMUZMVkpZVkRxTkZTdmpYKzB0bWZzdXUyZkpnZVVVRWkxNjU2OGloVWNi?=
 =?utf-8?B?alRxU2Y0TVF0VFl3TUxqVm9CSUlCSFBKRlhPVE9ucldHWEVlSEFYQnZuSUtL?=
 =?utf-8?B?TUtoV05hN1RnSEd3cFNFd2FTemo2Sjd3eTJHbFFJQlF2dFZkTGtWUkhlTi9a?=
 =?utf-8?B?THN0WFVZQVd0WHluVnpaR1J5bDhlRmZCVnU0czBpb2lwZlZjV3NHV1RZRVgw?=
 =?utf-8?B?WFRlREJjZU5lQis3dHYxNTJ4bVViQ1QwMHFlTWc5WTc5VUFlL3ZTbnNJL2xN?=
 =?utf-8?B?K1hxWXA4dml5czgzcjZhUldGaVQ4WlRKVTJZVTgwSTlGNVY4NkNyNlhBcGdl?=
 =?utf-8?B?QzR3ZDV2UzBHdHdtNHp5UkRDMlJ4TlBJR2lsa3FiNzJ4dkpEY0h1TTV5SEQ2?=
 =?utf-8?B?WUhoenpzS2E3azZDTTJnYlFOZ2hvNG1oQzZGSkdRU0dmNjdxc0xqcFhUSEpB?=
 =?utf-8?B?TmYxZGlCdUFGQklLdm94OElTZEpNakxpcVM4a0Z2STdUNlVJRWx3dWJJbzhl?=
 =?utf-8?B?cDNEWW1LaytVUWh5R1AwWUR3c2NLTndzdURzaGl1YkZTVHd3c093S3p1QUNV?=
 =?utf-8?B?MHJlS1ArL3Q2bDBtUHBxcmx6b3p1VGhLN2k3bFFhMERoeUJVU2RoeUpqa3cr?=
 =?utf-8?B?REovdGFqTmVCVG12QThxK0w0WGRvMjE0Vk82TURVUVYvNmE3eFpDL3kzalNq?=
 =?utf-8?B?WTNYSU1DZDExVEFiNDNTT2UwZ1RwQUpCZUJHamc1U2ZrY2IyS24rMjFLTTFJ?=
 =?utf-8?B?T2UrS04vaVBaNWhOQUJ1R0NubS9rL3hvMTZyTVJmdnZCMW5Na0txZ0hjcnU3?=
 =?utf-8?B?SFF0dEJZOXJuenZNcW45eVZBbWo1Qm8vN3hBcjVrVldqK0VmSmg4QytORUNJ?=
 =?utf-8?B?bFkvVXcza2VnZjl0Y25Ja3l4QXVLVlBScjFIOUZNLzhhYUxuUmttWjc3M3Uv?=
 =?utf-8?B?aGpkMndkb2VpY08zSWRtOHkvSFpYMGFtcGpjenZRSURKdnAvTHhpRk53aFgr?=
 =?utf-8?B?WDcxek1DNE5rZ29GR2J3Y1VHdmI5TDZRMjdJeWVFbEhEN0p5YVh3cFJpMmp5?=
 =?utf-8?B?bENSZFgwWnVRNDE1Wld4Vk02alc4MFJpaGZDTUx1NWpXQXdaQTRlNy8zekpW?=
 =?utf-8?Q?6cQ7YB5oRzAoc4WFswzqTdf8nWm/TT6AJZp9pjVHTM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6397cd0e-2c61-4d57-2175-08d997fb60f2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 21:06:57.0305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1XMfCDKwq8DuKR7ip4mEcC2xfUWabbmFHPqMqmnUK9MWqGgG/y+gFzVjG+jFkHnXQYa4HS8kdLXDqJ9VRrSdTBrq836a6YRV82PRH/+MLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5660
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

On 10/25/2021 09:34, Matthew Brost wrote:
> Hide the guc_id and tail fields, for request trace points, behind
> CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS Kconfig option. Trace points
> are ABI (maybe?) so don't change them without kernel developers Kconfig
> options.
The i915 sw arch team have previously hard blocked requests for changes 
to trace points from user land tool developers on the grounds that trace 
points are not ABI and are free to change at whim as and when the i915 
internal implementation changes. They are purely for use of developers 
to debug the i915 driver as the i915 driver currently stands at any 
given instant.

So I don't see how it can be argued that we must not update any trace 
points to allow for debugging of i915 scheduling issues on current 
platforms. And having to enable extra config options just to keep 
existing higher level trace points usable seems broken.

John.


>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_trace.h | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> index 9795f456cccf..4f5238d02b51 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -787,6 +787,7 @@ TRACE_EVENT(i915_request_queue,
>   		      __entry->ctx, __entry->seqno, __entry->flags)
>   );
>   
> +#if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS)
>   DECLARE_EVENT_CLASS(i915_request,
>   	    TP_PROTO(struct i915_request *rq),
>   	    TP_ARGS(rq),
> @@ -816,6 +817,32 @@ DECLARE_EVENT_CLASS(i915_request,
>   		      __entry->guc_id, __entry->ctx, __entry->seqno,
>   		      __entry->tail)
>   );
> +#else
> +DECLARE_EVENT_CLASS(i915_request,
> +	    TP_PROTO(struct i915_request *rq),
> +	    TP_ARGS(rq),
> +
> +	    TP_STRUCT__entry(
> +			     __field(u32, dev)
> +			     __field(u64, ctx)
> +			     __field(u16, class)
> +			     __field(u16, instance)
> +			     __field(u32, seqno)
> +			     ),
> +
> +	    TP_fast_assign(
> +			   __entry->dev = rq->engine->i915->drm.primary->index;
> +			   __entry->class = rq->engine->uabi_class;
> +			   __entry->instance = rq->engine->uabi_instance;
> +			   __entry->ctx = rq->fence.context;
> +			   __entry->seqno = rq->fence.seqno;
> +			   ),
> +
> +	    TP_printk("dev=%u, engine=%u:%u, ctx=%llu, seqno=%u",
> +		      __entry->dev, __entry->class, __entry->instance,
> +		      __entry->ctx, __entry->seqno)
> +);
> +#endif
>   
>   DEFINE_EVENT(i915_request, i915_request_add,
>   	     TP_PROTO(struct i915_request *rq),


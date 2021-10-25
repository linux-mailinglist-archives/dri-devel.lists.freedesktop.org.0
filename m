Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0475E439CEC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 19:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0747893A7;
	Mon, 25 Oct 2021 17:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE72F893A7;
 Mon, 25 Oct 2021 17:07:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="216616640"
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="216616640"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 10:06:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="721724350"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 25 Oct 2021 10:06:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 25 Oct 2021 10:06:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 25 Oct 2021 10:06:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 25 Oct 2021 10:06:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vxf/IukktJ9t/M+G7f51q7ZpRCDPlIlw6qGVpXzRK27A1PBXR+JRKNXF8cNcVHpRwAzQM8ngQhWgyvFRdGKtHtC/Dws64mz1QleXJjfrrpxlJZ6f8ocKD+q5lVbg5sYVA1NgLC0VQSRffPOyK73rmelXdqpp4+LHI94rFe0wNpH6HA2PZlEaT8nyUC74HFhqCoUvQ5jO0pbv1vxr+v288bqeqWlda4wtdtftm7LubywFLpuC3qPbLoMp5/M+PUXW3tR0mdgKhnKF/R8Jajy1XsCFJ2eDb6HjYlNpay81njbuW9M+Lz5JHSt7KPltNAKbaq5N4DyllJYdxKOmj3wW0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziM16cGJl5FvF2tebJeIUMq2mLZcALBsK2tDCbel3Mg=;
 b=c1I3c211JR7q/Z1sVHLiUtoZB+d/R0s2MW6YFHJ0O/VIQcc1Ydgj4C8V9HB4OJt3sWjYzqoJqk+lJRldYDwWLS6Ktu/KFtzfZ71dA2Qdph6A9te2ODadW6UDuk5Ag4gOw1BJUrU7p+JttcTPKtY5O+Vr6ifSb56KOLdoADe1YNCuSx+4zO5FVR3UuuzGMnh0iF+8s4+nU3cht5Ahd5NjIuY1V+goIUImk9Kdp2BYFrtBHW23dDbBPsRinpX527r2Tk2FswpwU3TIItwTkQ/0PypvpFdl4fZy4XzwfhNGsGlsVGQWwdf/iXyazCJmvwh+RwDChNjVGhrrEx4i0vgUKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziM16cGJl5FvF2tebJeIUMq2mLZcALBsK2tDCbel3Mg=;
 b=AAOYkntL7KtlZtVHozZTcgpiU//m9QYzcYufUPdlAKCfE9z8gFmfILP+Q8JZBn6FzfUrPqBqOuX+eziag6w89cPNqoHkuxZdrUrH0PzI/26so2nw1K7Mccp0XGG2DjOfDDUPV7l+ddMH7EQGLMLrCjqDKQTWGVB/4fG9leKJ0tE=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5580.namprd11.prod.outlook.com (2603:10b6:510:e5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 17:06:09 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4628.018; Mon, 25 Oct 2021
 17:06:09 +0000
Subject: Re: [PATCH 00/47] GuC submission support
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <daniele.ceraolospurio@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <163489530491.10153.576017085715728906@jlahtine-mobl.ger.corp.intel.com>
 <20211022164219.GA23160@jons-linux-dev-box>
 <163515462275.3804.10893210486918669519@jlahtine-mobl.ger.corp.intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <a28c2c07-114c-f89a-4a9c-9f91150f45f3@intel.com>
Date: Mon, 25 Oct 2021 10:06:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <163515462275.3804.10893210486918669519@jlahtine-mobl.ger.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:303:8f::16) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR03CA0011.namprd03.prod.outlook.com (2603:10b6:303:8f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Mon, 25 Oct 2021 17:06:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de25b3bf-6249-4b6f-725d-08d997d9bd62
X-MS-TrafficTypeDiagnostic: PH0PR11MB5580:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB5580E41A38EBFCAEE6503925BD839@PH0PR11MB5580.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j0oakDEiEfyGXeiiykci3eUF/SfZJX5CnDUrFgwJx6qcViv2qdKbE7lLq8FcIkzZBeAIB/t4zfWoYVX35LHIpLKiCzxT19prsDdj93MRZtF0/jchKwhdCjHFfpop/mTRQr20avai/eYT5VGVw6qYpp2M14Z56tjrLMt9Whbv6GyfwyKfPN5FwD93NSGXs8/WrnYqlBOftUICA7tCzBY8PUXj3uWm3S5rYwvvjJpwLd+YMczoQpOAKnXEboKKetxdwPC1CKAdvCJXlfbUP3aC/9DqAvfZ/vKg1a4txQ7pasKj3mSLOW3Mqckyiqee1x7e+FR20X+x8ORXRxmwlb2+mPGXLcKAl4PKIfR/SmGyUJEUsp6fom0eo4PgGwVg6fipvaQtiOu2h9sazWBuDxXdEnDXK63nP8cJtDsCo7WgWsa6mXH+l6wOOyIUlCvwhZEw4k8uqgsw1wx7m4L9fm5ptGVIzIWZKw2+SRNqvRB/bryh1WAWBu29mdBIk6DlppGfVU8urcRzYDL5W3NaEzta6RegphQHYGFlJ8aFldtHGVyJoC9DIN3pz/GKMrJtnYwojcgNz6sbWbbZPSFzwWWXNUppH7x2/L+sA0/HVT+qv5xtI1XUXSYaOnt/UlxphcPnozusPodB9ePbF8YKSXPIEhD1Wr8xQZr1OhxiQ4rsRLjm6tnWHSWhVxPDDJKbdTQXKjTjYrNp4ndx5dUAMBfiWK4K6fqXAwA+z570SHwbg1Sokx1b5kpSOzzXiaGCfXU8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4001150100001)(956004)(316002)(2616005)(36756003)(83380400001)(31696002)(66946007)(8936002)(38100700002)(5660300002)(82960400001)(4326008)(2906002)(110136005)(31686004)(8676002)(16576012)(6486002)(66476007)(186003)(53546011)(26005)(30864003)(66556008)(6636002)(966005)(508600001)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFpDZFhReHJtNVIzZnp6N3VlR24xbkV3NEludUhIQXVzY1VyZnNXS2JRaUdQ?=
 =?utf-8?B?a1N5QUJoL3B6NGtoWnA4TzNJRW0yVW0waENYMHdURmI3WDBnZEw0dlUxWVZG?=
 =?utf-8?B?RmlrTU55ZWtrS3VnTkFNNkpXTks2dm9aOTl2aWU0dVh1djlGaHp2R2JnWDh0?=
 =?utf-8?B?VlljcS9ETmZycnQ1VUI2UlMrKyswdGhyZ0xlU3NVQ01EVkh6YWRoeFlYandT?=
 =?utf-8?B?elBqSXdYMkhBaTArWXd0ZE9SckFRMTFlQnJUbVlmNG11ZnRWS0UwRldMSjFX?=
 =?utf-8?B?MmtVTGV3MTIwNDM0VUNnbjgwZFpNcHQ5WHlzWElZTzFhb0ZjVSs4N1Y3T2RU?=
 =?utf-8?B?a3gwU3o1RWpWdVNGeVc4ZzN6cTJ2dklmWFcrUDJPWUkrcDUraENOTDZIKzBU?=
 =?utf-8?B?T2tFMW9PcGMvd3pRK2Q1WEJmRlZoeW5KaDBRNWxVVUs2NGtxUTRFVjBKRTMw?=
 =?utf-8?B?NlY5T2tQQkpSUDdkbytBcitEYnBycWhiaXpYQkFuTWVMZDJ2czVXOGZTVzND?=
 =?utf-8?B?THcrZjVNb1FPTkFCNFg1dFFhNURxVWRSaWNQeUMxTmdIR3JXYng1Y3B4TUs5?=
 =?utf-8?B?bEl1Q3JmNmVSOGFrVXhXYi9yMUQ2WThXeUZBZ0V4YkdlWHB2elpMbms2OVRn?=
 =?utf-8?B?ekJ1eU1xcXhjL1JpQWJJYkpURy9SZFNDd0JkR3RtU1lrM0dTandLMlhnd2x4?=
 =?utf-8?B?aUVDeEh5dWQwd0FPT0lRZEx2eWZzM0pTK3h2T2ZqL0thSnVDa0hvRkEvaHgv?=
 =?utf-8?B?cHp0UVZwcU4yS0RYcHZaZXZBcm5LeTNNK2xXV21GZGE1cGo4K0hGRTVMOENQ?=
 =?utf-8?B?MzFrQll4WTllQ1VzdnVNS0cwVUpIeWE5OE9ManhsaWhUMnBneWNhbXFXZTBG?=
 =?utf-8?B?cmZ3OXorVE5MK0U2am9vaVNzeWJQbWJBcjBjZ0VtcjZFcFpSQ0N4d2U5V2xn?=
 =?utf-8?B?MzR4czl0ZFh1STgvZm1hNlNOSXpKQTVXRDlUWmpqRUVTTFZOODlyR0t1Njda?=
 =?utf-8?B?MlZsSHJGQ253K216ZDdOU0k3OHB4NERaQ2ZqTmQzZk1Da1dadmhCbW1sakhT?=
 =?utf-8?B?dUkrdHFDc2FqM2JPOWtNRER4dmkwMlFMcnBIN3BNTjBYZHRxTHo5T09pSDFF?=
 =?utf-8?B?R1Z1OS9WQnp3WWYwblA2d0tWbFE2TjFoNkVXQ1hTV01hNUdxQkpodUswc1VR?=
 =?utf-8?B?S3VKaTVsMlFVWjRwcGpZRW5qekI3b0I4S2t2Z0U3UGlwRFNBZDZ1RDRDUmsw?=
 =?utf-8?B?dkFwU2taT2F4QTBCbHF5ZlFtOVhzTkMxZ0plVi9oWVQ2eTJsY1hNUk9jbm1y?=
 =?utf-8?B?SzM5eGZGdGRlZkFDZVFZb1VOQk12UmhTTGRxbkk3Z1ZIVWRBV1RlNzJ3d01S?=
 =?utf-8?B?ajRWbllxWXZXSGJDS0ZCZ1k4Ump2RUNkS1p3alJEYmRZc0Zyck40cVJETHlX?=
 =?utf-8?B?QlZPYnU5eG5ERWUrQXlLQ3kySkhXWXErQzZoRE9IR0NHRWxTUng1NTBQdnBu?=
 =?utf-8?B?YmsvWFVtL1VqNFNoUzh2Rkl3TDdPMzREOWc4Vzc5c1oyT1RSTUFBZUFlNGw0?=
 =?utf-8?B?MUJyY2xneTlXM0ZWMmh0UVR5OUd4RjNPZHY4aGlvSDMybENNdEM0OXdzWS8w?=
 =?utf-8?B?czB3RzZsY2VpVDlyTVloWm1rYU9PdDBHeXV3TElpOGNZVHlUVWdQaDZmdW1k?=
 =?utf-8?B?cy9xVURsOFc3OWVIaUpNRWJRM1JaUnJuc2xoSVBYOU1HOThFY3dnU1A5czZG?=
 =?utf-8?B?UmdlSWZUMW1XY2pYUWJlRzRHTzZTWnJ0ZDJnTFd5QTFVb2tmZ3ZZVjUzYUxs?=
 =?utf-8?B?eU9XK3ZuTzU0QmtKazFFRzlBQkhqQjVLMnhMUFViMWNlNVl2T2s3QVFiRGhO?=
 =?utf-8?B?UC9ubi9IREduN1Y0dzVOOGt0elZEMGVnL3lTRmVBQVFCVVlBRjZHaTN0TE5s?=
 =?utf-8?B?K2tTZE9kc3daRVh2NzdsdmJTZ0NaTk0wTHg5eXFHeXRWOUVpekkySjdRY28y?=
 =?utf-8?B?VkMwQnE0ek5kSFFxNUh1T0h5RHpqbDdjcjBHclFQc3lIWm11MnJXbXBjWWZl?=
 =?utf-8?B?aUpYTVJUVjNsV3NySUljajNVWlpuMWtqb2k1eVJZZlRXeDlTVVRKaGFJS1lk?=
 =?utf-8?B?eUkvTUNENDV6YlAyT1FlZ2xNdE5QYjROOUJQRWY2dHNHc1o2Kzc2YWxlVzND?=
 =?utf-8?B?QVhFNHkzTklGVnlOQ3RTYkMwVmZrSTdyU1ZnWmJrMVNWbXVtRWRNZitMTjVp?=
 =?utf-8?Q?I1foWUCjOYM2EaffCASPdUW+GWimYTEMPhiEkaMBMw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de25b3bf-6249-4b6f-725d-08d997d9bd62
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 17:06:09.2749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrIqHzToiYcPRyjafDrhNHw/QsZkuZ3fMRJu7U8mvBlYh4qwTQgpkdy2IkJ9/eSraLPFSj+RK/GyNroLW7Dlobzw0x3Vx6Clv5Ngy6TafNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5580
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

On 10/25/2021 02:37, Joonas Lahtinen wrote:
> Quoting Matthew Brost (2021-10-22 19:42:19)
>> On Fri, Oct 22, 2021 at 12:35:04PM +0300, Joonas Lahtinen wrote:
>>> Hi Matt & John,
>>>
>>> Can you please queue patches with the right Fixes: references to convert
>>> all the GuC tracepoints to be protected by the LOW_LEVEL_TRACEPOINTS
>>> protection for now. Please do so before next Wednesday so we get it
>>> queued in drm-intel-next-fixes.
>>>
>> Don't we already do that? I checked i915_trace.h and every tracepoint I
>> added (intel_context class, i915_request_guc_submit) is protected by
>> LOW_LEVEL_TRACEPOINTS.
>>
>> The only thing I changed outside of that protection is adding the guc_id
>> field to existing i915_request class tracepoints.
> It's the first search hit for "guc" inside the i915_trace.h file :)
>
>> Without the guc_id in
>> those tracepoints these are basically useless with GuC submission. We
>> could revert that if it is a huge deal but as I said then they are
>> useless...
> Let's eliminate it for now and restore the tracepoint exactly as it was.
For what purpose?

Your request above was about not adding new tracepoints outside of a low 
level CONFIG setting. I can understand that on the grounds of not 
swamping high level tracing with low level details that are not 
important to the general developer.

But this is not about adding extra tracepoints, this is about making the 
existing tracepoints usable. With GuC submission, the GuC id is a vital 
piece of information. Without that, you cannot correlate anything that 
is happening between i915, GuC and the hardware. Which basically means 
that for a GuC submission based platform, those tracepoints are useless 
without this information. And GuC submission is POR for all platforms 
from ADL-P/DG1 onwards. So by not allowing this update, you are 
preventing any kind of meaningful debug of any scheduling/execution type 
issues.

Again, if you are wanting to reduce spam in higher level debug then 
sure, make the entire set of scheduling tracepoints LOW_LEVEL only. But 
keeping them around in a censored manner is pointless. They are not ABI, 
they are allowed to change as and when necessary. And now, it is 
necessary to update them to match the new POR submission model for 
current and all future platforms.


>
> If there is an immediate need, we should instead have an auxilary tracepoint
> which is enabled only through LOW_LEVEL_TRACEPOINTS and that amends the
> information of the basic tracepoint.
>
> For the longer term solution we should align towards the dma fence
> tracepoints. When those are combined with the OA information, one should
> be able to get a good understanding of both the software and hardware
> scheduling decisions.
I don't follow this. OA information does not tell you any details of 
what the GuC is doing. DRM/DMA generic tracepoints certainly won't tell 
you any hardware/firmware or even i915 specific information.

And that is a much longer term goal than being able to debug current 
platforms with the current driver.

John.


>
> Regards, Joonas
>
>> Matt
>>
>>> There's the orthogonal track to discuss what would be the stable set of
>>> tracepoints we could expose. However, before that discussion is closed,
>>> let's keep a rather strict line to avoid potential maintenance burned.
>>>
>>> We can then relax in the future as needed.
>>>
>>> Regards, Joonas
>>>
>>> Quoting Matthew Brost (2021-06-24 10:04:29)
>>>> As discussed in [1], [2] we are enabling GuC submission support in the
>>>> i915. This is a subset of the patches in step 5 described in [1],
>>>> basically it is absolute to enable CI with GuC submission on gen11+
>>>> platforms.
>>>>
>>>> This series itself will likely be broken down into smaller patch sets to
>>>> merge. Likely into CTBs changes, basic submission, virtual engines, and
>>>> resets.
>>>>
>>>> A following series will address the missing patches remaining from [1].
>>>>
>>>> Locally tested on TGL machine and basic tests seem to be passing.
>>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>
>>>> [1] https://patchwork.freedesktop.org/series/89844/
>>>> [2] https://patchwork.freedesktop.org/series/91417/
>>>>
>>>> Daniele Ceraolo Spurio (1):
>>>>    drm/i915/guc: Unblock GuC submission on Gen11+
>>>>
>>>> John Harrison (10):
>>>>    drm/i915/guc: Module load failure test for CT buffer creation
>>>>    drm/i915: Track 'serial' counts for virtual engines
>>>>    drm/i915/guc: Provide mmio list to be saved/restored on engine reset
>>>>    drm/i915/guc: Don't complain about reset races
>>>>    drm/i915/guc: Enable GuC engine reset
>>>>    drm/i915/guc: Fix for error capture after full GPU reset with GuC
>>>>    drm/i915/guc: Hook GuC scheduling policies up
>>>>    drm/i915/guc: Connect reset modparam updates to GuC policy flags
>>>>    drm/i915/guc: Include scheduling policies in the debugfs state dump
>>>>    drm/i915/guc: Add golden context to GuC ADS
>>>>
>>>> Matthew Brost (36):
>>>>    drm/i915/guc: Relax CTB response timeout
>>>>    drm/i915/guc: Improve error message for unsolicited CT response
>>>>    drm/i915/guc: Increase size of CTB buffers
>>>>    drm/i915/guc: Add non blocking CTB send function
>>>>    drm/i915/guc: Add stall timer to non blocking CTB send function
>>>>    drm/i915/guc: Optimize CTB writes and reads
>>>>    drm/i915/guc: Add new GuC interface defines and structures
>>>>    drm/i915/guc: Remove GuC stage descriptor, add lrc descriptor
>>>>    drm/i915/guc: Add lrc descriptor context lookup array
>>>>    drm/i915/guc: Implement GuC submission tasklet
>>>>    drm/i915/guc: Add bypass tasklet submission path to GuC
>>>>    drm/i915/guc: Implement GuC context operations for new inteface
>>>>    drm/i915/guc: Insert fence on context when deregistering
>>>>    drm/i915/guc: Defer context unpin until scheduling is disabled
>>>>    drm/i915/guc: Disable engine barriers with GuC during unpin
>>>>    drm/i915/guc: Extend deregistration fence to schedule disable
>>>>    drm/i915: Disable preempt busywait when using GuC scheduling
>>>>    drm/i915/guc: Ensure request ordering via completion fences
>>>>    drm/i915/guc: Disable semaphores when using GuC scheduling
>>>>    drm/i915/guc: Ensure G2H response has space in buffer
>>>>    drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC
>>>>    drm/i915/guc: Update GuC debugfs to support new GuC
>>>>    drm/i915/guc: Add several request trace points
>>>>    drm/i915: Add intel_context tracing
>>>>    drm/i915/guc: GuC virtual engines
>>>>    drm/i915: Hold reference to intel_context over life of i915_request
>>>>    drm/i915/guc: Disable bonding extension with GuC submission
>>>>    drm/i915/guc: Direct all breadcrumbs for a class to single breadcrumbs
>>>>    drm/i915/guc: Reset implementation for new GuC interface
>>>>    drm/i915: Reset GPU immediately if submission is disabled
>>>>    drm/i915/guc: Add disable interrupts to guc sanitize
>>>>    drm/i915/guc: Suspend/resume implementation for new interface
>>>>    drm/i915/guc: Handle context reset notification
>>>>    drm/i915/guc: Handle engine reset failure notification
>>>>    drm/i915/guc: Enable the timer expired interrupt for GuC
>>>>    drm/i915/guc: Capture error state on context reset
>>>>
>>>>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |   30 +-
>>>>   drivers/gpu/drm/i915/gem/i915_gem_context.h   |    1 +
>>>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c      |    3 +-
>>>>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |    6 +-
>>>>   drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   |   41 +-
>>>>   drivers/gpu/drm/i915/gt/intel_breadcrumbs.h   |   14 +-
>>>>   .../gpu/drm/i915/gt/intel_breadcrumbs_types.h |    7 +
>>>>   drivers/gpu/drm/i915/gt/intel_context.c       |   41 +-
>>>>   drivers/gpu/drm/i915/gt/intel_context.h       |   31 +-
>>>>   drivers/gpu/drm/i915/gt/intel_context_types.h |   49 +
>>>>   drivers/gpu/drm/i915/gt/intel_engine.h        |   72 +-
>>>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  182 +-
>>>>   .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   71 +-
>>>>   .../gpu/drm/i915/gt/intel_engine_heartbeat.h  |    4 +
>>>>   drivers/gpu/drm/i915/gt/intel_engine_types.h  |   12 +-
>>>>   .../drm/i915/gt/intel_execlists_submission.c  |  234 +-
>>>>   .../drm/i915/gt/intel_execlists_submission.h  |   11 -
>>>>   drivers/gpu/drm/i915/gt/intel_gt.c            |   21 +
>>>>   drivers/gpu/drm/i915/gt/intel_gt.h            |    2 +
>>>>   drivers/gpu/drm/i915/gt/intel_gt_pm.c         |    6 +-
>>>>   drivers/gpu/drm/i915/gt/intel_gt_requests.c   |   22 +-
>>>>   drivers/gpu/drm/i915/gt/intel_gt_requests.h   |    9 +-
>>>>   drivers/gpu/drm/i915/gt/intel_lrc_reg.h       |    1 -
>>>>   drivers/gpu/drm/i915/gt/intel_reset.c         |   20 +-
>>>>   .../gpu/drm/i915/gt/intel_ring_submission.c   |   28 +
>>>>   drivers/gpu/drm/i915/gt/intel_rps.c           |    4 +
>>>>   drivers/gpu/drm/i915/gt/intel_workarounds.c   |   46 +-
>>>>   .../gpu/drm/i915/gt/intel_workarounds_types.h |    1 +
>>>>   drivers/gpu/drm/i915/gt/mock_engine.c         |   41 +-
>>>>   drivers/gpu/drm/i915/gt/selftest_context.c    |   10 +
>>>>   drivers/gpu/drm/i915/gt/selftest_execlists.c  |   20 +-
>>>>   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   15 +
>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   82 +-
>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  106 +-
>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  460 +++-
>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |    3 +
>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  318 ++-
>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   22 +-
>>>>   .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    |   25 +-
>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   88 +-
>>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 2197 +++++++++++++++--
>>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h |   17 +-
>>>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  102 +-
>>>>   drivers/gpu/drm/i915/gt/uc/intel_uc.h         |   11 +
>>>>   drivers/gpu/drm/i915/i915_debugfs.c           |    2 +
>>>>   drivers/gpu/drm/i915/i915_debugfs_params.c    |   31 +
>>>>   drivers/gpu/drm/i915/i915_gem_evict.c         |    1 +
>>>>   drivers/gpu/drm/i915/i915_gpu_error.c         |   25 +-
>>>>   drivers/gpu/drm/i915/i915_reg.h               |    2 +
>>>>   drivers/gpu/drm/i915/i915_request.c           |  159 +-
>>>>   drivers/gpu/drm/i915/i915_request.h           |   21 +
>>>>   drivers/gpu/drm/i915/i915_scheduler.c         |    6 +
>>>>   drivers/gpu/drm/i915/i915_scheduler.h         |    6 +
>>>>   drivers/gpu/drm/i915/i915_scheduler_types.h   |    5 +
>>>>   drivers/gpu/drm/i915/i915_trace.h             |  197 +-
>>>>   .../gpu/drm/i915/selftests/igt_live_test.c    |    2 +-
>>>>   .../gpu/drm/i915/selftests/mock_gem_device.c  |    3 +-
>>>>   57 files changed, 4159 insertions(+), 787 deletions(-)
>>>>
>>>> -- 
>>>> 2.28.0
>>>>


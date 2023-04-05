Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571246D75BB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 09:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4390810E84B;
	Wed,  5 Apr 2023 07:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A31610E84B;
 Wed,  5 Apr 2023 07:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680680730; x=1712216730;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hS1NTRIXPtepppNpb2leToE0fe5CD/xeHjrHahOlmaU=;
 b=Wf7K/rTw7no2N+cXf5o9E0TgEJRuyGDOqYRn4MUzC8FAf8u+2EanEoAR
 rgP0mB+olqzs9ki3RN2bFTCvFW0AzigH7eoqGBj48vXajyBjP83y0keNR
 XYF1KN6jtJkP7Sj0cKPDQ0e8jjizHjQO7c4b0mTsumXTWaX7pBhIvoH6H
 n5w95K2+zi8vagTPzAsP5YNmAyEi0lfB+KIPCoH3CPtkeVQGTPYXUzXZd
 cNKN5PfnGQTDKfA1L871Gcx/qtZaOPY7Z3/SqngWuTKm9hr2PGMRNPlAh
 NRgpGk3CnnIoQm1/gva8/immAqI6GbUKhyqPsCp82E7LpvOb3kMgq10lf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="344105931"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="344105931"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 00:45:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="755928849"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="755928849"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 05 Apr 2023 00:45:29 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 00:45:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 00:45:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 00:45:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H28SixmvJ7iCvjHXe7hHgb1bhWYUCvFQD5lcbcHXP51/mLwFBmzvvUM/sFW5PZ9tH71CoD5tqmSVH+tLse7RO7lMqn5Hp9B7Ea08iVjZDa1oOSZteDY05acfizDAoq9KQ14qGNRspvomBxfEFTrsOWVHa1TFbKV2QxhNInGPva0bYqXsYiy7Qnn3at0x60mk04/TS/WMhxcHcq3dT7HT5jzQgr68SZuPWypygsInw2cOlysd8q6unTeCIuNKXFlxDxp5+8F3PI0J90weJq4nsbZceM3/4RGCwvAs+FOA2MMxiVhDNc9YzlpdqEiOvCCeGIDhf/Is1vZ/PKVoep1jgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVmoIbdJzuxtibHOg0l3DEQ/uivDjOkYNgDt/jgqShw=;
 b=j8Vf3KoWqKYTOp6R8gniNLHoe9ozJ897ZTT51+LVXD4Y8G48Ljs+alT1/ATydXxDbC/IVOCcgtDKAkO7k7XBM2F4EfswMRyzmDHm0WGBm+/J8Gj5VzBFNX+w0YW08M73A2+/2GcCndJuxWjfo1S84yHjMI8VnGhmyea5XioUzpFiJKWeEaEc5LRvZ+c3yLJM7kCmEHhJk8jbaaLS3K+GD/EME3Ib7bQe48Atxlnr1LYku9RAHvzZg1R8GZp/wnrnkAp4NWrYVorGVpqGnWk5LTfopz/fXg6JUE2clwGbir/eIRUG3vgXQj1+VFDvhwcG2XzNkWz+oPBec8x7VODJNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by PH7PR11MB7099.namprd11.prod.outlook.com (2603:10b6:510:20e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Wed, 5 Apr
 2023 07:45:26 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::a6ec:a0c7:4dde:aa7f]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::a6ec:a0c7:4dde:aa7f%8]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 07:45:25 +0000
Message-ID: <7fd9424a-678a-0d90-715c-f63179552093@intel.com>
Date: Wed, 5 Apr 2023 10:45:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [Intel-gfx] [PATCH 7/7] drm/i915: Allow user to set cache at BO
 creation
To: "Yang, Fei" <fei.yang@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
References: <20230401063830.438127-1-fei.yang@intel.com>
 <20230401063830.438127-8-fei.yang@intel.com>
 <7aa541f8-55e3-a182-5390-6ca161edb70b@intel.com>
 <BYAPR11MB256790AC5BDC891F186E000E9A939@BYAPR11MB2567.namprd11.prod.outlook.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <BYAPR11MB256790AC5BDC891F186E000E9A939@BYAPR11MB2567.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::13) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|PH7PR11MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dba47de-2be3-4640-49ad-08db35a9b7a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xPDkvxfXEdxZk2M1H/RhtGnZZmueiQO8m8Con6qd/czaK7vzBj1lbon/+jyhi+nZ0YjYn+/GsKHtzAdLC7+PTZF0BQ5vkXgiBDkTUSE9SPXriYpQQs4PeP0iEktZhUONLbyyLpBHu3yc4L2UTitiwWplPlVwbjI5hkhqerAed7u1bceahDjXBQpwKtGdkCV7VzXaUmae0l58otO4WTh6spJkyyISSodv5Z7QGXCYsUv7VJSV47k87n7e6GPW3BmGzhnK2GK6c4jScXITg6+Z4ENy4w9/v3OwkRtB32vBaMAEjFNSv9huShCov8NldT3SlxoScTMUB/ueRxTR4CQgzF8S6d6itxVxMjabdExV3DqSOVcu0CzSmkb04yWykCttGACU5bIwgDUNpOJMCbCdupGiLh6Rr3o6cu1RQ+AFnN6IShywYl0sIVAaeuNoWY73AplXuzZBsMFlV/q3OYhtqo2Cf6R1e520Y3ShGisI0s9npqu2tx4o2Ira2cl/9pMvkMDTpRNQ82tnO5F1S+cpCbX5HRF4jQVL3LKN2rJx5UPYWa+i+ALJ7vuiiwlNIxXs9s4aW7b/lHNecNDqzngx5rQl3IeGdfQYKOYf1qLNi+GBqJt4ZguhJCjdq6LYl3auUVqNqLNOwW/k3Nc0IYY2Zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199021)(31686004)(66899021)(2906002)(38100700002)(5660300002)(82960400001)(66556008)(66946007)(66476007)(8936002)(8676002)(41300700001)(54906003)(316002)(83380400001)(4326008)(2616005)(31696002)(26005)(110136005)(86362001)(186003)(53546011)(478600001)(6512007)(6506007)(966005)(36756003)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlVKZW5aMXEvODNlQTB2WFRBNGJaa2dLQlAvbTBTSERKeUFMcGtGbjRBUSt3?=
 =?utf-8?B?emYyWUZCU0F1bWFaY2YrUm1meE5oZnVJRGNxektRTmxPZlM3aklGWDRrejVh?=
 =?utf-8?B?NFJvZUxuWjYwU2ZIa3J2UW1XdE5tRDU1YS9DbVp6Q3lVZVg2Z0JNd1hBV2hz?=
 =?utf-8?B?YVBhSEg1TXo1VmdPUTJTR1hidjB0UTcvbUZnRGwrMGZtTTJMZmFhNVhrYXhr?=
 =?utf-8?B?THVoMXhYR0YyZm4zTzM4a0pzSm14Yk0vSzlDbXZEaWk1U0trNVNyVHkxM3lu?=
 =?utf-8?B?ZkpGdUMyYXIxYWttdWhhdEtGZkszSTlBTDRWclRJWU5pbmh0cjJPb3JXcEl3?=
 =?utf-8?B?Snp6emdZSUM3K2hLUkNKUWxYQ21GS1JkOEYxZHczWXU4aXRKV21od2hwTSt5?=
 =?utf-8?B?bUxjS2NMdG03aTdMMlphS0ZIbWdNK2ZMeG9KMkFNSjBDWituWEpKSWJnWWJN?=
 =?utf-8?B?eGhDandOVjl1UFZzd09QdnV1SFZXQWkvUzV0SEtBWHZwc2t5dTU0UnljL3B4?=
 =?utf-8?B?K0xCNWMxQUNieVBDQVlhNFhtK1dwanhIQTV3NktBRTlqL1ZoQnpBd1hQYXVV?=
 =?utf-8?B?cTl5NStWOTBWbmJYdjNDalZUUmM5ZlNoUVdBWkJnc2dsQWszUTNzc3gwL1hT?=
 =?utf-8?B?ZGpjQlhDaW5iKzJFQjF0TjB4VStSQ1VyeUJlaklMOTNWVFlCQk1GSTNhVmV3?=
 =?utf-8?B?U1lmekVaVS8rcWQrcC9kZmtVaHpyQlREQXRJZUl1L3pmSGN1djl2ZnZYVUdX?=
 =?utf-8?B?bDJNUk4ydHphNnppZzFWN3pqTTJSUGNVNHphR0RXeW9tSTBGb1ExSkJYdlVG?=
 =?utf-8?B?K2pXcm5QamlPWG5UdXo5OUJ0Wk1qaDB3NmRCWk9GR0ZQdEZPZmU2REhWTVVC?=
 =?utf-8?B?MnFtY2FJVm5DaDBMS2NucENkRHBmQ0VNTjVOMStwbk1FeWFMYitubE5OUmhJ?=
 =?utf-8?B?UFhHUCtFaERBQnRHOHZsUnNPYUErSXV5SVBEa2lPWllud0ZKRkFGcFlqMGZs?=
 =?utf-8?B?TDNlcDJRdUhjK1NjZW4rcXVzeXBiMU9xZ3BYWnJKQ2JDeDVUUWZzZmcrMTBs?=
 =?utf-8?B?ZVFjc0ZuQkk2emtvTHNiWVJQL3V0ZTZsaFRBdVc2TlFjR1JqVUdTMFJOOHhZ?=
 =?utf-8?B?a0hoSmoyVjNacVFEazdJY2xNYW12YnRETW5qbnE2L1pRUE9BRFV1UHR4U0I1?=
 =?utf-8?B?YTZyS3hiSUovRG1BUTBPRnRmTFVtbndmT0NVNVpUN0o0MnZMZnFrNWVqZXhU?=
 =?utf-8?B?eDM3U1ZTcGcvYUlOTTdISGJvbFUzYVVNMEZzbVRCa1U4QVY5TWM0RmxkNnJY?=
 =?utf-8?B?T2ZheDVNMHNVa1k5REZFblhPZVdOWTdGTndtcGpvaStzNUc4bFR1MlhoMDFm?=
 =?utf-8?B?WnhaSi94cWhIYktWcFcvbkJVTkZQeC96ejdUNENaYmFrckU0WEloOGlINU9F?=
 =?utf-8?B?OXpJeFRzWXV0dUt5cDdRWExRMldxMCtYd1o2NDFvUWRSQ2VnSnJ5a3R5dGNi?=
 =?utf-8?B?K0pyNTVZQ0hYSEdXWDZIZFpuZmRkTFpnRmM5WWxNaGY1ZytFTGJjbTNQbVlM?=
 =?utf-8?B?ZnlCUXJuYzUvT2dxalYyVG83Z1ljclAxQzcza1F3YTl2MVdyY051YkM1UDJZ?=
 =?utf-8?B?dUlEdE54K2FXTlhtZGp4Y2lFS1k3Q20xWVh3ZFVUTitWNXBXV2h5L0drZUVV?=
 =?utf-8?B?bytRMmlSck5qbC83ZlVhaGFMOWhDVlNYb0Jndmo1YkxNa3Y1QnV0YUVVSUtr?=
 =?utf-8?B?cGFoeE8xQXJWOVBHTFY3RVFYQUNDaFNVNUJURDNnZXVjTkNFdUZ4eU5STnFu?=
 =?utf-8?B?Y0Y4UStHeTJVNnljS2dkY04yMUxGdUd1cWJRVEVDUkswYzRVQ29IRktSM0Z0?=
 =?utf-8?B?V0pEUjZ3S3FoNnVLUWZTdHhJTFJKZHFsRTB6UVpTaCtCMjdRMk10Y2gxazk4?=
 =?utf-8?B?dUtwWFcxem04eFRwUTJLQ0VwZ3hNQW55ZU5Jc001Vmt3aldreUxVR1RYVmN5?=
 =?utf-8?B?UGx6N3pQRWxmTThpOW1HRlVnYXU1ck40YnlpZDNmYVloWjFzeUhPRUdwN1du?=
 =?utf-8?B?MzRVbnhRSXJySDU4T0pzaXN1Qyttai9ad1lYNnpzMUpEU1huSGNTa3RyUldv?=
 =?utf-8?B?UjBKUkVaL1k0QnU0TTVqZG1YdUZDWEx3elJoOXMvK1I5N2xlL21MMDhLRHJt?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dba47de-2be3-4640-49ad-08db35a9b7a3
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 07:45:25.1363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFKTiTSdo/WtOQYjuk9PJ1bgrO1/5l70Hg6Wo2/n9njVMrplBpwhqEXyZVg8FpWYEaumherxZsSkJdO3oHO9wgstHmb3dgIXlLO/PDGPBw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7099
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/04/2023 19:04, Yang, Fei wrote:
>> Subject: Re: [Intel-gfx] [PATCH 7/7] drm/i915: Allow user to set cache at BO creation
>>
>> On 01/04/2023 09:38, fei.yang@intel.com wrote:
>>> From: Fei Yang <fei.yang@intel.com>
>>>
>>> To comply with the design that buffer objects shall have immutable
>>> cache setting through out its life cycle, {set, get}_caching ioctl's
>>> are no longer supported from MTL onward. With that change caching
>>> policy can only be set at object creation time. The current code
>>> applies a default (platform dependent) cache setting for all objects.
>>> However this is not optimal for performance tuning. The patch extends
>>> the existing gem_create uAPI to let user set PAT index for the object
>>> at creation time.
>>> The new extension is platform independent, so UMD's can switch to
>>> using this extension for older platforms as well, while {set,
>>> get}_caching are still supported on these legacy paltforms for compatibility reason.
>>>
>>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>
>> Just like the protected content uAPI, there is no way for userspace to tell
>> this feature is available other than trying using it.
>>
>> Given the issues with protected content, is it not thing we could want to add?
> Sorry I'm not aware of the issues with protected content, could you elaborate?
> There was a long discussion on teams uAPI channel, could you comment there if
> any concerns?
>
> https://teams.microsoft.com/l/message/19:f1767bda6734476ba0a9c7d147b928d1@thread.skype/1675860924675?tenantId=46c98d88-e344-4ed4-8496-4ed7712e255d&groupId=379f3ae1-d138-4205-bb65-d4c7d38cb481&parentMessageId=1675860924675&teamName=GSE%20OSGC&channelName=i915%20uAPI%20changes&createdTime=1675860924675&allowXTenantAccess=false
>
> Thanks,
> -Fei


We wanted to have a getparam to detect protected support and were told 
to detect it by trying to create a context with it.

Now it appears trying to create a protected context can block for 
several seconds.

Since we have to report capabilities to the user even before it creates 
protected contexts, any app is at risk of blocking.


-Lionel


>
>> Thanks,
>>
>> -Lionel
>>
>>
>>> ---
>>>    drivers/gpu/drm/i915/gem/i915_gem_create.c | 33 ++++++++++++++++++++
>>>    include/uapi/drm/i915_drm.h                | 36 ++++++++++++++++++++++
>>>    tools/include/uapi/drm/i915_drm.h          | 36 ++++++++++++++++++++++
>>>    3 files changed, 105 insertions(+)
>>>


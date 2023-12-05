Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AFB805ECC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 20:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3D610E4CD;
	Tue,  5 Dec 2023 19:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2870D10E4CD;
 Tue,  5 Dec 2023 19:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701805862; x=1733341862;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yOU6VQqRwZutq6qOFl4qywj/sT7jXQg/qmucPRXKCzs=;
 b=TpgqX5R/8OHKKp8iYU1Rt64YicXzexNz6nGoz4Lk0bIhHoxAIKVzZyZg
 IJJFmiuNqUURZCACp3oe5NyOTwbYV4NSmN7xEq8/pmdnHpU+rfSkhzqOj
 X6nMoDIryoA/9dQlbNeQz7jkxA8pq225AxGcPeU86HtzOXOJLDdVUvJXK
 3t1rlAoJA1XXCgbcMW80mDpTRNKzoDKq1XdIz+55TaOllb2vyKbwquLl/
 MIAIdDs5TUgMqz2JXu+Q0me0O8pDjSfhBsHM+BIW3QCOFzjgM+/+xq1cQ
 1SC5+elLDhhx48L1frCwrt+cRGT7uoUkFlBDZ+iTZyhI0+zGJwoKGHZXh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="391116676"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="391116676"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 11:51:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="771030930"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="771030930"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 11:51:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 11:51:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 11:51:01 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 11:51:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSNFe5pduFeeNq+JnTDlMYeedkB3oAtHDzsrRaq46mFC+mczhVvyGvgzrLz8Fx/ufRBgMm/DmURJf61tRwjsqbaYq1ZlUJ3UtGLKzEu1SgipZ5MB3YEqDxOf6cUcYhmtHlzftMsKlhs/7egvSAJiGxlGUy9nNZROUvXL/qihlqS/A2M9t/Kphws/GVC8mtbYQ8cHR4jAe6E7fSHPYa+smdSU9hEHnVh1W4V/xkgJsdSQjOJT3XUUhn5kpirr+EYeOl+YvyRXqw/uNZicYINt5KydGojhDJx/8YJGnhqF38V0HxVrctd1eG7QMcsW2pkDAchE03g6uqh48CLJ3pF0ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hSNe9XkO4gKvZ2EP5hOX7Gb4itMJNVM7KYAy5xVLI0=;
 b=YBvrJXe2u5n0zL+hs63qYLHRUDT1PZIz9hXAUiWGdwWbd/gEj9EfuQhNHJpVjYlNcsWkrxCgPKrWesGhSMicrFoeRB7+ByUwHC76UT8Jx4XaSwXcNMqmgZOhkFQWs7sZcKjrGzQQLhrqLPyq4fSTgEQIx2PgLwgoy1Rml7Yyl5z3xz16Jk0vRDoYZ+/d2GHwmKKyeHDU3ezHkZQ1qCdNbCTl7gPH3QLZry5Gxbz0Wzu5iT8ylcaSC0l+xc7U+HFxE5TWmU5BeqGZTZopEYt20bgStwruwfCiqP5oISsVvegs29TW/VqZScxyUQFZUlcHfkSKAgT/PFnN9dni/wP4Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MW3PR11MB4681.namprd11.prod.outlook.com (2603:10b6:303:57::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 19:50:57 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 19:50:57 +0000
Message-ID: <4eb477b8-2756-42c3-b349-566c2d4bddfc@intel.com>
Date: Tue, 5 Dec 2023 11:50:54 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/gt: Convert reset prepare failure log to trace
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@linux.intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20231205085248.2577-1-nirmoy.das@intel.com>
 <40875e9a-3729-4153-8de2-69d0ce586442@intel.com>
 <69036ebc-561f-4c9b-b68b-04f7e1c77e27@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <69036ebc-561f-4c9b-b68b-04f7e1c77e27@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0265.namprd04.prod.outlook.com
 (2603:10b6:303:88::30) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MW3PR11MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f057eb8-5bd2-49be-1c5b-08dbf5cb7fe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eAtQk+FxhlSvjey6L549T+zga6ESud5jAP7UgVBiWRhhfB20XtiGOpQhGZfmhU+xUDxs9H+As4Nwv1u3ae0Fo9Lb2cQl3TR/N+D+Mc+PTUgFIrOTcOMkG1K/IY5LLMy6ChMjbRIXUrzmJHqRfcXv9UPcVdJj9I7PZBrQ7j7+rYbZlUpNjB4btr7l07wyFc1JPcLWBcBC4Ioz9W2qLUexyDDe7OJnj84LYNOGS9mV12czGBCGmtdGnBNAzabmefHARbsIG555tCU8/CeD2JwT4znR45+H9U/I5hve4ZbZysZvOdxZ0texdyv5pM6xnx+3Oqz/PeUoHGdWVzS9gjihZNO2gSiRDVZrtj1+WqnHP2I3cdVG2ulurBzwb6KHvnLJUclhmJ2p3Nsg2dQ+Z8a0yZW7SS9XuEsq7waY6c8pTNOilrHtM5aqZEwiSahvcKaWNn5x+z/F5Ughl5HCnGuPL6VaFnH72zfC0ADEK4dujiSTtwYJvdRYpG8AjZAbTfPnALONPNsGQoTKA4FUy8jRj9jceLmQOKmEQuOeK011/eG31F9dsdUAqzorojPI6MpCfIVcs3Jao4Orfcf0CVeUuhsy44RdB6XixyxCbnHS65LGz54K24klXISKAdDFFeBc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(136003)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(31686004)(36756003)(2906002)(82960400001)(83380400001)(38100700002)(41300700001)(2616005)(26005)(5660300002)(53546011)(6506007)(6512007)(6666004)(966005)(86362001)(6486002)(478600001)(31696002)(8936002)(8676002)(4326008)(110136005)(66476007)(66946007)(66556008)(316002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjJGbkVIMElIVXRzTWlMSXpkRUduTTd6Z1RFRjE1T3UwZUtSV0cranhKTzJh?=
 =?utf-8?B?TFFRbkdjRjYyUzkwMU9pOG9IWDJ5aEV5SlIxSElPTFBMMkNRaktDU1hmdVVR?=
 =?utf-8?B?MWJ2VzVaa3FNUGIreFlTaWpLWjQyVTUvWUFQTjRvdkFjdFVRdWNNODYyQTgw?=
 =?utf-8?B?MjBzRkxkY2tNYW9GTkZaL1RTTFBJY0JMY3V1UXhVTUo4QlBJUUY2RmNUMEJF?=
 =?utf-8?B?TDNFNzZXdS9NWi8rVUhxaUZHYUFHS0hwYlBqcThXalg3cEw3MUV0Nk9vQ0tI?=
 =?utf-8?B?OTV6cHZQalVmSlV5UUgrM0QwdzJJOXlsakc4UkFka21zMHVxbDNUNjdsQUlT?=
 =?utf-8?B?RzVqZFZMaDNOcmN5OVh4ZXI5aWNDUnN3bW5UbmlCNmJIdzZmb2t0UXllUEtI?=
 =?utf-8?B?ZERIWUJzV09BQmJpVDljVlQxUjBQRDdrV3p1VzJWTXh2ZDN2MHlUcDFRNHZB?=
 =?utf-8?B?Qi9zR2RkVVZ4VUNPZ0FoUVZCYm42UFN5WkY0RjFXYXVraWFaODYrb0owMGVj?=
 =?utf-8?B?QjlDRGczUWVuMmZxa1NXa1pHblFlQm81MzdOb21SaDhnZmwxdW5rVGd6MTgy?=
 =?utf-8?B?ZXplRDQ4d2p4WWtJUHR4d3h3ZWR2Y3VMaDljKyszVnRhTW4rTm4xVlhTRFhV?=
 =?utf-8?B?U2g2T2dqdENFakt5OEY4cEZ2aGh2bU5mN2lMaGhKK1N5bi9mSG1BdHJQZUVD?=
 =?utf-8?B?SjY0TldUajNNLzJyRGtkaUlLZEpWc0JQUGcvM1hiUnZodnNDNFNVWEpnazF2?=
 =?utf-8?B?dzlwcUNvNDRuM1NycmNPa2I4THJsRmN4d3QxUlZrV01taG05bzVtTkIySi9S?=
 =?utf-8?B?YjhoaGpSbGw0V2hSUjVzWURwSE1ZeFFXWDMwLzNyMkJGZVk3SkxOOEpvbHFq?=
 =?utf-8?B?RnhhL1ZXeXFDOGNlTXdmM0NzQ0tkVllqRFAzZ09YcE5mSm1WWkc2bm4wN2tp?=
 =?utf-8?B?V0RoODV3TFN6M0lQaXlCWFJ2ZVRYSEpUY3JINHF5K3lKNW4wZ09Fc1NDQXM0?=
 =?utf-8?B?YWJhSUVIVi90aTRhQWY4RUo3WlNubkZyNTE3aHVzYmFSdnJRWjBnRlJrbUZQ?=
 =?utf-8?B?QmNwZXdGTzJNWndJclRJUFdUcjNMcG5CaHVXR1ZsTGY0TnBkdnNDaUNYL3Yr?=
 =?utf-8?B?NVNwdC81a1NFUCs2a3lBTmZMT0YvOFNEZXkyS3BhUm9zTFJ3bzdzbWJpbEQ0?=
 =?utf-8?B?OGFVdDBwbE8yckc2dXRCUzE2bGM1QU5hdEF1SW5tb283dW1NN0tzTUV0RDZK?=
 =?utf-8?B?ek5aV3BqVmJNMmZwbUZqWCtVemx6VFYybHdvYUJZNzRIK2hpVWxzblRSZVFK?=
 =?utf-8?B?MGRlSlpEMzJYbUlwa2pBSDRYMWNtbDZmMDZjWmVhV05oOVBFMG9meE5XSXUy?=
 =?utf-8?B?YTB1YXpJUTVjUEhIWEN2U2p1dVdHNnRUck9nclN5Mkh1Ym5NZkgwazIxN3Mw?=
 =?utf-8?B?cnhJaDJ0Y1hXYzNjTUhKVFh1VTJ4K2R3R1NjeVhVY1JHK0dvdk5CTFZITUFx?=
 =?utf-8?B?YXJnTWdBakNuZUY5ZlVJT0pIWDR1ZEsxOXc2azhpajloM3E0ckhHOGhGS2M3?=
 =?utf-8?B?azA4ZExIWGkxZ3ZUMy9oRk9LU2kwNEdyR0pQbzFqOHh6bkdFcnpjOThiWFdw?=
 =?utf-8?B?d0cyVXVEMW16LzhzRlhEamtlUzdFOVZ3NDg0NEZFV1FodVFwVHRFUTdMWnVY?=
 =?utf-8?B?VURqeVFhTlgyOUh1UUhIM3c0NTRRR2JLOXhTMVNBT20zaDlyL2h3NUJaMk5K?=
 =?utf-8?B?bFUrcmUwQjVveTljekJ2Y1FOT250MDVxVnNzbVJLd1JqYmNLdjNjVWM3d29T?=
 =?utf-8?B?TFNsNmFFVUdhdXdpMUs0am10NXhZM1JwVUlMdk5ZTWVhODl2NjNlSnZyd2sv?=
 =?utf-8?B?UjZIVmJrczF5SjhxZ0FnNllmV3JVRWFISEI0WlF4cmtsekY2d3o2UFlrZjc3?=
 =?utf-8?B?Rzl4MWN3ZmlpQjh0b2g5R1FOUGtxM3I2Ulc0YmdLUXkvdkdvZXBxdWpwcVpl?=
 =?utf-8?B?UXQ1d3ZOSHB5R2VHcXVUbVFneWN1WEpvM3ZSbVovbDZpWEFvbWFhQVRkajMx?=
 =?utf-8?B?cmVycWRzMk50b2NleUVISENORk9aMFVuVEtWdk1Sd254S0g5VmJkblFqcXZw?=
 =?utf-8?B?anB6NzgxOGRCZ2M3V0NSeElrQjVhbENvV3UyNG5SUzNmY251SG1TaHZiSmVD?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f057eb8-5bd2-49be-1c5b-08dbf5cb7fe2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 19:50:57.7056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNOqN5bafEBSaWFXUyU3XbEqgHkZewDw/DaXudwdD7LrXjWEWrjwJDL5IPNUHQkVpFAQIDw5VQpi/hPmdHxF5fTkAVulsMFM4MY5fCGTvnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4681
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
Cc: dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Tvrtko
 Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/5/2023 02:39, Nirmoy Das wrote:
> Hi John,
>
> On 12/5/2023 10:10 AM, John Harrison wrote:
>> On 12/5/2023 00:52, Nirmoy Das wrote:
>>> gen8_engine_reset_prepare() can fail when HW fails to set
>>> RESET_CTL_READY_TO_RESET bit. In some cases this is not fatal
>>> error as driver will retry.
>>>
>>> Convert the log to a trace log for debugging without triggering
>>> unnecessary concerns in CI or for end-users during non-fatal scenarios.
>> I strongly disagree with this change. The hardware spec for the 
>> RESET_CTL and GDRST registers are that they will self clear within a 
>> matter of microseconds. If something is so badly wrong with the 
>> hardware that it can't even manage to reset
>
>
> This message is for reset readiness  poll timeout not that the reset 
> is failed which doesn't sound so serious if the subsequent attempt 
> managed reset the engine.
Not sure what the distinction is. The reset procedure is poke RESET_CTL 
wait for it to clear, poke GDRST and wait for it to clear. Just because 
step one is failing rather than step 2 does not mean that the reset as a 
whole has not failed.

Note that the purpose of RESET_CTL is to pause a bunch of stuff like the 
command streamers to prevent them from issuing new memory requests while 
the reset is in progress. If it fails, it likely means that a CS is 
refusing to stop. Most probably because it can't reach a stopping point 
because it is stuck waiting on a lost memory request or similar. And the 
point of stopping further memory requests during reset is that if the 
memory channel gets out of sync (because only the GT side is reset 
during a GT reset) then that can result in total system failure. As in 
potentially even the CPU can no longer get to memory if it is an 
integrated platform. So yes, it can be quite a serious failure indeed.


>
> I couldn't get enough details when this can happen that HW takes very 
> long time to set the readiness bit.
Is it simply 'taking a long time' or is never clearing at all? If it is 
just that the timeout is too short then the proper fix would be to 
increase the timeout. But if it is taking seconds or longer or just 
never succeeding at all, then something is very bad.

>
>
>> then that is something that very much warrants more than a completely 
>> silent trace event. It most certainly should be flagged as a failure 
>> in CI.
>>
>> Just because the driver will retry does not mean that this is not a 
>> serious error. And if the first attempt failed, why would a 
>> subsequent attempt succeed?
>
> The patch is not ignoring the failure. If the subsequent attempt fails 
> then driver load will fail or it will be wedged if that happens after 
> driver load.
One thing I really hate about our driver is the total lack of 
information when something goes wrong during load. The driver wedges in 
total silence. There are many error paths that have no reporting at all. 
Which means you are left with a totally useless bug report.


>
>
>> Escalating to FLR may have more success, but that is not something 
>> that i915 currently does.
>
> Do we still need to do FLR if a subsequent engine reset failure ?
Assuming that we are talking about modern(ish) platforms, an engine 
reset failure would be hit by GuC rather than i915, but that would be 
escalated to an i915 based full GT reset. Generally speaking though, if 
the engine reset fails the GT reset isn't going to do much better. It 
would fix a dead GuC problem but it can't help with memory related 
issues. If the full GT reset fails then we are out of escalation routes 
as there is no FLR path at present (I think we have that at driver 
unload on MTL but not for general reset?). The FLR resets a lot more 
than just the GT, so it does have a chance to fix some issues that a GT 
reset can't. After driver-level FLR, there is PCI level FLR. Not sure if 
that involves a full power down and restart, but if not then that would 
be the last escalation possible. A power cycle really should fix any 
issues, if it doesn't then it's time to return the system as being 
totally dead!

My recollection is that the vast majority of engine reset failures I've 
looked at have been completely catastrophic and the system only 
recovered after a reboot. I.e. after the card was power cycled. Such 
issues were generally caused by bad memory. Once the path to memory has 
died, there really is not much of the GPU that can do anything at all 
and there isn't much that can be done to recover it.

John.


>
>
> Regards,
>
> Nirmoy
>
>>
>> John.
>>
>>
>>>
>>> v2: Improve commit message(Tvrtko)
>>>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5591
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_reset.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>>> b/drivers/gpu/drm/i915/gt/intel_reset.c
>>> index d5ed904f355d..e6fbc6202c80 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>>> @@ -593,10 +593,10 @@ static int gen8_engine_reset_prepare(struct 
>>> intel_engine_cs *engine)
>>>       ret = __intel_wait_for_register_fw(uncore, reg, mask, ack,
>>>                          700, 0, NULL);
>>>       if (ret)
>>> -        gt_err(engine->gt,
>>> -               "%s reset request timed out: {request: %08x, 
>>> RESET_CTL: %08x}\n",
>>> -               engine->name, request,
>>> -               intel_uncore_read_fw(uncore, reg));
>>> +        GT_TRACE(engine->gt,
>>> +             "%s reset request timed out: {request: %08x, 
>>> RESET_CTL: %08x}\n",
>>> +             engine->name, request,
>>> +             intel_uncore_read_fw(uncore, reg));
>>>         return ret;
>>>   }
>>


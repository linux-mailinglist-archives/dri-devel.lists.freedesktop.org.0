Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D83B756ADD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 19:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75F210E288;
	Mon, 17 Jul 2023 17:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75E410E288
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 17:40:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrXeEkf8IXI9TD1Foudibrlj2OQueGbfOl/WCWnTxAg6GaOuBFNxDh+71mqclEC/IBDmRkqJj5YhZGr7bQgqqPBZg8GHylW6zCfoBBmVeBChON4rHTyUqapX9jyWKSYFFKxZZrPLgIS2K+Mt+0aG9nxBPK09O/wt7QAaIwsl2olQOZJ2dTothjMNENHb9i9X8BP723DM/C2QIw/MMcipqIzYYbo1GrkP/0l5wsZgIbFcRhM20gfhonaOO+qBUPoGOsfcsgknYmXJHyrA503pN8wBgxE7Tzbyacb12pR6/xAnlwYKYPCGcRn87ak6BhMuEaQn2XSJOYCfUp4cV3qSjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUNiTo8EOHCWBaueSOwT97FQy4KkIaXKNYRFIUXFxEc=;
 b=PZdyqpS+8Fp4jGjjklS2ULkVX9RP/PYx0I4DD0EY2K+R01u29k0K96rG4tqgdLqvQs25Nm8o5npLAVpJECodr+P1qkQn2OKZQIpH25NlC9wso9vv/5VXUHJtHLcTxR+qshBNJ8qeIFcKG3xxQNnabpHbrGhI2L5C7X1icn1+xfH1nGT+jxYvWJmHBdEG9EpvMSmMtGhsviX32N5QEjxMcpSIoC/enw1spdioJB/hirMy8l9I1nJxZDOyxnexImmtsOTOxzdLg0l/BWudVD8tO7stZdYDPz6aHxxl2mg9Ojwg9DSK1ilpl8AL4c9sbLtE3S/EGHjXWEKUHqY0LBIejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUNiTo8EOHCWBaueSOwT97FQy4KkIaXKNYRFIUXFxEc=;
 b=KFlYy5G/Bo5yi+ywQAuL4u0zGQz7PAHw+Ln9ZuY8dSP9pwMn7uCDCUy9iwvGy8vgp3EovFOqn6W+p7PgOSp+DZPFUvY12KbLSk5tcaW33YK/mXPokAHbCpEKYNKy9rNOBjdjgK8w8aensj9TWq9g8k6QMgMKNGFtSN+7y2WzQss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SA1PR12MB5613.namprd12.prod.outlook.com (2603:10b6:806:23e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 17:40:41 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 17:40:41 +0000
Message-ID: <49a33f61-91b5-22ee-78b5-c7dd7c0d4a46@amd.com>
Date: Mon, 17 Jul 2023 13:40:38 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/scheduler: Clean up jobs when the scheduler is
 torn down.
Content-Language: en-CA, en-US
To: Asahi Lina <lina@asahilina.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-3-c567249709f7@asahilina.net>
 <9343165f-2533-f363-4942-719ee9b7d2a4@amd.com>
 <99f9003f-d959-fff3-361a-25b2f47efc88@asahilina.net>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <99f9003f-d959-fff3-361a-25b2f47efc88@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0123.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::23) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SA1PR12MB5613:EE_
X-MS-Office365-Filtering-Correlation-Id: f2af273c-e68b-4df0-3e10-08db86ecf08d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MT8jP1WoP2W2bnn87T9DvVdYsJcGoEsSTmhJCwBbuIy8TSQ0KYgzv9CxwdxQEJtSQFJ4w/o0htnFlQ/qO92kuL5SU7ZlW7L/c2oNFq9yWef7T3xDSbDO2NU12/t/x51IsOP3a8P3MMR/AhdwlXXpGxbspyXo0WO5L8djOtV/+jPVLaC17nGBxpVVqN+vD57hRMNhBUIKb/haB+fU6h5YzsalXFHhXQD8Vu6g9AvwzbCJCA8IkOON865nFcnHM86Zz7EVNQIB+zMdJOLGVKBgOkscWc32vM3kHsIVt9sBa/EwcB41QEEVRQX6rg53sbCEePtr1vpaZ5ftNwmSw7EtHHu+8T48X7okTcLcLKPNABL5TzOATwFOZKE/MhN6dxP1yOdLlEnJFYL48uHJgrFhxfnXTat89pExE0lVGsXTrvEZhoAD8MtBWFxOB/6RFsHGguz6eDFYv1hROS6xKWCj3uNIU1xFZSMNymPO9BqmhyXe4R/+kmXJ1FF1/5q+c9V6qI0qY8ZlyYV4J6/6ulxuTHCE9rWYRXc2TS0kLFejYJCrVOyv5jjMvWvc9lH93FgOQbt3G6NFyIsUYpQwWiL7N6qET73xI28iR7acRkM1ih5NvfPmjPdZ63pPDnYNQP2JD0E6CDL2W+FJmyapr0iLBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199021)(31696002)(83380400001)(6506007)(38100700002)(26005)(186003)(53546011)(110136005)(478600001)(6512007)(66899021)(6486002)(54906003)(7416002)(8676002)(66476007)(41300700001)(2906002)(8936002)(66556008)(66946007)(6636002)(4326008)(316002)(36756003)(5660300002)(6666004)(44832011)(30864003)(2616005)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG11R2EwSUxDR016ZFh1QVg5MnJ0Z042QkJqKzNCYjRUZm9GRXN6dkVlRi9K?=
 =?utf-8?B?TVo4R1lrL2VjMkJMTytpMC9PQUcvd05HSzlFQVBWQm1GRzQ2QlpkVFNyUWY0?=
 =?utf-8?B?aS9IUTlJVmU2N2FHdXBBODBzVUg1SW9uRllURmFRMm9POHN3OFhSNlViYXJw?=
 =?utf-8?B?VWRBMnZXbWlOZm1wMnBta2VlaGZ4K0FreWNoMzFtQWpQQ3dlWFp3bkZlV2ZX?=
 =?utf-8?B?dUoyakdvWkQ2UDBIcVpBVlpJQVVBV3Y4T0dSOVBGUnQ1dDVBZmxHZFFkaEV2?=
 =?utf-8?B?dFgxc3R5Y2pwTWdtOHV1L3RjSDdDeXJ2TmxsZE1tcGFDZEltN09zd0w2bEVy?=
 =?utf-8?B?cU1iSkpWT0xWUkdLcjIxajR6b25PaTQ0SytKTDI2L2wvNTJ4bW9rSXl1SGoz?=
 =?utf-8?B?RVowK0ZNRitRNVJNSklxSWlXR3pqVnZlY1JSalhNQUZmTkNlZnkyRks5K2JW?=
 =?utf-8?B?dFF3T2dMVnBVYkZUZy9yL1dJZXM2U0daM3ZabkxORWFuWmdoaSs1bTRVc1RJ?=
 =?utf-8?B?WWtWSktFUGs5c3J2QWQ0TGRqc0VtaElEazF6cllaRVNXQklrSWRtRERyMkVV?=
 =?utf-8?B?WTRnSG1ZZUZyWk1kTVhaUzBQNm9jNzg0SVRKUmZXb3RaMXRCazhtaDZmWVEw?=
 =?utf-8?B?QWVlMVBnaGFUUjRvb2dTdGpPejRnYUFkUFY4NDV5MzNpMExBNVBhWEU5cUo5?=
 =?utf-8?B?R2VPeVZkNEZabWUwck5oYzlobFZNcEE2OForUkZ3UzZXbFZnbzBRZysxbS9S?=
 =?utf-8?B?b0xkYkJwaXAwQmlTWXl2bFl3NXVLMFVhQVZzOVUvaHM5emszbGhtbHlSNzRY?=
 =?utf-8?B?YWwxR2ptM3g2YnRHQm5QaE5iV2ZZalpKYkx1OEp1WXNIbC9BSzMxWmhpK1Bz?=
 =?utf-8?B?QlpHYkpKMEFPVUFhakMycGlycGQzZUxyR3Z1RzdzOW9YQ3pTNUYrRGJCY3F3?=
 =?utf-8?B?TkR3MzB6VFdIbjl2WVdmbWVta3ZQaWN2alRjY1h5L2lUclRpclM2enRIRGFv?=
 =?utf-8?B?R1JVc1JCUXhKUC9WVndRMnFRUGlzdGlQc2F1aHBVOC9WaG9QVmE4UjdNU2Yx?=
 =?utf-8?B?ZXBGM05FUXk0Vk9yK0kwc3c4dkZzZ0JRaHN6NXJzTVhyZ0dCQjVQeWNLVGU1?=
 =?utf-8?B?QWJHWU9kOU1CeWhGTjkwdXRSZnF5YndqY3BpcDl6NU1ISWZFUmdmSmh4ZEVk?=
 =?utf-8?B?U0pwSzBDM2diT0d2aVhqTm5mNDM0RTByMjFoajYrSGI4NFFwVnhjdE1qcGMy?=
 =?utf-8?B?c2ppSjIrNTVBbTVMTjE3ZWt0WVJKK0h0bFVMMFIrbytuTkhFTzBJakwyUnlm?=
 =?utf-8?B?bkZUZG1GY283MzNjK0h2TmQ2VDNEZmZNM2dSS3pNRjA0U0cyZ0t0aHR4bnN2?=
 =?utf-8?B?aUI4UGEvNkJjWVorb2JsRDNSRTY4VlJac0hZZ3RNQzJCOGJWd2czMTg2b0N0?=
 =?utf-8?B?dTBOR1VHRWtLU28rWXN0aTdDWnBiUW5Oc2FPNFFvTGlxcTdEWHFNL3gyVzBj?=
 =?utf-8?B?M1pQTjVGZEl6Z3RNU0p0WHBrUnkzOWhsUmd1MnhySVA3R3Q3MHVYam9KRTFJ?=
 =?utf-8?B?RGNZWllFRWd0b1E5U1ZMa2U4U2FGVWFielF5OXdYSGdNcVZodzVpTkpmVUkw?=
 =?utf-8?B?c1dBMWROdDUyakg5MHFIUDhyb1RXMGZpci9FMzc2MTRDRzNraFBTTDhucmhD?=
 =?utf-8?B?Z0RKTHUzZTU2TDNIalN1azhUbnludmMwd2hjTlk1ZzY1b2JCOUZSV2NaSTZN?=
 =?utf-8?B?Ly9ocERkcm5JOWJkdWFmZm4vbEFQcjlEeWRrZnpSejlyQTRBUkFNWVROOTZx?=
 =?utf-8?B?bUN1MnFjSjB1WW5VREtaY2NyVlZUUk1palJQVlJ1TXRRMktsN1NyS1djRFBZ?=
 =?utf-8?B?VEgvWEY2UTQ3TW02eVU0dzBYbEtqUWQvMEdKUDFkUHBKc0dadThCQU9aZzk0?=
 =?utf-8?B?eHFBTktTdEc4V3U4TTZyZk1SZzJMZ3ZzQUZXYkpGcDB2OE1UdWJzaFpqTEM1?=
 =?utf-8?B?bWlFSzhNSWp1eVRlKzhLQysvalJ2MmN4OUdLMW90ZGcvTFJPY3FhU2pIUE1j?=
 =?utf-8?B?aHJ3NTl0WUlWOG1PMjNXQVZQSXZxWTE2WDN0QUJJajhWWkNqR0JRdnpnS0ho?=
 =?utf-8?Q?IZ2GsDfVs2+1zkvIVdktbwPYF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2af273c-e68b-4df0-3e10-08db86ecf08d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 17:40:41.1053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: anM7gywYFbc5QdA5oXOpTYDAzG+t7B9Q82PjWNXA+O+3TlIdy2gAKvT1NYg5pyPl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5613
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-16 03:51, Asahi Lina wrote:
> On 15/07/2023 16.14, Luben Tuikov wrote:
>> On 2023-07-14 04:21, Asahi Lina wrote:
>>> drm_sched_fini() currently leaves any pending jobs dangling, which
>>> causes segfaults and other badness when job completion fences are
>>> signaled after the scheduler is torn down.
>>
>> If there are pending jobs, ideally we want to call into the driver,
>> so that it can release resources it may be holding for those.
>> The idea behind "pending" is that they are pending in the hardware
>> and we don't know their state until signalled/the callback called.
>> (Or unless the device is reset and we get a notification of that fact.)
> 
> That's what the job->free_job() callback does, then the driver is free 
> to do whatever it wants with those jobs. A driver could opt to 
> synchronously kill those jobs (if it can) or account for them 
> separately/asynchronously.
> 
> What this patch basically says is that if you destroy a scheduler with 
> pending jobs, it immediately considers them terminated with an error, 
> and returns ownership back to the driver for freeing. Then the driver 
> can decide how to handle the rest and whatever the underlying hardware 
> state is.
> 
>>> Explicitly detach all jobs from their completion callbacks and free
>>> them. This makes it possible to write a sensible safe abstraction for
>>> drm_sched, without having to externally duplicate the tracking of
>>> in-flight jobs.
>>>
>>> This shouldn't regress any existing drivers, since calling
>>> drm_sched_fini() with any pending jobs is broken and this change should
>>> be a no-op if there are no pending jobs.
>>
>> While this statement is true on its own, it kind of contradicts
>> the premise of the first paragraph.
> 
> I mean right *now* it's broken, before this patch. I'm trying to make it 
> safe, but it shouldn't regress any exiting drivers since if they trigger 
> this code path they are broken today.

Not sure about other drivers--they can speak for themselves and the CC list
should include them--please use "dim add-missing-cc" and make sure
that the Git commit description contains the Cc tags--then git send-email
will populate the SMTP CC. Feel free to add more Cc tags on top of that.

> 
>>
>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_main.c | 32 ++++++++++++++++++++++++++++++--
>>>   1 file changed, 30 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 1f3bc3606239..a4da4aac0efd 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1186,10 +1186,38 @@ EXPORT_SYMBOL(drm_sched_init);
>>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>   {
>>>   	struct drm_sched_entity *s_entity;
>>> +	struct drm_sched_job *s_job, *tmp;
>>>   	int i;
>>>   
>>> -	if (sched->thread)
>>> -		kthread_stop(sched->thread);
>>> +	if (!sched->thread)
>>> +		return;
>>> +
>>> +	/*
>>> +	 * Stop the scheduler, detaching all jobs from their hardware callbacks
>>> +	 * and cleaning up complete jobs.
>>> +	 */
>>> +	drm_sched_stop(sched, NULL);
>>> +
>>> +	/*
>>> +	 * Iterate through the pending job list and free all jobs.
>>> +	 * This assumes the driver has either guaranteed jobs are already stopped, or that
>>> +	 * otherwise it is responsible for keeping any necessary data structures for
>>> +	 * in-progress jobs alive even when the free_job() callback is called early (e.g. by
>>> +	 * putting them in its own queue or doing its own refcounting).
>>> +	 */
>>> +	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>>> +		spin_lock(&sched->job_list_lock);
>>> +		list_del_init(&s_job->list);
>>> +		spin_unlock(&sched->job_list_lock);
>>> +
>>> +		dma_fence_set_error(&s_job->s_fence->finished, -ESRCH);
>>> +		drm_sched_fence_finished(s_job->s_fence);
>>
>> I'd imagine it's better to rebase this on top of drm-misc-next where
>> drm_sched_fence_finished() takes one more parameter--the error.
> 
> Ah, sure! I can do that.

It's worth posting it as a stand-alone patch. Please make sure to add Cc tags
into the commit description--use "dim add-missing-cc", perhaps also
git-blame and git-log might help with additional Cc. "scripts/get_maintainer.pl"
for files unaffected by this commit. (dim add-missing-cc uses get_maintainer.pl
for affected files.)

Feel free to post it stand-alone and we'll let the natural review process take over. :-)

> 
>>
>>> +
>>> +		WARN_ON(s_job->s_fence->parent);
>>> +		sched->ops->free_job(s_job);
>>> +	}
>>> +
>>> +	kthread_stop(sched->thread);
>>>   
>>>   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>   		struct drm_sched_rq *rq = &sched->sched_rq[i];
>>>
>>
>> Conceptually I don't mind this patch--I see what it is trying to achieve,
>> but technically, we want the driver to detect GPU removal and return shared
>> resources back, such as "jobs", which DRM is also aware of.
> 
> I think you missed the context of why I'm doing this, so in short: my

As a general rule of thumb, in my writing emails I try to avoid using
"you" and "I" as much as possible--it sets this divisive stage, and it
can get misrepresented, especially in email.

As is the case in research literature, if I absolutely have to use a pronoun--which
rarely happens, I always use "we", and this is the most number of "I"-s I've used
in a long while.

> use case (like Xe's) involves using a separate drm_sched instance *per 
> file* since these queues are scheduled directly by the firmware. So this 
> isn't about GPU removal, but rather about a GPU context going away while 
> jobs are in flight (e.g. the process got killed). We want that to 
> quickly kill the "DRM view" of the world, including signaling all the 
> fences with an error and freeing resources like the scheduler itself.
> 
> In the case of this particular GPU, there is no known way to actively 
> and synchronously abort GPU jobs, so we need to let them run to 
> completion (or failure), but we don't want that to block process cleanup 
> and freeing a bunch of high-level resources. The driver is architected 
> roughly along the lines of a firmware abstraction layer that maps to the 
> firmware shared memory structures, and then a layer on top that 
> implements the DRM view. When a process gets killed, the DRM side (which 
> includes the scheduler, etc.) gets torn down immediately, and it makes 
> sense to handle this cleanup inside drm_sched since it already has a 
> view into what jobs are in flight. Otherwise, I would have to duplicate 
> job tracking in the driver (actually worse: in the Rust abstraction for 
> safety), which doesn't make much sense.
> 
> But what I *do* have in the driver is tracking of the firmware 
> structures. So when the drm_sched gets torn down and all the jobs 
> killed, the underlying firmware jobs do run to completion, and the 
> resources they use are all cleaned up after that (it's all reference 
> counted).

The ref-count definitely helps here.

> The primitive involved here is that in-flight firmware jobs 
> are assigned an event completion slot, and that keeps a reference to 
> them from a global array until the events fire and all the jobs are 
> known to have completed. This keeps things memory-safe, since we 
> absolutely cannot free/destroy firmware structures while they are in use 
> (otherwise the firmware crashes, which is fatal on these GPUs - requires 
> a full system reboot to recover).
> 
> In practice, with the VM map model that we use, what ends up happening 
> when a process gets killed is that all the user objects for in-flight 
> jobs get unmapped, which usually causes the GPU hardware (not firmware) 
> to fault. This then triggers early termination of jobs anyway via the 
> firmware fault recovery flow. But even that takes some short amount of 
> time, and by then all the drm_sched stuff is long gone and we're just 
> dealing with the in-flight firmware stuff.
> 
>> In the case where we're initiating the tear, we should notify the driver that
>> we're about to forget jobs (resources), so that it knows to return them back
>> or that it shouldn't notify us for them (since we've notified we're forgetting them.)
> 
> That contradicts Christian's comment. I tried to document that (after 
> this patch) the scheduler no longer cares about hw fences and whether 
> they are signaled or not after it's destroyed, and I got a strongly 
> worded NAK for it. Sooo... which is it? Is it okay for drivers not to 
> signal the hw fence after a scheduler teardown, or not?

Christian is correct in that we don't want to hang upstream control
to the whims of a low-level device driver.

> But really, I don't see a use case for an explicit "about to forget job" 
> callback. The job free callback already serves the purpose of telling 

Long time ago, in a galaxy far far away, this was needed in order
to prevent device write-DMA into non-existing (random) memory. As
this is not the case anymore, go with Christian's comment.

> the driver to clean up resources associated with a job. If it wants to 
> synchronously abort things there, it could easily take over its own 
> fence signaling and do something with the underlying stuff if the fence 
> is not signaled yet.
> 
> In my case, since the driver is written in Rust and free_job() just maps 
> to the destructor (Drop impl), that just ends up freeing a bunch of 
> memory and other objects, and I don't particularly care about the state 
> of the firmware side any more after that. The flow is the same whether 
> it was a successful job completion, a failure, or an early destruction 
> due to the drm_sched getting torn down.
> 
>> (Note also that in this latter case, traditionally, the device would be reset,
>> so that we can guarantee that it has forgotten all shared resources which
>> we are to tear up. This is somewhat more complicated with GPUs, thus the method
>> pointed out above.)
> 
> Yeah, in the firmware scheduling case we can't do this at all unless the 
> firmware has an explicit teardown/forget op (which I'm not aware of) and 
> a full GPU reset isn't something we can do either. Hence we just let the 
> underlying jobs complete. In practice they tend to die pretty quickly 
> anyway once all the buffers are unmapped.

Perhaps in the future, as more complex workloads are deferred to this
hardware and driver, a real-time requirement might be needed for this
"tend to die pretty quickly", that that there's some guarantee of
work resuming in some finite time.
-- 
Regards,
Luben

> 
> ~~ Lina
> 


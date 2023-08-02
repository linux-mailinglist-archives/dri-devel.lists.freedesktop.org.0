Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B5676CFC5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 16:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E9910E1A2;
	Wed,  2 Aug 2023 14:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB58510E1A2
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 14:13:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/YWaTBsKv8t2pFt4mHEYkabpbibaKNIXv4cBOqH7VzYOrBYfy1BvfRhvcwhVBu0uXGQtqOdeizYnHIwMGUkrnb6O9SxrM3wn388D8nHfsvNetoZAKlXTNkAzuFC3ojDo6wtbUM6zKMgecXoN3JIIFXK3F2cj0VbO79DpQ8jkIk9abg9xwrKUVomNQwuanE6ngGy2zSs4KjaRT7thIhN71IiGgPiRMI7mHJ8Z3eUEYFd7ir0a4VUppMguz8PKqUwFJ09wa3lTrdDuIrSFENsoWryoWNeV3ofEnZly0NVGNn45hSedLLfdSRiVF/5gbP41ITKMKAhFNoRmTdv/Fb35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2m4hZcXJy+9QdLeystr98F7iEOJRX16iWMNMKRccA3o=;
 b=JXJ/7eGWHMDEN+oL8F3Laig5VxXDj/avvWFsIg7gYvbfGjf0ohbmBl6OlOpN1VtWD9bB0aYKsD9EXTZzAAR9bIYbnFptlQCF5u1CuXA81JmecZJiuI5r8iM5TCyNtzPXeHaB+0J1ZP1CNOrYuZsFPVrFSMODrWpq+WOjyLzMwb/o4xuyU0gh4m9W+7hLyWPNn8FrNXk9bLniH/N7I1xYiEw3sUONKyczeBjOcht/QRaEbW/ldpHupiUxuVy2cGpKX75BF5K7H5v9BC7kocUR/FObmehOew3JgCwHLXw8zKXURM79gTkRp/qnG8h9s2fyRcJMZFTFetp3tH7g6p580Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2m4hZcXJy+9QdLeystr98F7iEOJRX16iWMNMKRccA3o=;
 b=tMRoHp7Zmlo0npWzCgUwREU6inWcLvKG8ZYZmaxLg1vpb72M0X6YSTSTm/US+cmMTKlQ299JGYMt/soAgny/Ew2lkJkE8rtXhcy2A44VXIrV+Rj3NF6YmCPJIPQhDy4fnIVkk89cBfhpJoQ1Nh5ms8wOSqmyceTU+WFYShTtTlE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SN7PR12MB8103.namprd12.prod.outlook.com (2603:10b6:806:355::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.45; Wed, 2 Aug 2023 14:12:56 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 14:12:56 +0000
Message-ID: <287b6d12-2a65-3195-7305-0255a4762778@amd.com>
Date: Wed, 2 Aug 2023 10:12:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/scheduler: Clean up jobs when the scheduler is
 torn down.
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-3-c567249709f7@asahilina.net>
 <9343165f-2533-f363-4942-719ee9b7d2a4@amd.com>
 <99f9003f-d959-fff3-361a-25b2f47efc88@asahilina.net>
 <49a33f61-91b5-22ee-78b5-c7dd7c0d4a46@amd.com>
 <ZMnWKXRmCVFRNLMT@DUT025-TGLU.fm.intel.com>
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
In-Reply-To: <ZMnWKXRmCVFRNLMT@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0092.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::28) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SN7PR12MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 6524a626-0970-4769-495e-08db9362918b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mNys3V4Lfpa6SUnsPKxFAvp060YSdN06xl21suPkwum4Hs9FjxK1A9RteVzX7cDg/jti+6LhmQeBpYuIJrokT6B2eD70Szrt+vUjeXzpAI8YkZKvHYPcHObnqcKkF9PGDRTbvoblA9dIoO7oYulTQWDXAB+yUQz69LEgI1lS7ZRi6g5W9VzXYD/gHhFoY6h6/6PkZCdxQ8ma+goXEdL2l+3gE+LGoJcqYJAcOBE//kPixTRhwvCfMIwFBPdk6wmHdBeKEktHUT6M8Cr3k/kbS07yJCfE7hwe3ce+F0eyVi0iMly/Bt5XQEFnyKldMbQMSTkyNSwb1mduPhAsOVYFuaopI4DCyCsOcUG0of9lGYljlB33ZuGPRLGKoKLsCUUwS3jmNMGx9U6VkYS0N4t/MLFSGs41O2h6lq0IRJtZFOQ8eyC+9d/NxUAfctDlAB9C6xQVlvhnEKJI86JwZ4rHyVr/4ot3bTjX8mVy1+Dak8ev1EUYgEmplY5utoLbINiDxIMnWnChSoz3z0rzZnMgu1e1ttT5rVai/5x5yiLJEsNZSA2EfuxMYwtf+rC9R9OdJOsKgHTVx3dBgls+tSTthmmR/cGb+uULV2o6355WmC4Mcld9EGdGyKHt7wdHBCx8XwNRg3x4IqleJ3uu3gwxa8Q9aDlGgEmBv/Bx9EPHqNfdXe6r2fj63wQ6K8C0fssRNuQCjaiX2MluAOZG9lE0bQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(7416002)(8676002)(5660300002)(83380400001)(2616005)(41300700001)(38100700002)(316002)(186003)(66899021)(8936002)(53546011)(6506007)(26005)(31686004)(4326008)(6916009)(86362001)(66946007)(31696002)(66556008)(66476007)(6512007)(2906002)(6486002)(6666004)(36756003)(478600001)(54906003)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2hBQzdqcGdMK204Q2dHbXRGQjIvaVdjS2NoWEswMDU2QWZnUldsSEl4cTZD?=
 =?utf-8?B?NDYwRVkrcGhpRk9jYklJbzl6ODMybGNPeXhmTTYzeHM0cW1QMUc3RkhLaElU?=
 =?utf-8?B?TTBKZzg1NVRMcVp2ZElXWUN2aEsxeEg3L25qTEhLdWFUMDZFVmlFVEUxZ2Vx?=
 =?utf-8?B?WVFhY01vQ0lFaVNsQWlLMVR2R3FuN1NEMDVtZHU1cDg3WXloTGNwekRkbFlv?=
 =?utf-8?B?cENXbjVSbmNBNjhyaEtoazFZUlpLV1cyK1cvTFFwdVM3MDRVM1hnUUdRbjA5?=
 =?utf-8?B?NTlvcFVZbXhwZWZleXAxYjFWRXE3MDZiZUNKYXZqK1VJSTJHQ0M1bGRaWU5q?=
 =?utf-8?B?eXJma00yeHlKaXEwY0h1WGhyODcza3NSSVdERnJ2bnowVllXaTdaYzZRNHM0?=
 =?utf-8?B?NmtvNFNxMURZWGlpMUs5VEhBMytFY1lJRS9GcEE1MmtoeFBpbEpFRnpxUjcx?=
 =?utf-8?B?MWd2UXVIZXVnMmZXV3hFQUo1c20rWkZ3MWR5ZndXVGNyOER6cGJ3SEZLamVJ?=
 =?utf-8?B?RkdpR3NGSEliekNxQ3BwRG1hUjByalZ6RThTYW50R3BvMS9jYWhUSG9XeDFW?=
 =?utf-8?B?cHdhc05TYlQzNWtSNGZsS0FZa2NjNnZGUy9idENPNC9CaEZ0LytxNWovQTZQ?=
 =?utf-8?B?aEQzaUlKaU5haHp3N2VLM2thQmd6Y09xNkpRQTArS1lpT3lHZWZMb2ZrV1Zz?=
 =?utf-8?B?bnRMZncyOHNVWTlZemJQdUQxeEhEaytXZ3V1VkM3RTkxbnhLNDF6cnB2RjU0?=
 =?utf-8?B?QWFrVXUrUVpsY3VzUUVzbE4zazg5VTRlcVR0c3lybWJabHM2ZVJhS3ZFTjlB?=
 =?utf-8?B?Zm5KK3R0SnVTZUpTK0lTYnBHTkdYazYrZHJpWGlJeUFLVnAxb1lRUFRiRkpE?=
 =?utf-8?B?Rk1rckNUbHVHVFNabzFXZU5wdTcranFmckhFYXdIQ0p4eVU4UlZBS3ZXeXR2?=
 =?utf-8?B?b3R3Zzdjc1Jzc3BhaHdqUjBDaGVkdE5LSTk3MExSR1ZBa3JQZjBmcEZIQmcx?=
 =?utf-8?B?K2ZFU2ZXdFVqVGgzcXQ4K3paRGJSeVBjM3RQRCtleEJhNU1yK0pxc1M4cjR4?=
 =?utf-8?B?aXU0amtwMTFRNlhBVk52N0toU081N0ZVMmlJTHFqSEh0c2xQRmZOU1JnOWhU?=
 =?utf-8?B?SGdIV0Y4RVhOSGNnUTg5SzJ6ckNBM0tWOWFRY1lGM2JmM1YxcWpEVGVid2ds?=
 =?utf-8?B?M1FQcDdFNDBvUWlCazFxS0IvRllXdVViVWpzdTdGS2hkRllxT0ZKa2xaL0FW?=
 =?utf-8?B?aHRTSWFQSjR4L1BKNDR5RjhiUi9QWjJUK1R3QWp4bWx3MkxzWlZxZDRZV3Nr?=
 =?utf-8?B?ZlNxa1VIZHFZS293cGVVNmRkQUo0YXlyRXpOREtocHhMZ2NvYU5qUUZwWmNk?=
 =?utf-8?B?YU5lNjVPRGZXTm5xM0d5cCtBYmZaSmRuNXdsY2xkY1pDcWZFNUtkT0Zya1Y1?=
 =?utf-8?B?R015WmVZUG1TUWRubmtJSC9xWWwrVlVRR3cyL2dVdFY1bmFtbHdDaHpWaVk5?=
 =?utf-8?B?QkZ5ZHF2Z3c5MWg0QTBvV29PeVIzaDhuWDlLemRocmFkcmNta0RiZkEvTkpB?=
 =?utf-8?B?K3FLaXl0c2R4YmtmbWtvazlWRUk0SjF2WDVGQlVLT2JVVHBSdDA1SVZXc2FH?=
 =?utf-8?B?L2dZTy82aWdCRFhVMjMwcGxwcnlzdjhrS1gwV2p3aXRaeEV1SGdBRUFYWVFK?=
 =?utf-8?B?dFRMRDdhZGpFS0lxd0NnMFNabzl6ZUpMY0oydTlXYWRNM214T0EwYzBicmNS?=
 =?utf-8?B?cU5WVDVjNzhobEo5SjVJWXgzS1B1TE9RaXF0ZTI4UndrOGZzWGR2UUpoTXNv?=
 =?utf-8?B?YVJSN0hoY0NzMVpvbm8yZW1WQmNQN2hyejUwbUswRlFpeERLbFpMMXVFd1Bo?=
 =?utf-8?B?RnI1bzJPekNXQ1ZaZXNEU1g3T0lrbERQdzFkOUJaVjh6NHlzS3cvbmxiMStE?=
 =?utf-8?B?Q0VucFNEL1FkNEJGdjBjb0k0SzM5QmFkenl0VkNnbG16Z2Fjd1dYbXkzcjQz?=
 =?utf-8?B?ekRIWHhDcGtyUm5hZ0pDVXNaeXhWRHBWL1pRbkxPRTQxTG8wWXg3TXZZUE0w?=
 =?utf-8?B?dkJaY0tONnRob3VlNDdrbGhZbTNjL3RUdk1XcW1SMzlyWDgzVEpmSmpkRytH?=
 =?utf-8?Q?m/RbGFCE3H0Ev+luVy5e4DG4g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6524a626-0970-4769-495e-08db9362918b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 14:12:56.2329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnFrTqr6se6tobybxRccSx5zvFv1SWCWrbcDZK6j9IGOumjf5EtawCOmnKqYT2I8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8103
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
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Asahi Lina <lina@asahilina.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 asahi@lists.linux.dev, Sumit Semwal <sumit.semwal@linaro.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-02 00:06, Matthew Brost wrote:
> On Mon, Jul 17, 2023 at 01:40:38PM -0400, Luben Tuikov wrote:
>> On 2023-07-16 03:51, Asahi Lina wrote:
>>> On 15/07/2023 16.14, Luben Tuikov wrote:
>>>> On 2023-07-14 04:21, Asahi Lina wrote:
>>>>> drm_sched_fini() currently leaves any pending jobs dangling, which
>>>>> causes segfaults and other badness when job completion fences are
>>>>> signaled after the scheduler is torn down.
>>>>
>>>> If there are pending jobs, ideally we want to call into the driver,
>>>> so that it can release resources it may be holding for those.
>>>> The idea behind "pending" is that they are pending in the hardware
>>>> and we don't know their state until signalled/the callback called.
>>>> (Or unless the device is reset and we get a notification of that fact.)
>>>
>>> That's what the job->free_job() callback does, then the driver is free 
>>> to do whatever it wants with those jobs. A driver could opt to 
>>> synchronously kill those jobs (if it can) or account for them 
>>> separately/asynchronously.
>>>
>>> What this patch basically says is that if you destroy a scheduler with 
>>> pending jobs, it immediately considers them terminated with an error, 
>>> and returns ownership back to the driver for freeing. Then the driver 
>>> can decide how to handle the rest and whatever the underlying hardware 
>>> state is.
>>>
>>>>> Explicitly detach all jobs from their completion callbacks and free
>>>>> them. This makes it possible to write a sensible safe abstraction for
>>>>> drm_sched, without having to externally duplicate the tracking of
>>>>> in-flight jobs.
>>>>>
>>>>> This shouldn't regress any existing drivers, since calling
>>>>> drm_sched_fini() with any pending jobs is broken and this change should
>>>>> be a no-op if there are no pending jobs.
>>>>
>>>> While this statement is true on its own, it kind of contradicts
>>>> the premise of the first paragraph.
>>>
>>> I mean right *now* it's broken, before this patch. I'm trying to make it 
>>> safe, but it shouldn't regress any exiting drivers since if they trigger 
>>> this code path they are broken today.
>>
>> Not sure about other drivers--they can speak for themselves and the CC list
>> should include them--please use "dim add-missing-cc" and make sure
>> that the Git commit description contains the Cc tags--then git send-email
>> will populate the SMTP CC. Feel free to add more Cc tags on top of that.
>>
> 
> Xe doesn't need this as our reference counting scheme doesn't allow
> drm_sched_fini to be called when jobs are pending. If we want to
> teardown a drm_sched we set TDR timeout to zero and all pending jobs
> gets cleaned up that way, the ref of sched will go to zero, and
> drm_sched_fini is called. The caveat here being I think we need a worker
> to call drm_sched_fini as the last ref to scheduler might be dropped
> from within scheduler main thread.
> 
> That being said, I doubt this patch breaks anything in Xe so do not a
> real strong opinion on this.

Yes, that's my understanding as well. If the drivers call drm_sched_fini()
then they are responsible for cleaning up _before_ calling drm_sched_fini().
The Xe driver seems to be doing the right thing. All in all, since
drm_sched_fini() is called by the driver, the driver is supposed to have
cleaned up before calling it, so I don't see much need for this patch
after all.
-- 
Regards,
Luben


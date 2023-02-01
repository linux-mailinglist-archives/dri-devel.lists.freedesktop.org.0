Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F414B686B71
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 17:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCBD10E423;
	Wed,  1 Feb 2023 16:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C43B10E441;
 Wed,  1 Feb 2023 16:21:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VC7SUPOfMV2erkdgF2HEi2s3RpGePcsQXhFUsgoK7Dq0HT8tFG1fsi754Z21pk8MpO5eaOdzDy4ARfqHH9hrfvCC2Mxsp7fugiTO77mPJyXcys197SoUkMLxxSTTSXpVRlUKnQkpzBTsx7KPzpAJNH3wH/kY/nzsRxZ+a1EwRYyfL9QL+YHjjxxJTxaklBmt50wKpud2EL5CKuIVmMtvZ7VgMlmr0arZKsdUd+jK94KRwr05kN1jptm3qlV73YtGv5tIIgqIzf0Qvwu6DPEWvw//K5V2ywYRGo+cpa/gqw2rBl9YiRGs6zG4OQlv8aEUFNNF+nqHZnZkz3zGxRhxmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CVsvlsgV7xlrJMaH9zyHz2GoLR/D8TZbtgKaF4KjM4=;
 b=kaSdUBfaZnLNtIf7giDaXuAg++4ZpEX0GdlPo/8kSla4k32/b6z/EpGS0CsvQqqtg+1s75r1YgpCAV/d18PSn/f1LO5gZqiO/TFaJFWe/WgOzE0XfMmrTdTObVdWcZlK3/OZjPy9ixEgy9CWbbdKR3/Qb8k9SgIyBaYj+CTj8LRz4o3qJ4gppad9C885klJ/kTZ54Bd7geooXwN678VTz7zI4g830Ln8NektooOYsIJuUU1d3a92W3SU0iYTf5STrPEYNCy9uMMw4cPrzpXsWJlxg4bnYcdfGxDzJPKxw6NK+jg8f8P5pr7MYAbkLe3ECH8WOCleWY5ssnxgk1v4og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CVsvlsgV7xlrJMaH9zyHz2GoLR/D8TZbtgKaF4KjM4=;
 b=WEfyCDvgDSd5lbXr9fVdDVl+lxiapucL0toJQQzIKCkyGIZAwjXgbrgLST37TmoJpl7EQMP41m4S9wwi3cBOtnEqVXQvqyve+CPwOYoRfbxhIDVp8Qg9o/L0R9OWDuoosaZM9blLHop91vU/88CcqzKf/CikIAEmb6PC8fs/rSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CY8PR12MB7145.namprd12.prod.outlook.com (2603:10b6:930:5f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.36; Wed, 1 Feb 2023 16:21:42 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e%7]) with mapi id 15.20.6043.023; Wed, 1 Feb 2023
 16:21:42 +0000
Message-ID: <8701ac2b-8ac9-a477-8d18-e2bc334ad201@amd.com>
Date: Wed, 1 Feb 2023 11:21:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-CA
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230130214504.1305042-1-gpiccoli@igalia.com>
 <ac604d40-ef87-7147-b1ee-3620e68b3268@igalia.com>
 <CADnq5_NEyGNXpo3mZ=WR5Me8b9r24aq0MmMZ6GsvBRoBmNVGGQ@mail.gmail.com>
 <DM5PR12MB24693E815CAB63FE2DE06E4CF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <DM5PR12MB24696F955FF95A7AB00E1956F1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <984ee981-2906-0eaf-ccec-9f80975cb136@amd.com>
 <DM5PR12MB246930987580ACA15EA44C2BF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <52dbfde8-8865-6b30-c32f-33cff2c87fcc@gmail.com>
 <CADnq5_NLHqXxqcVMJRgxmc8cJfu6N0HML=cfETvijimimtoWbQ@mail.gmail.com>
 <8caaabda-25d3-61bb-a541-f81f851115c0@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched
 init/fini
In-Reply-To: <8caaabda-25d3-61bb-a541-f81f851115c0@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0111.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::20) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CY8PR12MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: d5271d6a-f968-4fde-8965-08db04706735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WCWqD74aJ86baoB/scUhCf6BFbtwIVbSJ4wtnNV4wnTX+RDVsOj+ka0q9MbK+4nu5D8T98StT+3Op9izdNR3Jvu7Z4KG76x2CHZ6nHoHPEB9rOPDlOvy747QCXQNDKkuXTKUmJinBF1tw9DxUbruiK37d/UUpmn6TS5V+sSPx2UtS3W7E5h52YSV2LSYrrw+29i84oDXyzKgOk/AJKrwe2KoYO7ZVCY5VkM4TMm2rq36zmtYiZnQbcu1YfwA3idBYVxzV7uXLNyv4SsAaJ5LXEWhQSeJicMUcDVVxcFwrDJ7ghzofBqot2WzI5FPkEyLQuY+gtV9X30O2c608bMDKF+6n9ofne8LrIrioAQhx4iPuVhr2vQDiZldy4Ua42I2dclm2Ok0yruyYjzCD+Vk5Hml8EpGcXaFAMWnbflfwfWl72gqx2/CpYNRWtIKNIUk4ClG0/MMI2i+6S2yB2NNqURdDXI2DsTMtQCW6RAf+ynbrzlnRwQcV2HHnhc3+kVuphmyGlXjXqUc97JTw4ubeVXqc2SZiSYWcLNY6ZnLfRydPk2getbwTUstIdx4ouyy2MHu+i21dtyRQ5TSKBpLxG20jgWpuhZ8+Kbd2G3I3T/NJC8vrPwv2pBJVUP9d+10qyFhKudcb/xSYoxESdwiOLwlIAPS334OG5Um1NQtjXh2mZtxHIaLdUNZmTgHF0+hcXjZ9nwiodArvcIPGjti7OxiBNQ6TQlPPWdqGWuIH2o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199018)(66556008)(86362001)(38100700002)(31696002)(54906003)(66476007)(36756003)(5660300002)(316002)(4326008)(8936002)(66946007)(8676002)(2906002)(30864003)(44832011)(83380400001)(66574015)(6486002)(478600001)(2616005)(41300700001)(26005)(186003)(66899018)(6512007)(6666004)(53546011)(6506007)(55236004)(31686004)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkxpQmNKK0RyN3lwVEVlTnZOTk5SVSs1MmtwK09VL0E0K0EyUWdtYU9hcnR3?=
 =?utf-8?B?d0dxUHR5TlRkeVRZT0ZLQXNnZkVxd1ZnSUQ2VFpxNXNSaWs1dEd1OTBJU29s?=
 =?utf-8?B?YWF3Q2ZnTEMydnZPSzFiVDNKekQrYnZCWERzaUF4VTI0NnE3UVNJSXF6cVJS?=
 =?utf-8?B?VytiZDN4cU91STgvTThjbzJkUDEwVG94VDFPZnJjRWVZeExZc1hFMW15UVNB?=
 =?utf-8?B?N29RVkp0MlpEY3FubFNLdGpRZHoxQXp0NENmMkJDQWdnMUt6V1Y2RDhaM1k4?=
 =?utf-8?B?ajU2bThEUHExUlpucmZXOXZReTRES2FnWE4yOGpoUWVDczVyQWVXcEQ5SVZY?=
 =?utf-8?B?Z1hDOUgyWkdXaVp5bE5XRm1CbTJIOXAzUmpKdkpJZEk3elJlQ1ROZkczTzIx?=
 =?utf-8?B?Z3FYTDZFb0pHV0lmWFFzb0t0czhRbEh1c01GVnpHN1BoU1RiVXQ0bFkxakV6?=
 =?utf-8?B?ZHNyZGhsQWxDTFJobmxPZXRkV1ZOb0tBdGNTTHFjVlJUcjhKNGthWEpDR2NQ?=
 =?utf-8?B?TGxUVnYrampSMEhBVnpMTmxiWEFhQlYzay9zbml0TnBpR3NueVJhSHVjdzJp?=
 =?utf-8?B?NURzL3BZNUdDRE5ZRUFlYnlYYTh0ZXdWWkVBUEg3d2tqV2hnVGRHM2t0bUQ5?=
 =?utf-8?B?Y1RsenNQM2NoWGhod1JpTmFrU3N1TmlyNFF1bFovL21pc0NaZEg4RW5XeXdo?=
 =?utf-8?B?QlhiR0lVaVZYNGU4ZHU0SXFRVG10MFBuL3Y5alFiOVZQLy9ybDBYZW1PWXdC?=
 =?utf-8?B?YktQb1FtTkowWnVzblRxVG1mWGZFOUV3VlMreERTWndYS3pwK25YNG1pNXVK?=
 =?utf-8?B?MnVkYnNXTzBRSnpURUo4Tmdtenl3RTJaQUt3cFpJQXlqOUtvYTRwV0Rxd3NZ?=
 =?utf-8?B?OHRSeHdSQ08ySitCbjl4Tnd0NG00TWRycmdvMGNsWDlKYkU3cGRHVWN3Vk1L?=
 =?utf-8?B?N0xsdHowdEMyN0kzUzBDSEFFaC9tTmd0WGgyLzRJRnUzVUxNLzRIVUljK1Nu?=
 =?utf-8?B?Q25ab0tCbDl6SmRlTHdXMmExSjhQSEN5WGNuMHRNWC9SUzhZSkUvMm9NS1Y5?=
 =?utf-8?B?dXpSVUJRNzc4YzR2ZVpyRFJhZnNDNUxIZmttQVBvTHF4dkRRbFU1cUVScXpP?=
 =?utf-8?B?Um5YZG9ETzJvT0xmQ0wrZzdVV1RNYnBnQWNTNmpaenQ1cCtMNHRyNjcrbHBK?=
 =?utf-8?B?STBYakRmb3JqRjM5NmxDUkpUNi91TjRKcytGcDlmL0JHemFPMVFlY0hiSU94?=
 =?utf-8?B?VElhTjNwS0tNNjRZKzFFMkhYWTN0QXFEdlM2QlhZam1JdFdnL2lnQXVkOU1t?=
 =?utf-8?B?Q3ZQOTFuRFMrMDR5dHU4cHFIK2NYbU50WFZJb1pHUTVMRnN6Y0tFdVMreGVK?=
 =?utf-8?B?aEI2R3ZzTmM5TzFkQ3lqSVR6VThxUXYwSWcyTlc4K3NYWWxlWE55L05sOS9t?=
 =?utf-8?B?cTZYWXdRUEJaZW9kbUlDNlNTSmQxTFNLV3lRMnZOYyttU1pibjAvTHJYbTVE?=
 =?utf-8?B?SDQydi9NZlludkMzUUVmS2xac2cvamp5bzRYUURxb0d5c09HRnBoS2F2VVU0?=
 =?utf-8?B?cFB2aHBpVUd0cDE2ZkgwVVRJYmZGeU8xSFphdmRINThEdjBINEMyWjluQWNK?=
 =?utf-8?B?RmdMaXBya1BWQzNHT1MwTENkR3ZkWUUxSHh4SjFWN3BOOCsvczRCT2JHZXI1?=
 =?utf-8?B?MDBnRWdPYVFQSWxtbnY3eGxOTTBUWW8rRHVMQWVGUDZHZTRvWWVwQ0gwUGtp?=
 =?utf-8?B?UW9TbklqTmFLWEw4V0lORFNwbzhSM3VHQTJrYzRQVWYrU0hTaWFudHlocmYx?=
 =?utf-8?B?MHpEWmM1eXBPdllYTm1GcVB3d2FML2syMktNV29wMHkrY0dqcUpDSWdZUjhm?=
 =?utf-8?B?Y201TlVRd2V4Y0tOSTQzbzV2aW9nV0xhMlA0Wm9JcElPaVRxYlcwMDB6NHZU?=
 =?utf-8?B?R2l6MlR3cjBndnFQdGFpZFZqdzdiMVFIWmpGWUIrSTRZVWFmUWtzbXlaYVB0?=
 =?utf-8?B?akdLa0xOb1o4ZzNCdUNSamtMNmNoeG1ZL1MvVnNoa0NSRU1BR2xHMEwwaHR6?=
 =?utf-8?B?UHhhTzlEQnhFaXp0VzQzRzJVOEdXZXhFcFNSV2Q1L2U1T1dMSjFHWXZSTEdq?=
 =?utf-8?Q?hlxLHxRrOiXLEemPngfJ0Z0h9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5271d6a-f968-4fde-8965-08db04706735
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 16:21:41.9498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dS85HffC0TehHL+flf6scEH6vIJKxlq3GLvKWw2rR5Vuec+OWQxUDkon7WZRwuMJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7145
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
Cc: "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guilherme,

Since setting sched->ready to false, seems to be taking place in, directly amdgpu_ring_fini()
and in amdgpu_fence_driver_sw_fini() indirectly as that function calls drm_sched_fini()
which sets it to false, we seem to have two competing policies of,
"set ready to false to show that _fini() was called, and set to false to disable IB submissions".

To that effect, your patch is generally correct, as it would be the case of an early failure
and unroll from (indirectly) amdgpu_device_init_schedulers().

Please resubmit your patch but using .ops as Christian suggested, as .name is sufficient,
but .ops is necessary.

On a side-note: in the future we should probably discern between
"this ring has an initialized and working scheduler" (looking up at DRM), from
"this ring can take on IBs to send them down to the hardware" (looking down at hardware).
Sched->ready seems to be overloaded with these disparate states, and this is why you need
to use .ops to guard calling drm_sched_fini().

Regards,
Luben

On 2023-02-01 09:35, Christian König wrote:
> Am 01.02.23 um 15:24 schrieb Alex Deucher:
>> On Wed, Feb 1, 2023 at 2:18 AM Christian König
>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>> Hi Guchun,
>>>
>>> no, that doesn't make any sense at all.
>>>
>>> The ready flag indicates that the scheduler is fully prepared for hw
>>> submissions from userspace and is unrelated to the initialization
>>> status. It's set to true after IB testing was successful and only set to
>>> false only when a GPU reset fails and we can't get the hardware to work
>>> any more.
>> That might have been the original intention, but right now sched.ready
>> gets set to true when we finish setting up the ring, but before we do
>> ring or IB tests.
> WHAT? Please not again.
>
> I'm really tired of fixing this over and over again, the meaning of 
> ring->sched.ready is to block submissions when a GPU reset fails. AND 
> NOTHING ELSE!
>
> The problem is people seem to abuse it and I have to fix it for the 
> fourth or fives time now.
>
> I'm going to send out patches,
> Christian.
>
>> Alex
>>
>>> Please use sched.ops instead as I suggested before.
>>>
>>> Regards,
>>> Christian.
>>>
>>> Am 31.01.23 um 14:58 schrieb Chen, Guchun:
>>>> Hi Christian,
>>>>
>>>> Do you think if it makes sense that we can set 'ring->sched.ready' to be true in each ring init, even if before executing/setting up drm_sched_init in amdgpu_device_init_schedulers? As 'ready' is a member of gpu scheduler structure.
>>>>
>>>> Regards,
>>>> Guchun
>>>>
>>>> -----Original Message-----
>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>> Sent: Tuesday, January 31, 2023 6:59 PM
>>>> To: Chen, Guchun <Guchun.Chen@amd.com>; Alex Deucher <alexdeucher@gmail.com>; Guilherme G. Piccoli <gpiccoli@igalia.com>
>>>> Cc: amd-gfx@lists.freedesktop.org; kernel@gpiccoli.net; Pan, Xinhui <Xinhui.Pan@amd.com>; dri-devel@lists.freedesktop.org; Tuikov, Luben <Luben.Tuikov@amd.com>; Limonciello, Mario <Mario.Limonciello@amd.com>; kernel-dev@igalia.com; Deucher, Alexander <Alexander.Deucher@amd.com>
>>>> Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched init/fini
>>>>
>>>> Am 31.01.23 um 10:17 schrieb Chen, Guchun:
>>>>> Hi Piccoli,
>>>>>
>>>>> Please ignore my request of full dmesg log. I can reproduce the issue and get the same failure callstack by returning early with an error code prior to amdgpu_device_init_schedulers.
>>>>>
>>>>> Regards,
>>>>> Guchun
>>>>>
>>>>> -----Original Message-----
>>>>> From: Chen, Guchun
>>>>> Sent: Tuesday, January 31, 2023 2:37 PM
>>>>> To: Alex Deucher <alexdeucher@gmail.com>; Guilherme G. Piccoli
>>>>> <gpiccoli@igalia.com>
>>>>> Cc: amd-gfx@lists.freedesktop.org; kernel@gpiccoli.net; Pan, Xinhui
>>>>> <Xinhui.Pan@amd.com>; dri-devel@lists.freedesktop.org; Tuikov, Luben
>>>>> <Luben.Tuikov@amd.com>; Limonciello, Mario
>>>>> <Mario.Limonciello@amd.com>; kernel-dev@igalia.com; Deucher, Alexander
>>>>> <Alexander.Deucher@amd.com>; Koenig, Christian
>>>>> <Christian.Koenig@amd.com>
>>>>> Subject: RE: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching
>>>>> drm_sched init/fini
>>>>>
>>>>> Hi Piccoli,
>>>>>
>>>>> I agree with Alex's point, using ring->sched.name for such check is not a good way. BTW, can you please attach a full dmesg long in bad case to help me understand more?
>>>>>
>>>>> Regards,
>>>>> Guchun
>>>>>
>>>>> -----Original Message-----
>>>>> From: Alex Deucher <alexdeucher@gmail.com>
>>>>> Sent: Tuesday, January 31, 2023 6:30 AM
>>>>> To: Guilherme G. Piccoli <gpiccoli@igalia.com>
>>>>> Cc: amd-gfx@lists.freedesktop.org; kernel@gpiccoli.net; Chen, Guchun
>>>>> <Guchun.Chen@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
>>>>> dri-devel@lists.freedesktop.org; Tuikov, Luben <Luben.Tuikov@amd.com>;
>>>>> Limonciello, Mario <Mario.Limonciello@amd.com>; kernel-dev@igalia.com;
>>>>> Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>>>>> <Christian.Koenig@amd.com>
>>>>> Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching
>>>>> drm_sched init/fini
>>>>>
>>>>> On Mon, Jan 30, 2023 at 4:51 PM Guilherme G. Piccoli <gpiccoli@igalia.com> wrote:
>>>>>> + Luben
>>>>>>
>>>>>> (sorry, missed that in the first submission).
>>>>>>
>>>>>> On 30/01/2023 18:45, Guilherme G. Piccoli wrote:
>>>>>>> Currently amdgpu calls drm_sched_fini() from the fence driver sw
>>>>>>> fini routine - such function is expected to be called only after the
>>>>>>> respective init function - drm_sched_init() - was executed successfully.
>>>>>>>
>>>>>>> Happens that we faced a driver probe failure in the Steam Deck
>>>>>>> recently, and the function drm_sched_fini() was called even without
>>>>>>> its counter-part had been previously called, causing the following oops:
>>>>>>>
>>>>>>> amdgpu: probe of 0000:04:00.0 failed with error -110
>>>>>>> BUG: kernel NULL pointer dereference, address: 0000000000000090 PGD
>>>>>>> 0 P4D 0
>>>>>>> Oops: 0002 [#1] PREEMPT SMP NOPTI
>>>>>>> CPU: 0 PID: 609 Comm: systemd-udevd Not tainted 6.2.0-rc3-gpiccoli
>>>>>>> #338 Hardware name: Valve Jupiter/Jupiter, BIOS F7A0113 11/04/2022
>>>>>>> RIP: 0010:drm_sched_fini+0x84/0xa0 [gpu_sched] [...] Call Trace:
>>>>>>>     <TASK>
>>>>>>>     amdgpu_fence_driver_sw_fini+0xc8/0xd0 [amdgpu]
>>>>>>>     amdgpu_device_fini_sw+0x2b/0x3b0 [amdgpu]
>>>>>>>     amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
>>>>>>>     devm_drm_dev_init_release+0x49/0x70
>>>>>>>     [...]
>>>>>>>
>>>>>>> To prevent that, check if the drm_sched was properly initialized for
>>>>>>> a given ring before calling its fini counter-part.
>>>>>>>
>>>>>>> Notice ideally we'd use sched.ready for that; such field is set as
>>>>>>> the latest thing on drm_sched_init(). But amdgpu seems to "override"
>>>>>>> the meaning of such field - in the above oops for example, it was a
>>>>>>> GFX ring causing the crash, and the sched.ready field was set to
>>>>>>> true in the ring init routine, regardless of the state of the DRM scheduler. Hence, we ended-up using another sched field.
>>>>>>>>> Fixes: 067f44c8b459 ("drm/amdgpu: avoid over-handle of fence
>>>>>>>>> driver fini in s3 test (v2)")
>>>>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>> Cc: Guchun Chen <guchun.chen@amd.com>
>>>>>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
>>>>>>> ---
>>>>>>>
>>>>>>>
>>>>>>> Hi folks, first of all thanks in advance for reviews / comments!
>>>>>>> Notice that I've used the Fixes tag more in the sense to bring it to
>>>>>>> stable, I didn't find a good patch candidate that added the call to
>>>>>>> drm_sched_fini(), was reaching way too old commits...so
>>>>>>> 067f44c8b459 seems a good candidate - or maybe not?
>>>>>>>
>>>>>>> Now, with regards sched.ready, spent a bit of time to figure what
>>>>>>> was happening...would be feasible maybe to stop using that to mark
>>>>>>> some kind ring status? I think it should be possible to add a flag
>>>>>>> to the ring structure for that, and free sched.ready from being
>>>>>>> manipulate by the amdgpu driver, what's your thoughts on that?
>>>>> It's been a while, but IIRC, we used to have a ring->ready field in the driver which at some point got migrated out of the driver into the GPU scheduler and the driver side code never got cleaned up.  I think we should probably just drop the driver messing with that field and leave it up to the drm scheduler.
>>>> To use ring->ready is not a good idea since this doesn't specify if the scheduler was initialized, but rather if bringup of the engine worked.
>>>>
>>>> It's perfectly possible that the scheduler was initialized, but then the IB test failed later on.
>>>>
>>>> I strongly suggest to use scheduler->ops instead since those are set during init and mandatory for correct operation.
>>>>
>>>> Christian.
>>>>
>>>>> Alex
>>>>>
>>>>>
>>>>>>> I could try myself, but first of course I'd like to raise the
>>>>>>> "temperature" on this topic and check if somebody is already working
>>>>>>> on that.
>>>>>>>
>>>>>>> Cheers,
>>>>>>>
>>>>>>> Guilherme
>>>>>>>
>>>>>>>
>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 8 +++++++-
>>>>>>>     1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>>> index 00444203220d..e154eb8241fb 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>>> @@ -618,7 +618,13 @@ void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev)
>>>>>>>                  if (!ring || !ring->fence_drv.initialized)
>>>>>>>                          continue;
>>>>>>>
>>>>>>> -             if (!ring->no_scheduler)
>>>>>>> +             /*
>>>>>>> +              * Notice we check for sched.name since there's some
>>>>>>> +              * override on the meaning of sched.ready by amdgpu.
>>>>>>> +              * The natural check would be sched.ready, which is
>>>>>>> +              * set as drm_sched_init() finishes...
>>>>>>> +              */
>>>>>>> +             if (!ring->no_scheduler && ring->sched.name)
>>>>>>>                          drm_sched_fini(&ring->sched);
>>>>>>>
>>>>>>>                  for (j = 0; j <= ring->fence_drv.num_fences_mask;
>>>>>>> ++j)


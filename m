Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8465B68685C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 15:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B3A10E406;
	Wed,  1 Feb 2023 14:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3267A10E404;
 Wed,  1 Feb 2023 14:36:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGMbFCVTNsjsy0HKteYKzDZxoE0DGgIWhQ+FKkXMOa7vYZ8wKRixmXcIKJAsIcRIZDb4YKk5cP055FXWgjU6EvtUcFvuNr03CkjKkKSibMTubCSdY4bkhEisfI/PEIzM+RLXcHXECG3yME5C0T+3bo+1aj/114ZaMcuA+oPdfpSQbet9KbRBdnAtZt9v7R6tQmXMVTHk1u7x/W39c+C8x5Ol406eK8HI2KfEePfc3lFL5eixPkUkzhPJchzQzB+8hgCuLMh1bf7k7DaWkvWSceQIggenKtDS2bK+Wj828u0M1eisubgqgYv0MnESCZ+bUwUvtkVb1CQ/XE6up+ixIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pruGULc2CYpaDhAxDr5VV7QsSEL3K/JSyjek3HdxYAo=;
 b=meKsC7W556nZcGS5CitJIrjRDkOpoioSlar3g20QSmq8L53BrE/1YcqX/DQTWaMVtP7lg+txJNtVmYdUKdk8h+XSr2Aq8isoqirUn5L/7OhhBYK4gc7VCKZ8SBvXtjaFJ0JN/wuKzM/eMI2EuWAWTwhp8u5Rvzj8t9wtn8t2+FZGdxae+D1cSDmAwo8O/QmuWdDwJhed2m9IpkJi0+kB2DB5g4KMwqOJ03BJXe4JI3LF+S/fYZVmsrUcbuyQ6Y03wzKz1BoM3VsE7Rlm2oKl4h6zlv7UDeUTquUO4hNf9lj2tD1uDi4oirfT2bNWaG49uxH8A6U1pO2HXLfMkTgEKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pruGULc2CYpaDhAxDr5VV7QsSEL3K/JSyjek3HdxYAo=;
 b=Wx8ily/GOnOEd1/kUIBG6QlfntXZPFmCfZ7Yfki4kPgqiHU7WBBm++AU7L5/s/LflKshtfFiafF9ys9Cgjf+S8xF2IbyrWlcJN+tAh0PHVFm7E5ylrep9yeJzhGaRW/n8AEQ5Shrsl8QVkMBp+JEuWOcQSGkkhkqcPMgDMhOAfo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by BL3PR12MB6428.namprd12.prod.outlook.com (2603:10b6:208:3b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.23; Wed, 1 Feb
 2023 14:36:00 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::500a:d02f:5ceb:4221]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::500a:d02f:5ceb:4221%7]) with mapi id 15.20.6043.030; Wed, 1 Feb 2023
 14:36:00 +0000
Message-ID: <8caaabda-25d3-61bb-a541-f81f851115c0@amd.com>
Date: Wed, 1 Feb 2023 15:35:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched
 init/fini
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_NLHqXxqcVMJRgxmc8cJfu6N0HML=cfETvijimimtoWbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::18) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|BL3PR12MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: ef356989-d5b2-402e-3e7f-08db0461a381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pYk5vBRDNFEoIj+uYWJEMdOaS/BLeKglhT7htD2wiUyJB0vNG52rGW5KFXPSu3B4ddkQPNDSZf8aoNsG1s6pF/E7k+L+LkmlFJh2OqlALK25FXLuAUNGTvruG0jS5dm79JzpZaLfxzHUUdDsUMg8k5FWUOsDRaBRJj4h5DQnxGYYDPUHA89vJZAsWgldIpV/XwM64wY37TheOM+jA659ki70D0Vrj3g+hY1tWzLeBZv7oVoFsoJPU9QsdeF+IuNSal74kLYFuP4V1aG1SxcLimT5lmRhjjdN73aVXiAvBOqW+/fdUlxnoz5T7bCeWOEkQ+rp8jZ1TogWPw8NfaM0BfGjrT5/PtT2F4CFTChZ29YIGkVROOj8SCMuDhRP1cQaoS6IkxDa9L9GnqYbZgX87n4Yy5ltT9h9FaNvQUSgzZIwvVAGCMMWqb6iNcU/b0N0Ku2VqMA/4TUj99Sji4hfp68wBaWhhzCdBqgA697YB79n1JSPpHuf4Oh3mvDZiiYvZLlXTbVwz4FL7FRW53h+FazevZLCSwVmWiZCar0eEqW6i4WQBC+K6IQQoup3hUp8MSQTQBH+g947uTiNHM6b2tMlcuwBmjAXNquZqaZGTUEWSLXh0A8dB0cX9jUrjyq/zsTd+Lb8L4Xf0WIR0xnLyiO4+gMgVFgpFRz0wMJAPNrn8D0lu6GkU9Mq4OuBYGR+lcwxOE/cHfHtl7iC57o7tW7THXCGLqoFAcso59VEZsE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199018)(6512007)(53546011)(186003)(478600001)(6506007)(6486002)(2906002)(83380400001)(66574015)(31696002)(86362001)(36756003)(316002)(5660300002)(8676002)(110136005)(54906003)(41300700001)(8936002)(31686004)(2616005)(6666004)(4326008)(66946007)(38100700002)(66556008)(66476007)(66899018)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTNmRjFrTVRicUlKaVN2ZE5LOFJxYnBzdmFqVnk5Z1kxb0FNc0hOMGRhdS9n?=
 =?utf-8?B?YjZ6Q0ZtbmxjQ005OVJJVzgzbGpnaURkaVBjZk10ck5NZjk2Y1dKY1V6bnhR?=
 =?utf-8?B?bU9kSXlhK2FucVZzdXlWU2U1STh0UUhHa3M4dGlJTXR1bWdEUWoyVFlaczJw?=
 =?utf-8?B?MFlmc0RmVGZHem5KcjNTNm9JWCtpOUcwY2Q4TFZYSHJJeWVmN2t6ei9HczY4?=
 =?utf-8?B?bmtrMFNDeWFDRkx0NVR4V2xzY0hkQUQzRG54V2k4dDZJM3ZUYWFPUGZFYkRT?=
 =?utf-8?B?WG1rZFVjZy9aUWlpNDVTVUgrSUVwZjM5SGt5OGFZUW5XOHpmVkQ2Rnlmd05i?=
 =?utf-8?B?OXVYdnlzNDF0QXRvdDc0TGdadmh3ams0a3RoOTlDUitnK2tUYmY1YUphYi9r?=
 =?utf-8?B?dHRzSnk0Y1ExTENXajIvMU5SRVoyTEI0VUtDUzdDc0xYZzdRSHZMZE9nYVVu?=
 =?utf-8?B?Wm1MWE42dlRZem1HVkFManFRZ2l2NmpHYmRldUFiUkQwRXFPSlFocmdUT3c3?=
 =?utf-8?B?ekdHZVRJMUMrM091cjJDZWZmdWE5c3NaZ3hHREpMZUEvaC83T05UYUZwMVVq?=
 =?utf-8?B?NjV2bjI5ajZ5ckUzZ1dWT0k1NWpvNGJNL0xXbWpmZGRxalpzTC9ueDhpTXU4?=
 =?utf-8?B?WmVyckltQzV3QzZIOTZ5RDNkbkZsRlgzREhJdXFrdHh0TU1kZUMxZVFNQk1r?=
 =?utf-8?B?K3NPclZpVDJ1d1A4dU9oUFRLcFk4aFVuWXZTZjJnQnhRaEFwTzBJVnZYWmd3?=
 =?utf-8?B?OUlsUDFwemY4STJieldnSFdmUXI3a2VXWFBVemR3R25RWmNzTHhwN0VQWjVI?=
 =?utf-8?B?VVU5MnhuWitHdDE5cVNDL0RLMHVrWUw3UWFPRG0yY2hXK3NDRnNBcytEdk5m?=
 =?utf-8?B?RG1GSUQ5cU9ySGxMbDZyQ0x2SUJpT0hCM283Zm9ZQmZxczAxY2V0dnJoRXph?=
 =?utf-8?B?Y3IwQlBmWmEzNnErSk5CZy9oZ09LMlFyRXZuK1pQRlFHbHFFenh6cmNtVnVF?=
 =?utf-8?B?TFV1RzhhUGwrZnZxVzhjZ09ZUXdzdWZDRjBMZkhHN1RIbUlFTkNGd0ovSGc5?=
 =?utf-8?B?OHZZQ3BuVG1hRHR5WFdZQ2RTaDUweTR3SXoxTnpoRFZVVzlId0ZReDBvYTN4?=
 =?utf-8?B?THJnSkxrT1ZpMUEwaEk0ZUY4blBoVjlaMDFZMG5iY1VMbUlGb1lLTWNMdVlG?=
 =?utf-8?B?UlpVNVd6Q1ZNbTdZeEkrSWFvRDlFMjBkOTVCZzZoZHQwd1UyeDVicTRJaWJE?=
 =?utf-8?B?U3lFNDdDdHR6cnBUYk9NMFhXU053ZS9sTUpmbE5YeVNNYWovOEJSaHVZbnJv?=
 =?utf-8?B?MGE5TGgwQVdLSk5uVlpsK3lMUzFjaDFlOTlSSFFRQmxmUkVUMWlkOWhBTUs4?=
 =?utf-8?B?ak5mZTMrYVNWMDQvWWc0Zk9JRVVoME5ZSmhkdjVoaHArRmJaTG5yU3RHSEl0?=
 =?utf-8?B?STVrUTNpakEwK3RhOC9JT3FrZzF2WU92bWlwWExYUEhoRkZvWDZrazJwZlBC?=
 =?utf-8?B?TS93WFNZeXFZV0hwYVNZTHpERy8xNTQrdFRQczUvbExpaEd2MkFJMzFmUmxZ?=
 =?utf-8?B?dzdLeUh6UWlDb0FFRWJ1OWpKK3B4dFhQOWp1MnNLdHNteUIyc05rSGRnWlBW?=
 =?utf-8?B?Wk5XRnhHdmtEVndXZUpXOEcrTFVDQTdkM3Z3TXF5NXQxeDloZC9IQlZDWVQv?=
 =?utf-8?B?d20xSnpQNE10Y29OL0ZnWm9sRTMwUFY5NW0vcFYrZE9JVW5TZmdtckx4YWFw?=
 =?utf-8?B?U2s0OVB0bW5tZnFBKzJpUmtrU2g5QkV4a3lZS0FVQUZvY01pSERPNXZMRU43?=
 =?utf-8?B?WGRXNUtGWTk3S3oxRURiSkxUZldPQmtpWE56Ukhwa3F6NTI5QmFmK0RRSzNu?=
 =?utf-8?B?aTI3UXhpUFhRRlV2UjZDdDVzbGZRbEZ4RnYvVzRiZm9TTGIrb1V3cXhic0Q3?=
 =?utf-8?B?eTNBd1JqVTVwaWx1aUEvaDBzVVp2ZFd0V3lWYkFaMHB2T0xlWXJ0YTk1T0Jn?=
 =?utf-8?B?Y1ZYeEI0K1RpSU1LSjNDZUhkVGFxekFLMWp2amE3VlhXMjFtMHVlWGJaaktO?=
 =?utf-8?B?YXVvdW1pclNiZUpSTnoybmt3ZXgzWHpxM2szNU40ZFM3KzBnR3VHejlEaklK?=
 =?utf-8?B?ZUxQc1dIdlJLQmkxLytzRk5KL250SnU4VjZUNERKNGZWZTl6V3dveWdtSEpx?=
 =?utf-8?Q?PHGIbiLTmhOYoOG9C2xc+FpQ9KQ+6YyXhG+UKYYSRQFU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef356989-d5b2-402e-3e7f-08db0461a381
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 14:36:00.6583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLEmAWuwK9X7bVMkNl6gM/Ao5IYoApyNc8TeT3+VH9OPhimf9ffgW0Qyasl47WkI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6428
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.02.23 um 15:24 schrieb Alex Deucher:
> On Wed, Feb 1, 2023 at 2:18 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Hi Guchun,
>>
>> no, that doesn't make any sense at all.
>>
>> The ready flag indicates that the scheduler is fully prepared for hw
>> submissions from userspace and is unrelated to the initialization
>> status. It's set to true after IB testing was successful and only set to
>> false only when a GPU reset fails and we can't get the hardware to work
>> any more.
> That might have been the original intention, but right now sched.ready
> gets set to true when we finish setting up the ring, but before we do
> ring or IB tests.

WHAT? Please not again.

I'm really tired of fixing this over and over again, the meaning of 
ring->sched.ready is to block submissions when a GPU reset fails. AND 
NOTHING ELSE!

The problem is people seem to abuse it and I have to fix it for the 
fourth or fives time now.

I'm going to send out patches,
Christian.

>
> Alex
>
>> Please use sched.ops instead as I suggested before.
>>
>> Regards,
>> Christian.
>>
>> Am 31.01.23 um 14:58 schrieb Chen, Guchun:
>>> Hi Christian,
>>>
>>> Do you think if it makes sense that we can set 'ring->sched.ready' to be true in each ring init, even if before executing/setting up drm_sched_init in amdgpu_device_init_schedulers? As 'ready' is a member of gpu scheduler structure.
>>>
>>> Regards,
>>> Guchun
>>>
>>> -----Original Message-----
>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>> Sent: Tuesday, January 31, 2023 6:59 PM
>>> To: Chen, Guchun <Guchun.Chen@amd.com>; Alex Deucher <alexdeucher@gmail.com>; Guilherme G. Piccoli <gpiccoli@igalia.com>
>>> Cc: amd-gfx@lists.freedesktop.org; kernel@gpiccoli.net; Pan, Xinhui <Xinhui.Pan@amd.com>; dri-devel@lists.freedesktop.org; Tuikov, Luben <Luben.Tuikov@amd.com>; Limonciello, Mario <Mario.Limonciello@amd.com>; kernel-dev@igalia.com; Deucher, Alexander <Alexander.Deucher@amd.com>
>>> Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched init/fini
>>>
>>> Am 31.01.23 um 10:17 schrieb Chen, Guchun:
>>>> Hi Piccoli,
>>>>
>>>> Please ignore my request of full dmesg log. I can reproduce the issue and get the same failure callstack by returning early with an error code prior to amdgpu_device_init_schedulers.
>>>>
>>>> Regards,
>>>> Guchun
>>>>
>>>> -----Original Message-----
>>>> From: Chen, Guchun
>>>> Sent: Tuesday, January 31, 2023 2:37 PM
>>>> To: Alex Deucher <alexdeucher@gmail.com>; Guilherme G. Piccoli
>>>> <gpiccoli@igalia.com>
>>>> Cc: amd-gfx@lists.freedesktop.org; kernel@gpiccoli.net; Pan, Xinhui
>>>> <Xinhui.Pan@amd.com>; dri-devel@lists.freedesktop.org; Tuikov, Luben
>>>> <Luben.Tuikov@amd.com>; Limonciello, Mario
>>>> <Mario.Limonciello@amd.com>; kernel-dev@igalia.com; Deucher, Alexander
>>>> <Alexander.Deucher@amd.com>; Koenig, Christian
>>>> <Christian.Koenig@amd.com>
>>>> Subject: RE: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching
>>>> drm_sched init/fini
>>>>
>>>> Hi Piccoli,
>>>>
>>>> I agree with Alex's point, using ring->sched.name for such check is not a good way. BTW, can you please attach a full dmesg long in bad case to help me understand more?
>>>>
>>>> Regards,
>>>> Guchun
>>>>
>>>> -----Original Message-----
>>>> From: Alex Deucher <alexdeucher@gmail.com>
>>>> Sent: Tuesday, January 31, 2023 6:30 AM
>>>> To: Guilherme G. Piccoli <gpiccoli@igalia.com>
>>>> Cc: amd-gfx@lists.freedesktop.org; kernel@gpiccoli.net; Chen, Guchun
>>>> <Guchun.Chen@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
>>>> dri-devel@lists.freedesktop.org; Tuikov, Luben <Luben.Tuikov@amd.com>;
>>>> Limonciello, Mario <Mario.Limonciello@amd.com>; kernel-dev@igalia.com;
>>>> Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>>>> <Christian.Koenig@amd.com>
>>>> Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching
>>>> drm_sched init/fini
>>>>
>>>> On Mon, Jan 30, 2023 at 4:51 PM Guilherme G. Piccoli <gpiccoli@igalia.com> wrote:
>>>>> + Luben
>>>>>
>>>>> (sorry, missed that in the first submission).
>>>>>
>>>>> On 30/01/2023 18:45, Guilherme G. Piccoli wrote:
>>>>>> Currently amdgpu calls drm_sched_fini() from the fence driver sw
>>>>>> fini routine - such function is expected to be called only after the
>>>>>> respective init function - drm_sched_init() - was executed successfully.
>>>>>>
>>>>>> Happens that we faced a driver probe failure in the Steam Deck
>>>>>> recently, and the function drm_sched_fini() was called even without
>>>>>> its counter-part had been previously called, causing the following oops:
>>>>>>
>>>>>> amdgpu: probe of 0000:04:00.0 failed with error -110
>>>>>> BUG: kernel NULL pointer dereference, address: 0000000000000090 PGD
>>>>>> 0 P4D 0
>>>>>> Oops: 0002 [#1] PREEMPT SMP NOPTI
>>>>>> CPU: 0 PID: 609 Comm: systemd-udevd Not tainted 6.2.0-rc3-gpiccoli
>>>>>> #338 Hardware name: Valve Jupiter/Jupiter, BIOS F7A0113 11/04/2022
>>>>>> RIP: 0010:drm_sched_fini+0x84/0xa0 [gpu_sched] [...] Call Trace:
>>>>>>     <TASK>
>>>>>>     amdgpu_fence_driver_sw_fini+0xc8/0xd0 [amdgpu]
>>>>>>     amdgpu_device_fini_sw+0x2b/0x3b0 [amdgpu]
>>>>>>     amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
>>>>>>     devm_drm_dev_init_release+0x49/0x70
>>>>>>     [...]
>>>>>>
>>>>>> To prevent that, check if the drm_sched was properly initialized for
>>>>>> a given ring before calling its fini counter-part.
>>>>>>
>>>>>> Notice ideally we'd use sched.ready for that; such field is set as
>>>>>> the latest thing on drm_sched_init(). But amdgpu seems to "override"
>>>>>> the meaning of such field - in the above oops for example, it was a
>>>>>> GFX ring causing the crash, and the sched.ready field was set to
>>>>>> true in the ring init routine, regardless of the state of the DRM scheduler. Hence, we ended-up using another sched field.
>>>>>>>> Fixes: 067f44c8b459 ("drm/amdgpu: avoid over-handle of fence
>>>>>>>> driver fini in s3 test (v2)")
>>>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>> Cc: Guchun Chen <guchun.chen@amd.com>
>>>>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>>>>>> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
>>>>>> ---
>>>>>>
>>>>>>
>>>>>> Hi folks, first of all thanks in advance for reviews / comments!
>>>>>> Notice that I've used the Fixes tag more in the sense to bring it to
>>>>>> stable, I didn't find a good patch candidate that added the call to
>>>>>> drm_sched_fini(), was reaching way too old commits...so
>>>>>> 067f44c8b459 seems a good candidate - or maybe not?
>>>>>>
>>>>>> Now, with regards sched.ready, spent a bit of time to figure what
>>>>>> was happening...would be feasible maybe to stop using that to mark
>>>>>> some kind ring status? I think it should be possible to add a flag
>>>>>> to the ring structure for that, and free sched.ready from being
>>>>>> manipulate by the amdgpu driver, what's your thoughts on that?
>>>> It's been a while, but IIRC, we used to have a ring->ready field in the driver which at some point got migrated out of the driver into the GPU scheduler and the driver side code never got cleaned up.  I think we should probably just drop the driver messing with that field and leave it up to the drm scheduler.
>>> To use ring->ready is not a good idea since this doesn't specify if the scheduler was initialized, but rather if bringup of the engine worked.
>>>
>>> It's perfectly possible that the scheduler was initialized, but then the IB test failed later on.
>>>
>>> I strongly suggest to use scheduler->ops instead since those are set during init and mandatory for correct operation.
>>>
>>> Christian.
>>>
>>>> Alex
>>>>
>>>>
>>>>>> I could try myself, but first of course I'd like to raise the
>>>>>> "temperature" on this topic and check if somebody is already working
>>>>>> on that.
>>>>>>
>>>>>> Cheers,
>>>>>>
>>>>>> Guilherme
>>>>>>
>>>>>>
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 8 +++++++-
>>>>>>     1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>> index 00444203220d..e154eb8241fb 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>> @@ -618,7 +618,13 @@ void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev)
>>>>>>                  if (!ring || !ring->fence_drv.initialized)
>>>>>>                          continue;
>>>>>>
>>>>>> -             if (!ring->no_scheduler)
>>>>>> +             /*
>>>>>> +              * Notice we check for sched.name since there's some
>>>>>> +              * override on the meaning of sched.ready by amdgpu.
>>>>>> +              * The natural check would be sched.ready, which is
>>>>>> +              * set as drm_sched_init() finishes...
>>>>>> +              */
>>>>>> +             if (!ring->no_scheduler && ring->sched.name)
>>>>>>                          drm_sched_fini(&ring->sched);
>>>>>>
>>>>>>                  for (j = 0; j <= ring->fence_drv.num_fences_mask;
>>>>>> ++j)


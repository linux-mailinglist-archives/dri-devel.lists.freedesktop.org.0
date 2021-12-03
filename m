Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E42A467827
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 14:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45A17ABFA;
	Fri,  3 Dec 2021 13:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086437ABFA;
 Fri,  3 Dec 2021 13:24:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKJpkkYyMh6kz8viEfyaIGkhdq0YK8D9xsBuGRKTiUrU0LRDiqTvbvO0XJg7hs8o/SIoSRsr9+raIVSsnvG6eswwnifNTm5xFpKT2DDmyzeSH7qZZiB8rj0gtI54nStxxKFkNJRb8f0NXsHzJ8JjRUHxidhVFKnpevpOLu93apiq+ZrWpw8I7riRRK+m9BQa09DX9nNM4q4TI/Qc26MMlMjBlE1UgRkRlQlkc3ebSIaK1FaDDoaOwOvCxchLr6zaCw8qKwcX46b2qPwkn8JO0zmjZH1QxgqJFw3wgrhGPyIQgKSe+kLrXbh1RcYd1anoVlQSHFLas0Vy9skU9XTjVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xL4di5yyCwDT9CJ7LfbKTD1bPqU1cXfXIWjw/t4CCOI=;
 b=TFw45wy5bI2ZixxstHPwQvfw2ekhsB+HW3/gf2E7pQmq8d/eQTm4EvmhCIS8HiWI0hyNLup4gxhnACQG13WVJz5gMr9GkURM32HOPh6gkVzYkTeyAEks51EE0YBRI68CoDDngfYYUWBJjNToMEIIVyfmf8+Du/Fe8tAT/T9EUCKIVQ/Rnqpkz5bwRdKPhoRMUEMNIx5RZQcJZKqicj8a2HeJGXHcDbWWkHeNL6ZzoxjtQ/XDeBgp/Rp0Da1ja0Hcmbd4vn70oEDKsfIzPHvVUyErtw/+Z53C8QnKpoyi8p3c9lC9zBLCWohubJiTK/Urb79XNuA3G2OyZR1JaapXgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xL4di5yyCwDT9CJ7LfbKTD1bPqU1cXfXIWjw/t4CCOI=;
 b=uT5JTVbCo6964vrZC0nuVrszsTSQO7GfCmDy2m1z5BaxujKLlbJwF2ezBGsqHBUdPhBdZsgXfskiEAEN8zMWk/6Lq+lc9NKx/Q5f6ewN7gkJvG/kUyhPZCcDTegYT0/T+EEEQ7B4JOPTDTGsCckoD4/AZNkIogg3ZmXiL20CEYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB2510.namprd12.prod.outlook.com
 (2603:10b6:300:e8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:08:27 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 13:08:27 +0000
Subject: Re: [Linaro-mm-sig] [RFC PATCH 1/2] dma-fence: Avoid establishing a
 locking order between fence classes
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211130121936.586031-1-thomas.hellstrom@linux.intel.com>
 <c7502701-e85c-39f0-c249-702d029faa9e@linux.intel.com>
 <b440cfbc-2b9a-1aa2-76d6-17337f835777@linux.intel.com>
 <52a7cf8c-59c7-fec0-2274-d19bdc505314@amd.com>
 <57df8b0b-1d65-155f-a9a6-8073bbd4f28f@linux.intel.com>
 <2551da4d-2e51-cc24-7d4a-84ae00a1547c@amd.com>
 <29d096c91d720fbe5d410124580a02b663155b56.camel@linux.intel.com>
 <250a8e47-2093-1a98-3859-0204ec4e60e6@amd.com>
 <712b54fa1c09ae5cc1d75739ad8a7286f1dae8db.camel@linux.intel.com>
 <49cf2d43-9a8a-7738-0889-7e16b0256249@linux.intel.com>
 <193e36bd-ba64-1358-8178-73ee3afc3c41@amd.com>
 <c9109ec6-4265-ba8f-238f-4c793d076825@shipmail.org>
 <d1ada94c-88d3-d34d-9c51-0d427c3aca06@amd.com>
 <7ef3db03-8ae2-d886-2c39-36f661cac9a6@shipmail.org>
 <4805074d-7039-3eaf-eb5d-5797278b7f31@amd.com>
 <94435e0e-01db-5ae4-e424-64f73a09199f@shipmail.org>
 <a4df4d5f-ea74-8725-aca9-d0edae986e5c@amd.com>
 <fb9f50e2-aeba-6138-0cc0-aed252dc876d@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8a7dbf22-727d-c1ec-1d3f-75e23394fee8@amd.com>
Date: Fri, 3 Dec 2021 14:08:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <fb9f50e2-aeba-6138-0cc0-aed252dc876d@shipmail.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6P193CA0037.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::14) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:4e4f:2719:8872:ca0c]
 (2a02:908:1252:fb60:4e4f:2719:8872:ca0c) by
 AM6P193CA0037.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.14 via Frontend Transport; Fri, 3 Dec 2021 13:08:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcd21605-f3b9-4b7d-3b52-08d9b65dfe72
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2510:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2510E78D697D49C44D57FEBA836A9@MWHPR1201MB2510.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W2b+uckDgjejB2nzJxJxPT9Dk6FE/AL41zmgVaXWvi5i3L47hn90xBdbTxBfDCHyaKpBqRcfWM27nVFTzvMbuqg+RFZvA7DO5Nub5k+vl11nEqDm3D+z4CpKm6drJtVXLeV0JaHkHiEnJTE36o3xwc76O4AKPAKiaeo3OCFqVbOT6W2N0vv8mN4YOnO9NqrZ+g77kysYA1XphDxMjIEA8QYo3SVfrai8mE7BSvcb2Hosrbz0Op8f8CNobZvRkeCHpUeNFZLOVrR5l/QzrZb388QE0pcZ47GrzbOlxFWwwHfmlt8SrNrtTd1DHCKaQXLT/Ugrsj8AtZ+ldzgT3e+lz7fQFbCaaw5c1PR0B3MIKgHDEG1J/TrZAJIG6JVHUjAgDxSrojMexJl9FDzPUksruhIA8Fl30XupmhXY9YfeFm5bN53OJUasXUPeDgvJQ/iEG2urRTTu6amipVqcZVUbRmzy39Q1N7w+GvMwzjsrVxib9jhkeqW3ZNLSWRUEkFuUnE6N8E+pPoVpo/BzFLuMY8g0eUpju19t8AUjV4w3RV9z2h5X/qplT5t3ZZM/CtyBA4jEm45zI01toa2r9eJZ3/LMVll2CcMZm3ojQpLCrbX+26Xcwt1aKAS+QtHAwEoSNi/1g7RCe4V1AQocs+KetskIpxgH9cuwujYQvqfMqXjPpnlsHLRnEW9R3GqvQ9Tcyv+P0bQoLRcqpu+hduV3MmyZStHDfIF/zXs1L0E6NZ8w5K+nlAMXtYpZIvHtt/2d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(31686004)(5660300002)(86362001)(2906002)(508600001)(110136005)(316002)(66574015)(66476007)(38100700002)(31696002)(66556008)(36756003)(8676002)(8936002)(6486002)(2616005)(4326008)(53546011)(186003)(6666004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm9iSVdpelR5U29NRnhhNXNFd0o1ZmxGVDJXSlVGZ0JlcVp3TUNCNEs3SE1Y?=
 =?utf-8?B?OVFjekY0NCswMzJTS1k5WXlFQ1N0Z2VlRzI1YWdCLzlyekdRTGkwV1BueU11?=
 =?utf-8?B?M0JSdDhLWmxjRHZ6QmhvbHR2QmxaSkUxRkRENVdBaXQwQzYwVUlsOW1CRW44?=
 =?utf-8?B?YmVWMk5UYlphaFM2TVY0WU81K3l5elk5ajVwdis2NnBINS84NFdvbk9sRkxP?=
 =?utf-8?B?TU1vdjVsdDJ4a1RBSjk1bXk3d1FBSEx0NzRqWGVncXl6SkJxczlpbTdoeTlq?=
 =?utf-8?B?QWhuWnhzdkdyNUdIRGxjTFRoUm1yMkkzZC8zVXpKK3M5UUwwelZaZG53cFdB?=
 =?utf-8?B?Mm81ekNFeWtwc2J3QktYaUU4cXFVczFYdVBYWVJpaTlqSXlVM0pmakdkWGJq?=
 =?utf-8?B?ekVIVDRhY1Y2aHBVYlRrNVlDMEVkSUNuWFM4QVNuclU3aW9DdHY5WG8vcUhr?=
 =?utf-8?B?Wm5hWlc2SVFCMjZteE5peEFzSkxBQTAwVkJoc1JBMHY0TzhZcEtwMnVoTHgr?=
 =?utf-8?B?MmE4aVVrOVVjeGR3ZUZ0WW8vdkQ2ZUNENytZZVNBa1luQUlPdXd3Kzgzc3Rw?=
 =?utf-8?B?eVZIdDlZckVyN2FnYkdqUHJPSDhkV3NPV2E3aG1pQXFQZ3AxNWo1WWJCTFc4?=
 =?utf-8?B?N0pGVXRiVUV3SUlsaFFvMWlYcEtkUDg1M2dHQ0hkdVNYOW1zRnJaNmd4cEV5?=
 =?utf-8?B?Z3Zua1d2emNaTHVDTWNEcDBMQk0wcG5ham9hN09zWTc0RzB4cUF1TXhaeGdF?=
 =?utf-8?B?TnJ3REptVmJZY01BaC8wUWdzczNrUm0yUVg4cDcvYlBQOVF6ajNPbGZiNmdj?=
 =?utf-8?B?Y2M4eTVSQlRWUGhYWkVVNU43MHkwemZIelBZS0RjNDB4eGxuSmpjay9UN2kz?=
 =?utf-8?B?WXBSS2todmlxY1EwTUVhTG5haHd4YVQ3OTJqeFkrcEpqVnZybEw1dmtkRnAv?=
 =?utf-8?B?NW9HajhaR2JKT0FUT3pKZ2kwbjNjNDUrS0dQNS9mK2JWWEFOd0RSM1lnZzQ4?=
 =?utf-8?B?UU1MdzRXWWtDQlJiNFRaL0I2Tm1FUnpyRWorYUlwZ3N4WHl4Tkt1Vkk0NW43?=
 =?utf-8?B?Y3J2VXQ4TVk0bUNVWjdsaTRwdXpPYmk3M1hiVkx6ME1iQ2x1QUp3ckIzUXV0?=
 =?utf-8?B?K3RxbTNpeTE1SDYzQVpBbnVWcjBvZUM4NmhreWtYVEx4ZlBXZ2lsdmxGMnU4?=
 =?utf-8?B?NFZIYk52OVU3M0ZtdEtFNmdkMHJDQ05oTFhjRmZKR2tybXpKc3JWeUdFeElM?=
 =?utf-8?B?OUl3Z215NTVFQlJSb3J6MVpFaDl5V3dWaGZkZDE4RHRnZUlTWjFIREpHMlMy?=
 =?utf-8?B?d2dTM3duVC9LMjEyZmxXK1gzS1hEQmRzRnVPRUFidG9PV2liRExQNG1pOEMw?=
 =?utf-8?B?Z1RjVzlYRnp1dSttN1FYVEZ1TFc0S01QbXUxcWhMNk9tODdnMFNoanZlenQz?=
 =?utf-8?B?YmZrdkdmdU8rSzVzVExUVTZkVUUzRVhZVkNDQnUwYzVMaGdkUXVtYk5pZGda?=
 =?utf-8?B?RGVnaWZDSDk1aW5zaW5ZbXhZNnVXZE53N3JMajF3RThtTVhJakZXeWlKT3lS?=
 =?utf-8?B?cGNzazNMQkIyUlpXVjZjY0lmRjBKZGhpUmhHclVVY253RlZ2aXVaU1VEakVL?=
 =?utf-8?B?ZkZVZ05WRDM5ZUo3N1hOQjhLNE9kdUpYeitPRkJ0QndYSWZuNkhFZlA4eWZp?=
 =?utf-8?B?a29xbEQxMTFSRTBhc0U0aTZiaTQ0TXlxSStZelZ4NDNtcy80S3BvV2lLcXNF?=
 =?utf-8?B?SWpSeU9HdDZJS2laQklKS3g1MlNsV21xVGo2cVlEaDBCMkQ4VHJYbG9STGJ1?=
 =?utf-8?B?cXQzT3lYVG5zR3ZWaDd3TzdxV0RZVEFZUnZybU9qVzdRclNEbVlSNHRMK0FC?=
 =?utf-8?B?S0EwRUZEMEt5enFyNUZBRU9ZZ3ZCaGdBN2x6NUJxZG5UTXh5TFVIZkJCSHY0?=
 =?utf-8?B?dEI0RzNVRS8rZkIrREM1NGZSZXRMaUw2c25XTmJLazVic1Yxby9mVktaam5O?=
 =?utf-8?B?d1VwUy8wWGN6ZmNFLzJGTWFYOGpmbE1YVHlIRTBRem9KeklUc1VyWGQxMG8y?=
 =?utf-8?B?TXhEanBRYkhyTU95TXI2RnNlWUJuN0hFbVNHWXRIeW42QzI2RUR0SGJyUlpD?=
 =?utf-8?B?Zkt6ZVRxU3VFaldOcHMzMjlWV0ZIY1l0SlhubmxRRmNBOUI5a2llOTFXdFVv?=
 =?utf-8?Q?5zmk2eSvbDXY5uvpMYF6gkY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd21605-f3b9-4b7d-3b52-08d9b65dfe72
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:26.9047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8nCTu/Q2Ya9OPAu2bsnlAfyhhD9JyMUwJM+x5f60o/lurf963jU1Ucn1o9ffoGl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2510
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
Cc: linaro-mm-sig@lists.linaro.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.12.21 um 13:16 schrieb Thomas Hellström (Intel):
>
> On 12/1/21 12:25, Christian König wrote:
>> Am 01.12.21 um 12:04 schrieb Thomas Hellström (Intel):
>>>
>>> On 12/1/21 11:32, Christian König wrote:
>>>> Am 01.12.21 um 11:15 schrieb Thomas Hellström (Intel):
>>>>> [SNIP]
>>>>>>
>>>>>> What we could do is to avoid all this by not calling the callback 
>>>>>> with the lock held in the first place.
>>>>>
>>>>> If that's possible that might be a good idea, pls also see below.
>>>>
>>>> The problem with that is 
>>>> dma_fence_signal_locked()/dma_fence_signal_timestamp_locked(). If 
>>>> we could avoid using that or at least allow it to drop the lock 
>>>> then we could call the callback without holding it.
>>>>
>>>> Somebody would need to audit the drivers and see if holding the 
>>>> lock is really necessary anywhere.
>>>>
>>>>>>
>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> /Thomas
>>>>>>>>>
>>>>>>>>> Oh, and a follow up question:
>>>>>>>>>
>>>>>>>>> If there was a way to break the recursion on final put() 
>>>>>>>>> (using the same basic approach as patch 2 in this series uses 
>>>>>>>>> to break recursion in enable_signaling()), so that none of 
>>>>>>>>> these containers did require any special treatment, would it 
>>>>>>>>> be worth pursuing? I guess it might be possible by having the 
>>>>>>>>> callbacks drop the references rather than the loop in the 
>>>>>>>>> final put. + a couple of changes in code iterating over the 
>>>>>>>>> fence pointers.
>>>>>>>>
>>>>>>>> That won't really help, you just move the recursion from the 
>>>>>>>> final put into the callback.
>>>>>>>
>>>>>>> How do we recurse from the callback? The introduced fence_put() 
>>>>>>> of individual fence pointers
>>>>>>> doesn't recurse anymore (at most 1 level), and any callback 
>>>>>>> recursion is broken by the irq_work?
>>>>>>
>>>>>> Yeah, but then you would need to take another lock to avoid 
>>>>>> racing with dma_fence_array_signaled().
>>>>>>
>>>>>>>
>>>>>>> I figure the big amount of work would be to adjust code that 
>>>>>>> iterates over the individual fence pointers to recognize that 
>>>>>>> they are rcu protected.
>>>>>>
>>>>>> Could be that we could solve this with RCU, but that sounds like 
>>>>>> a lot of churn for no gain at all.
>>>>>>
>>>>>> In other words even with the problems solved I think it would be 
>>>>>> a really bad idea to allow chaining of dma_fence_array objects.
>>>>>
>>>>> Yes, that was really the question, Is it worth pursuing this? I'm 
>>>>> not really suggesting we should allow this as an intentional 
>>>>> feature. I'm worried, however, that if we allow these containers 
>>>>> to start floating around cross-driver (or even internally) 
>>>>> disguised as ordinary dma_fences, they would require a lot of 
>>>>> driver special casing, or else completely unexpeced WARN_ON()s and 
>>>>> lockdep splats would start to turn up, scaring people off from 
>>>>> using them. And that would be a breeding ground for hairy 
>>>>> driver-private constructs.
>>>>
>>>> Well the question is why we would want to do it?
>>>>
>>>> If it's to avoid inter driver lock dependencies by avoiding to call 
>>>> the callback with the spinlock held, then yes please. We had tons 
>>>> of problems with that, resulting in irq_work and work_item 
>>>> delegation all over the place.
>>>
>>> Yes, that sounds like something desirable, but in these containers, 
>>> what's causing the lock dependencies is the enable_signaling() 
>>> callback that is typically called locked.
>>>
>>>
>>>>
>>>> If it's to allow nesting of dma_fence_array instances, then it's 
>>>> most likely a really bad idea even if we fix all the locking order 
>>>> problems.
>>>
>>> Well I think my use-case where I hit a dead end may illustrate what 
>>> worries me here:
>>>
>>> 1) We use a dma-fence-array to coalesce all dependencies for ttm 
>>> object migration.
>>> 2) We use a dma-fence-chain to order the resulting dm_fence into a 
>>> timeline because the TTM resource manager code requires that.
>>>
>>> Initially seemingly harmless to me.
>>>
>>> But after a sequence evict->alloc->clear, the dma-fence-chain feeds 
>>> into the dma-fence-array for the clearing operation. Code still 
>>> works fine, and no deep recursion, no warnings. But if I were to add 
>>> another driver to the system that instead feeds a dma-fence-array 
>>> into a dma-fence-chain, this would give me a lockdep splat.
>>>
>>> So then if somebody were to come up with the splendid idea of using 
>>> a dma-fence-chain to initially coalesce fences, I'd hit the same 
>>> problem or risk illegaly joining two dma-fence-chains together.
>>>
>>> To fix this, I would need to look at the incoming fences and iterate 
>>> over any dma-fence-array or dma-fence-chain that is fed into the 
>>> dma-fence-array to flatten out the input. In fact all 
>>> dma-fence-array users would need to do that, and even 
>>> dma-fence-chain users watching out for not joining chains together 
>>> or accidently add an array that perhaps came as a disguised 
>>> dma-fence from antother driver.
>>>
>>> So the purpose to me would be to allow these containers as input to 
>>> eachother without a lot of in-driver special-casing, be it by 
>>> breaking recursion on built-in flattening to avoid
>>>
>>> a) Hitting issues in the future or with existing interoperating 
>>> drivers.
>>> b) Avoid driver-private containers that also might break the 
>>> interoperability. (For example the i915 currently driver-private 
>>> dma_fence_work avoid all these problems, but we're attempting to 
>>> address issues in common code rather than re-inventing stuff 
>>> internally).
>>
>> I don't think that a dma_fence_array or dma_fence_chain is the right 
>> thing to begin with in those use cases.
>>
>> When you want to coalesce the dependencies for a job you could either 
>> use an xarray like Daniel did for the scheduler or some hashtable 
>> like we use in amdgpu. But I don't see the need for exposing the 
>> dma_fence interface for those.
>
> This is because the interface to our migration code takes just a 
> single dma-fence as dependency. Now this is of course something we 
> need to look at to mitigate this, but see below.

Yeah, that's actually fine.

>>
>> And why do you use dma_fence_chain to generate a timeline for TTM? 
>> That should come naturally because all the moves must be ordered.
>
> Oh, in this case because we're looking at adding stuff at the end of 
> migration (like coalescing object shared fences and / or async unbind 
> fences), which may not complete in order.

Well that's ok as well. My question is why does this single dma_fence 
then shows up in the dma_fence_chain representing the whole migration?

That somehow doesn't seem to make sense because each individual step of 
the migration needs to wait for those dependencies as well even when it 
runs in parallel.

> But that's not really the point, the point was that an (at least to 
> me) seemingly harmless usage pattern, be it real or fictious, ends up 
> giving you severe internal- or cross-driver headaches.

Yeah, we probably should document that better. But in general I don't 
see much reason to allow mixing containers. The dma_fence_array and 
dma_fence_chain objects have some distinct use cases and and using them 
to build up larger dependency structures sounds really questionable.

Christian.

>
> /Thomas
>
>
>>
>> Regards,
>> Christian.
>>
>>


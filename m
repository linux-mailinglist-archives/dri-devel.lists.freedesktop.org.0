Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E31C3BF67C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 09:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7E66E881;
	Thu,  8 Jul 2021 07:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0709F6E880;
 Thu,  8 Jul 2021 07:53:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDYXaA5qAcedc/U32T7XG55JEI+hSKBwIZp7hTvBRhtIqm3bF9h4inc6enxblLxTb7U+CkFeUD4K1cgchQndsMgW+FQfrYoL1rhqzuyiZv/krFeDT6h8mD3W42Tf0iDiEQcLyOcoYSpAgjCqKjjEQBNsnYX2V58uCyIrUTPSbbZG/PDV0/V9Il0iyk1m4tJJReai8fWR/GIivIa/Q3H/YST0UZYS5ik+Rody5Q7NltJpAiVBn8m8h47BK75HZSLd+noXwuBdfyRQcH3M3dTa5txrFz9+H1hWzLp7tic7Ae0Krr0ZGifXErCHoTC45WerxHa0oddXRfNonLQDm3zixg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hiikQgSPjcjtjL8L3ZFZjCvzioaY7tZWI3JoJlSgrg=;
 b=X2R7dzuW3myrhfvmbJcKJgGOfadkzHxp6wikkPv7OxtPCEQwz8c1AKleurKLd98SdKaJDyOgGrX2XjxFCPl18fEectBPf2O+px5WA2VBmnpqyzBBqYSCR7rzzw9gtkhogFYM+BvBzTkZgLh13WNTXwaF3Dyp6/bQbukkiAy2GuU1dSrEEs2tyjLzjveiPhk4ix9TS2XLmMq0CAw8WAIs8kMe2u3eRjzRifIxIVBTb7sJZLXrdh6eTbKcdUlt6ktX0CMST2gTl6fhfvfe6boGF8yIztf1blN3otteX1zQuF4cYkvH3nEDHInlFd+9Jo9lLuNg0bG4osr26z3WAcxDmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hiikQgSPjcjtjL8L3ZFZjCvzioaY7tZWI3JoJlSgrg=;
 b=uj+OsPQJSfmCJcSnGDgmDg+em/y0mHiVzyPRWRzxP7Nz6KZpZhUO/glpwMFi4/RXlwDxVcXUK05In3kKHs9xMDdvcX8q5xFm4SaY42eKAdkT9BC+bocFG+dYp2CWOjzqOLNjg/G4MsRFlvrwHg612kHc1/l8H/P4OEyxfepD0g0=
Authentication-Results: anholt.net; dkim=none (message not signed)
 header.d=none;anholt.net; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4913.namprd12.prod.outlook.com (2603:10b6:208:1c7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Thu, 8 Jul
 2021 07:53:09 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 07:53:09 +0000
Subject: Re: [PATCH v2 01/11] drm/sched: Split drm_sched_job_init
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
 <20210702213815.2249499-2-daniel.vetter@ffwll.ch>
 <a5c5647e-e0ce-cc6d-c473-685679739051@amd.com>
 <CAKMK7uGTSe9FZCup=6D2G3MWGuxoUiV3Qjau-pQyaqOAX8OTug@mail.gmail.com>
 <8387b5f8-a5f6-fc2d-48e6-4bb0768ac642@amd.com>
 <CAKMK7uFu7V0QzsbMGPJPnMjXOB7FrKB_d+oDwkFMVaEvgy5EOQ@mail.gmail.com>
 <7933a995-0c95-9339-5385-a24681f6df3a@amd.com>
 <CAKMK7uE3bd2whKVBA4uWmzKBp7fjcVKexVFc=TB+ZRxdYT7VNg@mail.gmail.com>
 <b4824514-4ffd-a5f0-9bbc-d89cdd4e7b50@amd.com>
 <CAKMK7uF7E4G9D_W+YRV_ZrJLtUFXqWZfN78VdrVC=byMux78LQ@mail.gmail.com>
 <CAKMK7uEwFUq2KnSjk0YgdbKKvhh2ifsyURO0E5RzzhWzzMtovQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4369ee92-7eba-3faa-4d9c-08901d3506aa@amd.com>
Date: Thu, 8 Jul 2021 09:53:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAKMK7uEwFUq2KnSjk0YgdbKKvhh2ifsyURO0E5RzzhWzzMtovQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0117.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:bc19:c1e3:6307:7e3e]
 (2a02:908:1252:fb60:bc19:c1e3:6307:7e3e) by
 AM0PR06CA0117.eurprd06.prod.outlook.com (2603:10a6:208:ab::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Thu, 8 Jul 2021 07:53:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d34cb56c-1cb8-4bcb-0327-08d941e56d31
X-MS-TrafficTypeDiagnostic: BL0PR12MB4913:
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4913D54E14549A59469B745383199@BL0PR12MB4913.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YutqUmP3VOOU9LdiUHd5WdJ7PNXMjVKonGM/hBsqCmSMsJ3l9ws7VjFPifE4vW777+UekO2TMUN5TviplZB8f200Vy+Ss4ZzVr7FII6IX4mh0MqnbGrPiJuABsUocmH0CkwuCVsp7FDTyKLcqH7dK2uqJMnLYo5rkpsIlVkjIhOinK1k2nFD1hLz0VNm022hcCT6VnjLlRHS0xoOBeCq5OKC5eoINZ8hJlNgtBIF6pqwjwUNPNn5ugt+ntJunGZt5ERc7REnh9TO7mL3Z7mrek1chumT4erGd0jujc1MSrP5mPTfq7z1qzkS7laXbfE6WWkcj2oSmw7m2L+fvLlv2CQCb1ux+H9kRIhpthCp4hGhoEJGTxuNlx1txFVe3Oy8sVjWBce5UoXaKMEa+2hPUoPX8HdFXILZq/0ZywspWH3l6/vAMzFPtgJa02tV9And43OrP8hnXOc427BfWD2bCSr5eUgshJeGA2/OHSpZDUI1zt3ReYgdsJkBczjZKXKnE4ZwmBJrl5YNkMFVb47HnPxz3cTzrulPjQsRqz7UZknlF0dKRW8znAuqh8as/k/Nrm9inXRNv/1ksvtjw4mumNzuJvUR1eDth1h+4saMMpLB2xDm1aJ79xeNsmcGg+PlFtmSUXdu97FWk6Zs0NaRCBkZZhf9dDz//75gSmEuNn6eJXN5s6s/Q+n1fUBY4yL2HzVVybzq/1Pp+Q7b/53HQP/Q9Flkt2SVoi0TgAL+dkjp0voa3T4HVgfVhbc1U6FGPWLI6w9x/bPNB3zfKkQwI8RscSzTu/659LieFalYI0aifmDMv3vNIYVIrh4sx2BM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(316002)(966005)(54906003)(186003)(45080400002)(38100700002)(7406005)(6486002)(478600001)(7416002)(31696002)(66476007)(2616005)(66556008)(2906002)(66946007)(6916009)(5660300002)(8936002)(86362001)(53546011)(4326008)(30864003)(8676002)(31686004)(36756003)(66574015)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEw5SjNwVXJhQ1AwZUozYittY3ppVzNCOGxPbys5SmZlb0NrMGhRbUpFU3Fx?=
 =?utf-8?B?SDVLV3ZycVVDMjlQWDIyd3RsRXhOa2doWnVZdVg3ajZwMEpQUFgrWFY0UDVN?=
 =?utf-8?B?czdnM3lMRWhlVk9POTlsTVNsWWlhVVdTTTNsS2hOTy9VaHRueHU4dE96d0x1?=
 =?utf-8?B?U1ROaGtBalpidStJM2FHeFNEOTI1Nm5vZTZYUjlrSDlVVlJ6QVZRZ1pINFp1?=
 =?utf-8?B?WXdQM2JHdUtmQUM2UEJJaGZXazI4MmlaVDltSFkzSFRaS3E2c0RDTjN0WDNJ?=
 =?utf-8?B?VEhYWFcvWlBxMWJlaGdXbEVmRTUyNXEvaHcxZ1ZCa2FaMUErUFVqTGtZcGF5?=
 =?utf-8?B?Qm1PSW1hNFU4eW11TVNEMkNMQ0ZBK3MrcGtMNDYzUGdJUUxSbWRvZGgwOElU?=
 =?utf-8?B?TDBGUW9MRGNpUXpReTRoUkt2VVY3NUUxUVI3RlRHa3RvMHlSQ1hwOVhpOXFD?=
 =?utf-8?B?U1lyTVpDZDI0dGU2eFRvbGlBK1NvRVYrUStNU3ZuTUpkVzB4clczUXZnQ3Zx?=
 =?utf-8?B?QWtwUTFPUmZIMmQ4RDN6TFpJVTFpd2lHYTBDb3NvaWRKdGdZNTR0d1NJcUNu?=
 =?utf-8?B?bzdnbXNncFFVR2Z0KzV6VmxTakJSVVlxWHErMVZMTWR2d0xVZEcxcVNxdVIz?=
 =?utf-8?B?eDlvN0VTM2JwK0gyaDdKSmxJQ3F2UWozUHR6VStRVWJyTVNYZEVuMG9MSk0v?=
 =?utf-8?B?OTZwVE12VXdHVFYwM0M1SFBkcDE5QjcyR2k4Zlp3RVF1Q2lsa0NNYzFpMnlK?=
 =?utf-8?B?K3djT2diRmhrU3huUTNCVFM2MHB2SU1FY1dEQ3ZwY2UrYldMSGFnMHNiY21v?=
 =?utf-8?B?VzFjc1Z0bCtZdW80WDdGMnhWYkh4QXJHbTQyTTdsR21SY2VET2ZYbVBpRWhu?=
 =?utf-8?B?d29tR2wySE5FaDNrbDhvNEtScDNJemE5aFZhcXJoSTlGNEcwbDkxUERnZW5w?=
 =?utf-8?B?UlYrN09ZRHBjcDExVzgwZno4bGNLWEk4WkszMFQwRU95WFRleW9JVW54OHRU?=
 =?utf-8?B?bE56ajRURnVudnU4dFRGUnJIWHFzaE9aOUtOZjhLOURHZmhBYXpqN3hLejNB?=
 =?utf-8?B?ZjJSYVNOYlRKR2FNREhVOXlCaFVoR2xmZTNqL2c0RUpRRmpYOHFJdkdTT0U3?=
 =?utf-8?B?ZmpnQ0lmUTNJbzZuUDdGS0NJcVJHbmVjVkt0SWN6V2pBWEE1cWpzRElVS0Na?=
 =?utf-8?B?cnRDWmp4ZnFJVy9tYmRsVS9MNS9vYSthc1NhSFhMemZjN2t6Q2N5alZwL1BU?=
 =?utf-8?B?dWpoaGg2R2tSZXRBWTBuTFQwY3NoSGhqWmFscnFpcW9TZCtDN1F6N0lsTlhS?=
 =?utf-8?B?L1BaR2VrdDhOUm5JRSsrWTJ3Z0lIY1VzMWxyU0kvZjVZTVc5dUhVU2F3OCti?=
 =?utf-8?B?bldEL1BQL25NcmoyMi9iYmdjdEhYcHNvekhWdHdrUXpuenRTb3hxQ2dFL2ZO?=
 =?utf-8?B?NkxEUTFJK2pHLzVTWlpORHdxOGdma0xZajRDcm9hUHhPMHFDRFNjblpFZUJy?=
 =?utf-8?B?TTB3T0VQMDM1N3lya3pTQVBiMzZlNFZKaXlBYitpck0wNEszcHl4c0I0RllZ?=
 =?utf-8?B?amxTUXZXeWd6dVdnbkNEaXRDVFlOdEhXdmpzcnEvNlBEMUczQjQ1T0ZnNVBS?=
 =?utf-8?B?eEhxR0o3bmtlZjIydkFEY3RMVnY4aERnSHBDN1ZVUWNwM0pEMGlpdlkrVEhx?=
 =?utf-8?B?YlI0NE5xemlsMDlGNXBJQjVrajcwMGR6NnlqMVE3SHdMTXcrZW5XYXRiVXhQ?=
 =?utf-8?B?SENZUGREWHRLbXhBUXJrL091QTEyVTkrTHJKN2NncWlBc3lhbU1NWlpGbUpY?=
 =?utf-8?B?MnRyc1EwM252aUZjb2hKaVJXNHhaWm96bGJqL3JlNVhiZlNaRzcrdnFqYzI4?=
 =?utf-8?Q?k7NgWbAczYxHV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34cb56c-1cb8-4bcb-0327-08d941e56d31
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 07:53:08.8778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmlW14k6bjczmioIsxZYdeKv+KID3cRK/frBHUmJcVRJXxLFnCRy7guYFfiFO6eM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4913
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
Cc: Emma Anholt <emma@anholt.net>, Adam Borowski <kilobyte@angband.pl>,
 David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sonny Jiang <sonny.jiang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Jack Zhang <Jack.Zhang1@amd.com>, lima@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Steven Price <steven.price@arm.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Nick Terrell <terrelln@fb.com>, Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.07.21 um 09:19 schrieb Daniel Vetter:
> On Thu, Jul 8, 2021 at 9:09 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>> On Thu, Jul 8, 2021 at 8:56 AM Christian König <christian.koenig@amd.com> wrote:
>>> Am 07.07.21 um 18:32 schrieb Daniel Vetter:
>>>> On Wed, Jul 7, 2021 at 2:58 PM Christian König <christian.koenig@amd.com> wrote:
>>>>> Am 07.07.21 um 14:13 schrieb Daniel Vetter:
>>>>>> On Wed, Jul 7, 2021 at 1:57 PM Christian König <christian.koenig@amd.com> wrote:
>>>>>>> Am 07.07.21 um 13:14 schrieb Daniel Vetter:
>>>>>>>> On Wed, Jul 7, 2021 at 11:30 AM Christian König
>>>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>>>> Am 02.07.21 um 23:38 schrieb Daniel Vetter:
>>>>>>>>>> This is a very confusingly named function, because not just does it
>>>>>>>>>> init an object, it arms it and provides a point of no return for
>>>>>>>>>> pushing a job into the scheduler. It would be nice if that's a bit
>>>>>>>>>> clearer in the interface.
>>>>>>>>>>
>>>>>>>>>> But the real reason is that I want to push the dependency tracking
>>>>>>>>>> helpers into the scheduler code, and that means drm_sched_job_init
>>>>>>>>>> must be called a lot earlier, without arming the job.
>>>>>>>>>>
>>>>>>>>>> v2:
>>>>>>>>>> - don't change .gitignore (Steven)
>>>>>>>>>> - don't forget v3d (Emma)
>>>>>>>>>>
>>>>>>>>>> v3: Emma noticed that I leak the memory allocated in
>>>>>>>>>> drm_sched_job_init if we bail out before the point of no return in
>>>>>>>>>> subsequent driver patches. To be able to fix this change
>>>>>>>>>> drm_sched_job_cleanup() so it can handle being called both before and
>>>>>>>>>> after drm_sched_job_arm().
>>>>>>>>> Thinking more about this, I'm not sure if this really works.
>>>>>>>>>
>>>>>>>>> See drm_sched_job_init() was also calling drm_sched_entity_select_rq()
>>>>>>>>> to update the entity->rq association.
>>>>>>>>>
>>>>>>>>> And that can only be done later on when we arm the fence as well.
>>>>>>>> Hm yeah, but that's a bug in the existing code I think: We already
>>>>>>>> fail to clean up if we fail to allocate the fences. So I think the
>>>>>>>> right thing to do here is to split the checks into job_init, and do
>>>>>>>> the actual arming/rq selection in job_arm? I'm not entirely sure
>>>>>>>> what's all going on there, the first check looks a bit like trying to
>>>>>>>> schedule before the entity is set up, which is a driver bug and should
>>>>>>>> have a WARN_ON?
>>>>>>> No you misunderstood me, the problem is something else.
>>>>>>>
>>>>>>> You asked previously why the call to drm_sched_job_init() was so late in
>>>>>>> the CS.
>>>>>>>
>>>>>>> The reason for this was not alone the scheduler fence init, but also the
>>>>>>> call to drm_sched_entity_select_rq().
>>>>>> Ah ok, I think I can fix that. Needs a prep patch to first make
>>>>>> drm_sched_entity_select infallible, then should be easy to do.
>>>>>>
>>>>>>>> The 2nd check around last_scheduled I have honeslty no idea what it's
>>>>>>>> even trying to do.
>>>>>>> You mean that here?
>>>>>>>
>>>>>>>             fence = READ_ONCE(entity->last_scheduled);
>>>>>>>             if (fence && !dma_fence_is_signaled(fence))
>>>>>>>                     return;
>>>>>>>
>>>>>>> This makes sure that load balancing is not moving the entity to a
>>>>>>> different scheduler while there are still jobs running from this entity
>>>>>>> on the hardware,
>>>>>> Yeah after a nap that idea crossed my mind too. But now I have locking
>>>>>> questions, afaiui the scheduler thread updates this, without taking
>>>>>> any locks - entity dequeuing is lockless. And here we read the fence
>>>>>> and then seem to yolo check whether it's signalled? What's preventing
>>>>>> a use-after-free here? There's no rcu or anything going on here at
>>>>>> all, and it's outside of the spinlock section, which starts a bit
>>>>>> further down.
>>>>> The last_scheduled fence of an entity can only change when there are
>>>>> jobs on the entities queued, and we have just ruled that out in the
>>>>> check before.
>>>> There aren't any barriers, so the cpu could easily run the two checks
>>>> the other way round. I'll ponder this and figure out where exactly we
>>>> need docs for the constraint and/or barriers to make this work as
>>>> intended. As-is I'm not seeing how it does ...
>>> spsc_queue_count() provides the necessary barrier with the atomic_read().
>> atomic_t is fully unordered, except when it's a read-modify-write
> Wasn't awake yet, I think the rule is read-modify-write and return
> previous value gives you full barrier. So stuff like cmpxchg, but also
> a few others. See atomic_t.txt under ODERING heading (yes that
> maintainer refuses to accept .rst so I can't just link you to the
> right section, it's silly). get/set and even RMW atomic ops that don't
> return anything are all fully unordered.

As far as I know that not completely correct. The rules around atomics i 
once learned are:

1. Everything which modifies something is a write barrier.
2. Everything which returns something is a read barrier.

And I know a whole bunch of use cases where this is relied upon in the 
core kernel, so I'm pretty sure that's correct.

In this case the write barrier is the atomic_dec() in spsc_queue_pop() 
and the read barrier is the aromic_read() in spsc_queue_count().

The READ_ONCE() is actually not even necessary as far as I can see.

Christian.

> -Daniel
>
>
>> atomic op, then it's a full barrier. So yeah you need more here. But
>> also since you only need a read barrier on one side, and a write
>> barrier on the other, you don't actually need a cpu barriers on x86.
>> And READ_ONCE gives you the compiler barrier on one side at least, I
>> haven't found it on the writer side yet.
>>
>>> But yes a comment would be really nice here. I had to think for a while
>>> why we don't need this as well.
>> I'm typing a patch, which after a night's sleep I realized has the
>> wrong barriers. And now I'm also typing some doc improvements for
>> drm_sched_entity and related functions.
>>
>>> Christian.
>>>
>>>> -Daniel
>>>>
>>>>> Christian.
>>>>>
>>>>>
>>>>>> -Daniel
>>>>>>
>>>>>>> Regards
>>>>>>> Christian.
>>>>>>>
>>>>>>>> -Daniel
>>>>>>>>
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>>> Also improve the kerneldoc for this.
>>>>>>>>>>
>>>>>>>>>> Acked-by: Steven Price <steven.price@arm.com> (v2)
>>>>>>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>>>>>>> Cc: Lucas Stach <l.stach@pengutronix.de>
>>>>>>>>>> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
>>>>>>>>>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
>>>>>>>>>> Cc: Qiang Yu <yuq825@gmail.com>
>>>>>>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>>>>>>> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>>>>>>>>> Cc: Steven Price <steven.price@arm.com>
>>>>>>>>>> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>>>>>>>>> Cc: David Airlie <airlied@linux.ie>
>>>>>>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>>>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>>>>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>>>>>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>>>>>>>>> Cc: Kees Cook <keescook@chromium.org>
>>>>>>>>>> Cc: Adam Borowski <kilobyte@angband.pl>
>>>>>>>>>> Cc: Nick Terrell <terrelln@fb.com>
>>>>>>>>>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>>>>>>>>> Cc: Paul Menzel <pmenzel@molgen.mpg.de>
>>>>>>>>>> Cc: Sami Tolvanen <samitolvanen@google.com>
>>>>>>>>>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>>>>>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>>>>>>> Cc: Dave Airlie <airlied@redhat.com>
>>>>>>>>>> Cc: Nirmoy Das <nirmoy.das@amd.com>
>>>>>>>>>> Cc: Deepak R Varma <mh12gx2825@gmail.com>
>>>>>>>>>> Cc: Lee Jones <lee.jones@linaro.org>
>>>>>>>>>> Cc: Kevin Wang <kevin1.wang@amd.com>
>>>>>>>>>> Cc: Chen Li <chenli@uniontech.com>
>>>>>>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>>>>>>>>> Cc: "Marek Olšák" <marek.olsak@amd.com>
>>>>>>>>>> Cc: Dennis Li <Dennis.Li@amd.com>
>>>>>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>>>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>>>> Cc: Sonny Jiang <sonny.jiang@amd.com>
>>>>>>>>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>>>>>> Cc: Tian Tao <tiantao6@hisilicon.com>
>>>>>>>>>> Cc: Jack Zhang <Jack.Zhang1@amd.com>
>>>>>>>>>> Cc: etnaviv@lists.freedesktop.org
>>>>>>>>>> Cc: lima@lists.freedesktop.org
>>>>>>>>>> Cc: linux-media@vger.kernel.org
>>>>>>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>>>>>>> Cc: Emma Anholt <emma@anholt.net>
>>>>>>>>>> ---
>>>>>>>>>>       drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
>>>>>>>>>>       drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
>>>>>>>>>>       drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
>>>>>>>>>>       drivers/gpu/drm/lima/lima_sched.c        |  2 ++
>>>>>>>>>>       drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
>>>>>>>>>>       drivers/gpu/drm/scheduler/sched_entity.c |  6 ++--
>>>>>>>>>>       drivers/gpu/drm/scheduler/sched_fence.c  | 17 +++++----
>>>>>>>>>>       drivers/gpu/drm/scheduler/sched_main.c   | 46 +++++++++++++++++++++---
>>>>>>>>>>       drivers/gpu/drm/v3d/v3d_gem.c            |  2 ++
>>>>>>>>>>       include/drm/gpu_scheduler.h              |  7 +++-
>>>>>>>>>>       10 files changed, 74 insertions(+), 14 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>>>>> index c5386d13eb4a..a4ec092af9a7 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>>>>> @@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>>>>>>>>>>           if (r)
>>>>>>>>>>                   goto error_unlock;
>>>>>>>>>>
>>>>>>>>>> +     drm_sched_job_arm(&job->base);
>>>>>>>>>> +
>>>>>>>>>>           /* No memory allocation is allowed while holding the notifier lock.
>>>>>>>>>>            * The lock is held until amdgpu_cs_submit is finished and fence is
>>>>>>>>>>            * added to BOs.
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>>>>> index d33e6d97cc89..5ddb955d2315 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>>>>> @@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
>>>>>>>>>>           if (r)
>>>>>>>>>>                   return r;
>>>>>>>>>>
>>>>>>>>>> +     drm_sched_job_arm(&job->base);
>>>>>>>>>> +
>>>>>>>>>>           *f = dma_fence_get(&job->base.s_fence->finished);
>>>>>>>>>>           amdgpu_job_free_resources(job);
>>>>>>>>>>           drm_sched_entity_push_job(&job->base, entity);
>>>>>>>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>>>>>> index feb6da1b6ceb..05f412204118 100644
>>>>>>>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>>>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>>>>>> @@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
>>>>>>>>>>           if (ret)
>>>>>>>>>>                   goto out_unlock;
>>>>>>>>>>
>>>>>>>>>> +     drm_sched_job_arm(&submit->sched_job);
>>>>>>>>>> +
>>>>>>>>>>           submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
>>>>>>>>>>           submit->out_fence_id = idr_alloc_cyclic(&submit->gpu->fence_idr,
>>>>>>>>>>                                                   submit->out_fence, 0,
>>>>>>>>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>>>>>>>>>> index dba8329937a3..38f755580507 100644
>>>>>>>>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>>>>>>>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>>>>>>>>> @@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sched_task *task,
>>>>>>>>>>                   return err;
>>>>>>>>>>           }
>>>>>>>>>>
>>>>>>>>>> +     drm_sched_job_arm(&task->base);
>>>>>>>>>> +
>>>>>>>>>>           task->num_bos = num_bos;
>>>>>>>>>>           task->vm = lima_vm_get(vm);
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>>>>>> index 71a72fb50e6b..2992dc85325f 100644
>>>>>>>>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>>>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>>>>>> @@ -288,6 +288,8 @@ int panfrost_job_push(struct panfrost_job *job)
>>>>>>>>>>                   goto unlock;
>>>>>>>>>>           }
>>>>>>>>>>
>>>>>>>>>> +     drm_sched_job_arm(&job->base);
>>>>>>>>>> +
>>>>>>>>>>           job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
>>>>>>>>>>
>>>>>>>>>>           ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>>> index 79554aa4dbb1..f7347c284886 100644
>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>>> @@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>>>>>>>>        * @sched_job: job to submit
>>>>>>>>>>        * @entity: scheduler entity
>>>>>>>>>>        *
>>>>>>>>>> - * Note: To guarantee that the order of insertion to queue matches
>>>>>>>>>> - * the job's fence sequence number this function should be
>>>>>>>>>> - * called with drm_sched_job_init under common lock.
>>>>>>>>>> + * Note: To guarantee that the order of insertion to queue matches the job's
>>>>>>>>>> + * fence sequence number this function should be called with drm_sched_job_arm()
>>>>>>>>>> + * under common lock.
>>>>>>>>>>        *
>>>>>>>>>>        * Returns 0 for success, negative error code otherwise.
>>>>>>>>>>        */
>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>>>>>>> index 69de2c76731f..c451ee9a30d7 100644
>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>>>>>>> @@ -90,7 +90,7 @@ static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>>>>>>>>>>        *
>>>>>>>>>>        * Free up the fence memory after the RCU grace period.
>>>>>>>>>>        */
>>>>>>>>>> -static void drm_sched_fence_free(struct rcu_head *rcu)
>>>>>>>>>> +void drm_sched_fence_free(struct rcu_head *rcu)
>>>>>>>>>>       {
>>>>>>>>>>           struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
>>>>>>>>>>           struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>>>>>>>>> @@ -152,11 +152,10 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>>>>>>>>>>       }
>>>>>>>>>>       EXPORT_SYMBOL(to_drm_sched_fence);
>>>>>>>>>>
>>>>>>>>>> -struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
>>>>>>>>>> -                                            void *owner)
>>>>>>>>>> +struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>>>>>>>>> +                                           void *owner)
>>>>>>>>>>       {
>>>>>>>>>>           struct drm_sched_fence *fence = NULL;
>>>>>>>>>> -     unsigned seq;
>>>>>>>>>>
>>>>>>>>>>           fence = kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
>>>>>>>>>>           if (fence == NULL)
>>>>>>>>>> @@ -166,13 +165,19 @@ struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
>>>>>>>>>>           fence->sched = entity->rq->sched;
>>>>>>>>>>           spin_lock_init(&fence->lock);
>>>>>>>>>>
>>>>>>>>>> +     return fence;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>>>>>>>> +                       struct drm_sched_entity *entity)
>>>>>>>>>> +{
>>>>>>>>>> +     unsigned seq;
>>>>>>>>>> +
>>>>>>>>>>           seq = atomic_inc_return(&entity->fence_seq);
>>>>>>>>>>           dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>>>>>>>>>>                          &fence->lock, entity->fence_context, seq);
>>>>>>>>>>           dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>>>>>>>>>>                          &fence->lock, entity->fence_context + 1, seq);
>>>>>>>>>> -
>>>>>>>>>> -     return fence;
>>>>>>>>>>       }
>>>>>>>>>>
>>>>>>>>>>       module_init(drm_sched_fence_slab_init);
>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>> index 33c414d55fab..5e84e1500c32 100644
>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>> @@ -48,9 +48,11 @@
>>>>>>>>>>       #include <linux/wait.h>
>>>>>>>>>>       #include <linux/sched.h>
>>>>>>>>>>       #include <linux/completion.h>
>>>>>>>>>> +#include <linux/dma-resv.h>
>>>>>>>>>>       #include <uapi/linux/sched/types.h>
>>>>>>>>>>
>>>>>>>>>>       #include <drm/drm_print.h>
>>>>>>>>>> +#include <drm/drm_gem.h>
>>>>>>>>>>       #include <drm/gpu_scheduler.h>
>>>>>>>>>>       #include <drm/spsc_queue.h>
>>>>>>>>>>
>>>>>>>>>> @@ -569,7 +571,6 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
>>>>>>>>>>
>>>>>>>>>>       /**
>>>>>>>>>>        * drm_sched_job_init - init a scheduler job
>>>>>>>>>> - *
>>>>>>>>>>        * @job: scheduler job to init
>>>>>>>>>>        * @entity: scheduler entity to use
>>>>>>>>>>        * @owner: job owner for debugging
>>>>>>>>>> @@ -577,6 +578,9 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
>>>>>>>>>>        * Refer to drm_sched_entity_push_job() documentation
>>>>>>>>>>        * for locking considerations.
>>>>>>>>>>        *
>>>>>>>>>> + * Drivers must make sure drm_sched_job_cleanup() if this function returns
>>>>>>>>>> + * successfully, even when @job is aborted before drm_sched_job_arm() is called.
>>>>>>>>>> + *
>>>>>>>>>>        * Returns 0 for success, negative error code otherwise.
>>>>>>>>>>        */
>>>>>>>>>>       int drm_sched_job_init(struct drm_sched_job *job,
>>>>>>>>>> @@ -594,7 +598,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>>>>>>>>           job->sched = sched;
>>>>>>>>>>           job->entity = entity;
>>>>>>>>>>           job->s_priority = entity->rq - sched->sched_rq;
>>>>>>>>>> -     job->s_fence = drm_sched_fence_create(entity, owner);
>>>>>>>>>> +     job->s_fence = drm_sched_fence_alloc(entity, owner);
>>>>>>>>>>           if (!job->s_fence)
>>>>>>>>>>                   return -ENOMEM;
>>>>>>>>>>           job->id = atomic64_inc_return(&sched->job_id_count);
>>>>>>>>>> @@ -606,13 +610,47 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>>>>>>>>       EXPORT_SYMBOL(drm_sched_job_init);
>>>>>>>>>>
>>>>>>>>>>       /**
>>>>>>>>>> - * drm_sched_job_cleanup - clean up scheduler job resources
>>>>>>>>>> + * drm_sched_job_arm - arm a scheduler job for execution
>>>>>>>>>> + * @job: scheduler job to arm
>>>>>>>>>> + *
>>>>>>>>>> + * This arms a scheduler job for execution. Specifically it initializes the
>>>>>>>>>> + * &drm_sched_job.s_fence of @job, so that it can be attached to struct dma_resv
>>>>>>>>>> + * or other places that need to track the completion of this job.
>>>>>>>>>> + *
>>>>>>>>>> + * Refer to drm_sched_entity_push_job() documentation for locking
>>>>>>>>>> + * considerations.
>>>>>>>>>>        *
>>>>>>>>>> + * This can only be called if drm_sched_job_init() succeeded.
>>>>>>>>>> + */
>>>>>>>>>> +void drm_sched_job_arm(struct drm_sched_job *job)
>>>>>>>>>> +{
>>>>>>>>>> +     drm_sched_fence_init(job->s_fence, job->entity);
>>>>>>>>>> +}
>>>>>>>>>> +EXPORT_SYMBOL(drm_sched_job_arm);
>>>>>>>>>> +
>>>>>>>>>> +/**
>>>>>>>>>> + * drm_sched_job_cleanup - clean up scheduler job resources
>>>>>>>>>>        * @job: scheduler job to clean up
>>>>>>>>>> + *
>>>>>>>>>> + * Cleans up the resources allocated with drm_sched_job_init().
>>>>>>>>>> + *
>>>>>>>>>> + * Drivers should call this from their error unwind code if @job is aborted
>>>>>>>>>> + * before drm_sched_job_arm() is called.
>>>>>>>>>> + *
>>>>>>>>>> + * After that point of no return @job is committed to be executed by the
>>>>>>>>>> + * scheduler, and this function should be called from the
>>>>>>>>>> + * &drm_sched_backend_ops.free_job callback.
>>>>>>>>>>        */
>>>>>>>>>>       void drm_sched_job_cleanup(struct drm_sched_job *job)
>>>>>>>>>>       {
>>>>>>>>>> -     dma_fence_put(&job->s_fence->finished);
>>>>>>>>>> +     if (!kref_read(&job->s_fence->finished.refcount)) {
>>>>>>>>>> +             /* drm_sched_job_arm() has been called */
>>>>>>>>>> +             dma_fence_put(&job->s_fence->finished);
>>>>>>>>>> +     } else {
>>>>>>>>>> +             /* aborted job before committing to run it */
>>>>>>>>>> +             drm_sched_fence_free(&job->s_fence->finished.rcu);
>>>>>>>>>> +     }
>>>>>>>>>> +
>>>>>>>>>>           job->s_fence = NULL;
>>>>>>>>>>       }
>>>>>>>>>>       EXPORT_SYMBOL(drm_sched_job_cleanup);
>>>>>>>>>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
>>>>>>>>>> index 4eb354226972..5c3a99027ecd 100644
>>>>>>>>>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
>>>>>>>>>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>>>>>>>>>> @@ -475,6 +475,8 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
>>>>>>>>>>           if (ret)
>>>>>>>>>>                   return ret;
>>>>>>>>>>
>>>>>>>>>> +     drm_sched_job_arm(&job->base);
>>>>>>>>>> +
>>>>>>>>>>           job->done_fence = dma_fence_get(&job->base.s_fence->finished);
>>>>>>>>>>
>>>>>>>>>>           /* put by scheduler job completion */
>>>>>>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>>>>>>> index 88ae7f331bb1..83afc3aa8e2f 100644
>>>>>>>>>> --- a/include/drm/gpu_scheduler.h
>>>>>>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>>>>>>> @@ -348,6 +348,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched);
>>>>>>>>>>       int drm_sched_job_init(struct drm_sched_job *job,
>>>>>>>>>>                          struct drm_sched_entity *entity,
>>>>>>>>>>                          void *owner);
>>>>>>>>>> +void drm_sched_job_arm(struct drm_sched_job *job);
>>>>>>>>>>       void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>>>>>>>>                                       struct drm_gpu_scheduler **sched_list,
>>>>>>>>>>                                          unsigned int num_sched_list);
>>>>>>>>>> @@ -387,8 +388,12 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>>>>>>>>>>                                      enum drm_sched_priority priority);
>>>>>>>>>>       bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>>>>>>>>>>
>>>>>>>>>> -struct drm_sched_fence *drm_sched_fence_create(
>>>>>>>>>> +struct drm_sched_fence *drm_sched_fence_alloc(
>>>>>>>>>>           struct drm_sched_entity *s_entity, void *owner);
>>>>>>>>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>>>>>>>> +                       struct drm_sched_entity *entity);
>>>>>>>>>> +void drm_sched_fence_free(struct rcu_head *rcu);
>>>>>>>>>> +
>>>>>>>>>>       void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
>>>>>>>>>>       void drm_sched_fence_finished(struct drm_sched_fence *fence);
>>>>>>>>>>
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C1ac51fc78f9f4e2f08a808d941e0c013%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637613255881294371%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=PRGZl6tUAc7FrL39mu%2BBV2AfC02Mz9R2Neqs5TjdB6M%3D&amp;reserved=0
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C1ac51fc78f9f4e2f08a808d941e0c013%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637613255881294371%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=PRGZl6tUAc7FrL39mu%2BBV2AfC02Mz9R2Neqs5TjdB6M%3D&amp;reserved=0


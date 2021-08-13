Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 747D63EAF24
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 06:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C836E4B6;
	Fri, 13 Aug 2021 04:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2045.outbound.protection.outlook.com [40.107.212.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A906E4B1;
 Fri, 13 Aug 2021 04:23:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1git4O72YOesgIiEXVwZgIOe2O2rFM7IDUyy6YJlr+P0z/2KzYLX8SBT9FT54Jo8YzZnZtHjK7Y+5EBuy9YsuQXnZZZhlxBbnl+GBIhT/IF/UaV1afAcTH7JmyUmNDZbjulL+XY6AlDeR2Ju4uAHw750lgVh7rxIzzWBZh9uEjgyuy6FTCP9bjgbN6R8ugWCy2S1zSSbLEFDZceIHyKtTVkmtf6V2yhZnxiOPcng911ufOBV8nTcWXr6wSZJhfCvAQ0Cg2vrhDdbii1vRmpxPhWoV5Ls1wMH9Fo0TPcyEiTFxPgcVG8rTm02LjFyutTgJGfZ8Cq1QmhKOqgMcu19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLpWMFXA36riYZy52T5CMn3kSSI+A/hPa3Q+7wF89sM=;
 b=HX6d/bU7KM/zT7eSRFoV2PGPd/cXvQpCan341/QZG6Do079NooI4EcuvMlGMa1G3c7/iomSoNzQ/CREBNvHSxCNpOqfc3xgtUD+ViKDmQ7DIJsvbqLxmIbnBbd7PuNLU5w7yyAbmM+XMOOciBe0yoCFbmYg5EoX5daHWekpCgL6mFnIhAYM/ysc25nwaDkSTlQABbIM7tXGjgJjcfMUmKPHhPrByGwZ6BliDaMEE1ZyRPRFEyB0FrZRP7UhKSdq/XC2Sek2vlsNiM08PXDOA2xaSHx27kKRriBcA02VT/3q/Vg1ffwvqHg5+fCzTm/uPgEFLkIYNYBwy0f8AVjwohA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLpWMFXA36riYZy52T5CMn3kSSI+A/hPa3Q+7wF89sM=;
 b=klws3bRZGXWVjZ2AotMkR+cgpWoQRW8ehfP6Acr4+VQDhhLSDgi3krRyIpNOO5jPeRochS6QCl5kjtmreT+Y6qDWvlrlFfZITfATpU15Y6uyRfAqrhf0ODg+bv765kUOXqjZPIOY0XUHdFF59KX4UpstoqFIpqQ6Ap+myj6Iq9I=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 by BL0PR12MB5553.namprd12.prod.outlook.com (2603:10b6:208:1c9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Fri, 13 Aug
 2021 04:23:45 +0000
Received: from BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6]) by BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6%4]) with mapi id 15.20.4415.018; Fri, 13 Aug 2021
 04:23:45 +0000
Subject: Re: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/VCN
 ring_end_use hooks
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "Liu, Leo" <Leo.Liu@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210811165211.6811-1-michel@daenzer.net>
 <20210811165211.6811-2-michel@daenzer.net>
 <MN2PR12MB377506AD71308A47222A3E9583F89@MN2PR12MB3775.namprd12.prod.outlook.com>
 <DM6PR12MB26196DF7D33462060FC4F607E4F99@DM6PR12MB2619.namprd12.prod.outlook.com>
 <MN2PR12MB3775E6C1ECA915283108E6D783F99@MN2PR12MB3775.namprd12.prod.outlook.com>
 <aebae00c-4b7b-552f-accb-e51d151ecb43@daenzer.net>
 <194e8a33-1705-d19c-add1-38941b6d9b5c@amd.com>
 <ae81d7d1-c111-1d24-6be0-6728ce9ba36b@daenzer.net>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
Message-ID: <61cb9cf6-7700-4654-e160-e8a74978123b@amd.com>
Date: Fri, 13 Aug 2021 09:53:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ae81d7d1-c111-1d24-6be0-6728ce9ba36b@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN1PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:1::28) To BL1PR12MB5349.namprd12.prod.outlook.com
 (2603:10b6:208:31f::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.157.114] (165.204.158.249) by
 PN1PR01CA0088.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 04:23:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb998c8d-f1cc-4cee-d972-08d95e122377
X-MS-TrafficTypeDiagnostic: BL0PR12MB5553:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB55539B59874AFADC5D81902D97FA9@BL0PR12MB5553.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6OAJcgHRmInJIOvz8Skei6qxQCWbtnllktmBdQ6qaiK52KzBDAfFeDYvqyiqjfiKGaL+m+mJ+uEQDVh/mxUXnVS2TWFKl6H0ReTRofLabVeogTzIlwBxnu+xHnNGo2gndRmTUBLIJJatDRVZciesKuVXu1yulYm1iVPwNZWUI80zZ7Syr0+F7UaO/GdE2vRBDHYo1JQoJQQ4UxbwGvUUye5sd3Bt0pS2BVS1NFfB4yW3LiOzBYUjXyEi/W2wTuz5wVAeqt5MgRHlgw/LYQKVgN2RT+ITCKUtAwvbYN980RU/FeSsi5olnY/6Z64glj69I1xzgFKuS7JmCfiElzRBE4WGGnM2QIx/zYIPj9lcrzbQL/cFeQPIbJAJFgyP6nHiW8l+N3iuBYX9jwywoIZIfe6dAWR9RSDv4fbForszkzhH4YYDzAu+1Q4Vo/oPeHgS6ny0JneU5yzgJBctE46/B6WUjmnRTW8CpbFo3U9TmUr7B4sgCAoAxlE5HePCTq8eY+4AKYd6P/lYI/p0rdI5mD2D02IU0v4csTdr7xBxRp3+7cJP26xW7rASZs0ev1e9rR34MosA2S0AEyuT4UjysUzdXekazHLp1fQYD/n33UZbML7TT5wQ05Cu4YmGF/doTV5wnrC5rILP7PKPYe5F7Wq+WqkSvMyaGUtm55AZymyHa76/08ArFFkoB/Cbu5nV/3LHi7qEhxCr4ULH0Yakk4WdEZPciQyX2EQV3xdRrI0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5349.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(6486002)(36756003)(5660300002)(66476007)(186003)(38100700002)(8936002)(8676002)(86362001)(508600001)(53546011)(2906002)(66574015)(6666004)(31696002)(26005)(6636002)(83380400001)(316002)(16576012)(4326008)(54906003)(110136005)(31686004)(2616005)(66946007)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHRGaXpqdWtBUzlVblphUXF0YUlIb3hqNUZiMDBvelhWWmx4Q21UNmZvQmZH?=
 =?utf-8?B?N2ZnTzF4aGxTYjVCVWNrcUhBQ0NxSjFSQVNtZ3Q1Y0cwYzRXaGFZd3dnYzBI?=
 =?utf-8?B?WjFVSys5Zk53bEc1VGtPQjlQWVJGTGEySkdOc0RIVXdxeDZ0czVRYi9rSEoz?=
 =?utf-8?B?U1NXRzdTazkvL3d4aDRHMmFvN1hrTzJvQkVZTUFuTk9oQmpjdW1hT2llRTVS?=
 =?utf-8?B?dW9hZHF0YWQrUk8rdythSzNKd0QvNWZnQ0h5V0dXSGNDaExaNGM2ZmVkYlFM?=
 =?utf-8?B?ZXBIdG9KempHUVFSZWFXbDRFSXJUdUJuNENwemNydFVhNFNiNHNxWVpCWkhx?=
 =?utf-8?B?dTJvdWxpcStlY2R2V3A2Q0tLSXdKdDVmUHhyZHZYQTVNR2xpU3EyK3ErYWpH?=
 =?utf-8?B?VXdLNFNhUTdJWnJHYmkvZW1IOEJsb3ZTdHF1akR3cy9SdGhKbXZZYjZiTXJE?=
 =?utf-8?B?WllhY25rZFBaaXY2Z3h0Z3ZDZXVrU0FNQ2lkRE5sYlZzeGtoQy9maEZCY25r?=
 =?utf-8?B?WnRLV2s4NndZS3M5cjJ6OCs3RVpiMGdxNEEyTDBSZHlBVzZaeEdteTN4VHc5?=
 =?utf-8?B?M0NiYzJtK3hGeW55MlM2YWJmZkdPTmgxZHVMb0VxRGswME91cExwdGNNSmNo?=
 =?utf-8?B?Q0F3Q0QxcllHS2txUFFxcnRlcHBxMWZFTkFEYzAvblpnTGdVNkJvM0JSREJx?=
 =?utf-8?B?TG8vSlhBbSt1Z1FNYUIydTFTY055cCs3Y1cwVWo1VW4zb2RZVmxSVUpWOG9X?=
 =?utf-8?B?SDYzSm5BZ1NQSm00WTc4clhKVmhvWFYyK1pkV2NPKzBSdHppS1VnSFYyTlJH?=
 =?utf-8?B?Z050MjBSaXZOY04wZWxaL3kvOXRoOTBIVWFuZEdMbFNBa3hBWC9ZZGx1QnZj?=
 =?utf-8?B?MHFLVUg0K3RPL1EvbUFqbnBWbE51TFIwRy93WFEvb2lGTmRJQXczU0JlUlFT?=
 =?utf-8?B?elVCNkI0N25TTlNVbVB1YUk3cmd1TG1lZmFnbmY1TW8ybUtXTXJIYVJxdElY?=
 =?utf-8?B?QzVJRDRkVVZlYnM2OU9QY2NEcytONENTSk1UNkdWbkE4R1AzSnFWS2l6VzRG?=
 =?utf-8?B?MURFVDFJbFhJN1pueE1tMGJyMWF5aDBlQWMzQ3Y4dEt6dEZGY2xzT2tTcWRh?=
 =?utf-8?B?KzNGY083YTFmY1o0MGU4VlpudXdHNThObHdKellrN0hOd1VSQWdMa0pGRDF0?=
 =?utf-8?B?R3JYUDBHVG03c09xYlc1V1BTdmFiNVc0NHpqNG9vbHpBVGREaFhRUzhvV0Rm?=
 =?utf-8?B?QmUzY2NEek92akppR1NObFk2WEloYUJ0aGdnR2lTU2ZHOWVzaWJleVQ2RVFO?=
 =?utf-8?B?aWQ0U203RWtYSjJ6aVl3OUZkR055QzFIS0Z3LzF0eUtzcjBMamt2WEZQU2pV?=
 =?utf-8?B?Nm9GTmx5bDlySks0d3hickpQb1FmMVo3UjNXbUdvTHg5Y0RubU1yQ2dTbUdi?=
 =?utf-8?B?OU9vb1QxanBFeVlTMnJIOEFFdzR4OFpkejZaUHRJb3lGc0N6eWp3a1Byaksy?=
 =?utf-8?B?WFBtdGtMWjNncTBha2IxbTh3cmFRVlhhek1OK01ob0xTdkNXbGo3WGtmMG5l?=
 =?utf-8?B?MnhGbUJwazg0Q2lwMllkTW5aU1pINnZDSlhoUmFWSmhFeUxDaTJoSU9NcFln?=
 =?utf-8?B?SDhUTVM2TDBsbU5FMzZod0NzWmJSYmlOTWRidDcwSTg2UUxmR3lxWklXNmJz?=
 =?utf-8?B?WGxrWE5leTl2WjlQSDVtZ3BJbVYrL01PV2RodWU2RU14eWNibUZVYXR3VVZq?=
 =?utf-8?Q?ZKVCSEDSIqu/qrIdfl+2sPeuSqoNmjrihkqCcjE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb998c8d-f1cc-4cee-d972-08d95e122377
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5349.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 04:23:44.9335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioZYcXw9iPH1s1hCIFP4ns/m/2Mji7mNr/6V4W2jD60Vys3ERRU7U3usStOciRQJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5553
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



On 8/12/2021 10:24 PM, Michel Dänzer wrote:
> On 2021-08-12 1:33 p.m., Lazar, Lijo wrote:
>> On 8/12/2021 1:41 PM, Michel Dänzer wrote:
>>> On 2021-08-12 7:55 a.m., Koenig, Christian wrote:
>>>> Hi James,
>>>>
>>>> Evan seems to have understood how this all works together.
>>>>
>>>> See while any begin/end use critical section is active the work should not be active.
>>>>
>>>> When you handle only one ring you can just call cancel in begin use and schedule in end use. But when you have more than one ring you need a lock or counter to prevent concurrent work items to be started.
>>>>
>>>> Michelle's idea to use mod_delayed_work is a bad one because it assumes that the delayed work is still running.
>>>
>>> It merely assumes that the work may already have been scheduled before.
>>>
>>> Admittedly, I missed the cancel_delayed_work_sync calls for patch 2. While I think it can still have some effect when there's a single work item for multiple rings, as described by James, it's probably negligible, since presumably the time intervals between ring_begin_use and ring_end_use are normally much shorter than a second.
>>>
>>> So, while patch 2 is at worst a no-op (since mod_delayed_work is the same as schedule_delayed_work if the work hasn't been scheduled yet), I'm fine with dropping it.
>>>
>>>
>>>> Something similar applies to the first patch I think,
>>>
>>> There are no cancel work calls in that case, so the commit log is accurate TTBOMK.
>>
>> Curious -
>>
>> For patch 1, does it make a difference if any delayed work scheduled is cancelled in the else part before proceeding?
>>
>> } else if (!enable && adev->gfx.gfx_off_state) {
>> cancel_delayed_work();
> 
> I tried the patch below.
> 
> While this does seem to fix the problem as well, I see a potential issue:
> 
> 1. amdgpu_gfx_off_ctrl locks adev->gfx.gfx_off_mutex
> 2. amdgpu_device_delay_enable_gfx_off runs, blocks in mutex_lock
> 3. amdgpu_gfx_off_ctrl calls cancel_delayed_work_sync
> 
> I'm afraid this would deadlock? (CONFIG_PROVE_LOCKING doesn't complain though)
> 

Should use the cancel_delayed_work instead of the _sync version. As you 
mentioned - at best work is not scheduled yet and cancelled 
successfully, or at worst it's waiting for the mutex. In the worst case, 
if amdgpu_device_delay_enable_gfx_off gets the mutex after 
amdgpu_gfx_off_ctrl unlocks it, there is an extra check as below.

if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count)

The count wouldn't be 0 and hence it won't enable GFXOFF.

> 
> Maybe it's possible to fix it with cancel_delayed_work_sync somehow, but I'm not sure how offhand. (With cancel_delayed_work instead, I'm worried amdgpu_device_delay_enable_gfx_off might still enable GFXOFF in the HW immediately after amdgpu_gfx_off_ctrl unlocks the mutex. Then again, that might happen with mod_delayed_work as well...)

As mentioned earlier, cancel_delayed_work won't cause this issue.

In the mod_delayed_ patch, mod_ version is called only when req_count is 
0. While that is a good thing, it keeps alive one more contender for the 
mutex.

The cancel_ version eliminates that contender if happens to be called at 
the right time (more likely if there are multiple requests to disable 
gfxoff). On the other hand, don't know how costly it is to call cancel_ 
every time on the else part (or maybe call only once when count 
increments to 1?).

Thanks,
Lijo

> 
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> 
> index a0be0772c8b3..3e4585ffb9af 100644
> 
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> 
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> 
> @@ -570,8 +570,11 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
> 
> 
> 
>          if (enable && !adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
> 
>                  schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
> 
> -       } else if (!enable && adev->gfx.gfx_off_state) {
> 
> -               if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
> 
> +       } else if (!enable) {
> 
> +               cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);
> 
> +
> 
> +               if (adev->gfx.gfx_off_state &&
> 
> +                   !amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
> 
>                          adev->gfx.gfx_off_state = false;
> 
> 
> 
>                          if (adev->gfx.funcs->init_spm_golden) {
> 
> 
> 

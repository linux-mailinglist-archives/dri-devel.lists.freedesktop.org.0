Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFEF43CCAD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 16:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099AE6E8B1;
	Wed, 27 Oct 2021 14:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2076.outbound.protection.outlook.com [40.107.101.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6F46E8B0;
 Wed, 27 Oct 2021 14:47:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQ2irltkNtl2mcXL27nNiH3k45B5mNhvQ/DuiQ8Jl8xQ2SOOxti+PuLG9Sv6Irj7JQYqq8q2zRiyZ4biE9jtOMyk2YsWgratehCn9rbVFuGJeNMRnkQqTsUdQLG0Z8HM9sqWVa/upZjTLFmMQRkd3QNUeSqOx0ueQw4b7ySgZI3ykfJRLlJ8bh16tmU4gQQvAiCm3ljdq9ow2WJjsWtbFh77d/pJlw3Xby4Ysv1xcmKQmig6z/eind5AkIvTHVPJa9P10nN3B7atELvfavSyqN52UyFbsi1245qF2MNdisNQEi0Gt/XOIJem/jLpn5/92RrSpTJKW7ypekvChhaD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKY0QmtPGCXbRSn42vOV6j7pSaZTZvSwcWdM+xSWNYM=;
 b=QR6bzDV6QgOksTpkOy6HV3+8f447q4DsX0XauJtMO0TCnRYttsrVc4Vq4hgKNOdhTyzl1W+V9S+MAr57keZmbtvktrJPXp0AaLC7yS/GJzyCL87Q/PJuiFIVqyhfT6r/0IkVStyKsbHPWadL1QvCfH8EThCif7TQVhxj+0oZyCJ6tpFNT64zTVFp76isd4mfm4rA1KrZdASFygCLJAANWKfGBwm+G6Dc9U7qpC2DezoWo8gV3w+UCQb+E9+nUmzW8aLwghyjL0wFJKH7nUdywbJ8jrxRAYgmAdNb6vmjZuCVJfXr2hAUnHnh8CbMmg2iAQ+UF4geLLWiLWPDpUXhzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKY0QmtPGCXbRSn42vOV6j7pSaZTZvSwcWdM+xSWNYM=;
 b=TyPrINXwUcDX782ewItvocwoInZPpMWZJNZW/A2QDzEmntwDa5xn+s6gsr6qmV54IT5bqtRYoKt4KsSLaSd+UL70vhOXoj8odt+1kb9K7q27++aawGN+ITjfUpPDRK9/Ggr3Z9J6tmaAHcGxHy4FGydb7AOxZ6nx5Gv67OXA3p8=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1943.namprd12.prod.outlook.com (2603:10b6:903:11b::7)
 by CY4PR1201MB2486.namprd12.prod.outlook.com (2603:10b6:903:d6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Wed, 27 Oct
 2021 14:47:04 +0000
Received: from CY4PR12MB1943.namprd12.prod.outlook.com
 ([fe80::28c0:a6b8:eb2f:5a79]) by CY4PR12MB1943.namprd12.prod.outlook.com
 ([fe80::28c0:a6b8:eb2f:5a79%9]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 14:47:04 +0000
Subject: Re: Lockdep spalt on killing a processes
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, chris@chris-wilson.co.uk,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
References: <73c163b4-1917-1cde-b75f-831ac66f6ea0@amd.com>
 <2090e8e6-4b0a-4b75-a776-64dde1ecdfd5@amd.com>
 <152adb05-e863-525a-f586-ecccb39a4724@gmail.com>
 <5e67d2d2-f5ce-2669-6ad9-7e40c74ce853@amd.com>
 <696ac3f9-4b45-b8a5-5300-79093d2cd1a5@amd.com>
 <2639d027-b6c8-ee09-5e9a-564308949c53@amd.com>
 <cbeac930-84c3-7a62-0b3d-4cef3074139d@gmail.com>
 <da1ed5da-59ad-d12a-906c-c84b7462d8c4@amd.com>
 <bb70e916-e71b-9968-78d9-d7de8fef9e91@amd.com>
 <5c70c6a9-8867-506a-1e7b-32f85589a070@amd.com>
 <c5fc1be1-eaec-a57c-79ee-9a63123ed9a2@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <a1f594de-e326-6150-c787-35a4fde648d7@amd.com>
Date: Wed, 27 Oct 2021 10:47:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <c5fc1be1-eaec-a57c-79ee-9a63123ed9a2@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::33) To CY4PR12MB1943.namprd12.prod.outlook.com
 (2603:10b6:903:11b::7)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:49b0:9448:e1a0:ef19:2ba6]
 (2607:fea8:3edf:49b0:9448:e1a0:ef19:2ba6) by
 YT1PR01CA0124.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Wed, 27 Oct 2021 14:47:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59ce2151-2618-490a-4101-08d99958a458
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2486:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB2486BA59213FBB0A2DB3C3CCEA859@CY4PR1201MB2486.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hr5667VVluPPjltw0bzzcG01iRO/b4nTqaEe3wa43sfY5ohqy+swj/g7nLa9AmXQyzGVaBUKRPQmpSz0RWJE+7WGTw894/E7W1+3Jq3/+iE0T2ZjJtdz8g/iJsenLJAb2qM0sxNBBuUxcMAu6jMyg+1tg9tGSix+FS46p3Aw4+5UnjPXEiENRWzESRHUJdlpbyzUNXUgwcVGfcKd/ueexqhBUxfIEV8EjvIN21QEbdvD9NdzMB4HKlyzQi/L8ZCPyAU6jhJ5xgUHDFgGtuhf5z5wnxCaK7ijbbXa9Qq2aJvHUb1uRRyNg6ku5XbwzDaU3P5gNOn76wf1/Lei4sT1sb3ApMh3xg/ItqQD9n5ERF3U9UwV4GwR+Ref0EP3v+FDO7YjuRbvrTT3hR+NprmKCnnow3IvL8afmcPA5x85h+njKYHgWF8aRpnfGjlW/3p8kFF9mZn/fK2WeFe22/GsdcqMX72NDuosmzTeDLeISG/MpXIwYR68JkFl37OWu8R2y1TBcW33vjUKE5kK9PPKF21C4E6LWffmvJUBHjxHMhl6/eaijaPOca/1lHnwbpxWTvF83NKjnPxIdNWukZdWKhhvvz4JSYl5CPxunevqiHM9v4KgwHiqPppDEyTGCc+43RJRihDdscxBkCJhtrFQNNc+KLVWfE1VfQnnsTPJFbXESUUWdvS5H/x7w880zelbehD/NscSKE+C7N9QnvQ0R9Lqlr7fFZogVo4U7SO2XxdytSDdEdOjgv1Xs9nS7SBd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(2616005)(36756003)(5660300002)(53546011)(31686004)(66476007)(8936002)(186003)(508600001)(44832011)(38100700002)(8676002)(4001150100001)(83380400001)(6486002)(86362001)(2906002)(31696002)(110136005)(66556008)(316002)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTJtMUo5UHhXdnNzYy8ydWpMVk9YcDZkNW5rQWNGQmZPZDFlbTNGb3BtLzBz?=
 =?utf-8?B?Q2RmZ1FnZnhLa0haWlVHVS9Fa3hIdk9yL01kTk1lYWdpT1dVWmJZRmM1cHMx?=
 =?utf-8?B?YzJubkZ5MEdTZU83aExRSHlWQXFXSWJrdW9PeVltdWlJMUVGS09ZWTBxV3Iw?=
 =?utf-8?B?YjZDM0JIejZrcVBtMHdxY3ZPMWlsRjR1UE9xVUtYZmV6UnZxMFlUWUFyc2V4?=
 =?utf-8?B?d3A4NU9HNE1rcFQrUlp4VHdzUUVRZjNWK3hQT1NtTDFCdldjSnMwbnc5ajJp?=
 =?utf-8?B?N0N5bVl2TzlIUy9wTjVXZjh5MWtjS1pCUW9XRm1LR2VNdGhjUHpHeUUweEhu?=
 =?utf-8?B?bXV4OFBWWjRIbnNIYmVFcGlhMG16RWphRGtrY21hWW1ZbzB5cjhGdkV5RnBh?=
 =?utf-8?B?RUpCclg2dFczbkxLUVBoWkFVWWsvR0FZUG9uRUJqMzZHbEZKRVo1M01VRnpO?=
 =?utf-8?B?aEx3TzNDdU5sazZBUHREQ3p6UkpVc0tKT3pGUlRMaGp4Q2NzVVN3a3ZOQXhF?=
 =?utf-8?B?SHRMQXFnWFVNa2hyU0taTUVWMm11NlptZGhINGJnakdvcGJQQnF0MWd2ejB2?=
 =?utf-8?B?UzVuTVZqeHVEQTVUeXNBc3hNdjc1bFNKNkJmRzg4Y0h0NUdzTDRmNUk5d0ZL?=
 =?utf-8?B?S2dWME0xc2NBVnZ4TVY2aU9mb2dTb1FmK0hYd1RjdnpyUmdnZmdsM3lZZDBt?=
 =?utf-8?B?UWtqVXMxL2JBZm1QUEp3c1JZRm9IaUNTRDRRZkVtRHRkMXQ4cGFSeU0xT3cv?=
 =?utf-8?B?cHhVazJYZEo2VmNlcXlnWnd5SGdsbnNwcWR0VzduS0ZuZkNWQ29FQS9wVExq?=
 =?utf-8?B?WWI1TG5tYUZyaEk1T1Bmb1ovalhseFlBMElzZ252Y3pHV09NcGVjdlFQRG9I?=
 =?utf-8?B?ME9qTkFMK3MxRVRpQlExQmxvOUw0YnAwaGY5TnJIYVUvRDEvSHdzUFA5ZHdN?=
 =?utf-8?B?OEMwd29iRVZUTVh2WVFKT3g3VmNuYTA2YnFQODVTT0ZPQlpSMUZmZTBXUkpr?=
 =?utf-8?B?WjJFaEdnbGRZdm03cVVhNGliUXdsL3NpdVZ0ekNWb0ZsQVZzM1hORUVUOXpH?=
 =?utf-8?B?cEcrNmNwQjNnMVFiaU9SRHZHVkdibVpUMnpoaDV3enB0TThyVkduMVNwQk9z?=
 =?utf-8?B?RjhGZmNuOUNRcXdpM3NJRzN4THBvVk5aQkh5L0FrNmg3R0g2QkJLbnFlclFj?=
 =?utf-8?B?WGpMbzJCcnlWZGZPTForQ0VsV3ZuRVZQL0dMU0xNcHhYL3g0NWtUTGMwN3lL?=
 =?utf-8?B?WUxpR1VoV2NTNjFxMGxOTlVoMGl5Q1VCcEE5ZHRDdmhVTTNTR2JYenJlOFpj?=
 =?utf-8?B?czRrZDlpS2hsaElsbDIwVUVxRTlGM09NVHJZRDd2TlhxT25DQnpGQlpGOXFl?=
 =?utf-8?B?VFBlbSt4WVpRMjZyWEhTeE9POTN6S2Z1TmNHVkJUd3llbU1USWRTamdWdjJz?=
 =?utf-8?B?WnNRekdmTlhFcDVtRjlzQ3BxU1B2Mkc0UDlXMW0xaVZxUUdRczZKeldtS20w?=
 =?utf-8?B?S2lEWE9ScGJBSHUzTTZuNDFpNHR6UGUzT0c5VkdOMklBWGFIMjhTc28wUnY3?=
 =?utf-8?B?UDc0SU9vc1dxYzkydUNtY2RJMmZOL2Q2VlhSU3UvM1VxUW8rSEFqQjVoRzZV?=
 =?utf-8?B?d3owaTYrcEZxdDRBbjNiQWdZQTJiVkVyWFlQQUdKckdmUlZPa3dqMjhtWWRR?=
 =?utf-8?B?UDRHVUk5dWltcXFCcFJnOFowWVIrNDJ1MnNROXo3M0ZRdlduMUh4ekN6S1ZT?=
 =?utf-8?B?R3ROeDdtbEdzR1ZrdndzemNWaWZQTktpbjI1cnRJSXBkWkdzaG03S2pWZG1B?=
 =?utf-8?B?N3RMV2IrRjRxOVgyTElrdjFybTRDMVNoZ0t1cmNlZXFXT3MxVzJaQWdYYkZ4?=
 =?utf-8?B?c09PNklBQVN4cElCTHpGOWRXZ25NUU1YdmxWQi96T0NrTkR0VzVVMm8wYlJV?=
 =?utf-8?B?QWswMlNHSEx3K0czZ0YwOTNIUTBLU0hFSlAzZmYxS1NSeW45Z2IySWtlOTIz?=
 =?utf-8?B?WHdRaTNZZENMaVVLMXd4SWxxZ1V5M2xLeGR6VnRRMytDc1ZoRzBpRXBnb1N6?=
 =?utf-8?B?c2hwaGJBVWdhQjNTODhsQjc5TXdaQnB5R2dHRjRzMitKcFpIUE4rQ21RTXFY?=
 =?utf-8?B?VitqaVdjZlFod0tTemFZQ1FjcGZGR2laa1hSQjFXeE9UclM5WlNteFM0WWtK?=
 =?utf-8?B?c2diOWFsTytWOFJ2MzNxUmI5UTBuWDdTOUJ5cVlGejJvMzRCemc4Ly94anRx?=
 =?utf-8?Q?Qk80XsVn9J8eKgLd52D0IKbCAH6J1c1GtaBs8PpnXA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ce2151-2618-490a-4101-08d99958a458
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 14:47:04.6123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3uo4mzfouGfRxQw+BRC5Fwj7oVFbC0beDStSgrWM0Bax05rSLIlQcRosfGTF57gh9AwhQbVaNTMUQG/LHlQarw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2486
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


On 2021-10-27 10:34 a.m., Christian König wrote:
> Am 27.10.21 um 16:27 schrieb Andrey Grodzovsky:
>> [SNIP]
>>>
>>>> Let me please know if I am still missing some point of yours.
>>>
>>> Well, I mean we need to be able to handle this for all drivers.
>>
>>
>> For sure, but as i said above in my opinion we need to change only 
>> for those drivers that don't use the _locked version.
>
> And that absolutely won't work.
>
> See the dma_fence is a contract between drivers, so you need the same 
> calling convention between all drivers.
>
> Either we always call the callback with the lock held or we always 
> call it without the lock, but sometimes like that and sometimes 
> otherwise won't work.
>
> Christian.


I am not sure I fully understand what problems this will cause but 
anyway, then we are back to irq_work. We cannot embed irq_work as union 
within dma_fenc's cb_list
because it's already reused as timestamp and as rcu head after the fence 
is signaled. So I will do it within drm_scheduler with single irq_work 
per drm_sched_entity
as we discussed before.

Andrey


>
>>
>> Andrey
>

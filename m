Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B02E358407E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 16:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EA710EC2B;
	Thu, 28 Jul 2022 14:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C7410EDC1;
 Thu, 28 Jul 2022 14:01:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBA/t7vM6qKSG2sVh+xfphLs1nYXm8YKnaSKrRbhH5m7bBBe/ngCAwl/VB8ZMD1fXxWliloMEQlSVlkxN4ziqgU0NgJcsl1IrWA8fVgxVOnv1sQhkHaXP7GjTsfnJ5Vb/jD4/AhwMqZIjv+OQWI2Ummb/i1DBUUaSPJhdEO4vAiVMFtHsHHODDkMT11uktwh0QNi71HdFV2z4E8Qj+KeuRgdD0mQZ+qP7SJMt0aA65GauxTSmWDUIDqui+0+vYwI/VkmB+f7M77Fv9o6Vt80I43UPDudLNn6IXyEg8Q4DLy6S6O2eJJx+pf+tIxZ4RMi630Z5g+a8oe51tiWhOWdVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Doojyo9OX5YSvdzM3jUObSoEL/Rhg8iSnb0WhL/2mA=;
 b=nFiXEkAA4CTHOI87sXB4Is0fIp5SqJec+mQ4Yga8qeYtndb3LHkylFBBwarnXwSVYyQpiHmAnxZzlJ/3UVpxKV4+gkS3N1XTYGYT0L85caJrRMnnjGNA2fZmzI6dW/Z1dVDf0+KrsHf8TkrkqlGDG3GghwC2ci3FgVxZYQ/dGY71sd+GVYt0b/cW92/TX+WHmS8scppffZG/hdo9Rh5nW7//GWxo/D09lUrNN+yahPzigpuYq+9EF1oxHSNlCkjGrWDVAI6ttmP3gZi8h4gp6h4zWI9quJAmGSvFq14BbNytV1OgnwoWN2aefLXo13QozcKPe3y4WhP+nnRpBhyCQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Doojyo9OX5YSvdzM3jUObSoEL/Rhg8iSnb0WhL/2mA=;
 b=dmBpZXMbblodurnSbPsyYf9E30PbXEcZVv0wqob/z74kJVlLaIL4D5sOCIsShVQSVnubNov1IPSvWxzy1oN6l2FUCQxdCIySwwGHhjx82rtU84zqSaVPuHCsEMamWbQT/jHZf7KD58xkVuLMk0OYMUbu0j9AcT0RYpRTQlgVw2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 by MN2PR12MB2944.namprd12.prod.outlook.com (2603:10b6:208:ae::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 14:01:46 +0000
Received: from BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::453c:c60b:f11c:367c]) by BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::453c:c60b:f11c:367c%4]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 14:01:46 +0000
Message-ID: <bca54ad7-596a-4005-4fd8-b2c7c15f5c1b@amd.com>
Date: Thu, 28 Jul 2022 10:01:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amdgpu: Fix stub fence refcount underflow
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20220727230755.1445806-1-Felix.Kuehling@amd.com>
 <CADnq5_NZyRAq+X-yQgJevbtgqjdh=FozCSUtM3wk9th4Np9DtQ@mail.gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <CADnq5_NZyRAq+X-yQgJevbtgqjdh=FozCSUtM3wk9th4Np9DtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::27) To BL1PR12MB5112.namprd12.prod.outlook.com
 (2603:10b6:208:316::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c36f5588-6273-4300-e1c7-08da70a1b51c
X-MS-TrafficTypeDiagnostic: MN2PR12MB2944:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zaStvBJTCOoqX1RPbWgX7/Hg8cbH8adZvjOxkctXz80M66SrdKnCyolZzrW2fNPQhTOaY4bhLBwXPZpQ2uWCS87wU5xWuvbzBlY/EJcrilvvVj9482+7BBF8xXyAdgcHKZs1vCpQbM/W8K0vMh4a4B8jGa0plvvkf/D0c1tSgtN4Y9QncuxUKJFi19ucwo2ldeHcrtXvhk4nu/YUil9ib8VflOh1EbCRjXRJFxBn4i08cZxf6Geipb3vgt/9IDUPxG0GquOHagebz/iTI5zN2JRn4oCFlt/203rWSpg+/Dur0rNKve7m6eixBdLsxTCL8Ua7/0sMRqS/RqwhOiPkMKd9x2/7WmQdTE0aW6v31CfRAVSgZdX3LQP6qYn/p9akvaBWgYZM2ycucJLtL9BVGT4vogdsBw8zlHnxgdy8opo3slVTwIm1RNzST2tkMiAl6FPktw5wItA+4SQDRbkrljpHAYP7nBdyBjtEMAKkoZA8Rg5Rb9uJMSN94Dc4AGVpjpds65DtdTsqqu4AHVoqd2KDs5QVbL9tUnI8HAUcAnE2uTodBTL+HYNCZoK9M/scyWIEqMQi1S0mBLL62CDsLAejH3v10BPRizZgvfN87Kx0hmkjW9Yo7XSPCO+7MUVDtHDm5Uyvz9vBesFpn95/kdk5qhJ2TG6HfXar7qsBgpAnkGx9mkswBGTJQjV/9Ng1YH8HeCp0bVgDGHqTWtDPWLstg7mQGD2PZD1JqZN9H34S42osTn31O1YPG0ijI8E0hqKsdf8VBwBqSXDeGYILczcWCUHOxY9CMlu6IbhYxUtsETE4Rk0iG3xCYdvJ2JpUnc1/0nWaXT425OhJJATbnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5112.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(396003)(366004)(39860400002)(376002)(186003)(66574015)(2616005)(83380400001)(8676002)(66556008)(66476007)(66946007)(53546011)(36756003)(26005)(6512007)(2906002)(6916009)(44832011)(6506007)(31686004)(41300700001)(38100700002)(86362001)(31696002)(5660300002)(316002)(8936002)(4326008)(6486002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDhGOGZLdDBSSTlTbW9RUmFYd3lSODVTanJNTWlPTDJzWDY3c21XRks1T0Fw?=
 =?utf-8?B?NFBTV3RGSGtDZUVpNVBsOFdqSWpQSSthZFpmSXplTEp2ZVJYSk82RjVEM3g1?=
 =?utf-8?B?UnBVb3dVK1poZUgzRGlJR3pSSG81ZWgzNGthaGdIZXVjL1RpWWI0R0FEdWE5?=
 =?utf-8?B?L2lCWTNUTGNlY1hxVUtRSjE1WUVab2Vha1B1K1VsaGlPZWhyWWtpamx4eThM?=
 =?utf-8?B?T1o5c3BidzJIdzJZa0tIMGZyZHIvYXl4UXlHS1Q0bzBvSlFQMmtVNjU5UXJ4?=
 =?utf-8?B?OC9ONUtCZlBlVVhNa0lKcURFR1BVVWFPeCtsNVBhODJRTUtBaEVBN1BUM0tW?=
 =?utf-8?B?S01LeTlyY01vR3VUU0MxWmtHakJTNEY5YkpFUk5La2dPWFNSOXRFQ0cxakU2?=
 =?utf-8?B?L3E3UGJGY1hIWXNQYk9YeFhqaW5aV3kyQ0FmY2krN3NWQU1nOVlTUmt4aHky?=
 =?utf-8?B?VWdWOGFtUFRJc2tncjdWdFBKUUV2U0FoOFJENnRwdGFhS0dsWWZwNE9WS2to?=
 =?utf-8?B?OHQyUXJ1a3gvdjE1ZGdzeEx6TCs2UGJqWjdOQ2hQam8zZ1pKbU51VkNTY0Z3?=
 =?utf-8?B?TXFjTmRHK201RHByeEE2MWZrR2p1R1FCM0sxMXdmNmh3eEt6MHJVVnFoRGFh?=
 =?utf-8?B?WGVYTUtVVmZXQWJhZzhueGZFU3l0b3lrYlZLOXp3Rm0xUjBaSjMwYXN1SWhu?=
 =?utf-8?B?Uzc4SFN6a0h4ZENBOU5MeGRlc2s3STcvTHFST21BVzlDamxHR3BXWlFkMGFq?=
 =?utf-8?B?R1BVZTdocFBhd0RBbGcxeGFZcTVFa1NoQWhNRTMrRm9LUnVRYW56UEMxQXg4?=
 =?utf-8?B?LzhXcWRUWGZ1UjhqTjFEUWtGUis2dU5TbjVkOGw5MHY1cmkxOUJndTdoTG1W?=
 =?utf-8?B?YnNIb29UZEZsTG9LaDF3M1ZjU1VndU0xYzhnMHZzTFVUcWhqUWNvT29kSlpu?=
 =?utf-8?B?b2xkTTVBT2o3U2xvc2lNdE5GUnJtVk1EZ2wyRTJUejJqQWpQN2VKVzJOaDZG?=
 =?utf-8?B?NmVtOUNOS0pIVjY2VzZkZmxtZE43a3ptQ0tlNnlCZkh5bWc3bkQ1UHlncDh6?=
 =?utf-8?B?VVhSb0lRQmJQblNYNGZZYTRYTGVqT0RrWUV5SldlS0NweXZsaTRyYjcxSHg1?=
 =?utf-8?B?ZHg4ZUxkVDc3RWhmNGtnbktPRkFpR203Z2htS0pKOTRWL3VPODdCcUpQWEhR?=
 =?utf-8?B?RWFLaDlOYzlDNGlwcTcwcFpLdkNSVjhsTDF5eHBIdTJ4VXRtUzJFdm5NZ0xK?=
 =?utf-8?B?dUpTV0ljc1dvWElkSElRWWM3SytJc2FUd0RQT2I1WmQzOVphMG1UejNUNDBY?=
 =?utf-8?B?VGFSZ1ljc3NMTEI3QjRRbHZxOUsrRlBucEJIZkhaQVVBZFh1N1JOeXhOdjFV?=
 =?utf-8?B?UUk4dmU2amI3SmIvQWJxbUlOdEttTXUxUWRVTjZIVi9UU3BXS2xvYVpvNlpa?=
 =?utf-8?B?TmlEVDJUTlY3T0hJclZtSGs2L1BWalRoSlZyWjAzTXJVQjlzaTlXY1JXOFIz?=
 =?utf-8?B?N29BM3dqRitkY2xuS2dRRk1QR0M4Y1U1VWE2bXBLN3YrYW43TWNpNEUrcEl5?=
 =?utf-8?B?OEt1UmNoNkxOSDNwMitBd0tzdEszazJ5OEdncFFDLy9oaUhhV2VKN3RmRTgx?=
 =?utf-8?B?Q0ZORndnaVZRelRYVEF6ZjQyYmduSE56L2N0M1hpV1R1eDR0NkJlT3FxU0hB?=
 =?utf-8?B?NWlzTHdDYll6eFNOS09Ub1Nvc3hNVW00TmRpS0R6cVhGRnZISjR2RXJRQk02?=
 =?utf-8?B?UXNISGVLanl2SVNVZW50Vkx2US9jRlM0cTZ0bFJPeU5KNEphL2o0bHltcWtk?=
 =?utf-8?B?L09GaDJQSU5SZkpiV2hyMXd2MHJHY2oycWJ0Rko1bFVwSWRlMFpZVnNtRURR?=
 =?utf-8?B?Wk1ZazltSFFLU1pEU0ZhMmZNUUc4THp1R3pzcWprK1RRb3g1eXlkMmsxZDZX?=
 =?utf-8?B?U2hqUzV2dDZ1QTFGRnNxdERySHR6QzVPRFVGaWdTVmlaN0ovTFNSdTZOSjFn?=
 =?utf-8?B?OUViTWNOOVQ1ZTBTZjdsSG1VMjVUNGN4RjNFVDZhc0RENktwZFgzS3MySXF2?=
 =?utf-8?B?cTErYndpREtUcGtHMFIzK0RKcXJQaDRZZFZabHJsQzlDdTNueVZ6bFZqQ2FK?=
 =?utf-8?Q?N6st24f3paRRu4SHARu3SU5Lt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c36f5588-6273-4300-e1c7-08da70a1b51c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5112.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 14:01:46.0866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnjJ9ukbl12wTSwN3Rl4H/GXSAZ3Z24eAGhx3VId8nm6lt794qf5XQqDZagHsZme5JRGqwTpf4Yj9tmDTRMwyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2944
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-07-27 um 23:52 schrieb Alex Deucher:
> On Wed, Jul 27, 2022 at 7:08 PM Felix Kuehling <Felix.Kuehling@amd.com> wrote:
>> Don't drop the stub fence reference after installing it as a replacement
>> for the eviction fence. dma_resv_replace_fences doesn't take another
>> reference to the fence, so it takes ownership of the reference passed
>> in by us.
>>
>> Fixes: 548e7432dc2d ("dma-buf: add dma_resv_replace_fences v2")
>> CC: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>

This patch is the wrong solution. Xinhui added a dma_fence_get in 
dma_resv_replace_fences in his patch "dma-buf: Fix one use-after-free of 
fence". So this patch is not needed any more.

Regards,
   Felix


>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> index 87a3a3ae9448..a6c7dcd8c345 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> @@ -294,7 +294,6 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
>>          replacement = dma_fence_get_stub();
>>          dma_resv_replace_fences(bo->tbo.base.resv, ef->base.context,
>>                                  replacement, DMA_RESV_USAGE_READ);
>> -       dma_fence_put(replacement);
>>          return 0;
>>   }
>>
>> --
>> 2.32.0
>>

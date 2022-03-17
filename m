Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B044DCBA3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 17:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5658B10E034;
	Thu, 17 Mar 2022 16:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D98510E034;
 Thu, 17 Mar 2022 16:45:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDEBx6stqSqcN2FBFfEwwLinMz3XiWveaFQxGaF/tBEn7/4qeP9aPuz6bEyQNLcso4ewNBjw9vz7JTh5xmep1VrGvO20cbtm/zEWRFbFrWmiy8PkzVIW4oGHqNUptevKubIvURKLyRtJcioK1+/G3lRcuVoKxAAejMxLsk9Ibu9ogGLhhaKO8H9aa8spvInCeDyJR6MSVoFlznR816voGBVOjQkk8/x1NhbCm88pMNXUmYCSg2UeNFkOxFd1Ai9PHT6WZx/PYUYMi4Cv5IYtujG8coWZ03nchVLGQIWvDE/Aa5ooUH+rTUO/BsyFgyoVkHBn9LKFrUF/X092fX6WwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nmcPUWwUrmMuVWrEX+kmp9aIiHuNs0vZz0RfM36qeQ=;
 b=j/B0/4J6b5LLkEGPhXtM364U9Jfgteo0M+gssA7ZIBk0N916vjcZMY4M9aO5BlfDtTbIGnEXubpUhBkeKvyKScI3laKUB3copKtaF1LRg9SzceewYvbwyje0Di89mdT0AgEEiVCR70NhrS6adBOnhf25uDwZs2r3zVyIkXZENihT+XM8smjw3lkdlFrAKpC5hFRiHiJsFDO3yFNEIa5r1aV64DKs96EZXTGmnYsPxpWE9DR87aAOwp60sbijBTwu0sw3SqatBmf86ppygKBZ3jqI1ivvD9ve9iYc5n7P8EJp5pQM0JV0DChO4Pe4Z2/GhaeHoKeHkU4v3PGHSNNtDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nmcPUWwUrmMuVWrEX+kmp9aIiHuNs0vZz0RfM36qeQ=;
 b=etuZuG5mQo1Z/dqyFCOIvMe0Zn0r5zqS8UN1ISOBPpf59akas9MURFceZcbLGBNke9EfjqDVj1c9Ixk3WpLi7o79ARcsdEvyeDg+5DVwpTOLliFoFz4/QHg1CcqeK/6uLIvpZHJS9GwLbCUStd2DfPS9LRc+hmLpeWix6vIp3Bw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 17 Mar
 2022 16:45:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.015; Thu, 17 Mar 2022
 16:45:05 +0000
Message-ID: <915537e2-ac5b-ab0e-3697-2b16a9ec8f91@amd.com>
Date: Thu, 17 Mar 2022 17:44:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] drm/msm/gpu: Park scheduler threads for system suspend
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-3-robdclark@gmail.com>
 <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
 <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
 <CAF6AEGv36V8bLoDn5O1SW3iTUtzd3O1XeuT5gJxyLMxd1E-o3Q@mail.gmail.com>
 <865abcff-9f52-dca4-df38-b11189c739ff@amd.com>
 <CAF6AEGuoBeYoMTR6-KM9xGZ05XSSnSJWMDciawczi7qtiLN9Vw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGuoBeYoMTR6-KM9xGZ05XSSnSJWMDciawczi7qtiLN9Vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0025.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::30) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 633c378c-9145-43b9-88a4-08da08357d23
X-MS-TrafficTypeDiagnostic: BL1PR12MB5969:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB596954F0D8F0BFFFBC8FC6BE83129@BL1PR12MB5969.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6vBQlNSUwXksJlYEcPb2Rgzz0dU+MvbV7m6EcDWJh6Ls+/v6XUDUPG1mvz2ELazCgGF1DEInnLUHkMQPaYxfrK7h0RYS7c2Vp9TzarR6DNBynxcCVF4yU2S3cuWjsFj8T1DKEvJfQyFcBVU4EvfDIb6dZRcjM5NIqOvc/GQISRtZHUWPWDxnCdLm21Hom/TWfJSXjr14nBZ+WeGSUpNNh6Ib18u4vvU/wJk9B80bq7FsZyoXH46kJyOEmuKgEcOcsOOXnQb5zVBFLw56UJJokXAlRQIwygyrQbyCRSET6OxDz/cHVOjTRIfLR+sz8Ihs1DrR7KggSLTwQFUgVoMhW+b5PJCpxWRJT7wcQ54IU8JNQWOsQo2jK2o/KYL4drAGsZsQoaupdn4AsX8pP6wlCLmxBSYGdKE0J5pWYQQrgu4twOvqfFiBZgRUAy8UUfTjZqOK1n2iA/8TuxjWlJAZZFpRftyK4YCKLc7WPF9GbdVmtD1EMz/cOhAeRoojeTBXAk/QspGwPmBhckK86eVupi1y+gGkPyjaxcCjqelZe2/jXy4KtfN0v1kDSp09U4b/K5XsHBpyrD/kl4pk9ZH3Uy9MTk8N2jboCi+mvz+00p4dTsvTfL0ooF/RdN/XK7wA4QqT9Qbdmtyegj9Kt4LsC5sxo9WaJdaEHkIlPa6MDK+Ai08FSicq0Kt445R01rl97h6RimCVp7dA5bbEQzhvWXdSftZF7BLW3+6Bll3Gr4EOawuOfAOdPCLyHs5ogel9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(86362001)(31696002)(38100700002)(6916009)(316002)(53546011)(6506007)(6512007)(6666004)(2616005)(186003)(4326008)(6486002)(508600001)(54906003)(66574015)(5660300002)(8676002)(8936002)(15650500001)(66476007)(7416002)(66946007)(66556008)(83380400001)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUZTMzQ4NDhtRVREUmNSVmVCUVVza2o5UWVVeW1vQmhXdE9jQnpNV05wYVph?=
 =?utf-8?B?ejQvNSs3RkJtR0NmUitQb0ZYWitjQ0FFNlFQVFhOemVCQ1RzVm01QUJxWnlm?=
 =?utf-8?B?UkhsYy92RjNwY29DNmRjR2RpOHdkalhyWCsxeGlabnJ3dEZxWlV4M0dZNGhh?=
 =?utf-8?B?Z29ITTVwYmtLNkN3NE1QL2J6OC8vR09XN0I2cmlPOXZlVFp5SzUzeTZsZkhm?=
 =?utf-8?B?SGNQcmQ0QW5Bd0ZxMHo0L2xUeHJRRnJmTzRWTEFOUHE3a2wrSUZTdHVxL3Ax?=
 =?utf-8?B?OFFtWTd1MEJ2OFIvNDdtb3N5MkVRNEk5UXljSXJIQU1VV3dCMVF6THZXMGt2?=
 =?utf-8?B?RU54VHBYUzZxNUdEZkJqNkk2UkZOdjR2K01Na0FJQW9hWUpzVThLZE5wSCtW?=
 =?utf-8?B?VVNiSXJNS2V4ZklaNHQ0MHZ6RlhJZDZQS1U2Z09BT3BmTnZGaC9kNyt4d3k2?=
 =?utf-8?B?NFFHTEhKRnlEV3hZb0V4dWRpNCs3djVYcmlGSzNubm5QN0hJK01Lc3RZZkFs?=
 =?utf-8?B?T0VHYU9YOWZXL3FFT3hYZ1RiK0dSVGRXclVZcWc0RWV5eG1RblkyeTJCWVoy?=
 =?utf-8?B?bmxZc3RjWnlhUFF0SlQ3bms2YVpPcVVRUkRJcFZuMHZ3VklESjdJV3F5U1hk?=
 =?utf-8?B?em1pWmNnaHFINnc3anBzL3p3YU1CU2IrMURpTklMSzRZckt4SC94SXpzdUcr?=
 =?utf-8?B?ZGlvRlorakQrbGw1cUpOSWZhMWp6RmRHNXpLbFhEQUlWVXVkWVJFdjZiSFhT?=
 =?utf-8?B?NlV5aXdrVjRLWWNHOTdETTdKWjAyMVFiUnc2R0J1aEJCZUpzTFBqNTN2Wklk?=
 =?utf-8?B?YUxLRGtRRlV0S1FDeVVlaTB6WWpiNDJYeFJOVld5V0U4WXZuM2ZRR1I1cTA2?=
 =?utf-8?B?TjNCZXNrVHljZDRHM1VOUDNsVnMzVUFINzhwT0VPQUNVYXJhajllMmhRZlRq?=
 =?utf-8?B?UzZlR2xmbjVVWlJoenhFNERRcUlVSVZIZkY3ajBxYWpIZ1o5UXZCaUxMaDhZ?=
 =?utf-8?B?ZlorMC8veVNkUHlIamNYSVJDM095eVFKODhMb3dNZTNZUnJDbE9PUnJmb0Z4?=
 =?utf-8?B?aldzSVJwYUFZbDNOYStoV3NrTjRyRjRMc1lKVjV1blZQVWdmOVhLQ040cVpz?=
 =?utf-8?B?NXB1T0Z1T215aDFJeUo5VnZIRjZvaW1CNldId0hlY2JwR1NZY0RjL05wODJu?=
 =?utf-8?B?ZkNaaG1pcVB3aWxVV200cVpQb2p4bGlLaVVmYU1oTGg5VTF1Z1BYa25NbEpw?=
 =?utf-8?B?OFY4OTMvd05mVDdXWHlaUDZ3TjZ2OUsrTG41L1pQTEhoZjdaLzZGTFlhUGVt?=
 =?utf-8?B?eC9PSzVsazhraXEvaGFvRnp4bGxNSXIxZXQxUDlRZzhxQldSVWdaTjE1bW96?=
 =?utf-8?B?N09wY3lpS3VqVEMxOWdKQW11OHdLVVFKMWNpT0hSRFZic3BUdUhUa1JvUlRD?=
 =?utf-8?B?alNDMkZHLzBvRmFqUjJJWDhMN1FIeWI2djVMVkxRZERMeHY2RllVbnlMTU40?=
 =?utf-8?B?OEhYSjlhLzBiMTkvMDJIV3kzbnB1Z3ZpdkpkMTRPR3hCbHF3VU1zVTZ2c3h1?=
 =?utf-8?B?SVNtRmxGZEIyVXdsTUwwUGZNSGsyUXoyUC9OZytETlZaWFNlK2hNa1ZMRkVh?=
 =?utf-8?B?d214enM0QUNPSWZtbEIxOSsyUkRoUVZ4MWlJRlBhMVBoSXM1cm8wOWc0NCs1?=
 =?utf-8?B?b2dMN08zWUlxM0FRVEtTSjJLTjRpSWVkLy9sekQvZTRlY1pScTFjMzdFRGRD?=
 =?utf-8?B?L2dXSXMxOVpsc0U2dXdYdUwyeGFOVDNBcUVrRGtKSTBtVHp1MzRncEhZL1E5?=
 =?utf-8?B?Skx0dU5tazdTWHh6VGNYR25XanJnbHZOL3dMeXhQVjhhUXBNSWwvNGk0dmVi?=
 =?utf-8?B?MC9uSkh4WmVSc1JjNlJJeHhsVzE0WlVBWll2V3FYN3RvVmFPMzZ3YThaREps?=
 =?utf-8?B?UWJGODNOTGNtdTJlRzZ3TUkyYXh4WDBTY2Nlc2g0R0Y3VXo1Nit2MGxDVnRw?=
 =?utf-8?B?MlRjRXZEeWJ6MlVCeXNiQTJRYnd3WU9ZeVV3aUlneHl4UitKMFVGdkJzVlU4?=
 =?utf-8?Q?Fxi9c2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633c378c-9145-43b9-88a4-08da08357d23
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 16:45:05.3834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +iac8RW+dFk+RDiRpBz4MkAKSmv+OIHGywVruxoH0W00SIV1kl9/CaSi9mNdEXg/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5969
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.03.22 um 17:18 schrieb Rob Clark:
> On Thu, Mar 17, 2022 at 9:04 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 17.03.22 um 16:10 schrieb Rob Clark:
>>> [SNIP]
>>> userspace frozen != kthread frozen .. that is what this patch is
>>> trying to address, so we aren't racing between shutting down the hw
>>> and the scheduler shoveling more jobs at us.
>> Well exactly that's the problem. The scheduler is supposed to shoveling
>> more jobs at us until it is empty.
>>
>> Thinking more about it we will then keep some dma_fence instance
>> unsignaled and that is and extremely bad idea since it can lead to
>> deadlocks during suspend.
> Hmm, perhaps that is true if you need to migrate things out of vram?
> It is at least not a problem when vram is not involved.

No, it's much wider than that.

See what can happen is that the memory management shrinkers want to wait 
for a dma_fence during suspend.

And if you stop the scheduler they will just wait forever.

What you need to do instead is to drain the scheduler, e.g. call 
drm_sched_entity_flush() with a proper timeout for each entity you have 
created.

Regards,
Christian.

>
>> So this patch here is an absolute clear NAK from my side. If amdgpu is
>> doing something similar that is a severe bug and needs to be addressed
>> somehow.
> I think amdgpu's use of kthread_park is not related to suspend, but
> didn't look too closely.
>
> And perhaps the solution for this problem is more complex in the case
> of amdgpu, I'm not super familiar with the constraints there.  But I
> think it is a fine solution for integrated GPUs.
>
> BR,
> -R
>
>> Regards,
>> Christian.
>>
>>> BR,
>>> -R
>>>


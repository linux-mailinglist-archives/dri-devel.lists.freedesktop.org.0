Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5B46D791C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 11:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3812110E8AF;
	Wed,  5 Apr 2023 09:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F064910E33E;
 Wed,  5 Apr 2023 09:57:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxQpHiXNBlGt8LkTE/MGi52q+0L/Ueb34UJF9T6lcKe2TYQrEd2NbwlxyYn8M+x+bROaX82H06vADV2/oob/pqRw07buRzvUPJS74RiYGyzQF82aZSYbU2YgDVawYoezimBI3/poE+dKRW+DV64qyNBbcsTnKJ3XmjVHzqSxLLhkF99tZLLPl9o87xZ0oQb07c9aawTaMSeCofoQ9+sPMJMZTKdQabJuFVuJNkWBkLgvcriacTQEk1lU+cf0kjx72gtM0qHCAY2l+sW/ZxxarSQcHwmIKkmNEAYut4JaFyUCTdIYK2o6dYNUvI/Ot9J2igctLxfVq+BCVp+9LzPWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cCXihzBEt1WpF1MAtB0NsWAM6m495IajpBDfKxwfSA=;
 b=F1/AuPBjo8Zh7DjT7kskD1vNetn7YYdk7bCfosOCKltQnPCL8yORRzMxcjfWjIm2CQvA4v/EyPhbQ4+ov/lgwLQCNq/2eSk6+G+anPlkzAh1izQEnXn8dY/W3woRS/szAtUEF9H1CA+635J2whATCfYwVti2oOfti5bSV0a7lhVeb8X68gggIZprySjdC7Tec/4lqd6rDDNK7jQphKdF6sx6ix8+LkmT6w8vNdZ6rSO3a+T22SEkcJwV6pW5PdsYEsE/nE08N5N12RALyEb+M33RD0alTizoKg+7J1J76PiQla03J8WgOifvM0GcMnT0xKEhWWTvzn3ZK9OGLrSvxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cCXihzBEt1WpF1MAtB0NsWAM6m495IajpBDfKxwfSA=;
 b=mYMRB8AynypKoKt5+WyGMo2ScSFPhU74G0C6b8JHtAjg6yq4UYeva0Vs9wLNHxri2cmsT2aXNZbl49ycNToH9B5w4wALSf/P5j/h4BfXWwh7woFK6cwyyHw3L3J3ri4I73rB8eat3oZ8XnLDEet3oAVGIfTA7KSz8vR1kI5mk6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA3PR12MB7860.namprd12.prod.outlook.com (2603:10b6:806:307::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 09:57:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 09:57:11 +0000
Message-ID: <ec128743-699b-3722-0ab2-ff96552fdddd@amd.com>
Date: Wed, 5 Apr 2023 11:57:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <87c7f659-387c-3e23-69c6-03e0c9820bab@amd.com>
 <ZCwoL3Wgv90tlQWR@DUT025-TGLU.fm.intel.com>
 <d740a81a-8919-b6c8-a8c1-f5d8f9c5549c@amd.com>
 <ZC0yq9XZ2t9cV0Nz@phenom.ffwll.local>
 <a2236a9d-e21a-269c-aad3-184c402065b7@amd.com>
 <ZC06Rl6TGe7itZvW@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZC06Rl6TGe7itZvW@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0242.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA3PR12MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: 053372d9-fe68-4f59-04a4-08db35bc1fa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7jrw6BQJ2nydSftvFLg7H5n+pdUckmt4bO0dKclW87AOPQNKfhoXRCnNv/jl/bUsRLEcs/zOA5Ma5n8cUcaMXUlePKa625HXUqhABjrgmS8h/pr7yrJPJm01Uo5wsGzo0WlvJcmxeshaTvUk6pqni9P5ryXRl9wiyR1/bEUw9Q5LuYmwpEIFUOKetoeiSzhxSQRTk5UXPc0+QJWeK9nATcnHgpue9AuloZtQSTdGcSNhc0jBLJio9lApqwfoItpZBtP8UuBJGndm48CT1B1EIGsGAnjqsvfsF50rbyIp5qFIIBlhEggvTtuSvhiddvSGsN0pxhNNv1eYxwQUyMvnMywvx96tcuH1g3xgXfzREWB0D9VgfElTmKO9wFt1ghjlLejUpVxfCBTk+yvQqnoFLtbI9Pi8OhczEthyEHyCE+vj6YANxOQBYRDoR6QFFnaJXliLcGDdl5gdPGl7hNCf/DV0IFODQugiOfeZD+Kbu/jaObjaHsILrDbNvICUZyHlF8YjqEohRtSlbVn+QEhI1I6jaVIvJy7+CC6z7eEsR8i5eq7ZurrxS7CUdxQBNWx3ULH8Nlj6AZGmyr86K9oBDVspFcHx54QA8EDzSORJDgblbDAFHH60nzlQXe/H8eKbjHQrMJ4/8mpO70dKdTk5Dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(451199021)(86362001)(31696002)(2906002)(36756003)(31686004)(6666004)(2616005)(6486002)(186003)(83380400001)(6506007)(6512007)(8676002)(4326008)(66946007)(478600001)(66556008)(41300700001)(66476007)(38100700002)(5660300002)(6916009)(7416002)(316002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUdqQ3NOelM0K0s3ODNJZFlHZHZGQUFWNmU2NmplSFJXamxWOWpwLzMyM2J6?=
 =?utf-8?B?Ui9LRlZpQ0toUEdVOTFXbTc5WDcxcUw4eHg1VElXbWxyYkFDVGFYaXoyd3Zj?=
 =?utf-8?B?RGpUUU5STnFRMG9XTlMvbnA1Zlk0N0Vsc1d3VVMwVlJQbHBFTEd4d3FYZ1JM?=
 =?utf-8?B?anpaNXI1aWQ4MndpNnRtcXM4NFY0RnlTR2ErK210dkdHbWE5Z0VrVXZCSU4x?=
 =?utf-8?B?TDlJMGJxQ0ZHRUVKRTFyYVZXQU9lYVFyTHZpbS9qamVoMGRsUTBuS05jaElx?=
 =?utf-8?B?d1R4aXhUUDFIRFdmKzNlcWlVYXorTFlIcGZYTW9TMnFUUTcxNWtIRDN6K21B?=
 =?utf-8?B?NXNZLy9WK2VEYnA2THdqSEIzcW1neS92VGVoMFhqdEtrbHFVVHp1c2R5eVBm?=
 =?utf-8?B?YlcrSHhVdW0vYXJqQUpaTGVlTmF5S1BlMnpBM0RUMk53RVE3di9iaFdHcXhn?=
 =?utf-8?B?TDFYNncraTBxMmRoSzM5bTFrb3p5MnpzTUo2MzRCckRSWnhicWlJMDFMeWRK?=
 =?utf-8?B?MnFCeXQxTHJwS24vdW5wU2RuRzkyTnBJU1NQcEJxdHQwMXY2RUZzaWZEWitH?=
 =?utf-8?B?SC8zZnVoelVVRi9salZQNlp2Uy9kazcyaUJEMVFZTEV6S2E1bFJpR2RWUy9t?=
 =?utf-8?B?ejdSbFU2REdacE41N1pnU1FLR29oa3BxSXprWjR4ZUlka21oN1J4ZG5HZlJ6?=
 =?utf-8?B?OEI1cDVKUmNhUVJEK3ZuUkdIalZtcnRMNXp0UFNFelYycERLUWJ2cFFzZUUx?=
 =?utf-8?B?UEtMWC95Q1pDVmt0RGhuaUhwbUlFT3AxcWQzM3crOUIvN2Q0QnpTM0RNZ3Y5?=
 =?utf-8?B?b2szcHZobDE5RFNOQmFTdVVBR242bXQveDRsNmJRYmJKMHFYbjVobWNIZS9q?=
 =?utf-8?B?SHFMd3o4MHNSMnlJdlhEVU9HVnF0RlAwdUxkRzIrOUNhWi9xTjlNd1NoRERY?=
 =?utf-8?B?VzRHZnBmekdYOWFYZ0lmUllKYytSaFVsVGk4bzBIVklUTHFQb1MyWnhSNkkr?=
 =?utf-8?B?M085eXRadVZIWEVKQ1JQS1psMkZuQ3BoOHRHNmUvcVE5NHpkaUcyeHhYUzFI?=
 =?utf-8?B?a1VrZUc3OUlwMDY5TlJ6c3VsWGNiblFmOWRDTE5iU0RBak1PMVJZNWRIVFA4?=
 =?utf-8?B?amswNUtQMDhOSmF1QktsNnB3RHZJYVV1aWZNQTZWZDFmTkFoTFg3d2o5b0tH?=
 =?utf-8?B?WGNUMTlKQ1ZIaDhmajloS3FFVnViYjRENXgxWlVIQW94QXNaQkEwZ21nSnJF?=
 =?utf-8?B?S0ZaSGhoQnFSLzdmM3hTNGxvcEdlOWtXTmdVRzlPVGFYcldXNjJJSFVxZmZU?=
 =?utf-8?B?Mmgyb1VYRlNDazZ4aHNzeVk5eklsc2tJOWd1Z0pmQ3U1aVk0VzB1ci9yZGR4?=
 =?utf-8?B?aW5RTlFaWUNsdjh2ZFVVR2JSWHJ0T05naWVwRkYwMVdRVXBpWml4VDFzTzN0?=
 =?utf-8?B?d0l4TjRDcWZ5YkpvVE5IS01RTEZvWHhmM2pRT0FBSkoyUEdSQktRYXBZbStU?=
 =?utf-8?B?VzM2M0VYMGxwWS9oOXZzZThUbHBBMlVVdmNSeElhK3NqUlVNMU1rOFRWVFlh?=
 =?utf-8?B?eW1jNHFGMXZ2MEZJUTJUL0JGNTJIZGFtSVphbmQ1dVlxVHp5azVYVmpKWHh3?=
 =?utf-8?B?TDVtUDI2Y2libmg1d0pXL2VIZzRTTUxZN1o0Um9UaCt6ZzJIWlo0Z3VWclAz?=
 =?utf-8?B?QWJvNmFpWEpCRUpvMC9FUWp3ZHJua3NvemI2WEE3dEsrQzRBamhlckpScDQ3?=
 =?utf-8?B?RVRJVjVuWkE3bktBNnkySXJsMWtwUmduaTUxM3JubWJGVGpWN2dNNzc4RHky?=
 =?utf-8?B?dkx3QllYRU9SOFNHK3UxTm5PNWlpWHIzQ3FSUnArdW15djJhMWttVFpYeW5V?=
 =?utf-8?B?YjlSaktOU29uWVdycENKMTg4b2NmZE1Sa1lYaVZHbE85L0tCaStod3EzUEo0?=
 =?utf-8?B?VEpCd3RneEJvNzhUWEdQRUZSWmYzZi9nSEVMRnZUZ3d4cHdCMzUvaTJkVEMr?=
 =?utf-8?B?ZGdoN044bk04dm0weElKVStXSkM5b0V5ZEEvam0rN2N2UXN1SXhpQ3EzZjk1?=
 =?utf-8?B?VWQ3UHFMVjRFSTJXaHY5NG8wVmtKMDQ2VnQ3dGpoYTFtSWR6RmQ0Z256SjFF?=
 =?utf-8?B?Zk1RUFBHZzVvQVNoQTJMM1RTK25SVjJCTE8wN0VmQ09xWWlvK29ObnBLNHlB?=
 =?utf-8?Q?QYDhdzRzS0vLHEeQSqot0/oHvziLa3k69o+cgzavAWQN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 053372d9-fe68-4f59-04a4-08db35bc1fa4
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 09:57:10.6061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYJMSmTCsQYO/QPu9AngmDkYP/+Sm09EhrNMvBee6jXAnXuX0NhIxoahgTpXFkni
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7860
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
Cc: Matthew Brost <matthew.brost@intel.com>, robdclark@chromium.org,
 thomas.hellstrom@linux.intel.com, airlied@linux.ie, lina@asahilina.net,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.04.23 um 11:07 schrieb Daniel Vetter:
> [SNIP]
>> I would approach it from the complete other side. This component here is a
>> tool to decide what job should run next.
>>
>> How that is then signaled and run should not be part of the scheduler, but
>> another more higher level component.
>>
>> This way you also don't have a problem with not using DMA-fences as
>> dependencies as well as constrains for running more jobs.
> I think we're talking about two things here and mixing them up.
>
> For the dependencies I agree with you, and imo that higher level tool
> should probably just be an on-demand submit thread in userspace for the
> rare case where the kernel would need to sort out a dependency otherwise
> (due to running out of ringspace in the per-ctx ringbuffer).
>
> The other thing is the message passing stuff, and this is what I was
> talking about above. This has nothing to do with handling dependencies,
> but with talking to the gpu fw. Here the intel design issue is that the fw
> only provides a single queue, and it's in-order. Which means it
> fundamentally has the stalling issue you describe as a point against a
> message passing design. And fundamentally we need to be able to talk to
> the fw in the scheduler ->run_job callback.
>
> The proposal here for the message passing part is that since it has the
> stalling issue already anyway, and the scheduler needs to be involved
> anyway, it makes sense to integrated this (as an optional thing, only for
> drivers which have this kind of fw interface) into the scheduler.
> Otherwise you just end up with two layers for no reason and more ping-pong
> delay because the ->run_job needs to kick off the subordinate driver layer
> first. Note that for this case the optional message passing support in the
> drm/scheduler actually makes things better, because it allows you to cut
> out one layer.
>
> Of course if a driver with better fw interface uses this message passing
> support, then that's bad. Hence the big warning in the kerneldoc.

Well what I wanted to say is that if you design the dependency handling 
/ scheduler properly you don't need the message passing through it.

For example if the GPU scheduler component uses a work item to do it's 
handling instead of a kthread you could also let the driver specify the 
work queue where this work item is executed on.

When you design it like this the driver specifies the thread context of 
execution for it's job. In other words it can specify a single threaded 
firmware work queue as well.

When you then have other messages which needs to be passed to the 
firmware you can also use the same single threaded workqueue for this.

Drivers which have a different firmware interface would just use one of 
the system work queues instead.

This approach basically decouples the GPU scheduler component from the 
message passing functionality.

Regards,
Christian.


> -Daniel
>


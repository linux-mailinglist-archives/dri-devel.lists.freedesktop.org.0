Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ADC84610B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 20:35:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B89B10E653;
	Thu,  1 Feb 2024 19:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QRsn1YgR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EBC10E653
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 19:35:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RugyWHCZ9WfwRIzgvuxhFwCsip4f/icgtN22wF0IIT2OZNXWPl4q2kz0K6WU0Eh9ct/GFKHCE9+npMLSI+oEq7ju59UKVWYkCwn02L1p7VgNPYNve9KSLxf0w/LMBGZWiExfs/kDAadunUqzuiRcZWQPwdm44cXUrPVXZATf35174Yt54NMSnNXTZfUgSQX1T8xCSro957dz89303JCIsjobtkRnGT33D92Q3U3Ti4eJBMTm5P5pXkbmAGd/v6amobr/nb5RxENQzJjOC/QDIBoNED3G0AgDISYZb0jUVUh7l2yXtPIaRGOfF9gztgoDv9dcMy45HMV1KoTpfmfxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZSgyTKOWWRfvbMkK2RY8pKYi66FNzaAcz58DoRqKHY=;
 b=GQPw/INGJOMyecii8/a4mPlXHiF9Z1qFS/xUgscX4TcS8D2OMfAmuDIAXWw0x47GxMdcRwair0SJKHDyLvP8Bs56R36cnNGrmc7RDdqmpDL9UD+e1JR9TIIz5Mi0XZ5eK3/BRI5vjP86E8KKA5EEordpslFJmRFcb6ULZjE6uUJ5eoaxLootxKJc5i7Pl5F97lOATNPPVK1XURNReq6XOYTF36Xz5PrQVEavq8umzTB6pONgtw0702RaRR9dcVcRiO07eAZHl/Rgc2WutTSNn1chPD6H7sxYrug/FFApqBXwZdHlbXE4GpdlkXH2CaKKv7wl4Nho6ziQve5BHqk3Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZSgyTKOWWRfvbMkK2RY8pKYi66FNzaAcz58DoRqKHY=;
 b=QRsn1YgRvG1nEmRFBy2qRSxagMSXlWWguu1eK0GDuR6ucxaQWfytuiz/NTTUQRC51C/C120TlRb1yDtRrNb9ueQ93Jr/4BNyJIyNx5qi7t2ObfQGTeaEeWktcQ5sjxxsrOGA2tS8vYxUZDgaOgiy0f/O/vxsU3fbtG4rah5tz2ex9DgLH3kx36EDxb3YwYKETqb4VCdPBYXWEMTg00X42U/0SQID/26kWSotrZq2HpcDvhPHQAyh9YfpEXeyPMWiV2rftM2n7nW51CIBM/vyYTJo7CghVebVonsgUw1AFBJrmJ1v03VD/CvuAxQ3NXOvAe7FohJqoBu8hpuDOVx3iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH0PR12MB8008.namprd12.prod.outlook.com (2603:10b6:510:26f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Thu, 1 Feb
 2024 19:35:34 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::acb6:8bd8:e40b:2bfe]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::acb6:8bd8:e40b:2bfe%3]) with mapi id 15.20.7270.010; Thu, 1 Feb 2024
 19:35:34 +0000
Message-ID: <a1597113-3ec9-445c-90d1-62df97406fb2@nvidia.com>
Date: Thu, 1 Feb 2024 19:35:24 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tegra: Remove of_dma_configure() from
 host1x_device_add()
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, patches@lists.linux.dev
References: <0-v1-c76c50cd425e+15298-host1x_no_iommu_conf_jgg@nvidia.com>
 <583b9145-cbbe-4a03-8120-e2a66a6093c7@nvidia.com>
 <20240131153312.GM1455070@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20240131153312.GM1455070@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0293.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::11) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|PH0PR12MB8008:EE_
X-MS-Office365-Filtering-Correlation-Id: 562df31c-7f86-445f-7cd1-08dc235cf56f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xrslhxqiWuhc6W3oqB5+Fr3DgR99sLueEEWZbqA8LXQrOarJc8jI6YJ7ZTRp4SzlQHoejtYeHepYj+ezDsHtxaX1XfxChoFML0+WvTIkujUdqdZkf3adPi0ahNsODQVy/YFa+CC8YG4xBOsDDLcCAk+PBrPRSpyKQgdygnT9jTmY0RRtsW8I23Y8wf3GOOYPPN+k2RjmVvKD1503iEtWZalYY2kXpB8SpP4F+bM4CiNQUeLYrF6VfVaARNXlbcsUsIZAJ9UXj0Bj/8wzZHrPApQM+LB0nyYIpGb/xmfHmEO/zgAj2U8qQLpJis6ZupP0K0TJ6lrzMQlw+JVIk02oqs+HhxNt3jbewpNTYzC9W3/E/fOyYK9mMjAfN/lKWEWwkZAwNyS657FRA/y0bO1jPQrx3YXcp/T2ZEDPhPUtJOesM3lQDSiDh+5LlQ3Wopylv3D7xNT1NHVP075iqo4hD3zBzjcHsh+w2N4O2Vk1AI5TE2cw9J0CFu0YFRlogOxBWuOnLG7imxMSM6Jc1ELj7BmDOKFG3xQ5HBSMee9FkuONKKv9qi0jmmZ7HZ1ZwmKzmHBhiTC7G3vRtR/7mQvzse9sp1PQspmhAzTZIwvUdR0RinA6mtpS9+3z0yVOfKSCALq7gKnWdUw2x6x8sdFe3xFmMwgJ884suJIuhWEpJRKuuQqt/+JgZV312uZp5AALcC2RmsOB9NGpVmoZj5QD/LJWDg31X66a2jRs8R4FU0yC8HnOiByAqnFKL8W/OifC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(1800799012)(451199024)(186009)(4326008)(66476007)(66556008)(66946007)(54906003)(6486002)(31686004)(6512007)(478600001)(6636002)(37006003)(6506007)(8936002)(53546011)(55236004)(8676002)(6862004)(6666004)(316002)(38100700002)(2616005)(2906002)(83380400001)(5660300002)(26005)(966005)(41300700001)(36756003)(86362001)(31696002)(43740500002)(45980500001)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGhHMCtZa241czRETEo5eUhSQUR4TWp4b3FaSXgvcmRzT2V5UVA5MG9CSnFR?=
 =?utf-8?B?U0VwQVd1VURucTY0SlgvQ0pNc2puOHRiOVNTWjZKZTlvd1puMFA5SlZucCtv?=
 =?utf-8?B?VUZRc0FDWldEenhVWG9ETmZmUlIxWHNhNDBwWXltN2dWRGp1cWlTSE4yWmlN?=
 =?utf-8?B?TmtzSThaSC82ZzladG1hb1BQSDBZaStUYm82dzFGdC9pQnJTcU1iTllFZGhp?=
 =?utf-8?B?eGtFTEhFVzVoY2ljNzFueEtEa1g4WWh3THkzamk0ZHhkRndRZGVqV01uczhL?=
 =?utf-8?B?Uy8vREs5TVZ3MmZGa3F2SXlScjNiQVBpRThCc3RjMHM3ejZabFVXNmNIRm1Q?=
 =?utf-8?B?bTFPekNFM1ZwR0I5WkUwSk5Sd1RrYXYwdmZTYmlNM2UrbjVRTHF1NEhuZ2ho?=
 =?utf-8?B?WHNsT2pBbmJiQ2hmSG84dk5OUXFrR21EWWFEZjAwS2pTeXB5UDRrbUI3Ykx1?=
 =?utf-8?B?UUpMaiszVEtTRG5rcXQwTEgyRDRaVzN0OVNWdW9VQ2lnT21mQ3VPR2lDOXVo?=
 =?utf-8?B?dkVIRmEvUFUrZkRMZDdiSURCeFF6c2xoL3ZWV3NaVGRYejRJK2o0YU9kY1ZF?=
 =?utf-8?B?ZGdVSlZxYlhiOUx6YUhMR1M3dGtLT1pjcHY3Mm10bGU1T2JZUXgveDZob2R2?=
 =?utf-8?B?UWxiT1dzL3h2VTRxY2dZRUF2cmxaM3VOazBLR2luWTE1ZlprWkRsUXVHVk0y?=
 =?utf-8?B?M2dpRElibzY5UUx3NnhLbys2SkRUdDdnUGNpYWJXWHdmNHhldngrOGxVOW9l?=
 =?utf-8?B?RDB3elRhcGhFR3pZeEoybEw1bFBkdW5uWThnQ2pxQSs1YmVZa0JHRUlMWXdq?=
 =?utf-8?B?eHBjU1lwNXNobCtqNDllOCtFM3F1SWZZd0lSZHlDVEpvZi9CUkt4VlBFUFoy?=
 =?utf-8?B?a29oUEMyMHRJNk1FYzY5KzdCcFUzQWs4MFZlczQ2d3UxWG8zTEtPZFJyWnlM?=
 =?utf-8?B?T0puMUZEU2psaFk4czc3VmViOHdDSGx3WXNLNTJNUW56L3l6YktHSDNqY0pT?=
 =?utf-8?B?eVc3cUUwdjJ0RkNjdU94WGlDV3lXMzk3eWMxa3BLVWE4Wng5RzhLdDVrd3pi?=
 =?utf-8?B?Y0pGajg5VzRZa2E2Nm5tbTRDT294bklYeSs4RFB2dit1L29VWHMyZGg2a3RC?=
 =?utf-8?B?SVJ5Tnc5bGRtQ0JlME5POVBKc28rSjBBOFdiWVhsR0FGS0NhVzZEemRwbzVG?=
 =?utf-8?B?ZXdKOVIxSmVQNm02dExMWlo1VU9GaW1jNHlTYy90RWZpbThpT3pHVWZReTNa?=
 =?utf-8?B?WUxOR2lFdmRwTHUweEU1MGs3L2NCRG54cWVPTjkrYXB3ekt3UTNMVWJ6dDRI?=
 =?utf-8?B?Y0s3ZExoRlNyRGtqanRlWnNWR0JoWExOQk5RcDEybWsyclJqcTNISm9pZ1Zu?=
 =?utf-8?B?eGc3T09Yd3AwL2tSM2lYZElwL0xOaXkwWjFDL2drVTY2MmR1Z1V3cW5qOG94?=
 =?utf-8?B?eGcwNVNuZkVacGZFbEdHK01uQmJtTTdEZzlYQlVqQXhzQU5NN1dMZWtqUlRE?=
 =?utf-8?B?RVRCbGhqWWk2NUFDUVhYbXlhb3ZkTG9xNkJKOFE5SzRjNjA4cnBybzFqN3Vw?=
 =?utf-8?B?RWVlUVJDWUE0SUxmTUVjVWJkKytydEpWL3VVaDRFem4vd2VMajlpOXFZdUNK?=
 =?utf-8?B?aGdFM2tYU3hSMWx5WTFPRlgwNThmNDBZL3hkU0xqNHYzWkxOZUhXQlJJRi9h?=
 =?utf-8?B?bFFZWE5HTkd3SXVDdGc5OTlObWNMOVR3dUc4WmNsN0ZwbGw3ZnNoQWcrUmVs?=
 =?utf-8?B?blREMWRwYUVKRVV3VzI4SlZmMnY4QlhOL05ZZGxIWjZnWVQ5M01kVnlpTy9v?=
 =?utf-8?B?OGhuRks1dFQ5UU9ZbnZpYnBCbm9lMmtpdGE2Z2lVaGNHYmhCM1dUUElvcWpL?=
 =?utf-8?B?T1IzVlJWeXljVkpMNkV1cnkzUnk1RHNWaTFyOUVZVzJiTFc0dnFGa3p5Zldr?=
 =?utf-8?B?aFY5ZEQyT3k3UENERVpaMXVhUTUxdHpPOC9samNNaUNkZlZzbDJDVXJoZ2Zo?=
 =?utf-8?B?RE1xMTBibytWSG1HWjlwRk4xU21lNkJhYlRLTzVEN2xPdEdrTjg0YURuV3Jo?=
 =?utf-8?B?Y2UzbGVveitPOTJyQ0FpWkl4d25ZN2dtN2FWRWs0Ylo1Ym56WENqMjByUEI2?=
 =?utf-8?B?aWNONjNIYVI5OTZCYmJyVTlpM2g5UlJnK0RBcW53NUdja0RVSUpWa3RUajA4?=
 =?utf-8?B?c1E9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562df31c-7f86-445f-7cd1-08dc235cf56f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 19:35:34.3614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMWFPhGNhUDcLPxYQW/F/4En2txW06SGDE953XuiduYlEYR0h65NsMkDlmNGBdVyNxLKd2lan2IacWhhOi+NgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8008
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


On 31/01/2024 15:33, Jason Gunthorpe wrote:
> On Tue, Jan 30, 2024 at 09:55:18PM +0000, Jon Hunter wrote:
>>
>> On 30/01/2024 16:15, Jason Gunthorpe wrote:
>>> This was added in commit c95469aa5a18 ("gpu: host1x: Set DMA ops on device
>>> creation") with the note:
>>>
>>>       Currently host1x-instanciated devices have their dma_ops left to NULL,
>>>       which makes any DMA operation (like buffer import) on ARM64 fallback
>>>       to the dummy_dma_ops and fail with an error.
>>>
>>> Since commit 14891af3799e ("iommu: Move the iommu driver sysfs setup into
>>> iommu_init/deinit_device()") this call now fails because the struct device
>>> is not fully configured enough to setup the sysfs and we now catch that
>>> error.
>>>
>>> This failure means the DMA ops are no longer set during this failing call.
> 
> Looking at it more it seems the arch dma ops are setup still, we
> ignore the failure on multiple levels :(
> 
>>> It seems this is no longer a problem because
>>> commit 07397df29e57 ("dma-mapping: move dma configuration to bus
>>> infrastructure") added another call to of_dma_configure() inside the
>>> bus_type->dma_configure() callback.
>>>
>>> So long as a driver is probed the to the device it will have DMA properly
>>> setup in the ordinary way.
>>>
>>> Remove the unnecessary call which also removes the new long print:
>>>
>>> [    1.200004] host1x drm: iommu configuration for device failed with -ENOENT
>>>
>>> Reported-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>>> Closes: https://lore.kernel.org/all/bbmhcoghrprmbdibnjum6lefix2eoquxrde7wyqeulm4xabmlm@b6jy32saugqh/
>>> Reported-by: Jon Hunter <jonathanh@nvidia.com>
>>> Closes: https://lore.kernel.org/all/b0334c5e-3a6c-4b58-b525-e72bed8899b3@nvidia.com/
>>> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>>> ---
>>>    drivers/gpu/host1x/bus.c | 2 --
>>>    1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
>>> index 84d042796d2e66..61214d35cadc34 100644
>>> --- a/drivers/gpu/host1x/bus.c
>>> +++ b/drivers/gpu/host1x/bus.c
>>> @@ -458,8 +458,6 @@ static int host1x_device_add(struct host1x *host1x,
>>>    	device->dev.bus = &host1x_bus_type;
>>>    	device->dev.parent = host1x->dev;
>>> -	of_dma_configure(&device->dev, host1x->dev->of_node, true);
>>> -
>>>    	device->dev.dma_parms = &device->dma_parms;
>>>    	dma_set_max_seg_size(&device->dev, UINT_MAX);
>>
>>
>> In my case the warning is coming from the of_dma_configure_id() in
>> drivers/gpu/host1x/context.c. So with the above change I am still seeing the
>> warning.
> 
> You mean this sequence?
> 
> 		err = device_add(&ctx->dev);
> 		if (err) {
> 			dev_err(host1x->dev, "could not add context device %d: %d\n", i, err);
> 			put_device(&ctx->dev);
> 			goto unreg_devices;
> 		}
> 
> 		err = of_dma_configure_id(&ctx->dev, node, true, &i);
> 		if (err) {
> 			dev_err(host1x->dev, "IOMMU configuration failed for context device %d: %d\n",
> 				i, err);
> 			device_unregister(&ctx->dev);
> 			goto unreg_devices;
> 		}

Yes this sequence.

> I didn't seem an obvious place that this would get fixed up later?
> 
> device_add() was done before so the iommu_device_link() shouldn't be
> failing? Are you hitting a duplicate link (ie remove the nowarn from
> iommu_device_link())


Removing the '_nowarn' does appear to fix it, although it is not clear 
to me why?

Thanks
Jon

-- 
nvpublic

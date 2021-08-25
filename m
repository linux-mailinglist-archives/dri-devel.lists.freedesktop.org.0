Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFF13F6FCD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 08:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466AC6E158;
	Wed, 25 Aug 2021 06:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2044.outbound.protection.outlook.com [40.107.102.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D901F6E158
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 06:47:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oc2WCOSCaIXJ1xjI7eJZ51vn+AlOWl8+rWABf4NPAiupSyEJ5EZDvD0tdvcd0ebl9aoIfrVzLQ1j1nlH3xbrrgFHNbr01pgNqeIBW+xC0PF20yArHz64xZBqJZpQS3WlgJdaETKHkbJPTDBQb5psqiyrcPVkVtv2e6aPHbNyui7QyPHud4ba+PZAYMfl8hfKOG7LpAvQHhntCr9oW2asiIa8Yu3bizQBmmb9Fb3BAzfMy9Q7PA2dDPV03H/YI6y8f35EqW8bVzCkNwzx5GdiaJSzP/HPiEkYb0v37DBQjG8A+6UxFpnsKEhIojYbuUQ5qDvM2sSJW1yzUujzjinYbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jkzmLS6A2CtthwGFYf3FY+2iFL5t9qG8W7HBgliJIQ=;
 b=j9RehBZPXgkcz9NTj3KLuFf0qjh8KBCaoDMzDdDKB1jZT3D7i3LA5/A1BNnhfRg31gVPKxxuSj6aBR88kEmOZ05TJ9esruAUmHbCm7cw7E/jXkAuPxajU2V2n2nenhb6cC031j9nNG9XcneOvtrs6KIvIleWLtCOSVDQQMMD7zlbtFo2GlOwCXlTzonKCxPtnJD49ZJkaCi7XUxqD0KPt3Sc64y3QfHEWrXAOEDAiAzIDHucjQHxi5HGAL8lP6BJgFo3jWDDvIk1WAo/jreupwU4X9JZv/txfHnTEQeBGHGOlqkZGdxZceKuL7FlzVV5Vf6Cj+35A7aH/ifwLrZd5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jkzmLS6A2CtthwGFYf3FY+2iFL5t9qG8W7HBgliJIQ=;
 b=jdXncMVS9GZmwaMa0PTXb4ioRGm2cc6ey7iBWHGdv4lJL2/hB33L6tWhjtxKV26HJqZvzEOsM9xoKt80Z6/YgdTlFb0CXuOZKm7a+EOmJLBpvrGQF73PtsReG70sVyA7T7OQqZYZYAA8Z4ZssPUv657NCp9Rp46YJ2FGFl17eGj8Ph7X6c5+ScWdxEtoy4Gge/riw6ojlgBAU1/G+mrO8fq66MpHI0bg0jx+wNbwcQMmL2yB8ciC2VY3A2X8hRK4ZY/qkpO6DNPtbKGMTq+GAC3mIRsEdu5cgPPFU+s1Va9mCm4y1N8EBeUo92Dwg+fI+MFL2a6IzbbFCMJ3aix2bw==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by BY5PR12MB3892.namprd12.prod.outlook.com (2603:10b6:a03:1a2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 06:47:52 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::c557:5e37:2390:beb8]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::c557:5e37:2390:beb8%7]) with mapi id 15.20.4436.019; Wed, 25 Aug 2021
 06:47:52 +0000
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: Gal Pressman <galpress@amazon.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Doug Ledford <dledford@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, Oded Gabbay <ogabbay@habana.ai>,
 Tomer Tayar <ttayar@habana.ai>, Yossi Leybovich <sleybo@amazon.com>,
 Alexander Matushevsky <matua@amazon.com>, Leon Romanovsky
 <leonro@nvidia.com>, Jianxin Xiong <jianxin.xiong@intel.com>
References: <20210819230602.GU543798@ziepe.ca>
 <CAKMK7uGgQWcs4Va6TGN9akHSSkmTs1i0Kx+6WpeiXWhJKpasLA@mail.gmail.com>
 <20210820123316.GV543798@ziepe.ca>
 <0fc94ac0-2bb9-4835-62b8-ea14f85fe512@amazon.com>
 <20210820143248.GX543798@ziepe.ca>
 <da6364b7-9621-a384-23b0-9aa88ae232e5@amazon.com>
 <fa124990-ee0c-7401-019e-08109e338042@amd.com>
 <e2c47256-de89-7eaa-e5c2-5b96efcec834@amazon.com>
 <6b819064-feda-b70b-ea69-eb0a4fca6c0c@amd.com>
 <a9604a39-d08f-6263-4c5b-a2bc9a70583d@nvidia.com>
 <20210824173228.GE543798@ziepe.ca>
 <a716ae41-2d8c-c75a-a779-cc85b189fea2@amd.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <f049576e-4f36-6407-883d-24fac47c4491@nvidia.com>
Date: Tue, 24 Aug 2021 23:47:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a716ae41-2d8c-c75a-a779-cc85b189fea2@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0136.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::21) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.2.54.195] (216.228.112.22) by
 SJ0PR03CA0136.namprd03.prod.outlook.com (2603:10b6:a03:33c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 06:47:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e4603a3-1c54-4b77-13a4-08d9679442e6
X-MS-TrafficTypeDiagnostic: BY5PR12MB3892:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB3892EA27BC553043919EAF31A8C69@BY5PR12MB3892.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Di3fx/oeIo+HIwZPYQJx1yDZXjcTaxAFBsazhL43erqLRmL4Sjkt3Mdsp8wfYQrE0fpYSVoJ/VU6gz9w1JwAq3k7dm+KkYtpth0gzJGji/tSQi8URkIQaFnxmPTkGkmAVQY4tGJqZ6YAd7WQk5u2HTbN9CCNOQvPLGiC/ySNcV3AJsBFux/MIaAFkg+5f3HL9Bb/ic33xS4vIbqHja9WJ8BIBHPkCKo75tuLgFnz65R6gHeGgaBY71eQQ5Ays1lWQ0TH5H4QfRB0RwMmwA444OEPDYq5YBzC6Wc+8z1vg6xbiuyBDaUD5+8eiHLMyrMkdG+0L5ppSWcOcX9ihB7c2+Ajb+cuczXzWvDmtfGJ3M2hDW5446wVOuMy6DUR6J1ZkemUGUbLABCujMPvkm01/HUqluqaysMUy+5bCSZRMV6sj3hXn81rCOi4QXXXETTGQn+KkxOqV83nJ/Ygji5TwwH05KX3HoYnWLd3KmiJdT/KWGlDr9hwiL8fgg5T2nRFh4YPQn/529zNIjcorwg/R+5ZkjiH6/SyV93jD3s5PQGJn8LuwOfGqcP9F4wGu+W7GNQ6+JTBJ3o4AMVtdiybZ37YGzwmcmvrBSQGfFtpnkb9TE5neC75C/XAQ5Wc3CtjHNmjrBd/C9K4QCjzZbbPQIgs2HhE7p7fLL+XBAxk+X74c5xZ0wPRQ2uW9JFZfQ2Lcjv6xdc5ZmIuF0zYPTAFE0MnxDojvNv5TeVPOMXG/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4130.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(316002)(54906003)(110136005)(66556008)(86362001)(66946007)(2616005)(16576012)(31696002)(956004)(31686004)(7416002)(66476007)(8676002)(8936002)(5660300002)(2906002)(26005)(83380400001)(6486002)(38100700002)(478600001)(66574015)(186003)(36756003)(4326008)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUdEczQxMDZ5VmU4SVBDV09rRnhXdUIwbmNnc2thRCtlM2dha1YxeVRUM2VR?=
 =?utf-8?B?VmlCWFNnelVMSVRiN3RjaENQWitqQnd3Ump0YUg0aU51aWdUZXl5WGxqUFEv?=
 =?utf-8?B?OUtxelE2T2h5S2lHTnNYSFZaUFdPdXJ0blVyYUI1YytWeTh6WHAzdU1iNjJl?=
 =?utf-8?B?ZkY5T0Y2N1oxdE1Ic1MzSG9mb2ZCWHl6d0RXWUIzNy9Fdm1XSmh3eDByc2Zn?=
 =?utf-8?B?Z0x0YzROZGFjbGM5TVNISnJpRHpOSkRhQ1pWemtkc2pLRXhsaUVYRGloSVBw?=
 =?utf-8?B?ZTBCZG8rc0VGclVRbmxqbmVzVjhqblV1c2Z0VnR6RWgwZ1Q2M1o5NXpyaG04?=
 =?utf-8?B?UFo2bEMwSy83YjlBWE51bmtQbG1MM0VPalo5c0dQYWVQWnl2dXNJenFxT2hh?=
 =?utf-8?B?c3RTQnV2dWdEU28wam1saDJLQW5KcXN6Q2I2UzhSVjRseXREdVJ3UjlOQy9Q?=
 =?utf-8?B?eDAybkFsenBnN3Ziam5TZzAralZ6MVVZZEtKUS9RUFFMRnpCRXY4WWVvekRF?=
 =?utf-8?B?TDZaTHRpcWZFYllQcFdRZHkyZVJkdlhJcHVnUFBDeTVyWXhYL0hqb2xYN3ZV?=
 =?utf-8?B?RVpnbTFidWJzbmtla1pDNWlRWE9yczArelVSM1J3cFFiNmswU2JUS3VwQktI?=
 =?utf-8?B?bXdpUEVpeHRuZWYrUFo5THM2YjlPU2xtNjNuLzY1RHpUb3N4RTAycGFGMU5J?=
 =?utf-8?B?NHdkQnVMMWxqNDVYTmlOVnZFdTZDcC9KcjFpT3JvdlQrYWIxM3pnOHNDTnZt?=
 =?utf-8?B?SmtDa253ZjlwUjBXVUVzYnorK21ocnBTK3J0OGFFWGdWblFmak9tdVZlc0sv?=
 =?utf-8?B?NEQ1VG95Sy84SlFSdkt5M0ZmQXoweFNNL0xBL1BnSUozUzEwNUpPb2pEVjhL?=
 =?utf-8?B?T0RjVVNMR2FoeUJCeFNMYXA0aXFHMkJvalpqQXpDczBWbXhyaFZUd2NUd2FG?=
 =?utf-8?B?dlhOeXVHRkY0TE5pYjdWaXV5S2VMNCtXRDlaWXgxUWhtcVMwb1NYNmpLOStG?=
 =?utf-8?B?VUVLbWxVNERSYWhaSkg5eVNXSzFnV2pkdFljVHp2NTJwTVhGMnB6Sk1xTWZx?=
 =?utf-8?B?N3p5TmtCNkQ1Z2VYaU5SWDRPd0ljRWJuWGVuS2NIdEd3Vi9lZ0lwVG8yemdq?=
 =?utf-8?B?WlpNNk1MT1RGRTBYQkpNQng5SmRBVE42TlRFc3hLd24rZ0k5SkJxMjF1S3FX?=
 =?utf-8?B?eGRaTmNkMExOak14RDV4anI0UWdOY1B0bS9uUEFMQ3NsK3JqT0VXOXpWNFlG?=
 =?utf-8?B?cEYvcGt0MVJwbis5Ym05dTNQcnh6bHltYUVrNGlOcHVqc3RFOW1LUXNRdG93?=
 =?utf-8?B?N2Y3T0phQXZEaDNMRVBoYmtmZEhFRFNVRkFGUUFsblltT2IrMWRCVTF3aG1N?=
 =?utf-8?B?K0FMeTM3b21mWEd0ZFJiLzdYczI5cmlqQ08vbUZ1T3FwZnVZVlhFNXlDT2xy?=
 =?utf-8?B?bytOOWFzZEFUdzlQQXdRdlk3bTVZUkZCVEprQ1JWZldPTmtZenlWUXdzU2I4?=
 =?utf-8?B?QTJqR21rRUdkNjJpbkJKM1VqQkJwMFRyQ3JjUUc3RGpzSlMwckdGUXJpVHo0?=
 =?utf-8?B?MmR6WnhWdTUrUGxBQmg3dC83Z0hlWHNlaGpUNEthK2R1TW91My84MVpGekxI?=
 =?utf-8?B?dUV4a25Pd1FrRDViYlJFUUZSZXRaRG03K0NONDV1ZmZ5TzRQTkZrajhWMGZG?=
 =?utf-8?B?Zm9iK2hZQ0Q2ZktSdHFBU2hKdzNnK1dGVHUwdTh3dVM5NW8rNFFibmFPczl0?=
 =?utf-8?Q?qH+gdr6paSCh7q2ANk9De9q6bHsdXq63gH66sJL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4603a3-1c54-4b77-13a4-08d9679442e6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 06:47:52.6274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9EOX1rEodAlJaI06Rp+bZHsWmw+mleqkl8N/bkAyvBvNm0AAAmYdVr4pDNS3ZO5sZM0qSvyTGiONk0b27ULDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3892
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

On 8/24/21 11:17 PM, Christian König wrote:
...
>> I think it depends on the user, if the user creates memory which is
>> permanently located on the GPU then it should be pinnable in this way
>> without force migration. But if the memory is inherently migratable
>> then it just cannot be pinned in the GPU at all as we can't
>> indefinately block migration from happening eg if the CPU touches it
>> later or something.
> 
> Yes, exactly that's the point. Especially GPUs have a great variety of setups.
> 
> For example we have APUs where the local memory is just stolen system memory and all buffers must be 
> migrate-able because you might need all of this stolen memory for scanout or page tables. In this 
> case P2P only makes sense to avoid the migration overhead in the first place.
> 
> Then you got dGPUs where only a fraction of the VRAM is accessible from the PCIe BUS. Here you also 
> absolutely don't want to pin any buffers because that can easily crash when we need to migrate 
> something into the visible window for CPU access.
> 
> The only real option where you could do P2P with buffer pinning are those compute boards where we 
> know that everything is always accessible to everybody and we will never need to migrate anything. 
> But even then you want some mechanism like cgroups to take care of limiting this. Otherwise any 
> runaway process can bring down your whole system.
> 
> Key question at least for me as GPU maintainer is if we are going to see modern compute boards 
> together with old non-ODP setups. Since those compute boards are usually used with new hardware 
> (like PCIe v4 for example) the answer I think is most likely "no".
> 

That is a really good point. Times have changed and I guess ODP is on most (all?) of
the new Infiniband products now, and maybe we don't need to worry so much about
providing first-class support for non-ODP setups.

I've got to drag my brain into 2021+! :)

thanks,
-- 
John Hubbard
NVIDIA

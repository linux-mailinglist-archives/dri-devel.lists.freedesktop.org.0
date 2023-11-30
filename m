Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E3A7FEFBC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 14:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CC610E23E;
	Thu, 30 Nov 2023 13:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::602])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78CD10E14D;
 Thu, 30 Nov 2023 13:05:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elLFgo4ddWiNuoUaFf/1vAJ8QL+tTC3jf5hwtK2tCbQYy7MAJ+fQ7iMZCRTvTpTKOBMWgRTsczc9kRBL3AL2JC3BUjZG+Z8vtryRtekcQuCOTLAAULiY1HolzjA8gy9q6XEtQAYI9GEY7tF3+PNwGhdJNLkhcNtrrSBwjvtpf6gNI6BJprju0zgaspNGznwO9jnNt9nqOSaths+QGeS1uPxKzSiXMv87sOZfpI/t1sv0YaQ+kH1u0wZWXvIM2nGgeKA/XizFnFN/G1jJLGOMoFk1YLjLsncTAWJ3cayLSo4hgVY7FPk86uUTbQSA9H0Ui56ZiEHy2aMRVW06ngTwGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5ljo+I4GHSfI0eBrQN+X5dS9ikxE8htnu2s35i6yNc=;
 b=Wm9rOTLyanD8BvqGNxB1KLHeyY5v5h+1Xaf7x/cMmrw/fXiUrs/rLd5ZGjsIUKgAapaK6CoF/LnOW4tSvEsySHjPvbsoJpTz0XzV31KoSovmhQmXfqcGAabE9NSEWLu1RdRzvIeIrCpT0LLj1g2we4uRr4WPahAN+/2YdWojAbcvGXxZV0+EmB9aLl1J6/kUj0L7c4ZKHybKkS3Yr1FO9iL1svbX484FjCHYGnH5+e0P/BYD8u50I56IySRWFICZd/S+rsuo9rfF5EGVqdshQvaGLqKS6wFCov9TONIkOsf+0fidgVPTrCdktZPh8EOYbrcE9mR4Dbjp5dgYxJyWVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5ljo+I4GHSfI0eBrQN+X5dS9ikxE8htnu2s35i6yNc=;
 b=28d5QJ74xqceDD9Oqe/WBA0st9aJb2a8pNS4LHi6FUNpiNWXkM8JZv/oHIk1c+E4RQaYvUxguzfqAfXkH7SGhHCoo66NmR6KvQSj0gbXfvzhxm9h43DgPOhjrS1K6UOXw3A33mTopCp8eZR0herDZUw2eInyvjKp7toCvYekq7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5337.namprd12.prod.outlook.com (2603:10b6:408:102::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.26; Thu, 30 Nov
 2023 13:05:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7046.023; Thu, 30 Nov 2023
 13:05:31 +0000
Message-ID: <0973526a-ea8e-4a1d-8684-2d49a772c04a@amd.com>
Date: Thu, 30 Nov 2023 14:05:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory management)
 for external memory devices
Content-Language: en-US
To: zhuweixi <weixi.zhu@huawei.com>, Dave Airlie <airlied@gmail.com>
References: <20231128125025.4449-1-weixi.zhu@huawei.com>
 <9308a79d-e312-4e6d-98fe-75dc6d0fbeda@amd.com>
 <CAPM=9tx-d-Au_bjX0vYxv6OwqiSjmbbMC7ebWpTsQgFNddWDuw@mail.gmail.com>
 <a07fd33c6f9e44418c528de06f89707e@huawei.com>
 <8b3673c7-d0b9-4509-938f-eb8d4f158367@amd.com>
 <6f5d849a16084f68a2e24a7810eac433@huawei.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <6f5d849a16084f68a2e24a7810eac433@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BN9PR12MB5337:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f93a74-d7b1-477f-4e66-08dbf1a50830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tpWo7ozQ2bLWVz2eBuVedNolfIBExpagbNoPlOc/mb8t8Dqvtkz+YqyoBYeet76QWT2VfQxbcXde2ztWzCU5vFgUVxcvmDhMBWZZX8ZM3O50yfWdKHUkXuyIswZvm7yADKXS45VGWS0TvjQJvltwOaHWH7gdOShSIKY97l5P/I0As8vc/fww5SQecbBIrqXqwcHpSz7nNG3OeLT6hhkZwLP4cGctF7m48QCHTNSd6o3zLCbeBG6Z+sUj7AYaMoLo/SlfNHiOUyLVwLqkMyEC1VHBuyUVO4JuiIQAHLWRYCPd+cZ2496eGnKntb/3s8gN1Ytn3n+l3Fjs8UhbQ7TtlUv43l0CuvoW5MY2xPp02mZ1OPctY8mm3UMNj8sVd5rG0YwfZCvUziJlGU5zHlmbqmrti6G29Yp7Z9kKFses8+3GKDo0zuqp6lmzHimiI1AKOMXuze2SWBYXRyr+T+r8wmufMPd2LfrJlAGe+SeeghZVokeiFsdLk8cHDWIXnbpxqG35Ud7LDdRtdgwmvgTKSFVsuX3ik/8/iUaXhI/b1dpwl0H+mh8hnngryyEZ6ZwMwzmWdCaD3PtW+E71jjuGtcRmu3sE3HaukMTvTpiVqs4taJ9mFdNa4wT0kvKt2q4x6cCpRew6qzdQCn3P6eev31Uv0cUCxFdq2zqFVswd+UJc2aZe6Uww5BCgba9/XZJqDs6j96ShFqP/nhrcuyFOAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(230173577357003)(230922051799003)(230273577357003)(64100799003)(451199024)(1800799012)(186009)(31686004)(7416002)(36756003)(2906002)(41300700001)(5660300002)(30864003)(86362001)(83380400001)(6666004)(6512007)(53546011)(66574015)(38100700002)(26005)(6506007)(2616005)(45080400002)(478600001)(6486002)(966005)(110136005)(66946007)(4326008)(8676002)(8936002)(54906003)(66476007)(66556008)(316002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3EwemF5ajBHYmg4SWMvK0IwZk5sZlJpajdJaWJINTg3K1VpUzlwZW5yd1Zk?=
 =?utf-8?B?R1hmVUYrSFlTcElScUFBelhUUGxpcVZWMFBuMUF0bnpIOEVFWnFabGEzUVJl?=
 =?utf-8?B?QjVPT0RXUUVXWGV2N2pXN29BYjZrSFlzOSt3K3ZLenBpVHBUdE9pbWplcUJk?=
 =?utf-8?B?UUlCVDdFejlIWlR6aTRIdGs4Q1QyZ2ZBdnVSSngySEtEcVRRSmlBelM0YVAz?=
 =?utf-8?B?cmtDd015eXJtWE1yOUllVGNwTVUrd1B4RTRiZDhvZWhoQ2dVQ0tmd0hzTGpU?=
 =?utf-8?B?cUpmcVRDSmJSK3dZTVBhS1g5eVZvT3F3dGZnN3lUdkRrNnkrR1VEcWlEUWx0?=
 =?utf-8?B?b0F2eENITE9Ta2dmT2pQWmxTbWJlOGU1aDhyZ0JiOGp0L3ZsZlpWS3R4V1lD?=
 =?utf-8?B?Vzh6bFZvZ3hRbkRKa1FvSEtHaXlUSENMV3dMb3dwb3VqdVRwVzZqeWJPaEpF?=
 =?utf-8?B?N1pjbGxZRTVJaCtRRXJScHcrQ3JYbnVVVi93ZHV4NFp5cjNiUWpRMStyOURG?=
 =?utf-8?B?c2V5NFZjaC9vdjlNR0dHNmJxYjhVbkVVb1gwcTNEMFJUSjRVS3lucVVETnZy?=
 =?utf-8?B?QWdhM2pnb25ibWNiWkV0TTFKTzhqbkpUQ1lOQlJRMTNmWHUvdXgvaHlJK0lZ?=
 =?utf-8?B?VVhlQWY0UVlpWHgrU2Z6UUQyaTd2NG5JQ2dscngwd0ZSTFV2ZGRoeURKRUdv?=
 =?utf-8?B?cExuQzMyZGZ6OGJkK3pkc0pZenBaT1ltNHBiSmJaUTJKaGtLQjAwclFEYlpn?=
 =?utf-8?B?ZTFCVUVEdTZkNFJqKzd4Umh4a3NMdkxkRGo1azNJWHVrSFpFajVOZUFWTUtD?=
 =?utf-8?B?aTkzODVxcjZjeHpCNmt5bHdxWXZDZFVFMTc4WVVlOGs5M2NtaCs2V2VGaTNm?=
 =?utf-8?B?d2FobFJGemd0eUlXeGlOVE9jZEFhWE81Rm9jeUdMQ1NBaVRyMkFYZXRFa2g5?=
 =?utf-8?B?cGNCdG9zY3VzcVJqRVAwU085ZE0yb0I3MW1DUkF1OVVKR1hMSmVST0FFNnN4?=
 =?utf-8?B?MGxSbEV6Rm9ndFJGaXFJSW90czl4c2c2U0pZSUluWSs3UmpIajRvOWNtOHNG?=
 =?utf-8?B?a2pta1Z4ZFZvR1ZobzdycXdGeHoveFp1NVBvOXQ3QlJ2OGdkZHN1MEpOMmJy?=
 =?utf-8?B?UFZiRUdLVHBoMnhIMUpuUDlTd01ZVWlVWHlQNW1Kdm5NWjd0K2Q5OG14Y2Jo?=
 =?utf-8?B?UWZNMk11WWtuUGlNZytTQ3MyZTJ5c1QwZFlhaDFVcXFwUm4wbTErNnRYUk9z?=
 =?utf-8?B?WVRmRXljNlJaWXE5Z05PWkl2UmY1b0tCbEszMGhsSHJKL05RaDZKbU5lbjlV?=
 =?utf-8?B?OTlRd2YrWE5hTlF4ZDBRalFBd3hUV3pWUnBCRXAwbVhPWC9aYk1iTHl2T2hY?=
 =?utf-8?B?KzBqT0xlMHZnaTJNMnE2QzliMUYydjYwWDNhZ3Z0Vm5YNXhGK1BUb0V3cFI5?=
 =?utf-8?B?TjZNNGV3RUtyak9QZnRGTVlVR1JlK04rdHNMd29Xd3FtcnBtenJ2Tmo0QWdR?=
 =?utf-8?B?b0l5R2trZXl6MEszaHlBbjRUZXlYZ0VocTAxR2pSQnZQNCtaaUZ0MzNsMVh2?=
 =?utf-8?B?TFhIQm4rdXV5Tk40MmtoTzk3RWFIZmxkVHp6NjZ3eHkyMVJXYmdDVm9BYUVj?=
 =?utf-8?B?d3pvdXFWd3VvSTZwQ1N5UDlJN3lyZE84dVBzeS9DbVkyV3JZTHJLWjd5Ymx3?=
 =?utf-8?B?bnJUWmNMTkhmNHM3blhVQ3ROajhxZmptaVNKVHRCOUs0Mko3dVF1M1RBM2lt?=
 =?utf-8?B?aGVJbHpPcmxSc0s1eW1jMlVpVDhLdytmWDRtT3c0RjVmTUFSb0Fqd3k0WW1B?=
 =?utf-8?B?cXh5cnRzdGorMmZmL2lCR2FJM2p1S1hyaDRMVDJrbmNVYlhFVVpEQUhtSC9O?=
 =?utf-8?B?dFhZWXhCZDVoN0p4R3l4azErR0tML2ppUWxpdEozMVhFdXZUcmFxb0h2VGl3?=
 =?utf-8?B?YW11QUloN3lyaTNJV0VyclZiUUg3SUlNOXZTRDJvd0ZSRWxLOThQTGNIeVlP?=
 =?utf-8?B?bjRBbDZ0azZsVHlIMC9zemVMZ3owc0J6U3U4K081TWJPcW1yZ0UwNG1NekRm?=
 =?utf-8?B?RjJCc0JRN3lOeDRwMTRCRndkNEZubmpHMkFQTXJkdURaNVl3cDlTZVY3c0ZQ?=
 =?utf-8?Q?HREQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f93a74-d7b1-477f-4e66-08dbf1a50830
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 13:05:31.4151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyn2QcY1+N8KrDH7SNJld9noYcoGgl3Drjh+jSgqhDyBKl8ubgiDwwaErbeBL5S0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5337
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "leonro@nvidia.com" <leonro@nvidia.com>,
 "apopple@nvidia.com" <apopple@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Danilo Krummrich <dakr@redhat.com>, "mgorman@suse.de" <mgorman@suse.de>,
 "ziy@nvidia.com" <ziy@nvidia.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "weixi.zhu@openeuler.sh" <weixi.zhu@openeuler.sh>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "mhairgrove@nvidia.com" <mhairgrove@nvidia.com>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zeng,
 Oak" <oak.zeng@intel.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.11.23 um 08:22 schrieb zhuweixi:
> Add @Oak to the KFD discussion. I will reply separately elaborating your questions on GMEM's difference from HMM/MMU notifiers.
>
> Christian, thanks for pointing me to that AMDKFD discussion. I have read the discussion around the AMDKFD skeleton patch and found the previous discussion in the following URLs:
> https://lore.kernel.org/dri-devel/1405028848-5660-1-git-send-email-oded.gabbay@amd.com/#r
> https://lore.kernel.org/dri-devel/20140711154231.GB1870@gmail.com/
>
> I believe AMDKFD's original patch was rejected mostly because of inserting vendor-specific stuff to the generic core MM.  Jérôme has clearly stated this issue in the second URL. If the code is vendor-specific then it has no place in core MM, period.
>
> But why does that vendor-specific solution relate to a generalized solution like GMEM? The initial AMDKFD patch doesn't work for Nvidia or Intel.

KFD was meant to be a vendor agnostic framework, very similar to what 
you propose here.

It's just that it was seen as vendor specific because nobody else 
actually wanted to design the their drivers this way.

>
> In fact I think the rejection of the initial AMDKFD patch supports GMEM's idea -- there could have been a simpler AMDKFD implementation if the core MM was extended by GMEM. Also, after 9 years, there are so many other companies building their accelerators over the past few years, especially now the GPT-family has made a much bigger success. Don't we want to advance Linux's core MM for more friendly and generalized support for the upcoming new vendors?

Well exactly that's the big point: Absolutely not!

We really should never ever encourage people to bind their device 
address space to the CPU address space. This is a very special use case 
and limits the driver design to only this use case.

We have exercised this approach to a rather extreme degree with KFD and 
I can clearly say that doing this was a really big mistake.

As far as I can see you are about to repeat that mistake and even 
encourage others to do so as well.

> Now answering Christian's design concerns:
>
> 1. "There are cases that do not want to share CPU address space"
> Maybe, but I am not fully convinced. The current case we can find is when a NIC utilizes IOMMU for security. For this case, GMEM implemented a generalized VMA support and tested it with NICs using both Intel-IOMMU/Arm-SMMU. This cut 600 LoC of IOVA management code from the IOMMU driver, but it is still not included in this RFC patch -- I cannot find other cases demanding this isolation. The isolation is also unnecessary -- the NIC can enable the IOMMU SVM feature to share the CPU address space. As of KVM, it is essentially a host process that utilizes two different MMUs within the same address space, so it fits GMEM's design...

Maybe I don't completely follow here how you want to save LoC for the 
IOMMU implementation of NICs, but at least for the PASID/PRI support AMD 
just recently gone exactly the opposite direction:

commit 5a0b11a180a9b82b4437a4be1cf73530053f139b
Author: Vasant Hegde <vasant.hegde@amd.com>
Date:   Fri Oct 6 09:57:02 2023 +0000

     iommu/amd: Remove iommu_v2 module

     AMD GPU driver which was the only in-kernel user of iommu_v2 module
     removed dependency on iommu_v2 module.

     Also we are working on adding SVA support in AMD IOMMU driver. Device
     drivers are expected to use common SVA framework to enable device
     PASID/PRI features.

     Removing iommu_v2 module and then adding SVA simplifies the 
development.
     Hence remove iommu_v2 module.

As I wrote before this IOMMU V2 driver was basically binding the CPU 
address space to IOMMU devices using the PASID. For an example see 
function amd_iommu_bind_pasid().

This turned out to be not as useful as we hoped it would be. Essentially 
the use case where you want to give a device access to the whole address 
space of a process are extremely limited. That's why we are removing it 
and switching over to a separate SVA implementation which doesn't depend 
on the CPU address space.


But the virtualization use case I mentioned is completely independent of 
IOMMU. In KVM/XEN/etc.. there is a functionality called native context, 
basically what this means is that instead of passing through complete 
device isolated by IOMMU only specific kernel functionalities are 
exposed to the guest operating system through QEMU.

See here for an example how OpenGL is implemented on top of this: 
https://docs.mesa3d.org/drivers/virgl.html

This is actually using the separation between device memory management 
and CPU memory management and is basically a killer argument why those 
two topics should be separated. Otherwise it's impossible for QEMU to 
actually handle multiple independent device memory address spaces inside 
a single CPU memory address space.

> 2. "This does not integrate well with the filesystem layer in Linux..."
> To be honest, not using a logical page table for anonymous memory is why Linux THP fails compared with FreeBSD's superpage, but I am not going to elaborate it here. But yes, and I am looking for merging struct vm_object->logical_page_table with struct address_space->i_pages. This will make a natural support for devices oversubscribing both host DRAM and disks. As explained in my cover letter, struct vm_object borrows FreeBSD's VM design -- it provides a unified abstraction layer for anonymous, file-backed memory and etc.

I'm not that deep into this stuff, so leaving this to the experts on 
FreeBSD.

> 3. "Requirements to CPU address space management and device address space management are just massively different. For example huge and giant pages are a must have for modern devices..."
> I think you are asking two questions. First, is VA space a problem?

No, this is about something completely different.

> GMEM assumes that device VA space should be covered by CPU VA space (sorry i386), ...
[SNIP]

I'm removing this because you were talking about something different 
than what I meant.

I will try to explain the background on an example outside of machine 
learning and compute since this framework should be applicable to every 
use case and not be limited to those. Otherwise Linux would sooner or 
later just be applicable to only those use cases.

So let's take a look at how modern games use a GPU for example. On 
startup a rather large part of the GPU address space is allocated, for 
example 64GiB. Then the necessary resources (images, texture, vertices, 
shaders etc..) are loaded into separate buffer objects.

Those resources are then mapped into the allocated address on a page by 
page basis. So you basically don't have large VMAs which cover one 
resource, but rather the page tables are used as a remapping table
  into the available resources. This increases the number of virtual 
mappings drastically, it's kind of comparable how an anon_vma works 
inside a VMA on Linux.

Those mappings also are not setup at start and then used throughout the 
whole lifetime of the process, but rather done very dynamically 
sometimes resulting in thousands of mapping operations per second.

Additional to that devices have page table feature which CPUs don't 
have. This ranges from support for partial resident texture over flags 
how caching and dynamic color space compression is made.

So the mappings contain tons of device specific information and it's 
most likely not even possible to handle all of this with a device 
independent mmap() call.

> 4. "The argument that a shared memory management leads to less bugs has also absolutely not be proven true. Instead we literally spend month if not years hunting down bugs which resulted from interaction between CPU and devices."
> This is another case supporting GMEM. Don't developers want to let GMEM handle the CPU-device interaction so that they can waive months of debugging cost?

No, we already have HMM for that.

Regards,
Christian.

>
> PS, hmadvise() is based on the idea of Nvidia's cudaMemAdvise() which provides abundant and useful memory policies. HMM extended mbind() instead.
>
> -Weixi
>
> -----Original Message-----
> From: Christian König <christian.koenig@amd.com>
> Sent: Wednesday, November 29, 2023 11:22 PM
> To: zhuweixi <weixi.zhu@huawei.com>; Dave Airlie <airlied@gmail.com>
> Cc: linux-mm@kvack.org; linux-kernel@vger.kernel.org; akpm@linux-foundation.org; weixi.zhu@openeuler.sh; mgorman@suse.de; jglisse@redhat.com; rcampbell@nvidia.com; jhubbard@nvidia.com; apopple@nvidia.com; mhairgrove@nvidia.com; ziy@nvidia.com; alexander.deucher@amd.com; Xinhui.Pan@amd.com; amd-gfx@lists.freedesktop.org; Felix.Kuehling@amd.com; ogabbay@kernel.org; dri-devel@lists.freedesktop.org; jgg@nvidia.com; leonro@nvidia.com; zhenyuw@linux.intel.com; zhi.a.wang@intel.com; intel-gvt-dev@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; jani.nikula@linux.intel.com; joonas.lahtinen@linux.intel.com; rodrigo.vivi@intel.com; tvrtko.ursulin@linux.intel.com
> Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory management) for external memory devices
>
> Am 29.11.23 um 09:27 schrieb zhuweixi:
>> Glad to hear that more sharable code is desirable.
>> IMHO, for a common MM subsystem, it is more beneficial for GMEM to
>> extend core MM instead of building a separate one.
>>
>> As stated in the beginning of my RFC letter, MM systems are large and
>> similar. Even a sophisticated one like Linux MM that has evolved over
>> decades still suffers from an increasing number of bugs[1]. So,
>> directly extending core MM to support devices not only avoids opening
>> a new box of bugs, but also allows the community to concentrate on
>> maintaining one single MM system. On the other side, GMEM does no hurt
>> to core MM If a CPU process is not attached with device contexts.
>>
>> @Christian, could you provide more information on what AMD proposed
>> with KFD and why it was rejected?
> Well, this is going to be a longer explanation.
>
> The combination of KFD and HMM is based on essentially on the same idea as this code here. Even the initial KFD implementation was very similar in the sense that it added device contexts to mm_struct and tried to manage GPU/acceleration MM the same way as CPU MM. On other words it was basically identical to your gm_dev_create() and gm_mmu approach.
>
> As mentioned before this initial proposal was rejected, for more background see the discussion around "amdkfd: Add amdkfd skeleton driver" on the dri-devel mailing list between 2013 and 2014. You need to dig up the whole discussion from the mailing list, but summarizing it the general feeling was that it would be a mistake to tie device drivers to close to CPU memory management (and stable UAPI) without validating that this is really the right thing to do.
>
> So instead of the original implementation KFD has gone upstream with a much less invasive approach where a device contexts are just on demand looked up for each mm_struct. Felix can probably provide some pointers to the implementation.
>
> On the initially supported hardware the KFD used the PCIe ATC feature to allow routing of memory accesses directly into the associated CPU process address space, later on we switched to an MMU notifier/HMM based approach to give similar functionality to the userspace stack on top of it for devices which doesn't support the ATC path was just recently completely removed and we are now only using MMU notifiers/HMM.
>
> HMM tried to add similar functionality like you propose with the mmap() flag and hmadvise() call. The hmadvise() extension actually looks so familiar to the HMM proposal that I would expect that this is actually based on that code.
>
> All this turned out to have some major design issues.
>
> First of all you have a rather large group of use cases where you don't want your device to mirror the address space of your process. Just think of thinks like QEMU, KVM, XEN, in general virtualization and container handling. Linux has the mantra that everything is a file and if it's not a file it should be a file and when you tie device memory management into CPU memory management you are pretty much violating exactly that.
>
> Second this doesn't integrate well with the filesystem layer in Linux.
> For example we do have struct pages for HMM exposed device memory, but for I/O we still migrate this back to system memory because of (for
> example) the page lock requirements around writeback.
>
> Then third it turned out that the requirements to CPU address space management and device address space management are just massively different. For example huge and giant pages are a must have for modern devices, on the CPU side we are barely switching over to folios now to add similar functionality.
>
> The argument that a shared memory management leads to less bugs has also absolutely not be proven true. Instead we literally spend month if not years hunting down bugs which resulted from interaction between CPU and devices.
> ...
>
> There are a couple of more things on this contra side to that approach, but I think that would just make this mail unnecessary long.
>
> To sum it up from over a decade of experience working in this area I can just say that CPU and device memory management should absolutely *NOT* be mixed. We had those ideas multiple times before, but they either failed because they didn't integrated well with the core OS or the hardware support is just lagging behind the actual requirements.
>
> What can be done and where I completely agree with Dave is that having common components which provides device drivers with the necessary functionality to manage their device address space is really good idea.
> Danilo is for example working on a GPUVM component to have common virtual address space management and I'm at least sometimes working on MMU notifier/HMM improvements.
>
> Providing SVM functionality to your userspace stack is still a really good idea, but it should be done with MMU notifiers and components which are separate to your CPU memory management instead of tying it directly to the CPU address space.
>
> Regards,
> Christian.
>
>> [1] Huang, Jian, Moinuddin K. Qureshi, and Karsten Schwan. "An evolutionary study of linux memory management for fun and profit." 2016 USENIX Annual Technical Conference (USENIX ATC 16). 2016.
>>
>> Thanks,
>> Weixi
>>
>> -----Original Message-----
>> From: Dave Airlie <airlied@gmail.com>
>> Sent: Wednesday, November 29, 2023 1:15 PM
>> To: Christian König <christian.koenig@amd.com>
>> Cc: zhuweixi <weixi.zhu@huawei.com>; linux-mm@kvack.org;
>> linux-kernel@vger.kernel.org; akpm@linux-foundation.org;
>> weixi.zhu@openeuler.sh; mgorman@suse.de; jglisse@redhat.com;
>> rcampbell@nvidia.com; jhubbard@nvidia.com; apopple@nvidia.com;
>> mhairgrove@nvidia.com; ziy@nvidia.com; alexander.deucher@amd.com;
>> Xinhui.Pan@amd.com; amd-gfx@lists.freedesktop.org;
>> Felix.Kuehling@amd.com; ogabbay@kernel.org;
>> dri-devel@lists.freedesktop.org; jgg@nvidia.com; leonro@nvidia.com;
>> zhenyuw@linux.intel.com; zhi.a.wang@intel.com;
>> intel-gvt-dev@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
>> jani.nikula@linux.intel.com; joonas.lahtinen@linux.intel.com;
>> rodrigo.vivi@intel.com; tvrtko.ursulin@linux.intel.com
>> Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory
>> management) for external memory devices
>>
>> On Tue, 28 Nov 2023 at 23:07, Christian König <christian.koenig@amd.com> wrote:
>>> Am 28.11.23 um 13:50 schrieb Weixi Zhu:
>>>> The problem:
>>>>
>>>> Accelerator driver developers are forced to reinvent external MM
>>>> subsystems case by case, because Linux core MM only considers host memory resources.
>>>> These reinvented MM subsystems have similar orders of magnitude of
>>>> LoC as Linux MM (80K), e.g. Nvidia-UVM has 70K, AMD GPU has 14K and
>>>> Huawei NPU has 30K. Meanwhile, more and more vendors are
>>>> implementing their own accelerators, e.g. Microsoft's Maia 100. At
>>>> the same time, application-level developers suffer from poor
>>>> programmability -- they must consider parallel address spaces and be
>>>> careful about the limited device DRAM capacity. This can be
>>>> alleviated if a malloc()-ed virtual address can be shared by the
>>>> accelerator, or the abundant host DRAM can further transparently backup the device local memory.
>>>>
>>>> These external MM systems share similar mechanisms except for the
>>>> hardware-dependent part, so reinventing them is effectively
>>>> introducing redundant code (14K~70K for each case). Such
>>>> developing/maintaining is not cheap. Furthermore, to share a
>>>> malloc()-ed virtual address, device drivers need to deeply interact
>>>> with Linux MM via low-level MM APIs, e.g. MMU notifiers/HMM. This
>>>> raises the bar for driver development, since developers must
>>>> understand how Linux MM works. Further, it creates code maintenance
>>>> problems -- any changes to Linux MM potentially require coordinated changes to accelerator drivers using low-level MM APIs.
>>>>
>>>> Putting a cache-coherent bus between host and device will not make
>>>> these external MM subsystems disappear. For example, a
>>>> throughput-oriented accelerator will not tolerate executing heavy
>>>> memory access workload with a host MMU/IOMMU via a remote bus.
>>>> Therefore, devices will still have their own MMU and pick a simpler
>>>> page table format for lower address translation overhead, requiring external MM subsystems.
>>>>
>>>> --------------------
>>>>
>>>> What GMEM (Generalized Memory Management [1]) does:
>>>>
>>>> GMEM extends Linux MM to share its machine-independent MM code. Only
>>>> high-level interface is provided for device drivers. This prevents
>>>> accelerator drivers from reinventing the wheel, but relies on
>>>> drivers to implement their hardware-dependent functions declared by
>>>> GMEM. GMEM's key interface include gm_dev_create(), gm_as_create(),
>>>> gm_as_attach() and gm_dev_register_physmem(). Here briefly describe
>>>> how a device driver utilizes them:
>>>> 1. At boot time, call gm_dev_create() and registers the implementation of
>>>>       hardware-dependent functions as declared in struct gm_mmu.
>>>>         - If the device has local DRAM, call gm_dev_register_physmem() to
>>>>           register available physical addresses.
>>>> 2. When a device context is initialized (e.g. triggered by ioctl), check if
>>>>       the current CPU process has been attached to a gmem address space
>>>>       (struct gm_as). If not, call gm_as_create() and point current->mm->gm_as
>>>>       to it.
>>>> 3. Call gm_as_attach() to attach the device context to a gmem address space.
>>>> 4. Invoke gm_dev_fault() to resolve a page fault or prepare data before
>>>>       device computation happens.
>>>>
>>>> GMEM has changed the following assumptions in Linux MM:
>>>>      1. An mm_struct not only handle a single CPU context, but may also handle
>>>>         external memory contexts encapsulated as gm_context listed in
>>>>         mm->gm_as. An external memory context can include a few or all of the
>>>>         following parts: an external MMU (that requires TLB invalidation), an
>>>>         external page table (that requires PTE manipulation) and external DRAM
>>>>         (that requires physical memory management).
>>> Well that is pretty much exactly what AMD has already proposed with
>>> KFD and was rejected for rather good reasons.
>>>> MMU functions
>>>> The MMU functions peer_map() and peer_unmap() overlap other
>>>> functions, leaving a question if the MMU functions should be
>>>> decoupled as more basic operations. Decoupling them could
>>>> potentially prevent device drivers coalescing these basic steps
>>>> within a single host-device communication operation, while coupling
>>>> them makes it more difficult for device drivers to utilize GMEM interface.
>>> Well to be honest all of this sounds like history to me. We have
>>> already seen the same basic approach in KFD, HMM and to some extend in TTM as well.
>>>
>>> And all of them more or less failed. Why should this here be different?
>> Any info we have on why this has failed to work in the past would be
>> useful to provide. This is one of those cases where we may not have
>> documented the bad ideas to stop future developers from thinking they
>> are bad.
>>
>> I do think we would want more common code in this area, but I would
>> think we'd have it more on the driver infrastructure side, than in the
>> core mm.
>>
>> Dave.


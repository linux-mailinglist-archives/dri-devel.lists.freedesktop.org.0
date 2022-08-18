Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B44EB5980FA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 11:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4349EC897D;
	Thu, 18 Aug 2022 09:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B390C8942
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 09:41:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAHjXFMQEpsUyhhF1w1z/mJSZF8yzvRznPnFa8BoertMhkPEkz6eLND7yA6Jga3tk+NQSQ/wvN2fp9DLKAFFjaJtMgGTqk4UY9CAAsyN58G0ZfkAHBf8m/ZhltOqqCF3uIEEKaO61sSD49rTryNwMw+g/CqPqw2UYliPjBNMzR4YZn0Gtpycqkh1yJkobvy+AmY4e6EXsSrMK0/PbHT8MtEMP3MZ8hUWsYo7EVKD8T9fCJlIo+1hlUXhjHYJJqi4Gsys4RovREMNZuO9aVPi2yLcTR1rmdckIiL6iPb+cK0hcfEJCYw8cSDygxJwuRU0/TnUFNhrKy94gJ5alxzRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdBPYrSTj3WrTTpE0XCge+jc7BgLjh6h6rMVcET5qiM=;
 b=L9qEpTjl1G7xd9DzaLEOahUtohrnnR9+892M45XRM+31tGGYiu2+Uuq69cyPBqzrzVUhgE8cw7G17l4A+2eFkMHcHhaMRG9znKwhZkzYZQYG61H/wUgrVc7/yY30XYQUdvyedsJxEft8iD2mtT/WsKujmpZa1kPjaAwfT6o5ahUkynM4x/oeK4BQ+XTxsxeBPh2jReezGDLVIK89VktBeoITSz4R85fFzaDgNqlTmiW7lwSVyYS8rNdhxKYawzCEc2JypwdRpX22PcG4uRGlT4+UoaB9uGO7vN4e2wbnJE1Sr5wDILWFvSfhSJZrqXsg0vV/Ky/hs3dUHnDvoxZ83w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdBPYrSTj3WrTTpE0XCge+jc7BgLjh6h6rMVcET5qiM=;
 b=bOjGFHbo+kWlZjDKMyH5nJRosD5tlhA6qepQ6h4ElAjdocRauIpHFO0/YcAY2jYEDfnNKvKzCVc6ivEEhUfXn56y38ZCO4yz84l9rDO7ZJMiSs7hWeK0OEZVuSy01R5zfZUUmabnVkcI//BsVGNE4Gwpx8RrXJ4fjlg9ANtChrY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB3230.namprd12.prod.outlook.com (2603:10b6:208:108::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Thu, 18 Aug
 2022 09:41:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Thu, 18 Aug 2022
 09:41:22 +0000
Message-ID: <b1963713-4df6-956f-c16f-81a0cf1a978b@amd.com>
Date: Thu, 18 Aug 2022 11:41:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] drm/ttm: Refcount allocated tail pages
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Trigger Huang <Trigger.Huang@gmail.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220815095423.11131-1-dmitry.osipenko@collabora.com>
 <8230a356-be38-f228-4a8e-95124e8e8db6@amd.com>
 <134bce02-58d6-8553-bb73-42dfda18a595@collabora.com>
 <8caf3008-dcf3-985a-631e-e019b277c6f0@amd.com>
 <4fcc4739-2da9-1b89-209c-876129604d7d@amd.com>
 <14be3b22-1d60-732b-c695-ddacc6b21055@collabora.com>
 <2df57a30-2afb-23dc-c7f5-f61c113dd5b4@collabora.com>
 <57562db8-bacf-e82d-8417-ab6343c1d2fa@amd.com>
 <86a87de8-24a9-3c53-3ac7-612ca97e41df@collabora.com>
 <8f749cd0-9a04-7c72-6a4f-a42d501e1489@amd.com>
 <5340d876-62b8-8a64-aa6d-7736c2c8710f@collabora.com>
 <594f1013-b925-3c75-be61-2d649f5ca54e@amd.com>
 <6893d5e9-4b60-0efb-2a87-698b1bcda63e@collabora.com>
 <73e5ed8d-0d25-7d44-8fa2-e1d61b1f5a04@amd.com>
 <c9d89644-409e-0363-69f0-a3b8f2ef0ae4@collabora.com>
 <6effcd33-8cc3-a4e0-3608-b9cef7a76da7@collabora.com>
 <ff28e1b4-cda2-14b8-b9bf-10706ae52cac@collabora.com>
 <48b5dd12-b0df-3cc6-a72d-f35156679844@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <48b5dd12-b0df-3cc6-a72d-f35156679844@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae2365c8-0189-4d47-509e-08da80fdcf2e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3230:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: COcJmbnyKVW66i3ZLRmFFNfkWy6jrYJ14uCsdH2TAfHukAdXyzwxsTKoN3wDMR1ZtUhxITlniJkFrHYuTaVjKUFOSVpSaMGDZiLEqOYB4+FS5gxGD2X6ZU9rwk03XYNOFl38slWwMtuiNQPAHSJSJNqOA4UFtm+vGeiTRoXq2Md/w1Gxi+zT9obMXi5Ewqh/AvsiQI5tTNF1Ww1HY6SODevJVsBahOwrSP6ktLM2Hx6NiEtyIJHZLG1cgocpjReGKbXeiu0VVjur7XMUxmCp3WW4NCsRRhhCjosXpJcI3p0Cka+7MDc+vxjzMCU1zC+p8cAkEJJAoARY1hljbe9aulcgwk4Gg5+TABfiQHtwfLqHm4QbrfSTS1QnGL/5ESwk/sos0g9azbQH+UObdRL01BZsifuu58Ij6m33xaEMjg8E69vF9McxXJoRUkC+LTQv2ZyL93gQd/Najjrh2AS0QPLrwF08EBcY04mkVi1NgyOYL6IngKUAB9W5GJ2ZmUfL9XqTX2AkrJ4HN0/UvyYcSFjAM+3EUkkFki+kvffXbVt4d5WNxbNudev3ArOEz/1v2u7mxpEZy0fOdZ/5nal0497D37U57HOy9cRlUz7BngyCeuxaLWGMXQ3xCGrfO5/vOVD7mKVW8MYxBIg7TvYv9fxPtZSPyGX3RNGo7IcMjLStFljr0PSLFniozpeytN2LYX566kx60Wy98J3u/jBN1YrL+WT/AYcChLtWntyljMlBkQsyzBRXtZy7j/lnBrTXsJTToFNsh099neVJCuvAfAJ5H8+Ch2JBMckBlLjsUs9z5xY1UKE//wI5+QCA192WxUwmEjBLAQgbVcXVIpXjeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(86362001)(2616005)(38100700002)(186003)(66574015)(83380400001)(8936002)(5660300002)(8676002)(4326008)(66946007)(7416002)(66476007)(66556008)(6666004)(41300700001)(2906002)(478600001)(110136005)(6512007)(26005)(6506007)(53546011)(45080400002)(966005)(316002)(6486002)(31696002)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHJCVmVGaml3dTFQUG9qbk1IYmhrWDFPc3JNQmxVQU1LVXBEelJXbHZwNUVK?=
 =?utf-8?B?SVkydU9hdlg5OTJNb0VpU0xsV2dWeHVvNjlIQmg0VnZkVHQ1N1RHOXBUU2ds?=
 =?utf-8?B?Ymw0d0M0WC9GaGs2RTVyVGxzTmZsZStzUSs0bUhRMDhCSXFycy94ZkFkMUVp?=
 =?utf-8?B?MnlLT1YwM09nV1pxMUhycFViUXRsZjNkdThTcnRDQTdqczZPUWdUQk1BUStC?=
 =?utf-8?B?ejBneFpxMC80Mk5XRFdzY0ZFQ004d1ZPVzd0WEhMREhIcWZDQy9xSTIrU1RK?=
 =?utf-8?B?ZXBnd1RTSFhyZU90a0RaeUZjZkZGc2E4WS9RbTZmaDI5Wmc2dktxeHFFa1pV?=
 =?utf-8?B?VFhKTXdSOGVoQ2tpWW9jRkQwN0tqY0pHcnh3akVVR1NDNFcwU1Q0ZTFlVEpl?=
 =?utf-8?B?MzdUZmEycjJzYndONCtxd2pOK0RrS0VBYUJDODdaaW9aMmZHemlCNkx3aExi?=
 =?utf-8?B?YU41N3pIY0E0aWhXdFo3MVlnK2JuQ2NURlc2b2h4MSsyQ1dlWkExTktpblBr?=
 =?utf-8?B?NFhQZjVkTXY0U0J1UVFGNjYveFZxQ1hLQytMZmE3eVQwVTZ3dHRHZWlwK1F4?=
 =?utf-8?B?eXJHMW12KzI0VnJjWHFQL0RZbC9oT2gveXlDZWhXUDUxaExRTGNQQmtwTjd3?=
 =?utf-8?B?ejVEYTBBT0JjOC9OTU5oQWFqTmsrb0Z4TjdOQTZCMDF0b01YVDJxUTJiZC9q?=
 =?utf-8?B?NnRsclB2eUVkcEdsTUYyWnAxMFZKemc4WlF4Z29CMkFDbEFqYVFjeVFmVjhy?=
 =?utf-8?B?YitYOHMyeTZnQUFNKzZMekE4ZE5uRHJhSHZNSmFiTGlsVGRlR3JGMXVGd3lz?=
 =?utf-8?B?a0lWNGZxVUI1VFIzSDR4NmIrWUZiSFcrenc4ZjlTZ3Z5bzRIOWM5ZkFqZ1Rx?=
 =?utf-8?B?a3haZUJEZC9ncFlhc3NidExyUnhKSjRKVW9odDQ2VXYveDN2UnVabk9CK2xF?=
 =?utf-8?B?Nk91QmczcVBZVGpoMnBjK1hzMlJySkRabmE5WWYzOGlYckRaVmtmSlRaQjNt?=
 =?utf-8?B?SCtMakE1cU0zdWhwaXpCa0tQS3dQK29DTmRMaGdzWEtyVlI1MjhHNXZpeE9Z?=
 =?utf-8?B?aUJnRnhlRGVVdzU5cXhuWmxwVWtMdkd5cFJGaXNGbnNLY3dURnlwK2ZocFNF?=
 =?utf-8?B?c0xRK1lDTU9IQlVrVmtiRkVNcE9BTDFiSEIvTzZoY09tbzZtZWpaMFNBQ2wy?=
 =?utf-8?B?ZVJwaXl6TDJudEtiZDNMWVRITlFQeUViU0x3Mzd0Y0czOHBKUDk3WVRZOUVp?=
 =?utf-8?B?cmtVVG5FeGRqTjlSdUxmZVRyNkY0eTNJUDFhd1dpZTJXY3dDYldlNmNyZHF4?=
 =?utf-8?B?M1EwL09EeWZqdHEzOVExS1FwamZWQUdiN1J2OUhvNkhxYmVkT2NPakowMURM?=
 =?utf-8?B?ZWVnYmwrc2oyQmJYdjRXWUgwZTdXa1dOc013TVF2bEY4YVorU05oczZIOXdP?=
 =?utf-8?B?TTNTMW5rUCtYd2t6VjhWNnRLSmZIT2pQRzIzK3piSlk1WW1RN0NNRGRvRkdB?=
 =?utf-8?B?YXcyaXVqQ3lsUjhHZkNESEdnSjl5NmVlVHJ4TjJlVVl6c3ZIVUVqbTVFeCts?=
 =?utf-8?B?RE50Ym5nV3I3N0JRZkNSbWlpMXNHbVJzNnEvRnJ0OEg1MFVMazRDRXIwT2V3?=
 =?utf-8?B?d1ovYmNzSkFWYWZpZUNVMjN1cWE3ekFaYTJNa2NlY01Bc053SzQ0dXoxSEcw?=
 =?utf-8?B?RFBaR0hidUM1YUptYlVHS1E3Q1NtdXQySU1iMkFVeG9TVm50b3pkTGpRN21m?=
 =?utf-8?B?dWRnQXBabEVhU1Z0c0orUzZkQ3RRSHIrQjdpR3pmRUhOSGwxTGp4VW9HWW5O?=
 =?utf-8?B?S1pUKzRQSWJzc0tCNWtDcHV3ellFWjBNdEhmRVYva1kwVE50UytRS242RnRC?=
 =?utf-8?B?RFppcnBEdU9LcEZwTjBicFpLYkxzY2hBWDQ1a3Fwa0JMQUNJSkd3UWM3b2ZW?=
 =?utf-8?B?TExyVHdmR0FCeWcwTkRDdEdZT3c4UFZsMHNKUTZlUnNYUXd0TFpWc1d2SzVa?=
 =?utf-8?B?Z0pmaFkrdTRKNU54OHo3TkZQS3Z3RUZJeWNEdndxN3ZaOWptb0lUb2tWbk1Q?=
 =?utf-8?B?UkRlN1VEWEY5d3VTUUluNGIwdkdHdVFmeHRObHQzOVVKV29iWTR3dncrbXJs?=
 =?utf-8?Q?eFY9ulELUArMdj1Q9+2hW15lz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2365c8-0189-4d47-509e-08da80fdcf2e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 09:41:21.9690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lk3gcADAafiKTmeTI/2Mdcv6l5OlHtCnTqf41jlFdxECds9YwOTXyceSPSG+lTE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3230
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.08.22 um 01:13 schrieb Dmitry Osipenko:
> On 8/18/22 01:57, Dmitry Osipenko wrote:
>> On 8/15/22 18:54, Dmitry Osipenko wrote:
>>> On 8/15/22 17:57, Dmitry Osipenko wrote:
>>>> On 8/15/22 16:53, Christian König wrote:
>>>>> Am 15.08.22 um 15:45 schrieb Dmitry Osipenko:
>>>>>> [SNIP]
>>>>>>> Well that comment sounds like KVM is doing the right thing, so I'm
>>>>>>> wondering what exactly is going on here.
>>>>>> KVM actually doesn't hold the page reference, it takes the temporal
>>>>>> reference during page fault and then drops the reference once page is
>>>>>> mapped, IIUC. Is it still illegal for TTM? Or there is a possibility for
>>>>>> a race condition here?
>>>>>>
>>>>> Well the question is why does KVM grab the page reference in the first
>>>>> place?
>>>>>
>>>>> If that is to prevent the mapping from changing then yes that's illegal
>>>>> and won't work. It can always happen that you grab the address, solve
>>>>> the fault and then immediately fault again because the address you just
>>>>> grabbed is invalidated.
>>>>>
>>>>> If it's for some other reason than we should probably investigate if we
>>>>> shouldn't stop doing this.
>>>> CC: +Paolo Bonzini who introduced this code
>>>>
>>>> commit add6a0cd1c5ba51b201e1361b05a5df817083618
>>>> Author: Paolo Bonzini <pbonzini@redhat.com>
>>>> Date:   Tue Jun 7 17:51:18 2016 +0200
>>>>
>>>>      KVM: MMU: try to fix up page faults before giving up
>>>>
>>>>      The vGPU folks would like to trap the first access to a BAR by setting
>>>>      vm_ops on the VMAs produced by mmap-ing a VFIO device.  The fault
>>>> handler
>>>>      then can use remap_pfn_range to place some non-reserved pages in the
>>>> VMA.
>>>>
>>>>      This kind of VM_PFNMAP mapping is not handled by KVM, but follow_pfn
>>>>      and fixup_user_fault together help supporting it.  The patch also
>>>> supports
>>>>      VM_MIXEDMAP vmas where the pfns are not reserved and thus subject to
>>>>      reference counting.
>>>>
>>>> @Paolo,
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F73e5ed8d-0d25-7d44-8fa2-e1d61b1f5a04%40amd.com%2FT%2F%23m7647ce5f8c4749599d2c6bc15a2b45f8d8cf8154&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Cecb0f0eb6c2d43afa15b08da80a625ff%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637963748360952327%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=52Dvisa7p%2BckmBxMvDJFScGSNy9JRPDdnPK05C%2F6n7A%3D&amp;reserved=0
>>>>
>>> If we need to bump the refcount only for VM_MIXEDMAP and not for
>>> VM_PFNMAP, then perhaps we could add a flag for that to the kvm_main
>>> code that will denote to kvm_release_page_clean whether it needs to put
>>> the page?
>> The other variant that kind of works is to mark TTM pages reserved using
>> SetPageReserved/ClearPageReserved, telling KVM not to mess with the page
>> struct. But the potential consequences of doing this are unclear to me.
>>
>> Christian, do you think we can do it?
> Although, no. It also doesn't work with KVM without additional changes
> to KVM.

Well my fundamental problem is that I can't fit together why KVM is 
grabing a page reference in the first place.

See the idea of the page reference is that you have one reference is 
that you count the reference so that the memory is not reused while you 
access it, e.g. for I/O or mapping it into different address spaces etc...

But none of those use cases seem to apply to KVM. If I'm not totally 
mistaken in KVM you want to make sure that the address space mapping, 
e.g. the translation between virtual and physical address, don't change 
while you handle it, but grabbing a page reference is the completely 
wrong approach for that.

Regards,
Christian.



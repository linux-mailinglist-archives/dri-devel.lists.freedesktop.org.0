Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B240483FB9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 11:19:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67CE10E520;
	Tue,  4 Jan 2022 10:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2043710E50D;
 Tue,  4 Jan 2022 10:18:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6B9qV19V5viniQzziNpuoOsd5UX86v7B/0lkCRe3TpwSogu/b/J/8yzjT/amG0fEj5VqXAM4/iOQEJlFsizxM1MDDOX+Y204MWn7HG4RE5aZ156e9E4uNHCwOcH12daTDbF1pLzo8l6D3EZCXeKZy9pAaeUY5pmyxYrsXVT3/XvlbUhr3Zbw/6J9gZX+TWtVLwRCQQH+5EBVRd6AX1Pgi/kx/aOC1jju5+9p5Ba/JCqDKz3TztzhsExnq2u8zE0vdpsKKwn1Ae5Zysn+hh8VBXJTrTRPuF4erLkQOA3AOu0Kw8jBPKl9PFfxMbmCpV1gYYLuZXnVDk/zlUczBsW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbuMAZcAC8KD+uiWncn9zbVtcEl8+m8PvgpJ6huMhv8=;
 b=fl659p8FX4GLu93b6Rt2oFoE9tiFp212yvXvW7VCctw9hBEkRegno0ILztgRiSmfxttXEUPgbX+tYKqLGJ/mR23Ju8PbKbbv3G09CPRIQTdjdT2H1xkeSUXE3nAuSqGVLiVlZsREKtsZqdbsq/RaUXxEWPWXlSw25yKCb3BB0nIdZYTnoM6DEs9EkaIYiL9XPWPepdGfaPpofmpDyCkBUCp3lDc58PA1HSop5E01v5NytxpS61bPFv9JhitvPKBmApg/LiS0353Y72D1N5h+iVJlmS+jwQFVtvo4hFBRzt1z3SNzOcwiTuzUN2as+Ojz0N5ixLDWnQ+vzuQw/JKOrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbuMAZcAC8KD+uiWncn9zbVtcEl8+m8PvgpJ6huMhv8=;
 b=AamVJ0FPL+3EeIM65V5vwMwU5hAjAaXTJW02bs9eZXuwtclL9C9p5LHhL5Mk9GElwngMYhPDvntVwWGGxM8D6/EgR8lVXGhEh55Agbjm0kZl4IQj0jzVlnZWPIN6ZDVnlPd+HD6xI5GGJdLj93DW69mQvrYMncPfKaF2HF0Deas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB2477.namprd12.prod.outlook.com
 (2603:10b6:300:e6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Tue, 4 Jan
 2022 10:18:53 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 10:18:52 +0000
Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
To: JingWen Chen <jingwech@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Chen, Horace" <Horace.Chen@amd.com>, "Chen, JingWen" <JingWen.Chen2@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-4-andrey.grodzovsky@amd.com>
 <9125ac3a-e578-6b34-1533-7622ec0274f1@amd.com>
 <BL1PR12MB5269AE1B82F1D07433B95B59847E9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <PH0PR12MB5417F12B403B8181D5CD03988F7F9@PH0PR12MB5417.namprd12.prod.outlook.com>
 <cc8e296d-360d-9a2f-85cd-f47d55581e99@amd.com>
 <f5ba0a69-1cae-7d8b-bfe7-4e4400e9c32a@amd.com>
 <2dee6f65-9ca9-a332-7206-f24021fb4c44@gmail.com>
 <b5a31f18-262d-951e-2530-bdb0738e5033@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <20363a4e-b282-232d-34d0-14867bad4931@amd.com>
Date: Tue, 4 Jan 2022 11:18:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <b5a31f18-262d-951e-2530-bdb0738e5033@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS8PR04CA0073.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::18) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfd130a9-ed0c-46c1-0d1e-08d9cf6b9af5
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2477:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2477C6FBE738A4BAAF238962834A9@MWHPR1201MB2477.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lwn3937ZLAqS0fLEteV987W7ohaQ3Ga6ddRmciz5UPEg1/ng/GviaHup4wDtAc2RUeZIKsvdHn/HnQnWP41pCrGIlV3aJ4BJjrhDmCKTRrvtmtE+jVxMNUm9mORhIXcETQJgAmk+a2Rjct5WvWJxbpXI1gD/d8O6EYUhZz5WaFc7WD6nxTNCscdNDwGsQ7OFEM9AgIulBdFjQ7EYDM9TUh73CiT6IxX/iG0Ws6+7APc3Zgrzq3eDzS3JL9ZVDN7vNibTJ6dbBXRlRVkcm6hoA3Vw6xeOxtBPqu6/exqk1PHBETT6QJXpfBVSIOpXKxGpznaadtRdBE3Fw+NlPHCGoDu+aS894TC8LQbfue4nkpA2NPkvtRobBFU9tzgePN4JtaNpBfBAF3zSssy8WUGvteWSsrdZvz0ne+zaD78/GZ0QMOWoySyje+45VIMKsru4VLTCX/GnLWVzb0Xrl1AK8or++yb5aETKN1yDiHdByQbDlqpMQOKuqOxN+68hD5lnYcpja2D8Trgq3dO58LTMRxu/CA46nw2RJ7b8VlHyTnoJT3Q+ARE9IMJAIi0zl24f99xop07bb0jxh3EAacE8TWmP+TKJFcnUqGRezJslpLtmX5azKEtxl0Tl7gMvfSzZGMfut1Xim7BQym/+x3L4cK1j/Imwyvo6ctZw1GDnvuHr3EY2ovdD4XcYcc724kkCZ2+zh0jcOuTgxMCXcqQAy2CWw9lecZpuxQksSITot+TM91e2WxcsnFixWcia+GJn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(186003)(36756003)(5660300002)(6666004)(53546011)(8676002)(31686004)(8936002)(6486002)(508600001)(66556008)(66476007)(4001150100001)(6506007)(110136005)(66946007)(921005)(316002)(6512007)(38100700002)(6636002)(2906002)(2616005)(66574015)(31696002)(83380400001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blZ5SkdneDFaL0hlWGZuaFlXMDVPd3lvNC9neDB2cUEram00MUZGRWhEWWRK?=
 =?utf-8?B?NFpHVDNBL1E4bGJtaFB6c3lrSlRsN2RmakdJelNMcEJEVldKNFJtcUJVNm9D?=
 =?utf-8?B?aFJTRkZ3cC82bUhQTnhFZ3RZSC9WWXpKbEQ2Qm9MU3FOQXFoQkVlTVZSSktL?=
 =?utf-8?B?QzBmcTVlL2ZGeEE4NUxWR2NXekVuMytrU1ZmSHQvUDFOakg4a2I1TXJMdTRL?=
 =?utf-8?B?eFFvV2Rva3NVclROSm02TXVzcUszd1VhaVVJbW9NNHpDdnBJTWRoMndoYjBl?=
 =?utf-8?B?UFdqZlpHOHErOGM4OFkza2dtT0JldnRoNnBEMFR0Vk96Ym45T1ZKaC9UdXJ2?=
 =?utf-8?B?Sk1RaEJHYlpiQWJRNWhIUlA5UHkydHljVE9DMnp2WlFrbTV1d1BvTU1lUUcz?=
 =?utf-8?B?TzIyTUdrRWUydkNEaW1iTUl0QWwxTTN2TWFTcHVhZ3ZSUVllL0VCcGZGZk13?=
 =?utf-8?B?cmc2LzYreGJCeFB0T21QcUVjazJOV3BjZTVyYVU1blFDTVY0aGh5V2FOdEZZ?=
 =?utf-8?B?UTNtNmNIMGZwMTRGSjJBbmRRdXgzZysyaHhqc1JXaXl3cTRyVXdRZnRFb24r?=
 =?utf-8?B?bHJmNUpsd3FkaGlvcWZ4UDlySjJIM0tQVkh1N08vczB4UmtZazNwNmhPZEFP?=
 =?utf-8?B?eWZkTDltUnJsY3FPMkc3dUh3WU9tUFBmNDRTVGZKcitCYzNyV3d1ZGtZOTZv?=
 =?utf-8?B?eXdZcy9seURnZkpDWHpCdmdiVU1QamlJT0MvK2lJTlM5Zm1ROEIwVTdMUTRN?=
 =?utf-8?B?MmlNNXUvT0FPSXNkckVNd2tFbXhPMkV3M0c0cEJFLzA5NzRKZTRWaUZaaXdB?=
 =?utf-8?B?Z1ptZEI4bE9INUlnWlJuUWRsRk9xMFh2dlM4Q3VhWnZYRDVCeUxtL0xTamk1?=
 =?utf-8?B?K3l6elVTd3R0YVR1MDNWNm1QbWw3dE5NbmFGMURJOUdBYWc3VlEyTGVnVSt6?=
 =?utf-8?B?cTNaMVJBQ1lXWTk4NjJaRDdSZjJ2WEpRL3ZMdGd1aitVQmVUcDVPUWhYaXV5?=
 =?utf-8?B?ZkpFQVVGNjh4dTVZT3l5amFvbml3Z3dCejlFVGhxYkY5R0JFdGxCa0FBSVpm?=
 =?utf-8?B?QmZuUDJtSFlXR1VUUmZIWmIwUG5DRWZIMlBIRjRRcU1VMlpMNDd2b2tuVHhJ?=
 =?utf-8?B?cUhrN1I2cUdYYXpBd1RQRWJ6U1ptTy91V09rMlRRN25PWjlpcW44YkhoSnVS?=
 =?utf-8?B?ejdwZzhoUWFGd3dMdzN5ZytzVTVhV1IyMzlndElpSWE4VEtzM212NkNKQlVB?=
 =?utf-8?B?NUhSSThPbitIQk9yYjJScVpqZmJUV0JRL253dit0K1Baa1dVSnBkZGZoUlFm?=
 =?utf-8?B?a1ErcGtYZFI3TzhmeXV4Vjl6NXpCNWFIR3laSk5CZVBXRFFsVXFodXBjTUk0?=
 =?utf-8?B?YWFrbWt6SHhyK3c0SnBOVVQwSWloKzcvVG1UU1BtYW1tVW1sSUs3SS9hbGZn?=
 =?utf-8?B?NWp4cDlqakthaEMyOWk1UVBxQW13UmExTmFLMjdadllNM1VrWVFRQW42NWNl?=
 =?utf-8?B?OEhybWl3WWlZT0d0aUt3VkxvZ2g0bUFnQlF1YTg0NUNxaXVmckNZcnpjUGs1?=
 =?utf-8?B?MC9kOEpqWUFUNG5weGtFM3JZYW03c2RXeUd4QjAvYVlJdktFZW8yRGhQY0I5?=
 =?utf-8?B?TlR1dzZPUEhtOWdiV2tUMmpYNy9vQURmUWNBN3pwOUVpcnhyK09heWs4Unk3?=
 =?utf-8?B?REQrOG90eDBaY08wOXlQcFhoNmNGcGFlWGJoNXhta1hlUXJTUEJpWlJlVGdv?=
 =?utf-8?B?aDlFMTVEbTFVSTdpbk1CNzZUdzBsand2M01oaDBGNnZJSVlnRkhacHpzVzhx?=
 =?utf-8?B?TE1sWlBGMzZ5RkZtMnd0WnBGMzhUR09lYkVkdnRKSk5BVUQ0SkNTc1JZcUhR?=
 =?utf-8?B?MWlNTTR3MVU2WmZ0Mm9lTFNDa3BPNytNZndlNk14ckJNR09NRUFmdndnbWhy?=
 =?utf-8?B?MUJqaWttUjkwRjRmSnVsV0ZveTNmNk5TNHV2YWV2dWpaWFhoODhwNnVQb0dL?=
 =?utf-8?B?dzhFMm5xTTBVTmFsVk1LQU1vaXA4blRCL25mbW1OSFdGajF2MzV6MTVTNDds?=
 =?utf-8?B?V2FtTXdUWUJXdGwrL1gvcEtFTFJDSGFGbm1MSGxhTEtBYWgwdWhLYit0bkpP?=
 =?utf-8?B?NmpTeVRoL2tlMWVwSWx0STlrRlg4NjkzejZNelVaWVJJa2hENnNsMENlNnN0?=
 =?utf-8?Q?uG0KssZ8ICJ86RGB8noRZpg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd130a9-ed0c-46c1-0d1e-08d9cf6b9af5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 10:18:52.2680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbgNXQLrHWmXGRvIT0xMzPqHwSibukHlrZqTRWd/Gs41TqR/Az+0ti0Y1Ju1Ms83
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2477
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

Hi Jingwen,

well what I mean is that we need to adjust the implementation in amdgpu 
to actually match the requirements.

Could be that the reset sequence is questionable in general, but I doubt 
so at least for now.

See the FLR request from the hypervisor is just another source of 
signaling the need for a reset, similar to each job timeout on each 
queue. Otherwise you have a race condition between the hypervisor and 
the scheduler.

Properly setting in_gpu_reset is indeed mandatory, but should happen at 
a central place and not in the SRIOV specific code.

In other words I strongly think that the current SRIOV reset 
implementation is severely broken and what Andrey is doing is actually 
fixing it.

Regards,
Christian.

Am 04.01.22 um 10:07 schrieb JingWen Chen:
> Hi Christian,
> I'm not sure what do you mean by "we need to change SRIOV not the driver".
>
> Do you mean we should change the reset sequence in SRIOV? This will be a huge change for our SRIOV solution.
>
>  From my point of view, we can directly use
> amdgpu_device_lock_adev and amdgpu_device_unlock_adev in flr_work instead of try_lock since no one will conflict with this thread with reset_domain introduced.
> But we do need the reset_sem and adev->in_gpu_reset to keep device untouched via user space.
>
> Best Regards,
> Jingwen Chen
>
> On 2022/1/3 下午6:17, Christian König wrote:
>> Please don't. This patch is vital to the cleanup of the reset procedure.
>>
>> If SRIOV doesn't work with that we need to change SRIOV and not the driver.
>>
>> Christian.
>>
>> Am 30.12.21 um 19:45 schrieb Andrey Grodzovsky:
>>> Sure, I guess i can drop this patch then.
>>>
>>> Andrey
>>>
>>> On 2021-12-24 4:57 a.m., JingWen Chen wrote:
>>>> I do agree with shaoyun, if the host find the gpu engine hangs first, and do the flr, guest side thread may not know this and still try to access HW(e.g. kfd is using a lot of amdgpu_in_reset and reset_sem to identify the reset status). And this may lead to very bad result.
>>>>
>>>> On 2021/12/24 下午4:58, Deng, Emily wrote:
>>>>> These patches look good to me. JingWen will pull these patches and do some basic TDR test on sriov environment, and give feedback.
>>>>>
>>>>> Best wishes
>>>>> Emily Deng
>>>>>
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Liu, Monk <Monk.Liu@amd.com>
>>>>>> Sent: Thursday, December 23, 2021 6:14 PM
>>>>>> To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey
>>>>>> <Andrey.Grodzovsky@amd.com>; dri-devel@lists.freedesktop.org; amd-
>>>>>> gfx@lists.freedesktop.org; Chen, Horace <Horace.Chen@amd.com>; Chen,
>>>>>> JingWen <JingWen.Chen2@amd.com>; Deng, Emily <Emily.Deng@amd.com>
>>>>>> Cc: daniel@ffwll.ch
>>>>>> Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
>>>>>> for SRIOV
>>>>>>
>>>>>> [AMD Official Use Only]
>>>>>>
>>>>>> @Chen, Horace @Chen, JingWen @Deng, Emily
>>>>>>
>>>>>> Please take a review on Andrey's patch
>>>>>>
>>>>>> Thanks
>>>>>> -------------------------------------------------------------------
>>>>>> Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>>> -------------------------------------------------------------------
>>>>>> we are hiring software manager for CVS core team
>>>>>> -------------------------------------------------------------------
>>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>> Sent: Thursday, December 23, 2021 4:42 PM
>>>>>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-
>>>>>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>>>>>> Cc: daniel@ffwll.ch; Liu, Monk <Monk.Liu@amd.com>; Chen, Horace
>>>>>> <Horace.Chen@amd.com>
>>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
>>>>>> for SRIOV
>>>>>>
>>>>>> Am 22.12.21 um 23:14 schrieb Andrey Grodzovsky:
>>>>>>> Since now flr work is serialized against  GPU resets there is no need
>>>>>>> for this.
>>>>>>>
>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>>>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
>>>>>>>     drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
>>>>>>>     2 files changed, 22 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>> index 487cd654b69e..7d59a66e3988 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>> @@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>> work_struct *work)
>>>>>>>         struct amdgpu_device *adev = container_of(virt, struct
>>>>>> amdgpu_device, virt);
>>>>>>>         int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>
>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>> -     * the VF FLR.
>>>>>>> -     */
>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>> -        return;
>>>>>>> -
>>>>>>>         amdgpu_virt_fini_data_exchange(adev);
>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>
>>>>>>>         xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
>>>>>>>
>>>>>>> @@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>> work_struct *work)
>>>>>>>         } while (timeout > 1);
>>>>>>>
>>>>>>>     flr_done:
>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>> -
>>>>>>>         /* Trigger recovery for world switch failure if no TDR */
>>>>>>>         if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>             && (!amdgpu_device_has_job_running(adev) || diff --git
>>>>>>> a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>> index e3869067a31d..f82c066c8e8d 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>> @@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>> work_struct *work)
>>>>>>>         struct amdgpu_device *adev = container_of(virt, struct
>>>>>> amdgpu_device, virt);
>>>>>>>         int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>
>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>> -     * the VF FLR.
>>>>>>> -     */
>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>> -        return;
>>>>>>> -
>>>>>>>         amdgpu_virt_fini_data_exchange(adev);
>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>
>>>>>>>         xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
>>>>>>>
>>>>>>> @@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>> work_struct *work)
>>>>>>>         } while (timeout > 1);
>>>>>>>
>>>>>>>     flr_done:
>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>> -
>>>>>>>         /* Trigger recovery for world switch failure if no TDR */
>>>>>>>         if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>             && (!amdgpu_device_has_job_running(adev) ||


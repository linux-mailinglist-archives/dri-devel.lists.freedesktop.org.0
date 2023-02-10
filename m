Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC285692761
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 20:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66D510EDFA;
	Fri, 10 Feb 2023 19:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1FB10EDF8;
 Fri, 10 Feb 2023 19:47:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAkUfbYmaQ/H8X1/PtVYEJzTtzm3bJgSKs8wnqszcmZqfvI0tkvZcj6RaHWdMQJIWyDRGMFBL4peprQ6kIifLV0uco6i6jQPXg7/x/F1012FuLyUKyXo+7EmlDSdkfZxRlw2Gvl8xqPGWlt01PWykqOubp4jqBW+X46m8zxVaFlloD9BL8uYSW1gDnwyaNmokw71gqpCkLONFjh+2G0iaROhLTGR+mLht+lNHfPXsW/MHQLX4fUHoxFyLzYKazSIN1STe/oFpx8OUw03db3eK0gWMEJ4hbxzziw7MK/PPwDor4gezxmfPpSBqb6Z/4c3q2dWC5/5TN1DJW32tpy1mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytIXwfmjZPawmhaXwRH6bPgSjTLKRFIvWtkS0mn9HzU=;
 b=nuymwijIKyxqWTBp/4ManBXjZFozGhemKy37mIbBr4MJwLTdoSVw08IxoUkJ13EvcJwngznJBKIPuhasSn9QM4QDL7lSmbxN6M+03fCtGJSS1GJLTzLMNM2ZAwvh7CiDnETu4V+37eS90uZL6PkMlF5IdzESB6vRtbG++GFfilOStaABYm8eOmKQveEd/dVqCk934QX+fXoTuQBrT9yFzEBIA/cujHwGoUBHHtbiDJbjUc2FfVljByUWE387GX2ldZR9D7gEt0/51mKDL2jyeF3aduAtQftDSP7EHfOyRKA9POoUAFKwO1vOHYpzqIFtMQquh7nzK2SAvdXr32o4Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytIXwfmjZPawmhaXwRH6bPgSjTLKRFIvWtkS0mn9HzU=;
 b=OEbBYTYMNrpWLpI1CPDQJJZHrAoAgdprMU7ls2lX7/608DUJCybCJ4LjX19ADDcMJW2mh1EUZ70bt8sIkYZfG3WEamE9PyyPEkXef4EMnB7QXxHdxMrHRTKX3ht7J0wB0SRZOz2TjC9JVVETV0zhqrITU+cHrSODi98j+OPNtFQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM6PR12MB4089.namprd12.prod.outlook.com (2603:10b6:5:213::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 19:47:56 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%8]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 19:47:56 +0000
Message-ID: <7878175f-b81d-5ad3-bc84-3a95b3add301@amd.com>
Date: Fri, 10 Feb 2023 14:47:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v2 00/18] Add DRM CRTC 3D LUT interface
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>, Melissa Wen <mwen@igalia.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
 <20230109153809.mmjm22oa2gkwe3sf@mail.igalia.com>
 <20230131110735.60f8ff04@eldfell>
 <20230209142702.7w4mqed6zqtk5m6g@mail.igalia.com>
 <20230210112846.2103eb00@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230210112846.2103eb00@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0349.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::14) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM6PR12MB4089:EE_
X-MS-Office365-Filtering-Correlation-Id: a16af108-ee7a-48ec-aeda-08db0b9fb465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9GHQWM93TIk70esZIpUliJ9bcSbMMiIQpIfmSGAkFhIOPm5QAHfgXtrXeUGeO2fZ3suBbZO7fXwu8e73HCfUfx1tDEvFXHs1b6FONc/SpCuKvBTvufqeg8QW6M+n6mki8SQQ5WCTTOZ57t22tCRrqjU98WGPUncDtnHp7n6BYrMmZdR76VKsFJUydf+gPWE7NquId8GMG+zCXVelxlLzjHIMV598CjsF67EYCaVSMW73z3PAcXpo50juM07W+nv50i+9go6X9C0la3yhqM610F5UjPgDDjdmiXM+Cxf4Vnwk+ijX4C7ebGwjaqP/6QQ1Q3tRHn2AQdo7CncK37oVrqZB/6/GvhxRgXtcNqCY+b5o/rFdpUr8QQ3ai+xye+j79x3xIXgeJU/5GLhNBxq22B+t7KBSAzka8PQAiasLjDaluAgSNmd+h0UO5n13/11TNuAFsVRe4SVPnnycf18ersGFvtKkXM1FTv0M8P9SB9IL+FZaR+Q6pPGtzE0Zfna/YR2BfrmwyPe/0DO9Ub7uk/KndVf+FdM17qc052QFzHEwsIrm3yU0u6WiNxHFgsixcCdilpL27Itd4b28kyCagxXlWi/1kM3xdAMXmusrfaMD0tTQQi2ET8yHozxGATrZrP2Y0wvK0gdHWnOOOAHTv3wxzrABCg1HTXIunXiyWoVwfeYrZvY4VkBdCjx7On6liIbogETEKe2K3OBpBJ6cj1iO8iq9Eqrz+d7XtX9WH+fvTr6OE1lwzAc/krYqM1XnIT0f5NJQ1iLCFT1w4/k1RBGgmmncpRHpIK6dPAsMpBLF+YU4+bcOcNfKQ1LWRSKmq45l9iGJX2JbGQxQ7gvJ0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(451199018)(30864003)(44832011)(6506007)(5660300002)(7416002)(186003)(26005)(53546011)(6512007)(8936002)(36756003)(83380400001)(86362001)(31696002)(38100700002)(2616005)(2906002)(316002)(110136005)(54906003)(6486002)(966005)(478600001)(31686004)(41300700001)(6666004)(66476007)(4326008)(66946007)(8676002)(66556008)(367364002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0hvSFVVM2xNRmlnOTJHTE5lL1hycS81R1RqMjhOTnJZUFlsMjZxOTExN1dT?=
 =?utf-8?B?Q2p3Wk00WXN0cnYwQWVFSWswemRqWlU4aGpoU2w0MkhOOXFDSFY1Q3N6UW9s?=
 =?utf-8?B?K3N3VjIvTmhyd1UzS0xJZUNIZE1wdnhudHp2aGQvL3NaYWV0S25Kb0c2d1JW?=
 =?utf-8?B?ajFQYm1sUEZiV3pOdk5hTGF1dVBZZzBwbjBGSVQ4ZDRvY1h5alZaSUUvZ0Fu?=
 =?utf-8?B?aU5yTzVqZzlTUFlZbDRWdFQxWXFNV3lLQzlLZTh4TTFiZk1uTS9pekVLVXVz?=
 =?utf-8?B?Wk1FaVlEa0xUdkF5N0drT3NDb3pjODZlVW9tQzV3OU9hckZ2S3F0Z2dUODU5?=
 =?utf-8?B?S2Zad1VrL0RCd1FYVm12YXhFMFI3cXB5MWdMU3oyL1kzdzlhVlNNZTBwalRl?=
 =?utf-8?B?WXBZRkhwb2x2dHJKK0pkaWJxQkZ0RlJMRXlFUGcvV3dpN0wyd0ZUMjZZRVkw?=
 =?utf-8?B?UVgyNjlzcSsrUW1pdXJ2N3kwK0RpWFo3VitDcHlRQ01HYlplMGl3T1djY2ky?=
 =?utf-8?B?WmlMWHlzZ054TDRPbDY3RUIwNE1QNjBHb095NHBXM0dZUy9tN25TbnNjZ09s?=
 =?utf-8?B?V0hYZEJzMy9iTUM0SU1VaVhhTksxYmVhL1F1UmZFRmRxd0FGbFptZzRvVWRn?=
 =?utf-8?B?OFpDTENST2gyekxMOGRheGRsZ2NnSlBMbnpHWDVGTEdjVStxb1hrc3JiaGJR?=
 =?utf-8?B?RDRUeXJPeGpIQ2J1Rm5JS0tiaXdIeHdpVnJNTXlub0VtYUJGUnJPSCswVG9M?=
 =?utf-8?B?UWN1WWZJRnZGRHk2U1FZb2dyUjZTcFZCczhvVC9FckUyMy95OVJkYnd1ekFU?=
 =?utf-8?B?OE5zQndYc05sa0VRZjkxQUZpSXd4dlgrc3BRclhGaFVTejN2ME9xMFlucjJ5?=
 =?utf-8?B?RnIyc2JKNWllMUJBUUFEUG00dmNVR1EyVmtDTWxlMjNFVWcyOUxFRkZFWmVS?=
 =?utf-8?B?NVZRbjUvMzhXMTRVR216dFBjL0NiOEVwVVhBaGxXRUtVNXhxTXc1TmZkOGV3?=
 =?utf-8?B?b0tqbGJQalBERTRqcEpWMkxMVWE0aGVKMWFzZGdMcnhzdGd4WVNpVjFlZ3do?=
 =?utf-8?B?MUJyZ3MzZCtaR2lEQlQ5blAwdnN6M1k2ckNMb2NRcmltNFJlV2V3TklnLzZu?=
 =?utf-8?B?Vm9IdkhEUkx3bGJMMEZoVDBSYjFpdkJtaWI3OThSWGdtU3VjTXFtcVpWVkU0?=
 =?utf-8?B?VGExNW9SMC9Zd1Bnd3Z5V2tsdDdPY3BENmdaUm8ySi9sNitDaDhDR2duMGM0?=
 =?utf-8?B?K0VFc3laVklxU05YZzZOTm8zYStFZG9nc0wwdmRlY1RNSmcxVk9ueTJubmVw?=
 =?utf-8?B?MFFHNWdDSGhpU3pnVXlkd1c0MmtYa1pPTXJOcmo0S0c2bUIrNjVNYTFFMksz?=
 =?utf-8?B?Q3U0OGVsQnJXWHpkaXdpaFdhc1RrUGhuRFIwbFFTVjlGa1o0U0praFFhK0Va?=
 =?utf-8?B?SW5CbXRDVWk4QkViTUVJMmZsN0tXb3hyWlJnc1pCOTRLZFg3N0tCVzRWck01?=
 =?utf-8?B?VG1tUHRXb1VSNXRtTEZMQlJtMi9HOE5CMlBIRXB0cUZ5WWxrMkQ4ajU0a2lz?=
 =?utf-8?B?ZGVrNVBNbkN4ajB5OGl2dUcrN0NoSmxJQ1g0VkNxanhvbFYzc25zcDYvZ01Q?=
 =?utf-8?B?K2lhQkIyOUtOMjE3M3E4UnAyd2E3ZUVPaHl3VWJkK1VBUHA1K3MyQzlaWFFx?=
 =?utf-8?B?dm9TRkY2bTBKMEFIWkk3bWpKaXVJL3dGclRjcUdrRVdYR0EwaUtFT3RJN3Yr?=
 =?utf-8?B?MlhIc3JFKzZUNTBvUk8zU3ViT2h1QUVCZmR1bVlLUnVQaEVxZzh1SXVrM1Mx?=
 =?utf-8?B?Y0Rnbzc1Z0p5R2RhYk5ONisrS1FnM0xjZjdGQk9pcEtad2dvVFIxR3lFeUlQ?=
 =?utf-8?B?TzgrckRTVk50djdGYVFWUVhqNGpsamE1bUp3eUx6QmhhNEFlQ1dVV3V5aTNV?=
 =?utf-8?B?NEM0TkJ2MjZZWWFBRFNIL1dIQVVZWTV6aUZiS3pIc2hYMWdGL0pRTGREa3Jn?=
 =?utf-8?B?NWo3NEZjazJ0ei9XZ05TSmdKNCtaTmJkbU9vbUVWeWhYdUdYQ0VVSy84aVJR?=
 =?utf-8?B?K3JSYkFRSGp0V1krL1ZTTFkwUnEwcWJoYVFmRkVLSnB3RUQvYkdnNDZ5dG13?=
 =?utf-8?Q?8BNz49ubXBpGCiVjbb8Ope38l?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16af108-ee7a-48ec-aeda-08db0b9fb465
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 19:47:56.0762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xLGMFOmRlyZ7C0b5bFpfyVutZslC4bqeVMm/bJW2u7RURxP8OmyAlSVlLy3uDyxUIBuaEWaIku8uonTCiti8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4089
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
Cc: dri-devel@lists.freedesktop.org, laurent.pinchart+renesas@ideasonboard.com,
 Shashank Sharma <shashank.sharma@amd.com>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, alex.hung@amd.com, tzimmermann@suse.de,
 sunpeng.li@amd.com, seanpaul@chromium.org, bhawanpreet.lakha@amd.com,
 sungjoon.kim@amd.com, Xinhui.Pan@amd.com, christian.koenig@amd.com,
 kernel-dev@igalia.com, alexander.deucher@amd.com, nicholas.kazlauskas@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/10/23 04:28, Pekka Paalanen wrote:
> On Thu, 9 Feb 2023 13:27:02 -0100
> Melissa Wen <mwen@igalia.com> wrote:
> 
>> On 01/31, Pekka Paalanen wrote:
>>> On Mon, 9 Jan 2023 14:38:09 -0100
>>> Melissa Wen <mwen@igalia.com> wrote:
>>>   
>>>> On 01/09, Melissa Wen wrote:  
>>>>> Hi,
>>>>>
>>>>> After collecting comments in different places, here is a second version
>>>>> of the work on adding DRM CRTC 3D LUT support to the current DRM color
>>>>> mgmt interface. In comparison to previous proposals [1][2][3], here we
>>>>> add 3D LUT before gamma 1D LUT, but also a shaper 1D LUT before 3D LUT,
>>>>> that means the following DRM CRTC color correction pipeline:
>>>>>
>>>>> Blend -> Degamma 1D LUT -> CTM -> Shaper 1D LUT -> 3D LUT -> Gamma 1D LUT  
>>>
>>> Hi Melissa,
>>>
>>> that makes sense to me, for CRTCs. It would be really good to have that
>>> as a diagram in the KMS UAPI documentation.
>>>   
>>
>> Hi Pekka,
>>
>> Thanks for your feedbacks and your time reviewing this proposal.
> 
> No problem, and sorry it took so long!
> 
> I'm just finishing the catch-up with everything that happened during
> winter holidays.
> 
>>> If someone wants to add a 3D LUT to KMS planes as well, then I'm not
>>> sure if it should be this order or swapped. I will probably have an
>>> opinion about that once Weston is fully HDR capable and has been tried
>>> in the wild for a while with the HDR color operations fine-tuned based
>>> on community feedback. IOW, not for a long time. The YUV to RGB
>>> conversion factors in there as well.
>>>   
>> I see, this is also the reason I reuse here Alex Hung's proposal for
>> pre-blending API. I'll work on better documentation.
>>
>>>   
>>>>>
>>>>> and we also add a DRM CRTC LUT3D_MODE property, based on Alex Hung
>>>>> proposal for pre-blending 3D LUT [4] (Thanks!), instead of just a
>>>>> LUT3D_SIZE, that allows userspace to use different supported settings of
>>>>> 3D LUT, fitting VA-API and new color API better. In this sense, I
>>>>> adjusted the pre-blending proposal for post-blending usage.
>>>>>
>>>>> Patches 1-6 targets the addition of shaper LUT and 3D LUT properties to
>>>>> the current DRM CRTC color mgmt pipeline. Patch 6 can be considered an
>>>>> extra/optional patch to define a default value for LUT3D_MODE, inspired
>>>>> by what we do for the plane blend mode property (pre-multiplied).
>>>>>
>>>>> Patches 7-18 targets AMD display code to enable shaper and 3D LUT usage
>>>>> on DCN 301 (our HW case). Patches 7-9 performs code cleanups on current
>>>>> AMD DM colors code, patch 10 updates AMD stream in case of user 3D LUT
>>>>> changes, patch 11/12 rework AMD MPC 3D LUT resource handling by context
>>>>> for DCN 301 (easily extendible to other DCN families). Finally, from
>>>>> 13-18, we wire up SHAPER LUT, LUT3D and LUT3D MODE to AMD display
>>>>> driver, exposing modes supported by HW and programming user shaper and
>>>>> 3D LUT accordingly.
>>>>>
>>>>> Our target userspace is Gamescope/SteamOS.
>>>>>
>>>>> Basic IGT tests were based on [5][6] and are available here (in-progress):
>>>>> https://gitlab.freedesktop.org/mwen/igt-gpu-tools/-/commits/crtc-lut3d-api
>>>>>
>>>>> [1] https://lore.kernel.org/all/20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com/
>>>>> [2] https://github.com/vsyrjala/linux/commit/4d28e8ddf2a076f30f9e5bdc17cbb4656fe23e69
>>>>> [3] https://lore.kernel.org/amd-gfx/20220619223104.667413-1-mwen@igalia.com/
>>>>> [4] https://lore.kernel.org/dri-devel/20221004211451.1475215-1-alex.hung@amd.com/
>>>>> [5] https://patchwork.freedesktop.org/series/90165/
>>>>> [6] https://patchwork.freedesktop.org/series/109402/
>>>>> [VA_API] http://intel.github.io/libva/structVAProcFilterParameterBuffer3DLUT.html
>>>>> [KMS_pipe_API] https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/11
>>>>>
>>>>> Let me know your thoughts.    
>>>>
>>>> +Simon Ser, +Pekka Paalanen who might also be interested in this series.  
>>>
>>> Unfortunately I don't have the patch emails to reply to, so here's a
>>> messy bunch of comments. I'll concentrate on the UAPI design as always.  
>>
>> Sorry, the patchset is here: https://lore.kernel.org/dri-devel/20230109143846.1966301-1-mwen@igalia.com/
>> In the next version, I won't forget cc'ing you at first.
>>>
>>> +/*
>>> + * struct drm_mode_lut3d_mode - 3D LUT mode information.
>>> + * @lut_size: number of valid points on every dimension of 3D LUT.
>>> + * @lut_stride: number of points on every dimension of 3D LUT.
>>> + * @bit_depth: number of bits of RGB. If color_mode defines entries with higher
>>> + *             bit_depth the least significant bits will be truncated.
>>> + * @color_format: fourcc values, ex. DRM_FORMAT_XRGB16161616 or DRM_FORMAT_XBGR16161616.
>>> + * @flags: flags for hardware-sepcific features
>>> + */
>>> +struct drm_mode_lut3d_mode {
>>> +	__u16 lut_size;
>>> +	__u16 lut_stride[3];
>>> +	__u16 bit_depth;
>>> +	__u32 color_format;
>>> +	__u32 flags;
>>> +};
>>>
>>> Why is lut_stride an array of 3, but lut_size is not?  
>>
>> It cames from VA-API:
>> https://intel.github.io/libva/structVAProcFilterParameterBuffer3DLUT.html#a682756be15d09327ba725b74a863cbcc
>>
>> In short, the reason is that lut_size is the valid points and is
>> the same for every dimensions, but lut_stride may vary.
> 
> Ok, so lut_size is what I would have guessed it to be. Just needs to be
> doc'd - pretty much all my questions are lack of docs.
> 
> I see that lut_stride is supposed to be in points, and not bytes. That
> is surprising. Are you sure it's good?
> 
>>>
>>> What is the color_mode the comment is referring to?  
>>
>> It refers to FB color_mode/bpp. I'm not using it in post-blending 3D LUT
>> implementation (should I?), it cames from pre-blending use case.  Maybe
>> the main issue here is if reusing the pre-blending 3D LUT mode struct is
>> a good approach or better create a specific for post-blending.
> 
> Sorry, I have no idea what FB color_mode is. I do not recall any such
> thing in the KMS uAPI.
> 
> 
>>>
>>> What is "number of bits of RGB"? Input precision? Output precision?
>>> Integer or floating point?  
>>
>> It's the bit depth of the 3D LUT values, the same for every channels. In
>> the AMD case, it's supports 10-bit and 12-bit, for example.
> 
> Ok. So e.g. r5g6b5 is not a possible 3D LUT element type on any
> hardware ever?
> 

I haven't had a chance to go through all patches yet but if this is
modeled after Alex Hung's work this should be covered by color_format.
The idea is that color_format takes a FOURCC value and defines the
format of the entries in the 3DLUT blob.

The bit_depth describes the actual bit depth that the HW supports.
E.g., color_format could be DRM_FORMAT_XRGB16161616 but HW might only
support 12-bit precision. In that case the least significant bits get
truncated.

One could define the bit_depth per color, but I'm not sure that'll be
necessary.

> What exactly is the truncation the comment refers to?
> 
> It sounds like if input has higher precision than the LUT elements,
> then "truncation" occurs. I can kind of see that, but I also think it
> is a false characterisation. The LUT input precision affects the
> precision of LUT indexing and the precision of interpolation between
> the LUT elements. I would not expect those two precisions to be
> truncated to the LUT element precision (but they could be truncated to
> something else hardware specific). Instead, I do expect the
> interpolation result to be truncated to the LUT output precision, which
> probably is the same as the LUT element precision, but not necessarily.
> 
> Maybe the comment about truncation should simply be removed? The result
> is obvious if we know the LUT input, element, and output precision, and
> what exactly happens with the indexing and interpolation is probably
> good enough to be left hardware-specific if it is difficult to describe
> in generic terms across different hardware.
> 

Maybe it makes sense to just drop the bit_depth field.

Harry

>>>
>>> Flags cannot be hardware specific, because it makes the whole KMS UAPI
>>> hardware specific. That won't work. You have to have driver-agnostic
>>> definitions for all possible flags.
>>>
>>> Why is this the whole first patch? There is no documentation for the
>>> UAPI on how this struct works, so I cannot review this. Explaining just
>>> the individual fields is not enough to understand it. Is this something
>>> the kernel fills in and is read-only to userspace? Is userspace filling
>>> this in?  
>>
>> I see. I'll work on explaining/documenting it better.
>>>
>>>
>>> + * “LUT3D”:
>>> + *	Blob property to set the 3D LUT mapping pixel data after the color
>>> + *	transformation matrix and before gamma 1D lut correction. The
>>> + *	data is interpreted as an array of &struct drm_color_lut elements.
>>> + *	Hardware might choose not to use the full precision of the LUT
>>> + *	elements.
>>> + *
>>> + *	Setting this to NULL (blob property value set to 0) means a the output
>>> + *	color is identical to the input color. This is generally the driver
>>> + *	boot-up state too. Drivers can access this blob through
>>> + *	&drm_crtc_state.gamma_lut.
>>> + *
>>>
>>> You need to define how the 1-D array of drm_color_lut elements blob
>>> will be interpreted as a 3-D array for the 3D LUT, and how the
>>> dimensions match to the R, G and B channels. It's a bit like the
>>> question about row-major or column-major storage for matrices, except
>>> more complicated and not in those words.  
>>
>> ack
>>>
>>> + * “LUT3D_MODE”:
>>> + *	Enum property to give the mode of the 3D lookup table to be set on the
>>> + *	LUT3D property. A mode specifies size, stride, bit depth and color
>>> + *	format and depends on the underlying hardware). If drivers support
>>> + *	multiple 3D LUT modes, they should be declared in a array of
>>> + *	drm_color_lut3d_mode and they will be advertised as an enum.
>>>
>>> How does that work exactly? I didn't get it. I could guess, but having
>>> to guess on API is bad.  
>>
>> The driver advertises all supported modes (each combination of values)
>> in a array as a enum, userspace can check all accepted modes and set the
>> one that fits the user 3D LUT settings. I think it's possible to get the
>> idea from this IGT test:
>> https://gitlab.freedesktop.org/mwen/igt-gpu-tools/-/commit/8771f444c3dcd126d7590d5a9b1b0db9706bbf6e#ed5dbc960ac210e3fbacd2361fe0270709767aaa_205_205
>>>
> 
> You lost me at "an array as an enum".
> 
> I understand there is a blob containing an array of struct
> drm_mode_lut3d_mode. What I don't understand is that you say LUT3D_MODE
> is an enum property. Where does the blob come from, then? What property
> provides the blob?
> 
> Am I correct in guessing that the values of LUT3D_MODE enum property
> are indices into the array in the blob, and that userspace will set it?
> That sounds good to me, if it's the integer value of the enum. But enum
> values also need string names, because that is how the values are
> usually recognized, so what name strings will be used?
> 
> In that code example, I cannot see any connection between the array of
> drm_mode_lut3d_mode entries, the 'name' string, and the actual data
> generated for the LUT. They must all connect somehow, but it just
> doesn't seem to be in the code. It is just hardcoding mode_lut3d[0],
> and the data generator never sees even that - it gets the lut size, but
> none of the other parameters. I cannot see that working across multiple
> drivers.
> 
> Why is it setting a linear shaper LUT explicitly instead of unsetting
> it? I mean this preparation:
> 
> shaper_linear = generate_table(data->shaper_lut_size, 1.0);
> 
> "Linear" actually means "identity", right? That's what people usually
> write when they mean identity.
> 
> Surely it's not actually a constant curve? That would make the whole
> test useless for proving the 3D LUT works.
> 
> 
>>>
>>> +	/**
>>> +	 * @lut3d:
>>> +	 *
>>> +	 * 3D Lookup table for converting pixel data. Position where it takes
>>> +	 * place depends on hw design, after @ctm or @gamma_lut. See
>>> +	 * drm_crtc_enable_color_mgmt(). The blob (if not NULL) is an array of
>>> +	 * &struct drm_color_lut.
>>> +	 */
>>> +	struct drm_property_blob *lut3d;
>>>
>>> I do not like the wording of "depends on hw design", and it is used in
>>> very many places here. The KMS UAPI semantics cannot vary based on
>>> hardware. Your cover letter defines the order in the color pipeline, so
>>> I don't understand how this here can depend on hw.
>>>
>>> What can depend on hardware is which KMS UAPI properties are exposed,
>>> and how you map a property to a hardware unit (which can even change
>>> based on the exact pipeline configuration as long as the results are as
>>> the UAPI doc defines). But this comment here is talking about the UAPI
>>> properties, not hw elements.
>>>   
>>
>> You are right! My initial idea was to explain that it's possible for
>> other vendors color pipeline to fit this pipeline internally, if they
>> need a 1D LUT before the 3D LUT, but not the 1D LUT in the end.
>>
>>>
>>> I'm happy that the 3D LUT interface is being developed, but as you can
>>> see from my questions, the UAPI documentation is practically missing. I
>>> would have no idea how to use this as is.  
>>
>> Thank you again for your valuable comments. I'll address your comments
>> in a next version by better explaining all these points.
> 
> Thank you for working on this!
> pq


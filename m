Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B021D6FB981
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 23:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A9510E16A;
	Mon,  8 May 2023 21:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FA710E16A;
 Mon,  8 May 2023 21:24:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IM87viDLbOwiAZ6DxKlr/6M35tl+m0Bd0Bpm3SkB+pGJKPD+w/XQ8g/IndVlcjN4KSXkGiSvY/Sxy61XCeV6wYdgwgeYZ4SSkfUxGFqq2KMK5Oc30J/T2YAyQ1KjU0BzDyVwB6YwVqktrpnI7rMwfIW9oHb+8V0kk9WoBFEf4Tl+lWWkbbhXiQu4QQIscjbDGmmva4jPQnVPrrG+htIj36jb1HupWZ4yLd4msaYxBS/o7IjsXDA0VOod+esXVqWbRFIz0z6+OtyVYXNdOuEjGi7L1P8q2ld6BEcmh1/ZtYa12c21zjAbTGtiOGCpHVOT23iTrSz4QvPUKPPEMquMqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9xeMqx2NQ4hWnAbaasGSNiWpolUS9sv30tfuvcF2Bo=;
 b=ghO0Q/BY7/TAwMwrMjsC1QKzI5MfFlfoNE/hIZqhZzBPXtctoURGDZAp/d3hX2CETdBSWgXCBILBAUzrCXHbdOHkBW4sK5kZEeEF/fRgNnyzCUJBrRI77zSCmyS9MSuaXb3NdPFpmfwwuW00aoPorGY3+RV4ky+jYOd9Pc+0VrTzgEdqPEWWaudvT7nI89n9p8AdlF+tsDzW20T5jaMXyx+f1bfRSNaotAFXQArpK9STNRJbkORXvVrmyVUPmWW8tsadWLmpm4PttQQ4sovOiuQ0FHheHazQKz6l0yKwjbJLftbUmHbKkXW8suuJQIe9+dGfNAaG2HjjJvH7bLzR8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9xeMqx2NQ4hWnAbaasGSNiWpolUS9sv30tfuvcF2Bo=;
 b=h9hJc7o9Gvr9j20ZVOXSg0WyTE6Hyi1h7jPvW9Dax1pW3eVTBC6b4wBypR2bHH8r+McLo3IOvyTLt9MRWC7/CzCiKvh3+zhLmCt/L9tZUhzVnA+9SMSNPxN/iTV0cm/T3cJjmvPRV2l8Iw0AqbVg2W5ipgeOZ8a/p3xPgepTTQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH8PR12MB6676.namprd12.prod.outlook.com (2603:10b6:510:1c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.31; Mon, 8 May
 2023 21:24:17 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd26:a6b5:1d41:ac27]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd26:a6b5:1d41:ac27%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:24:17 +0000
Message-ID: <ba9b8a67-37a7-d924-d673-f716b3192bb8@amd.com>
Date: Mon, 8 May 2023 17:24:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 00/40] drm/amd/display: add AMD driver-specific
 properties for color mgmt
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 Xinhui.Pan@amd.com
References: <20230423141051.702990-1-mwen@igalia.com>
Content-Language: en-US
In-Reply-To: <20230423141051.702990-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH8PR12MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: c46a657b-34e7-42c1-543e-08db500a9426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /9vfQM+APE0K2BGpj6qLo5tycXn7AOTTNs2sllEswVwlpXO2bjsRWLaJaRxNjRcNehvV3WnVAexZu7OMpBIvmXgDL75NfZF/y3IRwEXDATOGFoiZPveh2o7fIGBafVaNvi8hkcMUPwh3bCCeSCSOM8CTtJvkdhFcLvUPsrPcCRstC0atsZHmXi9tG/4pwkin7mcQQvGtqs7du92w7fQJtC7i1IAxu+jCrp/VJrvrcPcURz8meDN8OtEva9PStagoL36+Dd4JWEeqqIALisfN70Sqoh3oQZCrJOGsKEPLi1yX9IP5Aqm97DAMwefhSQGi8u61c4hNlqhZAxF6lTuLvnO35gzNIuAZ1D8BoDHdmsFrPuv5YhHlALHzyQl2XixCbokbSLaGmNxOJqmWJVrXW2pYllPyiU+JbWZyLykaqnYsanwDQTpvk3X89P+WwBEaGWGN4sR2p/+NCA4Nz73XdDK2DxoXGVWNj+52+Af2668A8UHZrbXmd9OSdKhKPCi7mANRJHgkUO/c9IQm28k24r4BdVsslDEQpQHKOPU/9HlMRkDrF6+cAVeaJ5mcR+oYFtH0tvwlUUfX9+8qYTpD9SA+BoEEJKO4J00NvXs0G1Of+38Bm9w8iTdpXpYYQ2DIDKH+uaLG7oqnGoY7D8g5+B719oH+fjIYHsZc8Mb3cTJ5D0EulKmaoKGdKqTAGxXl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199021)(966005)(83380400001)(110136005)(6666004)(478600001)(54906003)(6486002)(2616005)(6506007)(26005)(53546011)(186003)(6512007)(2906002)(44832011)(7416002)(38100700002)(36756003)(66556008)(66946007)(66476007)(6636002)(4326008)(921005)(41300700001)(8676002)(5660300002)(316002)(31696002)(86362001)(8936002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGdrNU5YSkI5Q3AxMWVJb21CMlRkMnVKMEFlc1F6dVNpWHRXVEVyOGQyRHhU?=
 =?utf-8?B?eHI4N2x0MS85blV0SVBPMUdHUzAzUUl3U3RRNnJMZHd3Z2JrTTFISmF1OHV0?=
 =?utf-8?B?NWM4eUE4bmFScEtMQURsWjRMQlhuZGpPUXZmRUhWVDgxM05sSGIyZHcyZXVu?=
 =?utf-8?B?MUFnYUx2L0ZrVnVQZ2Q0RFpBNEhtc1pLQXVZdU5QdEVaR2FmM2ViQ1dqS0d3?=
 =?utf-8?B?WjNUOG9RZUhoOWd0ejd1ZmFhNDJsZVV0cFhudTdwM3R4MHA3OXo5c3ZlR1pZ?=
 =?utf-8?B?WU5nRThsTm9mYkVOOFR2b1ZyVjhFenoyYWlFYndFcTZ0UXlpL2JkVXczNXhQ?=
 =?utf-8?B?Ni9JWTBXVWpOamFjUDBkaE5lbTUydUMrd3BwQlZrUnRhSzBLVXU0eC9TSERi?=
 =?utf-8?B?OUQ1aThRUElBR2ZiMGRPOU5vcklTK0dvc2pSdld0bDZ0RDkwMWluSTI1bmtR?=
 =?utf-8?B?QjVuV2JuNTdmTXMxczVhYWlPZHpBeDR5SDA0Mk5POElONk0rbkI1ald2S25C?=
 =?utf-8?B?UlhTa0hja3kwaTRDZ054aEZmS3Q2NUhydmJlZEJscjhNTW5PaUxxL01IOS8v?=
 =?utf-8?B?eC9mZEhDcGVUUmJGYWNCaFd3Z3orNWluS0FKWklmb01qNTBaY0pOUWhxNlQw?=
 =?utf-8?B?SjNDSmxNeU5vN1N0OEpPbHc5UnpVOWRzMTR0RU5QUnZWTVFKdmtSK05UOHlO?=
 =?utf-8?B?ZmVpZzJFNWpieHVyZ0E2Ym1oNktPeFVlcjFvQ3VOSWxscWRYRHhXOElia3pO?=
 =?utf-8?B?aW9xMzErVm1BaytZSWt1TE5aU2ExdW5VNU5TTXRDT3h2NW1xOEsySmtpcmdN?=
 =?utf-8?B?c2VZR2hvNHhwMXVjZjA3WWNUcHRLRThiUWpELytzcFNZblFZczNsU0RTb2V6?=
 =?utf-8?B?ZGNTN2xRQmJmZlpXaTRlemNmb1BqbXJ0c1Y1Vm5ib3VVWFpwS2NnNFdpMGpU?=
 =?utf-8?B?V25qVXY1N04rR2szaUNqUTlmcHhSSmhsNVU3MDIraEdETEtyNkhuaVdWRDJC?=
 =?utf-8?B?ZEJTdmh2NVA1R2d6a1ZzUy9oNUM1Yi9lL3pLdnhhMVl0SjMxREZNaGhRczR5?=
 =?utf-8?B?eE1Lc214bENaKzZJaGVpZzdhK1ZBVis1Yjgxb2EwTnpHR2NWWDFsMWc1dDVX?=
 =?utf-8?B?cVFnVTdkRWZGUTJvcXNkRXFyZktMUHdOQW9vSkJzWmxKL3ZnZ3FjdnVhN3NV?=
 =?utf-8?B?K0dFdDVrbERwV0MxRGxZbkJVelRJekdrSHFkODZXbjVJTFY1MUgzeGxvc0ti?=
 =?utf-8?B?dkZseVNobnREaURIOTFJZ0o4S3hDS1lLR1dVVm4vQzNqbXgySFlDNmZxMy9w?=
 =?utf-8?B?SGt6WExlRXVQZzFzdmYzWkpuY2svN295VGlNcElaVmNkM2xFUTNvWnRhNWkx?=
 =?utf-8?B?c09EQWZ1SHN6aWRhdk1BVU9YU211RytwaVA2K0d0NVIwVVN4SkNMb2duYWNG?=
 =?utf-8?B?akh5RHE2cjF6blBnaHdSUktXMXJDTFY2ZmRmUDUwdkthQ083dTRVVGdraFd2?=
 =?utf-8?B?c0R1akVsSlgycE9hRGI2eHQrQWc2ZnZTZGY2S2Z6SUs5clo0T0MvQ2JYSU5m?=
 =?utf-8?B?UGI0Szh2bjJpcGVjWnVtbGFqNmVZWlV6dzQxTlY4T0IzVFp4TVJHS0VVaDVp?=
 =?utf-8?B?RXBZMWNEcHRxSEdnSzNEL0pVOFE1cGZUUTRhT25Ia2J5bEtJcFlaMHo1bkVT?=
 =?utf-8?B?eUZpSGZQUXdnVXB4L1czZU15UUszRXJMcXdRNENmeDZndWFsc215SUZvZnVT?=
 =?utf-8?B?NisycTBWejg5ZXgrVnhqSlBBWldKeGlwZFJhd3R1b2lmSWpQQllmNWdxUDJr?=
 =?utf-8?B?NGNlSTc4QlBOU2NSdVdWUHhJSXRNRVR3aktsR0FvTEptRDRBcldCd29ud2w5?=
 =?utf-8?B?cHhhL0JJNFRTVGVBUHZ0ZGlCME9HVG8xU2RZd2MrdFNxU0NubFovbUU1MVo0?=
 =?utf-8?B?NmYxN1BVZHhMTUcvckwvNkVGckVZSml1dlMrUzZzZHpoSytIOERqSndRRjM0?=
 =?utf-8?B?WmFQa3hCV3RzZXZXOGwzQ2VPRERrQkExbEJhdEFQS2JObER6SGNJQmRaZmpO?=
 =?utf-8?B?TWZ6VEFZV2hpSGJJV2NCSXhydjU3c3d6SFJBbUp3M3MrU2VkNHJPUzdBRlIv?=
 =?utf-8?Q?EgnKUSImIGxETVhDAEaoOhLV2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c46a657b-34e7-42c1-543e-08db500a9426
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:24:17.0310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iYv1LKNWte8ilF2AcoPD6ALogmvy2rWNvpGhtaw5MeMZbnEciSF0FejuiokN9HdLoZ+yGn/jvQ8ROoVPt/9pkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6676
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/23/23 10:10, Melissa Wen wrote:
> Hi all,
> 
> Joshua Ashton and I (with the great collaboration of Harry Wentland -
> thanks) have been working on KMS color pipeline enhancement for Steam
> Deck/SteamOS by exposing the large set of color caps available in AMD
> display HW.
> 

Thank you for your work on this.

> This patchset results from this full-stack work, including pre-blending
> and post-blending new color properties. The first two patches fix
> quantization issues on shaper LUT programming. Just after, we have one
> patch that adds a config option to restrict AMD colo feature usage. The
> following 13 patches implement AMD driver-private color properties
> (pending detachment of property counter and plane color_mgmt_changed
> from DRM). Finally, the last 24 patches rework the AMD display manager
> and color management to support the properties exposed.
> 
> In short, for pre-blending, we added the following:
> - plane degamma LUT and predefined transfer function;
> - plane HDR multiplier
> - plane shaper LUT/transfer function;
> - plane 3D LUT; and finally,
> - plane blend LUT/transfer function, just before blending.
> 
> After blending, we already have DRM CRTC degamma/gamma LUTs and CTM,
> therefore, we extend CRTC color pipeline with the following:
> - CRTC shaper LUT/transfer function;
> - CRTC 3D LUT; and
> - CRTC gamma transfer function.
> 
> You can already find the AMD color capabilities and color management
> pipeline documented here:
> https://dri.freedesktop.org/docs/drm/gpu/amdgpu/display/display-manager.html#color-management-properties
> 
> In previous iterations, we tried to provide a generic solution for
> post-blending shaper and 3D LUT [1][2][3], and also Alex Hung worked on
> a pre-blending 3D LUT solution[4] extending plane color mgmt proposal
> from Uma Shankar [5]. However, we identified during our work [6] that
> AMD provides many other valuable capabilities that we don't find in
> other vendors, so we started to work on AMD driver-private color
> properties that better describe its color pipeline, enabling us to
> expose full AMD color capabilities on Deck HW.
> 
> Our primary purpose is to avoid usage limitations of color calibration
> features provided by HW just because we don't have an interface for
> that. At the same time, a generic solution doesn't fit well since some
> of these capabilities seem AMD HW specific, such as hardcoded
> curve/predefined transfer function and shaper 1D LUTs sandwiching 3D
> LUT.
> 
> So far, we keep these properties' usage under an AMD display config
> option (STEAM_DECK). However, we are fine with having them fully
> available to other DCN HW generations. In the current proposal, we are
> already checking ASICs before exposing a color feature. We can work on
> 3D LUT resource acquisition details to fit them to DCN 3+ families that
> support them. Indeed, before moving to these config boundaries, we
> started working on an open solution for any AMD HW [7].
> 

The problem with a CONFIG_XYZ option is that it becomes uAPI and can't be
removed. I feel we have a good proposal going for the generic solution.
Would it work for you if we don't make this a CONFIG_ option? What I mean
is using

#define AMD_PRIVATE_COLOR

around the interface bits, which are only compiled when building with
-DAMD_PRIVATE_COLOR

That way we have the option to rip the driver-private stuff out later
while still allowing for experimentation now.

Or, alternatively, we can merge everything but the stuff currently
guarded by CONFIG_STEAM_DECK, so that custom kernels can enable this
functionality by simply merging one patch that includes all the
CONFIG_STEAM_DECK stuff.

This will allow us to merge the vast majority of the code without
having to maintain it in downstream repo.

> The userspace case here is Gamescope which is the compositor for
> SteamOS. It's already using all of this functionality (although with a
> VALVE1_ prefix instead of AMD) to implement its color management
> pipeline right now:
> https://github.com/ValveSoftware/gamescope
> 
> We are planning on shipping our color management support with gamut
> mapping, HDR, SDR on HDR, HDR on SDR, and much more in Steam OS 3.5. A
> brief overview of our color pipeline can be found here:
> https://github.com/ValveSoftware/gamescope/blob/master/src/docs/Steam%20Deck%20Display%20Pipeline.png
> 
> We have also had some other userspace interests from Xaver Hugl (KDE) in
> experimenting with these properties for their HDR/color bring-up before
> a generic interface is settled on also.
> 
> It still needs AMD-specific IGT tests; we are working on documentation
> and adding plane CTM support too. 
> 
> We decided first to share our work to collect thoughts and open for
> discussion, even with missing refinements, since driver-private
> properties are not the usual DMR/KMS color management approach.
> 
> Please, let us know your thoughts.
> 

As discussed at the hackfest I think it's a good idea to have something
that's easy to enable for the purposes of experimentation (and to
help downstream users that help us figure out how this all fits
together, i.e. SteamOS).

Harry

> Best Regards,
> 
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> Signed-off-by: Melissa Wen<mwen@igalia.com>
> 
> [1] https://lore.kernel.org/dri-devel/20220619223104.667413-1-mwen@igalia.com/
> [2] https://lore.kernel.org/amd-gfx/20220906164628.2361811-1-mwen@igalia.com/
> [3] https://lore.kernel.org/dri-devel/20230109143846.1966301-1-mwen@igalia.com/
> [4] https://lore.kernel.org/dri-devel/20221004211451.1475215-1-alex.hung@amd.com/
> [5] https://lore.kernel.org/dri-devel/20210906213904.27918-1-uma.shankar@intel.com/
> [6] https://gitlab.freedesktop.org/mwen/linux-amd/-/commits/amd-color-mgmt
> [7] https://gitlab.freedesktop.org/mwen/linux-amd/-/commits/amd-private-color-mgmt
> 
> Harry Wentland (2):
>   drm/amd/display: fix segment distribution for linear LUTs
>   drm/amd/display: fix the delta clamping for shaper LUT
> 
> Joshua Ashton (15):
>   drm/amd/display: add CRTC gamma TF to driver-private props
>   drm/amd/display: add plane degamma LUT driver-private props
>   drm/amd/display: add plane degamma TF driver-private property
>   drm/amd/display: add plane HDR multiplier driver-private property
>   drm/amd/display: add plane blend LUT and TF driver-private properties
>   drm/amd/display: copy 3D LUT settings from crtc state to stream_update
>   drm/amd/display: dynamically acquire 3DLUT resources for color changes
>   drm/amd/display: add CRTC regamma TF support
>   drm/amd/display: set sdr_ref_white_level to 80 for out_transfer_func
>   drm/amd/display: add support for plane degamma TF and LUT properties
>   drm/amd/display: add dc_fixpt_from_s3132 helper
>   drm/adm/display: add HDR multiplier support
>   drm/amd/display: handle empty LUTs in __set_input_tf
>   drm/amd/display: add DRM plane blend LUT and TF support
>   drm/amd/display: allow newer DC hardware to use degamma ROM for PQ/HLG
> 
> Melissa Wen (23):
>   drm/amd/display: introduce Steam Deck color features to AMD display
>     driver
>   drm/drm_mode_object: increase max objects to accommodate new color
>     props
>   drm/amd/display: add shaper LUT driver-private props
>   drm/amd/display: add 3D LUT driver-private props
>   drm/drm_plane: track color mgmt changes per plane
>   drm/amd/display: move replace blob func to dm plane
>   drm/amd/display: add plane 3D LUT driver-private properties
>   drm/amd/display: add plane shaper LUT driver-private properties
>   drm/amd/display: add plane shaper TF driver-private property
>   drm/amd/display: add comments to describe DM crtc color mgmt behavior
>   drm/amd/display: encapsulate atomic regamma operation
>   drm/amd/display: update lut3d and shaper lut to stream
>   drm/amd/display: allow BYPASS 3D LUT but keep shaper LUT settings
>   drm/amd/display: handle MPC 3D LUT resources for a given context
>   drm/amd/display: add CRTC 3D LUT support to amd color pipeline
>   drm/amd/display: decouple steps to reuse in CRTC shaper LUT support
>   drm/amd/display: add CRTC shaper LUT support to amd color pipeline
>   drm/amd/display: add CRTC shaper TF support
>   drm/amd/display: mark plane as needing reset if plane color mgmt
>     changes
>   drm/amd/display: decouple steps for mapping CRTC degamma to DC plane
>   drm/amd/display: reject atomic commit if setting both plane and CRTC
>     degamma
>   drm/amd/display: add plane shaper/3D LUT and shaper TF support
>   drm/amd/display: copy dc_plane color settings to surface_updates
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 153 +++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  92 +++
>  drivers/gpu/drm/amd/display/Kconfig           |   6 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  31 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 120 +++-
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 613 ++++++++++++++++--
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 124 +++-
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 238 +++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.h   |   7 +
>  drivers/gpu/drm/amd/display/dc/core/dc.c      |  49 +-
>  drivers/gpu/drm/amd/display/dc/dc.h           |   8 +
>  .../amd/display/dc/dcn10/dcn10_cm_common.c    | 109 +++-
>  .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |   5 +-
>  .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |   9 +-
>  .../amd/display/dc/dcn301/dcn301_resource.c   |  26 +-
>  .../gpu/drm/amd/display/include/fixed31_32.h  |  12 +
>  drivers/gpu/drm/drm_atomic.c                  |   1 +
>  drivers/gpu/drm/drm_atomic_state_helper.c     |   1 +
>  include/drm/drm_mode_object.h                 |   2 +-
>  include/drm/drm_plane.h                       |   7 +
>  20 files changed, 1509 insertions(+), 104 deletions(-)
> 



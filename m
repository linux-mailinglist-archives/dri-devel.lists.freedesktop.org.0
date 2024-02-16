Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1881F858837
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 22:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C68E10E8B8;
	Fri, 16 Feb 2024 21:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SQBZtb9X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7874E10E8B8;
 Fri, 16 Feb 2024 21:47:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmBOcGFNJQ3AUzx9M+aj9C7oATrciMo7U7KXbr37T91kI72JzhoyZmElTLL4jO+JCqoMtoNEjBi2/2tpHbENczLetVgx/OOv0CAZ9+n5d3vuph2X3xCltO+LBcpzHLbpvPIQvKxVn+NYr4DJehmOK0D3H2zkNKLlBqQqXBbb2Q8BjZWnkH9uhsE2aeWlN3IAfJfPHOFeg649SeoT3JbU85ryx3H56tzXxH8TE//IqvMhd6uVe4Y/XRO+5WSMSA4QmlTfY1JwVeJNDu8/C8/V8NCBddxvYIoIQ2XzHe2dXwD36m/uOZE6CmqC/edwFAzPeN+wS7FD2cFKSfWT8nqWXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mJXX/NYVVwIJshcFKVeOt+B/vsNcYsYGCDft3MVdsw=;
 b=TexQATGZ15UskSziLaN8LiaHSQji3Ddh2vmg+kQDN58THdUvhkRee5bn7QJV4fr2yhGCa+WlbPwtGJz/Zj6JvXVVGkVi1CwYHiZ7QJbgjr5MVJvZejkqvL82jAregZ34IW1itKjVqJ2TNxk0ZUi8nw1fIh8jP5mLBbHDktQtZH4hWeOiUR2wPDQZA+fWN4lp7o7E94mfWan/dCfG+EjwztiPmAQ/bblaB3pTy9c2UGcgK/0ZwSTCCeJmIfFRzW92MqbxHEN6QusCVepjZNlaGSAcJQskZdWSo7hGn0nfmPq3IqfuI6GYcYPkm+OOFzuwDO0BX31E5QIqlW+EX+6MIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mJXX/NYVVwIJshcFKVeOt+B/vsNcYsYGCDft3MVdsw=;
 b=SQBZtb9XoZICvjdPDgGojbJRkQCSvw0iVjBjZC82Y7wdga4s4BK5h1jzoKYzL0sFkdHz7KZi057D3wYVEBtF2UYkFY95QBgAjM0nMzq3H6s03/9lbe0TwOqBSjs1XZol4xLOAcaRz/NsVPyQlpL/b4j7wqWryLYDAi4P2Xq8ATM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by LV3PR12MB9144.namprd12.prod.outlook.com (2603:10b6:408:19d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.13; Fri, 16 Feb
 2024 21:47:20 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994%6]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 21:47:20 +0000
Message-ID: <5511cbc2-9ae8-45d7-b665-8c8c5d329280@amd.com>
Date: Fri, 16 Feb 2024 16:47:15 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/28] Plane Color Pipeline support for Intel platforms
Content-Language: en-US
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 arthurgrillo@riseup.net, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, sean@poorly.run,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::12) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|LV3PR12MB9144:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe2e8c3-6995-4db4-79f7-08dc2f38da2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QjfXDUCIJHiepCoSXrqDFGj+2gy41NPYyhYv+MR69vRXMeNKkHem1G2fWXfeMdNBeTa9rNaNeIPX9x6eQmCAPUHxKS6sg4F1/2YMWxVGEQkaX7Zw4kAmEyry/sGa/cahFWux3hv6PrHu9DEe8HS3tKjHrIlBuChnCjEQ6KcVyCnBZdJG06rF6yRTw1LwBWTWWSrppB29J+GIs7D25k09tJ/hIStRQsadrEhAUip4GGwOG+O5TyVpznB6awzfb71CJLZyb1LeMQ5CVf4xjAV52B1heBYU9nNF7WfdLML/0GtDaVg5h8ldHpAxICPu03xSHMOm0F+7ojDUHArHCYKdPA5cY4Lt8QhTXu2h4dhiRZRxG14G2FQe/gbpLFjGkH01S/s9H0N4fu+TXSxrunjMp/xJYuREHZcmWO9dzImAb87FQsszcyhTH7wKvo3rF5BRSl2N3uHYNeMWfIzMTE1nSJ5nzKB/bRxfrV0sEHHLdwIHfdD3N1yCcG5OFjelCJY6LFyIzJg5KEMiBX9uHi/MObYXpcOa1pGiNBIQwcqawWQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(136003)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66574015)(44832011)(2906002)(83380400001)(6666004)(316002)(41300700001)(2616005)(66946007)(478600001)(6512007)(966005)(6486002)(6506007)(53546011)(4326008)(8936002)(5660300002)(8676002)(66476007)(7416002)(26005)(66556008)(31686004)(31696002)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1BUQ2M2cWhuakM0NkE3K0ZkalZOazI4aU1yUjRiUytsR2RMbHlBSVVvT0lZ?=
 =?utf-8?B?WnhMM2g3SW1GKzlJeGhOdEFCYUtLaXBxRUFtS3RPZnNTWkF5ZzhDWXdtemdm?=
 =?utf-8?B?YTVxVUJjSC94MCtMVm9Vd05LTjFrLzN6aFNVWElOYTYzUUN4K2N1RWl5aVVC?=
 =?utf-8?B?bUcxMTI3U0RoVGQ5QkN1RmorWU5WNG84TE1pSjRqdU91UTdDL3pveE5Mc0pO?=
 =?utf-8?B?eTNJbVZFTTd5VVZDZnlZak41NkVHYWtWYXVwbUQzQ01NaHo3QlloVFIzQ29w?=
 =?utf-8?B?WnFBMUw3d1hmVzBXaDhXaVAxRGIwRCtpUjkvUjFpa3FGa0lKOTRTcG41dERh?=
 =?utf-8?B?cisyV0htZjR2VWZXdE1GZjNCemcwUzZiQUVUN1hVOTUxRjQ4UGFzSXF0NjJt?=
 =?utf-8?B?cVFCTVVOakxReVdZV0JBc3NDcndoRXpZU3dqQXQ0cTBlVUZweXF2TmV2MkFN?=
 =?utf-8?B?RlIxa2dieCsvbjlEaHNKRFJIb2JnaDNFY3loa1ByS2dIZ1RpdTdiS0ZjR1ZK?=
 =?utf-8?B?YWU5T0l5bDlScUZETXRHanE0R2FUSzJqQm5nWktaU05YQjFKOUNTM2pVMWJG?=
 =?utf-8?B?U2RzMjNndUZ5amdaS2FzNmlZOGE5NXZPYTRUdVlRNjRQdmptUjhCeWUreVc0?=
 =?utf-8?B?cGNtVVFOVldGRWwwcmhSTHFnTk9rR250OWdKNnQ5bWNsc3h4UjZ4akVJVFR1?=
 =?utf-8?B?TUZhZkhpOWtkV2hRZkRXb1QwVzJ0dlZlK09kRWphU2JEUjY3bmVKVC9mUm0v?=
 =?utf-8?B?TGsyUHE1RW5BbzVPMXMyT2xDMXpuU0ZOMmJPMmgraXIrbEZINmVYdmYvMnBu?=
 =?utf-8?B?eHQ0eG9yY0oyVkU3SmVIc25ZN2FKN0tqUWxXSFJ6RkFCbWlLbUUvcjN5OFhE?=
 =?utf-8?B?anFORUVHTThSVEkrU0wwa1VFTDlKaVZEZkhJR1lPTXVrWTF5bit5T1Z1MFNZ?=
 =?utf-8?B?eHZ4OFBFZHRpMXNxcVo5NjZ0bzIvaU5jSXBMK3FLMHhMTkd2dkZPSEs5eWtM?=
 =?utf-8?B?cjFWaFk1NlhuWCtyaU80dkc4dkxld1YwanhBNVllSkdTUUNuZk9RYmo1elUv?=
 =?utf-8?B?dVE4UWg5b3piRGtSTTBwQ1RZckFKc2lXaEFjT09xYzN6UEExYXNHeTFtVDY4?=
 =?utf-8?B?Yis5Rlo5L1RHc1M0NUV3QWJwMUdhZXlPU2o3WnAxRzZSSGtJak9NV3drTUhI?=
 =?utf-8?B?elFGTUxVWTE2RmtlcXFRY3pWenJjZG0vMVJQeXJTTlUrR1lFU0U3Wll1ZjdO?=
 =?utf-8?B?UFU5QUozK1BwbjlaeUNhSFpRYVBUYnBwUjd3ZHg4dGJ0QVk0TWxrSkhVcmtW?=
 =?utf-8?B?OUJWQU5wbmJ3NmNwNWQ0SXZETi9ueVV6UDVGZmplRGlaUXBsaUR2d3VPMmRR?=
 =?utf-8?B?OTJIYTNwcDR4VldSSE1DcmJLc3ZKVnpmU2RNSkZBYVpxVTIyUStVb2x4Umxu?=
 =?utf-8?B?Qm5IR1pSRDR5bUQrdXcwUGExL2YrcWRnWmhyMytwbVB3OUVVdEQza0ZLdG5z?=
 =?utf-8?B?T1BXY3hzNEpPRFBFOVB6RGZLbThPSTBUYktHMHVRRDYwRVpsUFNvL3RGczlr?=
 =?utf-8?B?S0hhdThGcE0vc3FFOUovSkl0QnZ2clVhL0RTMVBtTWRjY3EvTVBDUnJxdE5Z?=
 =?utf-8?B?M0lOSU9qSlY4QTVPeXJ5dFFBeUNuaCtCam5qb0hsNFExRjFpNTFqR3FGTlhV?=
 =?utf-8?B?NW9VaS9Qbyttd1VIdmdvRlYrUmJvK1lHYjJQWEZGV2FXSEd4emdrUmpoYTc0?=
 =?utf-8?B?c2dJdncxbWFJVzRwU1JuYjZCZmIraVVmYnRxUGdMN1ZyVy9rczVsb3ZMSEZZ?=
 =?utf-8?B?US9RMzR2MlVTRitNZzBnTlEwZWV6N1gvUkozRG9ML1RhRUhlcWpPTENCZGRt?=
 =?utf-8?B?R1Y0bHR4N2hIbjFMeDdqVTkvcnQ1dFJITDNEYmxZVGE0RTdVSUFmNjRld0xL?=
 =?utf-8?B?R1VOYzBvaGxDYzZaYllwbUxKN0F4UGcvWnJEUXBnVGk3M3FOUlNJbjVRUit5?=
 =?utf-8?B?dTVyNkV2UzRPeC9iQXdZUjRXa2tTQndxUERxN3RIeHpHck54VUV4c1UwQklB?=
 =?utf-8?B?WWhRaUNHKzRxQ3NDM0tpU1I5R1lnUjNnRU0ycUFYK082bEhPYUlrWmhhdXZL?=
 =?utf-8?Q?JCcCQ9r/8lads8lpAkbACcpAR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe2e8c3-6995-4db4-79f7-08dc2f38da2e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 21:47:20.6727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ps0+Bo7GLOnMUFe6F03uC4GS7Ax259EEYmT2BeUDYIxuJpIwPcMuXRZSFnZ7hs/ycJbSdVN93oT5V2Wv9kqU7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9144
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



On 2024-02-13 01:48, Uma Shankar wrote:
> This series intends to add support for Plane Color Management for
> Intel platforms. This is based on the design which has been agreed
> upon by the community. Series implementing the design for generic
> DRM core has been sent out by Harry Wentland and is under review
> below:
> https://patchwork.freedesktop.org/series/123446/
> 
> The base work of above series is squashed under 1 patch and support
> for Intel platform is added on top of it.
> Any reviews on the original core design is expected to be done in 
> Harry's series to avoid any forking of the discussion.
> 
> We have added some changes/fixes to the Harry's core DRM changes,
> being put up as separate patches on top of squashed patch. These are
> expected to get included in the main series from Harry once agreed upon.
> 
> Changes added on core design:
> 1. Below patches implement some fixes on original series
> drm: Add missing function declarations
> drm: handle NULL next colorop in drm_colorop_set_next_property
> drm: Fix error logging in set Color Pipeline
> 
> 2. Implemented a HW capability property to expose segmented luts.
> drm: Add Color lut range attributes
> drm: Add Color ops capability property
> drm: Define helper to create color ops capability property
> drm: Define helper for adding capability property for 1D LUT
> 
> This helps in generically defining the hardware lut capabilities,
> lut distribution, precision, segmented or PWL LUTS.
> 
> 3. Added support for enhanced prescision, 3x3 matrix and 1d LUT:
> drm: Add Enhanced LUT precision structure
> drm: Add support for 3x3 CTM
> drm: Add 1D LUT color op
> 
> On top of this base work for DRM core plane color pipeline design,
> implementation is done for Intel hardware platforms. Below patches
> include the same:
> 
> drm/i915: Add identifiers for intel color blocks
> drm/i915: Add intel_color_op
> drm/i915/color: Add helper to allocate intel colorop
> drm/i915/color: Add helper to create intel colorop
> drm/i915/color: Create a transfer function color pipeline
> drm/i915/color: Add and attach COLORPIPELINE plane property
> drm/i915/color: Add framework to set colorop
> drm/i915/color: Add callbacks to set plane CTM
> drm/i915/color: Add framework to program PRE/POST CSC LUT
> FIXME: force disable legacy plane color properties for TGL and beyond
> drm/i915/color: Enable Plane Color Pipelines
> drm/i915: Define segmented Lut and add capabilities to colorop
> drm/i915/color: Add plane CTM callback for TGL and beyond
> drm/i915: Add register definitions for Plane Degamma
> drm/i915: Add register definitions for Plane Post CSC
> drm/i915/color: Program Pre-CSC registers
> drm/i915/xelpd: Program Plane Post CSC Registers
> 
> Bhanu from Intel will be sending out the igt changes to help test the
> color pipeline implementation based on the current igt changes sent out
> by Harry.
> https://patchwork.freedesktop.org/series/123448/
> 
> Planned Next Steps:
> 1. Work with Harry and community and get DRM core changes for color
> pipeline merged.

We'll need a userspace to implement support before merging, but we're
working to enabling all color properties gamescope currently uses for
the SteamDeck color management to the Color Pipeline API, which should
help us get there. It's still a journey but I think the path is clear.

I'll send a new version of my patch series next week, including some AMD
implementation (not the entire AMD pipeline yet).

We're also adding a 1D_LUT type that's much simpler, basically a copy
of what the drm_crtc currently uses. One option is to keep both types,
another is to see if AMD's LUT can be expressed using the caps that you
define. I think it should be possible to express it as a single segment.

There might be another few changes in the core that might help you. Like
seeing the value of the client cap in the driver.

It's really good to see your work. With that we'll have three driver
implementations: VKMS, Intel, AMD,, which shows broad usability of this
approach.

Harry

> 2. Implement pipe color management (post blending) based on the current
> color pipeline design.
> 3. Work with compositor maintainers to get color processing implemented
> using display hardware, thereby avoid any GL or GPU shaders.
> 
> Thanks to all the community maintainers and contributors who have helped
> to get this support in upstream Linux. Looking forward to collaborate,
> work together and get this merged.
> 
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Jonas Ådahl <jadahl@redhat.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Alexander Goins <agoins@nvidia.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Michel Dänzer <mdaenzer@redhat.com>
> Cc: Aleix Pol <aleixpol@kde.org>
> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> Cc: Victoria Brekenfeld <victoria@system76.com>
> Cc: Sima <daniel@ffwll.ch>
> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
> Cc: Christopher Braga <quic_cbraga@quicinc.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> Cc: Hector Martin <marcan@marcan.st>
> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
> Cc: Sasha McIntosh <sashamcintosh@google.com>
> Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> 
> Chaitanya Kumar Borah (16):
>   drm: Add missing function declarations
>   drm: handle NULL next colorop in drm_colorop_set_next_property
>   drm: Fix error logging in set Color Pipeline
>   drm: Add support for 3x3 CTM
>   drm: Add 1D LUT color op
>   drm/i915: Add identifiers for intel color blocks
>   drm/i915: Add intel_color_op
>   drm/i915/color: Add helper to allocate intel colorop
>   drm/i915/color: Add helper to create intel colorop
>   drm/i915/color: Create a transfer function color pipeline
>   drm/i915/color: Add and attach COLORPIPELINE plane property
>   drm/i915/color: Add framework to set colorop
>   drm/i915/color: Add callbacks to set plane CTM
>   drm/i915/color: Add framework to program PRE/POST CSC LUT
>   FIXME: force disable legacy plane color properties for TGL and beyond
>   drm/i915/color: Enable Plane Color Pipelines
> 
> Harry Wentland (1):
>   [NOT FOR REVIEW] drm: color pipeline base work
> 
> Uma Shankar (11):
>   drm: Add Enhanced LUT precision structure
>   drm: Add Color lut range attributes
>   drm: Add Color ops capability property
>   drm: Define helper to create color ops capability property
>   drm: Define helper for adding capability property for 1D LUT
>   drm/i915: Define segmented Lut and add capabilities to colorop
>   drm/i915/color: Add plane CTM callback for TGL and beyond
>   drm/i915: Add register definitions for Plane Degamma
>   drm/i915: Add register definitions for Plane Post CSC
>   drm/i915/color: Program Pre-CSC registers
>   drm/i915/xelpd: Program Plane Post CSC Registers
> 
>  Documentation/gpu/rfc/color_pipeline.rst      | 352 ++++++++
>  drivers/gpu/drm/Makefile                      |   1 +
>  drivers/gpu/drm/drm_atomic.c                  | 147 ++++
>  drivers/gpu/drm/drm_atomic_helper.c           |  12 +
>  drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
>  drivers/gpu/drm/drm_atomic_uapi.c             | 170 ++++
>  drivers/gpu/drm/drm_colorop.c                 | 335 ++++++++
>  drivers/gpu/drm/drm_ioctl.c                   |   7 +
>  drivers/gpu/drm/drm_mode_config.c             |   7 +
>  drivers/gpu/drm/i915/display/intel_color.c    | 562 ++++++++++++
>  drivers/gpu/drm/i915/display/intel_color.h    |  16 +
>  .../drm/i915/display/intel_display_limits.h   |  13 +
>  .../drm/i915/display/intel_display_types.h    |  17 +
>  .../drm/i915/display/skl_universal_plane.c    |  19 +-
>  drivers/gpu/drm/i915/i915_reg.h               | 124 +++
>  drivers/gpu/drm/tests/Makefile                |   4 +-
>  drivers/gpu/drm/tests/drm_fixp_test.c         |  69 ++
>  drivers/gpu/drm/vkms/Kconfig                  |   5 +
>  drivers/gpu/drm/vkms/Makefile                 |   4 +-
>  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>  drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 355 ++++++++
>  drivers/gpu/drm/vkms/vkms_colorop.c           | 115 +++
>  drivers/gpu/drm/vkms/vkms_composer.c          | 117 ++-
>  drivers/gpu/drm/vkms/vkms_drv.h               |   8 +
>  drivers/gpu/drm/vkms/vkms_luts.c              | 802 ++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
>  drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
>  include/drm/drm_atomic.h                      |  87 ++
>  include/drm/drm_atomic_uapi.h                 |   3 +
>  include/drm/drm_color_mgmt.h                  |  23 +
>  include/drm/drm_colorop.h                     | 274 ++++++
>  include/drm/drm_file.h                        |   7 +
>  include/drm/drm_fixed.h                       |  18 +
>  include/drm/drm_mode_config.h                 |  18 +
>  include/drm/drm_plane.h                       |  10 +
>  include/uapi/drm/drm.h                        |  18 +
>  include/uapi/drm/drm_mode.h                   |  83 ++
>  37 files changed, 3815 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
>  create mode 100644 drivers/gpu/drm/drm_colorop.c
>  create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
>  create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
>  create mode 100644 include/drm/drm_colorop.h
> 


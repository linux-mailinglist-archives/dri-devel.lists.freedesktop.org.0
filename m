Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B57655EEDC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 22:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C00112902;
	Tue, 28 Jun 2022 20:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01818112902;
 Tue, 28 Jun 2022 20:13:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFvsTwikFOvmjmPWIiQTPLHi5Rh2StR+oWBPIZ1CKxTPqVoWdHMfp3KV2m91bmzRFG8TM3491Bw/y1ZJZH31VVu2Sd6wFMaxtazr1YgDOT5jTmkkPI37qiCxmUA+zg/ocYT6LQiHy9i+TjqH3MxMaP+5CInCK04XZylaBBtqt68eYItuSfCEJ/MP6vGQVuRWEamu1lxbf1xkj/h2DDUTSe1gjOrhb4Z+z1TT3/hTXX7+dOEgFnKn6rikcUZoeZ1fPzlc0OfmoM32Hzi5tEZJf7EexINeKJC2EdGK62rsdHw92otKx3/KRnAgZ2+OzEYmaBCtnhd0WNtx3LDv6cD7JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYeWtUL7/qmh0NE0Q0fsOhZ15HOZgaQF0iMgkii+JB4=;
 b=VEm+3JBvYra2E7erOWOdkKIrXO+mjS+AP5ExMn1GP8oe8tMRBaOSIgltt995Ak2+89mXZrojc6oo+XK9siOhkOZ+6D6mBHIK7wsOMf57evikh60fH7JDTQRPl7u1CFmWVl4zUlFnF8VI5njPjcxDP1ICzU3nBBtKp5ZHOv0L5uiGjWHbQYCbwnFdp1gCB1s70omonR7JEGt/d947yhqJwiHbCrXz1faU4L4qM65tBUHpA8K1HUx0TRubrtdJQOUO5eCe6IgQ5IhVRBcE2SWKGV+lxFqedpEiS1fuWeMWwJlKd/Gsd115rLgx0PyiH2DCnJGfXbd1aYOeLX/5CVzp8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYeWtUL7/qmh0NE0Q0fsOhZ15HOZgaQF0iMgkii+JB4=;
 b=VHYQ/siu+qqxhS5i4LKjZbXUBd700SSjQshBFugakRY1SyECMA3cLTpiR9W5ec5KLbDrIcHoKn2TejEu7PE4zYF0Og/W2tLfAIWKPDzpf0INRlBjEKAl68qANNZSHO9fsMuUZIh2mGPl8oVYKal+GFPio02tmUPu3YyNnir0oxA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB6400.namprd12.prod.outlook.com (2603:10b6:8:b9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14; Tue, 28 Jun 2022 20:12:57 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f55b:be13:11c6:d9dc]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f55b:be13:11c6:d9dc%3]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 20:12:57 +0000
Message-ID: <288325e9-46e4-5807-6d54-a0276cca0779@amd.com>
Date: Tue, 28 Jun 2022 16:12:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 0/5] DRM CRTC 3D LUT interface for AMD DCN
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com
References: <20220619223104.667413-1-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220619223104.667413-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0218.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::6) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a10c31d-2bc9-4920-ee7c-08da5942978b
X-MS-TrafficTypeDiagnostic: DM4PR12MB6400:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sb164lbV2vGZpH4DorED1M3UJaQbQh5XSFz38A2vyxG6RLqeWkWQsWy5gRBSRBU0L1XzLF0dySkR6u2BPFZEVTvs8he2SBuUN/SJwqwCg9Z7t98rGpp2VFlwVzNt29SnLsaWYc0/BsjGKbqDZjQpO3UTZx0mSkh8P2a8zezCkKI2ItF2Wp8B73sUHyppfyx3ChROPngBKTLcFjaAbO8e6QAh6vPiBlFRekKOYO0ARI8Ge6q5wOFka4ez8Z3glovEq79qOSp2JOfUj6LHUHV7tzCR0ifyQZsT/euRfLNDv6wwUyZXeAmPqIIeQ64+O5Iu0I6/4OZXpmMABwNLD1E14gqAZSd6qsik8nD9DO5m9RDxaZhQfbtFF3z+Osrs93LBdKiyYiSjELwGvoJCdO3wLeNej6ASfttuD3vR6yK/yM63s6IB+YseUrGnGsfCFys+iDgcGL3aUjbcDIx2+72r94LLArSpqU3cF6MC45JE3whclA39ck8FInK+JV+PSR4s+O2OwB3YeV5XgAmXfDg3fUHpvv4nBso1XQGccCY8OTlRBoFAE7wBvIvQ1Zm8FgdbR6HQ7n04vD3cP1U0M6dLPwL3Tw77oDJOSiJYZq4jtBGhCmYp1Knz6lyZSV3o75n6RX4mEXBmo6HeswkfCHuXIlNmruBO54WxbCRLaszDx28n4ZotCdBpJIBp0ZRExRPJXEFaT0T1ObqPD83hBwjkx3Vi124bSjvzcn9zQL1ueUktTMygJmT/i48dd5qXndKd0yEL8PHKmUppAuAJFSyG2Din+tj53vJJZvRSq4qMaijxlWtsUV7X8SemOGGBxWq6KYPDX9+yxUR7iW5eemNAX2Y/azSYhi2kcL+Z7GsbJ1ShBBGKpaVd1Cvc75BFjkbyDr3DPuUkHKLf4wjPblELMWsLAsjWVX3gyRGGtgMi6jk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(36756003)(38100700002)(31686004)(83380400001)(31696002)(53546011)(6506007)(921005)(86362001)(186003)(26005)(6512007)(2616005)(41300700001)(5660300002)(6636002)(66556008)(66946007)(4326008)(478600001)(316002)(6666004)(66476007)(8676002)(966005)(6486002)(2906002)(44832011)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1JKNks4eGx5M1ZaU0VNc05yeHFrL3ZIUFVUaDNCejhLWkFEMHFNRjlxODlY?=
 =?utf-8?B?Z1d0Mms4NlE1dWZmMit3aG5GU1gvdFV0cUlvbGx1N2NQdTdac2IyVW4rRjFt?=
 =?utf-8?B?aFhVMEZiWUp1TVVPWGk1WjJ5NlpPVmZWRFQrWjRLTWI4Y0JBczlpUnduS2NS?=
 =?utf-8?B?R2dLU08zam9KZE5wUWpCTkt6ZDJxSm9ndUtDcDJMRWprMnE2MGNxWnZ4RE9Q?=
 =?utf-8?B?NlZLUkFpOGVoSDhISDRMZXh0WXBGU21XcUwxbXNoaTVPekhrSWUrUm5jVklF?=
 =?utf-8?B?b29aemVoa0lYOFRkNmxlSzNLSzF4bld0c3RZM1AxZDFtOEZPeWc3aHhzTkt1?=
 =?utf-8?B?K2RPeXkwU1BGNTNTNmJWYXBSN0hGZFRCUDVrMllFZW9mUTNaU2wyZDNVNE1Q?=
 =?utf-8?B?d2ZKZmRKZGo3YVQ1dmF5ZEdoK09KT25iNUFFQ3l0R1V1VFdKWG1iQWxmd2lW?=
 =?utf-8?B?YmNWVVU5L2xPU0NxdTdzUk1veStKVlBkeG5QYU85VFAyUitEMEo4dXBqYUlD?=
 =?utf-8?B?bEU4bElQaUxUWnpvbzlJYVJ2SEFCSmZkWlRFS1h5S0hkMGhSUU1UUWdCOXFX?=
 =?utf-8?B?TjNBL0JMUHJldUNxNWpQdjBnc0thSmJPUENGT0Q5U3RUMEZwdkIwRGltU2VR?=
 =?utf-8?B?aHdOb2FLaEdqdVo5d3piRVQ2bnNIRnBPREY4S3p0QXR0dlBXM2ZHVzk0RHkz?=
 =?utf-8?B?ZWN5aEdMdnhOSGtuUVc5ZW5aa0NpYlZiWlVWSXN0ckF4eFl3akZhMVVTTUYv?=
 =?utf-8?B?UXRjOU9vRy9zeCtvQ2loUDlTRGZSa09tQmlGNm52ODNIeGpLV2xTVDJXN3JG?=
 =?utf-8?B?NHhMZnpCdkRDWTNkenBVVk9STGtaQURyMDNYRnVYU25tQzYzWTVTbE1xVDEy?=
 =?utf-8?B?aUhwU1VIRVpkRFk1ekU5SFU5MWlkTEl4R3BibXAzK3JIT0tndnZicTNwOEFX?=
 =?utf-8?B?MnpHamhLajdDcitRV1R6WnhmWDNaWEUzUnY3cHdDbkgrZjBBMnNIU1lCUWNX?=
 =?utf-8?B?R3JBR0dBTk85Y1Vxa21XVDhRRGxYVENPVTYxUWlueFNaV0tlN3U5WjFJZXVt?=
 =?utf-8?B?UUJJdFhlVzJ0a1RFY29lcmFOUXhkUnVYb0M5VUdjc1I5VDZpTFZ5TnI5Q1N4?=
 =?utf-8?B?RjFCNkhEL3NUaGlUbDdTeG03cy96MnlYZTRaVk9razc1cVhyTnd6WjdwV3Ja?=
 =?utf-8?B?WTJWb0pkQ0ZVR2VCR3FhNEJNcUFLU3VjODQxTHc5VVF1cWxsM25oNytQcWRD?=
 =?utf-8?B?dWNyNW9YUHVGSHFvTW1GTmJKc09nUzM3bmczMmNHREZTL2RmNDlXSCtrSW1h?=
 =?utf-8?B?VXpqNGk0R3A1WGFYNFBSZ3F1WThQRXdJdkVCNTRrV1Foa1hxWnZFZ3lHeXpX?=
 =?utf-8?B?VlBuNXdGM2tGRTZROTVHeFl0cWo4ZkF1MTBhRCtCRzRUSmtPWjNyTGN1OC8w?=
 =?utf-8?B?akFGQ0xwaUd2b3ZyZ2RuWHIxRGt0Q3hDdTVRSGlZOWdoblkraVhjZWxIcm92?=
 =?utf-8?B?OEJrQmVJNCtZUmVCV3pQMWJ1cVNiZm9MeHpZTkhpRVl0aTF1ZDI3RVJjOVhz?=
 =?utf-8?B?aG5WVkRhaTRuVEV0QWE0OXhPNGlJekI4eHBmQnk0aDBmY0hweVBUMGFZaEdr?=
 =?utf-8?B?L3BvdksrNXFQVUFza0xSV01wNWM5ZWxSQWxOWWxkNWJQNVROZ3paM04xZWFy?=
 =?utf-8?B?UXlON2lWWFZSckI2N3o0aFNaQXJYV20yS3JjU2lJdU1KNzNBNEpDWW95Y2F0?=
 =?utf-8?B?Vzd3MGJtck5Ccy9RRXR2S1BubFJ4Vk43YnJYcXFrbDFZeGlTaVF4dzB5WTVn?=
 =?utf-8?B?QThVaDZRRStCdTNJblhwSUZzT3dZNHBmNmNSeXZOeEVuWjVpOWdHV2FQSzhE?=
 =?utf-8?B?cFJ2VUlrbW1QUWFEVkRhSEowSEtLRDNGemF0MWZRMnE0OUh5dEc5WVF6UlZp?=
 =?utf-8?B?M1JCcFVUd0x2Uld2NytDV0EvK0tJeGR0c2tYYmFkMGdjVDJ6NUtGS3Z5WXZw?=
 =?utf-8?B?cWZOdnBaZjVtWVYzRGliSVJqUHdBUDl0c3d1S0hCY1hvbTV6elJLcDkyaHVP?=
 =?utf-8?B?Q25vbnNHRWFwVkE5elhwellIR3g1NGw3cmx6SEs0b3ZLSEhTSHhRTmFEM05j?=
 =?utf-8?Q?yEVGXPE+bZuZyPTVNApw/Kg4J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a10c31d-2bc9-4920-ee7c-08da5942978b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 20:12:57.3308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9njI20Ra5HffIPCD+cXD/vZgwP23VGj7TRqD1EodON0C8+JG7Fh55P3NXai/Nhp5bpaIgbALjQ21TMhxoJVVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6400
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
Cc: alex.hung@amd.com, amd-gfx@lists.freedesktop.org, nikola.cornij@amd.com,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 bhawanpreet.lakha@amd.com, nicholas.kazlauskas@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-06-19 18:30, Melissa Wen wrote:
> Hi,
> 
> I've been working on a proposal to add 3D LUT interface to DRM CRTC
> color mgmt, that means new **after-blending** properties for color
> correction. As I'm targeting AMD display drivers, I need to map these
> new properties to AMD DC interface and I have some doubts about the 3D
> LUT programming on DCN blocks.
> 
> First of all, this patchset is a working in progress and further
> discussions about the DRM interface should be done. I've examined
> previous proposal to add 3D LUT[1][2] and I understand that the main
> difference between them is regarding the property position in the DRM
> color management pipeline (between CTM and Gamma 1D or after Gamma 1D).
> On the other hand, AMD DC always considers a shaper (1D) LUT before a 3D
> LUT, used to delinearize and shape the content.  These LUTs are then
> positioned between DRM CTM and Gamma (1D).
> 
> By comparing the AMD design with the other proposals, I see that it's
> possible to cover all of them by adding and combining shaper (1D) LUT
> and 3D LUT as new color mgmt properties. Moreover, it'll not limit the
> exposure of AMD color correction caps to the userspace. Therefore, my
> proposal is to add these two new properties in the DRM color mgmt
> pipeline as follows:
> 
>  +------------+
>  |            |
>  |  Degamma   |
>  +-----+------+
>        |
>  +-----v------+
>  |            |
>  |    CTM     |
>  +-----+------+
>        |
> ++-----v------++
> ||            ||
> || Shaper LUT ||
> ++-----+------++
>        |
> ++-----v------++
> ||            ||
> ||  3D LUT    ||
> ++-----+------++
>        |
>  +-----v------+
>  |            |
>  | Gamma (1D) |
>  +------------+
> 

As Ville already mentioned on patch 4, the increasing complexity of the
color pipeline and the arguments about the placement of the 3D LUT means
that we will probably need a definition of a particular HW's color
pipeline. Something like this proposal from Sebastian:
https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/11

> However, many doubts arose when I was mapping these two new properties
> to DC interface. This is why I decided to share an not-yet-completed
> implementation to get some feedback and explanation.
> 
> This RFC patchset is divided in three scopes of change. The first two
> patches document the AMD DM color correction mapping. Some comments were
> rewritten as kernel doc entries. I also summarize all information
> provided in previous discussions[3] and also redid those diagrams to
> svg. All doc should be reviewed and some struct members lack
> explanation. I can add them to documentation if you can provide a
> description. Some examples that lack description so far:
> * in amdgpu_display_manager: dmub_outbox_params, dmub_aux_transfer_done, delayed_hpd_wq;
> * in dpp_color_caps: dgam_ram, dgam_rom_for_yuv;
> * in mpc_color_caps: ogam_ram.
> 
> The next two patches expand DRM color mgmt interface to add shaper LUT
> and 3D LUT. Finally, the last patch focuses on mapping DRM properties to
> DC interface and these are my doubts so far:
> 
> - To configure a shaper LUT, I related it to the current configuration
>   of gamma 1D. For dc_transfer_func, I should set tf according to the
>   input space, that means, LINEAR for shaper LUT after blending, right?
>   When 3D LUT is set, the input space for gamma 1D will no longer be
>   linear, so how to define the tf?  should I set tf as sRGB, BT709 or
>   what?
> 

We don't know the input space. It's nowhere defined in the KMS API. It
entirely depends on how a compositor renders the framebuffer (or transforms
it using some future KMS plane API).

DC interfaces are designed for a system where the driver is aware of the input
color space and linearity/non-linearity. This means that you'll often need
to dig through the API down to the HW programming bits to understand what
it actually does. A leaky abstraction, essentially.

Because KMS drivers don't know the linearity/non-linearity at any point
int the pipeline we need an API where the KMS client provides the
appropriate shaper LUT. In the case of any current KMS client that
will always be non-colormanaged and is assumed to be sRGB.

If your framebuffer is non-linear (sRGB) and you're not linearizing it
using the CRTC Degamma you'll already have non-linear values and won't
need to program the shaper LUT (i.e. use it in bypass or linear).

If your framebuffer is linear and you're not de-linearizing it with the
CRTC Degamma LUT you'll have linear values and need to program the
inverse EOTF for sRGB in your shaper (or degamma) LUT.

> - I see the 3dlut values being mapped to struct tetrahedral_17 as four
>   arrays lut0-4. From that I am considering tetrahedral interpolation.
>   Is there any other interpolation option? Also, as the total size of the
>   four arrays is the same of the 3D LUT size, I'm mapping DRM color lut
>   values in ascending order, starting by filling lut0 to lut4. Is it right
>   or is there another way to distribute these values across lut0-4 arrays?
> 

We seem to do this on other platforms (illustrating for red only)

for (lut_i = 0, i = 0; i < lut_size-4; lut_i++, i += 4) {
	lut0[lut_i].red = rgb[i].red;
	lut1[lut_i].red = rgb[i + 1].red;
	lut2[lut_i].red = rgb[i + 2].red;
	lut3[lut_i].red = rgb[i + 3].red;
}
lut0[lut_i].red = rgb[i].red;

And yes, it uses tetrahedral interpolation.

> - I also see tetrahedral 9x9x9, that means DC supports 9x9x9 3D LUT too?
>   If so, does it depend on hw caps or it is defined by the user? Also, I
>   see 10 and 12 bits color channel precision, does it depend on hw caps or
>   it is also defined by the userspace? Any ideas on how to expose it?
> 

This is user-configurable, HW supports both 9^3 and 17^3 and both 10 and
12-bit variants.

> - Why func_shaper and lut3d_func are defined as constant on
>   dc_stream_state, while the other color properties are not? How should
>   I change them from the proposed DRM properties? should I set 3D LUT in a
>   different struct of the DC interface or a different DC pipeline stage?
> 

It's a pointer to constant struct. If you want to change it you should
allocate a new func_shaper or lut3d_func struct.

See https://www.internalpointers.com/post/constant-pointers-vs-pointer-constants-c-and-c

> - In mpc3_program_3dlut(), why we are setting is_12bits_color_channel in
>   get3dlut_config(), since right after that we are changing its values
>   with this line `is_12bits_color_channel = params->use_12bits`?
> 

We're reading the HW default to be used unless someone sets use_12bits
but then we're always setting it based on use_12bits anyways. We wouldn't
need the former but it's code that's never hurt anyone. :)

> - In mpc3_set3dlut_ram10(), there is a suspicious comment for a shift
>   operation: `should we shift red 22bit and green 12? ask Nvenko` So, is
>   this operation stable/working as expected?
> 

You can safely ignore this, at least as long as your LUT programming works.
If it doesn't this comment is an indication of what you can try.

Harry

> Thanks in advance for clarifications,
> 
> Melissa
> 
> [1] https://lore.kernel.org/all/20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com/
> [2] https://github.com/vsyrjala/linux/commit/4d28e8ddf2a076f30f9e5bdc17cbb4656fe23e69
> [3] https://lore.kernel.org/amd-gfx/20220505220744.3sex7ka2ha2vcguv@mail.igalia.com/
> 
> Melissa Wen (5):
>   Documentation/amdgpu_dm: Add DM color correction documentation
>   Documentation/amdgpu/display: add DC color caps info
>   drm/drm_color_mgmt: add shaper LUT to color mgmt properties
>   drm/drm_color_mgmt: add 3D LUT to color mgmt properties
>   drm/amd/display: mapping new DRM 3D LUT properties to AMD hw blocks
> 
>  .../amdgpu/display/dcn2_cm_drm_current.svg    | 1370 +++++++++++++++
>  .../amdgpu/display/dcn3_cm_drm_current.svg    | 1528 +++++++++++++++++
>  .../gpu/amdgpu/display/display-manager.rst    |   44 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    2 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |    5 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  265 ++-
>  drivers/gpu/drm/amd/display/dc/dc.h           |   53 +-
>  drivers/gpu/drm/amd/display/dc/dc_stream.h    |    4 +-
>  drivers/gpu/drm/drm_atomic_state_helper.c     |    7 +
>  drivers/gpu/drm/drm_atomic_uapi.c             |   20 +
>  drivers/gpu/drm/drm_color_mgmt.c              |   89 +-
>  drivers/gpu/drm/drm_fb_helper.c               |    5 +
>  drivers/gpu/drm/drm_mode_config.c             |   28 +
>  include/drm/drm_color_mgmt.h                  |    4 +
>  include/drm/drm_crtc.h                        |   24 +-
>  include/drm/drm_mode_config.h                 |   25 +
>  16 files changed, 3411 insertions(+), 62 deletions(-)
>  create mode 100644 Documentation/gpu/amdgpu/display/dcn2_cm_drm_current.svg
>  create mode 100644 Documentation/gpu/amdgpu/display/dcn3_cm_drm_current.svg
> 


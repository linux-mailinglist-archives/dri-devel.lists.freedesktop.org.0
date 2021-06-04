Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBDD39BF85
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 20:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D89B6E165;
	Fri,  4 Jun 2021 18:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2077.outbound.protection.outlook.com [40.107.95.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4D36E165;
 Fri,  4 Jun 2021 18:24:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpcYVsvTCGSvfAv8hP2yNOoIyU/gZ78pEBl65sYss3bmPP61qriwPrBMWgxdAkG0vUmVmKWhefqsg+IZ4HrdxDxzsfwuiRR2Dg2N/ItjlWlhOR5utVdpw7Uej2oSnhFBBowDE9yJNs0E2U55wFgpeCg0HXivn+hE5aLDNDs7Qyeg32CxqPAhroQvdaemwmIKq1S0aXo838vzXqR2bi777OmBd5u2qJEDvHtdNBQ0Dcwg9YKzKHOkbQkwOwznDgE+7LFcypuwwsHjogQ96wg8I0dsOveDxLpTi3+4ZV9BH3iraCVr36vrBcwZRvO2HLCu37VrfewbQZOAwkcgIswshQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHUE9k9bmyumRMmPmaL8bBPP6/Rv5s+2Crf42Qy+VSQ=;
 b=YOEtYtGznxER4mwZQDYJ0AKxg21V7aR758RuTaHoCWKDOuEJ4xUURWSdIMVL0ck1e32FmHaRLveFB0JdGVpDmsSAuMQKmytTMvczDAiK7RBk/3H1xSUykf+AqhvhmSJGOt354mHjMdJF3W32YufO0JiOgxbbCD2E8IlB9/ljsOCL9eR56p8dW3VPXMGXbja3EBZcKyqJRX17g2iv5pIJObYiqKQsgSQc0hC+9kWxHS+Dr2BuK95iUX3d78jTXEXOfqKMWdOf0kuOwyxsLI8W6XaLQZhBptDIWU7cGWN01fOeqzX0yqpOX9F7EFuChlU7guY+kCorOLAMmIRzZ0lKfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHUE9k9bmyumRMmPmaL8bBPP6/Rv5s+2Crf42Qy+VSQ=;
 b=2JqnQckEn58QZG6ebkcs8Os5pydmTEPHCkVfVGndukJ8HphdjWjO+vhnY9KZqYnBR46yQJ0dacCMe5v0Z/6QyGY+PQ2xcLG5k9p5bI2r9dm2SBKhsp8wgBqts/Fr8BpqYz7gcouSVYcH4oLcjeVIA9kWpeVopmgS1aAt9vmXuno=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 18:24:32 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753%3]) with mapi id 15.20.4195.025; Fri, 4 Jun 2021
 18:24:31 +0000
Subject: Re: [PATCH 02/21] drm: Add Plane Degamma Mode property
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210601105218.29185-1-uma.shankar@intel.com>
 <20210601105218.29185-3-uma.shankar@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <2154f1d1-2c86-ede7-4b23-acab93e3eb00@amd.com>
Date: Fri, 4 Jun 2021 14:24:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210601105218.29185-3-uma.shankar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [198.200.67.154]
X-ClientProxiedBy: YQXPR0101CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::32) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQXPR0101CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:15::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27 via Frontend
 Transport; Fri, 4 Jun 2021 18:24:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdb16d13-70f1-4a08-1bda-08d92785ff2f
X-MS-TrafficTypeDiagnostic: CO6PR12MB5489:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB54890A886364FDBB1F18BF478C3B9@CO6PR12MB5489.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fz9CayxSc8byDZxD6tbU1Ikz1WPKlKc7PZubwPwrw1RfAuMxbQu4kB3Z2VGr6Z/jUQ66bgf3J8KPAaI5mMnKO7c13Tm2oFFcSRo7y76fvj3ddrpOCKA+L9IB4YND4WkcnMTfGXsh6+nQHXlwsow4PSKMaaPB8Y5mfxpJC88X15h6hutRUOTKEJdn4aD65/mPV9e2fsDul2hX1sOshte72woh6qmdjaWe70NpC9PVafzBDGPIsm7ig/4e1IjgSVOjOY/lQMIY9SNkNtSnp1plz95jWeDYk7nNcAVFNpjU9Vu0Hheg+U6MMWEUoXiNXg85xjfA6WYSr0E3i90EvhGwbVhj77RX8NlO63D8x2TcDml+9kj6MG3MHoT6UZKvkX0eo0z6V4WBb8l75254rldLuYHYnQIDo2bWHUNEcpojI4hdK/pDqqS/BSc/ZrJLSL8+CAcShfkNJ0dqeqjvk0s3c3Y0gAz606NTMqv5CSsWSu/EUipEcQcnghpf6ANWEKjeWL9LVDiUSlZcf63LoaCNs51Op3tSeg+06P3fHiWuUVugVHNwr4dI+p8wkd32TU4DTKGlhO9sRS0d++x3i1ilWVEbZhwyc8GM8tqNzCHsn/C4vOsKA3V95GivkV/uMMEMN6vcvfuLrd66NNKnAmcexZ/gV1bkuGaFIloa32M1NVMlNPvYobvfnTzuIudaWUHDMPLFvAhpjIVFVrsWkS6s1KYk3hJFy8sOYZ1fi2qU94Jak81/IrRFj+7Zo/Ngwh0jnBMIqqPXEqXjBho4hZGQDrvS2AeKFtt9tBpA4CiUnGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(66946007)(31686004)(44832011)(316002)(66476007)(956004)(2616005)(30864003)(86362001)(16576012)(31696002)(66556008)(83380400001)(38100700002)(966005)(36756003)(8676002)(186003)(8936002)(16526019)(53546011)(6486002)(4326008)(5660300002)(2906002)(478600001)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MVExMU0xSnhhc1YzOHpOOTg0OENQM0tUdGtWRUwvUXM1VVNHcWJnVG9HeVNS?=
 =?utf-8?B?Vk5KaENyU3ZjWDVGMmE2b0t3MGxMTndWckdkaXpnek5lRTEyU1p5ZnRqSFlN?=
 =?utf-8?B?emdPOXFvMG1nd2p6Z2JQemlVcG9IVWswVE9OdzRRZVAxSlpkbDBtM3hab0Vy?=
 =?utf-8?B?SDBLWUtpVzVnSDZRTkE2Q0FVUmF2dVVzd201eXNmeEFUWjRLbVNGcHNab1pt?=
 =?utf-8?B?OWxvdVE2WlV6eFpWK0ZxRWJnTFYydjR3cjZ6UU90MDNXMVdYdEJCREkyNHph?=
 =?utf-8?B?R3RXbEVCV0xZaDNwWjVxbTl5dUtkd3RTSE43UjVrUlVvSUtvTXhRL1JDVFVC?=
 =?utf-8?B?M0FTNW1SemZEcUNFaGJnTWNqYnhhK1cyZ1NrU3RlUGFTUk9kSzhxdHpXejE5?=
 =?utf-8?B?OXJGRFVTaENUK2F5RSs3WlpyUWpid09OcG1BMk5WQUZxaHYvUmhKMlBvRHNk?=
 =?utf-8?B?S1BncS9FME1EaTV3Qnk5YVBHbFFNb08vNTRBdUsvbk5GQ2pyQTBiZGJ4bnVQ?=
 =?utf-8?B?UmFNZ2JxOFBEZVVoNDgrQm5UendicUxONU54Vy8rbzZHTUtub2p2QnllM3Vy?=
 =?utf-8?B?eXNXL0JpVExKWG04WVRnMCtRNXBnWjhDN25mL1dDdzF4WDRGajBZd3RncDFP?=
 =?utf-8?B?cHkrelFXbHVIb1I1STdFdFhPNjZsaTN4bXhaMmE4cW1XUVFsU1ZJMis3TU9N?=
 =?utf-8?B?bWdhdEgzRm9LbHpxSTJ6amxZR1l0K29vd3VyaFNvZlpzaDZhZGFMRjdtTzhl?=
 =?utf-8?B?ZWlSZm1kSU52dVMrYUk1cXNQanZzSVU5cWhsRjR4UEpnT2dlK3EwL1RncXFC?=
 =?utf-8?B?d0Mzb2gyTm0vaVl4bXZVcTl1QTdJSWpyUEZOekZTOHA2aEV2RHhRa1kyM1E1?=
 =?utf-8?B?aG1WOS9YOWgrL051MmorczNvek9xeWFOaU1SNEdrdmIySDJFQnpndXdIMVVj?=
 =?utf-8?B?Z0YxNXdsTHJNblFXMUZOajBOdGt5QVl6ZlpBVHd4QmIwOStTd1ZRdGhDSHlW?=
 =?utf-8?B?Q1dSbkFZZkxUWnBWWHlrTDh6bGpjVmMwZ1VtM01FV1E5Y05aQ1dQNndXQjJo?=
 =?utf-8?B?U2E0Q1pxV3lkNkkxRHhoVE9ld3FjRWMwR0pNOVRRYWF1VHFrNUxDNWNPcHd6?=
 =?utf-8?B?NnNFa0Y5T01ZMkIzWmUySmVzRWtVSnNMRjkvdGVGeG5neG1tQkY0empTSDBV?=
 =?utf-8?B?b21IR01YTGhUOS9rVEFuc0F2QkVTcDJ1N1hWMGNzYWdNY05jZ3RhbTRUVTlE?=
 =?utf-8?B?bzZIN3JTZlk5S0FFOHhDTnlVN2J6bnpCTDU5N2hZcEdUY0FNUWNIU0h3TFYx?=
 =?utf-8?B?azdvQTNqd2w0R01vbFVnbG02VjlBM1BqeWYxYldXUFVtYUIxMmExT2F1NFhG?=
 =?utf-8?B?eFl6RHlqRjZlK3d3MldrSU1vbUt4ZzhITVZqL1hONXptaUpKUmhEMThDa05C?=
 =?utf-8?B?bFB6NFVQSXhva3M0WGpVdlFhNE84bWFlVWkrS1FzK1EwTjJoYmNkcDdCRWNI?=
 =?utf-8?B?ZWhCN3BVeEEzZEhnSnU5cFl6K2lndmRKbXRRVEhPUkhCM1dVdlNhRTZrNHJ2?=
 =?utf-8?B?TkE0ZktNQS92YXFyOGt0TVJYVis2UFdMeXBqS2VyR0ZKYVM0UWN4TTVHdE5r?=
 =?utf-8?B?OHVTZXpiSHQya3k5a09UYzJGMUtmUGRWVXFQcWRWU0ZEUXFmSzAweDhuTDMr?=
 =?utf-8?B?TFpBNjhJbFU4aGdERWgvRTRFY3dETDFpUmJCdWlVbVU0TE9xN0cxS2lhdWEw?=
 =?utf-8?Q?/iwJuvqZk3w6R05QSXKmZhbtPMHg8biad21+j7z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb16d13-70f1-4a08-1bda-08d92785ff2f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 18:24:31.7834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtpquIRIgV+7ve3DoRfEVX/nxxGEpW+EsN3ON5HGIzM2gHSbg+4Kw6Xi5QrBd30BAunNrt6K6sW70RjAzaAeJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5489
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
Cc: bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-01 6:51 a.m., Uma Shankar wrote:
> Add Plane Degamma Mode as an enum property. Create a helper
> function for all plane color management features.
> 
> This is an enum property with values as blob_id's and exposes
> the various gamma modes supported and the lut ranges. Getting
> the blob id in userspace, user can get the mode supported and
> also the range of gamma mode supported with number of lut
> coefficients. It can then set one of the modes using this
> enum property.
> 
> Lut values will be sent through separate GAMMA_LUT blob property.
> 
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  Documentation/gpu/drm-kms.rst             | 90 ++++++++++++++++++++++
>  drivers/gpu/drm/drm_atomic.c              |  1 +
>  drivers/gpu/drm/drm_atomic_state_helper.c |  2 +
>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 +
>  drivers/gpu/drm/drm_color_mgmt.c          | 93 ++++++++++++++++++++++-
>  include/drm/drm_mode_object.h             |  2 +-
>  include/drm/drm_plane.h                   | 23 ++++++
>  7 files changed, 212 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 87e5023e3f55..752be545e7d7 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -514,9 +514,99 @@ Damage Tracking Properties
>  Color Management Properties
>  ---------------------------
>  
> +Below is how a typical hardware pipeline for color
> +will look like:
> +
> +.. kernel-render:: DOT
> +   :alt: Display Color Pipeline
> +   :caption: Display Color Pipeline Overview
> +
> +   digraph "KMS" {
> +      node [shape=box]
> +
> +      subgraph cluster_static {
> +          style=dashed
> +          label="Display Color Hardware Blocks"
> +
> +          node [bgcolor=grey style=filled]
> +          "Plane Degamma A" -> "Plane CSC/CTM A"
> +          "Plane CSC/CTM A" -> "Plane Gamma A"
> +          "Pipe Blender" [color=lightblue,style=filled, width=5.25, height=0.75];
> +          "Plane Gamma A" -> "Pipe Blender"
> +	  "Pipe Blender" -> "Pipe DeGamma"
> +          "Pipe DeGamma" -> "Pipe CSC/CTM"
> +          "Pipe CSC/CTM" -> "Pipe Gamma"
> +          "Pipe Gamma" -> "Pipe Output"
> +      }
> +

It might be worthwhile to also highlight the YCbCr coefficient matrix in the pipeline,
between the FB and Plane degamma, i.e.
  YCbCr coefficients > plane degamma > csc > ...

One problem with this view is that not all HW will support all (or any) of these
CM blocks on all planes. For example, on AMD HW cursors are very different from
other planes and don't really have full CM support.

> +      subgraph cluster_static {
> +          style=dashed
> +
> +          node [shape=box]
> +          "Plane Degamma B" -> "Plane CSC/CTM B"
> +          "Plane CSC/CTM B" -> "Plane Gamma B"
> +          "Plane Gamma B" -> "Pipe Blender"
> +      }
> +
> +      subgraph cluster_static {
> +          style=dashed
> +
> +          node [shape=box]
> +          "Plane Degamma C" -> "Plane CSC/CTM C"
> +          "Plane CSC/CTM C" -> "Plane Gamma C"
> +          "Plane Gamma C" -> "Pipe Blender"
> +      }
> +
> +      subgraph cluster_fb {
> +          style=dashed
> +          label="RAM"
> +
> +          node [shape=box width=1.7 height=0.2]
> +
> +          "FB 1" -> "Plane Degamma A"
> +          "FB 2" -> "Plane Degamma B"
> +          "FB 3" -> "Plane Degamma C"
> +      }
> +   }
> +
> +In real world usecases,
> +
> +1. Plane Degamma can be used to linearize a non linear gamma
> +encoded framebuffer. This is needed to do any linear math like
> +color space conversion. For ex, linearize frames encoded in SRGB
> +or by HDR curve.
> +
> +2. Later Plane CTM block can convert the content to some different
> +colorspace. For ex, SRGB to BT2020 etc.
> +
> +3. Plane Gamma block can be used later to re-apply the non-linear
> +curve. This can also be used to apply Tone Mapping for HDR usecases.
> +

This would mean you're blending in gamma space which is likely not what
most compositors expect. There are numerous articles that describe why
blending in gamma space is problematic, such as [1]

[1] https://ninedegreesbelow.com/photography/linear-gamma-blur-normal-blend.html

To blend in linear space this should be configured to do

  Plane Degamma > Plane CTM > CRTC Gamma

I think it would also be good if we moved away from calling this gamma. It's
really only gamma for legacy SDR scenarios. For HDR cases I would never expect
these to use gamma and even though the sRGB transfer function is based on gamma
functions it's complicated [2].

[2] https://en.wikipedia.org/wiki/SRGB

A better way to describe these would be as "transfer function" and "inverse
transfer function." The space at various stages could then be described as linear
or non-linear, specifically PQ, HLG, sRGB, BT709, or using another transfer
function.

Harry

> +All the layers or framebuffers need to be converted to same color
> +space and format before blending. The plane color hardware blocks
> +can help with this. Once the Data is blended, similar color processing
> +can be done on blended output using pipe color hardware blocks.
> +
> +DRM Properties have been created to define and expose all these
> +hardware blocks to userspace. A userspace application (compositor
> +or any color app) can use these interfaces and define policies to
> +efficiently use the display hardware for such color operations.
> +
> +Pipe Color Management Properties
> +---------------------------------
> +
>  .. kernel-doc:: drivers/gpu/drm/drm_color_mgmt.c
>     :doc: overview
>  
> +Plane Color Management Properties
> +---------------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_color_mgmt.c
> +   :doc: Plane Color Properties
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_color_mgmt.c
> +   :doc: export
> +
>  Tile Group Property
>  -------------------
>  
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index a8bbb021684b..8892d03602f7 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -708,6 +708,7 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
>  		   drm_get_color_encoding_name(state->color_encoding));
>  	drm_printf(p, "\tcolor-range=%s\n",
>  		   drm_get_color_range_name(state->color_range));
> +	drm_printf(p, "\tcolor_mgmt_changed=%d\n", state->color_mgmt_changed);
>  
>  	if (plane->funcs->atomic_print_state)
>  		plane->funcs->atomic_print_state(p, state);
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index ddcf5c2c8e6a..f26b03853711 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -311,6 +311,8 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
>  	state->fence = NULL;
>  	state->commit = NULL;
>  	state->fb_damage_clips = NULL;
> +
> +	state->color_mgmt_changed = false;
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_plane_duplicate_state);
>  
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 438e9585b225..40fa05fa33dc 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -595,6 +595,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>  		state->color_encoding = val;
>  	} else if (property == plane->color_range_property) {
>  		state->color_range = val;
> +	} else if (property == plane->degamma_mode_property) {
> +		state->degamma_mode = val;
>  	} else if (property == config->prop_fb_damage_clips) {
>  		ret = drm_atomic_replace_property_blob_from_id(dev,
>  					&state->fb_damage_clips,
> @@ -661,6 +663,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>  		*val = state->color_encoding;
>  	} else if (property == plane->color_range_property) {
>  		*val = state->color_range;
> +	} else if (property == plane->degamma_mode_property) {
> +		*val = state->degamma_mode;
>  	} else if (property == config->prop_fb_damage_clips) {
>  		*val = (state->fb_damage_clips) ?
>  			state->fb_damage_clips->base.id : 0;
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index bb14f488c8f6..085ed0d0db00 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -34,8 +34,8 @@
>  /**
>   * DOC: overview
>   *
> - * Color management or color space adjustments is supported through a set of 5
> - * properties on the &drm_crtc object. They are set up by calling
> + * Pipe Color management or color space adjustments is supported through a
> + * set of 5 properties on the &drm_crtc object. They are set up by calling
>   * drm_crtc_enable_color_mgmt().
>   *
>   * "DEGAMMA_LUT”:
> @@ -584,6 +584,95 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
>  }
>  EXPORT_SYMBOL(drm_plane_create_color_properties);
>  
> +/**
> + * DOC: Plane Color Properties
> + *
> + * Plane Color management or color space adjustments is supported
> + * through a set of 5 properties on the &drm_plane object.
> + *
> + * degamma_mode_property:
> + *     Blob property which advertizes the possible degamma modes and
> + *     lut ranges supported by the platform. This  allows userspace
> + *     to query and get the plane degamma color caps and choose the
> + *     appropriate degamma mode and create lut values accordingly
> + *
> + */
> +int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
> +					   struct drm_plane *plane,
> +					   int num_values)
> +{
> +	struct drm_property *prop;
> +
> +	prop = drm_property_create(dev, DRM_MODE_PROP_ENUM,
> +				   "PLANE_DEGAMMA_MODE", num_values);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	plane->degamma_mode_property = prop;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_create_color_mgmt_properties);
> +
> +void drm_plane_attach_degamma_properties(struct drm_plane *plane)
> +{
> +	if (!plane->degamma_mode_property)
> +		return;
> +
> +	drm_object_attach_property(&plane->base,
> +				   plane->degamma_mode_property, 0);
> +}
> +EXPORT_SYMBOL(drm_plane_attach_degamma_properties);
> +
> +int drm_plane_color_add_gamma_degamma_mode_range(struct drm_plane *plane,
> +						 const char *name,
> +						 const struct drm_color_lut_range *ranges,
> +						 size_t length, enum lut_type type)
> +{
> +	struct drm_property_blob *blob;
> +	struct drm_property *prop = NULL;
> +	int num_ranges = length / sizeof(ranges[0]);
> +	int i, ret, num_types_0;
> +
> +	if (type == LUT_TYPE_DEGAMMA)
> +		prop = plane->degamma_mode_property;
> +
> +	if (!prop)
> +		return -EINVAL;
> +
> +	if (length == 0 && name)
> +		return drm_property_add_enum(prop, 0, name);
> +
> +	if (WARN_ON(length == 0 || length % sizeof(ranges[0]) != 0))
> +		return -EINVAL;
> +	num_types_0 = hweight8(ranges[0].flags & (DRM_MODE_LUT_GAMMA |
> +			       DRM_MODE_LUT_DEGAMMA));
> +	if (num_types_0 == 0)
> +		return -EINVAL;
> +
> +	for (i = 1; i < num_ranges; i++) {
> +		int num_types = hweight8(ranges[i].flags & (DRM_MODE_LUT_GAMMA |
> +					 DRM_MODE_LUT_DEGAMMA));
> +
> +		/* either all ranges have DEGAMMA|GAMMA or none have it */
> +		if (num_types_0 != num_types)
> +			return -EINVAL;
> +	}
> +
> +	blob = drm_property_create_blob(plane->dev, length, ranges);
> +	if (IS_ERR(blob))
> +		return PTR_ERR(blob);
> +
> +	ret = drm_property_add_enum(prop, blob->base.id, name);
> +	if (ret) {
> +		drm_property_blob_put(blob);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_color_add_gamma_degamma_mode_range);
> +
>  /**
>   * drm_color_lut_check - check validity of lookup table
>   * @lut: property blob containing LUT to check
> diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
> index c34a3e8030e1..d4128c7daa08 100644
> --- a/include/drm/drm_mode_object.h
> +++ b/include/drm/drm_mode_object.h
> @@ -60,7 +60,7 @@ struct drm_mode_object {
>  	void (*free_cb)(struct kref *kref);
>  };
>  
> -#define DRM_OBJECT_MAX_PROPERTY 24
> +#define DRM_OBJECT_MAX_PROPERTY 26
>  /**
>   * struct drm_object_properties - property tracking for &drm_mode_object
>   */
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 1294610e84f4..e476a5939f8e 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -236,6 +236,15 @@ struct drm_plane_state {
>  
>  	/** @state: backpointer to global drm_atomic_state */
>  	struct drm_atomic_state *state;
> +
> +	/**
> +	 * @degamma_mode: This is a blob_id and exposes the platform capabilities
> +	 * wrt to various gamma modes and the respective lut ranges. This also
> +	 * helps user select a degamma mode amongst the supported ones.
> +	 */
> +	u32 degamma_mode;
> +
> +	u8 color_mgmt_changed : 1;
>  };
>  
>  static inline struct drm_rect
> @@ -747,6 +756,12 @@ struct drm_plane {
>  	 * scaling.
>  	 */
>  	struct drm_property *scaling_filter_property;
> +
> +	/**
> +	 * @degamma_mode_property: Optional Plane property to set the LUT
> +	 * used to convert the framebuffer's colors to linear gamma.
> +	 */
> +	struct drm_property *degamma_mode_property;
>  };
>  
>  #define obj_to_plane(x) container_of(x, struct drm_plane, base)
> @@ -838,6 +853,14 @@ void drm_plane_force_disable(struct drm_plane *plane);
>  int drm_mode_plane_set_obj_prop(struct drm_plane *plane,
>  				       struct drm_property *property,
>  				       uint64_t value);
> +int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
> +					   struct drm_plane *plane,
> +					   int num_values);
> +void drm_plane_attach_degamma_properties(struct drm_plane *plane);
> +int drm_plane_color_add_gamma_degamma_mode_range(struct drm_plane *plane,
> +						 const char *name,
> +						 const struct drm_color_lut_range *ranges,
> +						 size_t length, enum lut_type type);
>  
>  /**
>   * drm_plane_find - find a &drm_plane
> 


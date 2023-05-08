Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EBF6FB987
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 23:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107DD10E2F9;
	Mon,  8 May 2023 21:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9597110E138;
 Mon,  8 May 2023 21:24:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJXabMp3CqGzOx0O5vfMFpenk9AngQiDy+KeQZnwX+lSS5KqIftC4JKuo8RBTXxFv7RjyJrAv47hFTdLUH7R0x64yys3qPXAmwntiDlD9a151Wf+nhOWu9H/K8bzDu7yfsuuvHsN+loFJXibOW6zk5OndgCRwJYeWFaqRYMtc99+HRAdAt+pFN+ZLUAkP30UDAGrT04m4VTVm/DQvPAr7gEsXp+hwvIVj9iMnrY/0UwFfopoBlErWugX2ypjBGEPYYXDed0KDDoLekl1f7svDLyde3SKZQxVeKlelubTnvqbItnWX1GpysWe6wdacMY02POTm66M0Fsyyb5ZvYmnsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4IOY3RmNVrAXvGngofd7Yq6P3qqQmS4NYYl3G103Oo=;
 b=YbRe2Sn/YQrobssU3V3C0N6t76FA1WBfFo8NGuTW3A/kc6EJRgj1oDNth5SCxFA/A0Oo3GwF5PoCBiFPKAD+riLg4xFtv5wPPeuWpWbbPMrLxuHY+LhfhGdoWAVy4KcG2HjMyoyrGpFEDTDR0i9eb0C47Bsrnr88UBn3ha1xG/1Ui1ByL5VcT3qzegiXvQ8x1DYXx8dUfT0W7OQqycgky2VurdIYWhf23nZWYRwigs9DAGS1MgIHaHHWqtf4dJqxxmDpqgt+QXfv3qaAFMShvXxdqMdzX+Lg6wA6mEjfsrkAaX2ItAO02QjX/aRnW5q6m9e2ly+dAUPxg8vUS6gQ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4IOY3RmNVrAXvGngofd7Yq6P3qqQmS4NYYl3G103Oo=;
 b=d5pf2woKy5wN0eEcvO/fVfOWJ6mU6PIBvTkEgxoYmzyZNg/ucpEE/WAOGFeQ9osbzObM/cM6X6l00OSmGHHd7Ry9GKvIr/IwJ644rJajnFMfCcUM+TBXyAoMre/JMZa9juMCX6kukqbnVrjAEzEr0qCcra11NHeulfdkACCZ1ZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH8PR12MB6676.namprd12.prod.outlook.com (2603:10b6:510:1c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.31; Mon, 8 May
 2023 21:24:50 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd26:a6b5:1d41:ac27]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd26:a6b5:1d41:ac27%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:24:50 +0000
Message-ID: <e931004a-e8e3-5c27-cee7-ec3bba23fb3e@amd.com>
Date: Mon, 8 May 2023 17:24:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 07/40] drm/amd/display: add CRTC gamma TF to
 driver-private props
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230423141051.702990-1-mwen@igalia.com>
 <20230423141051.702990-8-mwen@igalia.com>
Content-Language: en-US
In-Reply-To: <20230423141051.702990-8-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::41)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH8PR12MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: 12cb1249-add6-4d1c-d23d-08db500aa7ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VYGzZpgosH9Nv8gjGF2RO79aTNFTNfUCVBeFzBwtMYJ0LtwwWjoF37X4yPHL25kMj6MzwnOQk/jybm6jwK/tNz/ZNzR3VqLke7PtiR56P3ws8sNUTt/sBFNHzV7/24c+uIRok7cEVZfGRfPRu2XVKKNPjutO/1tvYyRAXHwAojAUZQBX8fAiuT7jk7GV2pvTiT2re3hxRzzcAoG1cbGXq8h+QawDmO9Jto9ar9ovd9ebDBj2bYUwCkf9f4n+zpjAJ4XVSX/wGrijN6V016qG3pCNOsxhC5vg9PET5Lt8FGvwEZjsJClkW611fCCvOTnKT5HiTTxgb6rIq3FyLyj2X3GrvJ801ovk8k7I6aOP9I0SN1np8LgoYmgd3TDqU5dzZAWkUNOnZxD/BI6gLDJBSNEpItR1klEG5hkpKlfdX6GX0yKuKHKVUd7WB3TthUJZjgeuBKEk6TBMr/t5iyztyucwR8QhRgFnceUFF4CvwQh+5y1Em1WRI8TI8ETVFjn+OTaxVcymPi/GRF1St2+MdeZj4H0WTiXB1VjmD6NF21ivoiRzPi8PZtcC8u/MQhH95tmaKAdxzh1GB0cwLh8/jDJ6TIrDJu5U8p2MU1EQ2i+N4qh4KMMc887xPvl55BBX+HV54D9xzcMvyk99UXBHw/TwFFIZAcibUaQ/2QPa9NM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199021)(83380400001)(110136005)(6666004)(478600001)(54906003)(6486002)(2616005)(6506007)(26005)(53546011)(186003)(6512007)(2906002)(44832011)(38100700002)(36756003)(66556008)(66946007)(66476007)(4326008)(921005)(41300700001)(8676002)(5660300002)(316002)(31696002)(86362001)(8936002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUlvYmE0Y0ZTZGxaMHlidFRpVU0xYTVDQkF1cHI0THhWc1Mxa3RCQUN3bGt5?=
 =?utf-8?B?ZHlQRkdPckJkSExRcU1SNTRaUldJajM5bTZpcm9LVWI3ZVhBc3lpVDY3V2RG?=
 =?utf-8?B?MjV0Y1pySjY1Nm8yeGZYMG5PcDZWTU5LZFhJMGpTbU9Ya0c3NVlaY3hWWDRr?=
 =?utf-8?B?clZBU0VsdVV0ZkhOa2xoR2d4VjZLRWlKNjliYVFBeVV5Z0drL280ZHhvU1lW?=
 =?utf-8?B?N0xacUJOTW11VU1OWk5pVjF0ZytpRHJYejgrWVJDZ0hJVWdjZU8yb0F6aTNo?=
 =?utf-8?B?M3d5R01OVW9jRzdlL1p2WWdPMGhoWXU1Z21NWmFnanpEV3dnMSs0K1FrMWVu?=
 =?utf-8?B?TEx6SVA0aFdTbk5iZFlIWkRYN0xFdlExZWd6ZlVFVytvOXJwZUtWZFhkaFFt?=
 =?utf-8?B?cFJuZjI5bGgva0lZdjV3UE9YWkg0SCtQa2xJL3FSNjY1c2hBYUR0S2xDMDV0?=
 =?utf-8?B?dlB6V0w2b1JmVVZKQmFSSHJKRXB1YjdEL2s2NDMxdzh0OEFLODFaS1R3bHQ0?=
 =?utf-8?B?RUtDb2FzOVQvTCs1T1pLaUtBNDc1Ym5xWUQvMUhndHVZRWkreWVBQUtEUmYz?=
 =?utf-8?B?cGlmL0JvM0lPSEp2cXVlbW9aSnE5aWZRRUY2S2ZuSFBia1JicFBVeUVhQnAx?=
 =?utf-8?B?SnhCN3pMT2RldFI5Y0d6NHNvdk8zak1xTXd0UjVOU2FKelREK2xVeDF2QnJT?=
 =?utf-8?B?RGN0VHFqRGRCS01mSlQ0dStzOWgxbWQ1c3REWU9NVGNnUlhlZ3VKcWhNaXVD?=
 =?utf-8?B?cURZcE1YZS9sdGZwZFllT3Z4VTF5eEdqRERTNGcrOGYrUUk5VmRxRGJyWitZ?=
 =?utf-8?B?NHZIZnhHRjExaGRTYkx0QzE5TkhLVUFuelNhQUlSM3JlbTRWSlBoRVhlQU5o?=
 =?utf-8?B?bzlzcHhMTWJ0d0tLNDc0OHJZOElpZWw4YlJYK0h1UHRwQUUzYlpwUlk2VkE2?=
 =?utf-8?B?U3BOZjlDeERpUjh0WGZJbk1YOVdTL05YdDJIenN1UlUrc2p3RW1lcUIrbENL?=
 =?utf-8?B?dVl3Tk1NMUZuZEpHL3E4ZHNISElBT3N2ZHhWL0E3OU13ckVadGtRRWpEdk5E?=
 =?utf-8?B?SVhxZ3VQUE9tYlp5VG1GOTFORi9EZXkxNTNrRHdDMnpINjc3bXBFQ25ldGZS?=
 =?utf-8?B?Y21KM0U4enAvRWZOVnVmY2RXRE9oZGpxRVlqa1RNTGtNbG5idlIrdW1mS2NH?=
 =?utf-8?B?aXZGaCtVWmdLMGtJdFozcVluK1YvYm1DNzVjZTJEK2xldGRKTDhFbFRuamo0?=
 =?utf-8?B?b1llY0N1OUt0NWo4VVd5bmxQd3N5MmJ2QTVYOG10VW1aNWVxdTVVK0ZNZk1T?=
 =?utf-8?B?cG9HdzNUcGozbGpIMk1qaVdwbGlkeHFUNk9TTGR4SVU5Z1ZKb3Z2bFluWldL?=
 =?utf-8?B?TUs1YjJTaUZjLzlBNUVmRkM4V0M3cXlsTE9qUFhBb0s3Q1VHZVBSVDREZnpn?=
 =?utf-8?B?b1I0K1gwL1JtS1gwVXRVTmNwRGFFaWxtbG91WlYzMUc3cDR6ZHI0ZEFEY0Vq?=
 =?utf-8?B?NUdwWG51MlBMZi8vTnpPcTdKTWdYaTJaMDZCT05Qc2RkMTJPSUxtTkZKY2wv?=
 =?utf-8?B?bEwxV2xNMnhjWm80eGhhdlovKzhyTFRIZGdRRzVmV0RyWG4vSWp4a0h1MEpT?=
 =?utf-8?B?K2JiK0o0L0pYdUFaaVlmcVlWTHdZUGRKZmJ0WGVDckpuUXFhV0hxUHJubHkw?=
 =?utf-8?B?Y1pCRVQyK2w5NVBwcE1valR5d2pVM3VRQ2hTSjJDaEQyd1RYOUw4Mmc2eTh6?=
 =?utf-8?B?UDdYelZLVkdrVnUwMVNkNGczVE9TK1d3aU9vZUY0Y0xoZGxZRGJZVUR4a0pz?=
 =?utf-8?B?d1ZtS3dibXZrV0pqU1IwbVcvMDZrOUp1dE1DczQ1OGo4bHR5YVpRMk9jNXhN?=
 =?utf-8?B?MFRjV1hNWko1Rk8ydEtzQlZCY2dnWG85aGMraE10dlAreVZkaTRyUUk2WFBD?=
 =?utf-8?B?blcwVzE1dXpDZ1dCUjZzQWhlRUJiVzk1UzUxa1FOWmNlMlFMNVRYNkl1RmlY?=
 =?utf-8?B?SG1IbUJxVFlWUnNMa3RwUWdHSHpiNkRxd1B4QXBTTE1GN1lQMitaRWpDZjRX?=
 =?utf-8?B?OXQ1T3hzM0ZackhNdzhCMHZtMU5ieDNDcnpJTjN5M3pKVmFkQzRIeUs4NWtM?=
 =?utf-8?Q?yjZZFpGgj07qsWy1Nz2J8OcQ+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cb1249-add6-4d1c-d23d-08db500aa7ef
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:24:50.2895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7WVsOc4SehJCpi1RnYLwEx35NFTz1ditXpkDVzHMAauxZNtqcaNEKxZVJz3ofaV46XwskHO01dJIWJv0ZMBGVw==
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
> From: Joshua Ashton <joshua@froggi.es>
> 
> Add predefined transfer function property to DRM CRTC gamma to convert
> to wire encoding with or without gamma LUT.
> 

Are all these new CRTC properties used by gamescope? I would be reluctant
to merge them if they're currently not needed.

> Co-developed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 22 ++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  4 ++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 23 +++++++++++++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 13 +++++++++++
>  4 files changed, 62 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 2abe5fe87c10..1913903cab88 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1248,6 +1248,19 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
>  }
>  
>  #ifdef CONFIG_STEAM_DECK
> +static const struct drm_prop_enum_list drm_transfer_function_enum_list[] = {
> +	{ DRM_TRANSFER_FUNCTION_DEFAULT, "Default" },
> +	{ DRM_TRANSFER_FUNCTION_SRGB, "sRGB" },
> +	{ DRM_TRANSFER_FUNCTION_BT709, "BT.709" },
> +	{ DRM_TRANSFER_FUNCTION_PQ, "PQ (Perceptual Quantizer)" },
> +	{ DRM_TRANSFER_FUNCTION_LINEAR, "Linear" },
> +	{ DRM_TRANSFER_FUNCTION_UNITY, "Unity" },
> +	{ DRM_TRANSFER_FUNCTION_HLG, "HLG (Hybrid Log Gamma)" },
> +	{ DRM_TRANSFER_FUNCTION_GAMMA22, "Gamma 2.2" },
> +	{ DRM_TRANSFER_FUNCTION_GAMMA24, "Gamma 2.4" },
> +	{ DRM_TRANSFER_FUNCTION_GAMMA26, "Gamma 2.6" },
> +};
> +

Would it be better to prefix things with AMD_/amd_ to avoid confusion? On the other
hand, these will likely just move into DRM core once we get the generic color uAPI.

Harry

>  static int
>  amdgpu_display_create_color_properties(struct amdgpu_device *adev)
>  {
> @@ -1281,6 +1294,15 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
>  		return -ENOMEM;
>  	adev->mode_info.lut3d_size_property = prop;
>  
> +	prop = drm_property_create_enum(adev_to_drm(adev),
> +					DRM_MODE_PROP_ENUM,
> +					"GAMMA_TF",
> +					drm_transfer_function_enum_list,
> +					ARRAY_SIZE(drm_transfer_function_enum_list));
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.gamma_tf_property = prop;
> +
>  	return 0;
>  }
>  #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 205fa4f5bea7..76337e18c728 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -368,6 +368,10 @@ struct amdgpu_mode_info {
>  	 * LUT as supported by the driver (read-only).
>  	 */
>  	struct drm_property *lut3d_size_property;
> +	/**
> +	 * @gamma_tf_property: Transfer function for CRTC regamma.
> +	 */
> +	struct drm_property *gamma_tf_property;
>  #endif
>  };
>  
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 09c3e1858b56..1e90a2dd445e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -699,6 +699,23 @@ static inline void amdgpu_dm_set_mst_status(uint8_t *status,
>  
>  extern const struct amdgpu_ip_block_version dm_ip_block;
>  
> +#ifdef CONFIG_STEAM_DECK
> +enum drm_transfer_function {
> +	DRM_TRANSFER_FUNCTION_DEFAULT,
> +
> +	DRM_TRANSFER_FUNCTION_SRGB,
> +	DRM_TRANSFER_FUNCTION_BT709,
> +	DRM_TRANSFER_FUNCTION_PQ,
> +	DRM_TRANSFER_FUNCTION_LINEAR,
> +	DRM_TRANSFER_FUNCTION_UNITY,
> +	DRM_TRANSFER_FUNCTION_HLG,
> +	DRM_TRANSFER_FUNCTION_GAMMA22,
> +	DRM_TRANSFER_FUNCTION_GAMMA24,
> +	DRM_TRANSFER_FUNCTION_GAMMA26,
> +	DRM_TRANSFER_FUNCTION_MAX,
> +};
> +#endif
> +
>  struct dm_plane_state {
>  	struct drm_plane_state base;
>  	struct dc_plane_state *dc_state;
> @@ -751,6 +768,12 @@ struct dm_crtc_state {
>  	 * &struct drm_color_lut.
>  	 */
>  	struct drm_property_blob *lut3d;
> +        /**
> +	 * @gamma_tf:
> +	 *
> +	 * Pre-defined transfer function for converting internal FB -> wire encoding.
> +	 */
> +	enum drm_transfer_function gamma_tf;
>  #endif
>  };
>  
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 0e1280228e6e..79324fbab1f1 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -272,6 +272,7 @@ static struct drm_crtc_state *dm_crtc_duplicate_state(struct drm_crtc *crtc)
>  #ifdef CONFIG_STEAM_DECK
>  	state->shaper_lut = cur->shaper_lut;
>  	state->lut3d = cur->lut3d;
> +	state->gamma_tf = cur->gamma_tf;
>  
>  	if (state->shaper_lut)
>  		drm_property_blob_get(state->shaper_lut);
> @@ -336,6 +337,11 @@ dm_crtc_additional_color_mgmt(struct drm_crtc *crtc)
>  					   adev->mode_info.lut3d_size_property,
>  					   MAX_COLOR_3DLUT_ENTRIES);
>  	}
> +
> +	if(adev->dm.dc->caps.color.mpc.ogam_ram)
> +		drm_object_attach_property(&crtc->base,
> +					   adev->mode_info.gamma_tf_property,
> +					   DRM_TRANSFER_FUNCTION_DEFAULT);
>  }
>  
>  static int
> @@ -398,6 +404,11 @@ amdgpu_dm_atomic_crtc_set_property(struct drm_crtc *crtc,
>  					&replaced);
>  		acrtc_state->base.color_mgmt_changed |= replaced;
>  		return ret;
> +	} else if (property == adev->mode_info.gamma_tf_property) {
> +		if (acrtc_state->gamma_tf != val) {
> +			acrtc_state->gamma_tf = val;
> +			acrtc_state->base.color_mgmt_changed |= 1;
> +		}
>  	} else {
>  		drm_dbg_atomic(crtc->dev,
>  			       "[CRTC:%d:%s] unknown property [PROP:%d:%s]]\n",
> @@ -424,6 +435,8 @@ amdgpu_dm_atomic_crtc_get_property(struct drm_crtc *crtc,
>  	else if (property == adev->mode_info.lut3d_property)
>  		*val = (acrtc_state->lut3d) ?
>  			acrtc_state->lut3d->base.id : 0;
> +	else if (property == adev->mode_info.gamma_tf_property)
> +		*val = acrtc_state->gamma_tf;
>  	else
>  		return -EINVAL;
>  



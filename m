Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6BD55F065
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB5510E337;
	Tue, 28 Jun 2022 21:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFBC10E0EC;
 Tue, 28 Jun 2022 21:34:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLOCnP9V0tLGaIz7VhFYlJ5hl28Tr8KFNlk94D7/pbD5N0810qNdHUmMbRs9qIJaBCP+WLJRa4jYkHT86xUNaBDI3cVaM+IPLrXBzXFnth1osYGTSr+yEeRs8ias2wZ6L5Kp3Bgio5KpxeaZEEOsu6W+gMH10aqErSNdcinBPj9J59dVwSHOX0DZwvmFwIMsbaYd1k2lXMmdg6zsC+OlNDwBCAJ8KsWCH2cLya0YUw3ahv40rsprnaPjyP5vyf+qQy2gKoEX1IBotsC0fEKoK4av4m4aZw7GRBzA+l+WdUXmYSNrRAmqjwqA8/Pp0Djm+EpkDnGPQtmeTqFzgr/uxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUJ2f0Au2EB0+CsOBWIWFBPoUD5pG+hwlo/k3SnboIs=;
 b=bKkOKrsPjvLD4i0IdTb2l4E2cwaDHSYv0mfqPE2OJ9nhw16U+ms/xKJsuRCF8VHhOdkXBxxKfgRs7y5IrTp9IwohDEJ1xuAqGrUZvN4xMCI8e/zq50cBmBwzhYss08soSxgc1skn/2SnpqTkSNv9IOkZPAyEZx4FxwJ/9+H3L5dBVdewgFTAdFrWxRx9bSXIkpJ29H65P7tT2fWy0pIpQ5SgaOoOnOl4PdQQQ+QS1yMZvryvfjGb/c29Dz2TKCPVzaUnBZT/+ZxlEnQyynbkZFkctlmz3QAMm+IvH0cg4kNVlqR10ZNpgNFrcd1Wvw6OouZM+b+q04fuQOsxt9Ockg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUJ2f0Au2EB0+CsOBWIWFBPoUD5pG+hwlo/k3SnboIs=;
 b=xzLNFMycEJNB60LXRDvaXTOm5/2MnzaUht+cZ5/txRoRY+LozzU0tNfM1fih/7mBlBzuYkRhIAOTI8/3fbntbBljO2LR+2xzbuS5BobnoMoOAHsqVXz5fPYoc9fU/bR1KirfqkjWP8PgO/iQZhhngXEtMSvxu9OTv3+spTcn2xw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BY5PR12MB4163.namprd12.prod.outlook.com (2603:10b6:a03:202::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 21:34:08 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f55b:be13:11c6:d9dc]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f55b:be13:11c6:d9dc%3]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 21:34:07 +0000
Message-ID: <1266f666-1f58-a099-0d80-0826e1b69802@amd.com>
Date: Tue, 28 Jun 2022 17:34:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 4/5] drm/drm_color_mgmt: add 3D LUT to color mgmt
 properties
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com
References: <20220619223104.667413-1-mwen@igalia.com>
 <20220619223104.667413-5-mwen@igalia.com>
From: Harry Wentland <hwentlan@amd.com>
In-Reply-To: <20220619223104.667413-5-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::21) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b196f1f9-224a-49cc-6493-08da594dee55
X-MS-TrafficTypeDiagnostic: BY5PR12MB4163:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8fon7wk67/pp3Z4YIv275nDDFJ9SUB2d447aY9kTnDRKZaj5yhJPbtDPMswiBGErRzYA/71ZVgoX+W9GIRxW01u9UVd/qC4MVx57DrTStTpu6t25t3IeLR90DdvjOuYogbcXl86EmVQ+ezjDKQ8uaW34hoVbSJuwg3PlHqw+4UwI7KUlNY6qBQOLRMu3ogCzHLbRGUe3HwxsuZrjs8PXaNmyFgAgCyLjI1jrMwZUUP8D3ASrJErEtP2E6VRBK2wTF+BR2ZRUaE3IifTJPCqGqZeSgF+uZhSI9Dgurwx5qs+s1ZIJ1aPhepYkbd0gzkjiy9SZ2QeNJ3+TLFLFNZ5wqAvZ0K2ms/njVu4FHsyNpAQ6ytWRh/bea44NKqpuTgHBkWuVLbj3Iq50QIMbJJKMj/rVsMLugF6+pAKSTejogm4ekxKWX++iMWElJtJGI2ubA8BVbtuv9opPau1KWdl9ZDsiC0OAZJuPIS7IPchwPcPYPfdFaVgX+9OvV8Q2V+bxZ6XmB0x1y2jwjACizTkryW/t5nArFWZh2qQAbuyI3iUaQfFcxZOM0gkDnp5Jo5kD3jgxazLvf8fW7ydIaqv7XVpXGZxC+i2wkfP8oBOCxZiCpLzSB1Yv/Yppk4yHnKb76+WmarS7zHRDTrSK3alD/ua46FZjLI0D+IwIA/KGC1i3wwYGpZSkPs0//5t3+iXqcWdPv6u/cUVXjHkG5J+JXE9fyUzfKUyZWkyF8JWmZMJUe1aq3zSjxXfLXXpwoW2afiPTry2p4wxEal3vmtOacoJlZ7oFQ6ptezmCQCBTcUW4bMsa7tu4l0uYFTg5z3FwqWSuhnAR5sG345xeTee+p2a+KzqO/6Zk0GPXxTpdQ+JrP3Yv4i/mmM9Emyga6ASd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(6506007)(6486002)(36756003)(31696002)(38100700002)(8936002)(5660300002)(30864003)(966005)(478600001)(31686004)(316002)(4326008)(8676002)(6636002)(83380400001)(6666004)(186003)(6512007)(2906002)(53546011)(2616005)(66556008)(41300700001)(66946007)(921005)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0ZzZXdqV0JabmxHY2ZXM2VscFpSWXBaeGZOdjVqZFZqbFNGT1ArZWh0T282?=
 =?utf-8?B?VDNpZVU0SWx4Z3R2bEVVZDhQZUF3V2lkUnpYRFlBbkVMbFpmYlpkZE9vTzVL?=
 =?utf-8?B?ZlpzN1dTK2pJcE1NeEpoYWZGL3FDak5yTnFBaVRMb3FqS1RwbjhtQlFLeXRu?=
 =?utf-8?B?VS9xSlNCTXlocHkyNE5VZGNSdDEwblJtRDU4SmJ6Y0FJS3cyc0dpVTlrTEZZ?=
 =?utf-8?B?U2xuOWZOZGwzWjJTT3cyUFZVck1BOVJvT2NEMnhoY2UyYzNYU3NaZUluM3ox?=
 =?utf-8?B?cXVTdUFSSkpkUENFaGwrcDZlY2tvQ1R2YzQvYmZzcnNSbk1xTlo4ZFV0Y09Z?=
 =?utf-8?B?MnF5Rzd0cDZmQW1FR3d6Ly9NcmxpTG5hbWZpL25QL1pINjFIaG5SWmgwQWYz?=
 =?utf-8?B?SldwMG5Id1dGSnhUaElhU242Z2V4ZGlPRFNMTkZwWE95bGVVdTBjRG9tNGlC?=
 =?utf-8?B?VklZMmRaQzQzTmVFMUdmbUxwa1o4V2RvVnNGNzFSS0hPZ25VSm9NRzBqTEgy?=
 =?utf-8?B?UHZwcFZZNE1rQVVQKzRZQVp2Qkx4V3h0QTVBM1pYZVFTYUI0VXhuL0tzU21o?=
 =?utf-8?B?L1lSdm9PRHIvQXdpS3Boa2ZaamJQQklWbzBra3Jac0NDck1QWm5sakFxUVZ6?=
 =?utf-8?B?bkVKS0Rncy9TNit0NFBENnNybmloVndyTEdJWWhROGVLbmJzWTc0TWpyMDU2?=
 =?utf-8?B?dFZPRTdpRG5ZaHh1N1RjTEdYOUVSV1Q4VFBaWHJ5Q1BxdWsxYlBTb3hZT3Js?=
 =?utf-8?B?N3Z1Z0JZTnVVSDBlQzE0ODZpRnc1YXFhL2o3L24zNlBIaDF0b05TZkw2QWlS?=
 =?utf-8?B?dFhoQ1lGbkVJbmJORDZMVGFIVVV0T0RqSU1mRUZ1UG1OTk9GYWNmZnRzWllu?=
 =?utf-8?B?RExGSmdFS1FjajAzandiNnZ0TkdoYVJGT2M2ZlRTRU5mVFFVS29SYXZDc1lY?=
 =?utf-8?B?dUQvcVJDK05WSUNodmxlRmFiQTRDaUgrWVp6aHNqQnNqSlBMZGltY245NzdK?=
 =?utf-8?B?SFIyUkVJbFZhWDZnL0FWbnRXRjlLczNoaTVWRlo5UmM1ZUQ2YlB1Uy9GQ1VZ?=
 =?utf-8?B?Q1NzZUprczhIdG9JbEs3UGh6VmV2T0dnWmJlVko1L2xINVFXSDZkSDcvcnRj?=
 =?utf-8?B?TERpaUIzUnpUOHJoWW5lcTdLWS9sL0RGWFFKSE1kbXppZ0cvQ2FnSk9sSkRX?=
 =?utf-8?B?amxxTTAvYXVzdHVabDNjS2hSVk45NHBEamExcjJmSnhFYWtjYnV6VXdOVHB4?=
 =?utf-8?B?ZUNBckRjQ1hBZklNZkk0UjN3bUhMU0orN29aQTJWcWxqM093WlBCTTh2ejY2?=
 =?utf-8?B?NnFKOEtxakxjRHc2L0FQTVcyaDRlemNiWE03eTBRR3AyT3NRZ1NiT2ZrK3JF?=
 =?utf-8?B?TXR3cXA5MFhoc00wUzRGTjdlbmI1ODdxMURiQkpvcmdDZTkxU05LZzdVQXU3?=
 =?utf-8?B?N29hZlcyK1lLL2ltLzVnTVphaDB0U042YWdkaU5VYWswQUwvWlNjNTNidzhF?=
 =?utf-8?B?RHFONisxeG9kRDlwU21MZVlWSXJtSW1oZHd1MzJoVXpuL3pzeU5SV015WVJS?=
 =?utf-8?B?K05pcUlDbzlWS2R1UmRpQmxTb0pxV3ZKcHNtYjc4a3RZaEhjNHFzZTc0QzZt?=
 =?utf-8?B?OWpteHVRbzhreVNXcG0yS3MzYjlTRnp1MmJCVkJmVlBLYXRoaHBuaGQrNHI4?=
 =?utf-8?B?VGM3MUlUT0lBUkpiK3FzRitsUXM4SzFtaVNDdUVjaFk4cDRsMWtUdUdjRXp0?=
 =?utf-8?B?Mmd6RVZzNHdUUFV5dytmQjlXOXYweFlnQk1od0hvdk5rdFBtYW5kM2tXVHVh?=
 =?utf-8?B?bndCbFk0Ry96UVUvQzdrUHhoSzBxYzZZWDBEY2dwcHk4TWRVc21xRGptYllK?=
 =?utf-8?B?M2RlL3phYmd6SXRLVHAwVmpSRENkRFZMWXFQREl0L2ZJSC9MY1FCL25TMGw3?=
 =?utf-8?B?Z3ZzOTRnWnNWb0J1Q1dERnZyZ2p4N283YUl0WkdROFh5bVpLYnRDYjlSNHdu?=
 =?utf-8?B?aHpObWlVU0QzeWdMRWlPS2hDZ1NsdzZENTI3Y2lpWFNrU3h6WEpGOWJXZnNp?=
 =?utf-8?B?NGt1a3hSdWVuV2VoRWZIT1FwWmd2OEFrYUgwdjdOWGV6cnJrTWh1Z1FnZ21x?=
 =?utf-8?B?cTl1cGZLRG5jeExwMUFlK3hFdFZGcDNzbU1wSDBjV1htWC95U2RqUk9Rbi9n?=
 =?utf-8?Q?qGqiYz7yLwcSALml7UyF27oJfuSJCUw4YFOWrbc+Tb0I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b196f1f9-224a-49cc-6493-08da594dee55
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 21:34:07.4473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbA9jepnQ/2osMJCfxhfWGSiMzL7F4ykSMR2XMoVON8mTSk1iO8VjVgWAxDq0k2g0ANC1fjGzzz+aI/YamXgxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4163
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



On 6/19/22 18:31, Melissa Wen wrote:
> Add 3D LUT for gammar correction using a 3D lookup table.  The position
> in the color correction pipeline where 3D LUT is applied depends on hw
> design, being after CTM or gamma. If just after CTM, a shaper lut must
> be set to shape the content for a non-linear space. That details should
> be handled by the driver according to its color capabilities.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  3 ++
>  drivers/gpu/drm/drm_atomic_uapi.c         | 14 +++++-
>  drivers/gpu/drm/drm_color_mgmt.c          | 58 +++++++++++++++++++++++
>  drivers/gpu/drm/drm_fb_helper.c           |  2 +
>  drivers/gpu/drm/drm_mode_config.c         | 14 ++++++
>  include/drm/drm_color_mgmt.h              |  4 ++
>  include/drm/drm_crtc.h                    | 12 ++++-
>  include/drm/drm_mode_config.h             | 13 +++++
>  8 files changed, 117 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index cf0545bb6e00..64800bc41365 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -141,6 +141,8 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
>  		drm_property_blob_get(state->ctm);
>  	if (state->shaper_lut)
>  		drm_property_blob_get(state->shaper_lut);
> +	if (state->lut3d)
> +		drm_property_blob_get(state->lut3d);
>  	if (state->gamma_lut)
>  		drm_property_blob_get(state->gamma_lut);
>  
> @@ -216,6 +218,7 @@ void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state)
>  	drm_property_blob_put(state->degamma_lut);
>  	drm_property_blob_put(state->ctm);
>  	drm_property_blob_put(state->shaper_lut);
> +	drm_property_blob_put(state->lut3d);
>  	drm_property_blob_put(state->gamma_lut);
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_crtc_destroy_state);
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 6468f2a080bc..1896c0422f73 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -472,6 +472,14 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>  					&replaced);
>  		state->color_mgmt_changed |= replaced;
>  		return ret;
> +	} else if (property == config->lut3d_property) {
> +		ret = drm_atomic_replace_property_blob_from_id(dev,
> +					&state->lut3d,
> +					val,
> +					-1, sizeof(struct drm_color_lut),
> +					&replaced);
> +		state->color_mgmt_changed |= replaced;
> +		return ret;
>  	} else if (property == config->gamma_lut_property) {
>  		ret = drm_atomic_replace_property_blob_from_id(dev,
>  					&state->gamma_lut,
> @@ -523,10 +531,12 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>  		*val = (state->degamma_lut) ? state->degamma_lut->base.id : 0;
>  	else if (property == config->ctm_property)
>  		*val = (state->ctm) ? state->ctm->base.id : 0;
> -	else if (property == config->gamma_lut_property)
> -		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
>  	else if (property == config->shaper_lut_property)
>  		*val = (state->shaper_lut) ? state->shaper_lut->base.id : 0;
> +	else if (property == config->lut3d_property)
> +		*val = (state->lut3d) ? state->lut3d->base.id : 0;
> +	else if (property == config->gamma_lut_property)
> +		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
>  	else if (property == config->prop_out_fence_ptr)
>  		*val = 0;
>  	else if (property == crtc->scaling_filter_property)
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index 4f57dc60fe03..696fe1e37801 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -87,6 +87,25 @@
>   *	publish the largest size, and sub-sample smaller sized LUTs
>   *	appropriately.
>   *
> + * “LUT3D”:
> + *	Blob property to set the 3D LUT mapping pixel data after the color
> + *	transformation matrix and before gamma 1D lut correction. The
> + *	data is interpreted as an array of &struct drm_color_lut elements.
> + *	Hardware might choose not to use the full precision of the LUT
> + *	elements.
> + *
> + *	Setting this to NULL (blob property value set to 0) means a the output
> + *	color is identical to the input color. This is generally the driver
> + *	boot-up state too. Drivers can access this blob through
> + *	&drm_crtc_state.gamma_lut.
> + *
> + * “LUT3D_SIZE”:
> + *	Unsigned range property to give the size of the 3D lookup table to be
> + *	set on the LUT3D property (the size depends on the underlying
> + *	hardware). If drivers support multiple LUT sizes then they should
> + *	publish the largest size, and sub-sample smaller sized LUTs
> + *	appropriately.
> + *
>   * “GAMMA_LUT”:
>   *	Blob property to set the gamma lookup table (LUT) mapping pixel data
>   *	after the transformation matrix to data sent to the connector. The
> @@ -204,6 +223,45 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
>  }
>  EXPORT_SYMBOL(drm_crtc_enable_color_mgmt);
>  
> +/**
> + * drm_crtc_enable_lut3d - enable 3D LUT properties
> + * @crtc: DRM CRTC
> + * @shaper_lut_size: the size of shaper lut
> + * @lut3d_size: the size of 3D lut
> + *
> + * This function lets the driver enable the 3D LUT color correction property
> + * on a CRTC. This includes 3D LUT and also a shaper LUT, if set. The shaper
> + * LUT property is only attached if its size is not 0 and 3D LUT is set, being
> + * therefore optional.
> + */
> +void drm_crtc_enable_lut3d(struct drm_crtc *crtc,
> +			   uint shaper_lut_size,
> +			   uint lut3d_size)
> +{
> +	struct drm_device *dev = crtc->dev;
> +	struct drm_mode_config *config = &dev->mode_config;
> +
> +	if (!lut3d_size)
> +		return;
> +
> +	drm_object_attach_property(&crtc->base,
> +				   config->lut3d_property, 0);
> +	drm_object_attach_property(&crtc->base,
> +				   config->lut3d_size_property,
> +				   lut3d_size);
> +	if (!shaper_lut_size)
> +		return;
> +
> +	drm_object_attach_property(&crtc->base,
> +				   config->shaper_lut_property, 0);
> +	drm_object_attach_property(&crtc->base,
> +				   config->shaper_lut_size_property,
> +				   lut3d_size);
> +
> +}
> +EXPORT_SYMBOL(drm_crtc_enable_lut3d);
> +
> +
>  /**
>   * drm_mode_crtc_set_gamma_size - set the gamma table size
>   * @crtc: CRTC to set the gamma table size for
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index bdd33817d968..358c528c7c80 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1069,6 +1069,8 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
>  		replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
>  		replaced |= drm_property_replace_blob(&crtc_state->shaper_lut,
>  						      NULL);
> +		replaced |= drm_property_replace_blob(&crtc_state->lut3d,
> +						      NULL);
>  		replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
>  						      gamma_lut);
>  
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 4ba2a95b88e8..5458a7dfbe63 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -364,6 +364,20 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
>  		return -ENOMEM;
>  	dev->mode_config.shaper_lut_size_property = prop;
>  
> +	prop = drm_property_create(dev,
> +			DRM_MODE_PROP_BLOB,
> +			"LUT3D", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +	dev->mode_config.lut3d_property = prop;
> +
> +	prop = drm_property_create_range(dev,
> +			DRM_MODE_PROP_IMMUTABLE,
> +			"LUT3D_SIZE", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	dev->mode_config.lut3d_size_property = prop;
> +
>  	prop = drm_property_create(dev,
>  			DRM_MODE_PROP_BLOB,
>  			"GAMMA_LUT", 0);
> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> index 81c298488b0c..a4f054e0108f 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -59,6 +59,10 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
>  				bool has_ctm,
>  				uint gamma_lut_size);
>  
> +void drm_crtc_enable_lut3d(struct drm_crtc *crtc,
> +			   uint shaper_lut_size,
> +			   uint lut3d_size);
> +
>  int drm_mode_crtc_set_gamma_size(struct drm_crtc *crtc,
>  				 int gamma_size);
>  
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index a318d5feb44b..c22ffcc4d7aa 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -165,7 +165,7 @@ struct drm_crtc_state {
>  	bool zpos_changed : 1;
>  	/**
>  	 * @color_mgmt_changed: Color management properties have changed
> -	 * (@shaper_lut, @gamma_lut, @degamma_lut or @ctm). Used by
> +	 * (@shaper_lut, @lut3d, @gamma_lut, @degamma_lut or @ctm). Used by
>  	 * the atomic helpers and drivers to steer the atomic commit control
>  	 * flow.
>  	 */
> @@ -298,6 +298,16 @@ struct drm_crtc_state {
>  	 */
>  	struct drm_property_blob *shaper_lut;
>  
> +	/**
> +	 * @lut3d:
> +	 *
> +	 * 3D Lookup table for converting pixel data. Position where it takes
> +	 * place depends on hw design, after @ctm or @gamma_lut. See
> +	 * drm_crtc_enable_color_mgmt(). The blob (if not NULL) is an array of
> +	 * &struct drm_color_lut.
> +	 */
> +	struct drm_property_blob *lut3d;
> +
>  	/**
>  	 * @target_vblank:
>  	 *
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 2df7e171add9..87280694e70d 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -812,6 +812,19 @@ struct drm_mode_config {
>  	 */
>  	struct drm_property *shaper_lut_size_property;
>  
> +	/**
> +	 * @lut3d_property: Optional CRTC property to set the 3D LUT used to
> +	 * convert colors; before or after gamma conversion depends on hw
> +	 * design. A shaper LUT can be used to delinearize content before apply
> +	 * 3D LUT correction.
> +	 */
> +	struct drm_property *lut3d_property;
> +	/**
> +	 * @lut3d_size_property: Optional CRTC property for the size of the
> +	 * 3D LUT as supported by the driver (read-only).
> +	 */
> +	struct drm_property *lut3d_size_property;

I wonder if we need caps to describe more than the size of the 3DLUT,
i.e. something like what vaapi does:

https://intel.github.io/libva/structVAProcFilterCap3DLUT.html

Harry

> +
>  	/**
>  	 * @gamma_lut_property: Optional CRTC property to set the LUT used to
>  	 * convert the colors, after the CTM matrix, to the gamma space of the

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBAF7943D4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 21:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FEB10E1CF;
	Wed,  6 Sep 2023 19:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A520E10E1CF;
 Wed,  6 Sep 2023 19:33:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ys5qLlH6b/RSumgVDcGAnR96Uv7TLh5e5E11WlhCk7FElPvMVHeCbHnp16lE0e2bTsaby93bdKkbBXjdNVHyIoPMpVnEpJEsSAOst1oOrSaAQyjiPnhp9UNAl49Y0x458HwwEc8vB//wlPx6slh/N7TmmYCnR6J/74FBpQ6WseDUJok+oXd5d6a/KZDSQxo6EMoMXBx9Kq6WjTWZN8sjce4fBOCVVQAW4njXwnzNtaqgX4rE/4KqrycVxbJYHv8Vb+QZGXisDAPluETRXTReWpfc/PbTqNkCRvA1YcFMeiMig/Ylm6DXKXBgNK8pQGSI5ig9DD0GSGMEfLeBcxdDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCMXVocgI6HQygm4cLy/B17ktoqezYf/6fYQC6GcXRM=;
 b=ENynee2uaeqHOhWxZJhRp4XTXT1ox7FCgsH6QafEnb9zm9Ex/UvrqXCoynJd21RqQ8bW7A2C+8o64rhkLAw8CFZ+col6X9WLYilZJKYa7mxDIHZkLNStbFBIicGJoFjRo3Q/BGjqR3u6F0qaK8st7fe8Mvsip45Pa4fyd58IzRHqmpXIDCgLEm4E+gP1tCVVQ4Yv7M8gWrxOI92L6iBeSweZlPCrjDLO7wv9Af4l9cvOlmrfR0xAPKuioL5wlcJl1nfM0EOfk1tCErxv3ty+gz5bt4DQcwtk8mewpAGbLqEmXPOAMGsyzxnLFanbh+jrebBtvM7PMyw0kFKvffKtSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCMXVocgI6HQygm4cLy/B17ktoqezYf/6fYQC6GcXRM=;
 b=ZvTODwJThbafhmzrn3m8M1WK90Jiq39JpiVrpPfckei5jgDAFxzRjCnjVpvL7suCh9u6sII755EjnXHTwZk1biu1nuT51CU0b5TaJAhV93LEvrHx5Wj/65zRC/aQ+Ry2Pf4AIoB2G4q1Da9PIvPzIznArtkCzravx0X1YOJictI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by LV3PR12MB9094.namprd12.prod.outlook.com (2603:10b6:408:19e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Wed, 6 Sep
 2023 19:33:11 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 19:33:11 +0000
Message-ID: <26a6d3ed-472a-4c70-a6ce-29f3ea7c81f5@amd.com>
Date: Wed, 6 Sep 2023 15:33:05 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/34] drm/amd/display: add plane shaper LUT and TF
 driver-specific properties
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-12-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230810160314.48225-12-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::29) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|LV3PR12MB9094:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b1c401-e68f-4806-4321-08dbaf101af7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7HjdXmUw1w+tOWj3Mv4noedudHtcQk9q621eZawfzPDrJPefF44GdTGAlXjxnx9JPXX89yiK6AAMqQFBiiwqpcQcNAMNdooZ5+kK8MmoGuOYzid11ZmgycwZZP2dstD7yfSIExHEyMBxBO4FGmBoS4qD1POOXf6ClpqpJte+RRlrfHWqgUxCXcgLup8LYiGPLkNKx/281VcnpB0SPVEnldBbyIG1vyqSmIlgG4baB2xE9vu/hup62ISTW1Hu/vVJnQ99Qph3gacgq0C8Hg0lYrjqRd8RKoKjELIFsniXxTW3H4hIafzfk+gokdKp5nEJQ2x9fYE5j0NRTPaP8V8PBxt/Y/HdTqhvVY3Wz2eSnfSTm5vvKymKgpMmfwhENjLqCjCJk3Qsqnauc/JFLo4/YbVwBU2zq+jwlx/MKhllQZ8e9wGLPIzkQqXh6n81+f6Wy33n2mEr2ROyzNlvGkhu/6Akfysb3RSm5leavaWBd4Wh9FHE5NP4Nd51qqdhgtByvOgnXHkNx1dRrcVnoY7tXk8Mjm2cUe8p52mkfuPJt3JsKQYKkHEL4fs5Nf/DQfCwzrqF9wVkuZ8igzP7Q0KwGo3563Q3IkMez4iTrHf5mrVZcylHR/2AhVj8LEG/N95xGxnJL4HbNkUjSxAkQ5JBYdfVeGn0pKe5CzkeklD9BEo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199024)(186009)(1800799009)(7416002)(8936002)(41300700001)(83380400001)(44832011)(478600001)(31686004)(8676002)(2906002)(6666004)(5660300002)(316002)(66476007)(66556008)(66946007)(54906003)(110136005)(4326008)(6512007)(53546011)(6506007)(26005)(6486002)(2616005)(36756003)(31696002)(921005)(38100700002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0J2MTYwNWd1SitVYkpleHAyQlhmTGtwZS9Nb2Rsb3MraGNhOWlxc3pnVVFM?=
 =?utf-8?B?WG5JTmxQQ2NobWFnZjQ1bnBlNCtvR2VGcGd2TFJ5aHBIVkhqY1FoemdvRTlw?=
 =?utf-8?B?VGFMRHhLNEVDbFd2RjB6cllESFcza21ZUGlDNFAyNGJzQ0JZcmFVdFhxL0Nw?=
 =?utf-8?B?TUQ1RkcxWTJuelFhM0lXL21lSG5ldENFYk5TT1pCeWZPYUZobVJhRGJXcEhK?=
 =?utf-8?B?Tk1TZnBxMFlyV2V5N1Y4cjlWcm5vU1VFSmVoLzBaRDVWWXRZOThIOGhBQks1?=
 =?utf-8?B?bHV1a254OVlWNHVVaXp6ZUE1N3FsZ0NpMlp0bXpUYnNDY1RkejhubSswVHB1?=
 =?utf-8?B?Tm5mOFFXZEJvakhJMFVLaW5HeDRMSHNKUzRUMG54dzE4MEVXNjdpVW50aHF4?=
 =?utf-8?B?WWdnaWRDdDd6UnFrUFIzZSs1QUxzaWk1TjlsdnoxZE0yaHlnajNNSXIzc0ZZ?=
 =?utf-8?B?bzVoS1p4VllvUzdmWDA0K1paSElEUUtjVHk2Nk9haUpSMDQ0QmQ1TEdiWi83?=
 =?utf-8?B?RC91TWRxaXhsck5SeXpDWDBuck9TR0hxN0c3TXVzL0tTOWpacTA2OUpXSzhk?=
 =?utf-8?B?dWxydG9OSHVMeFFQUUYzamdKdHlzU00rWTl4UlkzTExSaWFRU1FFZkR6OXdw?=
 =?utf-8?B?YmFEZGlqem9nYWhwWDcrTTlwL1I1RXhoVXhzNnNsZWlPK0wxTGlVSWdwL2lh?=
 =?utf-8?B?UWo0dERxMnBIblhqVWRYQk5ONlR0WUtsNDIxYlVjYndFTWEwU3EzR1JvTlhu?=
 =?utf-8?B?cm9IT21oUDNaMFNRVGJFTXVzZ1Aybk1JUUJ0MXo1SzBybksxSnAzU0ZoMUpx?=
 =?utf-8?B?YkRvdWNNT3FvS1BVdGxpL0RJWUVQaGFML0k4S3luOWFXcmJNRk10VE50dTBh?=
 =?utf-8?B?SVd5YTBjVlN1b2FmejQyU01rdU1ZRkVZc3FFblliWSthemhCby9YeUVSSlVa?=
 =?utf-8?B?TnhBVFh4dUhKdnRLQlQ3RUFBVlAvNkY0TEhhSXJHU0lIek5TRS8xcUlVcllZ?=
 =?utf-8?B?YmZSaERkWEJaT2tqS2U0RU1UT3ZLdnBuVlNBNHBwaURhWkdnb09ORC80cXlw?=
 =?utf-8?B?Z2JFNUNlSWQvQlJUSFFaOEpTNGE4cVRSajVTcWF4TDdNRXlKZmRtRlZTdzZv?=
 =?utf-8?B?WVJEb0RkNjBCeDE0cVVRNENLZHhWNzc5SWhGVHNtZjBTc1Exd0ZwaUYrSnV3?=
 =?utf-8?B?Njd2aUhZUVhpb2NPaU9vY0dPUkJmTUZGOEtYTG5MMGVxajVXaG16aktqdURs?=
 =?utf-8?B?S2RQK3BraS96SGJVNFBkeVBEUkVHQ0NGYzIxbHhSeFJsdS9EbmdvME1sS1ZY?=
 =?utf-8?B?RXhZVHExUjQ5OVNFZThtektMR2JIM20zUHRab2hxWXk5d0J0Skw3b2VweGlk?=
 =?utf-8?B?MkVWYm9JY0p3U21CQUZFTUtUS1hrRmtaNXlFcGRIOCtSa05hcWo5bHhJKzN4?=
 =?utf-8?B?S3FOeXRpMGk1OHNqOGovT2M0aG9oSlhHWWVUWFQxNGx4K3VyYzRyWVNTR2RR?=
 =?utf-8?B?Sk9Fek9NcWtNUUlUeTlrczJkUkREVDhWWW9MQXkrZGtUcnlmMGFRRUd0Znlh?=
 =?utf-8?B?MC9FSFpvSHZNVmZibUwra1dWVEYvNjJlU3Z4UklTNjNCOW1MMDRDaHVITndz?=
 =?utf-8?B?OTV5Um5DUmk5a08vcGFNVjVIZ3NtZmI1RThpVWIwemk3bEJuWmN0UG1qOHhU?=
 =?utf-8?B?MHExMmpwWlBzaW4xZDVrN1BxZWVMcTBDVUc3R0N6cldXeW5xMWhOUkU1NzFO?=
 =?utf-8?B?WWlpc0pKcENldmFORkY4Qjh6ZkIySkljdDNsVWZIU2NweVZTbm11R01oMkhE?=
 =?utf-8?B?MVBjTjArNERKM3RENVU3dFQzWmdJSE1yRkpPQ2NsVmlZNitHWnI3Nk9iYlFW?=
 =?utf-8?B?K3dXWkpTUVM5YjV3bTJRMkhRZjJkWmFNTFF4Y1l3d0pwN05KcFArQk95Q1Qw?=
 =?utf-8?B?NVM2YmxNdEVvQWo0TStwVHkwdTJJZXBXczFSL2paUEZNNzFwaGlXUGJXWmpx?=
 =?utf-8?B?RVNtVmluN2l4VGxDaS9MenhNaHhMSmdQU3dlQzNKc1k4NFFCTkRkQWdMYlNn?=
 =?utf-8?B?cUdvRFg2OTRvRDE4dWlXVnU3Z1NrNk0vOFBPNjdObHA2ekpGemtKRGlFUWV3?=
 =?utf-8?Q?ICao4dNUvS00Gx3fU29IPurMZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b1c401-e68f-4806-4321-08dbaf101af7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 19:33:11.2053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGvrjsxHXwVuAx+0T+aPBD8ikBSewwcNcqkhLTCUmeaoYMZd4yy6qY4fIC0fbzyomJu9O+6pMXytbyRWD1t9Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9094
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-10 12:02, Melissa Wen wrote:
> On AMD HW, 3D LUT always assumes a preceding shaper 1D LUT used for
> delinearizing and/or normalizing the color space before applying a 3D
> LUT. Add pre-defined transfer function to enable delinearizing content
> with or without shaper LUT, where AMD color module calculates the
> resulted shaper curve. We apply an inverse EOTF to go from linear values
> to encoded values. If we are already in a non-linear space and/or don't
> need to normalize values, we can bypass shaper LUT with a linear
> transfer function that is also the default TF value.
> 

I think the color module will combine the TF and the custom 1D LUT
into the LUT that's actually programmed. We should spell out this
behavior in the comments below and in the patch description as it's
important for a userspace application to know.

The same applies to all other TF+LUT blocks.

Harry

> v2:
> - squash commits for shaper LUT and shaper TF
> - define inverse EOTF as supported shaper TFs
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 16 ++++++++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 11 +++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 29 +++++++++++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 32 +++++++++++++++++++
>  4 files changed, 88 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 730a88236501..4fb164204ee6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -363,6 +363,22 @@ struct amdgpu_mode_info {
>  	 * @plane_hdr_mult_property:
>  	 */
>  	struct drm_property *plane_hdr_mult_property;
> +	/**
> +	 * @shaper_lut_property: Plane property to set pre-blending shaper LUT
> +	 * that converts color content before 3D LUT.
> +	 */
> +	struct drm_property *plane_shaper_lut_property;
> +	/**
> +	 * @shaper_lut_size_property: Plane property for the size of
> +	 * pre-blending shaper LUT as supported by the driver (read-only).
> +	 */
> +	struct drm_property *plane_shaper_lut_size_property;
> +	/**
> +	 * @plane_shaper_tf_property: Plane property to set a predefined
> +	 * transfer function for pre-blending shaper (before applying 3D LUT)
> +	 * with or without LUT.
> +	 */
> +	struct drm_property *plane_shaper_tf_property;
>  	/**
>  	 * @plane_lut3d_property: Plane property for gamma correction using a
>  	 * 3D LUT (pre-blending).
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index deea90212e31..6b6c2980f0af 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -769,6 +769,17 @@ struct dm_plane_state {
>  	 * S31.32 sign-magnitude.
>  	 */
>  	__u64 hdr_mult;
> +	/**
> +	 * @shaper_lut: shaper lookup table blob. The blob (if not NULL) is an
> +	 * array of &struct drm_color_lut.
> +	 */
> +	struct drm_property_blob *shaper_lut;
> +	/**
> +	 * @shaper_tf:
> +	 *
> +	 * Predefined transfer function to delinearize color space.
> +	 */
> +	enum amdgpu_transfer_function shaper_tf;
>  	/**
>  	 * @lut3d: 3D lookup table blob. The blob (if not NULL) is an array of
>  	 * &struct drm_color_lut.
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 7e6d4df99a0c..fbcee717bf0a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -151,6 +151,14 @@ static const u32 amdgpu_eotf =
>  	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF) |
>  	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF);
>  
> +static const u32 amdgpu_inv_eotf =
> +	BIT(AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_BT709_INV_EOTF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF);
> +
>  static struct drm_property *
>  amdgpu_create_tf_property(struct drm_device *dev,
>  			  const char *name,
> @@ -209,6 +217,27 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
>  		return -ENOMEM;
>  	adev->mode_info.plane_hdr_mult_property = prop;
>  
> +	prop = drm_property_create(adev_to_drm(adev),
> +				   DRM_MODE_PROP_BLOB,
> +				   "AMD_PLANE_SHAPER_LUT", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_shaper_lut_property = prop;
> +
> +	prop = drm_property_create_range(adev_to_drm(adev),
> +					 DRM_MODE_PROP_IMMUTABLE,
> +					 "AMD_PLANE_SHAPER_LUT_SIZE", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_shaper_lut_size_property = prop;
> +
> +	prop = amdgpu_create_tf_property(adev_to_drm(adev),
> +					 "AMD_PLANE_SHAPER_TF",
> +					 amdgpu_inv_eotf);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_shaper_tf_property = prop;
> +
>  	prop = drm_property_create(adev_to_drm(adev),
>  				   DRM_MODE_PROP_BLOB,
>  				   "AMD_PLANE_LUT3D", 0);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 882391f7add6..8d6ddf19bb87 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1332,6 +1332,7 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
>  	__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
>  	amdgpu_state->degamma_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
>  	amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
> +	amdgpu_state->shaper_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
>  }
>  
>  static struct drm_plane_state *
> @@ -1353,11 +1354,14 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
>  
>  	if (dm_plane_state->degamma_lut)
>  		drm_property_blob_get(dm_plane_state->degamma_lut);
> +	if (dm_plane_state->shaper_lut)
> +		drm_property_blob_get(dm_plane_state->shaper_lut);
>  	if (dm_plane_state->lut3d)
>  		drm_property_blob_get(dm_plane_state->lut3d);
>  
>  	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
>  	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
> +	dm_plane_state->shaper_tf = old_dm_plane_state->shaper_tf;
>  
>  	return &dm_plane_state->base;
>  }
> @@ -1430,6 +1434,8 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
>  		drm_property_blob_put(dm_plane_state->degamma_lut);
>  	if (dm_plane_state->lut3d)
>  		drm_property_blob_put(dm_plane_state->lut3d);
> +	if (dm_plane_state->shaper_lut)
> +		drm_property_blob_put(dm_plane_state->shaper_lut);
>  
>  	if (dm_plane_state->dc_state)
>  		dc_plane_state_release(dm_plane_state->dc_state);
> @@ -1462,6 +1468,14 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
>  				   AMDGPU_HDR_MULT_DEFAULT);
>  
>  	if (dpp_color_caps.hw_3d_lut) {
> +		drm_object_attach_property(&plane->base,
> +					   mode_info.plane_shaper_lut_property, 0);
> +		drm_object_attach_property(&plane->base,
> +					   mode_info.plane_shaper_lut_size_property,
> +					   MAX_COLOR_LUT_ENTRIES);
> +		drm_object_attach_property(&plane->base,
> +					   mode_info.plane_shaper_tf_property,
> +					   AMDGPU_TRANSFER_FUNCTION_DEFAULT);
>  		drm_object_attach_property(&plane->base,
>  					   mode_info.plane_lut3d_property, 0);
>  		drm_object_attach_property(&plane->base,
> @@ -1499,6 +1513,19 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
>  			dm_plane_state->hdr_mult = val;
>  			dm_plane_state->base.color_mgmt_changed = 1;
>  		}
> +	} else if (property == adev->mode_info.plane_shaper_lut_property) {
> +		ret = drm_property_replace_blob_from_id(plane->dev,
> +							&dm_plane_state->shaper_lut,
> +							val, -1,
> +							sizeof(struct drm_color_lut),
> +							&replaced);
> +		dm_plane_state->base.color_mgmt_changed |= replaced;
> +		return ret;
> +	} else if (property == adev->mode_info.plane_shaper_tf_property) {
> +		if (dm_plane_state->shaper_tf != val) {
> +			dm_plane_state->shaper_tf = val;
> +			dm_plane_state->base.color_mgmt_changed = 1;
> +		}
>  	} else if (property == adev->mode_info.plane_lut3d_property) {
>  		ret = drm_property_replace_blob_from_id(plane->dev,
>  							&dm_plane_state->lut3d,
> @@ -1534,6 +1561,11 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
>  		*val = dm_plane_state->degamma_tf;
>  	} else if (property == adev->mode_info.plane_hdr_mult_property) {
>  		*val = dm_plane_state->hdr_mult;
> +	} else 	if (property == adev->mode_info.plane_shaper_lut_property) {
> +		*val = (dm_plane_state->shaper_lut) ?
> +			dm_plane_state->shaper_lut->base.id : 0;
> +	} else if (property == adev->mode_info.plane_shaper_tf_property) {
> +		*val = dm_plane_state->shaper_tf;
>  	} else 	if (property == adev->mode_info.plane_lut3d_property) {
>  		*val = (dm_plane_state->lut3d) ?
>  			dm_plane_state->lut3d->base.id : 0;


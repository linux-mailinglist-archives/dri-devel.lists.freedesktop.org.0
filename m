Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E787ECA84
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 19:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E13310E557;
	Wed, 15 Nov 2023 18:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F10810E557;
 Wed, 15 Nov 2023 18:27:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsImsr1bzgdkOgKwhBWCTUxxp4o8lWqHhEkwfyntrzejs+uve+epwSOkTYfx3+mgpQy9jbOhhMGNcMgF87fHaPzsr856+JfMCUvJ2hqazGrBDdS/aE+5iDtuWrErN0gY8sfDQdGsSvOQwGqZmVE4L1CBBCDz+FhNxOGslXbBZv1U/M7WurvrYDws2rNlaMyA6VvgCdzjFIOs1JeWHmd9omVRXC+Umx5n/ilyDjDPVdY2j1UjmUZitzMJjbbuC41TGb8jHL32UhBC2vo+gGw/P8v/a1+chhLFAHzT2ueZ2i9t2Vvtpe2jJPYJOM6ApBQ/pt2thq9/teBr0bLvKjWglQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lP7R3Yzug/zoGheu09SriYiVDEaVqL3X+nUaQArpkyQ=;
 b=E5Dof5tOxaNpq1Ex9+smXnzco9j7zOhY74Pe8Pl4YCb08+rnCUsYEDxvt1wA6eYVNo7EbwsuoLFPpT7U4t3xagJxhU4YyX/E8k1T3H5BZJ34NjgB+r0aBoTLlISYkevI+yLsbh6ePxuFpFL+9wvEL+OgDRxScSEFMJWXKmw6Kmymj4H/z7aAG5unAm+56nj8SdKrRMncv+L44KPRcP8xjKB5yJZnLCybxpC/39Hwt2NRlMbJlsBch2srINvFrxtcoXA+sPwKhBhy7nky4ODu3ib5TunAzhMxrXkTS9HoKrRwtvkOOfJZCcXeV1RV0KcYP2K0GGuf5uTLveboI5YmOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lP7R3Yzug/zoGheu09SriYiVDEaVqL3X+nUaQArpkyQ=;
 b=rF+crQsIhqqC1v+JN2o+QR62rjZ+m4khZbQuevHO2TaL/PZQfUHlDsH4mjgN1TPs4oyPVcvMCAx0s8mAPs6V7K5SjsBu0t3YIkPHDi7GROShT2kmlp+jvMy2ivhY9tMEaUM7MfBdx8Oj7rgEjFRCMp8JWOF8jr3jjEIHyObU/mg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ0PR12MB7083.namprd12.prod.outlook.com (2603:10b6:a03:4ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.22; Wed, 15 Nov
 2023 18:27:13 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%5]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 18:27:13 +0000
Message-ID: <66a4ec67-041c-40fb-bb04-ebba9eb64721@amd.com>
Date: Wed, 15 Nov 2023 13:27:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/32] drm/amd/display: add plane shaper LUT and TF
 driver-specific properties
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20231005171527.203657-1-mwen@igalia.com>
 <20231005171527.203657-11-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231005171527.203657-11-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0256.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ0PR12MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: 73659ede-5fdc-4694-3836-08dbe6087cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u9wdzFrtBOXkgV82TSt7VQLn/sx5xzE4cZCRmEGyl8eDoUMyu4ZZYozoh8GB4x27ex022y1N7rhsvCYVX/8SA21aQ5Q97XeHljbrYfpGe9ZIFFntBKBj3nq9Az6WaafT389bof7iK4+gjuEEg29czPPylyCu2kN85aTDSAxLaQrHfsQ3xLlg1YYy4EsQdeV8ZnZBcXw5IloU59nxr7mjZmjaL9FRBSk8vOfr7T0k+9ZUqPNmFTcA4sN/EkkAXGBAIndwVLbcs7a7xvaCOczbnYTCgXQmW+CmPm2ZjMhjIV9sNnXAcXl7J/oXfPQ1k2w+kphfHrx1G9JsvvB5NQDy7h574/NM3skrDnJL4HvMrRwFWweRy2V9qFFWTGSoObKmBa29BaUzmHZJKYdEgWE72fRYprNXNnnq2rTVgXtTzf6BUyHAmlhIvMklKkiMNE4DT31BiNL43K3vBZRE2NwKjqgOT5zlFzcQTsBOqNcY5LLXBv4ZkdFLeBUurJCj2MKHLAC7FGitr4wWKa2lZs5m46RNX6/Z4L3l9iJi7tZsanmrtoRKV67y4djZp4rfKWVkIUHr9kFXjRnJ/2RcncH6+nCQVzThpoVShbmN3nP6hx4z+/1G5Atkad7uo2eZ1q8hCpseUw3hIgOpCLWqwfbcB0fmslxIuLHLTTn+nJd6ymE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(366004)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6512007)(54906003)(316002)(66946007)(66556008)(66476007)(38100700002)(110136005)(8676002)(8936002)(4326008)(6486002)(478600001)(31686004)(36756003)(6506007)(53546011)(44832011)(7416002)(86362001)(5660300002)(2616005)(921008)(2906002)(26005)(31696002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXArVUR3YW9uY3RWaXpVenJYM0JwdUlEMkxWd2NOQS9ZZng0QlZNZmpVQkZ4?=
 =?utf-8?B?ZFo2N2lLeUorajdUMkdBU0VmZXdMd2pLbG1TM2s2SnZRVFBQWGdydWtmOW4z?=
 =?utf-8?B?V0FUSEdMRXYwL25lMFNSWGtMUGFWaDBFTjYvUVJzR0U5Ymk0ZzVBODNNeXBr?=
 =?utf-8?B?SmtOWFEyWDlQeFBqeUhveDBMdnM2S2xwT05wZ3ZwelQ5eDRDdFRhYWV0Rlox?=
 =?utf-8?B?dHhTQUFhWjRtdW1aU0Y2QkhlNWhGbUlTVU5JUnVSZXY0RW51UGhBL2pjZzZI?=
 =?utf-8?B?aWt2cmtDQVFRMmFvTnlSYTN6eURXUVYzcEttNVNaZ0pIOUQ3V3cwKzRidkpW?=
 =?utf-8?B?QlNsZGFhcGVGa1g4aHV3eWQyRldrZzliTXAxQUl3M0ZSNlE5Tk5QVm5icDd3?=
 =?utf-8?B?R2ZjSWFVeWs0Z2xKSEMvZXFYTkplZXpnNFo1WXIxTmNJQlNpek15a2cvTHRX?=
 =?utf-8?B?Q3MzcmZVdkg4N2RoSklKV3RUd1RiYmUrMTVHYlRpU21CTjRURHBUSm1QMndX?=
 =?utf-8?B?bzJqOGRTeUhjdFdiblFrSzN1RWVNb2VVK0hDOFVILzlxU21tTnlvcS81Rita?=
 =?utf-8?B?T0JZdWlqTFBNa2c0M1NOdUQxZ1paUlAydnJjUG5QS3NYN2YxMzl0b2VjNWpW?=
 =?utf-8?B?RUt0MmZmVFczSVBmbzhkM3BoNGZvQkoyMnIvMmdacFZ3QlRJNGVLejAzTHVa?=
 =?utf-8?B?L3lLajM5Q2o5NzBGZ2crUVhQS2hYck5jbWFoZzRyUmJsTk9zUFdKUW4rY3hV?=
 =?utf-8?B?UW5MK20xeGRWWTBjZHoweXV0eHlzeTJ2L0o3eGlzWnM3ZjdlQjNIaTlMRFdH?=
 =?utf-8?B?a2pUNXRUQmQyL0VIcmhTUXBmcE80T1B6aks3QmhNU1RRZmdkdWxQcXc3aklL?=
 =?utf-8?B?d3Q2WW5BaGFzaGx4aGJoOEozRTZoRXdKYUtWVjBVMGdiSTVmeUtpcVRQU3ZW?=
 =?utf-8?B?OXUxUXduMFgzZGFib0ZubmlOcmk3UW1sa2NoUVlySzhWdXJaYzdBbG93YUNs?=
 =?utf-8?B?Q05acnYzZU80M09mRC90Z1U1bjI5Znc0eXFLMUZ0NFhSVzBCOVZlamlIQ2xp?=
 =?utf-8?B?YzNUQmxaNjRNUkFqR1h3NjREc2NEZjRLbDMzQ0V3aHlRSno3Q3VOd3pUeERq?=
 =?utf-8?B?ejRndUZnckRER0hVZm8zYUxOUkdFK2tFRm9uSjFMVFhhQkNSWnNYdlVZVU1D?=
 =?utf-8?B?WU5uYnRER0creUdXR0NyTjdVLzhRTmdWdkZUMkovaXN6dlVDUWNvREZaTXdV?=
 =?utf-8?B?Y3ZCQUpJRUcvRkVuS1JPTDBXNlVkUkdaNk93Q3VZR2xHTHV3WEFiazVYREoy?=
 =?utf-8?B?NHJKaE5Xdnl2anpETkFyWkNQejhqcE41WG5CMWV4VTJKcHRkclYrNk5Ya1B1?=
 =?utf-8?B?dnFzeDFsZXNEMlB2NWU0VFU3V1QzSDQ4T3AyaDFQVW1Kd2N4bU9uL3RHMjFj?=
 =?utf-8?B?ZWRqZWxVbjJZWXF3ZGZIU1prbzhhVkFBMFFWbCtjUThIVktXL3JZS0o3a0lZ?=
 =?utf-8?B?N0ZTOTAxT09LaVgwa1JxZXRDa0ZvNUh6Mk5ncnpmV1AzY3ViSXJXeDY4MTRW?=
 =?utf-8?B?dkFZdWVPY1dzWE40VHhvUWZoM2JkdnQ2OWF3RnZQSm5qbHdoMkRXNk1qcEFq?=
 =?utf-8?B?ZVJ1WkNrM1NObkZBR25xR25KYmZRcHJ6MmF2UUJUU1kwR0VMMS9OYkpFTEt0?=
 =?utf-8?B?VTBaa09hSElLaUFrSG9EQ1JSdTcwUzQxSHo4VDV5bEFIQTlEWjRkdWdlZzBC?=
 =?utf-8?B?WC83OFdoeTByQmZjR0l3SG1BdlovZnhCS01MUVRUcEd1SzdnTExXZ1h4WnZo?=
 =?utf-8?B?T1FsMzJJemVKL2YvM1lvZzBvczNBSnYzL1N2RTZJNGpuZVg2NWNONVQzc1NI?=
 =?utf-8?B?MHV1MGNNTG1LR2pzdlZVa21Eci9XejlUQk1DR0R6NHQ5QlJ2bkNVNXhnRE02?=
 =?utf-8?B?ajBES1dRSTdMUDNxZ3M3RlVZWU1pSEZUa3BtaEVaSmVGS3RBOWtqSXJNM25T?=
 =?utf-8?B?Y1BQWUp3SXZSNDRyZDZvd1F4Yk1KTVdqK2pSaEFjNm9mM2hFK0o2Nm5MbVVO?=
 =?utf-8?B?WGw3TG96azBYZTE2c25GOEtUQnJyKzIwSTlwMmtSdnRVbVlHV0c4cWt6NTNs?=
 =?utf-8?Q?a0w2FpeR368vs43LIZZvDEFF2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73659ede-5fdc-4694-3836-08dbe6087cdb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 18:27:13.3437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXkyslsWvPyGQEwU2bwapJAPgJTatePIPnw+0tuT7XS+HJkJ0XsEAJ21Jlpd2hTJIzdQSMO/AerFA3Mb7TMIrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7083
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
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-10-05 13:15, Melissa Wen wrote:
> On AMD HW, 3D LUT always assumes a preceding shaper 1D LUT used for
> delinearizing and/or normalizing the color space before applying a 3D
> LUT. Add pre-defined transfer function to enable delinearizing content
> with or without shaper LUT, where AMD color module calculates the
> resulted shaper curve. We apply an inverse EOTF to go from linear
> values to encoded values. If we are already in a non-linear space and/or
> don't need to normalize values, we can bypass shaper LUT with a linear
> transfer function that is also the default TF value.
> 
> There is no shaper ROM. When setting shaper TF (!= Identity) and LUT at
> the same time, the color module will combine the pre-defined TF and the
> custom LUT values into the LUT that's actually programmed.
> 
> v2:
> - squash commits for shaper LUT and shaper TF
> - define inverse EOTF as supported shaper TFs
> 
> v3:
> - spell out TF+LUT behavior in the commit and comments (Harry)
> - replace BT709 EOTF by inv OETF
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 21 ++++++++++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 11 +++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 29 +++++++++++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 32 +++++++++++++++++++
>  4 files changed, 93 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index f7adaa52c23f..af70db4f6b4b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -363,6 +363,27 @@ struct amdgpu_mode_info {
>  	 * @plane_hdr_mult_property:
>  	 */
>  	struct drm_property *plane_hdr_mult_property;
> +	/**
> +	 * @shaper_lut_property: Plane property to set pre-blending shaper LUT
> +	 * that converts color content before 3D LUT. If
> +	 * plane_shaper_tf_property != Identity TF, AMD color module will
> +	 * combine the user LUT values with pre-defined TF into the LUT
> +	 * parameters to be programmed.
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
> +	 * with or without LUT. There is no shaper ROM, but we can use AMD
> +	 * color modules to program LUT parameters from predefined TF (or
> +	 * from a combination of pre-defined TF and the custom 1D LUT).
> +	 */
> +	struct drm_property *plane_shaper_tf_property;
>  	/**
>  	 * @plane_lut3d_property: Plane property for color transformation using
>  	 * a 3D LUT (pre-blending), a three-dimensional array where each
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 7a2350c62cf1..0e2a04a3caf3 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -784,6 +784,17 @@ struct dm_plane_state {
>  	 * TF is needed for any subsequent linear-to-non-linear transforms.
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
> index 011f2f9ec890..d3c7f9a13a61 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -173,6 +173,14 @@ static const u32 amdgpu_eotf =
>  	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF) |
>  	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF);
>  
> +static const u32 amdgpu_inv_eotf =
> +	BIT(AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_BT709_OETF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF);
> +
>  static struct drm_property *
>  amdgpu_create_tf_property(struct drm_device *dev,
>  			  const char *name,
> @@ -230,6 +238,27 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
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
> index 068798ffdd56..a381b3558bd1 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1338,6 +1338,7 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
>  	__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
>  	amdgpu_state->degamma_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
>  	amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
> +	amdgpu_state->shaper_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
>  }
>  
>  static struct drm_plane_state *
> @@ -1359,11 +1360,14 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
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
> @@ -1436,6 +1440,8 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
>  		drm_property_blob_put(dm_plane_state->degamma_lut);
>  	if (dm_plane_state->lut3d)
>  		drm_property_blob_put(dm_plane_state->lut3d);
> +	if (dm_plane_state->shaper_lut)
> +		drm_property_blob_put(dm_plane_state->shaper_lut);
>  
>  	if (dm_plane_state->dc_state)
>  		dc_plane_state_release(dm_plane_state->dc_state);
> @@ -1468,6 +1474,14 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
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
> @@ -1505,6 +1519,19 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
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
> @@ -1540,6 +1567,11 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
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


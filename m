Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B10B68F3CE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 17:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCF510E7B7;
	Wed,  8 Feb 2023 16:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D5710E78F;
 Wed,  8 Feb 2023 16:51:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgEAx0U8aKgJtawjl0OLEHLrIijEvlue3j3aJmRCeZ2AATJcdDnhLFlZSRYbXZVqNkL0M397X0b5yS+1mN5eKestgdiIwboXdatyD3XTTpaRhdwETsZ20p3EphMTBwFyXmdFvcnDsD2asIWrgCrnNST73bt0wtm7Z0Xgm7KAE2k4CqQT3dImKaQyyrY9SFBnNw92wNqiV+9E1VT/KM0l2wjm3fZFJxFjopDF+vpszbscxmK4rW1EE6k5YzyP9vxWlr2lnjRz1AZnYv7AtKXEDAueG/PFKzmxFn8JsKvZ+gQ5e6oSsLK8wN0mJC69KgWfw2YSRNCkPVF7nJyaQRnliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5q53LhhOYK7v11qcQ+KWdaGuENZPvRKJeXTt6J6rJM=;
 b=fL1PM9gJotHboAPadB4RDGZg/+6YVTSY1SbccXxr+LTXqfYjqT3eqEQ/JIKs+7ZwUnT5LoTbjKQIC7JEDCuDurEKt8Hhts0GVKkwl4x6B5KyMKRiqQamvmLIrAq+HKSNgypRe7Bz6nU+PJFAcquraRn5MWekP57ZVvY6OfNGaLYX2GKh/KFUIjPySUubcBAS28Oe2iLNuynnmPSGlMrbzpb68XUFS7ceLKvwkfgOro4rMqsd9DhlDu4KodJ6s/d6CABIijlXLmv9jSlHgHz3UiXAcA/Bg+vA99dr4o9xu0b8MOd4fTxG+kNa1WqESrHastM6WKanMylpfgs9lL+yYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5q53LhhOYK7v11qcQ+KWdaGuENZPvRKJeXTt6J6rJM=;
 b=499uJaOe0kytacAegn+A8sLtYeT6tn5V5VaPa9OzSy72AJDqEgXsPP78c0Acx4WOV3qge4UrLLCjFyLt5VwPYmxnhPP67Cpasfyqs5OdUhhcmeZBE0rInQkWKUmdQu/pWMY4zOz69Q55O2xzB3IJJUDDDCSz0JcFSU5xDrTpgi4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA0PR12MB4525.namprd12.prod.outlook.com (2603:10b6:806:92::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 16:51:50 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%9]) with mapi id 15.20.6064.034; Wed, 8 Feb 2023
 16:51:48 +0000
Message-ID: <529f4db8-7673-4207-810e-4aa8e4aaa8b0@amd.com>
Date: Wed, 8 Feb 2023 11:51:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] drm: Introduce plane SIZE_HINTS property
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230208040911.12590-1-ville.syrjala@linux.intel.com>
 <20230208040911.12590-2-ville.syrjala@linux.intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230208040911.12590-2-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0227.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::9) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA0PR12MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b85580-52c7-4785-ef86-08db09f4c511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vWx/7ZtPiX2P7iT+Uex+NotUi9F/hx1xWPD/s35ETvDKQkrJmfXZbvoiqefEN5ZwLnYqwthIbeRPvamrGjlgtze0r0/fEmzaqR4jFVKukHlhhwlnos9wiWQEm60fAyvyvfWeT+oB+Cpzi0IkOv+ryJvYTSeLSh8NbIoBKRJg+AK34m18gCtb3Tqx4UjqE92Br3xVyH+V943gZFzCtxk0Vi4zESjXfWVHvs2WV/Z/oigNENdN9948cUyuLab7xRIP84grqmpZubqUG8PBrvcVg7+rn6TKM1VCKaLcMt+cKYbrE53OizKwR/aHUC7jWTfvN157saeTf0mw3AKVuY9R+Wvw2axBtEEd5K2RIT4MDdssMQT+jzzsKp9rsAApxTQ/DE4nsI5fEGUFUcjlxPAbXjTDcUQOUogTlN3TqtECAF7JzSP+uz6xGHAfrfIAO8C3vw+aEnBtJRNXJHCr987KcF5VzBhNbbZPRGWbcIlS0SQxree3dRKZ2bjQ7Yy4Uo5figT2kc+CLeMAB4CdnomP2Xy0Zz7AYvwOUhsGMG7m548TE/7Aka1/8D7VZsjKXtAqoI3MlbIlcGV/fXcNGDgcW8s0Fmt4ugXE8WaXIt9fZ+NNJ+bCzfoZx5tlfxor3NXzEUHFvMCmrIMqMpTdHoyBRWXnmLc6O5wUjStGm442oUYB6Czap34CvNXXvuFHy4h1qkuOYC1zKgxR+7rC7bYtbmZUSSpUWgCOxmgb68NHGko=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(451199018)(83380400001)(31686004)(2616005)(54906003)(2906002)(316002)(478600001)(6486002)(38100700002)(36756003)(66574015)(44832011)(66556008)(4326008)(66946007)(8676002)(41300700001)(6506007)(8936002)(5660300002)(31696002)(86362001)(6512007)(186003)(26005)(53546011)(6666004)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG1rYlo1enQxbWJxSE1SdC9PVTJwLzh2K1p0dUpzeUJDT2Z1ejBYNGNRM2VR?=
 =?utf-8?B?d1dXNDdCVXA4dHlrbzdWREhOVS9pN3pQSW9ocU9FUXprNlB1TE9tZFViVlk4?=
 =?utf-8?B?RjllRmNEODZ5aTFOR1ltZGRtRVhTVnYwa244RWpnTFBrZXhaTlFzVGRTOHBI?=
 =?utf-8?B?aWRHRGlZaFFiSHQ5RzVzVE5CYVRmSXhtcWxzeEl0dzl0YXJYOTFpd0JYZzMr?=
 =?utf-8?B?V2lHbU84SkovZS9nTTZzak50dmhLYWFLUXFzRHJmQWlqZzE4Zm50SVE3YlNl?=
 =?utf-8?B?UTd2bTB5aDYzL0FWcEp3OHNySTBld3lRcDBFekk5RmV4czA0ZDR5R3lHMktR?=
 =?utf-8?B?YkQrT25heUs3NWN0TDRRKytiNGdvdmRINWtXR0s3OWRhSmh3REU0bWcvZDlq?=
 =?utf-8?B?alg3QXlWOEwxNWhsRWcxdzIwNHhEQ3NZbmVIQmtaa1BOMURwd0NJb1dTQ25Y?=
 =?utf-8?B?Zi94YXZHZ1JocDdjeEpweE5kRGFFUnA4ek9ab1BoS3VTaDZvRTRtQmRQY1lt?=
 =?utf-8?B?S0RJSWQ3SzN0SjVFV1Y2U1d3a0lrWWlsUVQ1bGc1RnBXY1k3SWM3U3YySFNU?=
 =?utf-8?B?RnJJcnFSTXpURURYRStpMllSaGNhMjNRM1MrK2NxNmFFY1dDUjF5U0YzWWJW?=
 =?utf-8?B?dkxWL01xQzFBc2xNSDc4bnhGN2RvVmM4T0lFdEFrWis0dWRKeVoxTjVHVWhI?=
 =?utf-8?B?amRLMnBUWk5HUE8zUGV3akFQMnlQMERwSS9DbEhqRnVxaW8xMEZ4VVVsMjdm?=
 =?utf-8?B?aVBNYXkxS1Y2a0VZdUpMcUQrSjZjT0JDbGNqa0tycU1LT2RmSGNibzUyRWpD?=
 =?utf-8?B?SVdTL09mUDJqMTZVeWpxODFQczV0SzJxZk03UzFUN1RkRXdjMmVCZkpZUFM4?=
 =?utf-8?B?Q2Rqckxab2FLMW40eks0MDExRS9obHdtTVEwU0xWcVE4NTJCV2hLOU9YVGpC?=
 =?utf-8?B?bmxsNVluaHFNMWJqZ1hPVWNkdGdWd3hMRW8ySm1IT3hUNEIzNDQ1YmVBOHdF?=
 =?utf-8?B?b0VNSHpTdG9xUUptVzVzNXNoOGZBekFFOHJWSjBrMzg0Z25Pc3hTQ0tGdHgy?=
 =?utf-8?B?UkdCcno3dGlHRWh0OXN3WTBwdXJRSzFwZlZIemwyejhmdnNUdDU1c3gvUlFh?=
 =?utf-8?B?cUpwWnp6WTJhVnhBNFhTWWMvVWxNbXhUOENOcmt2anEwVndTOHNPY20xVWYy?=
 =?utf-8?B?T29icFc0dEM4b3B1SDA5dDdjL0VqSy9XZmNjbXVYTUMvNExOSjBWZ21QWDYv?=
 =?utf-8?B?Y2FQZzAvczVHV2xWRlBRNUlKNXJVVUlUYVhUcVpnK0FIUXRsSW5qQkNET21F?=
 =?utf-8?B?azhlb1FkQzdJaTFPOUtYUWFnRmV6Nk1hV2xKMDZIV2VnTnFLbHJHSndHOEp3?=
 =?utf-8?B?Y2paOCt4c0VGdFJsKyt3V1VMYm92dG41anluRUFOMGFrdDZtN1JEbFByVllH?=
 =?utf-8?B?blFYdlcvV2lZdUR6dXk1aDJ6dldpM0xMVFprTitmOFFxZHZ4dnFJMFpwM1FB?=
 =?utf-8?B?Q1BoS05EV3J4cEFSZTFJTnhGSFhQYVJLOGNDRFJtdlFDaHptSmJCODRPc1dV?=
 =?utf-8?B?RUJjYzhzY21LRnpUcmJsbnZkY05jemQ2ckw5QXhkVmRTNGF1dlFZcXd3b05a?=
 =?utf-8?B?ckRSK1NaZGhZcXc2Q3djT2l2aUVZbFFFMkIrWldUSWNjT1NPYlY3aHhVajJk?=
 =?utf-8?B?UWJtRmQzS3NIc2haWm5qOEJoclJQTW1udHdIK3VyTm1lMFgzRDhEd1VWRnh4?=
 =?utf-8?B?YUh2cC9LTVJlaEt3bDFGcHR2Z292blNJMEJwTFZ3ZlpLdG1Eb0p5czA1ZGhQ?=
 =?utf-8?B?R0xmZ1c4ZmljNnpGSmFUNXNaT0lOaW9ZL3lxbXlSby9qTE1yRFF6bkVwSTZw?=
 =?utf-8?B?Rk5pbkZQYWpLRy91VTNmUVp2MEFSYWkyMk45a1pwbmhzMEZvK3BPZ2JDeDk0?=
 =?utf-8?B?S3RFVW1uQkRPQlRqWXNYYk0wVmtpM2lobEovazJPelJhTXd2bkpVc0dyVVR6?=
 =?utf-8?B?dGd3RERCQkp2cjkzYXMyV2YzMWN3TFJUWHhkN1Z5elBsL3ZXV2F5cWtGZHUw?=
 =?utf-8?B?eWhiOGZ4a3MyLzNzeDBHd3F4S1AvRW5YTDU0WmlDOVhoSzRlajdNRWRzL2l3?=
 =?utf-8?Q?rB5Nr24nS6fRv8ATXkkMqf/VZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b85580-52c7-4785-ef86-08db09f4c511
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 16:51:48.7732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9F6K3LDd/8K9JeOGlJozAtjmgwD9ijBQU6YZkuzFV3jBv0ea8AHjuk7b2mpD6DlC5TsLWLyyVSJFTFqeAsguWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4525
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
Cc: intel-gfx@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/7/23 23:09, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Add a new immutable plane property by which a plane can advertise
> a handful of recommended plane sizes. This would be mostly exposed
> by cursor planes as a slightly more capable replacement for
> the DRM_CAP_CURSOR_WIDTH/HEIGHT caps, which can only declare
> a one size fits all limit for the whole device.
> 
> Currently eg. amdgpu/i915/nouveau just advertize the max cursor
> size via the cursor size caps. But always using the max sized
> cursor can waste a surprising amount of power, so a better
> stragey is desirable.
> 
> Most other drivers don't specify any cursor size at all, in
> which case the ioctl code just claims that 64x64 is a great
> choice. Whether that is actually true is debatable.
> 
> A poll of various compositor developers informs us that
> blindly probing with setcursor/atomic ioctl to determine
> suitable cursor sizes is not acceptable, thus the
> introduction of the new property to supplant the cursor
> size caps. The compositor will now be free to select a
> more optimal cursor size from the short list of options.
> 
> Note that the reported sizes (either via the property or the
> caps) make no claims about things such as plane scaling. So
> these things should only really be consulted for simple
> "cursor like" use cases.
> 
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Jonas Ådahl <jadahl@redhat.com>
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

This would be great to have. amdgpu could take advantage of it as
well. I didn't have a thorough look at the details of this
implementation but like what it does, so this is
Acked-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>   drivers/gpu/drm/drm_mode_config.c |  7 +++++++
>   drivers/gpu/drm/drm_plane.c       | 33 +++++++++++++++++++++++++++++++
>   include/drm/drm_mode_config.h     |  5 +++++
>   include/drm/drm_plane.h           |  4 ++++
>   include/uapi/drm/drm_mode.h       |  5 +++++
>   5 files changed, 54 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 87eb591fe9b5..21860f94a18c 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -374,6 +374,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
>   		return -ENOMEM;
>   	dev->mode_config.modifiers_property = prop;
>   
> +	prop = drm_property_create(dev,
> +				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
> +				   "SIZE_HINTS", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +	dev->mode_config.size_hints_property = prop;
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 24e7998d1731..d0a277f4be1f 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1582,3 +1582,36 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_plane_create_scaling_filter_property);
> +
> +/**
> + * drm_plane_add_size_hint_property - create a size hint property
> + *
> + * @plane: drm plane
> + * @hints: size hints
> + * @num_hints: number of size hints
> + *
> + * Create a size hints property for the plane.
> + *
> + * RETURNS:
> + * Zero for success or -errno
> + */
> +int drm_plane_add_size_hints_property(struct drm_plane *plane,
> +				      const struct drm_plane_size_hint *hints,
> +				      int num_hints)
> +{
> +	struct drm_device *dev = plane->dev;
> +	struct drm_mode_config *config = &dev->mode_config;
> +	struct drm_property_blob *blob;
> +
> +	blob = drm_property_create_blob(dev,
> +					array_size(sizeof(hints[0]), num_hints),
> +					hints);
> +	if (IS_ERR(blob))
> +		return PTR_ERR(blob);
> +
> +	drm_object_attach_property(&plane->base, config->size_hints_property,
> +				   blob->base.id);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_add_size_hints_property);
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index e5b053001d22..ed9f6938dca1 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -949,6 +949,11 @@ struct drm_mode_config {
>   	 */
>   	struct drm_property *modifiers_property;
>   
> +	/**
> +	 * @size_hints_property: Plane SIZE_HINTS property.
> +	 */
> +	struct drm_property *size_hints_property;
> +
>   	/* cursor size */
>   	uint32_t cursor_width, cursor_height;
>   
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 51291983ea44..1997d7d64b69 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -32,6 +32,7 @@
>   #include <drm/drm_util.h>
>   
>   struct drm_crtc;
> +struct drm_plane_size_hint;
>   struct drm_printer;
>   struct drm_modeset_acquire_ctx;
>   
> @@ -945,5 +946,8 @@ drm_plane_get_damage_clips(const struct drm_plane_state *state);
>   
>   int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
>   					     unsigned int supported_filters);
> +int drm_plane_add_size_hints_property(struct drm_plane *plane,
> +				      const struct drm_plane_size_hint *hints,
> +				      int num_hints);
>   
>   #endif
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 46becedf5b2f..4f0551d7f481 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -849,6 +849,11 @@ struct drm_color_lut {
>   	__u16 reserved;
>   };
>   
> +struct drm_plane_size_hint {
> +	__u16 width;
> +	__u16 height;
> +};
> +
>   /**
>    * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
>    *

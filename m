Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC3E44444A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 16:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9277364E;
	Wed,  3 Nov 2021 15:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C33F7364B;
 Wed,  3 Nov 2021 15:08:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuMciaYZWHVs6EiZU78GFv5dMPFlfdjsxWODJffDQJrN7pRKel6Z+dujU7rbtktP2s4t5qGO+BbVlJFCaLZDC23SY/DTkQu3ZNak2YexDM79iuYsCe5xioKCN0vXwxJzTqgZMinfUd8GyEHnuvnAOGXfoap0lzQzZbL1Cn4MRmnp9xp8sAGP1PL9FwkTA6nE7rLGCrrI0VaW4KSO55W/hnP18+eqvk/1fgKHR66BguOIlpVbfF3NNBbxPDr6ANbxrHxKWlVg5TlcE1tB0jam2Z+pBC5jwsYcPanp41WnhNAMsUeYaMQKvK1qWLZFhiYpM25jqKR+mBz4xhph37LE8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUnOkYOUR/CAjpXHbN+nzJIpzTZhigFt0a6pJq60LnI=;
 b=eCZq2Xg+B9JD2Db8CyQHKUOy6tu96v/tc0Qs1Fr8lVCRcs3YXX7hZq3QdVCa4NMqzJdsbcmsVZdoNWtCCcmNzaQJaIH8dApgpD6EnEQ+wzXBKnTvgOrapYNIoUTQ0B69Jzo+a36sPBzse23VkThn4tRmEFy1yiBYvxyQXSebMF15BOuZLjO6fJ4ffwXkLiQQrsig1psMIiv7XNKbQMBX+K2+48t/Ml9vtoujLwQlnZip/3hibhyftKA0PTb1ZlYOZ7ZyKgX2Y6dXxKW6PiDpb6+8SmGVY0gaiFs8OMONuzj7WOPv/WQ3xWhUXNB/jnY20BJVYZu1RNXn/3rZxdFspQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUnOkYOUR/CAjpXHbN+nzJIpzTZhigFt0a6pJq60LnI=;
 b=09EtXnDI3ZqBRzr03o7zUZlvauKIb2XEc9PEUE1kGJve4jF+YYGkLvKaVQ+FIVns9A/xE+lQ+dYacuQBBIauVtCrwrjIupMdGL0evFyrlq8UB8jP9joJUfdyMBj5rUkgx5AQBxVAoBzcoxPqBP9leQSQptJ6Uprlg38dJ1lCj+w=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5428.namprd12.prod.outlook.com (2603:10b6:5:35c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Wed, 3 Nov
 2021 15:08:17 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975%3]) with mapi id 15.20.4649.019; Wed, 3 Nov 2021
 15:08:17 +0000
Message-ID: <d67a9761-91b4-3432-dd55-f85bb0657b68@amd.com>
Date: Wed, 3 Nov 2021 11:08:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [RFC v2 02/22] drm: Add Enhanced Gamma and color lut range
 attributes
Content-Language: en-US
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-3-uma.shankar@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20210906213904.27918-3-uma.shankar@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::33) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:15::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 15:08:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87014ef7-8667-4062-b484-08d99edbc411
X-MS-TrafficTypeDiagnostic: CO6PR12MB5428:
X-Microsoft-Antispam-PRVS: <CO6PR12MB54289B56933A97F34AE51CA68C8C9@CO6PR12MB5428.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O4vezhnzARnSWZ9yK2ZffWXC9lqXgPADhBjhpGz7yNM2/9ROPOzfWt+wXwTV1YaO6rPxhPN/670sh3nos21N6RVsGcwkmP8rRimLUqIid8E1Md1UasQ85baHCLHGwCp0jN8KNgVqyjpkg8FaAQWHSEHFShMREPDtP+SHJ5oy7pv5i24IIv3VFHiRzkaZgxzFGJoqLVNwmeTDvnGrv1VLmC4bZtIKozol+W+Jo6MEzRWha+8wu/yCf623XnpTdnxqpEKFAat0ZFUJ3qYrqvlz1lc/Skud6nCW2OpAwcXn9OPI29BMDvj2qpqpKqhrmtx1O3KjopuSqD8e+8h3IQ31G1U9Wqiy3+EtK061lHPgO1WIArxQMBrQa1urlaN3zCqsM7Y7k07JZ5jCOsyVm25P4xfNNh1ilqwtax2Tcia2pYtjrrpCelnxE6p4CK6SIzk+x7u9LqAb0qLf0AN+iYqxUlgDIzsvnNk1PpDDSlLYNRvPBWOirqvM8tfpxjiJ9+QsBaes/9c31BShwpPHUqBF9weZBSXVpSipXCd0J5ZA89KlgZYIpfva9Bgm8yLf4JHfAO41QJYVhqG34WjFAAYTuI3cT0eDkoL37rgh42hP/G+6vz0C0crB6pD649dBJ23yTgE8dz9w943iuaKyIK60sXO0ct6shcPXoY7Oe2bSGPWQWXVTkExGeQvbhmeliymRIHIScjUkiCaqx8hqKtdiAM2/TOVyiqwVBXT0hTlA/+o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(5660300002)(8676002)(53546011)(4326008)(86362001)(956004)(6486002)(2616005)(66946007)(66476007)(66556008)(31686004)(6666004)(316002)(36756003)(508600001)(26005)(186003)(8936002)(83380400001)(2906002)(44832011)(38100700002)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU9ZNGdzRFFhZ05zTlU2ZFR2b05zRlVDQ2RDSHVFejJyT0ZCVnhiMjR5ZVFW?=
 =?utf-8?B?QjBpT3BMSlVkU2F0ei9aYUhYVmwvVkhTQUJ6YjVVdlpjUXFMditLMU9takRC?=
 =?utf-8?B?RER4VlNrUWRGZnVvTVFHZVRxeWJvWnJDZUxTL21GclpsazhIS0RSQlc5b01t?=
 =?utf-8?B?QmxiREpJZ1phemg2bTRUWlpaamszK3FkdXg0N0VCT3BjcUVkaUtiV3NOWXg0?=
 =?utf-8?B?S2FLWVVFeEZXWC9Zdm8rMklBU2xDaGZ3VWg2WDZ3RElDTys5U1NKeWoveFpM?=
 =?utf-8?B?MGRkeEx6SC93dnVmU0NzcjJTQXUyRUZ0UkZ3K1dKWTVqb1Y2YnlubGtlUThE?=
 =?utf-8?B?MFZJRWppd1djYWI0OVp5RGg4TnhBREFsR0JTRnloK3dFMEV5WWw4T2dhS0tv?=
 =?utf-8?B?QXNlQjhhOWNuVDl3QWVORUtTVjgzK2doOTR3RTJ5NWJCcTU0SkltVWhzdUlE?=
 =?utf-8?B?NXFwVnp5MzBsUTZOY1pNd1Z0ODBJekV0L2dGbUhsM05zc1ZoN1BUbTNxN2VF?=
 =?utf-8?B?aC9DQjlNNnJKT0kyS2FvVVJUTElMWlc5VmtCOWFSdnIrL1lKbjBkWG5DYnlh?=
 =?utf-8?B?VUVEaVRiMHAzMzgwSnNaWWhhWmNNSGF3dnB4MENoK3IwZ0VYMFg0WTdBQTFn?=
 =?utf-8?B?Q0xZdHpsLytQUWZtbWtRazRLZlZYbzJsWTVjTWRxUVBBRVRMNlc5WVlwZ05h?=
 =?utf-8?B?RnJ6UFE3UGlVMGtQaExRRllGN1hDMnVOUDY5NUNjNk16a3M4WFRNUG5PdkhB?=
 =?utf-8?B?V2tPS1JwbjNGMjdRSGZIVkphR2ZPaDhjUEoxM2c0aVlnUC9UeWs1NGxKcTRD?=
 =?utf-8?B?bTczRTJacUVFYldOdUlmd1hIc00wZ2RNaTBzbUZCTlBQSjJQQW9HZExUK0FD?=
 =?utf-8?B?S09TWjUwdlhwLzRYQTRHT3liZ0poc29TWUFZSlZ2ek5raE9CYzl1ZkUxVXFn?=
 =?utf-8?B?M3ljVmNwQVhabE80WDlKMEtZYW8vc0c3akx1dzN5dUs3V0hGcU55RjNybWk3?=
 =?utf-8?B?UWIrR2F3K2ZvTUhjOWZocmRBVWNpS1Yva2xDVGZ1c1g3UjlZaDc5M1JweSsv?=
 =?utf-8?B?d2FIS2xGaVhHaFhrbXMxejQvVERmZXU3czhxRHV1bGhMdGpMMkkrK1lBdEJa?=
 =?utf-8?B?aEU4RERhbU1YeW9ITHN6YWNjb0RzcjdiVVJqb0VINHh6ZTFGeFlSWUd3NldV?=
 =?utf-8?B?RVpRVFVHanlxUU9MeXJuS2RROEoxdFZpYThTaWV5emRLWkFVWTA2cTR2eWs3?=
 =?utf-8?B?WXJNK1dPREdmbHgyVTljdDcrVUNkeXZkMFBoUStpK1F3RFprYkZ0cnhUK25h?=
 =?utf-8?B?OG5zcGFaNndzc0N6RnBmblNwMk5yUit1akhhM3NFd01jWERSeEkxcnh1NWpW?=
 =?utf-8?B?eEhDR202OEpsYjl6ZEg1b1VjWWEvUWk0d2duVXZDNi9rTHJFUGtGTHZGRjdB?=
 =?utf-8?B?MnM5T2k4bEtXRmJKVlNTZm5xdDM2THhGc3hleEZBanNTRUZFdzVsRTMwSjUr?=
 =?utf-8?B?b3htRWE2c0IzMHkyL0l2WjlrU3JnQ2psYkNlWkg0RzRqM1BITWM0SjUva3I0?=
 =?utf-8?B?aTBlejU5bHBIbXY2bVFIbmNCTjNQTlNQdHRiY2QzcUtTY0dLL3pnMXRtcXBW?=
 =?utf-8?B?UnI3TkNjWHdOTWNleExsS2YzbzcwYUo1V1ljQjlKcmxqWDZTcmgxK1NpRk5Z?=
 =?utf-8?B?a0lzOFVxSnBxdjlxbnVleWlDeUtDeG5TaDdvUE9sUWhyRDFldjZmVS92L25O?=
 =?utf-8?B?ZXAxZ1U0eDIwRThVN2xyUG14d0N1WE4yRGI2T01qMFNDV3NEOGlKbXNnS1lX?=
 =?utf-8?B?TWVhWitpR0Y4aXFOUXRtWjlrL1E2aTlNa000azh4YnBJTStWWVRWU1htNkUw?=
 =?utf-8?B?aHhqTW1qc2doNFF1bjN6M2VlZ0JXZlU0eFBnWjFOWVIxMGE4dW1hMzJiTm55?=
 =?utf-8?B?N2dIMDQvKzV6NkRnWThveldlNndWd2tqS1piSGkwYnBOMTJZSXdkUHhGbFh6?=
 =?utf-8?B?dTRzNnFoaFZmaUZWcEZ3RzNVYmROK0t2NUwrS3ZWaDhUQ0hJb2pVQVB3dWZC?=
 =?utf-8?B?TWJpSGFMaFl5NFkxZTN6ZlZKUlJKWFg2bmhlcTFpTVN4MGhISUhBZWVuNzFC?=
 =?utf-8?B?cE9qQTIzZk9KV2NsMWV1MFVYcy9YR0J5S1p6dFNqNXdSZEdRaWw0Ty9hc1ps?=
 =?utf-8?Q?eosJXq1YnPWeP1Pc4/2idSM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87014ef7-8667-4062-b484-08d99edbc411
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 15:08:17.6546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hsrLEpJ9snN1Rnr/SYvJjjhSyF0VK8HJy+5nLFbuh+kYPonNPM7viZ7a/5rPYlKSpubd/DVPGQ7/USt4Fp12dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5428
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
Cc: Shashank.Sharma@amd.com, sebastian@sebastianwick.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-09-06 17:38, Uma Shankar wrote:
> Existing LUT precision structure is having only 16 bit
> precision. This is not enough for upcoming enhanced hardwares
> and advance usecases like HDR processing. Hence added a new
> structure with 32 bit precision values.
> 
> This also defines a new structure to define color lut ranges,
> along with related macro definitions and enums. This will help
> describe multi segmented lut ranges in the hardware.
> 
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  include/uapi/drm/drm_mode.h | 58 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 90c55383f1ee..1079794c86c3 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -903,6 +903,64 @@ struct hdr_output_metadata {
>  	};
>  };
>  
> +/*
> + * DRM_MODE_LUT_GAMMA|DRM_MODE_LUT_DEGAMMA is legal and means the LUT
> + * can be used for either purpose, but not simultaneously. To expose
> + * modes that support gamma and degamma simultaneously the gamma mode
> + * must declare distinct DRM_MODE_LUT_GAMMA and DRM_MODE_LUT_DEGAMMA
> + * ranges.
> + */
> +/* LUT is for gamma (after CTM) */
> +#define DRM_MODE_LUT_GAMMA BIT(0)
> +/* LUT is for degamma (before CTM) */
> +#define DRM_MODE_LUT_DEGAMMA BIT(1)
> +/* linearly interpolate between the points */
> +#define DRM_MODE_LUT_INTERPOLATE BIT(2)
> +/*
> + * the last value of the previous range is the
> + * first value of the current range.
> + */
> +#define DRM_MODE_LUT_REUSE_LAST BIT(3)
> +/* the curve must be non-decreasing */
> +#define DRM_MODE_LUT_NON_DECREASING BIT(4)
> +/* the curve is reflected across origin for negative inputs */
> +#define DRM_MODE_LUT_REFLECT_NEGATIVE BIT(5)
> +/* the same curve (red) is used for blue and green channels as well */
> +#define DRM_MODE_LUT_SINGLE_CHANNEL BIT(6)
> +
> +struct drm_color_lut_range {
> +	/* DRM_MODE_LUT_* */
> +	__u32 flags;
> +	/* number of points on the curve */
> +	__u16 count;
> +	/* input/output bits per component */
> +	__u8 input_bpc, output_bpc;
> +	/* input start/end values */
> +	__s32 start, end;
> +	/* output min/max values */
> +	__s32 min, max;
> +};
> +
> +enum lut_type {
> +	LUT_TYPE_DEGAMMA = 0,
> +	LUT_TYPE_GAMMA = 1,
> +};
> +
> +/*
> + * Creating 64 bit palette entries for better data
> + * precision. This will be required for HDR and
> + * similar color processing usecases.
> + */
> +struct drm_color_lut_ext {
> +	/*
> +	 * Data is U32.32 fixed point format.
> +	 */
> +	__u64 red;
> +	__u64 green;
> +	__u64 blue;
> +	__u64 reserved;
> +};

I've been drawing out examples of drm_color_lut_range defined PWLs
and understand a bit better what you and Ville are trying to accomplish
with it. It actually makes a lot of sense and would allow for a generic
way to populate different PWL definitions with a generic function.

But I still have some key questions that either are not answered in these
patch sets or that I somehow overlooked.

Can you explain how the U32.32 fixed point format relates to the input_bpc
and output_bpc in drm_color_lut_range, as we as to the pixel coming in from
the framebuffer.

E.g. if we have ARGB2101010 what happens to a 0x3ff red value (assuming alpha
is non-multiplied)?

If the drm_color_lut_range segments are defined with input_bpc of 24 bpc will
0x3ff be zero-expanded to 24-bit? Is the 24 bpc an integer? I.e. would our 3xff
be interpreted as 0x3ff << (24-10)? 

Assuming the output_bpc is 16 bpc and the programmed LUT makes this 1-to-1 would
the output value be 0x3ff << (16-10)?

On AMD HW the pipe-internal format is a custom floating point format. We could
probably express that in terms of input/output_bpc and do the translation in our
driver between that and the internal floating point format, depending on the
framebuffer format, but there is the added complication of the magnitude of the
pixel data and correlating HDR with SDR planes.

E.g. any SDR data would map from 0.0 to 1.0 floating point, while HDR content would
map from 0.0 to some value larger than 1.0. I don't (yet) have a clear picture how
to represent that with the drm_color_lut_range definition.

If some of these questions should be obvious I apologize for being a bit dense,
though it helps to make this accessible to the lowest common denominator
to ensure not only the smartest devs can work with this.

Harry

> +
>  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
>  #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
>  #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
> 


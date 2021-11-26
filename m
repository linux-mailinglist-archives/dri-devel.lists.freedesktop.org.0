Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6475845F28A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B876FA9C;
	Fri, 26 Nov 2021 16:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2040.outbound.protection.outlook.com [40.107.101.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E628D6FA99;
 Fri, 26 Nov 2021 16:55:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UE0v+0nlK3wysib55ZxW3RbC55JgA9WcEfpLGYdnoYfAPS+NThKpfgNZPP8PXv55OGrWBxJHpWbvMc73SUQqFdXlW+7K1knHe9MdqXFf4YIOZ3nOWO1XqLMd1UFixXbrr2oSuUDgsm4BR8FKV6YTYyre2Hd+xuqcF/+/5qcGq2vejoXRRCyWrbiaeDSds3m9ZEj5riG5ZhUYe7QiU1gsbUXHSGQbUkGhEr5zEN3g99+et3F6EBxzPaN8FcStrBYjat8GOWkStpNchuq4A1ahA23XiVeGVVujKiDh3Zj7mwQOnJhWlqF+DJ6iuRJyKjhVKDRvlYD8h+lXxlOlYhD1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2Jr8DV89Io8K8/io+1CoIWJu5JYJdHqtsT92ES4W/A=;
 b=CGHD80xkOPWj+1J58uMZW0zQ5sQKAtaeW2PzEYrHKAtctu/vE8BG2cD/aKRpV1mxlawwPhyWXq+E9y/CS/lAissaSbhI0WSjhTcxUO1hr6SKq+qzMy3x0Jefej5rAszo/j+UblCxxGpXZBFz9+yeapPXyyZkMZASzHUydJqzIT1w3gYTCEO4WEblsdAlXVfdQpVSnOJA4easejitEbfi+1E/kM2RY2U/pPn0A97TmsWQ/SRyuontcQU9hYEBsY/v2m1J+iYUz3rZVQbbmSK/NQxY8K42CIS3+2pADuvZJx7qN+OVeQ8zd2ij+mAhiIAQ0cueR3/8Z+BMhY24RdDWyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2Jr8DV89Io8K8/io+1CoIWJu5JYJdHqtsT92ES4W/A=;
 b=Ek8O8E35tOF00+J4KyvWy+b5PrTjZ6olijYognsAoErXNwt/oSabBzHuGk7aK2YsXYM6HALPalkkHumh2RU4CCFUr1/YIel++ewG6cZ3QHNDQBKXs/DdZUArN5crBO/ghiqPu6G5lR/fD/c1YIjQdl+qxE30p4DUjwM9O3/zOe0=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW5PR12MB5569.namprd12.prod.outlook.com (2603:10b6:303:196::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 26 Nov
 2021 16:55:00 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46%7]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 16:55:00 +0000
Message-ID: <51250bb9-8e3b-a008-e457-429759c94271@amd.com>
Date: Fri, 26 Nov 2021 11:54:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [i-g-t 03/14] kms_color_helper: Add helper functions for plane
 color mgmt
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-4-bhanuprakash.modem@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211115094759.520955-4-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0159.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::32) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0159.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:e::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19 via Frontend
 Transport; Fri, 26 Nov 2021 16:54:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28cdb816-ebf0-4559-607c-08d9b0fd7c19
X-MS-TrafficTypeDiagnostic: MW5PR12MB5569:
X-Microsoft-Antispam-PRVS: <MW5PR12MB5569C84E734741B474B602CC8C639@MW5PR12MB5569.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HLmk9r3DXQa9XI+KiXHpomDydnjrzhzR6NTDNnQbbbl9KPUu89RyUT6rHRWGDsld7D4y84/5JW2uMGC1Zwqbqo3/2VTxmU3+9rmiiQ4eX0QrlefS2DYmtF/xI1V01XljvDTkN3z+Ug8xxSfROyuJVA5MQohTMLuX7lukvDsx92ZfyBGTQeIJhabG1VmpB1ImpEkfL8JAj0xJXhZIH33S2axINMHW/n8GeZqUtN7Nd54sM1VMFoJqF+x/XMlRv8Bqe1ndfbE+b+CUp2JSmWWze7XXNQNsYIVajVaRlWov1ChTrA7zj0ED0OGr28UnX9IOFzyLsDXh6/CFO124aTRZ5jjsA5Lz+NEr/d07IUg1jXs0nh8BaqxBets6GAM1NdUtorf9PntiuR7NxiTW0b+FNEAmeiOyUn+xHtKSDhbx0D7iFRMyj8l0hC1GEnh8GC4WHkyN7mkGryRRh7AMgza9C3pyMVHW0QQpJZtXDXZiBU7pu9DtoztojOKXyMrghCgSG+AzGdoD+c3pCN3lgy4ZskzvB3ekUh44LPPXCx/Xt2RLSqR1HvhfXTZVjR9W8nd03Wa3teXJLYYO4mW8qHBXG1dWSpUU0YZrTZvrMKw9qxO/gkIMry7gpIEpF6WIHXf2mM9ds0SYhIleBNdGcALJNaOzkvhMaGcdZmMqbVEqchNezs3JibGAkKOhymi7ZcF+bktg5LFduG56IcrmYQ+uTnjhnU/iwb4Ve0umy+hpWWk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(53546011)(54906003)(26005)(31696002)(186003)(31686004)(38100700002)(66946007)(66476007)(66556008)(16576012)(508600001)(2906002)(36756003)(316002)(44832011)(8676002)(956004)(8936002)(6486002)(4001150100001)(2616005)(4326008)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUdQRWFWWHlnWEs4N1V2eGRYaHQvbS8zbFpKZ3YwYlp3a2dyMXR2TXhDTVdh?=
 =?utf-8?B?U052dm02TUFoekRGTmd4Rk5UQVdqa1lodHM2SjloSGFjRUVoZUZxVjBQWXdQ?=
 =?utf-8?B?Vy9Idkg3OE1kNjU3VG52NUovNUtZUTV4Q0RoTUxPMElFaXBYK2FxZzFGNVdv?=
 =?utf-8?B?amtLdDJRNjdKWTNocExlWEwrVHF1bXFETGxlVTBIeE4vQ3RXdk03bnFNb0tE?=
 =?utf-8?B?RERwd3FpOWE1VXdMVHdia3Y0emtHbnBoUStkdUhnNnVhY3BiSUdmU0R4akZQ?=
 =?utf-8?B?cWNwanRyUmdTR2VKV29zd1kyVm51WDRhcXdGVy9yTnVwLzFWS3dNM2hveCt1?=
 =?utf-8?B?c09zYW1KTUVwSlJFNWNKbnM2VnVZUXVBYzg1UmZsc1paR2JKTURMTW9SVTRR?=
 =?utf-8?B?UU8xcXREV01md3EwdVBmTFRldzRVQlRXeUF5M3RiUWI2S2hjc25VV1BVblUy?=
 =?utf-8?B?cFNXNzR4Vm02akVaanVnMXBxMGdlVng0VC8ydGh6RXlSUFZIbDZpWldXTFFY?=
 =?utf-8?B?KzJwVlBkcmU1RlpqN2NzUWYxQkVtSHBrRFQ3TXNFUVFtbVBNOTNTeWJ0T2xa?=
 =?utf-8?B?a1p2WkpvSUlCcVpkS2tyaGFHVzV3MFZFZnhqWFBTV2hNM2tacEkxZHk5RTVH?=
 =?utf-8?B?VERpTHNFU3g3cEZTU21uT21zR1UwMlBBdDV1bzJKSWE0ODhjaHZJc0FHYUlm?=
 =?utf-8?B?VHZwRGxnZHIwVFB6SWltVjFaallETnNRa1lYaUR2b0l6ZS9PVExZNVVCUk9x?=
 =?utf-8?B?TjVSNkx6S01aRlB0cWFoV0pZUWxIK3ZidGpTQmUyZk1hZWErT2c5Vmh1bE9o?=
 =?utf-8?B?Z2Z2YTlqUW0wa3l1WXAzT2p1WmdNUXBBOHFqT1lHNEdXMU1WRGx4dms3VTlV?=
 =?utf-8?B?WVl1VGc4eUplOVBiWThCUHY4WmxLQ3JvRjV2Vmk5Zlhhd1hRNjhlRkgvb1J6?=
 =?utf-8?B?Qzgxb0JPaDZjVEZScTh4OFpMVmEvYmViTjJiNllDWHE2MXJ5bHdSTmxCdE5u?=
 =?utf-8?B?ckNqZHJrdjd4cU5BVzNIMWRpV3V0eHRIdDY4ckhZS01lMzQvRTBMRERQNEFV?=
 =?utf-8?B?TUJNbGI1TFY2VGhGODF3Yy9IQ0xpR3FiN01hUEozR1BaSGxodVpzY3lzT0ls?=
 =?utf-8?B?Q2hWRkkyVGJVbGRyM3krYjd2dEh6YjRGd0daZmI3UVZqS3dleWhweXpsQ1Js?=
 =?utf-8?B?U2hNY1dUUGswTDN0bWFTRjk3ZERRSDlEZlNJeWlTZ0dmMFB0MnpMUS9hOTFJ?=
 =?utf-8?B?NnpBT1ZCTlVWNE9VU2tLa0NJYkdnQjZISDVHVndUbjRDYWU5dWZhUjBtYzBP?=
 =?utf-8?B?TU42M1ViUUVsU1N4ZmROb0NienZ6OWQrdW8xM1J0WDkrR00xY0xQRWprdDZi?=
 =?utf-8?B?ejZEWVRYdzFkNWx0ZnhDY3UwSC9WOUkzcUljRDhvWDJST3RDYjVnZ0FCcjdh?=
 =?utf-8?B?cWpMOFpGQUE2Y1VmaHFEOFZSYlNhNU94alMxcEgvTDBnODFBOEJ1MmZBbmJu?=
 =?utf-8?B?S0tLcXV0aEhJSmVhaHg4dGd3dWZ4WGI4aWNOMGV1ZHRzd2xqR0RzVEJ4aEVp?=
 =?utf-8?B?WG5iSXExMnNNRkpuQmFHQTh0MkFpQXIybnJaWE1iM2ExY2xJSTdIWi9DaWll?=
 =?utf-8?B?YUVQcWNWNnFmNFhUazFaU3J1bGF4a1Q2aThuN1hMTXRBditRcTNjZStlcTJa?=
 =?utf-8?B?d3VvS0wrYWxhRVJDR29iVWd2M3NmaEI1SWtxNDMyV2dVdUZxV09EbFZwVmUv?=
 =?utf-8?Q?7slapGeu7bc0OmjBFPzrfv9PGMY2cjA7NFc0Bjn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28cdb816-ebf0-4559-607c-08d9b0fd7c19
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 16:55:00.6909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6kpfYsh3y+5sYPARg5SF5B0r6Tjxa7OVR0n+rMzp/7+Rqy24MGKqKHPDCTD1RvtAAB4SZrEKgXLNdtYluTMrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5569
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-11-15 04:47, Bhanuprakash Modem wrote:
> Add helper functions to support Plane color management properties.
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_color_helper.c | 173 +++++++++++++++++++++++++++++++++++++++
>  tests/kms_color_helper.h |  29 +++++++
>  2 files changed, 202 insertions(+)
> 
> diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
> index d71e7bb2e6..c65b7a0f50 100644
> --- a/tests/kms_color_helper.c
> +++ b/tests/kms_color_helper.c
> @@ -241,6 +241,150 @@ void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
>  		igt_pipe_obj_replace_prop_blob(pipe, prop, NULL, 0);
>  }
>  
> +drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
> +				enum igt_atomic_plane_properties prop)
> +{
> +	igt_display_t *display = plane->pipe->display;
> +	uint32_t prop_id = plane->props[prop];
> +	drmModePropertyPtr drmProp;
> +
> +	igt_assert(prop_id);
> +
> +	drmProp = drmModeGetProperty(display->drm_fd, prop_id);
> +
> +	igt_assert(drmProp);
> +	igt_assert(drmProp->count_enums);
> +
> +	return drmProp;
> +}
> +
> +struct drm_color_lut_ext *create_linear_lut(segment_data_t *info)
> +{
> +	uint32_t val, segment, entry, index = 0;
> +	uint32_t max_val = 0xffffffff;
> +	struct drm_color_lut_ext *lut = malloc(sizeof(struct drm_color_lut_ext) * info->entries_count);
> +	igt_assert(lut);
> +
> +	for (segment = 0; segment < info->segment_count; segment++) {
> +		uint32_t entry_count = info->segment_data[segment].count;
> +		uint32_t start = info->segment_data[segment].start;
> +		uint32_t end = info->segment_data[segment].end;
> +
> +		for (entry = 1; entry <= entry_count; entry++) {
> +			val = (index == 0) ? /* First entry is Zero. */
> +				0 : start + entry * ((end - start) * 1.0 / entry_count);
> +
> +			lut[index].red = lut[index].green = lut[index].blue = MIN(val, max_val);
> +
> +			index++;
> +		}
> +	}
> +
> +	return lut;
> +}
> +
> +struct drm_color_lut_ext *create_max_lut(segment_data_t *info)
> +{
> +	int i;
> +	struct drm_color_lut_ext *lut;
> +	uint32_t max_val = 0xffffffff;
> +
> +	lut = malloc(sizeof(struct drm_color_lut_ext) * info->entries_count);
> +	igt_assert(lut);
> +
> +	lut[0].red = lut[0].green = lut[0].blue = 0; /* First entry is Zero. */
> +
> +	for (i = 1; i < info->entries_count; i++)
> +		lut[i].red = lut[i].green = lut[i].blue = max_val;
> +
> +	return lut;
> +}
> +
> +void clear_segment_data(segment_data_t *info)
> +{
> +	if (!info)
> +		return;
> +
> +	free(info->segment_data);
> +	free(info);
> +}
> +
> +segment_data_t *get_segment_data(data_t *data,
> +				uint64_t blob_id, char *mode)
> +{
> +	drmModePropertyBlobPtr blob;
> +	struct drm_color_lut_range *lut_range = NULL;
> +	segment_data_t *info = NULL;
> +	uint32_t i;
> +
> +	blob = drmModeGetPropertyBlob(data->drm_fd, blob_id);
> +	igt_assert(blob);
> +	igt_assert(blob->length);
> +
> +	info = malloc(sizeof(segment_data_t));
> +	igt_assert(info);
> +
> +	lut_range = (struct drm_color_lut_range *) blob->data;
> +	info->segment_count = blob->length / sizeof(lut_range[0]);
> +	igt_assert(info->segment_count);
> +
> +	info->segment_data = malloc(sizeof(struct drm_color_lut_range) * info->segment_count);
> +	igt_assert(info->segment_data);
> +
> +	for (i = 0; i < info->segment_count; i++) {
> +		info->entries_count += lut_range[i].count;
> +		info->segment_data[i] = lut_range[i];
> +	}
> +
> +	drmModeFreePropertyBlob(blob);
> +
> +	return info;
> +}
> +
> +void set_plane_gamma(igt_plane_t *plane,
> +		char *mode,
> +		struct drm_color_lut_ext *lut,
> +		uint32_t size)
> +{
> +	igt_plane_set_prop_enum(plane, IGT_PLANE_GAMMA_MODE, mode);
> +	igt_plane_replace_prop_blob(plane, IGT_PLANE_GAMMA_LUT, lut, size);
> +}
> +
> +void set_plane_degamma(igt_plane_t *plane,
> +		char *mode,
> +		struct drm_color_lut_ext *lut,
> +		uint32_t size)
> +{
> +	igt_plane_set_prop_enum(plane, IGT_PLANE_DEGAMMA_MODE, mode);
> +	igt_plane_replace_prop_blob(plane, IGT_PLANE_DEGAMMA_LUT, lut, size);
> +}
> +
> +void set_plane_ctm(igt_plane_t *plane, const double *coefficients)
> +{
> +	struct drm_color_ctm ctm;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ctm.matrix); i++) {
> +		if (coefficients[i] < 0) {
> +			ctm.matrix[i] =
> +				(int64_t) (-coefficients[i] *
> +				((int64_t) 1L << 32));
> +			ctm.matrix[i] |= 1ULL << 63;
> +		} else
> +			ctm.matrix[i] =
> +				(int64_t) (coefficients[i] *
> +				((int64_t) 1L << 32));
> +	}
> +
> +	igt_plane_replace_prop_blob(plane, IGT_PLANE_CTM, &ctm, sizeof(ctm));
> +}
> +
> +void disable_plane_prop(igt_plane_t *plane, enum igt_atomic_plane_properties prop)
> +{
> +	if (igt_plane_has_prop(plane, prop))
> +		igt_plane_replace_prop_blob(plane, prop, NULL, 0);
> +}
> +
>  drmModePropertyBlobPtr
>  get_blob(data_t *data, igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
>  {
> @@ -274,6 +418,19 @@ pipe_set_property_blob_id(igt_pipe_t *pipe,
>  	return ret;
>  }
>  
> +static int
> +plane_set_property_blob(igt_display_t *display,
> +			igt_plane_t *plane,
> +			enum igt_atomic_plane_properties prop,
> +			void *ptr, size_t length)
> +{
> +	igt_plane_replace_prop_blob(plane, prop, ptr, length);
> +
> +	return igt_display_try_commit2(display,
> +				       display->is_atomic ?
> +				       COMMIT_ATOMIC : COMMIT_LEGACY);
> +}
> +
>  int
>  pipe_set_property_blob(igt_pipe_t *pipe,
>  		       enum igt_atomic_crtc_properties prop,
> @@ -319,6 +476,22 @@ invalid_lut_sizes(data_t *data, enum pipe p,
>  	free(lut);
>  }
>  
> +void
> +invalid_plane_lut_sizes(igt_display_t *display,
> +			igt_plane_t *plane,
> +			enum igt_atomic_plane_properties prop,
> +			size_t lut_size)
> +{
> +	void *lut = malloc(lut_size * 2);
> +	igt_assert(lut);
> +
> +	igt_assert_eq(plane_set_property_blob(display, plane, prop, lut, 1), -EINVAL);
> +	igt_assert_eq(plane_set_property_blob(display, plane, prop, lut, lut_size + 1), -EINVAL);
> +	igt_assert_eq(plane_set_property_blob(display, plane, prop, lut, lut_size - 1), -EINVAL);
> +
> +	free(lut);
> +}

This might make more sense as part of patch 7, though I don't have a
strong preference.

Harry

> +
>  void
>  invalid_gamma_lut_sizes(data_t *data, enum pipe p)
>  {
> diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
> index bb6f0054f3..5a35dcaac1 100644
> --- a/tests/kms_color_helper.h
> +++ b/tests/kms_color_helper.h
> @@ -64,6 +64,14 @@ typedef struct {
>  	color_t coeffs[];
>  } gamma_lut_t;
>  
> +typedef struct {
> +	uint32_t segment_count;
> +	struct drm_color_lut_range *segment_data;
> +	uint32_t entries_count;
> +} segment_data_t;
> +
> +#define MIN(a, b) ((a) < (b) ? (a) : (b))
> +
>  void paint_gradient_rectangles(data_t *data,
>  			       drmModeModeInfo *mode,
>  			       color_t *colors,
> @@ -90,10 +98,31 @@ void set_gamma(data_t *data,
>  void set_ctm(igt_pipe_t *pipe, const double *coefficients);
>  void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop);
>  
> +drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
> +	enum igt_atomic_plane_properties prop);
> +void clear_segment_data(segment_data_t *info);
> +struct drm_color_lut_ext *create_linear_lut(segment_data_t *info);
> +struct drm_color_lut_ext *create_max_lut(segment_data_t *info);
> +segment_data_t *get_segment_data(data_t *data, uint64_t blob_id, char *mode);
> +void set_plane_gamma(igt_plane_t *plane,
> +	char *mode, struct drm_color_lut_ext *lut, uint32_t size);
> +void set_plane_degamma(igt_plane_t *plane,
> +	char *mode, struct drm_color_lut_ext *lut, uint32_t size);
> +void set_plane_ctm(igt_plane_t *plane, const double *coefficients);
> +void disable_plane_prop(igt_plane_t *plane, enum igt_atomic_plane_properties prop);
> +void invalid_plane_lut_sizes(igt_display_t *display,
> +			   igt_plane_t *plane,
> +			   enum igt_atomic_plane_properties prop,
> +			   size_t lut_size);
> +
>  #define disable_degamma(pipe) disable_prop(pipe, IGT_CRTC_DEGAMMA_LUT)
>  #define disable_gamma(pipe) disable_prop(pipe, IGT_CRTC_GAMMA_LUT)
>  #define disable_ctm(pipe) disable_prop(pipe, IGT_CRTC_CTM)
>  
> +#define disable_plane_degamma(plane) disable_plane_prop(plane, IGT_PLANE_DEGAMMA_LUT)
> +#define disable_plane_gamma(plane) disable_plane_prop(plane, IGT_PLANE_GAMMA_LUT)
> +#define disable_plane_ctm(plane) disable_plane_prop(plane, IGT_PLANE_CTM)
> +
>  drmModePropertyBlobPtr get_blob(data_t *data, igt_pipe_t *pipe,
>  				enum igt_atomic_crtc_properties prop);
>  bool crc_equal(igt_crc_t *a, igt_crc_t *b);
> 


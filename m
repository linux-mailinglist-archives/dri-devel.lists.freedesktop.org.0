Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D5945F289
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1638E6FA9D;
	Fri, 26 Nov 2021 16:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2041.outbound.protection.outlook.com [40.107.101.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D1B6FAA2;
 Fri, 26 Nov 2021 16:55:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGXra4uAiGWQzNbfrW9H59lUTjOftO4RXsT43T7jOCzng5lfUSxw77OnFCwmfp31q+6/LEPLctdP06+76lXjwZFBE0ty0DjLJNOojfL2jKY7B69dkGtFUPrH2kkXhe5WLVA9AOCheWXhwPUaRsbD1SmiGYeNbw7Nv9deTa2ErndjkAKMCPLrtuwr+d4w+2+v6+HJwetykPcb1iDEihCwiitOxgRQl1OOlGAL4xXiWpXrBae+Lw6PMGfDfLUq3UMJxc+s37JghSB3JTvNiEHe244CFh3Vg3A32mR2jNektIPti+TGzzJ8uoeHkeyHKQLKblLK/zokq8EBq2k4kXqgqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTnct5lJDBMgm5JZ7FFO51A4EX2DZ4xYwnQIo2Ol7Sk=;
 b=cNWtCnQ22CGtP2DMgNa+/lESb/usvcEHeNynGIN2WiXPNBv+RQ5T66etmgHXKufBqq0Y0mnpJuTU7a7zGQWr+ldUL8U10lU1zgwCkctAYIVy7DQ3ctk9q03BXBhYiNHDJe0Cv2GTXB5UYDl9STq5Bsi76VJPY7oAXWkBXBGtuEw4lysFSL1Rlh9XN1IhnmEuyGB3llp6i9tYhQwtrv7V+6hxEdjnKRpys5k5pzpaLOJtvCewTlumZKdtXebUSCCuHiCjhUh89MUkpM207K9KLjeatjkZfgM1aG/Fgo7Qs1II823wiVcO+4xcphU+YxItgxFXcRxFqwpaCTIktjmgRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTnct5lJDBMgm5JZ7FFO51A4EX2DZ4xYwnQIo2Ol7Sk=;
 b=a1zPsXwzgOVTRpwA8EgrEDcY5GK9dQWtIfpIH7IFkReD0pSUlT/sHzzwu/e4P3520vE/WN0pQiOOTbwbWkwwXakM5h5fk9niBxpWtdJDM/f6qeVKhNj2EkxJe01C9LYLwqCcKwL0wRh2XO1pgGkzgI/iLw57z/g/mzISegWzCBw=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW5PR12MB5569.namprd12.prod.outlook.com (2603:10b6:303:196::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 26 Nov
 2021 16:55:10 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46%7]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 16:55:10 +0000
Message-ID: <1f1abd7f-90c1-3f36-04ba-4ee9eed7eab7@amd.com>
Date: Fri, 26 Nov 2021 11:55:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [i-g-t 12/14] kms_color_helper: Add helper functions to support
 logarithmic gamma mode
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-13-bhanuprakash.modem@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211115094759.520955-13-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::10) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0137.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Fri, 26 Nov 2021 16:55:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77009a96-c082-4363-0165-08d9b0fd81c8
X-MS-TrafficTypeDiagnostic: MW5PR12MB5569:
X-Microsoft-Antispam-PRVS: <MW5PR12MB5569A7AF99D489D72173C1948C639@MW5PR12MB5569.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zrTTjUCzyD4v1mW8faQ1FWr6UhxQGa/Tg6D+f4k7g6EkzS8NL8jXBKSEIriZlKi6Dkgl7w2TxH/M8fd9Cy0xNDhfn0MeXDwzziLhCNyXHp0zQS2Es3qcxMEL8FudfaUn5hGnpQahse5O6lu9JOenTYNk8PpDLdNaOPyM2VFUQAy6Mk1EUbdH93D4eqQVQgfp7eQFx1omY8Fbo3zrioc0pDVGwtRGCkFM9/wFnTKh8/b27ddrPtsfiuMRK+yhsiWeInUgdJLyH0DTobsRmlwgtvCSwpu7ghjdYNm5JP+Me0wL1KnYx/2iM9UrZAEWa8DCh1YhXkroDMhUNHOZtpy7CR5+urZQiYn7KvZ5AilA5C89FIREk3woSrplxTYfBQ4AzXZxs4mYYBu9j6/IfxNkmscO8Z+94nhfFy7hdm5flLqkBncNXE/pv2j7ki+9Nej5OZny+eoyzw12FxY/3kYTwILk54w6btMcznXtf9WKUXGoSiuN9tAblfuwL7rmCjMsLhTu2TFfkSdlN1NWdhiZ/7z0LeP7BjHiF0RAsCw2qIqf9O4AfPcaEnNqC/gqVUtY/x91piEXsRHEwBvbUqYMw3xoNvcnQz20ZBEmvPNBVLD0vDkzqlUQ1iKWoCjD1vmXOL62KODsjV91Dzk8+klsuSXz/pqzAvv84I6LFg5cQ9KQaG9CGSMkqwTRhXjiJVxFRqdmnKYgrXaygSjgn7VdomQAIhTgthCnuOfWH57UKPg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(53546011)(54906003)(26005)(31696002)(186003)(31686004)(6666004)(38100700002)(66946007)(66476007)(66556008)(16576012)(508600001)(2906002)(36756003)(316002)(44832011)(8676002)(956004)(8936002)(6486002)(4001150100001)(2616005)(66574015)(4326008)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnV1dTlnd3hwRktZR2Z6aktjWjZ1RWtIb1FFVkdGMHZ4Q3RiVWRPUUhKL0xL?=
 =?utf-8?B?ZEJYOHNRV0M1a3M4dlppaXhFUXNTUkt3OXJhZEVJVTl4cTN3dEo3SE9vaXpu?=
 =?utf-8?B?U0ZqT1VDd0RuenUxaG0xZENpTjVNVWlNRHlvcVFzdFA5V2FUOTcrTlhtMnNI?=
 =?utf-8?B?bzVYVzAyMDg0Vk8vOWt4THhtU3JoZWh6MjJ1a2Uxd1JqQjUwKzBPSEQ1a2RK?=
 =?utf-8?B?RllaWkNuTmhsbXA2K1pzWmNPNGpRTlkrZWV5anRQaHoxVWVXamFiR1E3OFl5?=
 =?utf-8?B?bC85VkFJRTdtdnJxcHBkV3JKZkx5ZUFyemJ2YllSSmwvZWczckQyVXQxeEw1?=
 =?utf-8?B?cGFkbFFXSnBIL2JTRFp0WHBJL1RnU21PLytHSVVXTUJMakRqbEdNczZTcFdk?=
 =?utf-8?B?enFIRHFWQkxFcTA2RUs2cWhzTWkxNXJPYkNpWS8rclhFRWNNUXM0ajVhcEd3?=
 =?utf-8?B?Q0taRWR5U01oWCttVTN4cEx6bElvZzZiby9mN3VZL0VacXAwTjd0SENtS25S?=
 =?utf-8?B?OVZCeXhPVG5GbXQ1RFl4Ni94QkVZaFlhdmdSNUVuWTYxeWFjc2ZmaE0ra3BM?=
 =?utf-8?B?WmZmeUEwVFQrTDdFZUZmM09uWHpSNjdwRXI5RGVaQkpkQ0VlWDE1MGJmM3Y4?=
 =?utf-8?B?NnM1YTRtOFJ6Z0grSnlSSWlVUzE1czgzV2FueENBT0RmYVFtbldNQkRJT09K?=
 =?utf-8?B?UXdzNmJSZWhMTURIcjlTS3Y1bjc1Q3YrM3hOV0ZpZXI4RStETUtzTGdNRjVG?=
 =?utf-8?B?TDUwaEhpbTFpUGJiUGVwcXdpVzFTb2h1M2ZEcE9pWWp1SGxYZXJtRkN5ODdo?=
 =?utf-8?B?cFBzK0NvUlMvWGdCWTRIN2pRMzRwdUY2SHQvK0I3NDVXY09QL0hLNmtiMWNO?=
 =?utf-8?B?T2xlclVUdDJIdzRmTXRzZEthelpEcnp0Tng5WmJ5THdUUVFrTjNwbnpkWFQ5?=
 =?utf-8?B?QmFxem9jbnVvMUxCdXNWNkl6UGFxSnpBTXdLc05mMzBNcExicnlVMFIvc2dN?=
 =?utf-8?B?UE84QmxxK0hyZnUwR3RQekdkYTdIb3JOK1M3Qm1XMDJpSitGL01rWkdoMXNj?=
 =?utf-8?B?VUlNK04xaXpRaHVQUTRQd0x1S3BXSnRrZjZLOXBQZkgwbEVHdXZnUXZDWU9x?=
 =?utf-8?B?ck91M3YrbU1WdDJFOUZxNng0bFhRUkpkWlRUK2xYbkJySDFnekordE1NcXYz?=
 =?utf-8?B?NlVoejlzeko0bUREUzJxcmZua0pmOHM0T0JZN1hDVWpYVlh6SnVscjJab3Rl?=
 =?utf-8?B?VXVNNkZhS0VMV1YxelhkSGdkWVB2TW9IWXhrTXF5ckFNNzdBNDlCTnp4RUU5?=
 =?utf-8?B?eHdCUTg1TjFKZGFzOXR2bFVHNy9HZjFiWXJGV3RtSFhmUkJReUpoVEQ3QUhy?=
 =?utf-8?B?YnNmUEVxcG5aK0JuSlRjN0NER2tSd09yU2t6YTdsTUt1eWwzOTdGQ0RRU284?=
 =?utf-8?B?SlF3WXZPN0s1NTM3aDdjSWRmeDdFUy9XZ1dqYUUvc0c0MTQyOHk5NTIrbG1W?=
 =?utf-8?B?VkprbUxXRjNHVmE0QzVSWGZ4TkZiWVFJNld2SHY2bUVWbGw2ZVFLQUkrR2tY?=
 =?utf-8?B?WGpoMXpWM1RXSi8rODdXY2xiR1Z5UGk5Q1U4Y1BiaC83NHdjWUpMaEVvZGtJ?=
 =?utf-8?B?M3BLTk0yclpTS2drUi9XNForK3FteDJHTERDclYwSUhYUFlPNGo1TXBVektP?=
 =?utf-8?B?UWtpR3F5YzEwRE5DRmtBTUcyM0tqN2I2WGh2VUNFSnZqOHVJMTdDa1pXNTcr?=
 =?utf-8?Q?miIJ0gCIYoDf72Un9OsITT6x0nfowwvUZxwKeJV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77009a96-c082-4363-0165-08d9b0fd81c8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 16:55:10.2010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ds1v/g/CmM07m7qoutmIMB2yb7+1fp4X/ZMC7BFAzFHpH7A+0NK30DoC8C+w7D4J66qPH4wYY6+z2Kq788n1SQ==
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
 Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-11-15 04:47, Bhanuprakash Modem wrote:
> From: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
> 
> Add helper functions to support logarithmic gamma mode
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_color_helper.c | 127 +++++++++++++++++++++++++++++++++++++++
>  tests/kms_color_helper.h |  16 +++++
>  2 files changed, 143 insertions(+)
> 
> diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
> index c65b7a0f50..7ea8282df3 100644
> --- a/tests/kms_color_helper.c
> +++ b/tests/kms_color_helper.c
> @@ -190,6 +190,33 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
>  	return lut;
>  }
>  
> +struct drm_color_lut *coeffs_to_logarithmic_lut(data_t *data,
> +						const gamma_lut_t *gamma,
> +						uint32_t color_depth,
> +						int off)

How does this create a logarithmic LUT? It seems to do the same
as coeffs_to_lut (which is also full of intellisms) except that
it also scales the values by max_hw_value / max_segment_value for
reasons that are not obvious to me.

> +{
> +	struct drm_color_lut *lut;
> +	int i, lut_size = gamma->size;
> +	/* This is the maximum value due to 16 bit precision in hardware. */
> +	uint32_t max_hw_value = (1 << 16) - 1;
> +	unsigned int max_segment_value = 1 << 24;
> +


This looks like it is specific to Intel HW. Intel-specific things should
not live in kms_ tests.

Shouldn't these be encoded in the drm_color_lut_range definitions?

To be honest I am not clear why max_hw_value and max_segment_value
differ here.

Harry

> +	lut = malloc(sizeof(struct drm_color_lut) * lut_size);
> +
> +	for (i = 0; i < lut_size; i++) {
> +		double scaling_factor = (double)max_hw_value / (double)max_segment_value;
> +		uint32_t r = MIN((gamma->coeffs[i].r * scaling_factor), max_hw_value);
> +		uint32_t g = MIN((gamma->coeffs[i].g * scaling_factor), max_hw_value);
> +		uint32_t b = MIN((gamma->coeffs[i].b * scaling_factor), max_hw_value);
> +
> +		lut[i].red = r;
> +		lut[i].green = g;
> +		lut[i].blue = b;
> +	}
> +
> +	return lut;
> +}
> +
>  void set_degamma(data_t *data,
>  		 igt_pipe_t *pipe,
>  		 const gamma_lut_t *gamma)
> @@ -203,6 +230,15 @@ void set_degamma(data_t *data,
>  	free(lut);
>  }
>  
> +void set_pipe_gamma(igt_pipe_t *pipe,
> +		    uint64_t value,
> +		    struct drm_color_lut *lut,
> +		    uint32_t size)
> +{
> +	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_GAMMA_MODE, value);
> +	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_GAMMA_LUT, lut, size);
> +}
> +
>  void set_gamma(data_t *data,
>  	       igt_pipe_t *pipe, const gamma_lut_t *gamma)
>  {
> @@ -241,6 +277,51 @@ void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
>  		igt_pipe_obj_replace_prop_blob(pipe, prop, NULL, 0);
>  }
>  
> +drmModePropertyPtr get_pipe_gamma_degamma_mode(igt_pipe_t *pipe,
> +					       enum igt_atomic_crtc_properties prop)
> +{
> +	igt_display_t *display = pipe->display;
> +	uint32_t prop_id = pipe->props[prop];
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
> +gamma_lut_t *pipe_create_linear_lut(segment_data_t *info)
> +{
> +	uint32_t segment, entry, index = 0;
> +	double val;
> +	int i = 0;
> +	gamma_lut_t *gamma = alloc_lut(info->entries_count);
> +
> +	igt_assert(gamma);
> +
> +	gamma->size = info->entries_count;
> +	for (segment = 0; segment < info->segment_count; segment++) {
> +		uint32_t entry_count = info->segment_data[segment].count;
> +		uint32_t start = (segment == 0) ? 0 : (1 << (segment - 1));
> +		uint32_t end = 1 << segment;
> +
> +		for (entry = 0; entry < entry_count; entry++) {
> +			val = (index == 0) ? /* First entry is Zero. */
> +				0 : start + entry *
> +				((end - start) * 1.0 / entry_count);
> +
> +			set_rgb(&gamma->coeffs[i++], val);
> +			index++;
> +		}
> +	}
> +
> +	return gamma;
> +}
> +
>  drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
>  				enum igt_atomic_plane_properties prop)
>  {
> @@ -331,6 +412,7 @@ segment_data_t *get_segment_data(data_t *data,
>  	info->segment_data = malloc(sizeof(struct drm_color_lut_range) * info->segment_count);
>  	igt_assert(info->segment_data);
>  
> +	info->entries_count = 0;
>  	for (i = 0; i < info->segment_count; i++) {
>  		info->entries_count += lut_range[i].count;
>  		info->segment_data[i] = lut_range[i];
> @@ -341,6 +423,51 @@ segment_data_t *get_segment_data(data_t *data,
>  	return info;
>  }
>  
> +void set_advance_gamma(data_t *data, igt_pipe_t *pipe, enum gamma_type type)
> +{
> +	igt_display_t *display = &data->display;
> +	gamma_lut_t *gamma_log;
> +	drmModePropertyPtr gamma_mode = NULL;
> +	segment_data_t *segment_info = NULL;
> +	struct drm_color_lut *lut = NULL;
> +	int lut_size = 0;
> +
> +	drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES, 1);
> +	gamma_mode = get_pipe_gamma_degamma_mode(pipe, IGT_CRTC_GAMMA_MODE);
> +
> +	for (int i = 0; i < gamma_mode->count_enums; i++) {
> +		if (!strcmp(gamma_mode->enums[i].name, "logarithmic gamma")) {
> +			segment_info = get_segment_data(data,
> +							gamma_mode->enums[i].value,
> +							gamma_mode->enums[i].name);
> +			lut_size = sizeof(struct drm_color_lut) *
> +					  segment_info->entries_count;
> +			if (type == LINEAR_GAMMA) {
> +				gamma_log = pipe_create_linear_lut(segment_info);
> +				lut = coeffs_to_logarithmic_lut(data,
> +								gamma_log,
> +								data->color_depth,
> +								0);
> +			} else if (type == MAX_GAMMA) {
> +				gamma_log = generate_table_max(segment_info->entries_count);
> +				gamma_log->size = segment_info->entries_count;
> +				lut = coeffs_to_lut(data, gamma_log,
> +						    data->color_depth, 0);
> +			}
> +			set_pipe_gamma(pipe, gamma_mode->enums[i].value,
> +				       lut, lut_size);
> +			igt_display_commit2(display, display->is_atomic
> +					    ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +			break;
> +		}
> +	}
> +	drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES, 0);
> +	free(gamma_log);
> +	free(lut);
> +	clear_segment_data(segment_info);
> +	drmModeFreeProperty(gamma_mode);
> +}
> +
>  void set_plane_gamma(igt_plane_t *plane,
>  		char *mode,
>  		struct drm_color_lut_ext *lut,
> diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
> index 5a35dcaac1..c863874f0c 100644
> --- a/tests/kms_color_helper.h
> +++ b/tests/kms_color_helper.h
> @@ -70,6 +70,11 @@ typedef struct {
>  	uint32_t entries_count;
>  } segment_data_t;
>  
> +enum gamma_type {
> +	LINEAR_GAMMA,
> +	MAX_GAMMA
> +};
> +
>  #define MIN(a, b) ((a) < (b) ? (a) : (b))
>  
>  void paint_gradient_rectangles(data_t *data,
> @@ -89,6 +94,10 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
>  				    const gamma_lut_t *gamma,
>  				    uint32_t color_depth,
>  				    int off);
> +struct drm_color_lut *coeffs_to_logarithmic_lut(data_t *data,
> +						const gamma_lut_t *gamma,
> +						uint32_t color_depth,
> +						int off);
>  void set_degamma(data_t *data,
>  		 igt_pipe_t *pipe,
>  		 const gamma_lut_t *gamma);
> @@ -98,12 +107,19 @@ void set_gamma(data_t *data,
>  void set_ctm(igt_pipe_t *pipe, const double *coefficients);
>  void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop);
>  
> +drmModePropertyPtr get_pipe_gamma_degamma_mode(igt_pipe_t *pipe,
> +					       enum igt_atomic_crtc_properties
> +					       prop);
>  drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
>  	enum igt_atomic_plane_properties prop);
>  void clear_segment_data(segment_data_t *info);
> +gamma_lut_t *pipe_create_linear_lut(segment_data_t *info);
>  struct drm_color_lut_ext *create_linear_lut(segment_data_t *info);
>  struct drm_color_lut_ext *create_max_lut(segment_data_t *info);
>  segment_data_t *get_segment_data(data_t *data, uint64_t blob_id, char *mode);
> +void set_pipe_gamma(igt_pipe_t *pipe, uint64_t value,
> +		    struct drm_color_lut *lut, uint32_t size);
> +void set_advance_gamma(data_t *data, igt_pipe_t *pipe, enum gamma_type type);
>  void set_plane_gamma(igt_plane_t *plane,
>  	char *mode, struct drm_color_lut_ext *lut, uint32_t size);
>  void set_plane_degamma(igt_plane_t *plane,
> 


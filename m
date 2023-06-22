Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DA073A1DA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 15:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD0410E03C;
	Thu, 22 Jun 2023 13:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290A310E03C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 13:30:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2zIEVl3jUn91QrhNtR5RiPSs+FISreREtOpctP+Bf5oB7e2sFEGwdXZVGa4MIp4YMGc1XhRAsfopf4/nRIThBe6ijFKf+shs5I9Kw+7tzrP0jRwyXUIwBZOMbvqx98yJoONDy9czfvqCfqYryj5/odvGU7CqsNzkr93fTfnnMdaOgUICPxi6MR4KS/o2BtRSG7Mx9sA0gTXQEC+3qtJL+EALZupHVqfhXB1nVrrGat8oGF1D+bKP3jjz1cgNx8VbrZCXBYOBgxtkXk12RJmHjTw7VfmoyOm/GnR/b7GeLn9sVAIJG7ncQKx8Wrlph2Kby9SSyJYXgy/xnT0ynQwvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfTHf4A5s00Q86TtDhayVC+7CYz0wEE6HuKYitk41Pc=;
 b=mhdZUzFHWaargqTHHJhkbAP0Ypd5Hmf09yHLMbiuH4v6W6EJnHRHHu5CB7RvZy5342KSsUSIYe6BdAN0jwkTZDrg3gr7Q8OqVOX/DqD9VvqqBOsCX1P4qjQ5myfzubn/fElIyoohDWr7LkUTsvo5+kEqiYgMrJhsx5V4LFJ9nSWnDw6s1qlPljDJwh6tjrojJLopa73lRIlSYReLBlPaAwGCP/k0Z409m2Q4qwSDb2pfNTAiG3CLQHs87GM/okJHl85QedloVRhT402FYVvY+RMBVPZkhksy91z5+xOg5VPRAdkEj+UCOqvG7cS/iiqwZ/pVG9RxPjgCzNRWIs8k7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfTHf4A5s00Q86TtDhayVC+7CYz0wEE6HuKYitk41Pc=;
 b=UxKUOGhKlcpryKFSd+HfwEv0XoacN+O64sYeHwhk+/zhExf9ubz13TbK8BEykx9gfNc/DpHS2RZ00/Wo5mo1PbaH+s60beyK2o8J+DZX2qbMia1kmFKnQVHr3GB3JQheGxdYryIOPs9nj6lEZg1dtiy21Vr8ako5XubRCwLXCbk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB6422.namprd12.prod.outlook.com (2603:10b6:8:b9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 13:30:50 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%7]) with mapi id 15.20.6521.020; Thu, 22 Jun 2023
 13:30:50 +0000
Message-ID: <8efd5420-6131-a017-517b-26d665bcc225@amd.com>
Date: Thu, 22 Jun 2023 09:30:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4] drm/vkms: Add support to 1D gamma LUT
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
References: <20230621194121.184552-1-arthurgrillo@riseup.net>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230621194121.184552-1-arthurgrillo@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::10) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: c4a5bd6c-442f-42e4-e724-08db7324e4f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kBZnAI/b0jGJtl9qHEgL4QSFkpK1MbbQTI85IdJjfQ2aW8SS37XYa+pMvBUEzxZC6vfRAlroZd9AWXPhCGa+nfThPy6QHB9hMpdLQIIKJVCrF70cf24pn/5WSYU4sc2YqkwVhPK4rtu3lItpweUIr1FpwwtZjFEc4wAjP2uZAvUAmkIkorZ84GJWhwo1rJnUBHdwYt0SBVsadEdwe+rK+9qMbMlAJ8AevEtC2ONL6YdhMAk/x9y1CA1+TWnYCv791gNLUNx2Kb8CUNKcF5fB3Md+VVXYwpGrg1RU2eb7z4KPXEKmvW6X6nLbU+09nNwQKelV5vDr5n9g/h4xpbXCxGYHbDoRkPSsd5E2Wp3ZeV4ARUuRhrYcWmH0UmB6TJK333yK21WLKA/bu4tGGlfpUPbml2+JWE4RuU+EVkJPWYjSQoav4I/SqfJQtkQnF3BRDRP3mMKVypexXuNPkZNIJM2AqduguK9RoApCgN5k1K2sUtqIXcSLIi1YX5mISxuT2V/1wT9XOPxIAjApweEYJ1Q1dUum9mRZDfQN6rYDrDmOFa+5QjcqSLvQoGgALv9cMq2/o+J98ELOrkmPxNLob6+F9YXR1Xp6drCTmEQJMfQig2iAKuy6n3iXy4/m+bgIg+7DHkZ/HB6TXbyee8sy9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199021)(2906002)(41300700001)(8936002)(8676002)(6666004)(478600001)(38100700002)(2616005)(83380400001)(6512007)(26005)(186003)(6506007)(53546011)(6486002)(31696002)(86362001)(66946007)(36756003)(316002)(4326008)(66476007)(66556008)(44832011)(31686004)(7416002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGxmaEtjY2hjdVN3cHJEaklZVkpIMkx0RGlVMjR4Ynp0MFBBRHNDMFF6Q0Ji?=
 =?utf-8?B?ZlRsMVdKMHlqMVRlZllHMjVzVm1TS3NZWW1oZm1vN3RsZk81YUJlSmpZVi9R?=
 =?utf-8?B?N0JUazd4SFZ0Y2UwalVXb1lFZmVoRVpia0I4eXJ6OWNPTDArS2hZdlZ5SFd2?=
 =?utf-8?B?L044MGxNYnFXVCsvV3JYNk92UFlhcEdLN282bVF1cUJWT2JJUTZHOElDL041?=
 =?utf-8?B?d014Qkp1M3ZnTTd1VlVsdDdjNjMvQitRbk5UOWdHVzY4WnArTTdTL2dDWnZk?=
 =?utf-8?B?WDNzSXFuTVdtNXVFY2pUTzl3VEgzaGZrUnJNcnVubys5RTlKVFZRUFJkUm5u?=
 =?utf-8?B?Z0NZMmtzb08zUFg0UU9hekNmeTNXcGRHV0IvcXlTNkJuSDR0RDAxazd3OWMv?=
 =?utf-8?B?R3JhNzF6VzBrQSs3Vm5wSU5NTmNuVGV6c2FvZnBER1hsWTRCVENwOWF0UnlT?=
 =?utf-8?B?VU5reFZJNGZJeGk1NDZKV3E5SERDT3BOZE1QbHhkbzJ5Mnhnc0wvSXNMT3BZ?=
 =?utf-8?B?NFBZNkd1Zjh6M2xvdzVhajZDVWJxM0xjdnRtTW1lUU9sZU5seStYQzhGMjB3?=
 =?utf-8?B?V1R3M1FZaDhwZlBPaGZTU0JjN0c3VW16UXdCYVYwZVRiU0ZnQXhQMEJIa085?=
 =?utf-8?B?UEtpT1VBL2dET29kZThvdnZMbG5xZ0FwY1dSZFlkWDRiYTM3M2FJbHZ4cjgr?=
 =?utf-8?B?aWppOHhZVzI3YmJOWEt3U0JobSt2VkwyL1Uvc2ZkNU8yemlRQ3UvWnBCeHhr?=
 =?utf-8?B?ZDRGZEtjRFM1VmFjZkduaW10eUZ5QWgyZUZabzgrTnpFNERPdVkvaG1LR0sr?=
 =?utf-8?B?Z2JKNFNxT0RtVUxKU0w2RGMwQWdDc3hvU3lRYjhialFUVGFLSFBZa25ZcHRU?=
 =?utf-8?B?TlMwQzlaNHlwcFNtSmh4cUhZc2hRSnFqcWtCYWZqdUZ6NnNZQTBaOEFwYXQz?=
 =?utf-8?B?c2lKNkR3RUJKMWpDSGRmTGNtQnRyTWF4allRY3RSTnp1c2l4VHMwZmpveTQ2?=
 =?utf-8?B?K0JOQnlHMUR4dnkweEpITWI0VlUzMDRPVTNMdGxwaExLb29VSHV6MU9wOXBh?=
 =?utf-8?B?QzlrZHlKaHNxL1lkV1hiQ3FQbGh5VUxOVitHdHpET3Z0UjRZRURCa3BzaDNX?=
 =?utf-8?B?VkZ6azdIYTBYWHVZT2liTXppOEtkQ0FKTGExUnUyK01NUU5KMHdLdm8xSVFC?=
 =?utf-8?B?WmtXVnFaZEtnY0pmM3lmOTJRYnFxSEtxQzFVczM4ZUZwMWZQeXIwR01WYVBC?=
 =?utf-8?B?aVZXNlVabWRreENqanA0MVVnaUR2NGt3QkFhK3RnMHVtYXdlQk93VnJEdkxQ?=
 =?utf-8?B?VGtDN3A1QVVkTkUya1VudEJtV2VORU9rYVB1Mm1ZRXNiMStZZjhRcWpBMXVX?=
 =?utf-8?B?ZnRNWm9zTFMvbktlUlp2NnRYLzgrdUxmZzIrdFBTb3VkQkM2U3NHNjFyWjJY?=
 =?utf-8?B?TUNKQTZkeTl6Q2toejVCeFZzSkt2SEhJUEk0SGszMGVTM1pmY1kxWnkycGJ4?=
 =?utf-8?B?RWM2OUxjSFdWRmNsVUhTMHlEcmN3WWVSQXgwYVdySGVWNmpVSm03Z2VXMTA1?=
 =?utf-8?B?bnFscWR3clRSVE15WVVZTzZSZlVnb0ZwU0FyYTJ6czFZQ2FHNXFlL1ZZQ0hL?=
 =?utf-8?B?ZE05eWhVK25ySmVYc2xDOGpsejVoT3Y3UklWOEVkQkliZlh3cnVKM0JxWExt?=
 =?utf-8?B?VU9SMjkxN29scjh2YWxyUS9SWlg3aDQrMGdNV1U1bmRrVXQyWU9nL0JQNzMv?=
 =?utf-8?B?WUlhc0MzUHRGeDBzSTV6V1F5dlF3VlRaWHhJVFM2dXoyV3BEdGxZZHhsWE9u?=
 =?utf-8?B?ODlSM3grcVJmaThielZpV2hzM2RnWjZ1dzZPbjNLa2UreE9kSjJFcE85RGJq?=
 =?utf-8?B?ZGE0b0IzdTF0aVcwN0svMW5XVnZIMWNudDRvVklhQ2x6RFBObXNhTkcyVXdk?=
 =?utf-8?B?NnZFeDZJVEhxNHhUTjdmaGVsWVNsMnpncTZaNHhkWjEzZktKMC9PNkwzOURX?=
 =?utf-8?B?QjFoR1dmdEJKcWhxTHBQbnhlSTJLbHltd1FzMkl0d3JmRmN5MjNLbkFNckZF?=
 =?utf-8?B?SUh5eU1zUklIcFpQeHR5Z1BzeXJ2a0VWTnBNUG5zc1ZZY0tmNDVPcUVaUEtP?=
 =?utf-8?Q?BKcvf+PMLg7z1fJxfDeggg8V3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a5bd6c-442f-42e4-e724-08db7324e4f7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 13:30:50.2155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PcHZxXDVIn0frkUqJwtBkwcCcBfg4jnMHz8Pxziz0NIP6Nsb7SxSF6ex1ywptRqmTfcqLj7T9xUVQ5b1WMRYPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6422
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
Cc: hamohammed.sa@gmail.com, aleixpol@kde.org, andrealmeid@riseup.net,
 pekka.paalanen@collabora.com, rodrigosiqueiramelo@gmail.com,
 xaver.hugl@gmail.com, mdaenzer@redhat.com, victoria@system76.com,
 mwen@igalia.com, mairacanal@riseup.net, jadahl@redhat.com,
 uma.shankar@intel.com, sebastian.wick@redhat.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/21/23 15:41, Arthur Grillo wrote:
> Support a 1D gamma LUT with interpolation for each color channel on the
> VKMS driver. Add a check for the LUT length by creating
> vkms_atomic_check().
> 
> Tested with:
> igt@kms_color@gamma
> igt@kms_color@legacy-gamma
> igt@kms_color@invalid-gamma-lut-sizes
> 
> v2:
>     - Add interpolation between the values of the LUT (Simon Ser)
> 
> v3:
>     - s/ratio/delta (Pekka)
>     - s/color_channel/channel_value (Pekka)
>     - s/lut_area/lut_channel
>     - Store the `drm_color_lut`, `lut_length`, and
>       `channel_value2index_ratio` inside a struct called `vkms_lut`
>       (Pekka)
>     - Pre-compute some constants values used through the LUT procedure
>       (Pekka)
>     - Change the switch statement to a cast to __u16* (Pekka)
>     - Make the apply_lut_to_channel_value return the computation result
>       (Pekka)
> 
> v4:
>     - Add a comment explaining that `enum lut_area` depends on the
>       layout of `struct drm_color_lut` (Pekka)
>     - Remove unused variable (kernel test robot)
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Thanks for writing this and thanks, Pekka and Simon, for doing the heavy
lifting with reviews.

This will be helpful while I'm writing a sketch of a drm_plane color
pipeline API with VKMS.

This patch looks good to me and is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 86 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_crtc.c     |  3 +
>  drivers/gpu/drm/vkms/vkms_drv.c      | 20 ++++++-
>  drivers/gpu/drm/vkms/vkms_drv.h      |  9 +++
>  4 files changed, 117 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 906d3df40cdb..620c0bafbe56 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -6,6 +6,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_blend.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_fixed.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_vblank.h>
>  #include <linux/minmax.h>
> @@ -89,6 +90,73 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
>  		output_buffer->pixels[i] = *background_color;
>  }
>  
> +// lerp(a, b, t) = a + (b - a) * t
> +static u16 lerp_u16(u16 a, u16 b, s64 t)
> +{
> +	s64 a_fp = drm_int2fixp(a);
> +	s64 b_fp = drm_int2fixp(b);
> +
> +	s64 delta = drm_fixp_mul(b_fp - a_fp,  t);
> +
> +	return drm_fixp2int(a_fp + delta);
> +}
> +
> +static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
> +{
> +	s64 color_channel_fp = drm_int2fixp(channel_value);
> +
> +	return drm_fixp_mul(color_channel_fp, lut->channel_value2index_ratio);
> +}
> +
> +/*
> + * This enum is related to the positions of the variables inside
> + * `struct drm_color_lut`, so the order of both needs to be the same.
> + */
> +enum lut_channel {
> +	LUT_RED = 0,
> +	LUT_GREEN,
> +	LUT_BLUE,
> +	LUT_RESERVED
> +};
> +
> +static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
> +				      enum lut_channel channel)
> +{
> +	s64 lut_index = get_lut_index(lut, channel_value);
> +
> +	/*
> +	 * This checks if `struct drm_color_lut` had any gap added by the compiler
> +	 * between the struct fields.
> +	 */
> +	static_assert(sizeof(struct drm_color_lut) == sizeof(__u16) * 4);
> +
> +	u16 *floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
> +	u16 *ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
> +
> +	u16 floor_channel_value = floor_lut_value[channel];
> +	u16 ceil_channel_value = ceil_lut_value[channel];
> +
> +	return lerp_u16(floor_channel_value, ceil_channel_value,
> +			lut_index & DRM_FIXED_DECIMAL_MASK);
> +}
> +
> +static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buffer *output_buffer)
> +{
> +	if (!crtc_state->gamma_lut.base)
> +		return;
> +
> +	if (!crtc_state->gamma_lut.lut_length)
> +		return;
> +
> +	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
> +		struct pixel_argb_u16 *pixel = &output_buffer->pixels[x];
> +
> +		pixel->r = apply_lut_to_channel_value(&crtc_state->gamma_lut, pixel->r, LUT_RED);
> +		pixel->g = apply_lut_to_channel_value(&crtc_state->gamma_lut, pixel->g, LUT_GREEN);
> +		pixel->b = apply_lut_to_channel_value(&crtc_state->gamma_lut, pixel->b, LUT_BLUE);
> +	}
> +}
> +
>  /**
>   * @wb_frame_info: The writeback frame buffer metadata
>   * @crtc_state: The crtc state
> @@ -128,6 +196,8 @@ static void blend(struct vkms_writeback_job *wb,
>  					    output_buffer);
>  		}
>  
> +		apply_lut(crtc_state, output_buffer);
> +
>  		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
>  
>  		if (wb)
> @@ -242,6 +312,22 @@ void vkms_composer_worker(struct work_struct *work)
>  	crtc_state->frame_start = 0;
>  	crtc_state->frame_end = 0;
>  	crtc_state->crc_pending = false;
> +
> +	if (crtc->state->gamma_lut) {
> +		s64 max_lut_index_fp;
> +		s64 u16_max_fp = drm_int2fixp(0xffff);
> +
> +		crtc_state->gamma_lut.base = (struct drm_color_lut *)crtc->state->gamma_lut->data;
> +		crtc_state->gamma_lut.lut_length =
> +			crtc->state->gamma_lut->length / sizeof(struct drm_color_lut);
> +		max_lut_index_fp = drm_int2fixp(crtc_state->gamma_lut.lut_length  - 1);
> +		crtc_state->gamma_lut.channel_value2index_ratio = drm_fixp_div(max_lut_index_fp,
> +									       u16_max_fp);
> +
> +	} else {
> +		crtc_state->gamma_lut.base = NULL;
> +	}
> +
>  	spin_unlock_irq(&out->composer_lock);
>  
>  	/*
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 515f6772b866..61e500b8c9da 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -290,6 +290,9 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  
>  	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
>  
> +	drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
> +	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
> +
>  	spin_lock_init(&vkms_out->lock);
>  	spin_lock_init(&vkms_out->composer_lock);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index e3c9c9571c8d..dd0af086e7fa 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -120,9 +120,27 @@ static const struct drm_driver vkms_driver = {
>  	.minor			= DRIVER_MINOR,
>  };
>  
> +static int vkms_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
> +{
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *new_crtc_state;
> +	int i;
> +
> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> +		if (!new_crtc_state->gamma_lut || !new_crtc_state->color_mgmt_changed)
> +			continue;
> +
> +		if (new_crtc_state->gamma_lut->length / sizeof(struct drm_color_lut *)
> +		    > VKMS_LUT_SIZE)
> +			return -EINVAL;
> +	}
> +
> +	return drm_atomic_helper_check(dev, state);
> +}
> +
>  static const struct drm_mode_config_funcs vkms_mode_funcs = {
>  	.fb_create = drm_gem_fb_create,
> -	.atomic_check = drm_atomic_helper_check,
> +	.atomic_check = vkms_atomic_check,
>  	.atomic_commit = drm_atomic_helper_commit,
>  };
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 5f1a0a44a78c..f16b5d7b81ef 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -23,6 +23,8 @@
>  
>  #define NUM_OVERLAY_PLANES 8
>  
> +#define VKMS_LUT_SIZE 256
> +
>  struct vkms_frame_info {
>  	struct drm_framebuffer *fb;
>  	struct drm_rect src, dst;
> @@ -65,6 +67,12 @@ struct vkms_plane {
>  	struct drm_plane base;
>  };
>  
> +struct vkms_color_lut {
> +	struct drm_color_lut *base;
> +	size_t lut_length;
> +	s64 channel_value2index_ratio;
> +};
> +
>  /**
>   * vkms_crtc_state - Driver specific CRTC state
>   * @base: base CRTC state
> @@ -80,6 +88,7 @@ struct vkms_crtc_state {
>  	/* stack of active planes for crc computation, should be in z order */
>  	struct vkms_plane_state **active_planes;
>  	struct vkms_writeback_job *active_writeback;
> +	struct vkms_color_lut gamma_lut;
>  
>  	/* below four are protected by vkms_output.composer_lock */
>  	bool crc_pending;


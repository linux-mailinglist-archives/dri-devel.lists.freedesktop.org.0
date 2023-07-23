Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1377975E50D
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jul 2023 23:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EDB10E0A7;
	Sun, 23 Jul 2023 21:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7E510E0A7
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jul 2023 21:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From
 :References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t0Is3M2u6cW6morbngtGEzD1LEPUvKNZlaQmjoa4F00=; b=mb/X8yNRNDegCib+BIKpVNXQ+v
 pgeK2NSO7U1IAo8DwYuz/Ur6N2pyH7NST908B11yky8PahtlpEZBprEE4CnBwOAfEEu0mm1qtHllU
 8waf3FxKkbm48HMaLZL7dV2uHhxsJ6EmFSnQxVHqlsKNA2RBjv9kWsh2BWE8posDs0CeGr6QJSY0g
 yCkAlf7tCsbCmx7kQZ1AX56sEeHr58j7ztqC0zEWr/tkp5MNtqgGcaAXhaowk2Y5DDoXICpzt5wXT
 KO14iT/Wh+uL75CWKYa76IP7W4ut6fRiaI5fqQ/Ii/PWJDEuMpODCP+4tm/ELOBEHFUKXpkIJKrnZ
 ppVBXm5Q==;
Received: from [187.36.235.191] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qNh1T-002iJL-5y; Sun, 23 Jul 2023 23:53:51 +0200
Message-ID: <7e367a84-92a9-db44-ca00-33c966242497@igalia.com>
Date: Sun, 23 Jul 2023 18:53:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20230723150132.130100-1-mcanal@igalia.com>
 <20230723210044.xwhbpxlyeu5wjphb@mail.igalia.com>
From: Maira Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2] drm/vkms: Implement all blend mode properties
In-Reply-To: <20230723210044.xwhbpxlyeu5wjphb@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Melissa,

On 7/23/23 18:00, Melissa Wen wrote:
> On 07/23, Maíra Canal wrote:
>> Following the DRM assumption, VKMS currently assumes that the alpha is
>> pre-multiplied. Moreover, it doesn't support the alpha property.
>>
>> So, first, implement the alpha property to VKMS and then, the blend
>> mode property. In order to support all possible supported modes,
>> change the pre_mul_blend_channel() function to check the plane blend
>> mode and apply the correct blend formula, following the DRM
>> convention, using the proper plane alpha value.
>>
>> Tested with igt@kms_plane_alpha_blend.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>
>> v1 -> v2: https://lore.kernel.org/dri-devel/20230428122751.24271-1-mcanal@igalia.com/T/
>>
>> * Rebased on top of drm-misc-next.
>>
>> ---
>>   drivers/gpu/drm/vkms/vkms_composer.c | 49 ++++++++++++++++++----------
>>   drivers/gpu/drm/vkms/vkms_drv.h      |  2 ++
>>   drivers/gpu/drm/vkms/vkms_plane.c    |  9 +++++
>>   3 files changed, 42 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index d170a8e89b95..68a476461824 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -12,33 +12,47 @@
>>
>>   #include "vkms_drv.h"
>>
>> -static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>> +static u16 blend_channel(struct vkms_frame_info *frame_info, u16 src, u16 dst, u16 alpha)
>>   {
>>   	u32 new_color;
>>
>> -	new_color = (src * 0xffff + dst * (0xffff - alpha));
>> +	switch (frame_info->pixel_blend_mode) {
>> +	case DRM_MODE_BLEND_PIXEL_NONE:
>> +		new_color = 0xffff * frame_info->alpha * src
>> +			+ (0xfffe0001 - 0xffff * frame_info->alpha) * dst;
>> +		break;
>> +	case DRM_MODE_BLEND_COVERAGE:
>> +		new_color = alpha * frame_info->alpha * src
>> +			+ (0xfffe0001 - alpha * frame_info->alpha) * dst;
>> +		break;
>> +	case DRM_MODE_BLEND_PREMULTI:
>> +	default:
>> +		new_color = 0xffff * frame_info->alpha * src
>> +			+ (0xfffe0001 - alpha * frame_info->alpha) * dst;
> 
> Hi Maíra,
> 
> First, thank you for keep working on this feature and sorry for feedback
> delay.
> 
> I didn't complete understand this 0xfffe0001 calculation. Could you
> describe a little more (adding a comment here) each formula that you are
> using here?

The idea here is the same as before, but now that we have two factors
multiplying src and dst (alpha and frame_info->alpha), so we need to 
divide by 0xffff * 0xffff = 0xfffe0001. This helps us not to lose
precision when dividing the alpha and frame_info->alpha values by
0xffff.

I'm using the formulas specified in the DRM documentation [1]:

"None": out.rgb = plane_alpha * fg.rgb + (1 - plane_alpha) * bg.rgb

"Pre-multiplied": out.rgb = plane_alpha * fg.rgb +
                             (1 - (plane_alpha * fg.alpha)) * bg.rgb

"Coverage": out.rgb = plane_alpha * fg.alpha * fg.rgb +
                       (1 - (plane_alpha * fg.alpha)) * bg.rgb

I can add some comments in the code to make it clear that 0xfffe0001 is
0xffff * 0xffff.

[1] https://docs.kernel.org/gpu/drm-kms.html#plane-composition-properties

> 
> Also, as we are changing pixels of both outputs that are part of the
> comparisons, but we just compare the CRC (not pixel by pixel). Did you
> verify a sample of the pixels resulted from this calculation to check if
> they make sense?
> 

I verified a sample of the resulting pixels while debugging the
implementation with the IGT tests. It looked okay to me, but let me know
if you find something suspecious.

> IIRC, we don't have a negative test for this property in
> kms_plane_alpha_blend. In this sense, did you verify if the test fail
> when setting a property value but using a different equation that not
> correspond to the pixel blend mode setup? Overall the change makes
> sense, but I tried some invalid scenarios and didn't get the expected
> result.

I was able to reproduce this failure as well. Maybe we need some
improviments on the IGT tests to make sure about the correctness of the
pixel blend mode. For this patch, I based myself on the correctness of
the formulas provided by the DRM documentation.

Would you need more IGT tests to approve this feature?

Best Regards,
- Maíra

> 
> Melissa
> 
>> +		break;
>> +	}
>>
>> -	return DIV_ROUND_CLOSEST(new_color, 0xffff);
>> +	return DIV_ROUND_CLOSEST(new_color, 0xfffe0001);
>>   }
>>
>>   /**
>> - * pre_mul_alpha_blend - alpha blending equation
>> + * alpha_blend - alpha blending equation
>>    * @frame_info: Source framebuffer's metadata
>>    * @stage_buffer: The line with the pixels from src_plane
>>    * @output_buffer: A line buffer that receives all the blends output
>>    *
>>    * Using the information from the `frame_info`, this blends only the
>>    * necessary pixels from the `stage_buffer` to the `output_buffer`
>> - * using premultiplied blend formula.
>> + * using the adequate blend formula depending on the plane blend mode
>> + * (see blend_channel()).
>>    *
>> - * The current DRM assumption is that pixel color values have been already
>> - * pre-multiplied with the alpha channel values. See more
>> - * drm_plane_create_blend_mode_property(). Also, this formula assumes a
>> - * completely opaque background.
>> + * By default, the current DRM assumption is that pixel color values have
>> + * been already pre-multiplied with the alpha channel values. See more
>> + * drm_plane_create_blend_mode_property().
>>    */
>> -static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
>> -				struct line_buffer *stage_buffer,
>> -				struct line_buffer *output_buffer)
>> +static void alpha_blend(struct vkms_frame_info *frame_info,
>> +			struct line_buffer *stage_buffer,
>> +			struct line_buffer *output_buffer)
>>   {
>>   	int x_dst = frame_info->dst.x1;
>>   	struct pixel_argb_u16 *out = output_buffer->pixels + x_dst;
>> @@ -48,9 +62,9 @@ static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
>>
>>   	for (int x = 0; x < x_limit; x++) {
>>   		out[x].a = (u16)0xffff;
>> -		out[x].r = pre_mul_blend_channel(in[x].r, out[x].r, in[x].a);
>> -		out[x].g = pre_mul_blend_channel(in[x].g, out[x].g, in[x].a);
>> -		out[x].b = pre_mul_blend_channel(in[x].b, out[x].b, in[x].a);
>> +		out[x].r = blend_channel(frame_info, in[x].r, out[x].r, in[x].a);
>> +		out[x].g = blend_channel(frame_info, in[x].g, out[x].g, in[x].a);
>> +		out[x].b = blend_channel(frame_info, in[x].b, out[x].b, in[x].a);
>>   	}
>>   }
>>
>> @@ -98,7 +112,7 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
>>    * @stage_buffer: The line with the pixels from plane being blend to the output
>>    * @row_size: The size, in bytes, of a single row
>>    *
>> - * This function blends the pixels (Using the `pre_mul_alpha_blend`)
>> + * This function blends the pixels (Using the `alpha_blend()`)
>>    * from all planes, calculates the crc32 of the output from the former step,
>>    * and, if necessary, convert and store the output to the writeback buffer.
>>    */
>> @@ -126,8 +140,7 @@ static void blend(struct vkms_writeback_job *wb,
>>   				continue;
>>
>>   			vkms_compose_row(stage_buffer, plane[i], y_pos);
>> -			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
>> -					    output_buffer);
>> +			alpha_blend(plane[i]->frame_info, stage_buffer, output_buffer);
>>   		}
>>
>>   		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
>> index d25e0aae91f2..20e2c520885e 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>> @@ -28,6 +28,8 @@ struct vkms_frame_info {
>>   	struct drm_rect src, dst;
>>   	struct drm_rect rotated;
>>   	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
>> +	u16 alpha;
>> +	u16 pixel_blend_mode;
>>   	unsigned int rotation;
>>   	unsigned int offset;
>>   	unsigned int pitch;
>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
>> index e5c625ab8e3e..891aa566acda 100644
>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
>> @@ -113,6 +113,8 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>>   	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
>>   	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
>>   	memcpy(&frame_info->rotated, &new_state->dst, sizeof(struct drm_rect));
>> +	frame_info->alpha = new_state->alpha;
>> +	frame_info->pixel_blend_mode = new_state->pixel_blend_mode;
>>   	frame_info->fb = fb;
>>   	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
>>   	drm_framebuffer_get(frame_info->fb);
>> @@ -212,6 +214,13 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>>
>>   	drm_plane_helper_add(&plane->base, &vkms_plane_helper_funcs);
>>
>> +	drm_plane_create_alpha_property(&plane->base);
>> +
>> +	drm_plane_create_blend_mode_property(&plane->base,
>> +					     BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>> +					     BIT(DRM_MODE_BLEND_PREMULTI)   |
>> +					     BIT(DRM_MODE_BLEND_COVERAGE));
>> +
>>   	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
>>   					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
>>
>> --
>> 2.41.0
>>

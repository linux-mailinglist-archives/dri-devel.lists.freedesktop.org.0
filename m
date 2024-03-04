Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4C08705CF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 16:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39A810E3BA;
	Mon,  4 Mar 2024 15:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="NF/JQE24";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0A010E756
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 15:39:23 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4TpNCt1pLPzDqD7;
 Mon,  4 Mar 2024 15:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709566762; bh=IuF3KpsYUrO8RcEt74LrQGVh7YFlbYp3gdosQ8XBzGo=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=NF/JQE24GFQKXiv+LvkBPpfY2AJxxdew1XxrmIPTtnOQ0AoWe316IJuW9Ff02RL1t
 KWI+qz1J4RlO3GVyBAm+od1wFvipNfxkzCDiPAgXmJmpFW4/driROui9/Us6ywzBUC
 J8i1pAA2Ve2pI1o3y0LWQTLb93+Km2RvggldKiao=
X-Riseup-User-ID: 9D8945CDF63164A431B251F7C9D4F2C6FB26EA9B77DC23CA88E50E3583F36153
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4TpNCl69xCzFvSP;
 Mon,  4 Mar 2024 15:39:15 +0000 (UTC)
Message-ID: <fde6b1d5-56c9-43d0-9ccc-87683b700734@riseup.net>
Date: Mon, 4 Mar 2024 12:39:12 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 6/9] drm/vkms: Add YUV support
To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-6-aa6be2827bb7@bootlin.com>
 <20240226141916.1627bbbd.pekka.paalanen@collabora.com>
 <Zd35c_CJbhY46TjQ@localhost.localdomain>
 <b23da076-0bfb-48b2-9386-383a6dec1868@riseup.net>
 <8fc07f0f-f14d-4878-9884-2bc4b4c6f426@riseup.net>
 <20240229141238.51891cad.pekka.paalanen@collabora.com>
 <ZeXoo4DJxlzhuK4W@localhost.localdomain>
Content-Language: en-US
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <ZeXoo4DJxlzhuK4W@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04/03/24 12:28, Louis Chauvet wrote:
> Le 29/02/24 - 14:12, Pekka Paalanen a écrit :
>> On Wed, 28 Feb 2024 22:52:09 -0300
>> Arthur Grillo <arthurgrillo@riseup.net> wrote:
>>
>>> On 27/02/24 17:01, Arthur Grillo wrote:
>>>>
>>>>
>>>> On 27/02/24 12:02, Louis Chauvet wrote:  
>>>>> Hi Pekka,
>>>>>
>>>>> For all the comment related to the conversion part, maybe Arthur have an 
>>>>> opinion on it, I took his patch as a "black box" (I did not want to 
>>>>> break (and debug) it).
>>>>>
>>>>> Le 26/02/24 - 14:19, Pekka Paalanen a écrit :  
>>>>>> On Fri, 23 Feb 2024 12:37:26 +0100
>>>>>> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
>>>>>>  
>>>>>>> From: Arthur Grillo <arthurgrillo@riseup.net>
>>>>>>>
>>>>>>> Add support to the YUV formats bellow:
>>>>>>>
>>>>>>> - NV12
>>>>>>> - NV16
>>>>>>> - NV24
>>>>>>> - NV21
>>>>>>> - NV61
>>>>>>> - NV42
>>>>>>> - YUV420
>>>>>>> - YUV422
>>>>>>> - YUV444
>>>>>>> - YVU420
>>>>>>> - YVU422
>>>>>>> - YVU444
>>>>>>>
>>>>>>> The conversion matrices of each encoding and range were obtained by
>>>>>>> rounding the values of the original conversion matrices multiplied by
>>>>>>> 2^8. This is done to avoid the use of fixed point operations.
>>>>>>>
>>>>>>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
>>>>>>> [Louis Chauvet: Adapted Arthur's work and implemented the read_line_t
>>>>>>> callbacks for yuv formats]
>>>>>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/vkms/vkms_composer.c |   2 +-
>>>>>>>  drivers/gpu/drm/vkms/vkms_drv.h      |   6 +-
>>>>>>>  drivers/gpu/drm/vkms/vkms_formats.c  | 289 +++++++++++++++++++++++++++++++++--
>>>>>>>  drivers/gpu/drm/vkms/vkms_formats.h  |   4 +
>>>>>>>  drivers/gpu/drm/vkms/vkms_plane.c    |  14 +-
>>>>>>>  5 files changed, 295 insertions(+), 20 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>>>>>>> index e555bf9c1aee..54fc5161d565 100644
>>>>>>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>>>>>>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>>>>>>> @@ -312,7 +312,7 @@ static void blend(struct vkms_writeback_job *wb,
>>>>>>>  			 * buffer [1]
>>>>>>>  			 */
>>>>>>>  			current_plane->pixel_read_line(
>>>>>>> -				current_plane->frame_info,
>>>>>>> +				current_plane,
>>>>>>>  				x_start,
>>>>>>>  				y_start,
>>>>>>>  				direction,
>>>>>>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
>>>>>>> index ccc5be009f15..a4f6456cb971 100644
>>>>>>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>>>>>>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>>>>>>> @@ -75,6 +75,8 @@ enum pixel_read_direction {
>>>>>>>  	READ_RIGHT
>>>>>>>  };
>>>>>>>  
>>>>>>> +struct vkms_plane_state;
>>>>>>> +
>>>>>>>  /**
>>>>>>>  <<<<<<< HEAD
>>>>>>>   * typedef pixel_read_line_t - These functions are used to read a pixel line in the source frame,
>>>>>>> @@ -87,8 +89,8 @@ enum pixel_read_direction {
>>>>>>>   * @out_pixel: Pointer where to write the pixel value. Pixels will be written between x_start and
>>>>>>>   *  x_end.
>>>>>>>   */
>>>>>>> -typedef void (*pixel_read_line_t)(struct vkms_frame_info *frame_info, int x_start, int y_start, enum
>>>>>>> -	pixel_read_direction direction, int count, struct pixel_argb_u16 out_pixel[]);
>>>>>>> +typedef void (*pixel_read_line_t)(struct vkms_plane_state *frame_info, int x_start, int y_start,
>>>>>>> +	enum pixel_read_direction direction, int count, struct pixel_argb_u16 out_pixel[]);  
>>>>>>
>>>>>> This is the second or third time in this one series changing this type.
>>>>>> Could you not do the change once, in its own patch if possible?  
>>>>>
>>>>> Sorry, this is not a change here, but a wrong formatting (missed when 
>>>>> rebasing).
>>>>>
>>>>> Do you think that it make sense to re-order my patches and put this 
>>>>> typedef at the end? This way it is never updated.
>>
>> I'm not sure, I haven't checked how it would change your patches. The
>> intermediate changes might get a lot uglier?
>>
>> Just try to fold changes so that you don't need to change something
>> twice over the series unless there is a good reason to. "How hard would
>> it be to review this?" is my measure stick.
> 
> It will not be uglier, it was just the order I did things. I first cleaned 
> the code and created this typedef (PATCHv2 4/9), and then rewrote the 
> composition, for which I had to change the typedef.
> 
> I also wanted to make my series easy to understand and make clear what is 
> my "main contribution" and what are "quality stuff, not related to my 
> contribution":
> - Prepare things (document existing state, format, typedef)
> - Big change (and update related doc, typedef)
> - Rebase some other stuff on my big change (YUV)
> 
> So yes, some parts are changed twice in preparation step and the "big 
> change".
> 
>>
>>>>>  
>>>>>>>  
>>>>>>>  /**
>>>>>>>   * vkms_plane_state - Driver specific plane state
>>>>>>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
>>>>>>> index 46daea6d3ee9..515c80866a58 100644
>>>>>>> --- a/drivers/gpu/drm/vkms/vkms_formats.c
>>>>>>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
>>>>>>> @@ -33,7 +33,8 @@ static size_t packed_pixels_offset(const struct vkms_frame_info *frame_info, int
>>>>>>>  	 */
>>>>>>>  	return fb->offsets[plane_index] +
>>>>>>>  	       (y / drm_format_info_block_width(format, plane_index)) * fb->pitches[plane_index] +
>>>>>>> -	       (x / drm_format_info_block_height(format, plane_index)) * format->char_per_block[plane_index];
>>>>>>> +	       (x / drm_format_info_block_height(format, plane_index)) *
>>>>>>> +	       format->char_per_block[plane_index];  
>>>>>>
>>>>>> Shouldn't this be in the patch that added this code in the first place?  
>>>>>
>>>>> Same as above, a wrong formatting, I will remove this change and keep 
>>>>> everything on one line (even if it's more than 100 chars, it is easier to 
>>>>> read).
>>
>> Personally I agree that readability is more important than strict line
>> length limits. I'm not sure how the kernel rolls there.
>>
>>>>>  
>>>>>>>  }
>>>>>>>  
>>>>>>>  /**
>>>>>>> @@ -84,6 +85,32 @@ static int get_step_1x1(struct drm_framebuffer *fb, enum pixel_read_direction di
>>>>>>>  	}
>>>>>>>  }
>>>>>>>  
>>>>>>> +/**
>>>>>>> + * get_subsampling() - Get the subsampling value on a specific direction  
>>>>>>
>>>>>> subsampling divisor  
>>>>>
>>>>> Thanks for this precision.
>>>>>  
>>>>>>> + */
>>>>>>> +static int get_subsampling(const struct drm_format_info *format,
>>>>>>> +			   enum pixel_read_direction direction)
>>>>>>> +{
>>>>>>> +	if (direction == READ_LEFT || direction == READ_RIGHT)
>>>>>>> +		return format->hsub;
>>>>>>> +	else if (direction == READ_DOWN || direction == READ_UP)
>>>>>>> +		return format->vsub;
>>>>>>> +	return 1;  
>>>>>>
>>>>>> In this and the below function, personally I'd prefer switch-case, with
>>>>>> a cannot-happen-scream after the switch, so the compiler can warn about
>>>>>> unhandled enum values.  
>>>>>
>>>>> As for the previous patch, I did not know about this compiler feature, 
>>>>> thanks!
>>>>>  
>>>>>>> +}
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * get_subsampling_offset() - Get the subsampling offset to use when incrementing the pixel counter
>>>>>>> + */
>>>>>>> +static int get_subsampling_offset(const struct drm_format_info *format,
>>>>>>> +				  enum pixel_read_direction direction, int x_start, int y_start)  
>>>>>>
>>>>>> 'start' values as "increments" for a pixel counter? Is something
>>>>>> misnamed here?
>>>>>>
>>>>>> Is it an increment or an offset?  
>>>>>
>>>>> I don't really know how to name the function. I'm open to suggestions
>>>>> x_start and y_start are really the coordinate of the starting reading point.
>>
>> I looks like it's an offset, so "offset" and "start" are good words.
>> Then the only misleading piece is the doc:
>>
>> 	"Get the subsampling offset to use when incrementing the pixel counter"
>>
>> This sounds like the offset is used when incrementing a counter, that
>> is, counter is increment by offset each time. That's my problem with
>> this.
>>
>> Fix just the doc, and it's good, I think.
>>
>>>>>
>>>>> To explain what it does:
>>>>>
>>>>> When using subsampling, you have to read the next pixel of planes[1..4] 
>>>>> not at the same "speed" as plane[0]. But I can't only rely on 
>>>>> "read_pixel_count % subsampling == 0", because it means that the pixel 
>>>>> incrementation on planes[1..4] may not be aligned with the buffer (if 
>>>>> hsub=2 and the start pixel is 1, I need to increment planes[1..4] only 
>>>>> for x=2,4,6... not 1,3,5...).
>>>>>
>>>>> A way to ensure this is to add an "offset" to count, which ensure that the 
>>>>> count % subsampling == 0 on the correct pixel.
>>
>> Yes, I think I did get that feeling from the code eventually somehow,
>> but it wouldn't hurt to explain it in the comment.
>>
>> "An offset for keeping the chroma siting consistent regardless of
>> x_start and y_start" maybe?
> 
> It is better yes, thanks!
> 
>>>>>
>>>>> I made an error, the switch case must be (as count is always counting up, 
>>>>> for "inverted" reading direction a negative number ensure that 
>>>>> %subsampling == 0 on the correct pixel):
>>>>>
>>>>> 	switch (direction) {
>>>>> 	case READ_UP:
>>>>> 		return -y_start;
>>>>> 	case READ_DOWN:
>>>>> 		return y_start;
>>>>> 	case READ_LEFT:
>>>>> 		return -x_start;
>>>>> 	case READ_RIGHT:
>>>>> 		return x_start;
>>>>> 	}
>>
>> Yes, the inverted reading directions are different indeed. I did not
>> think through if this works also for sub-sampling divisors > 2 which I
>> don't think are ever used.
> 
> I choosen those values because they should work with any sub-sampling 
> divisor.
> 
> hsub/vsub = 4 is used with DRM_FORMAT_YUV410/YVU410/YUV411/YVU411.
> 
>>
>> Does IGT find this mistake? If not, maybe IGT should be extended.
> 
> No, for two reasons:
> - The original version works fine for NV12/16/24 and YUV with *sub <= 2
>   (x+n%2 == x-n%2). It only breaks for *sub > 2.
> - YUV410/... are not supported by VKMS
> - IGT does not test different colors for rotations/translations (at least
>   for the tests I tried). I will see if it's possible to add things in 
>   kms_rotation_crc/kms_cursor_crc to test more colors format (at least 
>   one RGB and one YUV).
>  
>>>>>  
>>>>>>> +{
>>>>>>> +	if (direction == READ_RIGHT || direction == READ_LEFT)
>>>>>>> +		return x_start;
>>>>>>> +	else if (direction == READ_DOWN || direction == READ_UP)
>>>>>>> +		return y_start;
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>>> +  
>>>>>
>>>>> [...]
>>>>>  
>>>>>>> +static void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16, const struct pixel_yuv_u8 *yuv_u8,
>>>>>>> +			       enum drm_color_encoding encoding, enum drm_color_range range)
>>>>>>> +{
>>>>>>> +	static const s16 bt601_full[3][3] = {
>>>>>>> +		{ 256, 0,   359 },
>>>>>>> +		{ 256, -88, -183 },
>>>>>>> +		{ 256, 454, 0 },
>>>>>>> +	};  
>>>>>
>>>>> [...]
>>>>>  
>>>>>>> +
>>>>>>> +	u8 r = 0;
>>>>>>> +	u8 g = 0;
>>>>>>> +	u8 b = 0;
>>>>>>> +	bool full = range == DRM_COLOR_YCBCR_FULL_RANGE;
>>>>>>> +	unsigned int y_offset = full ? 0 : 16;
>>>>>>> +
>>>>>>> +	switch (encoding) {
>>>>>>> +	case DRM_COLOR_YCBCR_BT601:
>>>>>>> +		ycbcr2rgb(full ? bt601_full : bt601,  
>>>>>>
>>>>>> Doing all these conditional again pixel by pixel is probably
>>>>>> inefficient. Just like with the line reading functions, you could pick
>>>>>> the matrix in advance.  
>>>>>
>>>>> I don't think the performance impact is huge (it's only a pair of if), but 
>>>>> yes, it's an easy optimization. 
>>>>>
>>>>> I will create a conversion_matrix structure:
>>>>>
>>>>> 	struct conversion_matrix {
>>>>> 		s16 matrix[3][3];
>>>>> 		u16 y_offset;
>>>>> 	}
>>
>> When defining such a struct type, it would be good to document the
>> matrix layout (which one is row, which one is column), and what the s16
>> mean (fixed point?).
> 
> Ack
> 
>> Try to not mix signed and unsigned types, too. The C implicit type
>> promotion rules can be surprising. Just make everything signed while
>> computing, and convert to/from unsigned only for storage.
> 
> Ack, I will change to signed type.
> 
>>>>>
>>>>> I will create a `get_conversion_matrix_to_argb_u16` function to get this 
>>>>> structure from a format+encoding+range.
>>>>>
>>>>> I will also add a field `conversion_matrix` in struct vkms_plane_state to 
>>>>> get this matrix only once per plane setup.
>>
>> Alright. Let's see how that works.
>>
>>>>>
>>>>>  
>>>>>>> +			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
>>>>>>> +		break;
>>>>>>> +	case DRM_COLOR_YCBCR_BT709:
>>>>>>> +		ycbcr2rgb(full ? rec709_full : rec709,
>>>>>>> +			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
>>>>>>> +		break;
>>>>>>> +	case DRM_COLOR_YCBCR_BT2020:
>>>>>>> +		ycbcr2rgb(full ? bt2020_full : bt2020,
>>>>>>> +			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
>>>>>>> +		break;
>>>>>>> +	default:
>>>>>>> +		pr_warn_once("Not supported color encoding\n");
>>>>>>> +		break;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	argb_u16->r = r * 257;
>>>>>>> +	argb_u16->g = g * 257;
>>>>>>> +	argb_u16->b = b * 257;  
>>>>>>
>>>>>> I wonder. Using 8-bit fixed point precision seems quite coarse for
>>>>>> 8-bit pixel formats, and it's going to be insufficient for higher bit
>>>>>> depths. Was supporting e.g. 10-bit YUV considered? There is even
>>>>>> deeper, too, like DRM_FORMAT_P016.  
>>>>>
>>>>> It's a good point, as I explained above, I took the conversion part as a 
>>>>> "black box" to avoid breaking (and debugging) stuff. I think it's easy to 
>>>>> switch to s32 bits matrix with 16.16 bits (or anything with more than 16 bits in 
>>>>> the float part).
>>>>>
>>>>> Maybe Arthur have an opinion on this?  
>>>>
>>>> Yeah, I too don't see why not we could do that. The 8-bit precision was
>>>> sufficient for those formats, but as well noted by Pekka this could be a
>>>> problem for higher bit depths. I just need to make my terrible python
>>>> script spit those values XD.  
>>>
>>> Finally, I got it working with 32-bit precision.
>>>
>>> I basically threw all my untrusted python code away, and started using
>>> the colour python framework suggested by Sebastian[1]. After knowing the
>>> right values (and staring at numbers for hours), I found that with a
>>> little bit of rounding, the conversion works.
>>>
>>> Also, while at it, I changed the name rec709 to bt709 to follow the
>>> pattern and added "_full" to the full ranges matrices.
>>>
>>> While using the library, I noticed that the red component is wrong on
>>> the color red in one test case.
>>>
>>> [1]: https://lore.kernel.org/all/20240115150600.GC160656@toolbox/
>>
>> That all sounds good. I wish the kernel code contained comments
>> explaining how exactly you computed those matrices with python/colour.
>> If the python snippets are not too long, including them verbatim as
>> code comments would be really nice for both reviewers and posterity.
>>
>> The same for the VKMS unit tests, too, how you got the expected result
>> values.
> 
> I edited the YUV support to have those s64 values.
> 
> @arthur, I will submit a v4 with this:
> - matrix selection in plane_atomic_update (so it's selected only once)
> - s64 numbers for matrix
> - avoiding multiple loop implementation by switching matrix columns

This looks good to me.

> 
> Regarding the YUV part, I don't feel confortable adressing Pekka's 
> comments, would you mind doing it?

I'm already doing that, how do you want me to send those changes? I reply to
your series, like a did before?

Best Regards,
~Arthur Grillo

> 
> Kind regards,
> Louis Chauvet
> 
> [...]
> 

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C5F86BE8D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 02:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8C610E360;
	Thu, 29 Feb 2024 01:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="m8e3tNSz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EA210E403
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 01:52:19 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4TlZ3Q2bSCz9v3h;
 Thu, 29 Feb 2024 01:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709171538; bh=8Z53E8KQGcsZNKGI8YNr/o9l8s32OQUI3YC17G3LwOg=;
 h=Date:Subject:From:To:References:In-Reply-To:From;
 b=m8e3tNSzWvDW5JFRrlEKguFmxTbJbddXFPqHwYJJLE91QIJ0tqkcDSWWDu45A5JXK
 6ak6ujqLhYEnDrqv8a4s4kPHmRlHj0Yk/N1MnU03CBie6Jzx+2Mt8QB83eIKn/h8WV
 +HobGg4ZimlwO1GpAE81QnUMGEnTDLaUOL4QQTVo=
X-Riseup-User-ID: 4386055CA83A94561CA41D910187D6C5CFB9D4537381B596747E479F7327E165
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4TlZ3J2hc7zJq71;
 Thu, 29 Feb 2024 01:52:12 +0000 (UTC)
Message-ID: <8fc07f0f-f14d-4878-9884-2bc4b4c6f426@riseup.net>
Date: Wed, 28 Feb 2024 22:52:09 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 6/9] drm/vkms: Add YUV support
Content-Language: en-US
From: Arthur Grillo <arthurgrillo@riseup.net>
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
In-Reply-To: <b23da076-0bfb-48b2-9386-383a6dec1868@riseup.net>
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



On 27/02/24 17:01, Arthur Grillo wrote:
> 
> 
> On 27/02/24 12:02, Louis Chauvet wrote:
>> Hi Pekka,
>>
>> For all the comment related to the conversion part, maybe Arthur have an 
>> opinion on it, I took his patch as a "black box" (I did not want to 
>> break (and debug) it).
>>
>> Le 26/02/24 - 14:19, Pekka Paalanen a écrit :
>>> On Fri, 23 Feb 2024 12:37:26 +0100
>>> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
>>>
>>>> From: Arthur Grillo <arthurgrillo@riseup.net>
>>>>
>>>> Add support to the YUV formats bellow:
>>>>
>>>> - NV12
>>>> - NV16
>>>> - NV24
>>>> - NV21
>>>> - NV61
>>>> - NV42
>>>> - YUV420
>>>> - YUV422
>>>> - YUV444
>>>> - YVU420
>>>> - YVU422
>>>> - YVU444
>>>>
>>>> The conversion matrices of each encoding and range were obtained by
>>>> rounding the values of the original conversion matrices multiplied by
>>>> 2^8. This is done to avoid the use of fixed point operations.
>>>>
>>>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
>>>> [Louis Chauvet: Adapted Arthur's work and implemented the read_line_t
>>>> callbacks for yuv formats]
>>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>> ---
>>>>  drivers/gpu/drm/vkms/vkms_composer.c |   2 +-
>>>>  drivers/gpu/drm/vkms/vkms_drv.h      |   6 +-
>>>>  drivers/gpu/drm/vkms/vkms_formats.c  | 289 +++++++++++++++++++++++++++++++++--
>>>>  drivers/gpu/drm/vkms/vkms_formats.h  |   4 +
>>>>  drivers/gpu/drm/vkms/vkms_plane.c    |  14 +-
>>>>  5 files changed, 295 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>>>> index e555bf9c1aee..54fc5161d565 100644
>>>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>>>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>>>> @@ -312,7 +312,7 @@ static void blend(struct vkms_writeback_job *wb,
>>>>  			 * buffer [1]
>>>>  			 */
>>>>  			current_plane->pixel_read_line(
>>>> -				current_plane->frame_info,
>>>> +				current_plane,
>>>>  				x_start,
>>>>  				y_start,
>>>>  				direction,
>>>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
>>>> index ccc5be009f15..a4f6456cb971 100644
>>>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>>>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>>>> @@ -75,6 +75,8 @@ enum pixel_read_direction {
>>>>  	READ_RIGHT
>>>>  };
>>>>  
>>>> +struct vkms_plane_state;
>>>> +
>>>>  /**
>>>>  <<<<<<< HEAD
>>>>   * typedef pixel_read_line_t - These functions are used to read a pixel line in the source frame,
>>>> @@ -87,8 +89,8 @@ enum pixel_read_direction {
>>>>   * @out_pixel: Pointer where to write the pixel value. Pixels will be written between x_start and
>>>>   *  x_end.
>>>>   */
>>>> -typedef void (*pixel_read_line_t)(struct vkms_frame_info *frame_info, int x_start, int y_start, enum
>>>> -	pixel_read_direction direction, int count, struct pixel_argb_u16 out_pixel[]);
>>>> +typedef void (*pixel_read_line_t)(struct vkms_plane_state *frame_info, int x_start, int y_start,
>>>> +	enum pixel_read_direction direction, int count, struct pixel_argb_u16 out_pixel[]);
>>>
>>> This is the second or third time in this one series changing this type.
>>> Could you not do the change once, in its own patch if possible?
>>
>> Sorry, this is not a change here, but a wrong formatting (missed when 
>> rebasing).
>>
>> Do you think that it make sense to re-order my patches and put this 
>> typedef at the end? This way it is never updated.
>>
>>>>  
>>>>  /**
>>>>   * vkms_plane_state - Driver specific plane state
>>>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
>>>> index 46daea6d3ee9..515c80866a58 100644
>>>> --- a/drivers/gpu/drm/vkms/vkms_formats.c
>>>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
>>>> @@ -33,7 +33,8 @@ static size_t packed_pixels_offset(const struct vkms_frame_info *frame_info, int
>>>>  	 */
>>>>  	return fb->offsets[plane_index] +
>>>>  	       (y / drm_format_info_block_width(format, plane_index)) * fb->pitches[plane_index] +
>>>> -	       (x / drm_format_info_block_height(format, plane_index)) * format->char_per_block[plane_index];
>>>> +	       (x / drm_format_info_block_height(format, plane_index)) *
>>>> +	       format->char_per_block[plane_index];
>>>
>>> Shouldn't this be in the patch that added this code in the first place?
>>
>> Same as above, a wrong formatting, I will remove this change and keep 
>> everything on one line (even if it's more than 100 chars, it is easier to 
>> read).
>>
>>>>  }
>>>>  
>>>>  /**
>>>> @@ -84,6 +85,32 @@ static int get_step_1x1(struct drm_framebuffer *fb, enum pixel_read_direction di
>>>>  	}
>>>>  }
>>>>  
>>>> +/**
>>>> + * get_subsampling() - Get the subsampling value on a specific direction
>>>
>>> subsampling divisor
>>
>> Thanks for this precision.
>>
>>>> + */
>>>> +static int get_subsampling(const struct drm_format_info *format,
>>>> +			   enum pixel_read_direction direction)
>>>> +{
>>>> +	if (direction == READ_LEFT || direction == READ_RIGHT)
>>>> +		return format->hsub;
>>>> +	else if (direction == READ_DOWN || direction == READ_UP)
>>>> +		return format->vsub;
>>>> +	return 1;
>>>
>>> In this and the below function, personally I'd prefer switch-case, with
>>> a cannot-happen-scream after the switch, so the compiler can warn about
>>> unhandled enum values.
>>
>> As for the previous patch, I did not know about this compiler feature, 
>> thanks!
>>
>>>> +}
>>>> +
>>>> +/**
>>>> + * get_subsampling_offset() - Get the subsampling offset to use when incrementing the pixel counter
>>>> + */
>>>> +static int get_subsampling_offset(const struct drm_format_info *format,
>>>> +				  enum pixel_read_direction direction, int x_start, int y_start)
>>>
>>> 'start' values as "increments" for a pixel counter? Is something
>>> misnamed here?
>>>
>>> Is it an increment or an offset?
>>
>> I don't really know how to name the function. I'm open to suggestions
>> x_start and y_start are really the coordinate of the starting reading point.
>>
>> To explain what it does:
>>
>> When using subsampling, you have to read the next pixel of planes[1..4] 
>> not at the same "speed" as plane[0]. But I can't only rely on 
>> "read_pixel_count % subsampling == 0", because it means that the pixel 
>> incrementation on planes[1..4] may not be aligned with the buffer (if 
>> hsub=2 and the start pixel is 1, I need to increment planes[1..4] only 
>> for x=2,4,6... not 1,3,5...).
>>
>> A way to ensure this is to add an "offset" to count, which ensure that the 
>> count % subsampling == 0 on the correct pixel.
>>
>> I made an error, the switch case must be (as count is always counting up, 
>> for "inverted" reading direction a negative number ensure that 
>> %subsampling == 0 on the correct pixel):
>>
>> 	switch (direction) {
>> 	case READ_UP:
>> 		return -y_start;
>> 	case READ_DOWN:
>> 		return y_start;
>> 	case READ_LEFT:
>> 		return -x_start;
>> 	case READ_RIGHT:
>> 		return x_start;
>> 	}
>>
>>>> +{
>>>> +	if (direction == READ_RIGHT || direction == READ_LEFT)
>>>> +		return x_start;
>>>> +	else if (direction == READ_DOWN || direction == READ_UP)
>>>> +		return y_start;
>>>> +	return 0;
>>>> +}
>>>> +
>>
>> [...]
>>
>>>> +static void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16, const struct pixel_yuv_u8 *yuv_u8,
>>>> +			       enum drm_color_encoding encoding, enum drm_color_range range)
>>>> +{
>>>> +	static const s16 bt601_full[3][3] = {
>>>> +		{ 256, 0,   359 },
>>>> +		{ 256, -88, -183 },
>>>> +		{ 256, 454, 0 },
>>>> +	};
>>
>> [...]
>>
>>>> +
>>>> +	u8 r = 0;
>>>> +	u8 g = 0;
>>>> +	u8 b = 0;
>>>> +	bool full = range == DRM_COLOR_YCBCR_FULL_RANGE;
>>>> +	unsigned int y_offset = full ? 0 : 16;
>>>> +
>>>> +	switch (encoding) {
>>>> +	case DRM_COLOR_YCBCR_BT601:
>>>> +		ycbcr2rgb(full ? bt601_full : bt601,
>>>
>>> Doing all these conditional again pixel by pixel is probably
>>> inefficient. Just like with the line reading functions, you could pick
>>> the matrix in advance.
>>
>> I don't think the performance impact is huge (it's only a pair of if), but 
>> yes, it's an easy optimization. 
>>
>> I will create a conversion_matrix structure:
>>
>> 	struct conversion_matrix {
>> 		s16 matrix[3][3];
>> 		u16 y_offset;
>> 	}
>>
>> I will create a `get_conversion_matrix_to_argb_u16` function to get this 
>> structure from a format+encoding+range.
>>
>> I will also add a field `conversion_matrix` in struct vkms_plane_state to 
>> get this matrix only once per plane setup.
>>
>>
>>>> +			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
>>>> +		break;
>>>> +	case DRM_COLOR_YCBCR_BT709:
>>>> +		ycbcr2rgb(full ? rec709_full : rec709,
>>>> +			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
>>>> +		break;
>>>> +	case DRM_COLOR_YCBCR_BT2020:
>>>> +		ycbcr2rgb(full ? bt2020_full : bt2020,
>>>> +			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
>>>> +		break;
>>>> +	default:
>>>> +		pr_warn_once("Not supported color encoding\n");
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	argb_u16->r = r * 257;
>>>> +	argb_u16->g = g * 257;
>>>> +	argb_u16->b = b * 257;
>>>
>>> I wonder. Using 8-bit fixed point precision seems quite coarse for
>>> 8-bit pixel formats, and it's going to be insufficient for higher bit
>>> depths. Was supporting e.g. 10-bit YUV considered? There is even
>>> deeper, too, like DRM_FORMAT_P016.
>>
>> It's a good point, as I explained above, I took the conversion part as a 
>> "black box" to avoid breaking (and debugging) stuff. I think it's easy to 
>> switch to s32 bits matrix with 16.16 bits (or anything with more than 16 bits in 
>> the float part).
>>
>> Maybe Arthur have an opinion on this?
> 
> Yeah, I too don't see why not we could do that. The 8-bit precision was
> sufficient for those formats, but as well noted by Pekka this could be a
> problem for higher bit depths. I just need to make my terrible python
> script spit those values XD.

Finally, I got it working with 32-bit precision.

I basically threw all my untrusted python code away, and started using
the colour python framework suggested by Sebastian[1]. After knowing the
right values (and staring at numbers for hours), I found that with a
little bit of rounding, the conversion works.

Also, while at it, I changed the name rec709 to bt709 to follow the
pattern and added "_full" to the full ranges matrices.

While using the library, I noticed that the red component is wrong on
the color red in one test case.

[1]: https://lore.kernel.org/all/20240115150600.GC160656@toolbox/

Best Regards,
~Arthur Grillo

---

diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
index f66584549827..4cee3c2d8d84 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_format_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
@@ -59,7 +59,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 			{"white", {0xff, 0x80, 0x80}, {0x0000, 0xffff, 0xffff, 0xffff}},
 			{"gray",  {0x80, 0x80, 0x80}, {0x0000, 0x8000, 0x8000, 0x8000}},
 			{"black", {0x00, 0x80, 0x80}, {0x0000, 0x0000, 0x0000, 0x0000}},
-			{"red",   {0x35, 0x63, 0xff}, {0x0000, 0xffff, 0x0000, 0x0000}},
+			{"red",   {0x36, 0x63, 0xff}, {0x0000, 0xffff, 0x0000, 0x0000}},
 			{"green", {0xb6, 0x1e, 0x0c}, {0x0000, 0x0000, 0xffff, 0x0000}},
 			{"blue",  {0x12, 0xff, 0x74}, {0x0000, 0x0000, 0x0000, 0xffff}},
 		},
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index e06bbd7c0a67..043f23dbf80d 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -121,10 +121,12 @@ static void RGB565_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel
 	out_pixel->b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
 }
 
-static void ycbcr2rgb(const s16 m[3][3], u8 y, u8 cb, u8 cr, u8 y_offset, u8 *r, u8 *g, u8 *b)
+#define BIT_DEPTH 32
+
+static void ycbcr2rgb(const s64 m[3][3], u8 y, u8 cb, u8 cr, u8 y_offset, u8 *r, u8 *g, u8 *b)
 {
-	s32 y_16, cb_16, cr_16;
-	s32 r_16, g_16, b_16;
+	s64 y_16, cb_16, cr_16;
+	s64 r_16, g_16, b_16;
 
 	y_16 =  y - y_offset;
 	cb_16 = cb - 128;
@@ -134,9 +136,18 @@ static void ycbcr2rgb(const s16 m[3][3], u8 y, u8 cb, u8 cr, u8 y_offset, u8 *r,
 	g_16 = m[1][0] * y_16 + m[1][1] * cb_16 + m[1][2] * cr_16;
 	b_16 = m[2][0] * y_16 + m[2][1] * cb_16 + m[2][2] * cr_16;
 
-	*r = clamp(r_16, 0, 0xffff) >> 8;
-	*g = clamp(g_16, 0, 0xffff) >> 8;
-	*b = clamp(b_16, 0, 0xffff) >> 8;
+	// rounding the values
+	r_16 = r_16 + (1LL << (BIT_DEPTH - 4));
+	g_16 = g_16 + (1LL << (BIT_DEPTH - 4));
+	b_16 = b_16 + (1LL << (BIT_DEPTH - 4));
+
+	r_16 = clamp(r_16, 0, (1LL << (BIT_DEPTH + 8)) - 1);
+	g_16 = clamp(g_16, 0, (1LL << (BIT_DEPTH + 8)) - 1);
+	b_16 = clamp(b_16, 0, (1LL << (BIT_DEPTH + 8)) - 1);
+
+	*r = r_16 >> BIT_DEPTH;
+	*g = g_16 >> BIT_DEPTH;
+	*b = b_16 >> BIT_DEPTH;
 }
 
 VISIBLE_IF_KUNIT void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16,
@@ -144,35 +155,40 @@ VISIBLE_IF_KUNIT void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16,
 					 enum drm_color_encoding encoding,
 					 enum drm_color_range range)
 {
-	static const s16 bt601_full[3][3] = {
-		{256,   0,  359},
-		{256, -88, -183},
-		{256, 454,    0},
+	static const s64 bt601_full[3][3] = {
+		{4294967296, 0, 6021544149},
+		{4294967296, -1478054095, -3067191994},
+		{4294967296, 7610682049, 0},
 	};
-	static const s16 bt601[3][3] = {
-		{298,    0,  409},
-		{298, -100, -208},
-		{298,  516,    0},
+
+	static const s64 bt601_limited[3][3] = {
+		{5020601039, 0, 6881764740},
+		{5020601039, -1689204679, -3505362278},
+		{5020601039, 8697922339, 0},
 	};
-	static const s16 rec709_full[3][3] = {
-		{256,   0,  408},
-		{256, -48, -120},
-		{256, 476,   0 },
+
+	static const s64 bt709_full[3][3] = {
+		{4294967296, 0, 6763714498},
+		{4294967296, -804551626, -2010578443},
+		{4294967296, 7969741314, 0},
 	};
-	static const s16 rec709[3][3] = {
-		{298,   0,  459},
-		{298, -55, -136},
-		{298, 541,    0},
+
+	static const s64 bt709_limited[3][3] = {
+		{5020601039, 0, 7729959424},
+		{5020601039, -919487572, -2297803934},
+		{5020601039, 9108275786, 0},
 	};
-	static const s16 bt2020_full[3][3] = {
-		{256,   0,  377},
-		{256, -42, -146},
-		{256, 482,    0},
+
+	static const s64 bt2020_full[3][3] = {
+		{4294967296, 0, 6333358775},
+		{4294967296, -706750298, -2453942994},
+		{4294967296, 8080551471, 0},
 	};
-	static const s16 bt2020[3][3] = {
-		{298,   0,  430},
-		{298, -48, -167},
-		{298, 548,    0},
+
+	static const s64 bt2020_limited[3][3] = {
+		{5020601039, 0, 7238124312},
+		{5020601039, -807714626, -2804506279},
+		{5020601039, 9234915964, 0},
 	};
 
 	u8 r = 0;
@@ -183,15 +199,15 @@ VISIBLE_IF_KUNIT void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16,
 
 	switch (encoding) {
 	case DRM_COLOR_YCBCR_BT601:
-		ycbcr2rgb(full ? bt601_full : bt601,
+		ycbcr2rgb(full ? bt601_full : bt601_limited,
 			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
 		break;
 	case DRM_COLOR_YCBCR_BT709:
-		ycbcr2rgb(full ? rec709_full : rec709,
+		ycbcr2rgb(full ? bt709_full : bt709_limited,
 			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
 		break;
 	case DRM_COLOR_YCBCR_BT2020:
-		ycbcr2rgb(full ? bt2020_full : bt2020,
+		ycbcr2rgb(full ? bt2020_full : bt2020_limited,
 			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
 		break;
 	default:

---

> 
>> Just to be sure, the DRM subsystem don't have such matrix somewhere? It 
>> can be nice to avoid duplicating them.
> 
> As to my knowledge it does not exist on DRM, I think those are normally
> on the hardware itself (*please* correct me if I'm wrong).
> 
> But, v4l2 has a similar table on
> drivers/media/common/v4l2-tpg/v4l2-tpg-core.c (Actually, I started my
> code based on this), unfortunately it's only 8-bit too.
> 
> Best Regards,
> ~Arthur Grillo
> 
>>
>>>> +} + /* * The following functions are read_line function for each
>>>> pixel format supported by VKMS. * @@ -142,13 +250,13 @@ static void
>>>> RGB565_to_argb_u16(struct pixel_argb_u16 *out_pixel, const u16 *pixe
>>>> * [1]:
>>>> https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net/
>>>> */
>>>>  
>>>> -static void ARGB8888_read_line(struct vkms_frame_info *frame_info,
>>>> int x_start, int y_start, +static void ARGB8888_read_line(struct
>>>> vkms_plane_state *plane, int x_start, int y_start, enum
>>>> pixel_read_direction direction, int count, struct pixel_argb_u16
>>>> out_pixel[]) { -	u8 *src_pixels = packed_pixels_addr(frame_info,
>>>> x_start, y_start, 0); +	u8 *src_pixels =
>>>> packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
>>>>  
>>>> -	int step = get_step_1x1(frame_info->fb, direction, 0); +
>>>> int step = get_step_1x1(plane->frame_info->fb, direction, 0);
>>>
>>> These are the kind of changes I would not expect to see in a patch
>>> adding YUV support. There are a lot of them, too.
>>
>> I will put it directly this change in PATCHv2 5/9.
>>
>> [...]
>>
>>>> +static void semi_planar_yuv_read_line(struct vkms_plane_state
>>>> *plane, int x_start, int y_start, +
>>>> enum pixel_read_direction direction, int count, +
>>>> struct pixel_argb_u16 out_pixel[]) +{ +	u8 *y_plane =
>>>> packed_pixels_addr(plane->frame_info, x_start, y_start, 0); +
>>>> u8 *uv_plane = packed_pixels_addr(plane->frame_info, +
>>>> x_start / plane->frame_info->fb->format->hsub, +
>>>> y_start / plane->frame_info->fb->format->vsub, +
>>>> 1); +	struct pixel_yuv_u8 yuv_u8; +	int step_y =
>>>> get_step_1x1(plane->frame_info->fb, direction, 0); +	int
>>>> step_uv = get_step_1x1(plane->frame_info->fb, direction, 1); +
>>>> int subsampling = get_subsampling(plane->frame_info->fb->format,
>>>> direction); +	int subsampling_offset =
>>>> get_subsampling_offset(plane->frame_info->fb->format, direction, +
>>>> x_start, y_start); // 0 + +	for (int i = 0; i < count; i++) { +
>>>> yuv_u8.y = y_plane[0]; +		yuv_u8.u = uv_plane[0]; +
>>>> yuv_u8.v = uv_plane[1]; + +		yuv_u8_to_argb_u16(out_pixel,
>>>> &yuv_u8, plane->base.base.color_encoding, +
>>>> plane->base.base.color_range);
>>>
>>> Oh, so this was the reason to change the read-line function
>>> signature. Maybe just stash a pointer to the right matrix and the
>>> right y_offset in frame_info instead?
>>
>> Yes, that why I changed the signature. I think I will keep this
>> signature and put the conversion_matrix inside the vkms_plane_state,
>> for me it make more sense to have pixel_read_line and
>> conversion_matrix in the same structure.
>>
>>>> +		out_pixel += 1; +		y_plane += step_y; +
>>>> if ((i + subsampling_offset + 1) % subsampling == 0) +
>>>> uv_plane += step_uv; +	} +} + +static void
>>>> semi_planar_yvu_read_line(struct vkms_plane_state *plane, int
>>>> x_start, int y_start, +				      enum
>>>> pixel_read_direction direction, int count, +
>>>> struct pixel_argb_u16 out_pixel[]) +{ +	u8 *y_plane =
>>>> packed_pixels_addr(plane->frame_info, x_start, y_start, 0); +
>>>> u8 *vu_plane = packed_pixels_addr(plane->frame_info, +
>>>> x_start / plane->frame_info->fb->format->hsub, +
>>>> y_start / plane->frame_info->fb->format->vsub, +
>>>> 1); +	struct pixel_yuv_u8 yuv_u8; +	int step_y =
>>>> get_step_1x1(plane->frame_info->fb, direction, 0); +	int
>>>> step_vu = get_step_1x1(plane->frame_info->fb, direction, 1); +
>>>> int subsampling = get_subsampling(plane->frame_info->fb->format,
>>>> direction); +	int subsampling_offset =
>>>> get_subsampling_offset(plane->frame_info->fb->format, direction, +
>>>> x_start, y_start); +	for (int i = 0; i < count; i++) { +
>>>> yuv_u8.y = y_plane[0]; +		yuv_u8.u = vu_plane[1]; +
>>>> yuv_u8.v = vu_plane[0];
>>>
>>> You could swap matrix columns instead of writing this whole new
>>> function for UV vs. VU. Just an idea.
>>
>> I was not happy with this duplication too, but I did not think about
>> switching columns. That's a good idea, thanks!
>>  
>> Kind regards, Louis Chauvet
>>
>> [...]
>>

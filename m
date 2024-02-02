Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC4084784B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 19:49:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C941E10E1C6;
	Fri,  2 Feb 2024 18:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="Tm8e2N9X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9BA10E1C6
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 18:49:53 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4TRPvz3Q6YzDqLd;
 Fri,  2 Feb 2024 18:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1706899792; bh=kIDXrZYa7YvbjaZ39Y/wNvsjQTgKItJ4WaLfAWeaQPI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Tm8e2N9XN3xz9TmD5FX7b4LVl5iIr00IBtn9r5OZJw8ap/zye9W8JhG6znpAFNB1N
 D8/kgV4xjxF1g0GANtPUuYYMISjzuSI6RJvxPiFZmW0C7ZZi3CPkNyZuT1s9ukVDCr
 U0WBRuhcAG7DMF9/Ze/jkubhajMs145nVL0eP1vQ=
X-Riseup-User-ID: AC796D553161309225802F4533227B3C3B461BDFDF791A0A23FAFA2986536A4A
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4TRPvs38wyzFvGP;
 Fri,  2 Feb 2024 18:49:45 +0000 (UTC)
Message-ID: <034aed14-6eb7-4758-86b9-cc294614f045@riseup.net>
Date: Fri, 2 Feb 2024 15:49:42 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/7] drm/vkms: Add support for multy-planar framebuffers
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com, marcheu@google.com
References: <20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net>
 <20240110-vkms-yuv-v2-2-952fcaa5a193@riseup.net>
 <ZbvXHECSBmH0NDZn@localhost.localdomain>
Content-Language: en-US
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <ZbvXHECSBmH0NDZn@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 01/02/24 14:38, Louis Chauvet wrote:
>>  
>>  /*
>> @@ -23,27 +23,25 @@ static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int
>>   * @frame_info: Buffer metadata
>>   * @x: The x(width) coordinate of the 2D buffer
>>   * @y: The y(Heigth) coordinate of the 2D buffer
>> + * @index: The index of the plane on the 2D buffer
>>   *
>>   * Takes the information stored in the frame_info, a pair of coordinates, and
>> - * returns the address of the first color channel.
>> - * This function assumes the channels are packed together, i.e. a color channel
>> - * comes immediately after another in the memory. And therefore, this function
>> - * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
>> + * returns the address of the first color channel on the desired index.
>>   */
>>  static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
>> -				int x, int y)
>> +				int x, int y, size_t index)
>>  {
>> -	size_t offset = pixel_offset(frame_info, x, y);
>> +	size_t offset = pixel_offset(frame_info, x, y, index);
>>  
>>  	return (u8 *)frame_info->map[0].vaddr + offset;
>>  }
> 
> This implementation of packed_pixels_addr will only work with
> block_w == block_h == 1. For packed or tiled formats we will need to use
> x/y information to extract the correct address, and this address will not 
> be a single pixel. See below my explanation.

You're right, currently, VKMS only supports non-packed/tiled formats. As
all the formats I plan to add are too not packed or tiled, I haven't
added support to it. But if you want to add it, please do :).

>> @@ -130,17 +128,28 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
>>  {
>>  	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
>>  	struct vkms_frame_info *frame_info = plane->frame_info;
>> -	u8 *src_pixels = get_packed_src_addr(frame_info, y);
>> +	const struct drm_format_info *frame_format = frame_info->fb->format;
>>  	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
>> +	u8 *src_pixels[DRM_FORMAT_MAX_PLANES];
>>  
>> -	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->fb->format->cpp[0]) {
>> +	for (size_t i = 0; i < frame_format->num_planes; i++)
>> +		src_pixels[i] = get_packed_src_addr(frame_info, y, i);
>> +
>> +	for (size_t x = 0; x < limit; x++) {
>>  		int x_pos = get_x_position(frame_info, limit, x);
>>  
>> -		if (drm_rotation_90_or_270(frame_info->rotation))
>> -			src_pixels = get_packed_src_addr(frame_info, x + frame_info->rotated.y1)
>> -				+ frame_info->fb->format->cpp[0] * y;
>> +		if (drm_rotation_90_or_270(frame_info->rotation)) {
>> +			for (size_t i = 0; i < frame_format->num_planes; i++) {
>> +				src_pixels[i] = get_packed_src_addr(frame_info,
>> +								    x + frame_info->rotated.y1, i);
>> +				src_pixels[i] += frame_format->cpp[i] * y;
> 
> I find the current rotation management a bit complex to understand. This 
> is not related to your patch, but as I had to understand this to create my 
> second patch, I think this could be significanlty simplified.

I also found the rotation logic complex when implementing this. I would
appreciate it if it were simplified.

> 
> Please see the below comment about frame_format->cpp, it applies here too. 
> I think the "easy" way here is simply to reuse the method 
> get_packed_src_addr every time you need a new pixel.
> 
>> +			}
>> +		}
>>  
>> 		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
>> +
> 
> The usage of cpp and pointer to specific pixel only work for non-packed 
> and non-blocked pixels, but for example NV30 or Y0L0 need more 
> informations about the exact location of the pixel to convert and write 
> the correct pixel value (each pixel can't be referenced directly by a 
> pointer). For example NV30 uses 5 bytes to store 3 pixels (10 bits each), 
> so to access the "middle" one you need to read the 5 bytes and do a small 
> computation to extract it's value.

Great explanation, I can see what is the problem here.

> 
> I think a simple solution to handle most cases would be to profide two 
> more parameters: the x and y positions of the pixel to copy, using 
> "absolute coordinates" (i.e x=0,y=0 means the first byte of the src 
> buffer, not the first pixel in the `drm_rect src`, this way the method 
> `pixel_read` can extract the correct value).
> 
> This way it become easy to manage "complex" pixel representations in this 
> loop: simply increment x/y and let the pixel_read method handle 
> everything.
> 
> The second patch I will send is doing this. And as explained before, it 
> will also simplify a lot the code related to rotation and translation (no 
> more switch case everywhere to add offset to x/y, it simply use drm_rect_* 
> helpers).

I like this, expect my review soon :).

> 
> It's not optimal in term of performance (in some situation it will read 
> the same block multiple time to generate different pixels), but I 
> believe it still is an intersting trade-off.
> 
> In the future, if performance is actally critical, the whole composition 
> loop will have to be specialized for each pixel formats: some can be 
> treated line by line (as it's done today), but with blocks or packed 
> pixels it's more complex.
> 
>> +		for (size_t i = 0; i < frame_format->num_planes; i++)
>> +			src_pixels[i] += frame_format->cpp[i];
> 
> This is likely working with format with block_w != 1, see explanation 
> above.

I think you meant that is _not_ working. Yeah, as I already explained,
it was never my plan to add support for packed or tiled formats.

Best Regards,
~Arthur Grillo

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933219B2D07
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB45110E46A;
	Mon, 28 Oct 2024 10:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="XiTXvcAQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2851410E46A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:39:17 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4XcVHm38qZz9s5h;
 Mon, 28 Oct 2024 10:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1730111956; bh=cCBTFcgdNGAMZZblWNtkIdxE+kJi8dJbK7cWme9wa/0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=XiTXvcAQ1I96VTEytoO6YeAsPWgVMskWkj3u+RrCdulY4HIb8KidBLegYqxmJVPBX
 /U+qOOC9YnTlNskn/cG2i+3twxzdbHBu8xOBn4aePefEIkvWOPC8kT4rKV9KmKBgIC
 RoULkKhbJGvuB7R3mG+gprbq/eP1hsYF8BLy2P1Y=
X-Riseup-User-ID: 27ADA47FA4B3CE9D1512A9D0F91532677EA1A8C408E6A02B6E69E3D42FC77329
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4XcVHf4BSMzFtTK;
 Mon, 28 Oct 2024 10:39:10 +0000 (UTC)
Message-ID: <8b45942a-c0e6-4f14-9df6-76a50e507b87@riseup.net>
Date: Mon, 28 Oct 2024 07:39:08 -0300
MIME-Version: 1.0
Subject: Re: [PATCH RESEND v2 5/8] drm/vkms: Add support for RGB888 formats
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com, 20241007-yuv-v12-0-01c1ada6fec8@bootlin.com
References: <20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com>
 <20241007-b4-new-color-formats-v2-5-d47da50d4674@bootlin.com>
 <53d04022-7199-4880-9b41-1ee7abdad997@riseup.net> <Zx9ebXIlkCAKz52F@fedora>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <Zx9ebXIlkCAKz52F@fedora>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Louis,

On 28/10/24 06:50, Louis Chauvet wrote:
> On 26/10/24 - 11:51, Maíra Canal wrote:
>> Hi Louis,
>>
>> On 07/10/24 13:46, Louis Chauvet wrote:
>>> Add the support for:
>>> - RGB888
>>> - BGR888
>>>
>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>> ---
>>>    drivers/gpu/drm/vkms/vkms_formats.c | 7 +++++++
>>>    drivers/gpu/drm/vkms/vkms_plane.c   | 2 ++
>>>    2 files changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
>>> index e34bea5da752..2376ea8661ac 100644
>>> --- a/drivers/gpu/drm/vkms/vkms_formats.c
>>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
>>> @@ -461,6 +461,9 @@ READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
>>>    READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
>>>    READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
>>> +READ_LINE_ARGB8888(RGB888_read_line, px, 255, px[2], px[1], px[0])
>>> +READ_LINE_ARGB8888(BGR888_read_line, px, 255, px[0], px[1], px[2])
>>> +
>>>    READ_LINE_16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
>>>    READ_LINE_16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
>>>    READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0])
>>> @@ -679,6 +682,10 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
>>>    		return &RGBX8888_read_line;
>>>    	case DRM_FORMAT_BGRX8888:
>>>    		return &BGRX8888_read_line;
>>> +	case DRM_FORMAT_RGB888:
>>> +		return RGB888_read_line;
>>
>> Shouldn't it be &RGB888_read_line?
> 
> According to [1], &function, function, ***function are understood the
> same by gcc.
> 
> But this is ugly and I will change to use & everywhere, thanks!

I didn't know that, that's interesting. I'd add & just for consistency.

Best Regards,
- Maíra

> 
> [1]:https://stackoverflow.com/questions/6893285/why-do-function-pointer-definitions-work-with-any-number-of-ampersands-or-as
> 
> Thanks,
> Louis Chauvet
>   
>>> +	case DRM_FORMAT_BGR888:
>>> +		return BGR888_read_line;
>>
>> Same.
>>
>> Best Regards,
>> - Maíra
>>
>>>    	case DRM_FORMAT_ARGB16161616:
>>>    		return &ARGB16161616_read_line;
>>>    	case DRM_FORMAT_ABGR16161616:
>>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
>>> index a243a706459f..0fa589abc53a 100644
>>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
>>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
>>> @@ -21,6 +21,8 @@ static const u32 vkms_formats[] = {
>>>    	DRM_FORMAT_XBGR8888,
>>>    	DRM_FORMAT_RGBX8888,
>>>    	DRM_FORMAT_BGRX8888,
>>> +	DRM_FORMAT_RGB888,
>>> +	DRM_FORMAT_BGR888,
>>>    	DRM_FORMAT_XRGB16161616,
>>>    	DRM_FORMAT_XBGR16161616,
>>>    	DRM_FORMAT_ARGB16161616,
>>>


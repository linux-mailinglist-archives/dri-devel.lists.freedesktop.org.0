Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED81098E105
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 18:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465C410E0E7;
	Wed,  2 Oct 2024 16:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="biXhasDA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729AC10E0E7
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 16:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=nSB0vAIAYM2AQOnHMlZeovDUyB4IdF1sRc2O4+qt2jA=; b=biXhasDAABs9Wai4Fl7ksS1pIB
 R3nOZf1sCs7QTK6t4cbC+FHHL4rYjXeeYGVLGpGpFXQYjZiLTsyqhUqwZ4MyCPtsaKWh4YPiJN4cj
 8CV8Ao9T/QgHqzFFGjuRqamTgvva18a5FX5c0XZ4ZOz2CY+F4Z8Wx4ueXhfO4seZxildcKXERcPV0
 A2OtKwf7I4U8hG4zfUtJ3HLPCm5Xa92ekW0z0bgz1eD/gBrOKWgyynnQOFbdPHe4yFkpBixLamX4y
 Myn7fxK1ihSHqMRMNJU1BP6FlkRiYWQLpFU47Msl5xArXJdogtQdP8t2To9QGVtHd/NY8qasnO6WU
 +7oAUOFw==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
 by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1sw2Lc-00000003YEo-0v2C; Wed, 02 Oct 2024 16:37:08 +0000
Message-ID: <9886cf09-8886-4757-86ca-f5e724d1cd88@infradead.org>
Date: Wed, 2 Oct 2024 09:37:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 06/15] drm/vkms: Avoid computing blending limits
 inside pre_mul_alpha_blend
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, Maaara Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona@ffwll.ch>, arthurgrillo@riseup.net,
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20240930-yuv-v11-0-4b1a26bcfc96@bootlin.com>
 <20240930-yuv-v11-6-4b1a26bcfc96@bootlin.com>
 <30573f5a-d3dd-4aa4-ac5a-cf6df77b79dc@infradead.org>
 <Zv0LBo8OtRHJM029@louis-chauvet-laptop>
 <509aa67d-5bfa-4f37-aae6-ce3786e35596@infradead.org>
 <Zv1wz-TNT36McwXp@louis-chauvet-laptop>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <Zv1wz-TNT36McwXp@louis-chauvet-laptop>
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



On 10/2/24 9:11 AM, Louis Chauvet wrote:
> On 02/10/24 - 08:49, Randy Dunlap wrote:
>> Hi Louis,
>>
>> On 10/2/24 1:57 AM, Louis Chauvet wrote:
>>> On 01/10/24 - 20:54, Randy Dunlap wrote:
>>>> Hi--
>>>>
>>>> On 9/30/24 8:31 AM, Louis Chauvet wrote:
>>>>> The pre_mul_alpha_blend is dedicated to blending, so to avoid mixing
>>>>> different concepts (coordinate calculation and color management), extract
>>>>> the x_limit and x_dst computation outside of this helper.
>>>>> It also increases the maintainability by grouping the computation related
>>>>> to coordinates in the same place: the loop in `blend`.
>>>>>
>>>>> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>>>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>>> ---
>>>>>  drivers/gpu/drm/vkms/vkms_composer.c | 40 +++++++++++++++++-------------------
>>>>>  1 file changed, 19 insertions(+), 21 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>>>>> index 931e214b225c..4d220bbb023c 100644
>>>>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>>>>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>>>>> @@ -24,34 +24,30 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>>>>>  
>>>>>  /**
>>>>>   * pre_mul_alpha_blend - alpha blending equation
>>>>> - * @frame_info: Source framebuffer's metadata
>>>>>   * @stage_buffer: The line with the pixels from src_plane
>>>>>   * @output_buffer: A line buffer that receives all the blends output
>>>>> + * @x_start: The start offset
>>>>> + * @pixel_count: The number of pixels to blend
>>>>
>>>> so is this actually pixel count + 1; or
>>>>
>>>>>   *
>>>>> - * Using the information from the `frame_info`, this blends only the
>>>>> - * necessary pixels from the `stage_buffer` to the `output_buffer`
>>>>> - * using premultiplied blend formula.
>>>>> + * The pixels 0..@pixel_count in stage_buffer are blended at @x_start..@x_start+@pixel_count in
>>>>
>>>> should these ranges include a "- 1"?
>>>> Else please explain.
>>>
>>> Hi Randy,
>>>
>>> For the next version, I will use standard mathematical notation to clarify 
>>> the "inclusiveness" of the interval: [0;pixel_count[
>>
>> Hm, I can read that after a second or two.
>>
>> My math classes always used:  [0,pixel_count)
>> for that range, and that is what most of the internet says as well.
> 
> I'm french, and we use ]a;b[ notation at school :-)

The one reference that I found to that notation was to a French author.
> 
> Both are valids according to ISO80000-2, but I will change it for the next 
> revision.
>  
>> or you could just stick with
>>   The pixels from 0 through @pixel_count - 1 in stage_buffer are blended at @x_start
>>   through @x_start through @x_start + @pixel_count - 1.
>>
>> but after writing all of that, I think using range notation is better.
> 
> I also prefer ranges, way shorter to write, and easier to understand at 
> first sight. 

Yes, thanks.


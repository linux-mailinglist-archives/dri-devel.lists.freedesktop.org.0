Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAA6A56AD4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 15:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A543610E163;
	Fri,  7 Mar 2025 14:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IcOybE5q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F4A10E163
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 14:50:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B844444318;
 Fri,  7 Mar 2025 14:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741359046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=E6rezCD1d0EV/7JB4sbidff+W3rCks8eXhkpwvf2mB8=;
 b=IcOybE5qokqzgjKqfjmaWEq0vWCQ00UGkOJgz7Z7T18TmimPysK7mhVldN4HiH4tDUWwAU
 YHGSX3L0IoAp6hiYpjS9Rw2atSDAqE7DChJmBb+XWYPMBZIhNmVvw0akd53UUZ9FbqPNRA
 kuuRDf6ADNN/d+ljdcEWITSNS3xDyTJOsA4cqbrGtKfumhk4LJj2a8hvxrJH7kdQnJ+SbJ
 rJ2UzObG/jNiGReVD/Dy8ANQc7WGxevGBhViyQxljMFY523zcdK+dgqWPFlKn5bz8FFu2S
 3HPDCISmW7NuIQegi4RZ6EI86v4beCltWtFZR0hiccyATClFqjj9T5+5wHhkAQ==
Message-ID: <6fa7a17f-3932-4b93-a3c7-885619f8ec73@bootlin.com>
Date: Fri, 7 Mar 2025 15:50:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 5/7] drm/vkms: Create KUnit tests for YUV conversions
To: Maxime Ripard <mripard@kernel.org>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 rdunlap@infradead.org, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com, linux-doc@vger.kernel.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
 <20250121-yuv-v16-5-a61f95a99432@bootlin.com>
 <qwym5wty72f6o4dfz2iduamkpuom6jt5txskknovqxzagruusx@zuytk7awe2uw>
 <Z5dkd3npNtzPWCrP@louis-chauvet-laptop>
 <20250205-pristine-perch-of-abundance-7abac1@houat>
 <Z6OEd329pDNRrL5v@louis-chauvet-laptop>
 <20250219-inventive-micro-parrot-c24846@houat>
 <ce5fb86d-f3bc-4196-9cfd-8af41a83beb1@bootlin.com>
 <20250307-glaring-kiwi-of-teaching-d5ddd4@houat>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250307-glaring-kiwi-of-teaching-d5ddd4@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekieevtdefgedtkeehteehtddttdefhffhgeejleejjeeluddvhfdugedvkeehveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdegpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhoughrihhgohhsihhquhgvihhrrghmvghlohesghhmrghilhdrtghomhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrihhrrggtrghnrghlsehrihhsvghuphdrnhgvthdprhgtp
 hhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 07/03/2025 à 11:20, Maxime Ripard a écrit :
> On Wed, Feb 19, 2025 at 02:35:14PM +0100, Louis Chauvet wrote:
>>
>>
>> Le 19/02/2025 à 11:15, Maxime Ripard a écrit :
>>> On Wed, Feb 05, 2025 at 04:32:07PM +0100, Louis Chauvet wrote:
>>>> On 05/02/25 - 09:55, Maxime Ripard wrote:
>>>>> On Mon, Jan 27, 2025 at 11:48:23AM +0100, Louis Chauvet wrote:
>>>>>> On 26/01/25 - 18:06, Maxime Ripard wrote:
>>>>>>> On Tue, Jan 21, 2025 at 11:48:06AM +0100, Louis Chauvet wrote:
>>>>>>>> +static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>>>>>>>> +	/*
>>>>>>>> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
>>>>>>>> +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
>>>>>>>> +	 *                     in_bits = 16,
>>>>>>>> +	 *                     in_legal = False,
>>>>>>>> +	 *                     in_int = True,
>>>>>>>> +	 *                     out_bits = 8,
>>>>>>>> +	 *                     out_legal = False,
>>>>>>>> +	 *                     out_int = True)
>>>>>>>> +	 *
>>>>>>>> +	 * Test cases for conversion between YUV BT601 full range and RGB
>>>>>>>> +	 * using the ITU-R BT.601 weights.
>>>>>>>> +	 */
>>>>>>>
>>>>>>> What are the input and output formats?
>>>>>>>
>>>>>>> Ditto for all the other tests.
>>>>>>
>>>>>> There is no really "input" and "output" format, they are reference values
>>>>>> for conversion, you should be able to use it in both direction. They are
>>>>>> generated by RGB_to_YCbCr (RGB input, YUV output) just because it was
>>>>>> easier to create the colors from RGB values.
>>>>>
>>>>> RGB and YUV aren't formats, they are color models. XRGB8888 is a format.
>>>>> NV12 is a format.
>>>>>
>>>>>> If you think we should specify what is was used as input and output to
>>>>>> generate those values, I can modify the comment to:
>>>>>>
>>>>>> 	Tests cases for color conversion generated by converting RGB
>>>>>> 	values to YUV BT601 full range using the ITU-R BT.601 weights.
>>>>>
>>>>> My point is that those comments should provide a way to reimplement the
>>>>> test from scratch, and compare to the actual implementation. It's useful
>>>>> when you have a test failure and start to wonder if the implementation
>>>>> or the test is at fault.
>>>>>
>>>>> By saying only RGB and YUV, you can't possibly do that.
>>>>
>>>> I understand your concern, but I believe there might be a slight
>>>> misunderstanding. The table in question stores reference values for
>>>> specific color models, not formats. Therefore, it doesn't specify any
>>>> particular format like XRGB8888 or NV12.
>>>>
>>>> To clarify this, I can rename the format_pair struct to value_pair. This
>>>> should make it clearer that we are dealing with color model values rather
>>>> than formats.
>>>>
>>>> If you want to test a specific format conversion, such as
>>>> YUV420_to_argbu16, you would need to follow a process like this:
>>>>
>>>> 	// Recreate a YUV420 data
>>>> 	plane_1[0] = test_case.yuv.y
>>>> 	plane_2[0] = test_case.yuv.u
>>>> 	plane_2[1] = test_case.yuv.v
>>>>
>>>> 	// convertion to test from YUV420 format to argb_u16
>>>> 	rgb_u16 = convert_YUV420_to_argbu16(plane_1, plane_2)
>>>>
>>>> 	// ensure the conversion is valid
>>>> 	assert_eq(rgb_u16, test_case.rgb)
>>>>
>>>> The current test is not performing this kind of format conversion.
>>>> Instead, it verifies that for given (y, u, v) values, the correct (r, g,
>>>> b, a) values are obtained.
>>>
>>> You already stated that you check for the A, R, G, and B components. On
>>> how many bits are the values you are comparing stored? The YUV values
>>> you are comparing are stored on how many bits for each channel? With
>>> subsampling?
>>>
>>> If you want to compare values, you need to encode a given color into
>>> bits, and the way that encoding is done is what the format is about.
>>>
>>> You might not compare the memory layout but each component individually,
>>> but it's still a format.
>>
>> Sorry, I think I misunderstood what a format really is.
> 
> Ultimately, a format is how a given "color value" is stored. How many
> bits will you use? If you have an unaligned number of bits, how many
> bits of padding you'll use, where the padding is? If there's multiple
> bytes, what's the endianness?
> 
> The answer to all these questions is "the format", and that's why
> there's so many of them.

Thanks!

>> But even with this explanation, I don't understand well what you ask
>> me to change. Is this better:
>>
>> The values are computed by converting RGB values, with each component stored
>> as u16, to YUV values, with each component stored as u8. The conversion is
>> done from RGB full range to YUV BT601 full range using the ITU-R BT.601
>> weights.
>>
>> TBH, I do not understand what you are asking for exactly. Can you please
>> give the sentence you expect directly?
> 
> The fourcc[1] code for the input and output format would be nice. And if
> you can't, an ad-hoc definition of the format, answering the questions I
> mentionned earlier (and in the previous mail for YUV).

I don't think any fourcc code will apply in this case, the tests use 
internal VKMS structures pixel_argb_16 and pixel_yuv_u8. How do I 
describe them better? If I add this comment for the structures, is it 
enough?

/**
  * struct pixel_argb_u16 - Internal representation of a pixel color.
  * @r: Red component value, stored in 16 bits, without padding, using
  *     machine endianness
  * @b: [...]
  *
  * The goal of this structure is to keep enough precision to ensure
  * correct composition results in VKMS and simplifying color
  * manipulation by splitting each component into its own field.
  * Caution: the byte ordering of this structure is machine-dependent,
  * you can't cast it directly to AR48 or xR48.
  */
struct pixel_argb_u16 {
	u16 a, r, g, b;
};

(ditto for pixel_yuv_u8)

> I'm really
> surprised about the RGB component values being stored on 16 bits though.
> It's super unusual, to the point where it's almost useless for us to
> test, and we should probably use 8 bits values.

We need to have 16 bits because some of the writeback formats are 16 bits.

Louis Chauvet

> Maxime
> 
> 1: https://elixir.bootlin.com/linux/v6.13.5/source/include/uapi/drm/drm_fourcc.h#L486

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


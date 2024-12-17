Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCB29F48A7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 11:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C280310E8E2;
	Tue, 17 Dec 2024 10:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="acKvEdxj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4791510E8E2;
 Tue, 17 Dec 2024 10:13:10 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4YCCLV6lBzz9sbY;
 Tue, 17 Dec 2024 11:13:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1734430387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hUVNxwfgQJCoN3dSGcvl+uo7z+d2Vz7cow5BBGaB6fc=;
 b=acKvEdxj7cWhOTo5up4r6gLWjR0Ldq0cxSciLY1nc/vaZAO54tYBM8Rcr2wewc2v7lS1DT
 hrj/UQJ2XVOVYYNSptEdHgsQzD3DfCATd9NY5CUPDqduZjCQU3i7kD1GgZHKwtR2+ZrHgf
 2w/agIkxuGVcTiRadFOasYEtB/QFBSZk/1jQNm15oD948LrARMoqGla8xPHv3SG/KVv4bc
 mZG0msCSHePq9drkSyHkxlfjbJWfgbHgQd+t0fVbm3ZMNUBNHZT0syFCt+jU7Vi3RZ71rn
 qIU7u5SiV442llIL4tENgfr9CoUpZ4lloSsdU9WRTKCUAJUlibzPG+R5cg1L1w==
Message-ID: <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
Date: Tue, 17 Dec 2024 11:13:05 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: Brian Starkey <brian.starkey@arm.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <maraeo@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 3a1f9ec3600d935dfba
X-MBO-RS-META: nw3u89grh81ycibjir8zm5fr4ft994fr
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

On 2024-12-17 10:14, Brian Starkey wrote:
> On Sun, Dec 15, 2024 at 03:53:14PM +0000, Marek Olšák wrote:
>> The comment explains the problem with DRM_FORMAT_MOD_LINEAR.
>>
>> Signed-off-by: Marek Olšák <marek.olsak@amd.com>
>>
>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>> index 78abd819fd62e..8ec4163429014 100644
>> --- a/include/uapi/drm/drm_fourcc.h
>> +++ b/include/uapi/drm/drm_fourcc.h
>> @@ -484,9 +484,27 @@ extern "C" {
>>   * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the DRM_ADDFB2
>> ioctl),
>>   * which tells the driver to also take driver-internal information into
>> account
>>   * and so might actually result in a tiled framebuffer.
>> + *
>> + * WARNING:
>> + * There are drivers out there that expose DRM_FORMAT_MOD_LINEAR, but only
>> + * support a certain pitch alignment and can't import images with this
>> modifier
>> + * if the pitch alignment isn't exactly the one supported. They can however
>> + * allocate images with this modifier and other drivers can import them
>> only
>> + * if they support the same pitch alignment. Thus, DRM_FORMAT_MOD_LINEAR is
>> + * fundamentically incompatible across devices and is the only modifier
>> that
>> + * has a chance of not working. The PITCH_ALIGN modifiers should be used
>> + * instead.
>>   */
>>  #define DRM_FORMAT_MOD_LINEAR  fourcc_mod_code(NONE, 0)
>>
>> +/* Linear layout modifiers with an explicit pitch alignment in bytes.
>> + * Exposing this modifier requires that the pitch alignment is exactly
>> + * the number in the definition.
>> + */
>> +#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NONE, 1)
> 
> Why do we want this to be a modifier? All (?) of the other modifiers
> describe properties which the producer and consumer need to know in
> order to correctly fill/interpret the data.
> 
> Framebuffers already have a pitch property which tells the
> producer/consumer how to do that for linear buffers.

At this point, the entity which allocates a linear buffer on device A to be shared with another device B can't know the pitch restrictions of B. If it guesses incorrectly, accessing the buffer with B won't work, so any effort allocating the buffer and producing its contents will be wasted.


> Modifiers are meant to describe framebuffers, and this pitch alignment
> requirement isn't really a framebuffer property - it's a device
> constraint. It feels out of place to overload modifiers with it.
> 
> I'm not saying we don't need a way to describe constraints to
> allocators, but I question if modifiers the right mechanism to
> communicate them?
While I agree with your concern in general, AFAIK there's no other solution for this even on the horizon, after years of talking about it. The solution proposed here seems like an acceptable stop gap, assuming it won't result in a gazillion linear modifiers.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast

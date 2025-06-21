Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35941AE28A7
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 12:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321B010E290;
	Sat, 21 Jun 2025 10:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hRUlpGtm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA8510E290
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jun 2025 10:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jE2ezFWuVO26IHVevRG6r5HpjLUh5Ae1Xsq9fbuJ8aQ=; b=hRUlpGtmi3R/2skdAc4s6Nxn4f
 B4NlC3o5XjALLAhXD014oCKu32bcpQXbmRu8Hy1Z8uPuB1YY7TV9seXdOm5AHbN3Kim0hketea2Iz
 Y89/pdYchLrfdIbpbUtFTXceX+IZunC3u//pQLVTmMG6mVzwYmyJAaxHry+GIlPR0EPjTxv/M7AqC
 L/9TwJAXkfIRmhfpbraKi3rBvH2ef0gg8G9aLeTkOPsXlcV2tfAdxOiH2nQfLwTUpF3UOp7we0IAI
 ufEQkIehTVt9YqkSqEeRtXn2Gzy5HS6NbdIOS5KmdE4FkQwmHzvVSwqBuMK98ZJoqVzOJHdsCkreq
 Gbb9Z79Q==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uSvpq-006M5p-Fn; Sat, 21 Jun 2025 12:52:34 +0200
Message-ID: <e88d4d36-18e5-4edc-b4ee-59c07e6605a3@igalia.com>
Date: Sat, 21 Jun 2025 07:52:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] drm/vkms: Add support for ARGB8888 formats
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
References: <20250530-b4-new-color-formats-v4-0-ef5f9f48376c@bootlin.com>
 <20250530-b4-new-color-formats-v4-2-ef5f9f48376c@bootlin.com>
 <eba688fe-d270-420b-9619-121fb4b8ba1d@igalia.com>
 <115564ae-4b61-47be-9a9d-9c27acd4192c@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <115564ae-4b61-47be-9a9d-9c27acd4192c@bootlin.com>
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

On 13/06/25 14:28, Louis Chauvet wrote:
> 
> 
> Le 11/06/2025 à 21:55, Maíra Canal a écrit :
>> Hi Louis,
>>
>> On 5/30/25 11:05, Louis Chauvet wrote:
>>> The formats XRGB8888 and ARGB8888 were already supported.
>>> Add the support for:
>>> - XBGR8888
>>> - RGBX8888
>>> - BGRX8888
>>> - ABGR8888
>>> - RGBA8888
>>> - BGRA8888
>>>
>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>> ---
>>
>> [...]
>>
>>> +READ_LINE_ARGB8888(RGBX8888_read_line, px, 0xFF, px[3], px[2], px[1])
>>> +READ_LINE_ARGB8888(BGRX8888_read_line, px, 0xFF, px[1], px[2], px[3])
>>
>> How did you test those two formats? I noticed that IGT (kms_plane tests)
>> doesn't test them.
> 
> Hi Maíra,
> 
> Thanks for your review!
> 
> I wrote this a long time ago, so I don't remember. I was probably greedy 
> and added all the "trivial" formats I was able to do and missed that 
> this format was not tested.
> 
> For this revision, I just started kms_plane to check if it was happy 
> after the rebase, I did not check the formats one by one.
> 
> Do you want me to remove those formats? I think it costs nothing to keep 
> them, especially with the new READ_LINE_ARGB8888 macro, but I will 
> comply if you think we should only merge tested formats.

If we don't have a use-case for those formats and we haven't tested
them, I can't see a compelling reason to keep them. Otherwise, we might
keep untested/unused code around that might stale over time.

Best Regards,
- Maíra

> 
> Thanks,
> Louis Chauvet
> 
>> Best Regards,
>> - Maíra
>>



Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE1ACD124F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 18:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F42810EEC2;
	Fri, 19 Dec 2025 17:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="f6+ELuDI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E8B10EEC2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 17:28:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 51923C1B20B;
 Fri, 19 Dec 2025 17:28:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 077F86071D;
 Fri, 19 Dec 2025 17:28:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BF68010AA8D37; Fri, 19 Dec 2025 18:28:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766165316; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=nPZD8vHkydT/3viYLb5wlAUsI81jn4g76Cg2Qd3s3z0=;
 b=f6+ELuDIxl+Vaf6595UvwIX0YbjzwZKdVYWu5iakw/nTwUhjGHGX97ASAJUMx8jmkbIzkV
 RqGUxMu/pREJkTgaF+J2CHa8BN6TJ1Mhl6mqf7sQ1kvr02xyWArUJSfDWx/f/muy6AD5CO
 CKQO7ZyvM8jcc5scgohnvoWJlOGALP47nXGLtzOtcH9Ll+tcHVP/HjfUVNvFJcozj6yUsE
 7Q+92vv5CZX5cAU68U2IcVO0I8JX3BmEIhja6qQ2KQ9ZdCCjjGhvCEp5CpcC4WMi9y3+xi
 LRswkiMdw2dMJil4aoQXicijig7RiilqlWCYkVj6JITESeoGCvXXFyans1BodA==
Message-ID: <e3d3538b-e432-4221-bb79-e8155f42edab@bootlin.com>
Date: Fri, 19 Dec 2025 18:28:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 17/32] drm/vkms: Introduce configfs for plane
 format
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-17-a49a2d4cba26@bootlin.com>
 <DF2CWONRF4X6.2N7MHWSI1WU6T@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <DF2CWONRF4X6.2N7MHWSI1WU6T@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

[...]

>> +		.expected_offset = 1
>> +	}, {
>> +		.data = "-R1111",
>> +		.data_len = 3,
> 
> The string is longer than 3 chars, is this intended?

Yes, I wanted to ensure that the algorithm stop at data_len and not \0

>> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
>> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> 
>> +static ssize_t plane_supported_formats_store(struct config_item *item,
>> +					     const char *page, size_t count)
>> +{
>> +	struct vkms_configfs_plane *plane;
>> +
>> +	plane = plane_item_to_vkms_configfs_plane(item);
>> +	int ret = 0;
>> +	const char *end_page = page + count;
>> +
>> +	scoped_guard(mutex, &plane->dev->lock) {
>> +		while (1) {
>> +			char *tmp;
>> +			char fmt[4] = {' ', ' ', ' ', ' '};
>> +			int len = vkms_configfs_parse_next_format(page, end_page, &tmp);
>> +
>> +			// No fourcc code found
>> +			if (len <= 1)
>> +				break;
>> +
>> +			page = tmp + len;
>> +			memcpy(tmp, &fmt[1], min(len - 1, 4));
> Should this be instead:        fmt   tmp
> ?

memcpy(void *to, const void *from

Make sense yes... My tests were not sufficient :(

I will triple check this before sending the v3

> Also I think it would be good to reject strings longer than 4 chars (len >
> 5), because they cannot br fourccs.

I will add this limitation.

Thanks!

> Otherwise looks good.
> 
> BTW, I feel your pain in implementing the parsing!
> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


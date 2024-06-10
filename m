Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541C490214E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 14:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671A110E44C;
	Mon, 10 Jun 2024 12:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YRI0u7U3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C932510E44C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 12:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718021458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rmh45+QL9lYUvQfWOQKRFK+1UH5QO9q1DcPwZDy9DLI=;
 b=YRI0u7U361dF7Vby9Y5fBDYwTlTIPjSnWWVwJ3MNFOMikuVxj6W7M5YMxAoxenffbij1jd
 JNjgW0MqW32pM0JgCs7lA5kEVFQaxFECMe2cARiPk98H8sgC95/txwzEXoKM+/eXrHMOVO
 Q3FJpKOrL6+RI+y6ws3xDlCP3mUKuww=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-zk9qeVjlPQ6T2o4KaSnz2Q-1; Mon, 10 Jun 2024 08:10:57 -0400
X-MC-Unique: zk9qeVjlPQ6T2o4KaSnz2Q-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-52bce33a0c1so2400982e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 05:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718021455; x=1718626255;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rmh45+QL9lYUvQfWOQKRFK+1UH5QO9q1DcPwZDy9DLI=;
 b=rEHr+aCgdXU7R3P7DaweC/D582w6iBa3TKlIbBSDJDJiFamSgtExRqyz0J26oaxBnk
 enIbspdInDN/lG7nvhrhUpkwSiFN+n2EuYNZBdpZS1HCA5vzo5cn/23NB9Deb5+YWgYd
 qe+6u5oaL7l8ev3BJIQPx9TZDcog8flRin2bazIgEelNRJ/8RbC3trF3JTca+rT2+yj5
 qMjSo3cIFdGAW1FZHAkXdo1JYbUHGbgmTKw7Mw6YYk2JMN3KWPMl+UpDmybD84M9bSg4
 nNMVOJpeEEk2XG9VTou3d6Tx3iKocUDBlkUSCkZySKc+s0Yc+m6kjGUVpq4zg+r9xBeS
 37Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4lep2m+QNalecjupBsmoXwOndbSBmGFBqcJL6yDgQExPRFczN6z7dYA4zapfxluIhBSmausqBSaUudPaQ7zt1O1EcDRyd9Yh6gsow2mdJ
X-Gm-Message-State: AOJu0Yzj3n8HuyUYux4wzl+E+4xJ5HFDPCBdK5JpcoY1tDZxTtwpOkHk
 9zQfCTJF1/G1wq6Ww7DW7tBS6ZU5bUKPhO4ZWMMFAQ/G2A7HJvyJH7WY19hZSdI4tgUySQBo1wl
 +e/O+QT8OfcBPh4uwJZ/RfRiU8I0KR8F44vV99jwXwkWTS4EDVrpkTD/xaaM8RAoLrQ7i5nAH1Q
 ==
X-Received: by 2002:a05:6512:3ca8:b0:52c:81db:2659 with SMTP id
 2adb3069b0e04-52c81db273dmr4772196e87.28.1718021455364; 
 Mon, 10 Jun 2024 05:10:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH5I+bI1Zscw3ljgBA/No/54Ob6r2F8C5rp2cn5cy3NBf5dBTS0Sw7qtA18W5MpUaLS/tktA==
X-Received: by 2002:a05:6512:3ca8:b0:52c:81db:2659 with SMTP id
 2adb3069b0e04-52c81db273dmr4772174e87.28.1718021454959; 
 Mon, 10 Jun 2024 05:10:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f11eb2621sm6427961f8f.37.2024.06.10.05.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 05:10:54 -0700 (PDT)
Message-ID: <3649ff15-df2b-49ba-920f-c418355d79b5@redhat.com>
Date: Mon, 10 Jun 2024 14:10:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/panic: Add a kmsg panic screen
To: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240603095343.39588-1-jfalempe@redhat.com>
 <20240603095343.39588-4-jfalempe@redhat.com>
 <87wmn1jeou.fsf@minerva.mail-host-address-is-not-set>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87wmn1jeou.fsf@minerva.mail-host-address-is-not-set>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 07/06/2024 11:16, Javier Martinez Canillas wrote:
> Jocelyn Falempe <jfalempe@redhat.com> writes:
> 
>> Add a kmsg option, which will display the last lines of kmsg,
>> and should be similar to fbcon.
>> Add a drm.panic_screen module parameter, so you can choose between
>> the different panic screens available.
>> two options currently, but more will be added later:
>>   * "user": a short message telling the user to reboot the machine.
>>   * "kmsg": fill the screen with the last lines of kmsg.
>>
>> You can even change it at runtime by writing to
>> /sys/module/drm/parameters/panic_screen
>>
> 
> Great!
> 
>> v2:
>>   * use module parameter instead of Kconfig choice
>>     (Javier Martinez Canillas)
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/Kconfig     |  11 ++++
>>   drivers/gpu/drm/drm_panic.c | 108 ++++++++++++++++++++++++++++++++----
>>   2 files changed, 109 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 9703429de6b9..944815cee080 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -137,6 +137,17 @@ config DRM_PANIC_DEBUG
>>   	  This is unsafe and should not be enabled on a production build.
>>   	  If in doubt, say "N".
>>   
>> +config DRM_PANIC_SCREEN
>> +	string "Panic screen formater"
>> +	default "user"
>> +	depends on DRM_PANIC
>> +	help
>> +	  This option enable to choose what will be displayed when a kernel
>> +	  panic occurs. You can choose between "user", a short message telling
>> +	  the user to reboot the system, or "kmsg" which will display the last
>> +	  lines of kmsg.
> 
> Maybe I would mention here that this is only about the default, but that
> can be changed using the "drm.panic_screen=" kernel cmdline parameter or
> writting to the /sys/module/drm/parameters/panic_screen sysfs entry.
> 
> [...]

Done
> 
>> +static void draw_panic_static_kmsg(struct drm_scanout_buffer *sb)
>> +{
>> +	u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
>> +	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
>> +	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
> 
> Dan reported that get_default_font() can return NULL....

> 
>> +	struct drm_rect r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>> +	struct kmsg_dump_iter iter;
>> +	char kmsg_buf[512];
>> +	size_t kmsg_len;
>> +	struct drm_panic_line line;
>> +	int yoffset = sb->height - font->height - (sb->height % font->height) / 2;
>> +
>> +	if (!font)
>> +		return;
>> +
> 
> ... so you have to calculate yoffset after checking if the font is not NULL.

Yes I fixed that too.

> 
> with that fixed:
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 

Thanks a lot.

I just pushed this series to drm-misc-next.

Best regards,

-- 

Jocelyn



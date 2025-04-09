Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145DEA82135
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 11:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6343E10E822;
	Wed,  9 Apr 2025 09:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="THwnFTdk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF2110E822
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 09:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744191839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G7znzCj/gfMRbAPJAEPE1rTbQF7vTbZ1Y1hJc3xX8N8=;
 b=THwnFTdkOqieDievgHeG/SqRgOB5nTyJod4QImtnUO/RDqONCjL9zaqIh4RuDhK+TGCoBn
 y4m49+h72h3HN108Yjl+wFSv6pwN19SBFyF9BwezUabSVqPj8uHjkfGqqktKa0gnD3h8ac
 pVQxo9xTsyf02iVppJSFm/YAnWIRAsI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-fpqUAFSBNnO5adbkzqtcHQ-1; Wed, 09 Apr 2025 05:43:58 -0400
X-MC-Unique: fpqUAFSBNnO5adbkzqtcHQ-1
X-Mimecast-MFC-AGG-ID: fpqUAFSBNnO5adbkzqtcHQ_1744191837
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43cf172ffe1so55256875e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 02:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744191837; x=1744796637;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G7znzCj/gfMRbAPJAEPE1rTbQF7vTbZ1Y1hJc3xX8N8=;
 b=s8iMS0zZscKQ3qMhJNcc7OaJrs8yMkEU9+J0Fa11drbQiG/hjl2+vsQcb5BAMwtKXD
 pIjejSTzhUfvqhDcd4Y5xwL6F5384kTB2dQ8cqM06JhO2I7p5/6TTMxSlblaIa7jHo82
 BcKSFSajnAu5BkFjN+GZp3rzoX2Ivgrl6qzFQGoGumRDsrLVNXVvSJOxOdJqPgtrB/u5
 33FNjNDV7UvC9YE5R3fMx+eswAZCl5EyFr/8a+FCL4g18VWzpLADvoXb/sdUfpeIvOQR
 VxWEvMsCbPjLOPh2CELkeCyAXnIU10mnVzXdzrxuG3OEH6R7/bn6V1dZfroESyEd8wop
 DY/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgzh+hZxo/VyLXYoBd9A87SNKzF7Sp1wii+PLkS3AJN1ovba2clglK8/AlWM5t7/jUdRFSlkqvSYw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWyuJR691ejUb8OZBTK2izqEBLqYGsARUFkinND9Qo2DbK28yD
 pndTDL382Xof9yKVu/9MRV6G/b4OSjr1XS7Kk7nxiMDLfO7BFr8fiMKOuEzM/XraCYvV+O+Aknk
 g3zp7D5ASpQXPYeemRG8Xh+hzQYTVY2QNGQc3upTyOQ4nI0eCl4QSWfGxBCey2M2y+A==
X-Gm-Gg: ASbGncuhDd058a18hsFIJ8wf6WqagXhhktbO7XK65T4ndQiUYo4D0/2LhUqZUDQvo+k
 uyUA9pyAUieY1ZWIGQko/Sj3rKi9jj8mwdjDPiKKLCJ5J27cAdtikiyTB6oUORkOPJv3jGmX0+f
 qCzf0moAZxKzEGJvgMjpelLMdtdWMdAykCtH1A0VZNI15ZvA/hxM+gIn+oaBha5013Vc6H5Dzfx
 5mjgoFV9uVbIoBGuPSJJvc3PXqnHU2b3aTsvxjidTwevauNayDIswHIqaPUbEV6d8vHx0lufGc1
 WXF/EcKHS2yeni+sWRfQLM82Ci6tEp0vbpuK7AQmKQ69sNxmRJ5PY1nO5fLyOl3QCvnT2Q==
X-Received: by 2002:a5d:64c4:0:b0:391:3915:cffb with SMTP id
 ffacd0b85a97d-39d885612a7mr1577992f8f.43.1744191836705; 
 Wed, 09 Apr 2025 02:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGu4u3BK/v6GJbjaLAKLe1GqebFBXWq85va/hCAimH4+nbm9+X2gTzlrwLpJ0IJFLslffWkQ==
X-Received: by 2002:a5d:64c4:0:b0:391:3915:cffb with SMTP id
 ffacd0b85a97d-39d885612a7mr1577958f8f.43.1744191836268; 
 Wed, 09 Apr 2025 02:43:56 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893f113csm1113919f8f.69.2025.04.09.02.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 02:43:55 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas
 Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
In-Reply-To: <Z_YWq4ry6Y-Jgvjq@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
 <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
 <Z_YWq4ry6Y-Jgvjq@gmail.com>
Date: Wed, 09 Apr 2025 11:43:54 +0200
Message-ID: <87bjt5fz51.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i54nNlaf4EJAHo9pD_c74K9Zmmk7hpOasFe2q7tU1rE_1744191837
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

[...]

>> 
>> That's a god question, I don't really know...
>> 
>> But fbdev does support XRGB8888, which may be another good reason to add
>> it and make it the default format. Yes, it will cause an unnecessary pixel
>> format conversion but the I2C transport is so slow anyways that compute is
>> not the bottleneck when using these small displays.
>
> Hrm, I now realised that I have another issue.
> Not all LCDs that will be attached to the ST7571 controller will be
> grayscale.
> The display I've attached to the ST7571 is a monochrome LCD for example.
>

Oh, that's very interesting. This means that vendors are using a more capable IC
(i.e: ST7571) for display controllers + LCD panels board designs, even where they
could had used a less capable one (i.e: ST7765). That is, using an IC that supports
2-bit grayscale when they could just used one that only supported monochrome pixels.

From a quick search, I found for example this one from SinoCrystal:

https://displaysino.com/product_details/SC128128012-V01.html

> Maybe the right way to do it is to only support XRGB8888 and specify 
> if the display is monochrome or grayscale in the device tree.
>
> Or do you have any good suggestions?
>

I don't know the proper way to handle this, but what I would do is to include
the actual boards as entries in the OF device ID table instead of just the ICs.

And then for each entry you can specify what formats are supported, e.g:

static const uint32_t monochrome_formats[] = {
	DRM_FORMAT_XRGB8888,
        DRM_FORMAT_R1
};

static const uint32_t grayscale_formats[] = {
	DRM_FORMAT_XRGB8888,
        DRM_FORMAT_R1
        DRM_FORMAT_R2
};

static const struct of_device_id st7571_of_match[] = {
	/* monochrome displays */
	{
		.compatible = "sinocrystal,sc128128012-v01",
		.data = monochrome_formats,
	},
...
        /* grayscale displays */
	{
		.compatible = "foo,bar",
		.data = grayscale_formats,
	},
};

and then in your probe callback, you can get the correct format list for
the device matched. Something like the following for example:

static int st7571_probe(struct i2c_client *client) {
       const uint32_t *formats = device_get_match_data(client->dev);
       ...

       ret = drm_universal_plane_init(..., formats, ...);
       ...
};

Likely you will need to define more stuff to be specific for each entry, maybe
you will need different primary plane update handlers too. Similar to how I had  
to do it the ssd130x driver to support all the Solomon OLED controller families:

https://elixir.bootlin.com/linux/v6.11/source/drivers/gpu/drm/solomon/ssd130x.c#L1439

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


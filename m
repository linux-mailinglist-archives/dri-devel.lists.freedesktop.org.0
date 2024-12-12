Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CBD9EE4B2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 12:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7D110ED65;
	Thu, 12 Dec 2024 11:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JYaaRAfx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9F110ED65
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 11:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734001557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8R3+cJ70B/8RL6uR55oK5ldOetQ0vFtfmsRFQRrx4Y=;
 b=JYaaRAfxwNUlRMU7aQNxem3Auk9Dl5QYXY/pQsZUSrjMAxC8S69BxHVX3oNvJ/7M4psSCW
 5TPb0Xb4T8H9O8Yvvere78QV9lYs4kwGXQyxSEftpvzahVhfOHAM+D6UcWdSoWNKGkvatz
 gpCcF1R4j6e8HjWWgu+9izYIvDJPShM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-CTs3x7RKNzKEL-7og8L5ig-1; Thu, 12 Dec 2024 06:05:53 -0500
X-MC-Unique: CTs3x7RKNzKEL-7og8L5ig-1
X-Mimecast-MFC-AGG-ID: CTs3x7RKNzKEL-7og8L5ig
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385d735965bso268558f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 03:05:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734001553; x=1734606353;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b17I4wVwDx/N+KOJByIynEV4MjVriLu3Q4f+Xu760Go=;
 b=n+BhZf80zZvpVcyXzhCLp9MJR0+dHLaBAEGEpe5oZxi95pXbhF+NO5WroFVXYylJwZ
 CpbqW7/m2TCpJ92EiKv2BumxGxNLII9ItQkFFIgUVHFuQruTkAJVOjN4MXur60bnKXyt
 jG0boLpeQMGdgNlU38n4+pdT44xaxvHWQcGTExgTVYAIptCTyz81XKHogDG+/Q2lJVHi
 gn2wFVU/XPw6j1BJLjkeRdePr3zAdC4vYgZRNL8TNB7DHPNtibpTYinsNuEMBjD1ysP2
 yetM7JYrj2H0TevCbb7+Ua53aYASdWQyIMnMQjLG0S1ohk83RawDILMIl1HlO0LS+q33
 PYgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbM1Wk3z41lltzfAhQL7jfY57XC0P0/hPVnidzglP2OyYGGQoAwdMWdFqpKxK0aQ/4JXUA6ekuwSI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK6/494uPADGj1T0oHSkMwtGTLm2zCGfLZggMt+0RmUBmCOMTB
 mGtaNE4KkPwCFWypU+VLY6GdrfvtiR6gUnQDg/UbSACK6CLpV6MU5TcFo8jwsuCUd8VfohX1oYu
 8xugEnCcNZsEOdZtWYDwxQRK7uM3ZInowIT+ivonNPebNuveiDQWjKDnafwsXldchOw==
X-Gm-Gg: ASbGncvDDOK5j1WE35OGy5g3EWFxHeQb/G7swyHEqcT6RoWjxpopD0jmk4zApDVyfWa
 PaIcOxqbIhiVzNIfBJq4FyVpiBTqWjZ5pjIj+AAs/VGOkEJ8/OlmAyv7siAJFcmQdNLwNwtRcNa
 bJGd4KhUSsrqnVnXdDLKiQGZTXupNTL4FcSJ1ARVV4d3xi8HyFLimdw/HtkU/DjKb9t3BeMG1ZD
 8Op52WLnN8vRJW9umTs7iand+raTadIfhmy1iZxfKpHAdFzvMbkkJxoPKVEr84Krih8Umx1nesV
 5mdUG21ILx0xuOqBzyrn2PjIyAQV76Om8sTaxO0=
X-Received: by 2002:a05:6000:1545:b0:385:eb85:f111 with SMTP id
 ffacd0b85a97d-3864ce901bfmr5282482f8f.14.1734001552647; 
 Thu, 12 Dec 2024 03:05:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsjNFpuayrSgHHBa1FRUQVFGwVe0rOy1eihWuPgSfYokpYEiwBVfBti8HIe9PDLwRPTSbepg==
X-Received: by 2002:a05:6000:1545:b0:385:eb85:f111 with SMTP id
 ffacd0b85a97d-3864ce901bfmr5282454f8f.14.1734001552308; 
 Thu, 12 Dec 2024 03:05:52 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436255a0d5dsm13244985e9.27.2024.12.12.03.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 03:05:51 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, regressions@leemhuis.info,
 nunojpg@gmail.com, dri-devel@lists.freedesktop.org,
 regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] drm/fbdev-dma: Add shadow buffering for deferred I/O
In-Reply-To: <Z1rBTcM4xbi_jrXb@phenom.ffwll.local>
References: <20241211090643.74250-1-tzimmermann@suse.de>
 <Z1rBTcM4xbi_jrXb@phenom.ffwll.local>
Date: Thu, 12 Dec 2024 12:05:50 +0100
Message-ID: <87jzc5nott.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5TjLOpIFQa0Yop7X5MHRNecZVAeWI1tLrDwMhqMMVOI_1734001553
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Simona Vetter <simona.vetter@ffwll.ch> writes:

> On Wed, Dec 11, 2024 at 10:06:28AM +0100, Thomas Zimmermann wrote:
>> DMA areas are not necessarily backed by struct page, so we cannot
>> rely on it for deferred I/O. Allocate a shadow buffer for drivers
>> that require deferred I/O and use it as framebuffer memory.
>>=20
>> Fixes driver errors about being "Unable to handle kernel NULL pointer
>> dereference at virtual address" or "Unable to handle kernel paging
>> request at virtual address".
>>=20
>> The patch splits drm_fbdev_dma_driver_fbdev_probe() in an initial
>> allocation, which creates the DMA-backed buffer object, and a tail
>> that sets up the fbdev data structures. There is a tail function for
>> direct memory mappings and a tail function for deferred I/O with
>> the shadow buffer.
>>=20
>> It is no longer possible to use deferred I/O without shadow buffer.
>> It can be re-added if there exists a reliably test for usable struct
>> page in the allocated DMA-backed buffer object.
>>=20
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reported-by: Nuno Gon=C3=A7alves <nunojpg@gmail.com>
>> CLoses: https://lore.kernel.org/dri-devel/CAEXMXLR55DziAMbv_+2hmLeH-jP96=
pmit6nhs6siB22cpQFr9w@mail.gmail.com/
>> Tested-by: Nuno Gon=C3=A7alves <nunojpg@gmail.com>
>> Fixes: 5ab91447aa13 ("drm/tiny/ili9225: Use fbdev-dma")
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: <stable@vger.kernel.org> # v6.11+
>
> fbdev code scares me, but I at least tried to check a few things and look=
s
> all good.
>
> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
>

Same here, is always scary to review fbdev code but the patch looks good to=
 me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


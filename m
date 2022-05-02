Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60864517593
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 19:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82B310F194;
	Mon,  2 May 2022 17:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D551A10F194
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 17:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651511719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TNhZbt5WmLs9YdL2p377OAwSFXloJynsUEcZgN+34jM=;
 b=EAiKspRfImrtcdZ4wf21vE6xt7sOY+yxJ3xGIV+upESPXrZzXDskjMOjTuKmei09lnIb7P
 +3En3/EQeIiZjR4pRcUzqhto8e6FjjGSAqs8N+CLpr9PU2jpeG2EiB75h4iNP7Igm4jbdE
 rJ4DCmroYMklNlhC/MOcN1c+40i/lVM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-7hifPmKXM-C1pRWYUnqPPw-1; Mon, 02 May 2022 13:15:18 -0400
X-MC-Unique: 7hifPmKXM-C1pRWYUnqPPw-1
Received: by mail-wm1-f70.google.com with SMTP id
 i131-20020a1c3b89000000b00393fbb0718bso9085799wma.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 10:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=TNhZbt5WmLs9YdL2p377OAwSFXloJynsUEcZgN+34jM=;
 b=sLuPQgC7DS/ODUYh4ixsj6JBlzEtC28b1c66g0z0YR3LIqweyl2CgZ0AzCoV4z1h1g
 RqZrj47wA3AzdNQuTBcuCxJR5gH7HG0EIDtXY8S/mdMoXs7gu1ATRcHFtPIdl3g3BsCq
 h7cOwmnlFOC7ighlM8f8shCAI8vgKGAW5ODWDBfCUFWAK188H9m0PA0p2GYUlHwbr62C
 Laogu6ETg4ArrwnuD5kEvi0p9XLkb1pE1IO8rYOHV2ID7V962+sBTlkoeE4mV17tfPy+
 kPR6/N9kVMIQ8b8QiLA2dKE/yCX5O03ku1rLUMIjAFX9p0gGP79GEh3tC4/EbhuB53ld
 GyBg==
X-Gm-Message-State: AOAM532zTkxlVIZYgap9TRv4Ybsn8tz5sPEHazsqLJ8r/+I3FVlF4D8t
 hJATM1qK5J/jt8OmcEUbvXAIDqwcC7VaKliT337SdqB8LqXzbVvV0dXeMKDqe+iTf7iihJHllV3
 D7WkSOUcthD+RjqRickdOFFGJxvKI
X-Received: by 2002:adf:d1c9:0:b0:203:c4f8:dd17 with SMTP id
 b9-20020adfd1c9000000b00203c4f8dd17mr10068563wrd.633.1651511717578; 
 Mon, 02 May 2022 10:15:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsIQ70V0swN3ajpzcihZtgWd7Y7xEQmDVKoinoDZrZIjQMH2cqaPWdg9iqJElhYFpe1gjTzA==
X-Received: by 2002:adf:d1c9:0:b0:203:c4f8:dd17 with SMTP id
 b9-20020adfd1c9000000b00203c4f8dd17mr10068550wrd.633.1651511717373; 
 Mon, 02 May 2022 10:15:17 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 u21-20020adfa195000000b0020c5253d8c4sm7520081wru.16.2022.05.02.10.15.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 10:15:17 -0700 (PDT)
Message-ID: <bc6b6598-0e09-1a43-4086-e4164ab42a20@redhat.com>
Date: Mon, 2 May 2022 19:15:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/3] drm: Remove superfluous arg when calling to
 drm_fbdev_generic_setup()
From: Javier Martinez Canillas <javierm@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220502153900.408522-1-javierm@redhat.com>
 <20220502153900.408522-2-javierm@redhat.com>
 <YnABjdpGC166yIY7@pendragon.ideasonboard.com>
 <5dd80287-1b09-d02c-9f67-5a0bb0a4566c@redhat.com>
In-Reply-To: <5dd80287-1b09-d02c-9f67-5a0bb0a4566c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/2/22 18:55, Javier Martinez Canillas wrote:

[snip]

> 
>> drop the depth option to drm_fbdev_generic_setup() ? There's a FIXME
>> comment in drm_fbdev_generic_setup() that could be related.
>>
> 
> A FIXME makes sense, I'll add that to when posting a v3.

There's actually a FIXME already in drm_fbdev_generic_setup(), so it's
a documented issue [0]:

void drm_fbdev_generic_setup(struct drm_device *dev,
			     unsigned int preferred_bpp)
{
...
	/*
	 * FIXME: This mixes up depth with bpp, which results in a glorious
	 * mess, resulting in some drivers picking wrong fbdev defaults and
	 * others wrong preferred_depth defaults.
	 */
	if (!preferred_bpp)
		preferred_bpp = dev->mode_config.preferred_depth;
	if (!preferred_bpp)
		preferred_bpp = 32;
	fb_helper->preferred_bpp = preferred_bpp;
...
}

[0]: https://elixir.bootlin.com/linux/v5.18-rc5/source/drivers/gpu/drm/drm_fb_helper.c#L2553

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


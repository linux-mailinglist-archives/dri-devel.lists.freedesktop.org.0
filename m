Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE51969CB2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0609910E504;
	Tue,  3 Sep 2024 12:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RETw3OGQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1235B10E501
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725364878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V9gsRbdqhPEIKCsQpJy/x7F2uImH8BkNI5v72GFAu1g=;
 b=RETw3OGQW7l5Y/wfJwheHhz4HumHhsr9xUosn4m5HnAYuxL4HnlKUmx2EfRI6Vdg+eh6qL
 KStB/fMQ9aMSjROw0oCQduBACllaB2Cx8PK4FA2TdJlzqdCV3326jwMrwznt4vmWb95tCG
 nYRRHQWiJE1G53Kuy23U49AYmzrpkH8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-2iUWQBCqMPiIg_28QeQ2DA-1; Tue, 03 Sep 2024 08:01:17 -0400
X-MC-Unique: 2iUWQBCqMPiIg_28QeQ2DA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-374c54e188dso1154650f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 05:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725364876; x=1725969676;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V9gsRbdqhPEIKCsQpJy/x7F2uImH8BkNI5v72GFAu1g=;
 b=k3C514Lf4Q8pi1WnnRnu7oHVe9waoMEQGvGNUc6ggd4vXIqsHe4esJXABSkQwHYGoT
 b42TtFSXgKY/UPRMunJNZty9Au60uOh38EzfZZncd6xSaq5jwpsjJiRnE8Mh1TxrZm3m
 AIJQPfX8KbECCNWOiC64CTDxdcVF+WJihHLYmWKf9ys8hh/CuXkcdklhwoHac6E16501
 psKKphKrSsyB6y6SwP6w7Gbt6JMm3AOv6CurYqADi3Ic2YgIG6OgtM7CHSJ7E4x/t0WA
 RXq6jrLjAgabjKUty5BuP45nzl8LA0i68yfb5BIxH1VXSThgpe2pidw0FDpn8++CT/B1
 IZVg==
X-Gm-Message-State: AOJu0YxTBQ1CW8MGcFHSKfZXKA0bN2Z5U3BcVq2lJEcJ/gv4rffvoMLA
 pxUStYgJFHxmm7b0E5+/QvIftUbWiuBr+vSxSv7K+V5AYm9OIF0SBVZZgObT9Zy4HVNgRcyWIbw
 jqoeLUNDNk06GGfK9Lrwb8Krgz3cEPx+5XltgvvRDsxJMhMGdMkwJ4ab8IHk6qFElPw==
X-Received: by 2002:a05:6000:210e:b0:374:cf83:23dd with SMTP id
 ffacd0b85a97d-374cf83267cmr3482195f8f.2.1725364875767; 
 Tue, 03 Sep 2024 05:01:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx2bg2gwLkC+/OnEbJU244Rbdx9z+fiPs23OJRduhZ0HmBzycTM5BYbSjOgqOTznhch3vbqw==
X-Received: by 2002:a05:6000:210e:b0:374:cf83:23dd with SMTP id
 ffacd0b85a97d-374cf83267cmr3482168f8f.2.1725364875356; 
 Tue, 03 Sep 2024 05:01:15 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c23d6a38sm8407636f8f.38.2024.09.03.05.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:01:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 53/81] drm/gm12u320: Run DRM default client setup
In-Reply-To: <20240830084456.77630-54-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-54-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:01:14 +0200
Message-ID: <87frqhdjzp.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/tiny/gm12u320.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


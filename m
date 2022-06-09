Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3A6544EF2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 16:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B208412A93E;
	Thu,  9 Jun 2022 14:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4267212A93E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 14:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654784905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D9bt/rT+ACc5asHr7sl5YVnLU/QODOwZ6hb9zGalE84=;
 b=Qh6wC/HP4n2qDtl8+mCafn/lpyNqoPiI2Ln55jWtNYc8bcWcvGVqyGlksFqn5Dfehqdv8Z
 jRKoLS75g/8Rx8hIA+ntfi6j4B4uXlx7k+1Ay//+cu9cRQ+LEOFhEkJ8LkJLaodl0QFPIT
 nlqvCOw3L8HbWmHhagEt7WR0RhM/ZJw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-dPJ02CZ2N5-qFnh9rBHBDQ-1; Thu, 09 Jun 2022 10:28:24 -0400
X-MC-Unique: dPJ02CZ2N5-qFnh9rBHBDQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 h14-20020adfa4ce000000b00218518b622eso2317970wrb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 07:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D9bt/rT+ACc5asHr7sl5YVnLU/QODOwZ6hb9zGalE84=;
 b=MZ8zyzYYEzUklraA09vPlCtvbNlFtV8f6Kf+p8Pu2HYK8sB1Rtn4YcLh7fHa2JXI4O
 X1lVh2DcrNMH6GsNtXN1c7RO7svjtwZ9Q9p07EKwMNt86blu1Z/ON1dZ6A4gM5RYVjkJ
 5JoW8vPG1onJzUMNVPlD8hGT+WrINjg897X1/GCumXTkFS+h/kcl9YTnF1fMUFd9HQq4
 cLs6KTu4jzqyCI/xl79otgpJhNPlAz5HwuCuq581e5vWV3zuIN+Sy+36ic0uiK+MmmLF
 yZHTN7/FKShcE8QZ1RclfRWRJuaVY4Q7q9DPQbqvvrtW1vRVzDkC+ijfwHvJf3Sa4r2s
 D6KA==
X-Gm-Message-State: AOAM530HSt/0nXbAA5KT0cVFLZX/OuxNQL7pJSLfDsKXyat4NKxlrPZF
 TUa8IzmSzQTjARSEO5W78iQeKcbqPYn4D69JlWzKU+sCfoEFGN51N0OJzFfSBhzx0loELGPJcdl
 5Wl6vAL7xbJKx8fFFNb08qLiRJC0m
X-Received: by 2002:a05:600c:2312:b0:397:7647:2ac4 with SMTP id
 18-20020a05600c231200b0039776472ac4mr3586872wmo.125.1654784902877; 
 Thu, 09 Jun 2022 07:28:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwESbXtfgCVdHUHBlqUyB7+uBGuQskr7UH7a9ukf3MhwYxhwZpS3sh4RAgSo9rKZX/Kfrr0xg==
X-Received: by 2002:a05:600c:2312:b0:397:7647:2ac4 with SMTP id
 18-20020a05600c231200b0039776472ac4mr3586843wmo.125.1654784902646; 
 Thu, 09 Jun 2022 07:28:22 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g19-20020a05600c4ed300b0039c4506bd25sm24810750wmq.14.2022.06.09.07.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 07:28:22 -0700 (PDT)
Message-ID: <66dc8d78-ccd3-ac21-644d-26b8d20ba791@redhat.com>
Date: Thu, 9 Jun 2022 16:28:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 0/5] Fix some races between sysfb device registration
 and drivers probe
To: linux-kernel@vger.kernel.org
References: <20220607182338.344270-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220607182338.344270-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Jones <pjones@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Laszlo Ersek <lersek@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/7/22 20:23, Javier Martinez Canillas wrote:
> The patches in this series contain mostly changes suggested by Daniel Vetter
> Thomas Zimmermann. They aim to fix existing races between the Generic System
> Framebuffer (sysfb) infrastructure and the fbdev and DRM device registration.
> 
> For example, it is currently possible for sysfb to register a platform
> device after a real DRM driver was registered and requested to remove the
> conflicting framebuffers. Or is possible for a simple{fb,drm} to match with
> a device previously registered by sysfb, even after a real driver is present.
> 
> A symptom of this issue, was worked around with the commit fb561bf9abde
> ("fbdev: Prevent probing generic drivers if a FB is already registered")
> but that's really a hack and should be reverted instead.
> 
> This series attempt to fix it more correctly and revert the mentioned hack.
> That will also allow to make the num_registered_fb variable not visible to
> drivers anymore, since that's internal to fbdev core.
> 

Pushed patches 1-4 to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


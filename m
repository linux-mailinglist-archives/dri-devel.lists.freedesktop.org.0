Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD104725921
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E119510E47B;
	Wed,  7 Jun 2023 09:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE1A10E47C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686128505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dioh0Uh8M64nhVsxEDgz6W+eW/pWMCOha9EWfOMUYLQ=;
 b=VSEnU5gvIaJsiOBfsy2vUg5bvd4f2ul3+gFs81IdOAPJKyny02GvBDS0o2H1FaV7op1u2I
 BiHsvgJD3zsyy0lGng4iX2iWD11gVp9hBEukkTKiNT1PldWHJzX6b+W/YrJJaZI/hMdmEp
 GGGyn8Mz6Ix2m1oh3P7rHDeSxppToi0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-C5i6c8htMKGKrms5h6PROA-1; Wed, 07 Jun 2023 05:01:43 -0400
X-MC-Unique: C5i6c8htMKGKrms5h6PROA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f7aad897a5so55002925e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 02:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686128502; x=1688720502;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dioh0Uh8M64nhVsxEDgz6W+eW/pWMCOha9EWfOMUYLQ=;
 b=JGEgqg9gaTH0iyjNhtvxTRPEzem3xwYm/ufD1goOTcLwTXoEgq4y1+Qk+meJG7EduL
 54jACdBXUTIuwQGEKN614aWfbHMCMADRBbK9wejqsxdNds+oo7Uiz5queGNX7k2QeJnE
 pPTDo36Jus2BtbQAEabgt/Q2N/KibRN63QrUSFL+i5jM66ep67J0QnVfZeOtj2WgsLgU
 adJUHMG1M+YAgCEOVY5nZxzkln92WbUUtFtWkPI06PoYa5NJ2kRgfncwsPM1b1BwE/5C
 2v1ZYeF6UHiwcSrzFQw4rVpij7IItzJTa2zH6ljwrlG7ZqxApTau/AvAN/0qv3vYu3iz
 t/nA==
X-Gm-Message-State: AC+VfDx1qFcCPdb9AoQ1bk1u5XSdEKLXEsbzx6rne4p1lZKAWadqRPB0
 wd+hs/6vnMHcNY4RpEqbIb9kTw/F6uPH+bXr9n9LsDF5XVGuOAiQXAQTVR2wqLAo5hcIO58939d
 RpR09gNdWApVSbYTTHmj+6uUiyTyz
X-Received: by 2002:a05:600c:22c4:b0:3f7:f398:e1cc with SMTP id
 4-20020a05600c22c400b003f7f398e1ccmr353832wmg.36.1686128502806; 
 Wed, 07 Jun 2023 02:01:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ72JJUmKTY0S/fTapCQpRDv/nnMwi2EWc1cCGgNDHz8vB5pxi81zoyZxiDc07QRDM6iPj/yxA==
X-Received: by 2002:a05:600c:22c4:b0:3f7:f398:e1cc with SMTP id
 4-20020a05600c22c400b003f7f398e1ccmr353823wmg.36.1686128502608; 
 Wed, 07 Jun 2023 02:01:42 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q12-20020a05600000cc00b003093a412310sm14814796wrx.92.2023.06.07.02.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 02:01:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 13/30] fbdev/metronomefb: Use hardware device for dev_err()
In-Reply-To: <20230605144812.15241-14-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-14-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:01:41 +0200
Message-ID: <87cz27fxxm.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Replace the use of the fbdev software device, stored in struct
> fb_info.dev, with the hardware device from struct fb_info.device
> in load_waveform(). The device is only used for printing errors
> with dev_err().
>
> This change aligns load_waveform() with the rest of the driver and
> prepares fbdev for making struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


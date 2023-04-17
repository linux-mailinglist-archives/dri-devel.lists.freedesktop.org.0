Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1016E4AFE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 16:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA7D10E52D;
	Mon, 17 Apr 2023 14:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068A510E52D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 14:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681740715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JdrcyZAOFOsOlxSA+j6D9M3WAvxDx6zNk4+FSXcrw7o=;
 b=WkaySFwVWKTJqKZ5MUYz0lzK1E7lp0MEKBSjH5cW8Cv8hsfO2RzMj+4tkQwRUJ0mHqlh9n
 Bw2fVmybwLeezj9HWWr1lTp357Ub4ZFfHxUlRiba+Fx86NopMjDOl+5z/lfqVcfMU9QwHO
 LOCLnz2cWmRoHDE7n9EtfvxRW93B6+w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-jma8fXzuOPeLitazCKlQ5Q-1; Mon, 17 Apr 2023 10:11:54 -0400
X-MC-Unique: jma8fXzuOPeLitazCKlQ5Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f08101e98cso5585835e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 07:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681740712; x=1684332712;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JdrcyZAOFOsOlxSA+j6D9M3WAvxDx6zNk4+FSXcrw7o=;
 b=gCZO3uyTKsGDHz/l7jrZYVf9GTPskW48nEzVF15r2pU7SCxD2HDy9kHlTYhHRB7kGJ
 Ne2tMbJ3RCVz503Tn+o2uZf2ObrZ7vr6HvtKZmRV6AK4LoKevCMt5lREsxsTyBPLXuFM
 ib7CyUMDGF1IQ9fRuZZhcC2h02d6PCfaC3FwfZ1woeLISm5UFLIKaG4Uu0aAC44pgQp7
 Ob5cELSBZoSszQ19NNXLRniSrDLyaq5kGrH7t3/XZ+la+otFEPk17Qs2Nd0Y/4ce8+Vp
 63ElSNC/+wEluLWGSaLPkhr9exb1yjAGu4TNA2RQHJMXUxi1wHyE6uLYqrmKkD7vfAZK
 bP8Q==
X-Gm-Message-State: AAQBX9fvgw9kdP3jkrdYgjBcXZ6apt1WyeuyH76fvK71+HjfMePSaVKk
 BYpiHbmQiFrPnftOu7FeKWXEPZXdc8Bb1y/FLcahWYdyFfcaKKk1I2SpSCBS8vCmH5082b4BNto
 00St4bU5HJ8oKz9nz5Y9EX9q+Eb6RB74jWpdw
X-Received: by 2002:adf:f5c3:0:b0:2fb:be8b:133b with SMTP id
 k3-20020adff5c3000000b002fbbe8b133bmr415055wrp.25.1681740712749; 
 Mon, 17 Apr 2023 07:11:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZmGmpnB4oyW8W3LWjU/t86gutRjwMd6EIYR4NgbzJ/HnJjA8RxyFR7+p9+OugmHD8lFfIIow==
X-Received: by 2002:adf:f5c3:0:b0:2fb:be8b:133b with SMTP id
 k3-20020adff5c3000000b002fbbe8b133bmr415032wrp.25.1681740712447; 
 Mon, 17 Apr 2023 07:11:52 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k10-20020a7bc30a000000b003e20cf0408esm12045570wmj.40.2023.04.17.07.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 07:11:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux@armlinux.org.uk,
 airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH 4/4] drm/armada: Implement fbdev emulation as in-kernel
 client
In-Reply-To: <20230330073046.7150-5-tzimmermann@suse.de>
References: <20230330073046.7150-1-tzimmermann@suse.de>
 <20230330073046.7150-5-tzimmermann@suse.de>
Date: Mon, 17 Apr 2023 16:11:50 +0200
Message-ID: <878reqegyh.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Move code from ad-hoc fbdev callbacks into DRM client functions
> and remove the old callbacks. The functions instruct the client
> to poll for changed output or restore the display. The DRM core
> calls both, the old callbacks and the new client helpers, from
> the same places. The new functions perform the same operation as
> before, so there's no change in functionality.
>
> Replace all code that initializes or releases fbdev emulation
> throughout the driver. Instead initialize the fbdev client by a
> single call to armada_fbdev_setup() after armada has registered its
> DRM device. As in most drivers, aramda's fbdev emulation now acts
> like a regular DRM client.
>
> The fbdev client setup consists of the initial preparation and the
> hot-plugging of the display. The latter creates the fbdev device
> and sets up the fbdev framebuffer. The setup performs display
> hot-plugging once. If no display can be detected, DRM probe helpers
> re-run the detection on each hotplug event.
>
> A call to drm_dev_unregister() releases the client automatically.
> No further action is required within armada. If the fbdev framebuffer
> has been fully set up, struct fb_ops.fb_destroy implements the
> release. For partially initialized emulation, the fbdev client
> reverts the initial setup.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


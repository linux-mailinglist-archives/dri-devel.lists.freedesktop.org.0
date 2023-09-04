Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E68D47917BE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 15:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026FF10E356;
	Mon,  4 Sep 2023 13:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2DF10E1F6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 13:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693832712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JGDuo0fidzIyb7lQTlkFMMjSr0JbZNOTrueOM/c6sEY=;
 b=T5zWLRHrBVs1USqX/tvB5tN2WMDSXsH1eXhwvC8fsQ+zR+BLJAY+ZK+8eQX7saTwKWQtjA
 4LM34LkAfFrcqjbiVQVcW8ckeNShrt27IxgXRAwe5mjqnMOdl1HwmMOcNcWf86wHbxP+xC
 eyEtsPaVLx0lEyVLKbzyky9KEXT88W0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-0gA6It4qOse5cwtcFIKsBQ-1; Mon, 04 Sep 2023 09:05:11 -0400
X-MC-Unique: 0gA6It4qOse5cwtcFIKsBQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-31ade95a897so809840f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 06:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693832710; x=1694437510;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JGDuo0fidzIyb7lQTlkFMMjSr0JbZNOTrueOM/c6sEY=;
 b=bGSXRm4/gKj7yDvSAt7ovuhl02dilOoXqL2xJjdm6ztnhYil0nk+cxBqnVWEPlILhK
 DGsLgymMH/CVY6MYTcBomqMo4cSJOukMoPt4+eWKN5sp6LfT0VUHzHLKYznm3hx8/yNb
 zqhk36mD2w2pF0GzFLkK9dk5iKg33idiY11kybBMynKFQaPn0PJAPaEg009dwZ45t+A1
 /+uLofVO62ArFwZWZgCBoMNTwV+n+nbwHSmi7ISS/xkIq4gjB9t5pfXQckPl3hniaOPS
 /mln3yO9Qn4YcQqFYA23hcmLVyrBRqKv/OxvOa10P1XmI9iD0O8rzwIdb8+YJsAg7j/m
 Z90A==
X-Gm-Message-State: AOJu0YyQ/LGi+YGOcvGtvqg+jtUF95kcStejCid4/J6YoObzThlCET2C
 ePzzPq01GpsqhCujYRvqY6owdae7DJTggf5D8WJbVOQWoDafDKsnlbZ9V1Zkz4HCl0CL3wZ/558
 nNTX5tlxlWRqWIHTntUNau0HQitmi
X-Received: by 2002:a05:6000:1cd:b0:317:5de3:86fb with SMTP id
 t13-20020a05600001cd00b003175de386fbmr7162732wrx.10.1693832709956; 
 Mon, 04 Sep 2023 06:05:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXjVWzCt7e02jUxRGN8dZzdROG6Y6I7k2Dqt3rSE/+w+cQmE9Wq23/UuCwnni8eIyMrEIxCA==
X-Received: by 2002:a05:6000:1cd:b0:317:5de3:86fb with SMTP id
 t13-20020a05600001cd00b003175de386fbmr7162714wrx.10.1693832709657; 
 Mon, 04 Sep 2023 06:05:09 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f7-20020adffcc7000000b0031c7682607asm14485436wrs.111.2023.09.04.06.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 06:05:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Subject: Re: [PATCH 2/8] fbdev/udlfb: Use fb_ops helpers for deferred I/O
In-Reply-To: <20230828132131.29295-3-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-3-tzimmermann@suse.de>
Date: Mon, 04 Sep 2023 15:05:08 +0200
Message-ID: <874jka6qd7.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bernie Thompson <bernie@plugable.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Generate callback functions for struct fb_ops with the fbdev macro
> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
> the generated functions with fbdev initializer macros.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Bernie Thompson <bernie@plugable.com>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

[...]

> +static void dlfb_ops_damage_range(struct fb_info *info, off_t off, size_t len)
> +{
> +	struct dlfb_data *dlfb = info->par;
> +	int start = max((int)(off / info->fix.line_length), 0);
> +	int lines = min((u32)((len / info->fix.line_length) + 1), (u32)info->var.yres);
> +
> +	dlfb_handle_damage(dlfb, 0, start, info->var.xres, lines);
> +}
> +
> +static void dlfb_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
> +{
> +	struct dlfb_data *dlfb = info->par;
> +
> +	dlfb_offload_damage(dlfb, x, y, width, height);
> +}
> +

These two are very similar to the helpers you added for the smscufx driver
in patch #1. I guess there's room for further consolidation as follow-up ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


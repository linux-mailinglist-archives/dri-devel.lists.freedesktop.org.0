Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCF27EDFD5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 12:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086E710E275;
	Thu, 16 Nov 2023 11:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F1510E272
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700134109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v5/8ZzCVrCdsxMalmcenuz1AcsZBPFj3JQUIdn0FWWw=;
 b=QsOdPp2ROIDx8aOncPu+l8WQ/Tx2XgF6x7jC5w3AGMY9HsecM8/5N4VeM4+5Gmmfw8fWsj
 oWGbu9MKVXvyIaCCGHYBeFZIZ7glc4Enkep6MZlaulGz9bzAD0tQX1IRXU4+2xKhQBXbZP
 q9hRzgPkayxqB+Nyxs23eBSpQpldAok=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-Hr_hj1X-OuWRtm2saK76Kw-1; Thu, 16 Nov 2023 06:28:28 -0500
X-MC-Unique: Hr_hj1X-OuWRtm2saK76Kw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-32cef5f8af5so862822f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 03:28:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700134107; x=1700738907;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v5/8ZzCVrCdsxMalmcenuz1AcsZBPFj3JQUIdn0FWWw=;
 b=tA4cCTUS7BBKGdfWhK1RB2vrcMpFpcEQsuYidl0Eq0FtjHw7KfER8+5XBVTgDKI90Z
 ypfYofnNNxBWHTWLwVq4cco6ZtU1TcGxR6CBQ0pN/ErntUSE635B1qn1I96jEvtYZZ5c
 HnkfjDXMBa3CW3r679ptSm61lJE+CLlvsQs+lFglHcU3WFqpIrv+lXqLXQFSu0v7+tDP
 GwQxeCbK/brGbLlBKdew3Ngy0eErDFXaprC/I1ArGo6a1xBpKYBk1R+oNrN3iE3/pAdD
 Q9gfmwPPx9RLbjpJUsU8LVGEWcoh6gczypH5nMh5q6ZeVFXe4X71zywfNOlX/6AtJc2+
 WswQ==
X-Gm-Message-State: AOJu0YyUUz7xgfpKusjR4+82A4fj0s8BvAxzHsVzZUDjDNI6ofByHF2H
 QXIN5M1HpOJiwklPEAfIwRLOu77WlPAC9hA6DWjrjWvKU2RgPuiwEehxrixN9Xr90wXo1PnAzJ6
 Y0TwINKYechyizC0BcdnZsOUI6xtx
X-Received: by 2002:a5d:5987:0:b0:32f:8a45:937f with SMTP id
 n7-20020a5d5987000000b0032f8a45937fmr1746646wri.2.1700134106956; 
 Thu, 16 Nov 2023 03:28:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIcOMB0JSgLEWjYCwKqh/p/oabxJ7+9I26X5aSBxMMD1u1HUxMMcKxJBMQZRc3RqGkMwIVZg==
X-Received: by 2002:a5d:5987:0:b0:32f:8a45:937f with SMTP id
 n7-20020a5d5987000000b0032f8a45937fmr1746627wri.2.1700134106654; 
 Thu, 16 Nov 2023 03:28:26 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j9-20020a5d6049000000b0032710f5584fsm13320749wrt.25.2023.11.16.03.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 03:28:26 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 21/32] fbdev/clps711x-fb: Initialize fb_ops with fbdev
 macros
In-Reply-To: <20231115102954.7102-22-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-22-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 12:28:25 +0100
Message-ID: <87v8a22azq.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Initialize the instance of struct fb_ops with fbdev initializer
> macros for framebuffers in I/O address space. Set the read/write,
> draw and mmap callbacks to the correct implementation and avoid
> implicit defaults. Also select the necessary helpers in Kconfig.
>
> The driver previously selected drawing ops for system memory
> although it operates on I/O memory. Fixed now.
>
> Fbdev drivers sometimes rely on the callbacks being NULL for a
> default I/O-memory-based implementation to be invoked; hence
> requiring the I/O helpers to be built in any case. Setting all
> callbacks in all drivers explicitly will allow to make the I/O
> helpers optional. This benefits systems that do not use these
> functions.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


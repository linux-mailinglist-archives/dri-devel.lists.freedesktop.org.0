Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12695826AA9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F5110E1CF;
	Mon,  8 Jan 2024 09:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453FE10E1CF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 09:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704706051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zUbxtUWHK+UVvc38nQ4ZugcC7K2U909xpxfpjqV/w1A=;
 b=ci3sW0DC3u6eQea0p4Vh6TKysN/wUfeSUOH3tEP//UFucm2JY+7Op8c5clf11nqI1K4PoG
 ofcg2di2CRWR+hfGaj02HS7nU1f2/GaG/YoqQ+/nXzxB2Poj2HDWXbuY4NKYn3j1JWnOfD
 hyyIeGRH5l4OTPBsST/6XeGi9/UF52I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-BMUmMyLlNGCrDETzp9oDMw-1; Mon, 08 Jan 2024 04:27:29 -0500
X-MC-Unique: BMUmMyLlNGCrDETzp9oDMw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40e34df6fdcso12850475e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 01:27:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704706048; x=1705310848;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zUbxtUWHK+UVvc38nQ4ZugcC7K2U909xpxfpjqV/w1A=;
 b=bLoZ+ydbBX4xgO0mnoGOTqUQq7wcesQi2YkHXiSNhiLIFHklyRsFbIyJan2TA2xaqb
 lXgo2wK812AaLcs30wIKFr8IiFKy4Kjy8dJ6jzxcoOZ5wB9XFgtZAhJwQW0lTnyVzQlq
 pKZjGe1z4mr3rFwJ4BCG19kVCEuKTWvbjFRghgZNWfoMoztv+/11pJsKHvCXjFX0Zhpb
 rzmKBmdXUGWCgdEDbPJTx05TAQfNzaTUwC9VxShpv5Lyh9n9KdgWnO2nSzntW2bgM5Oc
 grILr1n0ACsLaCNx29MPtmVLnO++Nx6ZRkaXoyv8tPLIox0nXiah0pAxiLfo5QTWjUrX
 EEMA==
X-Gm-Message-State: AOJu0YwamWQhLkphiP/iKhdAoXXfmq2rXl8prRaBgkggSXcnJjQCfauJ
 t8k/HHiUe5NwOHQetKuVdx8lO1eQya5Lr4UqxgUQvxph3Jfx9o+MDkeph+TWt3BTKspoWhRl3x7
 UiRe8hF41trlfET1AKlFKRQgtgtRKbMGu4Y6N
X-Received: by 2002:a05:600c:3b14:b0:40d:5cd1:1786 with SMTP id
 m20-20020a05600c3b1400b0040d5cd11786mr1571520wms.174.1704706048554; 
 Mon, 08 Jan 2024 01:27:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJwTzEktgmk13wBG4wM5BWE4ZTFCnOS+vrwmv7XAHVX+yfsAAMJxd3rfnXO3a3bF11iERhJA==
X-Received: by 2002:a05:600c:3b14:b0:40d:5cd1:1786 with SMTP id
 m20-20020a05600c3b1400b0040d5cd11786mr1571507wms.174.1704706048095; 
 Mon, 08 Jan 2024 01:27:28 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c4ecb00b0040d2d33312csm10353376wmq.2.2024.01.08.01.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 01:27:27 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, drawat.floss@gmail.com,
 deller@gmx.de, decui@microsoft.com, wei.liu@kernel.org,
 haiyangz@microsoft.com, kys@microsoft.com, daniel@ffwll.ch,
 airlied@gmail.com
Subject: Re: [PATCH 2/4] fbdev/hyperv_fb: Remove firmware framebuffers with
 aperture helpers
In-Reply-To: <20240103102640.31751-3-tzimmermann@suse.de>
References: <20240103102640.31751-1-tzimmermann@suse.de>
 <20240103102640.31751-3-tzimmermann@suse.de>
Date: Mon, 08 Jan 2024 10:27:27 +0100
Message-ID: <877ckkdvk0.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Replace use of screen_info state with the correct interfaces from
> the aperture helpers. The state is only for architecture and firmware
> code. It is not guaranteed to contain valid data. Drivers are thus
> not allowed to use it.
>
> For removing conflicting firmware framebuffers, there are aperture
> helpers. Hence replace screen_info with the correct functions that will
> remove conflicting framebuffers for the hypervfb driver. For GEN1 PCI
> devices, the driver reads the framebuffer base and size from the PCI
> BAR, and uses the range for removing the firmware framebuffer. For
> GEN2 VMBUS devices no range can be detected, so the driver clears all
> firmware framebuffers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


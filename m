Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B93AEB20B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1AA10E98C;
	Fri, 27 Jun 2025 09:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TjKzvk9/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A549E10E98C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751015195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=weTtDMWNN7YSLXQgrJlrHEZYSSuXxc+tmwDFpPNc3l4=;
 b=TjKzvk9/8p3MZ4oD55gsIgeYcc5OzifdIflAFxnc15+tI+kiKAqXAgvR2A97GEYTroyNGN
 ofC+88rfd4ApCbYr0RxO3PRruBiRj1YMvFV8H4dZsqx2Ri5nOJyzPMUeh+ECmV10pU0OwP
 pDd/gejSYqQWOroALLLFbq4A912B9vg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-OX-jAN7KOjGXPPKewuYr2w-1; Fri, 27 Jun 2025 05:06:34 -0400
X-MC-Unique: OX-jAN7KOjGXPPKewuYr2w-1
X-Mimecast-MFC-AGG-ID: OX-jAN7KOjGXPPKewuYr2w_1751015193
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4537f56ab74so11853955e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 02:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751015193; x=1751619993;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=weTtDMWNN7YSLXQgrJlrHEZYSSuXxc+tmwDFpPNc3l4=;
 b=Vs1eQLTsuKAtsOrZM8z3JPd43DTmUX9YRsA4YZiVQaam6rEo3SOL6D9jlOSAPyb+rW
 YDmNFWXvIMk8Hd0uJGyMYRrborYodUUMz18x8OIZU0UfTWQXNStxWRgAT2WgSBbPhfO2
 CgjS7xo6hn1AfU2M5Gs9kgAYZMTG5SGtQoc54hFlzVjLdvqnrWzrJLHI/80dYpIg4kqK
 nmPXIwxvQXVRKTP1I29EuD+ULvMyrtriYqOnqeESejpLjANiHlmJc57giuBRQMN+m2qY
 nkiK2wmABRszYbRb816ptposYisPUHslICyhwyqIzzWrWs9Z1+/nWctZsrtBRgzWZOiA
 oQBw==
X-Gm-Message-State: AOJu0Yyx8wjJopRtQHssXLTG21VRZtoHX1iIVE7q8RuKt2sr8roQ2Gjt
 YB4YgnitQbJ+te66SpGdS7crub0jI/bfXhpMtYIffny2jyd1SPbmSloi0pbvUE1Gm8JdxTAiNmv
 wqmX/mwZT+HnJSWq2KbljWXz5hb5JZnD11VZiwmJX77nArrOChf50EAwM11ZIb7/t3XMlqg==
X-Gm-Gg: ASbGncvgIc81K68AEQ1I0JKZBWQnO9IDjMMFRZmv2AOhxy/U+lRml5v6wFM0CuZYfi3
 uLgKY2w3fid5RT6yDzX5QMl0xnjiG+R75UbYT5l2VLYEm8cNF7E5RSN/fqy0B4ivMjjvPZM4hmW
 XogOh/4BeNU+vWu0PaOravUAUVADKEqhISpIGL8L1r/grmUrKnxBXZwbrI5OOGk8/e+jQR93ysb
 ZyiiFpAk3ah1XdyVmoflm9VLNCFjtrxt/MJTLoTTqG/Gf3hhNs9fHvwgEIxPCwqhWUh0kCbu4o3
 RJbodOU+Yjjutosk8HhlkUr3YtETbY+kZmoZVaLn0ATfSNoPqU1r7ZfxPlAQS4BegyGPxCX8NRG
 O7qRg
X-Received: by 2002:a05:600c:3594:b0:450:d01e:78ee with SMTP id
 5b1f17b1804b1-4538ee6e8f1mr23038455e9.24.1751015192900; 
 Fri, 27 Jun 2025 02:06:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4Mvx/qWgWpxdan50sihI5BekWcumExGV3A3PH4UaTNsxDTsLKLACD2J9WcWAGdluKQIYFqw==
X-Received: by 2002:a05:600c:3594:b0:450:d01e:78ee with SMTP id
 5b1f17b1804b1-4538ee6e8f1mr23038055e9.24.1751015192410; 
 Fri, 27 Jun 2025 02:06:32 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3fe0efsm43771555e9.24.2025.06.27.02.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 02:06:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Anusha
 Srivatsa <asrivats@redhat.com>, Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 2/5] drm/panel: panel-simple: make panel_dpi_probe
 return a panel_desc
In-Reply-To: <20250626-drm-panel-simple-fixes-v2-2-5afcaa608bdc@kernel.org>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
 <20250626-drm-panel-simple-fixes-v2-2-5afcaa608bdc@kernel.org>
Date: Fri, 27 Jun 2025 11:06:30 +0200
Message-ID: <878qldd04p.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 538ajP8svC_I2REjKHqIWeCHBiLHHsutLPy87i32FYI_1751015193
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

Maxime Ripard <mripard@kernel.org> writes:

> If the panel-simple driver is probed from a panel-dpi compatible, the
> driver will use an empty panel_desc structure as a descriminant. It
> will then allocate and fill another panel_desc as part of its probe.
>
> However, that allocation needs to happen after the panel_simple
> structure has been allocated, since panel_dpi_probe(), the function
> doing the panel_desc allocation and initialization, takes a panel_simple
> pointer as an argument.
>
> This pointer is used to fill the panel_simple->desc pointer that is
> still initialized with the empty panel_desc when panel_dpi_probe() is
> called.
>
> Since commit de04bb0089a9 ("drm/panel/panel-simple: Use the new
> allocation in place of devm_kzalloc()"), we will need the panel
> connector type found in panel_desc to allocate panel_simple. This
> creates a circular dependency where we need panel_desc to create
> panel_simple, and need panel_simple to create panel_desc.
>
> Let's break that dependency by making panel_dpi_probe simply return the
> panel_desc it initialized and move the panel_simple->desc assignment to
> the caller.
>
> This will not fix the breaking commit entirely, but will move us towards
> the right direction.
>
> Fixes: de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


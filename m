Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4196D91D8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A0210EB32;
	Thu,  6 Apr 2023 08:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3E410EB2F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 08:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680770491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pm1SmHCiXVJgB9qh3meEK0gPp/5pA8a4oPlDt/MLg/0=;
 b=KkQLf/7MK6kL+XEvxczO3IbOZMCHUvs3NDf5ffzJdvkmHHHWAm/ZWh33nmH2LrWvugyPPU
 NNBB3fc4bg1UCkNs/JeTFyA/kyBD19RZE1tYlxnlSda5eayXCKakkSqz7fjAQHLwwNQEgV
 52YUiH9drPpZiF8WY7JnbSbrejW1FsY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-BSMb9D3vPY2CYY0M46UzEQ-1; Thu, 06 Apr 2023 04:41:30 -0400
X-MC-Unique: BSMb9D3vPY2CYY0M46UzEQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 r11-20020a05600c458b00b003eea8d25f06so18460791wmo.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 01:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680770489;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pm1SmHCiXVJgB9qh3meEK0gPp/5pA8a4oPlDt/MLg/0=;
 b=GxwZhJX35Ky1H4q3duE3f1r9RVAJq8R+i/2ZbuxIvWy8eW8xHuXg8afinHCL5JyRjZ
 c01ueg7P6/u+9js1dARYrzM1ai1cJ3vp0kY02p5GlL/CK06UZBU2Aw5OB0cGx94BR1nk
 iO9zz8/juCx1m7hqnp5A/GYzvPwOS6jkz3J7/8wdtC/OfsGfGOi4ZYQR8FV5n9NMcrjD
 82KsZoeNf0YPbb3GqTNMS7GxihW6SZGHfqsooAp/drQhSM+uVcmoFvJBXSFXEmCNonlH
 cjqtbPToi7Pfw0mpX49VNJMVUkdmi9uD455mw72ggVfjE6I4m7AHqMgCvyM5HzcFKG8Z
 Cntw==
X-Gm-Message-State: AAQBX9dLRtIeRyo4Q1NfvMmH8eRtCkRNb+ZOQQOvAda0EvqOQu7/WLcB
 Cs+n3ylzjTj/IQwkR1AmtJqGkAb64bCZaWmI/aHVcfuMZGImQRXGozIPJFPpk36xuUrsARxyuao
 rj1NOkKrVUhsit6iooYvAWyCIW/IZ
X-Received: by 2002:a5d:6309:0:b0:2e4:cc81:8a80 with SMTP id
 i9-20020a5d6309000000b002e4cc818a80mr6460707wru.26.1680770489349; 
 Thu, 06 Apr 2023 01:41:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350am5itvNAUUxuCrbzZq5VJLvE93M04g9G8abPWVJqsX1oLJzDxvMUuO5eiedGuioDNExXmAnQ==
X-Received: by 2002:a5d:6309:0:b0:2e4:cc81:8a80 with SMTP id
 i9-20020a5d6309000000b002e4cc818a80mr6460696wru.26.1680770489074; 
 Thu, 06 Apr 2023 01:41:29 -0700 (PDT)
Received: from localhost ([84.78.248.32]) by smtp.gmail.com with ESMTPSA id
 t13-20020a5d534d000000b002c5d3f0f737sm1136563wrv.30.2023.04.06.01.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 01:41:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel.vetter@ffwll.ch,
 patrik.r.jakobsson@gmail.com
Subject: Re: [PATCH v4 1/9] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
In-Reply-To: <20230406083240.14031-2-tzimmermann@suse.de>
References: <20230406083240.14031-1-tzimmermann@suse.de>
 <20230406083240.14031-2-tzimmermann@suse.de>
Date: Thu, 06 Apr 2023 10:41:27 +0200
Message-ID: <87r0sx8kso.fsf@minerva.mail-host-address-is-not-set>
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

> From: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> This one nukes all framebuffers, which is a bit much. In reality
> gma500 is igpu and never shipped with anything discrete, so there should
> not be any difference.
>
> v2: Unfortunately the framebuffer sits outside of the pci bars for
> gma500, and so only using the pci helpers won't be enough. Otoh if we
> only use non-pci helper, then we don't get the vga handling, and
> subsequent refactoring to untangle these special cases won't work.
>
> It's not pretty, but the simplest fix (since gma500 really is the only
> quirky pci driver like this we have) is to just have both calls.
>
> v4:
> - fix Daniel's S-o-b address
>

I believe they want to have their Intel S-o-B as well. I know that dim
complains but that's what usually happens with danvet's patches AFAIK.

> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> ---

Patch looks good to me. Although I wonder if should just be dropped in
favour of yours patch since are now part of the same series?

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


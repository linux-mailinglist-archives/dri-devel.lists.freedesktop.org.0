Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAADF78C078
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71B110E171;
	Tue, 29 Aug 2023 08:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F0010E13C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 08:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693298463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q157Ab0b7OLfZnZw3+Tm9BEAhxi0YbIjWdPL/BQhf3U=;
 b=Zh/kxomquD3cZBBuZmYz7HPCpCN/RNskf0cgm8Jcj2lGypYgZqprQAwu4LK7JXUeCRmSRK
 Hdoc14Q1+JXLmgG0Oehz1svRRGno9+N1O8b8qXRYOASMCwjFDxL6XO9/QjRSP8kyhSRmOX
 VERXqQZ2LBKVTFlsXHXwpLa7YBcViWg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-05D0UCCeO4yYR9LNfqc5zA-1; Tue, 29 Aug 2023 04:41:01 -0400
X-MC-Unique: 05D0UCCeO4yYR9LNfqc5zA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fe1521678fso27993895e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 01:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693298460; x=1693903260;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q157Ab0b7OLfZnZw3+Tm9BEAhxi0YbIjWdPL/BQhf3U=;
 b=UrzJy20iIALKycwhPLjOOWGTugoLDE6A/+HhdwoSpEpYp34b38jK0FYsf4QhH3okNJ
 ZD1plZQz9WNeqjKeKk8wz4C/nG8g4CEig+D+bMECuksof4oHvr1DSNVggO6UEAdzS6rN
 GNPZHlWxEswLOROhL+dkimc00OMK9KOlher2JOimHyskDmH8DaYTo4ex+XnD7F163WrW
 7n0NqIleKMrWwFuDOMUAqlbAYX0/HnyizaFFOn7IBU6C7W4lYNR3r0mfZpOnW4vbJEKa
 MsO3ETcaqBKRX89jX2FPZaLvbmsAwyhy2+MdYdU8PQBzP8OiwEG548weQ56yc5v9xLcn
 eMFw==
X-Gm-Message-State: AOJu0YykqsvkqR38rpvQxtQ3hDoLVIjlwYT+x1Y4DDh+WeoBa6r0vlUK
 yID55PcwoK6pdagFqSW316KbmgurWqQY772BkyU51LElp0OOiAdIy7yC0NAfT7qncf5HVN8AZGu
 oSfqJSRkqlfnsFQq9ED1PfKCSDuWJ
X-Received: by 2002:a05:600c:2307:b0:3fe:687a:abad with SMTP id
 7-20020a05600c230700b003fe687aabadmr20322773wmo.20.1693298460824; 
 Tue, 29 Aug 2023 01:41:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHr0o6QR4aphUwmh+kp4NdvHLJoBFExvgRu0tylkhyQ2rbFHYWe6KAKoW0+WNE05NK6Ylc0Iw==
X-Received: by 2002:a05:600c:2307:b0:3fe:687a:abad with SMTP id
 7-20020a05600c230700b003fe687aabadmr20322759wmo.20.1693298460437; 
 Tue, 29 Aug 2023 01:41:00 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 13-20020a05600c024d00b003fe2bea77ccsm13260342wmj.5.2023.08.29.01.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 01:41:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 2/8] drm/ssd130x: Fix screen clearing
In-Reply-To: <c19cd5a57205597bb38a446c3871092993498f01.1692888745.git.geert@linux-m68k.org>
References: <cover.1692888745.git.geert@linux-m68k.org>
 <c19cd5a57205597bb38a446c3871092993498f01.1692888745.git.geert@linux-m68k.org>
Date: Tue, 29 Aug 2023 10:40:59 +0200
Message-ID: <87zg2atf50.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

Thanks a lot for your patch.

> Due to the reuse of buffers, ssd130x_clear_screen() no longers clears
> the screen, but merely redraws the last image that is residing in the
> intermediate buffer.
>
> As there is no point in clearing the intermediate buffer and transposing
> an all-black image, fix this by just clearing the HW format buffer, and
> writing it to the panel.
>
> Fixes: 49d7d581ceaf4cf8 ("drm/ssd130x: Don't allocate buffers on each plane update")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> ssd130x_clear_screen() is only called from
> ssd130x_primary_plane_helper_atomic_disable(), but this never happens on
> my system.
>

AFAIU this should be called if the outputs get disabled.

> Tested by adding some extra calls to ssd130x_clear_screen() at regular
> intervals.
>
> v2:
>   - New.
> ---
>  drivers/gpu/drm/solomon/ssd130x.c | 47 +++++++++++++++++++++++++------
>  1 file changed, 39 insertions(+), 8 deletions(-)
>

The change makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


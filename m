Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF20BD088FC
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 11:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC7610E88B;
	Fri,  9 Jan 2026 10:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="STg+EjJh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198D510E88B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 10:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767954665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fmV/NKJSbEeFZm+j3DpikZoea+NQWkrQbLuu4uv5h2A=;
 b=STg+EjJhrSnfeBTLsm5e7qP08aGLuZDi1YIWrOjtacN9tVc5TtaZwyMkKIvBsSKZvYrYlQ
 P7uXU4/FBFew7bysO8NGMoNaj5h3nFmUay1aS7ePP4GCqXuVU1PVXsL6tcASW2Ma0sUzX9
 T8yV+QK5JqqKY9Il/N64cxhlf4atNdE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-pn1vW8_jM2y0YM_L5gKCqg-1; Fri, 09 Jan 2026 05:31:04 -0500
X-MC-Unique: pn1vW8_jM2y0YM_L5gKCqg-1
X-Mimecast-MFC-AGG-ID: pn1vW8_jM2y0YM_L5gKCqg_1767954663
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-430fc83f58dso2390298f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 02:31:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767954663; x=1768559463;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fmV/NKJSbEeFZm+j3DpikZoea+NQWkrQbLuu4uv5h2A=;
 b=pd6zFCEKQ4H9DSk7KGEWu1b1NYwKCAJZSxdQ7A1TgdYG3wP9PMdb5e+dp4R9zi5xK/
 BbYeb4I3oYVozHoiqMFfrEAfMtkkenNVwBh488atzKtOo6gdg2oc0Bc+tN/YJUH8a1Sw
 TQbdMJmT+tE0vqTyIM2POOiP+Nb0G59IjhI0X669awxJsN0gj1TVsGxoi3//IN1JamiW
 2kPHKNRZI7Q10ThC53TN23poMYEYuu7UK8nw3UAfJ+sOiHKrOKKZ0ifhlpT3KdZCznFw
 e8tpn2Wb54vqKCXWKBJd6boMMuWVZQ+Z1cn2uoRSFSIQ8ww5hXvKCYOcyDbL6YQLFVEn
 z1zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlbLlH1XT+1fMQ7BgUjvZ1r34AaJSGhwnHP0gnD+l7HRRoqZygX+695jjjtw6Wt1FmOm8b7e5PSHQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm02g6uxnnHw8p87J/OxTnOQotkspuZ2+De+5NsCbz8Bi6O7nu
 eNEkWAkU1ddxTVgqm23wQli03yCrIyA+gxkfQq1TLbQTbhWx9OvFb8q84v5OGvFID68T4mJBY9z
 NAuptucZlQ3JpWIPm7xyrzpT7wK3ff+Sa1x5AVr4930ttgFSQrITd5AIGvuiqh74OzxyyGQ==
X-Gm-Gg: AY/fxX4LIUkv7VFtv2CrH6NwHhoWD5388rOZaR/1ITnhadhJrh6lPgCAHagTZEe8PsO
 kydo2Pxk0LADJZaIZtK/gGrUzBZ/BUmAc9daa8SldXAsdmkVnGDIKHEfmoWW9abmrLkAlI84R3j
 qePGYnoE29r0IUGooKW6ZxQpnMr/YbhCWpsfA8JPxEdBSzRK9r6GTvxy5f8X+INnCfmw4tS7VMM
 KHvc58MuGgpkW8bVoqVn3ybmSFWhPwi/mtCuPiKWmmEPfW1YHYzT44MM6F8+JCKR20bbVM0YxoS
 9Y71sJ0fE3auJmSpZ3vHXU308lRhQTGFrhd37sEuFdu/NXkbPJBKaloTkSvbKX3Eqb637/Zbbk3
 U0dBDc6ytwVI6Xt/9Le2wtwzg/1hSaVXWLLk5rU80nwc0hHCCIQJZXyl72BSYvIqLM0G8
X-Received: by 2002:a5d:5c89:0:b0:431:5ca:c1a9 with SMTP id
 ffacd0b85a97d-432c3632a04mr10938588f8f.23.1767954662763; 
 Fri, 09 Jan 2026 02:31:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4nrg8QB5rJOCXc0Rpx794/pjF2RLlPnnPcBH896+5wFAzWM1R8nKWuTEsys28GWir314rrg==
X-Received: by 2002:a5d:5c89:0:b0:431:5ca:c1a9 with SMTP id
 ffacd0b85a97d-432c3632a04mr10938556f8f.23.1767954662306; 
 Fri, 09 Jan 2026 02:31:02 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dacdcsm21659038f8f.1.2026.01.09.02.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 02:31:01 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tzungbi@kernel.org,
 briannorris@chromium.org, jwerner@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org
Subject: Re: [PATCH 6/8] drm/sysfb: Remove duplicate declarations
In-Reply-To: <20260108145058.56943-7-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-7-tzimmermann@suse.de>
Date: Fri, 09 Jan 2026 11:31:00 +0100
Message-ID: <87ecnzf57f.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qXV7oeKy-xIR8_Iqtdyhxdavd8I4mY3gDHZFxCvOa4U_1767954663
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

> Commit 6046b49bafff ("drm/sysfb: Share helpers for integer validation")
> and commit e8c086880b2b ("drm/sysfb: Share helpers for screen_info
> validation") added duplicate function declarations. Remove the latter
> ones.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: e8c086880b2b ("drm/sysfb: Share helpers for screen_info validation")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.16+
> ---
>  drivers/gpu/drm/sysfb/drm_sysfb_helper.h | 9 ---------
>  1 file changed, 9 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AAB7B9D19
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 14:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0A410E3E6;
	Thu,  5 Oct 2023 12:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51D810E3E6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 12:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696510495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BdzaOA4Dk/0H60sKG/Uc21VcfuRV3bDv58sH463vRtU=;
 b=bKj3ajRtkMOnpFyNEPlpVviTbnwWPV9nnRf71b13xwMLoGvGY3og2VCDtfGih51GbDIpGC
 aJWMF+CM/pm2eGWPyK3ak1eF6ZRhErbD3hqI0A2Ow0S0Wofy6F9JCumZRpl78YXfItUIJk
 cX6OsKN1KGJXYCK49B3g2WoYM7ZKD5c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-hmukn1BZOk6RkBR0DRu1gQ-1; Thu, 05 Oct 2023 08:54:54 -0400
X-MC-Unique: hmukn1BZOk6RkBR0DRu1gQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-32323283257so803698f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 05:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696510493; x=1697115293;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BdzaOA4Dk/0H60sKG/Uc21VcfuRV3bDv58sH463vRtU=;
 b=wlNZXzdfBZTiEvIvFAqldEQftQf6eGWyxLoUDvSc3R8EZdPzW3snE1vPQvVX5hGvyy
 EqXMkeEucdWlGrQ0ipd+QfeKkMOyNmrNEqrWdEYZTBogpoAA+5drEvx/UjzWmtvJ1lkG
 C6z/SG0cm3lmNCJ7dx/TFk86coFOyhoB1jOsKeJplnE7uCIBe3fVwSd5pN+1W8+szS5f
 pbkjdgMfT9F1TzSBFimrpVcFqXHqxbGxzsxxO2kfzxtHXMRSh2QV0/HSqSifR78ZkRQQ
 zEY7tAU05zRxdH1FWF+xeZbthot9P0i4E41LR7UGbnqaN/wBIthaczsJGhP5mQk8eDLi
 0rpQ==
X-Gm-Message-State: AOJu0Yx7z/Tb+gs5b/gcp/vBqv4TW8XcC0Bi47gjuixIFG5y8y51lnbE
 dMA9NPIZ2TMrIbRiuuVP6M9E+pRvEeJF+3N40tT7AzV8msx7KiakjoUgltbwyoq4vPNN0E7/K0D
 zUtAgD8w880uaxscVTGRD2RNbRHMh
X-Received: by 2002:adf:f24f:0:b0:319:63f3:c0cb with SMTP id
 b15-20020adff24f000000b0031963f3c0cbmr4744833wrp.40.1696510492953; 
 Thu, 05 Oct 2023 05:54:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH66HaNIW3dLx9f4LOQ0Cv4en+cS25HhfKcnFgudT75LOahG8x1n95Gr4wyfDjl7i+CCz8qoQ==
X-Received: by 2002:adf:f24f:0:b0:319:63f3:c0cb with SMTP id
 b15-20020adff24f000000b0031963f3c0cbmr4744815wrp.40.1696510492565; 
 Thu, 05 Oct 2023 05:54:52 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w5-20020adfd4c5000000b003143867d2ebsm1739612wrk.63.2023.10.05.05.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 05:54:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v4 6/7] drm/ssd130x: Fix atomic_check for disabled planes
In-Reply-To: <c4fd1d91-7d9b-483f-8b1d-10857a6f1016@suse.de>
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-7-tzimmermann@suse.de>
 <8734ypwb9w.fsf@minerva.mail-host-address-is-not-set>
 <c4fd1d91-7d9b-483f-8b1d-10857a6f1016@suse.de>
Date: Thu, 05 Oct 2023 14:54:51 +0200
Message-ID: <874jj58c10.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi Javier
>
> Am 05.10.23 um 13:37 schrieb Javier Martinez Canillas:

[...]

>>> -	ret = drm_plane_helper_atomic_check(plane, state);
>>> +	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
>>> +						  DRM_PLANE_NO_SCALING,
>>> +						  DRM_PLANE_NO_SCALING,
>>> +						  false, false);
>> 
>> As Geert mentioned you are open coding here what the called helper already
>> does. I prefer to keep doing that, instead of adding boiler plate code.
>
> Please see my other email.
>

Sure, let's continue this discussion there.

>> 
>> One question, the reason to return -EINVAL was to prevent the callback
>> ssd130x_primary_plane_atomic_update() to be executed, since that attempts
>> to get the CRTC state to pass the HW buffer to ssd130x_fb_blit_rect().
>
> Returning an errno code aborts the commit. [1] The CRTC can (maybe 
> should?) be NULL to disable the plane. (It is in sync with 
> plane_state->fb IIRC.)
>

Thanks for the explanation.

> So can you disable the plane now?
>

It does not get disabled now indeed.

> [1] 
> https://elixir.bootlin.com/linux/v6.5/source/drivers/gpu/drm/drm_atomic_helper.c#L997
>
>> 
>> I believe this patch will introduce a regression and cause a NULL pointer
>> dereference when !plane_state->crtc and you should also add a check for
>> plane_state->visible in ssd130x_primary_plane_atomic_update() to bail ?
>
> You have a atomic_disable in that plane, so you're taking the branch at 
> [2] for disabling the plane. No atomic_update then. If the plane has 
> been enabled, you should take the branch at [3]. Without being able to 
> move/scale the primary plane, I don't see how plane_state->visible could 
> be false here. Right?
>
> AFAIKT there should not be a NULL-deref here. Can you do a test?
>

You are correct, there's no NULL-deref and in fact you are fixing the
plane not disable bug, so your fix is correct and should be applied.

I still prefer as mentioned keeping the drm_plane_helper_atomic_check()
call instead of open coding it, but regardless of what is decided:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


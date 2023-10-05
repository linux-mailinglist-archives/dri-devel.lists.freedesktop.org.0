Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8D77BA24B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 17:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A7E10E420;
	Thu,  5 Oct 2023 15:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C441B10E420
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 15:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696519623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RPiC9/IrNHqxjMxr6BAYJu5Pexnt81F4GuxWxQRl/pU=;
 b=J+OQ4N2JISddsogEQHONalh0vUxXTN0vH2cpzWHnziPR9aKK+XUV8miSekOaEEDytEGKMI
 sChR90TLzxzDPUI6Pu8eeR1QLmUqNmHVltIUMV9+kLb9sonwrJbgQBhTBvfZ4BwXnpPPLc
 JAc2/10fKCJC7MgTEWusq9mj21IxNSQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-TYCFJD85NLqL0waJDkDIwQ-1; Thu, 05 Oct 2023 11:26:52 -0400
X-MC-Unique: TYCFJD85NLqL0waJDkDIwQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2c12a8576d4so10064221fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 08:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696519611; x=1697124411;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RPiC9/IrNHqxjMxr6BAYJu5Pexnt81F4GuxWxQRl/pU=;
 b=TT00CnCPREPzIWnNuzz0wupFAcGEZCXgK9wvjVUduSNGOVMXKuaDgjBSEmPHFpaeOm
 Wkr38/Lw1h2S0voUl35Y/VM4f3heel69KAdAaIOnWY7TvjOLgiy0KncOcSODRr3bU1Ym
 1qfxPK/AtH/IM+0FipoV2yI/fVFPoiMsoO3MtuLRyddzjNuXA1jadhQjseOOdwAgtQaD
 Gu7rRTjpZMhz0g84eyaMZOA6Jy7YGGI620A7RMkXHux5DFFAOJpKemAbZLRq0Mm7Zyq5
 e8lcALsnA/tv5A36CDxhNYCV3IjQkEYqE1viiz7OTg2rUFsGuM123h2zppf0+mm7SSyz
 39mA==
X-Gm-Message-State: AOJu0YyLN2W2sLhGNh64Fej0ppQZVpzUasKo4hGjoCpTkBxz5GCoyh58
 cPzmww/1X+j8D45loHU6T9uKsJ31PjVto0+zrTETg/1PVerC5L4eBUtyf2yAGHaavIGmoRPbbQP
 HxA1JVDlEurZDTjQFPdt1Oo7WmX7R
X-Received: by 2002:a2e:6e09:0:b0:2bc:e2bc:81ff with SMTP id
 j9-20020a2e6e09000000b002bce2bc81ffmr4580108ljc.51.1696519610970; 
 Thu, 05 Oct 2023 08:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzfCQ5AhH18fUoDh3XBkHrBKEzscX8/AyFupYlD00dVrqYHsGfS8ZdSkkdXOM1X+TF5TzevQ==
X-Received: by 2002:a2e:6e09:0:b0:2bc:e2bc:81ff with SMTP id
 j9-20020a2e6e09000000b002bce2bc81ffmr4580096ljc.51.1696519610632; 
 Thu, 05 Oct 2023 08:26:50 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c294500b003fc02e8ea68sm3966799wmd.13.2023.10.05.08.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 08:26:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v4 1/7] drm/format-helper: Cache buffers with struct
 drm_format_conv_state
In-Reply-To: <9953d128-1366-4967-8fc8-6342bc31e9fb@suse.de>
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-2-tzimmermann@suse.de>
 <87y1gh6wd2.fsf@minerva.mail-host-address-is-not-set>
 <9953d128-1366-4967-8fc8-6342bc31e9fb@suse.de>
Date: Thu, 05 Oct 2023 17:26:49 +0200
Message-ID: <87wmw1yts6.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>

[...]

>> 
>> I'm confused, the copy helper is the same than init. What's the point of
>> this function ? Why not just call drm_format_conv_state_init() from the
>> __drm_gem_duplicate_shadow_plane_state() function in the next patch ?
>
> I guess that deserves a comment in the code. The reserved buffer is not 
> to be copied to another state. So we just clear the fields. But in the 
> future, we will likely be extra fields, such as the aforementioned 
> palette data, that will be copied. It's just that these fields don't 
> exist yet. Hence the copy function is different from the init.
>

Maybe the change is premature then and we could do once the palette data
(or any other field is added) ? But I am also OK with just a comment that
explains the reason for this function.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


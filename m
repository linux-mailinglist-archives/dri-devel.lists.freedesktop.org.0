Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911CD748067
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 11:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E2010E1CD;
	Wed,  5 Jul 2023 09:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F4910E1CD
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 09:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688547939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FkUdoB9ukiXu+GwQPoh7yLjinOj86HTx0mJIEOcNqHk=;
 b=XF2Ty5+4s9gCoV8n7LHDoERopxwpo86Ru71klVOgsVxem42AWvqjL4FWU5cuNfpp4ZcgGJ
 +Gj+zebDnCrm9a2VVpf9BShSfLHI0tEDWaK9b0Hnl350HBR197RlLimghqxXqI77MDnhtg
 eUCJ2C7y9G03mXz01L0MP9koQZrdso8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-7Yxqoz-5OMyhM7x2gZFcjA-1; Wed, 05 Jul 2023 05:05:37 -0400
X-MC-Unique: 7Yxqoz-5OMyhM7x2gZFcjA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fbd8cc134aso19460625e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 02:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688547937; x=1691139937;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FkUdoB9ukiXu+GwQPoh7yLjinOj86HTx0mJIEOcNqHk=;
 b=Uv/9JChm7Z9T6fgz7jQ+5yM2OhAA/0AO1aybiy6SlVHsRcCuzi9u+ALCxta3K+eAju
 PjNSvoPtlo8YqNecILTOm15bgfZkGzwwoaOLuXlzbWUcPA8pYwPwg7Pf2NcdNhzz6bZl
 lHA+4ZxbhnazHmrn11I5Khp6KsKmWhKoAw0fUNB69Vh0anyQ5d2AWAIvcSZjOFIS9JXN
 wRmc44kT/PDGHfGuGO/fhSnfIqBtI7Bk7z+hmutLeiA63j51tfR7kRrIyRT+Za2Nkhki
 ON4OQS5vVQLeWBw4xKmQR8JXZ2I6t/aENU2BiMa3RGfUmXl3Wp12E+27WGeRk0VogObl
 vyLA==
X-Gm-Message-State: ABy/qLZ86F8WyckKWlTl/Y4JvcuBcBVORi9BEESCEVgiHMSuXirQkfsg
 C20wq+VJBoQe5GEbKX5FzKXC0jRWoqjjwLJpc6fq1aGbONYVZ58ExV8sBZZgujdVkPgdQzvsHm2
 Q9lZB7s4avUvmriz9fWQpCrMP3fSS
X-Received: by 2002:a1c:f712:0:b0:3fb:dbd0:a7ea with SMTP id
 v18-20020a1cf712000000b003fbdbd0a7eamr6291382wmh.37.1688547936822; 
 Wed, 05 Jul 2023 02:05:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFea/9ghtylfsKDHnVQCxTc0bPKyrA8WH7Zc8b8ay9vM+p1C9BZYAjxS62tSMn7FBeqBkEyEw==
X-Received: by 2002:a1c:f712:0:b0:3fb:dbd0:a7ea with SMTP id
 v18-20020a1cf712000000b003fbdbd0a7eamr6291366wmh.37.1688547936580; 
 Wed, 05 Jul 2023 02:05:36 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k7-20020a05600c0b4700b003f9b155b148sm1517462wmr.34.2023.07.05.02.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:05:36 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH 08/10] drm/omapdrm: Use GEM mmap for fbdev emulation
In-Reply-To: <20230704160133.20261-9-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-9-tzimmermann@suse.de>
Date: Wed, 05 Jul 2023 11:05:35 +0200
Message-ID: <87lefuran4.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The fbdev emulation currently uses fbdev's default mmap code, which
> has been written for I/O memory. Provide an mmap that uses GEM's mmap
> infrastructure.
>
> Utilize fine-grained fbdev macros to initialize struct fb_ops. The
> macros set the read/write and the draw callbacks for DMA memory. Set
> the fb_mmap callback to omapdrm's new mmap helper. Also select the
> correct Kconfig token for fbdev's DMA helpers. Note that the DMA
> helpers are the same as for system memory.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


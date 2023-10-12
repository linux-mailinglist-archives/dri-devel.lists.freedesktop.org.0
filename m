Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9017C7529
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 19:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFB610E542;
	Thu, 12 Oct 2023 17:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAEA10E536
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 17:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697133194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kFmlTU0whGflV8SQCVAE3kgzAoN0IEvaFssYzKGUMLY=;
 b=dkRNeWgiCHXWrI6rLGUc+ssHUfJeQauucNXb6dfU2j4+KOOKh6AKR3wVVbT8sDiH7/sS4c
 PyP1Oz3pZCtX/GTzL65GOUFdgZtowi4fpRvmHrktI6YPLPHcY4x6Kdq/mgePoLv+hJiqhb
 TlkfQVBoe5duSGLZS124ARsu4UGQqDE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-_wBzSW6uMvOI6_nfJkWBYQ-1; Thu, 12 Oct 2023 13:53:02 -0400
X-MC-Unique: _wBzSW6uMvOI6_nfJkWBYQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-53e2acda9d6so334192a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 10:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697133181; x=1697737981;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kFmlTU0whGflV8SQCVAE3kgzAoN0IEvaFssYzKGUMLY=;
 b=hcTARZPf1S4v4sNOgRPj9wdDVyDGt3YmreKIxPRIZy0XGfBfeuwiqLUAf2tNPgdTsA
 tJIH3LfSNs7lHPuN9Ia6rrFwbidqJ00jCnQZUhFeaHvQDbWnhUg2LCk+EnjcCQT8XNE8
 Mi2JYP9MD0A0ZWbSxjBP1Y6YSjkUoRMCNg0usZCeMqTMNgB3FFqr7cwN1vVSNcIaMW2m
 yvCHiN7JVZbcXmA6v7Gq2itCOujAxd7iEODGOX5fv+UiH06RyAjFo+LJ5wY3IZ+SE0Tr
 oxl3qTUJtvMtUNVyX22V8wbTr49jMk89bIZSaZskL9AHfDKQ2JXFvHtSHFt8SXJ/3hA2
 Ikeg==
X-Gm-Message-State: AOJu0YxqrKovCYq0g6ks1qpD7d/iCJzsI9R0nh1qWUToaa+uenESEd7x
 lu7dqgWEYjj0ctOVd01Gfwn5yRbYna1V85FZGlJG71P3XEw7WHzDsuJQXIe5jRb7oG5SOtQh8E5
 gwfSyZsPwxUMf3vY+8TeGoM45kLg9
X-Received: by 2002:a17:907:7635:b0:9a5:c9a4:ba19 with SMTP id
 jy21-20020a170907763500b009a5c9a4ba19mr22956686ejc.47.1697133181427; 
 Thu, 12 Oct 2023 10:53:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDWRPItUQHPVnFrYhqkP09r7f/H7/7N+JuwoW5L/9difSByW8G/BZWddWWymKdYDVwwm2xZA==
X-Received: by 2002:a17:907:7635:b0:9a5:c9a4:ba19 with SMTP id
 jy21-20020a170907763500b009a5c9a4ba19mr22956665ejc.47.1697133181064; 
 Thu, 12 Oct 2023 10:53:01 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 by8-20020a170906a2c800b009b913aa7cdasm11336219ejb.92.2023.10.12.10.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 10:53:00 -0700 (PDT)
Message-ID: <147a615b-be30-4959-baba-e56d1978c36b@redhat.com>
Date: Thu, 12 Oct 2023 19:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/nouveau: exec: fix ioctl kernel-doc warning
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20231008140231.17921-1-rdunlap@infradead.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231008140231.17921-1-rdunlap@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Karol Herbst <kherbst@redhat.com>,
 Bragatheswaran Manickavel <bragathemanick0908@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/8/23 16:02, Randy Dunlap wrote:
> kernel-doc emits a warning:
> 
> include/uapi/drm/nouveau_drm.h:49: warning: Cannot understand  * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX
>   on line 49 - I thought it was a doc line
> 
> We don't have a way to document a macro value via kernel-doc, so
> change the "/**" kernel-doc marker to a C comment and format the comment
> more like a kernel-doc comment for consistency.
> 
> Fixes: d59e75eef52d ("drm/nouveau: exec: report max pushs through getparam")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for fixing this up, applied to drm-misc-fixes.

- Danilo

> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
> ---
> v2: update commit text; somehow I sent a version of the patch before
>      adding the full text.
> v1: https://lore.kernel.org/lkml/20231007005518.32015-1-rdunlap@infradead.org/
> 
>   include/uapi/drm/nouveau_drm.h |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff -- a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -45,8 +45,8 @@ extern "C" {
>   #define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
>   #define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
>   
> -/**
> - * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX
> +/*
> + * NOUVEAU_GETPARAM_EXEC_PUSH_MAX - query max pushes through getparam
>    *
>    * Query the maximum amount of IBs that can be pushed through a single
>    * &drm_nouveau_exec structure and hence a single &DRM_IOCTL_NOUVEAU_EXEC
> 


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E9D759E45
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 21:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2BC10E4F9;
	Wed, 19 Jul 2023 19:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8160610E4F9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 19:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689793938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JXF15QANcQiQA1IPbs2QtIA09gB0+ec0aCzIw+lyU5o=;
 b=G5fnRAgnEV6e0Ld3LDl7xhj/mfRjR11h6psc4U5QxFyigsU1PJuU2Idy9jajrJm5aaALWK
 RMcASnkNZo5vdAQh2lCfD7UKdJYabt6zyaocZOsNHIHwjvndUklsEKzgTzUfHR+I9UmRuz
 Gjry1hdG4/nsD8HYegj6Q+jtGiewHx0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-kRTyIljcMVC_lscJi6SWbw-1; Wed, 19 Jul 2023 15:12:17 -0400
X-MC-Unique: kRTyIljcMVC_lscJi6SWbw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fbe356b8deso41311125e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 12:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689793936; x=1690398736;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JXF15QANcQiQA1IPbs2QtIA09gB0+ec0aCzIw+lyU5o=;
 b=emJ7GHhX2QMkZ5kcZKc3xdCTyz2Ga7mA5VCdRNZT1ZZQBUcks+gBq97u6IskJCutH/
 5L39Jb7fG8RtHUe78rAYRx34Eat6/4fj2nhxJTMjPZeHuTfE1YEhTI7wTfkBlTFv5vJq
 W+cJruOuPC5sn4uEh3MYwbuwNidYKwjmSt9HwclE1goK+Gt6K0RuVYdKgwkFY/i4bi9B
 y+jQVCXbWjSTkfm4UxE3m2DRyQ9DBUupfOr7fnSPUCmejHsBMbEmhwzh30avTtTwi+sO
 drOUnfcoBFCpk5xNxd99Ltxr2BJVMbjxtqYhpxVwG8GQj5KLxoUE392Uhg7ccw6D30Co
 W94g==
X-Gm-Message-State: ABy/qLYse9hFO23uZCTYO3fCt/XAPAx2eJjNMIMNy397K0GMd82c/wDc
 +fxa8KOP7y2A5hEx90Et1aUGyFo5shr1JSs37Ux+otlE8camAr5mWhrsRgp6VWn8xZfrIfPqRau
 73R8HioqPk1crvNPWYTnoCBCBvPO5
X-Received: by 2002:adf:e351:0:b0:312:74a9:8259 with SMTP id
 n17-20020adfe351000000b0031274a98259mr184428wrj.71.1689793936032; 
 Wed, 19 Jul 2023 12:12:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEyqQ3WA7Gw6Rk9H+5eUCRD6iK9ao4erODH0O7fqa0SS79LL7Rhhu2e5AISzSRYsaZnHCVO1g==
X-Received: by 2002:adf:e351:0:b0:312:74a9:8259 with SMTP id
 n17-20020adfe351000000b0031274a98259mr184417wrj.71.1689793935762; 
 Wed, 19 Jul 2023 12:12:15 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b4-20020a05600010c400b003141e629cb6sm5984403wrx.101.2023.07.19.12.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 12:12:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: suijingfeng <suijingfeng@loongson.cn>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
Subject: Re: [05/11] drm/tests: helpers: Create an helper to allocate a
 locking ctx
In-Reply-To: <970f4a65-25dc-1805-3776-6447a61f77c5@loongson.cn>
References: <20230710-kms-kunit-actions-rework-v1-5-722c58d72c72@kernel.org>
 <970f4a65-25dc-1805-3776-6447a61f77c5@loongson.cn>
Date: Wed, 19 Jul 2023 21:12:14 +0200
Message-ID: <87o7k7hg1d.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

suijingfeng <suijingfeng@loongson.cn> writes:

> Hi,
>
> On 2023/7/10 15:47, Maxime Ripard wrote:

[...]

>> +
>> +/**
>> + * drm_kunit_helper_context_alloc - Allocates an acquire context
>> + * @test: The test context object
>> + *
>> + * Allocates and initializes a modeset acquire context.
>> + *
>> + * The context is tied to the kunit test context, so we must not call
>> + * drm_modeset_acquire_fini() on it, it will be done so automatically.
>> + *
>> + * Returns:
>> + * An ERR_PTR on error, a pointer to the newly allocated context otherwise
>> + */
>> +struct drm_modeset_acquire_ctx *
>> +drm_kunit_helper_acquire_ctx_alloc(struct kunit *test)
>> +{
>> +	struct drm_modeset_acquire_ctx *ctx;
>> +	int ret;
>> +
>> +	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_NULL(test, ctx);
>> +
>> +	drm_modeset_acquire_init(ctx, 0);
>> +
>> +	ret = kunit_add_action_or_reset(test,
>> +					action_drm_release_context,
>> +					ctx);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return ctx;
>> +}
>> +EXPORT_SYMBOL_GPL(drm_kunit_helper_acquire_ctx_alloc);
>> +
>
> I think all of the patch inside this series are quite well.
>
> Personally, I can't find problems in it.
>
>
> But I still want to ask a question:
>
> Should the managed functions you introduced be prefixed with drmm_ 
> (instead of drm_) ?
>

That's a good question. But personally I think that the drmm_ prefix
should be reserved for drm_device managed resources and helpers.

> As mindless programmer may still want to call drm_modeset_acquire_fini() 
> on the pointer returned by
>
> drm_kunit_helper_acquire_ctx_alloc()?
>

The function kernel-doc already mentions that there's no need to do that
and that will be done automatically by kunit. So shouldn't be different of
other functions helper where the programmer didn't read the documentation.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


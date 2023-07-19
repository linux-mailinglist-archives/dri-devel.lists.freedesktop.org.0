Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E043B759E83
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 21:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35A110E02A;
	Wed, 19 Jul 2023 19:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574E410E02A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 19:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689794689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l4X8keUZdQb2bH4NBTCOtLQ3Hj41EdN+SDgQPF1/pfY=;
 b=OKuu9cSdDYiMLiU5f5X2sCYJzVlcloXwbN65f1kpKARsepyvArhdpv7pJfmZt7Erfom2lI
 T2Ca4WgCvsn/KBGILuzwBKMbSldtBhgK4PeE/OL5tRVqzseSLvR/J7L+SWrlWu2QXVElse
 vVzRh4CLmeIumMMHYQypckvA3az3bGQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-yqABOQtcNlma5MMrO1bWGg-1; Wed, 19 Jul 2023 15:24:47 -0400
X-MC-Unique: yqABOQtcNlma5MMrO1bWGg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3faabd8fd33so39193425e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 12:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689794686; x=1690399486;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l4X8keUZdQb2bH4NBTCOtLQ3Hj41EdN+SDgQPF1/pfY=;
 b=aZvoHqnJFhNv8ghCFo7j4EXNIjNnX9Rahj+MsBlXXo93QNg9gufVvtPj3CwUGd4RId
 IRA2hxADgyYQ7CB5tvR9ZUct1ysJUpJdQoexOS+3KrVXISsVAd9hFVIp4YKmuKNsKW4y
 +gUH0EORlSNNhSsSiuPa2zaP/Jz7dYh60vHG2XEKN7vr9zPX+8u1khH9w+VpBtEc9gcG
 CmZuIeZnI4Ir6Ie6wfIdwi7r2LK1g6JyQlo2mHfWsiURCDOaGFnHNOcIWxJp08PJE5oI
 Pcc4YsBnS7QuMaKP8ysHJfmOqoFrt61pEhPWflmNZRhuu/XJhsP6IIhvCj+VIyaG7x3F
 Gt3g==
X-Gm-Message-State: ABy/qLbOvZukr1xsTWrvzdyZ5bIt/R75xqtW5kBC+/cKX3xmPizmT6PJ
 /iC7+ybSacGDWB8UEdtZqmgWEBOKMGPjmsPrRL7zn6APdGzitohcQ/dy/rhHdoVToLz2D1OPDg3
 dQ91qEbz5JBsAjwEOOMBv1E1hb0lE
X-Received: by 2002:adf:f803:0:b0:313:ebf3:f817 with SMTP id
 s3-20020adff803000000b00313ebf3f817mr694727wrp.22.1689794686778; 
 Wed, 19 Jul 2023 12:24:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE+gAoZVxaGmHUoZ+DGJdKLFu6ZbS53uLFxpRmgqQc1kVBMnscA1+Tk/eOyiu3y0cdVGHrgig==
X-Received: by 2002:adf:f803:0:b0:313:ebf3:f817 with SMTP id
 s3-20020adff803000000b00313ebf3f817mr694713wrp.22.1689794686460; 
 Wed, 19 Jul 2023 12:24:46 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b00314172ba213sm5943825wrw.108.2023.07.19.12.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 12:24:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: suijingfeng <suijingfeng@loongson.cn>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
Subject: Re: [05/11] drm/tests: helpers: Create an helper to allocate a
 locking ctx
In-Reply-To: <fbbc08de-043a-2622-7cd4-fa485129edaf@loongson.cn>
References: <20230710-kms-kunit-actions-rework-v1-5-722c58d72c72@kernel.org>
 <fbbc08de-043a-2622-7cd4-fa485129edaf@loongson.cn>
Date: Wed, 19 Jul 2023 21:24:45 +0200
Message-ID: <87lefbhfgi.fsf@minerva.mail-host-address-is-not-set>
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
>> As we get more and more tests, the locking context initialisation

[...]

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
>
> Because kunit_kzalloc() is also managed,
>
> Is there any possibility that kfree(ctx) get called before 
> action_drm_release_context(ctx) ?
>
> Currently, I can't find where the order is guaranteed.
>

It isn't documented indeed in Documentation/dev-tools/kunit/usage.rst but
the kunit_add_action() kernel-doc says:

"All functions registered with kunit_add_action() will execute in the
opposite order to that they were registered in".

And now that kunit_kzalloc() and friends are also implemented using the
cleanup actions, it will be part of that execution chain.

Probably the kunit docs can make this more clear.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


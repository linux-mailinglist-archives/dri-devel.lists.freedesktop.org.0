Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B02DD759DF7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 20:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304CC10E4F0;
	Wed, 19 Jul 2023 18:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FD610E4F1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 18:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689792939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F50ZRNO2TGVX8Kl6rozSN2J4zAo6+Tkfm50rtvi7/ZE=;
 b=X5EIN+uDQysk6xMFC82ErpLGVJz5f9/kDCNEpbj9scrGeTH+bcPoHFhC9848AGK7PbA/QK
 GPHFolLJEqZpourKUjVWTu+hkoDZzKIoD9BMXFsr2tx6XOB762Fr49GO2oploRZEW/36m/
 FkmpXf64PKjL+/zLGa4q+YQ8y69tid0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-ou8ZZfWvMdSgn3JSZK39sA-1; Wed, 19 Jul 2023 14:55:38 -0400
X-MC-Unique: ou8ZZfWvMdSgn3JSZK39sA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fc00d7d62cso44484075e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 11:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689792936; x=1690397736;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F50ZRNO2TGVX8Kl6rozSN2J4zAo6+Tkfm50rtvi7/ZE=;
 b=DAeL/wqt5hNGVIg8ZwTLbNgoJClH3UGqKjiQjKHlP1mIpMqBUYKCtUVTNnqC1GlR60
 +1Caq4WZnYOqeH3rjUSCn3t6LtODxWsInPw79PoU1PRdDrra1gEbnMtNXS2RnDIqjvhm
 MbeNF5QwPbcPSsJXv2/YPU8XIXe2/NaiYZ667hFCBReIeCmj+LqORj0WB9T2ZyHWg398
 QzzNBaOmLtRf7frn46dlXrS8xW1c+Vf4WV/FSFQM5S4aWb5GZc88iCpa2Ak6mKaS1Gdz
 3RluuafVEgxr4xCt5Tq2GxKamVT/RbQHEgUoydGUcyy+IQn/LMoWzw94G5JI6N+rnE69
 o4fg==
X-Gm-Message-State: ABy/qLY65nqgnNuzCxDobo5idm3x4A2pZ1dT0vFqmqh9yqTSJonewVTu
 xsL5nI83LDgp1JpOt2lq52KFllpXBNhV3CKMXVJ2puNHCQNFevBB/FPZTFBJcdwl1F7kKvaKLP8
 xeh9HZu8OE8Wbffv7iY1HN394nutW
X-Received: by 2002:a7b:c4d6:0:b0:3fc:70:2f76 with SMTP id
 g22-20020a7bc4d6000000b003fc00702f76mr194189wmk.20.1689792936734; 
 Wed, 19 Jul 2023 11:55:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG2QS5yjSN+Zf0H8nEynLm3JsHawoJtVXOZv5yrZtAf7/B2P3zvonHgb0nSCS39LrTPJFwvyw==
X-Received: by 2002:a7b:c4d6:0:b0:3fc:70:2f76 with SMTP id
 g22-20020a7bc4d6000000b003fc00702f76mr194175wmk.20.1689792936411; 
 Wed, 19 Jul 2023 11:55:36 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u9-20020a7bc049000000b003fba6a0c881sm2240800wmc.43.2023.07.19.11.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 11:55:36 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
Subject: Re: [PATCH 03/11] drm/tests: modes: Remove call to
 drm_kunit_helper_free_device()
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-3-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
 <20230710-kms-kunit-actions-rework-v1-3-722c58d72c72@kernel.org>
Date: Wed, 19 Jul 2023 20:55:35 +0200
Message-ID: <87v8efhgt4.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

> Calling drm_kunit_helper_free_device() to clean up the resources
> allocated by drm_kunit_helper_alloc_device() is now optional and not
> needed in most cases.
>
> Remove it.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


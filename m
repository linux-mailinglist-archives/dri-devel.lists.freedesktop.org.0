Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D725E759F54
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 22:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4AC10E50A;
	Wed, 19 Jul 2023 20:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D2210E50A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 20:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689797321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iM0CuWzlzu6pdYi/6cJkA8MQCu3DxXUjouE+j/kSvnQ=;
 b=NFTl61zd1nwddSGg8TafABZ8+UzW3hXUbcWbsR49I6oFiNCR1doz3QOWMpgSGLWH6og095
 amyHJlO67ugjajXMqKhsI7f90lJbJX95ExLpoJ5J9JqFSt8DC5/Y1S8H7mn6JPSx3gWsqX
 +2y+msvBRFgODhPjEqNncB5gCqcwEXg=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-dUWZNJp8PGKdyPr6yXou9Q-1; Wed, 19 Jul 2023 16:08:40 -0400
X-MC-Unique: dUWZNJp8PGKdyPr6yXou9Q-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4fbcdca8fcbso1706e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 13:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689797318; x=1690402118;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iM0CuWzlzu6pdYi/6cJkA8MQCu3DxXUjouE+j/kSvnQ=;
 b=jJBTY9BsCNYGYj6PhKaDR8gOymKS3xnhB/0MZKpW5BHpgmQQVENeBE9Al89kbjL6/v
 pkoMmx/4faEqKeC2eOgQ51gomugwSC5hKgGOeyGDNJywvsUW6YcKjjfkOIlo6fdUdEzq
 TtOiSlD0A7nuhgqWhNDcG4xjcMdlDHiilOL+H0/F+ftIN+prcy1hxHOOP4JGkYor84Yx
 ZaIRrAE3aViKada6SCaULZbpGbYQy7HA3gP9DTBeyM8dvHv1jL6DKW8LM4wVJdsdfDK6
 TNZ/lV1bDAZ7+sMv6MsFQpGlLdr+4aiJuP52zTPz6YhejZDyjnkD5BAc49NnADNF3PWR
 OqyQ==
X-Gm-Message-State: ABy/qLbsas3MrOB6fvxBbzbKrfOw3ldTy3bi8QkGIMYKnrKzVScgdGP/
 //5t3pur6Cx60rhh47MkQg68qSGPm4PccpfFGxfcRxjm/AzvEbz+G9VTRxf8v8omKBpsERDDC5v
 yxJ/JkG6ovB9P8Fiweo7E7dhheHf4
X-Received: by 2002:a05:6512:33d0:b0:4f6:2317:f387 with SMTP id
 d16-20020a05651233d000b004f62317f387mr870473lfg.35.1689797318551; 
 Wed, 19 Jul 2023 13:08:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFc25d7ighZVtdSRxpwgArEzNOn94MS4yvSo0iGHAnJzSp1NeM1GJCTXANqXaeQnuA7j2/kdQ==
X-Received: by 2002:a05:6512:33d0:b0:4f6:2317:f387 with SMTP id
 d16-20020a05651233d000b004f62317f387mr870455lfg.35.1689797318171; 
 Wed, 19 Jul 2023 13:08:38 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t10-20020a1c770a000000b003faef96ee78sm2431167wmi.33.2023.07.19.13.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 13:08:37 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
Subject: Re: [PATCH 11/11] drm/vc4: tests: pv-muxing: Document test scenario
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-11-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
 <20230710-kms-kunit-actions-rework-v1-11-722c58d72c72@kernel.org>
Date: Wed, 19 Jul 2023 22:08:37 +0200
Message-ID: <874jlzhdfe.fsf@minerva.mail-host-address-is-not-set>
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

> We've had a couple of tests that weren't really obvious, nor did they
> document what they were supposed to test. Document that to make it
> hopefully more obvious.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


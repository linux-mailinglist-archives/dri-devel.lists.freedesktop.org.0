Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB84563FBD
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 13:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDCD2BC6C;
	Sat,  2 Jul 2022 11:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9152BC6D
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 11:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656761579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+/CG7OlSvFtvPwBtKbOScoNNsNb5w33jEJ9roT+riGE=;
 b=FzJ286yJKDiIKtk3SqvCGauI3vQBpLtqS6TXf2z0r4JVfCxY6N0UauC4kL2g3pciwI7WIH
 8THS0RU5HVScaFdOQ+6qpK7BgmV7lCgOnGDHmvEh6Np971glCqxzVdsXRFMAf84MBCZgjP
 wJFezK/wkVs++pqcYxzlTy7d49RYrdo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-gBezw3mtMwesX49dYG5Xcg-1; Sat, 02 Jul 2022 07:32:56 -0400
X-MC-Unique: gBezw3mtMwesX49dYG5Xcg-1
Received: by mail-wm1-f69.google.com with SMTP id
 p6-20020a05600c358600b003a0483b3c2eso2634968wmq.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jul 2022 04:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+/CG7OlSvFtvPwBtKbOScoNNsNb5w33jEJ9roT+riGE=;
 b=h5wYXglrP9iQPgxfy+HuC9Ft9icEC+JCV9D2tuXG975BqBnDdt9pam7LhTfEawe96Y
 F78HRxY1vnnzD/iFKArAz0lPoTTIjsoAmMOZO4VQQFtj8QqLe/rfzC7YqNSVhGQjMxRg
 /ejpQewV6RQR87MnBSUxLwOk/SOL3EZWPR8xa0UeLuEH72LjMSky0UUxveiVUr3QfIfE
 2AfO24uQ46uEHEwIIxh5va2MCVGvfQhVzV6ZF9YzXgeBCSyBDwz/y5rY0tPKXT90rzRu
 mkHa1R2SoEFf2E4cQGPWIdwgJei6bN8Ip42udyd3OBqx3vZSCq2fLYU6jXNK/wMktAU/
 8LYA==
X-Gm-Message-State: AJIora/meh4AR6fxx36vJ0KsrVnEN3/xt6GLT7iSgpsKXY7VIsFa8ClV
 fdJjTdtpQMcX/s6rgEtTOaWqvCi17TArZRIApQiVBNqMr3+sE//nSEXXnZ9h2G1qAoAOCVjkB+g
 2SibzDSS71HNlU3uXTkR73WLTvsTB
X-Received: by 2002:a05:600c:2051:b0:3a0:3c58:6ff6 with SMTP id
 p17-20020a05600c205100b003a03c586ff6mr22334033wmg.98.1656761575579; 
 Sat, 02 Jul 2022 04:32:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uK7lyTTBd7+vx/Qhs8VIxakL50jdfDusliR+VYkqGsWVRmfyQsHe77h/XIU94xnlgnS61zoQ==
X-Received: by 2002:a05:600c:2051:b0:3a0:3c58:6ff6 with SMTP id
 p17-20020a05600c205100b003a03c586ff6mr22334016wmg.98.1656761575330; 
 Sat, 02 Jul 2022 04:32:55 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y15-20020adff14f000000b0021d2f322e50sm9308324wro.41.2022.07.02.04.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 04:32:54 -0700 (PDT)
Message-ID: <ff375c95-96e9-6bcf-66ea-f70a44d0a5d1@redhat.com>
Date: Sat, 2 Jul 2022 13:32:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/9] drm: selftest: convert drm_damage_helper selftest
 to KUnit
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>,
 Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 siqueirajordao@riseup.net, Trevor Woerner <twoerner@gmail.com>,
 leandro.ribeiro@collabora.com, n@nfraprado.net,
 Daniel Vetter <daniel@ffwll.ch>, Shuah Khan <skhan@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, michal.winiarski@intel.com,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com
References: <20220630004611.114441-1-maira.canal@usp.br>
 <20220630004611.114441-2-maira.canal@usp.br>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220630004611.114441-2-maira.canal@usp.br>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Arthur Grillo <arthur.grillo@usp.br>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maíra,

Thanks a lot for your patch.

On 6/30/22 02:46, Maíra Canal wrote:
> Considering the current adoption of the KUnit framework, convert the
> DRM damage helper selftest to the KUnit API.
> 
> Acked-by: Daniel Latypov <dlatypov@google.com>
> Tested-by: David Gow <davidgow@google.com>
> Co-developed-by: Arthur Grillo <arthur.grillo@usp.br>
> Signed-off-by: Arthur Grillo <arthur.grillo@usp.br>
> Signed-off-by: Maíra Canal <maira.canal@usp.br>

I believe the order of the tags should be chronological. That is, Daniel and
David tags should be after your Co-developed-by and Signed-off-by tags.

[...]

> +++ b/drivers/gpu/drm/tests/drm_damage_helper_test.c
> @@ -0,0 +1,634 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Test case for drm_damage_helper functions
> + */
> +
> +#include <kunit/test.h>

Please add a blank line here to separate non-DRM headers include from DRM headers.

> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_drv.h>
> +

I haven't looked at the KUnits tests in detail since Daniel and David already
reviewed them. But from a quick glance, the tests look good to me as well.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A699E563FC8
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 13:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9365814AE45;
	Sat,  2 Jul 2022 11:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389C714AE45
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 11:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656762045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N1gV0SWQGG0jtxPst9R8skJs6pB6sIXEtXSGdtyycaY=;
 b=ixAtNuJT8SMpwArHqie7Ww8NC6UX6jTOyylfbvcpI6vbeTTyVhye7bHhTshaPzYxxdZ24s
 8ztKHYBtzi0wTZbMaq1jEXIQWDz1a8k+2FJ+jjeWq/kFrH1iv6UvWthCQK+1P3qITvLsAk
 eCzrunq5Si4MngdKPPWnVPrWX+ANsys=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-Z8FeebZqNu2FxS0GXmIDaA-1; Sat, 02 Jul 2022 07:40:43 -0400
X-MC-Unique: Z8FeebZqNu2FxS0GXmIDaA-1
Received: by mail-wm1-f70.google.com with SMTP id
 m20-20020a05600c4f5400b003a03aad6bdfso2047665wmq.6
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jul 2022 04:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N1gV0SWQGG0jtxPst9R8skJs6pB6sIXEtXSGdtyycaY=;
 b=67J2anP7o0eGxz+9MMJFAFg15LqS+UqonJMmOan7a1v1t/AoYlr4J0vRL7M/Rqfl3U
 KlyJ1QLHzwXD5U7VB++TmZQfdYOVw8A8ESRE/w1v0CsEg6blgN0S+Tp8q++wkTYXuR+m
 WucOUGJSHZhMBMuE2ncA6hJFmD6zcDk6IpYh7D6GLgan8Lz5Z+vRdxOIg+mVs3PJ6F/v
 gVIoPVhGjGMcjHcIcuooFnam7JpYcpHYdT913wRqmRS4UViZ/4fIPxwg2zquR0Q0bPO7
 weYkunNqC9iCYRrbyKmhZrO0ix1izciIL+q0aBn2IO/OUnchby+/SA0z3qCIPx+JagJx
 Q5hQ==
X-Gm-Message-State: AJIora8vKKms6T6wPMbBCYT6g/XL9Hah3H7aBilKHVMYc+GWDaLlgtAU
 fOW/X4763yKHZs/JFwNCheresmCMJt1I5ZCeqTNADRI74jVRXItHU3Eew0sc3Lol+ABU+rpWnpX
 sT7Qh4C/eowEIGP7AmgFdUFHzb3Wy
X-Received: by 2002:a5d:65c3:0:b0:21b:bca9:83b1 with SMTP id
 e3-20020a5d65c3000000b0021bbca983b1mr17978549wrw.568.1656762042558; 
 Sat, 02 Jul 2022 04:40:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1smlbPjXQrVerb4/3Ymo2Qf1Ug72Ro6TTlgsuyqWW26iQT6fsK+QD8Wszhjm8qWkLiad+LSYA==
X-Received: by 2002:a5d:65c3:0:b0:21b:bca9:83b1 with SMTP id
 e3-20020a5d65c3000000b0021bbca983b1mr17978529wrw.568.1656762042322; 
 Sat, 02 Jul 2022 04:40:42 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e20-20020a5d5954000000b0020fcaba73bcsm25124017wri.104.2022.07.02.04.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 04:40:41 -0700 (PDT)
Message-ID: <05f5a0a0-5583-29cb-5406-77d24987d39f@redhat.com>
Date: Sat, 2 Jul 2022 13:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/9] drm: selftest: convert drm_cmdline_parser selftest
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
 <20220630004611.114441-3-maira.canal@usp.br>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220630004611.114441-3-maira.canal@usp.br>
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

On 6/30/22 02:46, Maíra Canal wrote:
> Considering the current adoption of the KUnit framework, convert the
> DRM cmdline parser selftest to the KUnit API.
> 
> Acked-by: Daniel Latypov <dlatypov@google.com>
> Tested-by: David Gow <davidgow@google.com>
> Co-developed-by: Arthur Grillo <arthur.grillo@usp.br>
> Signed-off-by: Arthur Grillo <arthur.grillo@usp.br>
> Signed-off-by: Maíra Canal <maira.canal@usp.br>
> ---

Same comment for patch #1 apply to all the others. I think you need
to change the order of these.

[...]

> diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> new file mode 100644
> index 000000000000..ca7669350c64
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> @@ -0,0 +1,1078 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 Bootlin

I believe is fair for you to add your Copyright here too since the test
changed considerably when ported to the KUnit framework API. Same for
the other tests.

> + */
> +
> +#include <kunit/test.h>

Please add a blank line here. And this also applies to all other tests.

> +#include <drm/drm_connector.h>
> +#include <drm/drm_modes.h>
> +

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


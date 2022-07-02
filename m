Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B507563FDF
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 13:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667C72BCA8;
	Sat,  2 Jul 2022 11:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C61F2BCAA
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 11:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656762526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsk5LtoJ5L3Sna553tYxn8C/ppvSkfs3ONiQ9booEt0=;
 b=AR2zjsLfpsvr0Mdt+pgmgF3GV8eMiyYRR03qluOrdwhcwjOUtWUUWVuW+TkpgjNexc75hw
 PlQy7CCkv2WfFzrBvCGIKhV73lUoBkTnUV8MbO1QNQr6pJIJlM5sWcqiEJEz+lGeToGDs2
 9cAzi9TGyKU7ejNS4l79bLJKO9Iln2Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-JZfa1tXINb2G9Qi_xiWM2Q-1; Sat, 02 Jul 2022 07:48:37 -0400
X-MC-Unique: JZfa1tXINb2G9Qi_xiWM2Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 v8-20020a05600c214800b003a1819451b1so2640542wml.7
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jul 2022 04:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wsk5LtoJ5L3Sna553tYxn8C/ppvSkfs3ONiQ9booEt0=;
 b=OjWkACKi6NrC9B9rn/EN6fDgAoelkvSKjRNn6DwFy+HVCYA3aXejJxh0iwlyGZ9CU0
 pirZ8aSkokCJPaJ8ulTCfArofe6JGjFdwLy+onDSdR8qnC1whoVRmSXvum+TmxwqdmJq
 hqeBjv4RaYElDIuVLcH5xeOC1rGYf1p/rsWY79VY5OsoFqiKQblBDqNrkMZ7RxGTK7sK
 1xCT92TLYXcm5ewCf7LzoguQY/UYNkbkiS1sR2vEQ7y07o+rvLQCH8qUSnkD39yJ+uCo
 uDIxxexuiMEP93BTDb9bX6YDcPvv0yTFtHRxAo92RYhnolX2vEMgN2PPGlIwHIadv0zH
 VL7g==
X-Gm-Message-State: AJIora9jLSNM215bDTxqUfKIEAsLl+FENrOeUTaUxcbIyfcfakgInMqs
 igidQ3kqi93jKJKkd68OEixVW+WyPqQAavqpZQed4qLjQoUELJt0RHY2kB5qnpGJv3W4V4NifCN
 C9ovR5jDPJrTBj2kdZbzRItmnj5aV
X-Received: by 2002:a5d:598c:0:b0:21d:26b6:ee94 with SMTP id
 n12-20020a5d598c000000b0021d26b6ee94mr17887647wri.457.1656762516666; 
 Sat, 02 Jul 2022 04:48:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ttlfskSCAotB8xeeIXxHixn2sjYEgxtb1ckGEMA1lPqvwqnqGgGkPjbHj3Rl/IhS7i3ZNuuA==
X-Received: by 2002:a5d:598c:0:b0:21d:26b6:ee94 with SMTP id
 n12-20020a5d598c000000b0021d26b6ee94mr17887631wri.457.1656762516436; 
 Sat, 02 Jul 2022 04:48:36 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b0039c4d022a44sm13621989wmq.1.2022.07.02.04.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 04:48:36 -0700 (PDT)
Message-ID: <7ebde68e-7710-d0da-dff8-a06e1b6ba870@redhat.com>
Date: Sat, 2 Jul 2022 13:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 5/9] drm: selftest: convert drm_plane_helper selftest
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
 <20220630004611.114441-6-maira.canal@usp.br>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220630004611.114441-6-maira.canal@usp.br>
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
Cc: "Djakson C . G . Filho" <djakson.filho@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Anderson Fraga <aaafraga@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/30/22 02:46, Maíra Canal wrote:
> Considering the current adoption of the KUnit framework, convert the
> DRM plane helper selftest to the KUnit API.
> 
> Acked-by: Daniel Latypov <dlatypov@google.com>
> Tested-by: David Gow <davidgow@google.com>
> Co-developed-by: Djakson C. G. Filho <djakson.filho@gmail.com>
> Signed-off-by: Djakson C. G. Filho <djakson.filho@gmail.com>
> Co-developed-by: Anderson Fraga <aaafraga@gmail.com>
> Signed-off-by: Anderson Fraga <aaafraga@gmail.com>
> Signed-off-by: Maíra Canal <maira.canal@usp.br>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


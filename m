Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D94563FCB
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 13:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A302418AF23;
	Sat,  2 Jul 2022 11:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A792918AF23
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 11:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656762123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/E75hYHnDmeoMvjyYpzgfBvleWEuDkid2Zmq4jEV8k=;
 b=PGYdJuqCaa8J1j6QpkG74Q0SHpN4W2PxXHcoYvQ+LNCp3r7BfHQQNGmTn2WSmakKCWTsts
 DyPyZiKh8ddA1aG985TOJDtDiWhZGCl0MPCU49epxwWt5bqufVhE2Ci+w3hq96VeniekMU
 SobBJSPMJZ5z5BlN7YhUfKcCUkyixkM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-to5b_NyTPRetGul3cnnkFw-1; Sat, 02 Jul 2022 07:42:02 -0400
X-MC-Unique: to5b_NyTPRetGul3cnnkFw-1
Received: by mail-wm1-f71.google.com with SMTP id
 o28-20020a05600c511c00b003a04f97f27aso2625934wms.9
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jul 2022 04:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U/E75hYHnDmeoMvjyYpzgfBvleWEuDkid2Zmq4jEV8k=;
 b=Up0+cuDUjsVGRIzzAtrjyCAyp5Wm2MeAqWZc6ioitJfZIh3+9a8CM9NfaUNKHPE73+
 lpu7/ljm3es2FSrzjEzSzxWkqFJOsB0OBwT/WL3Kc+Z910Wc29wwBG7shGCsfK5ZpYI1
 kjUYMD7mYdx2c38q8UMoNKvSvj4VponKpKgHTcOUpYyl9mnYUYh+GBrqr9nhfyYT11K1
 zjHKazJHw5EDD54Q5syQkO9++ElPn9OR31/D1AcJpVWbi3MrCctly/hjyNEuh3o6Nu0H
 TXWhHnBAO5LrjpX/+01uQErcFqTvDKODU8h0lChxS61EoJF2wxFsEbNr4ubP1+BQFASa
 j25g==
X-Gm-Message-State: AJIora9bFDQULccEMg1MjEvxx6hz9Gu9n8mULdNsF7vNIOMZmERXN4Co
 +abaE4YqSdZX0Q75eYarXmgLEuLfTcr++Bqil9DSf3YyDw6sG4bK0dePnsRrw8bELbL8/VAkzMr
 DVtO6W8eh4ppVU3HVobQdeK/HdlhP
X-Received: by 2002:a05:600c:19cc:b0:3a1:99b7:524 with SMTP id
 u12-20020a05600c19cc00b003a199b70524mr22924wmq.37.1656762121608; 
 Sat, 02 Jul 2022 04:42:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tBQ3B3FAODT/Ald/2hl3TmPSH2nx4GxQVOeZWV3poSwjCXGzwimr+qiULYTSJ8jvIi1ip5hA==
X-Received: by 2002:a05:600c:19cc:b0:3a1:99b7:524 with SMTP id
 u12-20020a05600c19cc00b003a199b70524mr22894wmq.37.1656762121389; 
 Sat, 02 Jul 2022 04:42:01 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v15-20020a5d43cf000000b0021badf3cb26sm29564696wrr.63.2022.07.02.04.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 04:42:00 -0700 (PDT)
Message-ID: <00bb12a1-de3c-7a29-109e-ee0faa900b66@redhat.com>
Date: Sat, 2 Jul 2022 13:41:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 3/9] drm: selftest: convert drm_rect selftest to KUnit
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
 <20220630004611.114441-4-maira.canal@usp.br>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220630004611.114441-4-maira.canal@usp.br>
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
Cc: Carlos Veras <carlos.craveiro@usp.br>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matheus Vieira <matheus.vieira.g@usp.br>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/30/22 02:46, Maíra Canal wrote:
> Considering the current adoption of the KUnit framework, convert the
> DRM rect selftest to the KUnit API.
> 
> Acked-by: Daniel Latypov <dlatypov@google.com>
> Tested-by: David Gow <davidgow@google.com>
> Co-developed-by: Carlos Veras <carlos.craveiro@usp.br>
> Signed-off-by: Carlos Veras <carlos.craveiro@usp.br>
> Co-developed-by: Matheus Vieira <matheus.vieira.g@usp.br>
> Signed-off-by: Matheus Vieira <matheus.vieira.g@usp.br>
> Signed-off-by: Maíra Canal <maira.canal@usp.br>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


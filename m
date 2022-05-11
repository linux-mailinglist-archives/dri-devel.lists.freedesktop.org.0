Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F852523026
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 12:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061DE10E263;
	Wed, 11 May 2022 10:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AA110E263
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 10:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652263382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMjB2G7unPPwPenmqo3rYuStQgbqeYx/VKs8u/BpsWU=;
 b=U83Zwb3DNx0n3zAOGVosQtRQZBtTXST/nPc0DvwLd2g+sjyHJ7q8NJ18xw51Mp2Ksz5gfK
 UEJBAPyM4gsQxx+7P1TegBgEPXHsUOtxQchSE7yA0RyxDj0R72tMhOtU+glGkf4vYe7ucH
 ipExGetLM8SWGhROGQ4LpbcGMq3qLeg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-4ddGfmv8M6KQHTPpJ5IdOg-1; Wed, 11 May 2022 06:02:53 -0400
X-MC-Unique: 4ddGfmv8M6KQHTPpJ5IdOg-1
Received: by mail-wm1-f69.google.com with SMTP id
 n26-20020a1c721a000000b003941ea1ced7so545177wmc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 03:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hMjB2G7unPPwPenmqo3rYuStQgbqeYx/VKs8u/BpsWU=;
 b=SWIXUY4FMF0IBq/adMlxOfFH69L1TRD5ZGaWCIUTyS7nilP98+0ObB4oYHRNQv4lyF
 Nzr9UjFbaXndYH6l7LDYF9Shnvdxhayz9CoTvM/UflEjqeP6bVb4bVycIyLf73gz5mCe
 c02jysmnyaqaDhV9S+qqU5j3ObAbFkkrZbaOaIrHnb3rbgVSLU59Czt8jOkA/RLq6qqr
 ewKfuRIJtghyePBPyX7lufwOiSn/BY/7gCCRvoYX7I9xPFxIoLBTdXsMF3fE0LoSYN6k
 0G5wRiOfnVg+JvCWyvDWdwZhfRiviNA4w6XoNQHnhjl4Dp43N+YR5QEIcoVEBGwLzKzJ
 RqjA==
X-Gm-Message-State: AOAM530A5Q5cy9NEZXH0cDY8Y4QqUh2LYHmmx/3oNyU4dqRMEAQa7sPU
 kwOw7fom+uC3Olm3I9FAf+MZBzVGDbamo3iL6YuE70DJx9kUqDxlvmUskECcj2w/1wo4VA5s1RE
 FimIlvCNYdtTOuHwfwD+lZEWCaTu/
X-Received: by 2002:a05:600c:2216:b0:394:54e4:ac9 with SMTP id
 z22-20020a05600c221600b0039454e40ac9mr4011039wml.47.1652263372572; 
 Wed, 11 May 2022 03:02:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBrUeSkbT+4BLrmflKUrHND/RUBjX08SqbSZAl0SlOD/xx+nWkDhsOnzXIoctbZYlHxbFdYw==
X-Received: by 2002:a05:600c:2216:b0:394:54e4:ac9 with SMTP id
 z22-20020a05600c221600b0039454e40ac9mr4011006wml.47.1652263372241; 
 Wed, 11 May 2022 03:02:52 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s11-20020a05600c384b00b003942a244f57sm4864259wmr.48.2022.05.11.03.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 03:02:51 -0700 (PDT)
Message-ID: <1f5fbef3-d098-6235-0fda-2fcd81bade9c@redhat.com>
Date: Wed, 11 May 2022 12:02:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] MAINTAINERS: Add simpledrm driver co-maintainer
To: linux-kernel@vger.kernel.org
References: <20220505172610.338299-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220505172610.338299-1-javierm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/5/22 19:26, Javier Martinez Canillas wrote:
> Thomas asked me to serve as co-maintainer for the simpledrm driver.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Pushed this to drm-misc (drm-misc-next).

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


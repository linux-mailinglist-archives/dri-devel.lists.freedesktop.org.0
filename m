Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06545261D9
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 14:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B4410EAB7;
	Fri, 13 May 2022 12:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAFB10EBF4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 12:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652444970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RUx2v8qsPenRXH9JcXLDmo2qkX4LLDjdAwjr1Yz2a/c=;
 b=ZfHbEc9eH0brNZ7Aoyiv3kHp0y5XZHy37hfLGLfBnxxwiUV0V1Oj13TyHa5Fr6BkPmOOPs
 QFx1zgBCeSXJoW6CQzwr8DFAJEPMpEzxq1ZQOXpoPV7W29lntHvlS1ZpcU5HFRMQkfe5t0
 /LoWnOAGKk4vY5sHh4hyulplWfcTuzw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-jlsTAzKvNZSpJUmPgRBhdQ-1; Fri, 13 May 2022 08:29:29 -0400
X-MC-Unique: jlsTAzKvNZSpJUmPgRBhdQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg7-20020a05600c3c8700b0039468585269so2871673wmb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 05:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RUx2v8qsPenRXH9JcXLDmo2qkX4LLDjdAwjr1Yz2a/c=;
 b=tiZ8MlAzwKXi/oCI3ze+ap6RGZpTrbCRXt8hY55cVtprE1QU4q4mxU97ov8s7Ke2aZ
 Fwa6X27m2yeZ/LRIRI4nJMGgHz1yXBpQr7Hg0iUAigC2nFnQvAYszVeZajnQ1rN0tVs9
 Mfe/XFgsDRdeGSFyooq6b1mixYz9Sd3S7SWRYtzbS4OgcC6f194WNHKQ5Y6lEPNqcPxH
 Z9WGf3K84ANWIUF9I/f4B1fSiRaiUknRPgta0bhEin8MKBT7bZ3MGuuK+1AEdwMmMReJ
 Kjqq/hhUF2y90MZzDZNrEaHoStlSOGE0AVYZkdqEECn3b0UPr8LiUUZdIHLIaE1d6XiO
 CGqg==
X-Gm-Message-State: AOAM530mR9fZ5551BMZx76TkDqwoLOFVQz6M6HheAl4krILJnPzeptL/
 pDYPOWetoj1+DeuOVfJ+uuwkGyQSh8nMIJ7VjsunGBCVhmY6vWvHwsqfG4xMULiPoRWIvSTqJDs
 QT5OhgZZhyq3SPYMQCMrHRhLoBjIj
X-Received: by 2002:a05:600c:3ba5:b0:394:6a82:8dbe with SMTP id
 n37-20020a05600c3ba500b003946a828dbemr4251410wms.185.1652444968342; 
 Fri, 13 May 2022 05:29:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZHiFgsQEc6o9p9wXNxY7rLpgdqYrrRy8dqWoxDl7lbXz2Av9EzL6Uyc1s2ZY/cv0n+100bQ==
X-Received: by 2002:a05:600c:3ba5:b0:394:6a82:8dbe with SMTP id
 n37-20020a05600c3ba500b003946a828dbemr4251399wms.185.1652444968161; 
 Fri, 13 May 2022 05:29:28 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o42-20020a05600c512a00b003942a244f49sm5910754wms.34.2022.05.13.05.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 05:29:27 -0700 (PDT)
Message-ID: <0876d022-f6e2-a0cf-0e16-d6a19aec0a48@redhat.com>
Date: Fri, 13 May 2022 14:29:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] fbdev: vesafb: Allow to be built if COMPILE_TEST is
 enabled
To: linux-kernel@vger.kernel.org
References: <20220505120419.314136-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220505120419.314136-1-javierm@redhat.com>
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
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/5/22 14:04, Javier Martinez Canillas wrote:
> The driver has runtime but no build time dependency with X86, so it can
> be built for testing purposes if the COMPILE_TEST option is enabled.
> 
> This is useful to have more build coverage and make sure that the driver
> is not affected by changes that could cause build regressions.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Pushed this to drm-misc (drm-misc-next) with Thomas a-b tag provided over IRC.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EB452852E
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 15:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C76010FD99;
	Mon, 16 May 2022 13:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840FB10FD99
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 13:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652707242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dELa0kqJ48jnMsYrEzVOCsn1qNewVRHQLKLAt7lHW+o=;
 b=LCODEcfPLUpQR2fdrfZ6MkMyjdaFn2KRb3jZKEwCF1Z6AsRkdzfgiZqauHm1MGsiYzBVpo
 v/GZVASD/d1NORwrX5/i10vDErCL2BBMPDsdE4oJaqf9bFOwAIE6uSaKdDTSR4dIzTQie3
 wda3oRhC0354MP3RTHAFJ810hCy+bV4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-EE8sB1hcPcGaq41aU9WFSg-1; Mon, 16 May 2022 09:20:39 -0400
X-MC-Unique: EE8sB1hcPcGaq41aU9WFSg-1
Received: by mail-wm1-f71.google.com with SMTP id
 h6-20020a7bc926000000b0039470bcb9easo5651193wml.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 06:20:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dELa0kqJ48jnMsYrEzVOCsn1qNewVRHQLKLAt7lHW+o=;
 b=XTfgjL4xtudg/6EMEKjw2UmA9GLOUKCJUmoqL0HcOG9nnuetRyDhKYwOKVrQKHCHkZ
 Bz9piqJeZeiXxWW9CAYPcifYx4f8h+NPIeJThnhYtY6QtOx2PKXqOxqP/PySNHyldzqG
 LI3G1tMRrPkg+vEfqhR82o42mZ90T3+/8UpSMvZHQ1uFt6pykL0lF1xKf0fPfv3KDGUw
 kHmBCNSVy16EMI5oEF/lSrMlqrPjiasN5xujwLswoWI22BoToe96GcZdBaLoURL56Lhu
 YudvDt9/h6ZqiijUAG6NIpr+EMga+Y6EE1RI0iVFsDq2d7NL5eglxy4obbAAFqamJXNB
 re3A==
X-Gm-Message-State: AOAM53253Q8l4DwZFE02lr+0LAquHW4sPg2VgdQdKsw8ZXuGWAp69z6x
 qL+wpIwKQhlSfn347K0eJal0otzv53W696rtJoIklmbCqJ0CWRYbfKZJQ5/5/nu3PhbEKzRxaCa
 oFTIXSEGw6sk25QKF067Sytg/whaB
X-Received: by 2002:a5d:6802:0:b0:20d:295:cca2 with SMTP id
 w2-20020a5d6802000000b0020d0295cca2mr7218443wru.394.1652707238055; 
 Mon, 16 May 2022 06:20:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2cy4m3zyn9MsY3QyUWUJKTr/FN2J7BehI9TXrU3ZLt/Jjt5do8DDnCZaZxyWE9FUhtLmHlw==
X-Received: by 2002:a5d:6802:0:b0:20d:295:cca2 with SMTP id
 w2-20020a5d6802000000b0020d0295cca2mr7218421wru.394.1652707237830; 
 Mon, 16 May 2022 06:20:37 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e5-20020a05600c218500b003942a244ec1sm10705207wme.6.2022.05.16.06.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 06:20:37 -0700 (PDT)
Message-ID: <b618607c-4201-e0b1-7a71-a18910e67d4d@redhat.com>
Date: Mon, 16 May 2022 15:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/4] drm/gem: Ignore color planes that are unused by
 framebuffer format
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 noralf@tronnes.org, christian.koenig@amd.com
References: <20220509081602.474-1-tzimmermann@suse.de>
 <20220509081602.474-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220509081602.474-3-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/9/22 10:16, Thomas Zimmermann wrote:
> Only handle color planes that exist in a framebuffer's color format.
> Ignore non-existing planes.
> 
> So far, several helpers assumed that all 4 planes are available and
> silently ignored non-existing planes. This lead to subtil bugs with
> uninitialized data in instances of struct iosys_map. [1]
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://lore.kernel.org/dri-devel/20210730183511.20080-1-tzimmermann@suse.de/T/#md0172b10bb588d8f20f4f456e304f08d2a4505f7 # 1
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


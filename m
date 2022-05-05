Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF8251BA7E
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 10:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD36B10E4B4;
	Thu,  5 May 2022 08:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.129.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AE910E344
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651739448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rqBSEx+prjdTiMrGpV1aqsQTWQSdTrwVLGOaM2DRpu0=;
 b=H/lZOZLNVgf1mffj2xIa53c0+4EkfZ3xql/x27s6DRnwFS6StC8ParuZmInocJb9Wsn5RB
 zBqNlevTOzX1rdqXwQ/eeEEfznyXo4POFd+ATZD5sK3EItnHaTw8h423ML0eLhJ89/PdQh
 HaLj1S/odoPwOOcbOKq339gIZAgun28=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-tpR2z8hWPaWLW8AU0AcOeQ-1; Thu, 05 May 2022 04:30:47 -0400
X-MC-Unique: tpR2z8hWPaWLW8AU0AcOeQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 d6-20020a05600c34c600b0039296a2ac7cso1476950wmq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 01:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rqBSEx+prjdTiMrGpV1aqsQTWQSdTrwVLGOaM2DRpu0=;
 b=kRhXnQMM+95NtIxAJkZ2O5HBnDdbTu4tnRRX1PZklpqDTs7mjtKLeB0Wcm1PK6THe1
 lN6BYfRYJB4cQValEqnGe+LwCpro1p4OIRM5QK3tWPZK7JTLkDVfc6/i6HSQCizfucOb
 4zjdITQn5xvuw6Qu0kEMvcafTI2N0kBsNGLEzaus7cKVNEVfeS6hd7x5fIYJz2vJ+O+T
 LV7a2okxjK3kJcuWMtVt+YiWflECuzyEcNvSNryIvbhXKP6K8dyxSnT+3zrDowOy9O0U
 58IRQdmv0MoiPytv3KcVPenF4f6q0XjqnTA38cXPBIXJYowTauEBZswmgJRXoUvH8VJY
 SyVQ==
X-Gm-Message-State: AOAM531RlLc4oFhIDaD7xM+nf9JsotcjHs5aAzIpoY0WyswGWXeQJe2S
 24WLwpDOPiRHdfkuEpjHjyM9Z+Z8qSE9torXT65JNcV7NY1mDDsE3ttOOLviem4KjwGVQ/EAupi
 RKYlfVZ+PuZ6NYgFY9z7ztC/pOx7a
X-Received: by 2002:a05:600c:21cc:b0:394:12ff:dd8d with SMTP id
 x12-20020a05600c21cc00b0039412ffdd8dmr3524893wmj.132.1651739445197; 
 Thu, 05 May 2022 01:30:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFHaBQnPBJ08w4wMFqpq4uA/qAMN794Kl5iBycIsNges0PhcSzS7HhVQE1ACXB2xwj0udL/A==
X-Received: by 2002:a05:600c:21cc:b0:394:12ff:dd8d with SMTP id
 x12-20020a05600c21cc00b0039412ffdd8dmr3524869wmj.132.1651739444856; 
 Thu, 05 May 2022 01:30:44 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l18-20020a1ced12000000b003942a244edcsm846083wmh.33.2022.05.05.01.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 01:30:44 -0700 (PDT)
Message-ID: <14afd90b-0bf3-aa01-3b97-db7e29fb858a@redhat.com>
Date: Thu, 5 May 2022 10:30:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/3] fbdev: Fix use-after-free caused by wrong fb_info
 cleanup in drivers
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220504215151.55082-1-javierm@redhat.com>
 <e0bc775a-f17a-adf1-9b2c-4be91468b7f8@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <e0bc775a-f17a-adf1-9b2c-4be91468b7f8@suse.de>
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
Cc: Hans de Goede <hdegoede@redhat.com>, linux-fbdev@vger.kernel.org,
 Peter Jones <pjones@redhat.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 5/5/22 10:16, Thomas Zimmermann wrote:

[snip]

>> Patch #1 adds a WARN_ON() to framebuffer_release() to prevent the use-after-free
>> to happen.
>>
>> Patch #2 and patch #3 fixes the simplefb and efifb drivers respectively, to
>> free the resources at the correct place.
> 
>  From a quick look, vesafb seems to be affected as well.
>

Right, I wrongly assumed that we only cared about efifb and simplefb but forgot
that vesafb is used when setting a VESA mode with vga=foo. I'll add it in a v2.
 
> Best regards
> Thomas
> 

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


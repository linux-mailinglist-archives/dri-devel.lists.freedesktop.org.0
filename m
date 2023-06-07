Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B2172553F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 09:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FC210E446;
	Wed,  7 Jun 2023 07:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F90D10E446
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 07:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686122238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z8ZRfR4SbsRmuStbxG9wgKBb6rXoxZXDXcGM0Hiws6Y=;
 b=YFonmdq7SjuXomE8iV0XwkqH2Wsu2nnynHUVs07wPZRUCj0yJL8S4x2erRFmbPPVXF85rj
 q2C7Zg/F6hUgGWHKHZUGZHHLYJ7GXqISKeIToa/QWEKPSpfDFCeR5FdfgNIXNKRDPuAJCk
 gtrJMgcsugAlL0tP1sGFg5js/ioEYak=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-tmHuWrLDPCOeCi-ovVApOg-1; Wed, 07 Jun 2023 03:17:16 -0400
X-MC-Unique: tmHuWrLDPCOeCi-ovVApOg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f603fed174so39566295e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 00:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686122235; x=1688714235;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z8ZRfR4SbsRmuStbxG9wgKBb6rXoxZXDXcGM0Hiws6Y=;
 b=S9fHGILcjibIQWqMeN389KOT1DLpNDkmBcPi+cTxJ/tzzc7oL4yU25ZOntUifL57AJ
 Xu+xNPfyfziTZIPbpvJmYwfxVrHfI+4qUDS53qKjdtU3dtUrbCFM8ytwEQ2TFizeF+2w
 l/28co0KVSXwegnUUcjmb7W+hudI53K0WiJuTi7nULBEeAlLjV52QSglvoSY51ONSk4E
 5T5kQIw1TKccr7UcwVrbxU59fCIHqQ2XBWAYvDwWdx4/wweUb7vXg1vXu1DimgR6+0DL
 KTeGMplWGxLykQ1OSuH8eKPbmGS7GbMlqHmvkMgVnzdRQDayBxP8IoENrm+0cebsjHyL
 N7CA==
X-Gm-Message-State: AC+VfDwTDy3J60jMrVp4kTdqZz6HTJCZg8LLI0Z6qUjNSzZJnnS9tvpL
 ks1g+iIfciMfBq4Yf6o0qWHEdAhxqzW+r5e74prQ9il+dtC7i/+3MMtMTK6eShJ945ozorSyKao
 v/zpBmdALaeqtPhNVeiRkd4lk+4QK
X-Received: by 2002:a7b:c7d4:0:b0:3f6:117:6ed7 with SMTP id
 z20-20020a7bc7d4000000b003f601176ed7mr3883287wmk.35.1686122235552; 
 Wed, 07 Jun 2023 00:17:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7+t4ruO68j5xRFuJyfpOU2/snN7eVdCEGUlFwfIVjPMhRolkXR3gPuON67Rkmj4YBG7RPArw==
X-Received: by 2002:a7b:c7d4:0:b0:3f6:117:6ed7 with SMTP id
 z20-20020a7bc7d4000000b003f601176ed7mr3883273wmk.35.1686122235304; 
 Wed, 07 Jun 2023 00:17:15 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m9-20020a7bcb89000000b003f72468833esm1113666wmi.26.2023.06.07.00.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 00:17:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] drm/ssd130x: A few enhancements and cleanups
In-Reply-To: <6b0a12bf-a8d4-43df-860c-3aa271cfc624@suse.de>
References: <20230605074753.562332-1-javierm@redhat.com>
 <6b0a12bf-a8d4-43df-860c-3aa271cfc624@suse.de>
Date: Wed, 07 Jun 2023 09:17:14 +0200
Message-ID: <87edmnhhc5.fsf@minerva.mail-host-address-is-not-set>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi Javierm,
>
> I've read through the patches and they look correct to me.
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>

Thanks a lot for your review!

> But I had one question about the page size. You round up to multiples of 
> page_size in several places. That could lead to an out-of-bounds access. 
> Do you need to allocate GEM buffers to be multiples of page_size as well?
>

That's a good point and I would need to have a closer look to the driver
to determine if that's needed or not as well. If that's the case though,
the issue is already present in the driver. We could fix it as follow-up.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


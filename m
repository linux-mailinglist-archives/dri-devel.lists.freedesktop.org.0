Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A17066F19B3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 15:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28D310ED4E;
	Fri, 28 Apr 2023 13:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7779B10ED50
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 13:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682688896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=dWxMkCvWEu+arFw1gpe7z21UJ8AWcg2CVkPuzsX/4rGGCBQUTQDOe7k1j+gvHb2/ts0JhS
 h4xk3bR+6YY+mkPFMM+Ef33pYcYWXVADqYwWB3deZqbhN9MdknBV9bTg5MVfHvLXncRkO7
 cfJaeP9l1mweC53cHi4T5O1X1PaWdtc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-j7IJdsuIOkiNwqRrb6RANw-1; Fri, 28 Apr 2023 09:34:55 -0400
X-MC-Unique: j7IJdsuIOkiNwqRrb6RANw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30467a7020eso4923968f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 06:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682688894; x=1685280894;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=JJNM4YgDStgXJik2IkiwdYpQKC0oE9fj0mDqcWcRZWu2Fe9Lf9YnAhldYogwX9DXtI
 VzOwRtCRfVaAbliOkYR1U9Te34uprHISkqLsCAOEU8cnlYpp7DtUZtF0h/lXY0GAy4Rx
 e2VEpptDFW+4S4tpoIM52wADv5F9rH+wMjyT17i1YfCF18vx0qMNomnmYjHYU2ftUZ8z
 DCed9QnAS1Om94utm8HE1nNkUWbBXftP5r70thr8Q4Qe6DKjukMJuSLVWt72JOX76dfZ
 vQKoVYZxVFvceSzlKj++jIMG+iNyLrkgiZmQyxz6zZi3obs1hKThI8QsSSZFStjJR7ih
 LjaA==
X-Gm-Message-State: AC+VfDyCoIJ8SiRwlWwq4N1ygZAhnWw0QxowISaGWoNvSEEjJmXxKIWU
 /J1XGIgj9SS74E+p03TLSKuyzJIPvGIeOeuF+yKegb3lfyYY3Xt4BN2ZEYqDQ1YCcLnowjfwzgs
 HKZf2ZdlEpuz7ETs145hL8w/lzskK
X-Received: by 2002:adf:f083:0:b0:2f9:9231:b214 with SMTP id
 n3-20020adff083000000b002f99231b214mr3957984wro.37.1682688894258; 
 Fri, 28 Apr 2023 06:34:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5htILUCvMFPMWXFrSmDExwQIMCD2yiZsehHOE5PUQRmEVz2mgVOtPbubjCmOAAGZURFPcYyQ==
X-Received: by 2002:adf:f083:0:b0:2f9:9231:b214 with SMTP id
 n3-20020adff083000000b002f99231b214mr3957969wro.37.1682688893951; 
 Fri, 28 Apr 2023 06:34:53 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c7-20020a5d4cc7000000b002fa5a73bf9bsm21125421wrt.89.2023.04.28.06.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 06:34:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH v2 03/19] hid/hid-picolcd_fb: Use struct
 fb_info.screen_buffer
In-Reply-To: <20230428122452.4856-4-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-4-tzimmermann@suse.de>
Date: Fri, 28 Apr 2023 15:34:52 +0200
Message-ID: <87cz3ogmf7.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use info->screen_buffer when reading and writing framebuffers in
> system memory. It's the correct pointer for this address space.
>
> The struct fb_info has a union to store the framebuffer memory. This can
> either be info->screen_base if the framebuffer is stored in I/O memory,
> or info->screen_buffer if the framebuffer is stored in system memory.
>
> As the driver operates on the latter address space, it is wrong to use
> .screen_base and .screen_buffer must be used instead. This also gets
> rid of casting needed due to not using the correct data type.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


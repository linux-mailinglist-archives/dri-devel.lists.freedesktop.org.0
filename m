Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F74EA82454
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 14:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AED510E860;
	Wed,  9 Apr 2025 12:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BzAQ/Bdu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EF110E860
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 12:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744200484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kCvjuJG694/CHcqxRL6/SHd0pXzTwZPbyCr1soiBCdk=;
 b=BzAQ/Bdux1Xr/hrD/7too0voHIg6qgwSv43FkdM95O7gjeqD90Vd1t/q4/7Ve+BM/J6I4C
 5RdLdv+b5ZmBfPsG7aHD9PUCD4qknraVE8yx1e2+MtiOZ7PTmG4wCWeeeSYSxTkMzKpFEl
 xh75gOh1aos8pNggzlP3pbSo+XFFgg8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-26pdZ1KpPYOUAL5wqUXqdw-1; Wed, 09 Apr 2025 08:08:02 -0400
X-MC-Unique: 26pdZ1KpPYOUAL5wqUXqdw-1
X-Mimecast-MFC-AGG-ID: 26pdZ1KpPYOUAL5wqUXqdw_1744200482
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3913aaf1e32so3899017f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 05:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744200481; x=1744805281;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kCvjuJG694/CHcqxRL6/SHd0pXzTwZPbyCr1soiBCdk=;
 b=j4e2IBsI/CDNWlotdcF9AnICJhBHV9HdT4SzkCfRR7Lh2y8Au81vlJUEB2r+5pfq3e
 omJXFCFhrtnKlDHp22TwIjBJ1YtkCoq4qp6oPyrnI2xvnjPTyO1AUEpefjknFdLz0tq0
 IUokAOookvJONE2jmdnBV+Ctjd2U7wJ3SO9/fZjk/tXgLRweuosqBp3ZtIPDAPrgyWmn
 MqCC31oapOyhCf8Bc3lkWD5w3k2q4+pVAiGSobo61fik4aeYyLj54B2TPuhJmItn1ZXl
 MJKbBMjjmmLNyQCH2/C0mzjPBTsAfdtmKK8NFDu2rmYyGzNZ+/FBSRURjH5YMXqx2aOR
 lmEQ==
X-Gm-Message-State: AOJu0YzvUKH+JV42ugjWu6ZTtpGRWl5KTZjK8BYOPBjmJ/idpz7ETzen
 5oRA24VzYLGDdWbLKbdSbwmu9OJWmCQNsQYD6Dc3SniJXKDCJXFJdSABEvcc4MU9QYKd8b4tlEA
 Gl295pZzmV2mAqBmOOcFIPyWo+2sdPk2c1rKClkU0yfzr0eAJ8gxRA8TzX74KkZU1XyJyOCvmTg
 ==
X-Gm-Gg: ASbGncsCCQCXdi8IPEH4KG6hYMPmS++yOPDruDLLye8B2egm+f9I74gz8N/A7fkytKH
 IPwQATtxovvMTvL3MalUfYSBz73PhDaa4OtaU8kMi2Id5F7j3HHmslr/d4Mm7e57oFiQv6pEXep
 epVQkDQtxePc/HZfoyBRsAPrRmoGZilLcw5LLML5Oo7QwYz8P3HDQny0xqt7Ymp+JIcjF8e+/ir
 FazAkvdb15EPH3p0p4Sm/rBRwsKYFfCbuXT7p+2hlvmwu7cAwago3jDtxX3qnj902qo76c0HrKL
 asGP9QvvlJ0bgjeoO7su5JYEzh6DsYlMdqdIfNu/6mcMboQTISy+nrpTGFSZ8C+qjMqkfg==
X-Received: by 2002:a05:6000:430e:b0:391:ccf:2d17 with SMTP id
 ffacd0b85a97d-39d87a67bdcmr2300406f8f.0.1744200481075; 
 Wed, 09 Apr 2025 05:08:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGecikQMGfcRWAWRQ2NOn5LtMF0T2KJVQQxrAGMhwK20jonEis8SpV3Ow8Ez+EzRJTgaFNBHA==
X-Received: by 2002:a05:6000:430e:b0:391:ccf:2d17 with SMTP id
 ffacd0b85a97d-39d87a67bdcmr2300386f8f.0.1744200480736; 
 Wed, 09 Apr 2025 05:08:00 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c8224sm14239295e9.22.2025.04.09.05.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 05:07:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] drm/sysfb: Share helpers for screen_info validation
In-Reply-To: <20250409084729.236719-4-tzimmermann@suse.de>
References: <20250409084729.236719-1-tzimmermann@suse.de>
 <20250409084729.236719-4-tzimmermann@suse.de>
Date: Wed, 09 Apr 2025 14:07:58 +0200
Message-ID: <8734ehfsgx.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FnygvX3akQaKCoF_b3UzJxWVmWlsJ2laG18yp_AdLtU_1744200482
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Share efidrm's and vesadrm's validation of struct screen_info in
> shared helpers. Update the drivers.
>
> Most validation helpers test individual values against limits and
> can be shared as they are. For color formats, a common helper looks
> up the correct DRM format info from a driver-provided list of color
> formats.
>
> These screen_info helpers are only available if CONFIG_SCREEN_INFO
> has been selected, as done by efidrm and vesadrm.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


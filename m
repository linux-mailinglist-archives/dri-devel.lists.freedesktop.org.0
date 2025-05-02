Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D78AA7B74
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 23:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF34E10E29D;
	Fri,  2 May 2025 21:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MlrJ5IRz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0374610E29D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 21:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746222388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qahbo3crElebDURDi/YqbJUSVFuNiuA50iMSrGmQ2PQ=;
 b=MlrJ5IRzAWKczanC8Rs3mbSqBdFo1CqwppoxI5bYnGLRGmO6VjTlTJG5rXEKmnk7sCxhZy
 S0s6WytenzlW1wISw5ypEYWHt4ESgvE+HrhAQW+7aZbK2Fn9pbfLAgF56FvnYktdTzjSih
 Zy5Ja4dvmPLEJ05x5aDNuLk7lJqDfqM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-HlyuDskeObyi9svkY_7HFg-1; Fri, 02 May 2025 17:46:27 -0400
X-MC-Unique: HlyuDskeObyi9svkY_7HFg-1
X-Mimecast-MFC-AGG-ID: HlyuDskeObyi9svkY_7HFg_1746222386
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43cf172ff63so11238625e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 14:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746222386; x=1746827186;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qahbo3crElebDURDi/YqbJUSVFuNiuA50iMSrGmQ2PQ=;
 b=lxRdVkOHJrqVnp+TDu2/LY8E6QwP2H5scx9lOWK/7AITWcXn33ZOQn98AaN5R7PV6V
 4qF5ux2QYCqmOnnlvBTUIBXdGLECHJANjPIXGlFWJfu2Hmnu/kyC2t0mzXA/QS0IQYrG
 AsY/L1Q4zJ+sDMNI1lb+hKLdRZhPoByf4TGvFYrnXxXWgqVxgqLA85wudZDtrxtK0i8p
 pV7L2lpaNcOiry1bYMAbUv37uIxvg+Lc8AAInzDRxvwit2Cd5s2OpQ7gaqWS6KNtoduC
 SmOtj7qA9FSBEs68tyvH9lKWY0SBiIbe7GumW6uJIjCwcp7NgrnSzymsJRHR+UPPF5+3
 WHRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXymP4ynfSk2aX05sRBZwTXOpHm0fhINGdDImsJZOhvAm2WO5o/aI8pytuBIuBQhgZR9bQeKd4Oqks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUVFJudeXw4dUXlZSLwGxs1gaEVFHMS6YnTevFSJs/Yg15bYEJ
 e7uIWGlatAy9rbcnKcmL9ToL6jLTXlfsKXvmgW6uGgMCiWYG9RUAdqrKaPuuW+7jb/snf2NvDoS
 1/piB3MHJkEtt2LfIFyW3X3MEuSFzImkDi141O5LdYT27LqIuvQdQL4ilKMN1WGVCOg==
X-Gm-Gg: ASbGnct1fTscGOfTQOstrOWbidfG3pjSa3p6E7yy50YRe7v/f3F5JWZVlg0sP7OrffU
 6ALB9XEUzZod8ziz5woTfnOd7T/zhzUmVHIWLb6nJp/set3RK/6DgXl+5boIczUu86Wx5x/EQSi
 yBVwk1JDXOQ3hVFzj53UhElpuHBVYHPtAoDGhsjMoSTSL1wAW57Bv+53nf6KyrBfonFiITP6SyS
 w3+DfHyUtxoDHVnpM8xjAmQjQKnSkbVDS+4vbsux0EWlRbkepNQEa41KgECkOJ3XGkg1Qb8SGOB
 pfgldJvCUKbzHthmlcpnj7pCXpTeZzkKp5NmKe/KMl26B2aC6tq0rAdzDO44HuX5OaSiOA==
X-Received: by 2002:a05:600c:5022:b0:43c:e6d1:efe7 with SMTP id
 5b1f17b1804b1-441bbf34052mr33060915e9.26.1746222386014; 
 Fri, 02 May 2025 14:46:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9F3jRqEYmLmAVEbUTid9i2DombAT9dIMgyp5RDfvj5Q7CwTNt4gGGQ8wqa4dSHLhfQuMcXA==
X-Received: by 2002:a05:600c:5022:b0:43c:e6d1:efe7 with SMTP id
 5b1f17b1804b1-441bbf34052mr33060785e9.26.1746222385690; 
 Fri, 02 May 2025 14:46:25 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b172b3sm3168912f8f.90.2025.05.02.14.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 14:46:24 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, David Lechner
 <david@lechnology.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/sitronix: move tiny Sitronix drivers to their own
 subdir
In-Reply-To: <aA8yKi0QDCg1k8mS@gmail.com>
References: <20250428-sitronix-v1-1-4e7cc0a8195a@gmail.com>
 <877c3421tb.fsf@minerva.mail-host-address-is-not-set>
 <aA8yKi0QDCg1k8mS@gmail.com>
Date: Fri, 02 May 2025 23:46:23 +0200
Message-ID: <87bjsavg7k.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 786rMhf1xw9JF4_rBLb5rYy0PznGSBqlTvztREEVFTs_1746222386
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

> Hello Javier,
> On Mon, Apr 28, 2025 at 09:16:32AM +0200, Javier Martinez Canillas wrote:
>> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>> 
>> Hello Marcus,
>> 
>> > We start to have support many Sitronix displays in the tiny directory,
>> > and we expect more to come.
>> >
>> > Move them to their own subdirectory.
>> >
>> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>> > ---
>> 
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> 
>> You can also include the following if you feel like it:
>> 
>> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Oh, yes of course, sorry for that.
>
> To whoever applies this patch, please add the Suggested-by tag.
>

Yes, I can do that. But I think that you would need to post a v2 anyways,
since two fixes for your driver were merged in the meantime and otherwise
there will be merge conflicts when applying this patch?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


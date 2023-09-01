Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D3278FA91
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 11:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D37710E00D;
	Fri,  1 Sep 2023 09:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D7E10E00D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 09:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693559978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TxaEqKAot2YDZpT3+Zb0cnetSMOO6oSzvZxYp8+PXg4=;
 b=ROXRJnM4KhvyUO74+2PaesrfYo/U28VGDo9EeuQBdiUiURjhC0+EBLAFpOi1Tes6SJeF3L
 aepljFZlkBMuP0RPFqJhbmgSwDiAUe6cMjMMQeoeRvQhymAcYfqN0DHN+chNu+4WVSXGcA
 fPoFzDJj0X5QfGw7H4idEdN4d4ZxwbM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-_d5iCNu6Pr2d4f2QO7zJQA-1; Fri, 01 Sep 2023 05:19:37 -0400
X-MC-Unique: _d5iCNu6Pr2d4f2QO7zJQA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fd0fa4d08cso11647475e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 02:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693559976; x=1694164776;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TxaEqKAot2YDZpT3+Zb0cnetSMOO6oSzvZxYp8+PXg4=;
 b=cpnyORo3Sha7dJhMaJonLjkPTLdIOxSZCAVyWzSU0OOsbQgO72LTvXBxSdUALVUe2j
 g4WjYB0tKEtdigZLWsU0uToOSeKTYsc8WmYXAUE5euc5dIV/MYxgjdS5xa7HoC9OQ44P
 d7NU9h63KYbuwgvPRljYiht+GDnrX9zWA46SsT6lFpfzh6vdnwmmt+Q/LkbVma/vh4S4
 DpM3Ge2CkA2KAyZ6KzGkjqh9XeD/RH9yJpdwbN+vYVipMJN5LcsGiNN40P8Jgo+fk5iV
 5/nTjOMqNKVGjbEeHsd6sZU9yG/mSEooNaFyTLShzU/oefFst6i8xICSTrZvqc+ZhH0H
 5pCg==
X-Gm-Message-State: AOJu0YxOf+3w65S541PWIeph+tivEm2Z20v0zpNjEH7h++vkPT9EOVuH
 T/Yb+G1x6SGUl8sogdCh2c2w1BEutsmNIYVWya5ToMGfMCF5qCZZmsh9LZs9lCyevbY/ZSuJUq5
 u6E/b9RrCLrLibV5PdCWl7QqBykit
X-Received: by 2002:a7b:cb8f:0:b0:3fc:60:7dbf with SMTP id
 m15-20020a7bcb8f000000b003fc00607dbfmr1356349wmi.41.1693559976151; 
 Fri, 01 Sep 2023 02:19:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgjIakCnIx1uWe1+b9ac1FNvsq5Jem3l4B20yMKwOjlq6edPw92y2dWuFW/CnZb1Ngwyk3yQ==
X-Received: by 2002:a7b:cb8f:0:b0:3fc:60:7dbf with SMTP id
 m15-20020a7bcb8f000000b003fc00607dbfmr1356336wmi.41.1693559975818; 
 Fri, 01 Sep 2023 02:19:35 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l7-20020a7bc447000000b003fe1fe56202sm4283235wmi.33.2023.09.01.02.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 02:19:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's
 .atomic_check() callback
In-Reply-To: <5dj43wxsszikpwbwzxx5v5h7jbx4vjjavnhzi26xgfcdp5wsws@t2hd3pawau4t>
References: <20230830062546.720679-1-javierm@redhat.com>
 <6654778d-1f40-1775-c32c-ebf9728bc9a9@suse.de>
 <87ledqbah2.fsf@minerva.mail-host-address-is-not-set>
 <5dj43wxsszikpwbwzxx5v5h7jbx4vjjavnhzi26xgfcdp5wsws@t2hd3pawau4t>
Date: Fri, 01 Sep 2023 11:19:30 +0200
Message-ID: <87jzta5jz1.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

> On Fri, Sep 01, 2023 at 09:48:09AM +0200, Javier Martinez Canillas wrote:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>> > Hi Javier,
>> >
>> > another idea about this patch: why not just keep the allocation in the 
>> > plane's atomic check, but store the temporary buffers in a plane struct. 
>> > You'd only grow the arrays length in atomic_check and later fetch the 
>> > pointers in atomic_update. It needs some locking, but nothing complicated.
>> >
>> 
>> Yes, that would work too. Another option is to just move the buffers to
>> struct ssd130x_device as it was before commit 45b58669e532 ("drm/ssd130x:
>> Allocate buffer in the plane's .atomic_check() callback") but just make
>> them fixed arrays with the size of the biggest format.
>> 
>> That will be some memory wasted but will prevent the problem of trying to
>> allocate buffers after drm_atomic_helper_swap_state() has been called.
>
> If we want to go that road, we don't even need an extra allocation, it
> can be part of the state or object structure itself.
>

Yes, I meant to have it as fixed-length arrays. But still the best option
seems to be to allocate them but in the CRTC's .atomic_check() and store
them in a CRTC private state as Thomas suggested.

Geert will post a v2 of his R1 support patches, I'll wait for those and
after that try to implement Thomas' suggestion.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


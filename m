Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B746EDDD7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 10:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163BD10E6C2;
	Tue, 25 Apr 2023 08:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A5E10E6C2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 08:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682410904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zIIauKKDlxGiywiZSy6POl99LscbO+Z+FWK2Qk7igxw=;
 b=AANwLRLKgyPm91PIgQu3wdpZvBatClorpH0sdJ8EVcbDMj55Uykcyh30YMTVYbRs6hKEj4
 xduATk9GOOWA80GPGIZlVjKkjqqdnxeIsZeG/Vtro/KlokpvyvX3xzmavE5r6NA063CE7I
 kiao7hGID9RHUjbUqZlbAO5rKZwXYbE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-munGxobcOqmGrQZqCR4iiA-1; Tue, 25 Apr 2023 04:21:41 -0400
X-MC-Unique: munGxobcOqmGrQZqCR4iiA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f1793d6363so18882625e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 01:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682410900; x=1685002900;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zIIauKKDlxGiywiZSy6POl99LscbO+Z+FWK2Qk7igxw=;
 b=OL0e18DXsiVqW6VqSiYN6sXTB/RyWnyJ26YuGZnpLnZEyXo54FFloy1/oTVfNzxRwI
 6uXSyNI+vGSOoCaAu22zJSg5mw4qZ1ADdkN+bicNtTBT+B/IRQRKHLobUYvjZqEqLHxM
 QlXgbICvEMoFtNl+9ZNz6fM234InjwQpaI0NFaDizomIGUqp/WIVI8ridQ4HICG90gJg
 JUG/S1rxisV1ESXJgFR9CFIfgy+YclmJHO/bM4YI9KNBlIPyUTQPkHXtUqby21/vg09E
 T6H0+UYm22yjt8nnEYTlA583Tam40mb8DVQz0ZfUndXX9TE2SkPtBAlajPf6n+ojtLIJ
 F9jA==
X-Gm-Message-State: AAQBX9ftfrvm6WfsQqnL+GeaOZYizBK0/1cBBmN558cxm5haHMdQB79M
 L/dMweV7tjrYS/b6nR5L0xCTs7TLvINAUcyeDQk2DlxRK4xQnWN5wRi+qnCiKeY4C1q/+c+frbQ
 aKI3SsFWoG4s0wX1YGabSnqepMo4p
X-Received: by 2002:a5d:464f:0:b0:2ce:d84d:388f with SMTP id
 j15-20020a5d464f000000b002ced84d388fmr12417115wrs.40.1682410900609; 
 Tue, 25 Apr 2023 01:21:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350YQpEqfNv2QOHfCXZ6AcQ5KinFlo+949TgOWtyI/79R2NhWA5GoU5enU8y4wOcGrnVBDnMa9Q==
X-Received: by 2002:a5d:464f:0:b0:2ce:d84d:388f with SMTP id
 j15-20020a5d464f000000b002ced84d388fmr12417098wrs.40.1682410900322; 
 Tue, 25 Apr 2023 01:21:40 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e16-20020a5d5950000000b0030490c8ccafsm556130wri.52.2023.04.25.01.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 01:21:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v3 1/9] drm/vc4: Switch to container_of_const
In-Reply-To: <6ckl6zmizxsm52imeau55bicb4hmd3p46btsqih64qaoeptvww@bktsqhuq4lek>
References: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
 <20221207-rpi-hdmi-improvements-v3-1-bdd54f66884e@cerno.tech>
 <87354sij2i.fsf@minerva.mail-host-address-is-not-set>
 <6ckl6zmizxsm52imeau55bicb4hmd3p46btsqih64qaoeptvww@bktsqhuq4lek>
Date: Tue, 25 Apr 2023 10:21:38 +0200
Message-ID: <87pm7sgynh.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <maxime@cerno.tech> writes:

> Hi Javier,
>
> On Sat, Apr 22, 2023 at 07:26:13AM +0200, Javier Martinez Canillas wrote:
>> Maxime Ripard <maxime@cerno.tech> writes:
>> > container_of_const() allows to preserve the pointer constness and is
>> > thus more flexible than inline functions.
>> >
>> > Let's switch all our instances of container_of() to
>> > container_of_const().
>> >
>> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>> > ---
>> 
>> [...]
>> 
>> > -static inline struct vc4_dpi *
>> > -to_vc4_dpi(struct drm_encoder *encoder)
>> > -{
>> > -	return container_of(encoder, struct vc4_dpi, encoder.base);
>> > -}
>> > +#define to_vc4_dpi(_encoder)						\
>> > +	container_of_const(_encoder, struct vc4_dpi, encoder.base)
>> >
>> 
>> A disadvantage of this approach though is that the type checking is lost.
>
> Not entirely, the argument is still type-checked, but yeah, it's true
> for the returned value.
>
>> Since you already had these, I would probably had changed them to return
>> a const pointer and just replace container_of() for container_of_const().
>> 
>> But I see that there are a lot of patches from Greg all over the kernel
>> that do exactly this, dropping static inline functions in favor of using
>> container_of_const() directly. So it seems the convention is what you do.
>
> More importantly, container_of_const() isn't always returning a const
> pointer or always taking a const argument, it's returning the pointer
> with the same const-ness than the argument.
>
> This is why it makes sense to remove the inline function entirely,
> because it removes the main benefit it brings.
>

Got it. Thanks for the explanations.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


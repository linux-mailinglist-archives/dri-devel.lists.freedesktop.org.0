Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8478B79CB06
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 11:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4B810E3C9;
	Tue, 12 Sep 2023 09:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3806E10E21C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 09:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694509437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ie1aGQaIRbrMT6CzFJ4g1wwT2IOjL485vR9yiGwk0w=;
 b=P5PzhOWJhntBm19z1R0zoh8AzbNu2GONL852ricSkrKZlE74Zl8btCE0xiU0WdrRgBWH2v
 5vGwzwVA05gBi29S0hzYW51XnKwN4wCnhxSXHwP4Spf1dZhcUuIVwZW0X1exGbz+Y4HGUZ
 lBltz3mvVGMEoS8TvJSHcsBtbivnX8o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-kj6Jyk9LO7KM__QZL0G1gA-1; Tue, 12 Sep 2023 05:03:53 -0400
X-MC-Unique: kj6Jyk9LO7KM__QZL0G1gA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f41a04a297so44177605e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 02:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694509432; x=1695114232;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ie1aGQaIRbrMT6CzFJ4g1wwT2IOjL485vR9yiGwk0w=;
 b=vetppjEm2E3gX37W5KxuxOPOp7dEDdCt9treoKKcnyT2cxc9FUZVGS7Tc5CPwLMs5u
 mYaMwwYed8GeDCcRPzMOLXbbUTmGvF+qqA5NbMoj2LloyhblMdpqMullspmr7WMQTXM/
 sOxgTx8rakcU8wqtJuR0HgKFKdvdxnU2hh2sd7FrArUCiWci6KgzusGP4pOfO33iiXgD
 30gMt4XTJ6X+avJLXuMhJHwriFZtb0sG9/ZIVpdF/lze9zSDwAplOg6GKOoN+J80L89m
 YE6br5NI5+0tb0eMZFXGuZ6VMif6B06IxcdDazwMV0ArC3gZlQWk42rvFKS6UViGux8m
 JZrw==
X-Gm-Message-State: AOJu0Yyc9nxKdsJdVpm48FvwyO69JjCbZ8yCbDq/tzHAq4WU6gZRZTMU
 pZJRm+vUGl7ceId8iC31A7EfRiFGZKV0rn4L+pF9olM08mSbDBLUKgWadFib/5gGy/61JyZ2Bje
 taRef1dMfdelSNM4f/zhhrsCwncVK
X-Received: by 2002:a7b:ce07:0:b0:3fb:e4ce:cc65 with SMTP id
 m7-20020a7bce07000000b003fbe4cecc65mr10555500wmc.25.1694509432036; 
 Tue, 12 Sep 2023 02:03:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8kSp3LWlS416Fsrz1DxxVgbcqE0KhWdg1a+7byaaHFe448CF3O2UiGIrVuazKuDWQYhyPQQ==
X-Received: by 2002:a7b:ce07:0:b0:3fb:e4ce:cc65 with SMTP id
 m7-20020a7bce07000000b003fbe4cecc65mr10555477wmc.25.1694509431640; 
 Tue, 12 Sep 2023 02:03:51 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 21-20020a05600c229500b00402d34ea099sm15524966wmf.29.2023.09.12.02.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 02:03:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2] drm/ssd130x: Store the HW buffer in the
 driver-private CRTC state
In-Reply-To: <x75lakzrl2awslaid5ffneepxusej7b7ojvz36bgpdwriztcru@h4bvwr2oeaov>
References: <20230910094041.715408-1-javierm@redhat.com>
 <x75lakzrl2awslaid5ffneepxusej7b7ojvz36bgpdwriztcru@h4bvwr2oeaov>
Date: Tue, 12 Sep 2023 11:03:50 +0200
Message-ID: <874jjz3gqx.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

Hello Maxime,

Thanks for your feedback!

> Hi,
>
> On Sun, Sep 10, 2023 at 11:40:28AM +0200, Javier Martinez Canillas wrote:

[...]

>>  static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
>> -			       struct ssd130x_plane_state *ssd130x_state,
>> -			       struct drm_rect *rect)
>> +			       struct drm_rect *rect, u8 *buf,
>> +			       u8 *data_array)
>>  {
>>  	unsigned int x = rect->x1;
>>  	unsigned int y = rect->y1;
>> -	u8 *buf = ssd130x_state->buffer;
>> -	u8 *data_array = ssd130x_state->data_array;
>
> That's just a matter of taste I guess, but I would pass the crtc_state
> pointer there instead of an opaque byte array (without any boundary).
>

Interesting that you mentioned, I was actually on the fence on this. The
reason why I passed an opaque byte array was that Geert had it in his R1
series and wanted to align with the changes that he was doing in that set:

https://lists.freedesktop.org/archives/dri-devel/2023-August/419935.html

But I'm OK of with passing the state pointers instead. BTW, you said
crtc_state but is plane_state since the function uses both buffers.

[...]

>>  
>> @@ -671,6 +664,10 @@ static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>  	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
>>  	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
>>  	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
>> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
>
> You can have CRTC-less commits if you only modify a property of the
> plane for example. drm_atomic_get_new_crtc_state will retrieve the CRTC
> state in the global state passed as an argument, but will not make any
> effort to retrieve the current CRTC state if it's not part of that commit.
>

Oh, I see. I wasn't aware of this.

> You should add a call to drm_atomic_get_crtc_state in your atomic_check
> hook to pull the CRTC state if it's not there so you can rely on it
> here.
>

Got it. I'll fix that in v2.

> Maxime

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


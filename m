Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02C178FCA5
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 13:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD2210E7A4;
	Fri,  1 Sep 2023 11:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA8510E7A3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 11:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693569024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bh4M+0J5a4/CTD9vzV/Dp4WE5uZXZTOLGhwgiKslvu4=;
 b=VV7ZQ2OGulBSy6rmTTHNVdk36rmqPI78zJxieY/1B2k1uwpEEJOHNWtQawojAI2nL2pB+r
 B+2kgqpah+LNJDoPaJUY71XZqdxoqos4+Gh6AFY3C+ICv5wFFAb3MgfJfARWsuElrmm6LV
 cknn1Wq8AD76TAVWtOIdQ//Ns2l3rU0=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-2XPswVZ1NxyYTx3Xgy5u_w-1; Fri, 01 Sep 2023 07:50:23 -0400
X-MC-Unique: 2XPswVZ1NxyYTx3Xgy5u_w-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2bbc1d8011dso24661601fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 04:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693569021; x=1694173821;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bh4M+0J5a4/CTD9vzV/Dp4WE5uZXZTOLGhwgiKslvu4=;
 b=EARfFikSA55I0Yzvw/KSYxVa2e2eGYpDPK0I2lf2LApzAdOsTHGcCExDtJZirt+95e
 +JZI01ais5EEdAlsy01NjCc/QxLjajbOdK0Wh+kvb7zYeVxCTg4wmm+283Jrn3rmkuBX
 lKl2qIMR+cjqtUQbzL6kSgr9i00aWK/PKC7ZSL2+4KAyKACbMfWmzbVl6YO/DwZN/txX
 nseUO6dG/OqXU0EKvNzKRfGtFFf/LNtumWWdVX4TcJmBTCQ+zObIPkElxLRNAFkN7W+9
 XCBTcHmqjfTP2055Jc1dgSH6wQSJQvfd0UnU4c/xvlCT/0EK7loAOGeMDfX6/xEom7nc
 xKrA==
X-Gm-Message-State: AOJu0Yz61MlGZhV3Snkod7AnTMKaMSuoUg5+sZoyGlsvqFhD7GYcyCoN
 ZXrBy29NJEzC1HpGP4TpsmdoooDDK4mD2RypdlZe1rLqPRQuvUUZhddUR4aGonGmJUQrjYtBx4C
 7Mk3tCslYbOLZK0zLM5qIipDYxrYX
X-Received: by 2002:a2e:8705:0:b0:2bb:78ad:56cb with SMTP id
 m5-20020a2e8705000000b002bb78ad56cbmr1393666lji.37.1693569021716; 
 Fri, 01 Sep 2023 04:50:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgWsW0wqHHo8OvbLp/1dFSUtHgnbdLiA0JJsCnLDBV1UOwRcx3dWF2DKbmXfSG1VHzLxmOiA==
X-Received: by 2002:a2e:8705:0:b0:2bb:78ad:56cb with SMTP id
 m5-20020a2e8705000000b002bb78ad56cbmr1393655lji.37.1693569021360; 
 Fri, 01 Sep 2023 04:50:21 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e4-20020adfe7c4000000b0031c6581d55esm5027861wrn.91.2023.09.01.04.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 04:50:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's
 .atomic_check() callback
In-Reply-To: <a6eca431-7464-09da-333d-a40318422077@suse.de>
References: <20230830062546.720679-1-javierm@redhat.com>
 <6654778d-1f40-1775-c32c-ebf9728bc9a9@suse.de>
 <87ledqbah2.fsf@minerva.mail-host-address-is-not-set>
 <a6eca431-7464-09da-333d-a40318422077@suse.de>
Date: Fri, 01 Sep 2023 13:50:20 +0200
Message-ID: <87cyz25czn.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi
>
> Am 01.09.23 um 09:48 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>>> Hi Javier,
>>>
>>> another idea about this patch: why not just keep the allocation in the
>>> plane's atomic check, but store the temporary buffers in a plane struct.
>>> You'd only grow the arrays length in atomic_check and later fetch the
>>> pointers in atomic_update. It needs some locking, but nothing complicated.
>>>
>> 
>> Yes, that would work too. Another option is to just move the buffers to
>> struct ssd130x_device as it was before commit 45b58669e532 ("drm/ssd130x:
>
> Adding something like a struct ssd130x_plane that holds the temporary 
> memory has the advantage of making a clear connection between the memory 
> and the plane. If nothing else, to the next programmer reading the code.
>

Ok, I'm confused now. The current version of the driver already has a
struct ssd130x_plane_state that stores the buffers:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/solomon/ssd130x.c#n144

But what you are saying is that instead of setting those pointers to NULL
in the ssd130x_primary_plane_duplicate_state() function, it can just be
allocated once and the pointers copied when duplicating the new state?

So you want me to add some locking when accesing those since will be
shared between the old and new state?

In that case another option is to just kref the buffers, I think that
should be enough?

>> Allocate buffer in the plane's .atomic_check() callback") but just make
>> them fixed arrays with the size of the biggest format.
>
> What is the size of the biggest format? I haven't read the driver code, 
> but a shadow plane can be up to 4096 pixels wide. It's 16 KiB for 
> XRGB888. Not too much, but not nothing either.
>

The shadow plane yes, but I was talking about the buffers in:

struct ssd130x_plane_state {
	struct drm_shadow_plane_state base;
	/* Intermediate buffer to convert pixels from XRGB8888 to HW format */
	u8 *buffer;
	/* Buffer to store pixels in HW format and written to the panel */
	u8 *data_array;
};

These are not the size of the shadow buffer but the of the displayed area,
that depends on the panel fixed resolution (defined in the Device Tree).

The biggest resolution for ssd130x panels is 132x64 (SSD1305 and SH1106),
so that means the biggest buffer will be 132 * 64 * R1 pitch = 1056 bytes.

> To reduce allocation and/or locking overhead, you could try to update 
> the pointers in the plane struct with RCU semantics. Plane updates would 
> use whatever pointer they saw, while the plane's atomic_check could grow 
> the memory buffers as necessary.
>

I'm still unsure the added complexity is worth it. As mentioned, the fbdev
driver also allocats the buffers on each display update and at least the
intermediate .buffer that stores the XRGB8888 -> R1 conversion is tied to
the plane, the .data_array that sends the actual data to the controller
can be argued to be tied to the CRTC.

But given that a format change doesn't trigger a CRTC mode set (as Maxime
pointed out to me) then at least the .buffer allocation can't be done in
the CRTC .atomic_check() handler.

I could move the .data_array allocatoin there or even do it at probe time,
but since the .buffer allocation would be done in the plane
.atomic_check() anyways, I would rather keep as is and have both in the
same function.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133297BF918
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 13:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D15B10E1C6;
	Tue, 10 Oct 2023 11:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376C210E1C6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 11:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696935721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7YKs8Uj33/Oy/FjcKUbtOfQkAtoq1k1T81Qax0mbPCo=;
 b=Rd85N+eAWkoTSCZ1rvTOdup8jvLyPIGhLm84+ifnlG4wDjsfU7OBcQKtLj6myQkiBNFPVz
 1EQU37H4AuLjCU8esqMg3CC7+TIFOFjaYIdcPxBs4qD2qRhtsfy7SKe5o6pfyydMUqqIUc
 dTXj8x4XjVxqFLbG8UrmM75NC2I0u3c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-pbZxxnZTPbKTtW0l60oumg-1; Tue, 10 Oct 2023 07:01:59 -0400
X-MC-Unique: pbZxxnZTPbKTtW0l60oumg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-32006e08483so3554439f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 04:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696935719; x=1697540519;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7YKs8Uj33/Oy/FjcKUbtOfQkAtoq1k1T81Qax0mbPCo=;
 b=bVwLnOryKrXfYuCqrVnHAZzor6h+GAS0G9wY+Y0zT4n1bu6blj4FgREKDfHzewBZr3
 cPJbi4KF2FiUvZkCGxt+2ViYyPWwKqwv32LIZmVKXIEFdGeHEXx/6YLOOwhok+U2Kfcv
 Jrzvaeh0gNoWogt6PWuMoceN4G/m1/0JbRLhww5CoW6ekcujsV9S5npc8Y9cDvVvAqu2
 RT5zP6oIjZxFON5k38GEJ+z/64ruVdDqGHn7K6f1lJ5xGcVKfg+Wg4YroyfKc0X14FG4
 VeDTtF3fNGzMFBsqYPtn8fAPeEinqz/NONkcbEmWGSCGeyEhdq5y5ZdugR4OSGvDR+qY
 ZJlw==
X-Gm-Message-State: AOJu0YznTJoZ5XJVhv/KAHTaP4dzUcsXMFEfALPqq6A9i5ePNHpULorD
 K29ykzev97O8r5Lds5YJXOoFU9RdahY2lVwntnId6quQY5jczIdXuof3d6P61w9RuNJM+KSmC3e
 EKMGwNp/sajdby7MdXooinkImWyZO
X-Received: by 2002:a5d:69d0:0:b0:31f:fa61:961d with SMTP id
 s16-20020a5d69d0000000b0031ffa61961dmr17401035wrw.63.1696935718851; 
 Tue, 10 Oct 2023 04:01:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4LrgTXzy5GPorSLWipcFJgW+5ysQDvxfBrpCEoFuMMj2iJLZNZ9PwKjM1rArmSkVzeV1gHQ==
X-Received: by 2002:a5d:69d0:0:b0:31f:fa61:961d with SMTP id
 s16-20020a5d69d0000000b0031ffa61961dmr17400986wrw.63.1696935717967; 
 Tue, 10 Oct 2023 04:01:57 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b003248a490e3asm12410973wrr.39.2023.10.10.04.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 04:01:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v5 2/7] drm/atomic-helper: Add format-conversion state
 to shadow-plane state
In-Reply-To: <qlp6jhzcgqhhyhdzbmijb4cujadru44dw53avvj46pbdhiqphy@lnvvbcbdejav>
References: <20231009141018.11291-1-tzimmermann@suse.de>
 <20231009141018.11291-3-tzimmermann@suse.de>
 <87bkd7vpsq.fsf@minerva.mail-host-address-is-not-set>
 <qlp6jhzcgqhhyhdzbmijb4cujadru44dw53avvj46pbdhiqphy@lnvvbcbdejav>
Date: Tue, 10 Oct 2023 13:01:56 +0200
Message-ID: <874jiyu4ez.fsf@minerva.mail-host-address-is-not-set>
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
Cc: jfalempe@redhat.com, dri-devel@lists.freedesktop.org, mairacanal@riseup.net,
 noralf@tronnes.org, Thomas Zimmermann <tzimmermann@suse.de>,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

> On Mon, Oct 09, 2023 at 04:22:29PM +0200, Javier Martinez Canillas wrote:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> > Store an instance of struct drm_format_conv_state in the shadow-plane
>> > state struct drm_shadow_plane_state. Many drivers with shadow planes
>> > use DRM's format helpers to copy or convert the framebuffer data to
>> > backing storage in the scanout buffer. The shadow plane provides the
>> > necessary state and manages the conversion's intermediate buffer memory.
>> >
>> 
>> I would argue this is one of the primary selling points for this series
>> (since Maxime was asking about the motivation). As you point out, many
>> drivers that use a shadow-buffer can also expose a different format than
>> the native one to user-space, so makes sense to have the buffer used for
>> conversion as a part of the shadow-plane state.
>
> I'm confused, can we convert between formats or not? Or is it about
> XRGB8888 vs whatever native format is used by the device?
>

It is about the latter, converting XRGB8888 to the native format.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


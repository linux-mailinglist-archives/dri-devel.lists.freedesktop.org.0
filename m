Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE1B7EDDB9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 10:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058BC10E258;
	Thu, 16 Nov 2023 09:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E653E10E258
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 09:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700127370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=McpPjYt7smDxeHi7cHEp953Y78A8Rfs6XOh5yVPu+9w=;
 b=GKn46YAqKCjq2abHcs6wPwm1qEFaHE2XbhODjiEXz5x4f5vz+oCmDY7u7s0h1Xi6hLpS+p
 hzXC/GItmvgQ5u6ezdARxjHvg1Z2aUJT3xWWsLF5QyIvmHLtCtcKCZr3mUVYbXKRh76ulP
 wfSnevhMfP/Ho3FgjY9plFtds5jgn1Y=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-w4g8sxA_N_-BOYifesZEYw-1; Thu, 16 Nov 2023 04:36:08 -0500
X-MC-Unique: w4g8sxA_N_-BOYifesZEYw-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-507b8ac8007so570921e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 01:36:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700127367; x=1700732167;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S+LZsf1Geh2x5b5Ad0zzJw+dVByeOVUvndd2RtoYI34=;
 b=U7B3yUIesduu7qaPBQ/fIggsiLmvS+Lql28NrAdau1X59Qg0UWPNwHGnxYwrmQdfPF
 ae0Tr+Oc/t5rjAKB3egqLVHBJR0a9cS4QFGempceXUpzjFn89u/LmuRvAjIJf26s8eB4
 12CczptpVXNlx4ruqAGbrroDx+74Bzl6Fhv1vRnUYhkED3ExUG98Pco0tEebwf4/2QEI
 VBDLCUVJhMkmY7r3NqOvibiRUclHGUybpRZNl86G3CzAG+rU98qDCrgjnlHX3LMmGlfm
 g8X7sz7LrjhyHXP+HeUy2KjHRTfo+v4BjvqUuIymN/n7iaxcjGFk9ERtfo+SDNMLr4z6
 cFAg==
X-Gm-Message-State: AOJu0Yzj4xYyo6ROs0MHXSwIT4My4oEiEyHTcVH7nI5qL0JaiJC4xctj
 O6EWl94YW9b/n8QMXCPbjuL8rsdnPHMjb8BGjU+8dTk15LJplfuSdmEFKfN87Yz1Vmgu9SnsZt1
 uUsGa9u0c7vU4pGGvFr3Kbjxfy/SS
X-Received: by 2002:a05:6512:3d02:b0:509:31e6:1de5 with SMTP id
 d2-20020a0565123d0200b0050931e61de5mr15185625lfv.47.1700127367543; 
 Thu, 16 Nov 2023 01:36:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE75yAvd+0pV7xWDGGFOLYeqfxtPEMRAHOezjjPoj7Cde5b1To5N4sTL7RRUU4c3qam6M0Img==
X-Received: by 2002:a05:6512:3d02:b0:509:31e6:1de5 with SMTP id
 d2-20020a0565123d0200b0050931e61de5mr15185608lfv.47.1700127367236; 
 Thu, 16 Nov 2023 01:36:07 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d11-20020a5d4f8b000000b0032d829e10c0sm12933437wru.28.2023.11.16.01.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 01:36:07 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH] of/platform: Disable sysfb if a simple-framebuffer
 node is found
In-Reply-To: <CAL_JsqKHTN5hfd4qpg5RXbmQLKZNVywDkSj9mxvfGmjrcChQQg@mail.gmail.com>
References: <20231113085305.1823455-1-javierm@redhat.com>
 <CAL_JsqKHTN5hfd4qpg5RXbmQLKZNVywDkSj9mxvfGmjrcChQQg@mail.gmail.com>
Date: Thu, 16 Nov 2023 10:36:06 +0100
Message-ID: <87jzqi59bt.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Sergio Lopez <slp@redhat.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Hector Martin <marcan@marcan.st>,
 Andrew Worsley <amworsley@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Frank Rowand <frowand.list@gmail.com>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rob Herring <robh@kernel.org> writes:

Hello Rob,

> On Mon, Nov 13, 2023 at 2:53=E2=80=AFAM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> Some DT platforms use EFI to boot and in this case the EFI Boot Services
>> may register a EFI_GRAPHICS_OUTPUT_PROTOCOL handle, that will later be
>> queried by the Linux EFI stub to fill the global struct screen_info data=
.
>>
>> The data is used by the Generic System Framebuffers (sysfb) framework to
>> add a platform device with platform data about the system framebuffer.
>>
>> But if there is a "simple-framebuffer" node in the DT, the OF core will
>> also do the same and add another device for the system framebuffer.
>>
>> This could lead for example, to two platform devices ("simple-framebuffe=
r"
>> and "efi-framebuffer") to be added and matched with their corresponding
>> drivers. So both efifb and simpledrm will be probed, leading to followin=
g:
>>
>> [    0.055752] efifb: framebuffer at 0xbd58dc000, using 16000k, total 16=
000k
>> [    0.055755] efifb: mode is 2560x1600x32, linelength=3D10240, pages=3D=
1
>> [    0.055758] efifb: scrolling: redraw
>> [    0.055759] efifb: Truecolor: size=3D2:10:10:10, shift=3D30:20:10:0
>> ...
>> [    3.295896] simple-framebuffer bd58dc000.framebuffer: [drm] *ERROR*
>> could not acquire memory range [??? 0xffff79f30a29ee40-0x2a5000001a7
>> flags 0x0]: -16
>> [    3.298018] simple-framebuffer: probe of bd58dc000.framebuffer
>> failed with error -16
>>
>> To prevent the issue, make the OF core to disable sysfb if there is a no=
de
>> with a "simple-framebuffer" compatible. That way only this device will b=
e
>> registered and sysfb would not attempt to register another one using the
>> screen_info data even if this has been filled.
>>
>> This seems the correct thing to do in this case because:
>>
>> a) On a DT platform, the DTB is the single source of truth since is what
>>    describes the hardware topology. Even if EFI Boot Services are used t=
o
>>    boot the machine.
>
> This is the opposite of what we do for memory and memory reservations.
> EFI is the source of truth for those.
>
> This could also lead to an interesting scenario. As simple-framebuffer
> can define its memory in a /reserved-memory node, but that is ignored
> in EFI boot. Probably would work, but only because EFI probably
> generates its memory map table from the /reserved-memory nodes.
>

I see. So what would be the solution then? Ignoring creating a platform
device for "simple-framebuffer" if booted using EFI and have an EFI-GOP?

> Rob
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


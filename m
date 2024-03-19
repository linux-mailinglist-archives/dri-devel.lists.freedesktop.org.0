Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF1187FA2A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBE210F865;
	Tue, 19 Mar 2024 08:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="M8hxEtec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427AD10F85F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710838358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LAFBEpXu4T6nIL4CcBb6XaYWpcmzJRFyTet/O4fBErk=;
 b=M8hxEtecNLzq50fkh9k4o14T2dWQfafkCju481os9KtHEDnlR4HSt52Ju9riI21IKgS6OX
 gYpUHqnyEqAc/hcCCtVIsICRfFv5NGvjy8phZiLUcZKshcl6wzuweA3O3+w2Gr1LyrVomd
 gVZit5hUbjwmKqjAQDAnzqVnjJe+1vs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-GMJrzGu0N8CQ0qxg2g0UOQ-1; Tue, 19 Mar 2024 04:52:37 -0400
X-MC-Unique: GMJrzGu0N8CQ0qxg2g0UOQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-33eca6f6e4bso2783381f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 01:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710838356; x=1711443156;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LAFBEpXu4T6nIL4CcBb6XaYWpcmzJRFyTet/O4fBErk=;
 b=TIru023H9Y+MhS8LQKhRRrve5OPVK9JnOjRuyXnXhLqAKLUk6+ik66aMUcve0WrADf
 bJ81x1polZf5q0KYgoI5IDXRCDgGZ2RxWNMA7JQDEVMla6TfI49ijP2M+wH/qV74+2US
 KLOrFI/F0H0DYQQURJ0vFvrd+mhGBG6707VfFcHv/ziuGNi8N6fqZ7RxvszUPntubA2k
 oLBeoomZGwkiWYGLM9bl73qeQhLXesi/r6kqo+2rPSUi2GUCimHriBGxXK7MpngigSb4
 IZ2Nw/2fY94fjQSIhAgYta92SIj0km0x5Gh7+oxeBQ+18TuGSTTsHp0Wvf938v2XhuK+
 5Vtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoRIWBGayVtiubIbrnKeYN/+WTEQHJiu740Yw0rzRorf+CMT/PpGhWj5GjkY2/dgqb4kKCJ7hwnq/qxmenSHKOUMDqDnsL9meyxsUK+gBF
X-Gm-Message-State: AOJu0YyI9zcqXM29oA5fQ/xi3gimFBSefnZObm8OGIAC3o2J2jHQCp44
 nGS3eB1bzbuOzV6K2A02kt9anAONb21awYzymcu8VRtzpoeDxR5mVRqVaUCSVMeJGwkx9Zuid1s
 AbxZvT8Ryog0haHQalvt6uKB35u0Luhq7F/TMdYkw2uR8cQjSKmr2NAytxkEa/rn6OQ==
X-Received: by 2002:a5d:400e:0:b0:33e:7650:1297 with SMTP id
 n14-20020a5d400e000000b0033e76501297mr1180593wrp.6.1710838355896; 
 Tue, 19 Mar 2024 01:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEviy2BfD6h1n7GQIr/ySZRIA5TMsVkUat79nA6OyGDi7lEfv/1uq9WRg7/G+zkox+G3WNbig==
X-Received: by 2002:a5d:400e:0:b0:33e:7650:1297 with SMTP id
 n14-20020a5d400e000000b0033e76501297mr1180574wrp.6.1710838355482; 
 Tue, 19 Mar 2024 01:52:35 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bo6-20020a056000068600b003418016b04csm2954367wrb.76.2024.03.19.01.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 01:52:35 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Mehdi Djait
 <mehdi.djait.k@gmail.com>, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: drm/tiny: QUESTION: What to use instead of
 drm_simple_display_pipe ?
In-Reply-To: <da7cfff1-e147-48ea-bcda-9ea913e5feee@suse.de>
References: <ZfiTbYAa7qxXlrPd@mehdi-archlinux>
 <da7cfff1-e147-48ea-bcda-9ea913e5feee@suse.de>
Date: Tue, 19 Mar 2024 09:52:34 +0100
Message-ID: <87o7ba1u3x.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Mehdi,

> Hi
>
> Am 18.03.24 um 20:18 schrieb Mehdi Djait:
>> Hello everyone :)
>>
>> I am implementing a tiny drm driver and I am currently working on the
>> V2: https://lore.kernel.org/dri-devel/cover.1701267411.git.mehdi.djait@b=
ootlin.com/
>>
>> I got a review on the v1 telling me not to use the
>> drm_simple_display_pipe. Can someone please explain this further ? Or
>> give me an example drm driver that does it the right way ?
>
> You can copy the code from drm_simple_kms_helper.c into your driver file=
=20
> and start inlining everything. For example
>
>  =C2=A01) Your driver calls drm_simple_display_pipe_init(), so you copy t=
hat=20
> code into your source file
>  =C2=A02) drm_simple_display_pipe_init() uses drm_simple_kms_plane_funcs =
and=20
> drm_simple_kms_crtc_funcs, so you copy these into your source file;=20
> together with the drm_simple_kms_*() helpers that they use for their=20
> callback pointers.
>  =C2=A03) Mayb do this for other drm_simple_kms_*() code.
>  =C2=A04) Then start inlining: inline your copy of=20
> drm_simple_display_pipe_iit(). Instead of using=20
> sharp_ls027b7dh01_pipe_funcs, inline its functions into your copy of the=
=20
> callers. And so on.
>  =C2=A05) Rename the resulting code, so that it fits you driver.
>
> With careful changes, you 'll end up with the same functionality as=20
> before, but without the intermediate layer of the simple-KMS code.
>

On top of what Thomas said, you can check 622113b9f11f ("drm/ssd130x:
Replace simple display helpers with the atomic helpers") that did this
change for the drivers/gpu/drm/solomon/ssd130x.c driver.

The driver is also for a monochrome panel controller and it does support
SPI as transport, which means the controller is similar to yours in many
aspects. You could use that driver code as a reference for your driver.

> Best regards
> Thomas
>
>>
>> --
>> Kind Regards
>> Mehdi Djait
>
> --=20
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


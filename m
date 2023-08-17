Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A849D77F3F7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 11:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546BF10E422;
	Thu, 17 Aug 2023 09:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB20F10E41E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 09:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692266334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8LhOrW0WUa6CT60pjE8C+ol39HJMr426zMLoqg+/dY=;
 b=B+dqzvpmYeyHTkBI6yVuGmqWO/MNu6z4ZPF78vvVdSA/oIbnkIPxE+KtUpf7S4vECQLSFE
 t7sllDYJpJ8AdfgtnsqhFe7MSSlW3V8sLhg8/lqxNBD4/X1cmJPPFEnYmSezRseGSLAT3C
 rJyhbsz9h/4Oxsi/j9bpdGons+vD6rc=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-MpqpzN9hMxuv1FRxuUF86w-1; Thu, 17 Aug 2023 05:58:53 -0400
X-MC-Unique: MpqpzN9hMxuv1FRxuUF86w-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b04d5ed394so13710651fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 02:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692266331; x=1692871131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f8LhOrW0WUa6CT60pjE8C+ol39HJMr426zMLoqg+/dY=;
 b=ZDEsQUwWbPjlyoqEI+eSh/LE+llsU5/2kIoa5tIEm0/o+uHRVoWz3UGOeV1a+KQWKo
 9b1a9Uvh6awXbZvVv7nsunZjVPRQbDS+XxxVh0YytL17DmgGFhry7td57mB1jaUZb3F4
 XQRerA/bdD/14EAl1QcXNu75SZRFf7Nah9iSCO5W9nOYKgtWNdoaXzbfwmPkKM8yF0SB
 TrAJveZbvn52xuEo2nEx7gWvf91ku06RoCytDmmtqsVsup6rpwaRz8oD3pDG5sKPgo9+
 VNouVDbC7wBwq8kzOkgqe9abvcbvXYfwCUJ7oEhNCNxIwXhoTKl9DQFIqTCOL7IZhZxC
 VrSw==
X-Gm-Message-State: AOJu0YwfyhTHe8OOYbJSbd9zxZugpyREYq+PXJLVY8e+4rR3csPDzf79
 Z6v+DWRquBEyEPoPp8f/mI8jm1TdYmBKQLKmn5itU0OgfJTS4yF+BF9Ni+zNNK0FegL3Rgfy+8k
 brUibbk6HZCaOZA+vLHF7TjXGIqtezTwuIWDDc84Xb6F/
X-Received: by 2002:a2e:bba2:0:b0:2b6:7c3a:6adc with SMTP id
 y34-20020a2ebba2000000b002b67c3a6adcmr2639039lje.5.1692266331630; 
 Thu, 17 Aug 2023 02:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+OkqFqWypjUgZ0iljxcxYcRVfxwr2dkieuQVR8uoM+9sEf+VyJeMAJQEHmz2GuI9BiYnREEMjsnHLf9Gnm74=
X-Received: by 2002:a2e:bba2:0:b0:2b6:7c3a:6adc with SMTP id
 y34-20020a2ebba2000000b002b67c3a6adcmr2639023lje.5.1692266331198; Thu, 17 Aug
 2023 02:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230814144933.3956959-1-kherbst@redhat.com>
 <20230816093015.GDZNyXJ28y9uspb4Mr@fat_crate.local>
 <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
 <20230816145338.GIZNzi8o3d9x9bcPzX@fat_crate.local>
 <CACO55ttasKLxBTmZjN-XBOuJFC7rng2PbLgxCT8WT6ukOZNGzQ@mail.gmail.com>
 <20230816151252.GKZNzndDNySuWC+Vwz@fat_crate.local>
 <CACO55tunC5mEu3Tw64rKLqNM6MN6d=N90kYQKYwXWNMB=ahDaw@mail.gmail.com>
 <20230816221353.GXZN1KIXloRn8cGt5E@fat_crate.local>
 <CACO55ts7430tAUDC+0qY0EZ5ReO=2Rjwj1SzHaBLodmyBgrUrw@mail.gmail.com>
 <20230817081032.GAZN3V+NQ1blzQC2sU@fat_crate.local>
In-Reply-To: <20230817081032.GAZN3V+NQ1blzQC2sU@fat_crate.local>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 17 Aug 2023 11:58:40 +0200
Message-ID: <CACO55tv-dKnDzUYYFW+d2pNoAhEoEniUT=QAmD4-c_xKQw0cfw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/disp: fix use-after-free in error handling of
 nouveau_connector_create
To: Borislav Petkov <bp@alien8.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 10:10=E2=80=AFAM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Thu, Aug 17, 2023 at 01:18:12AM +0200, Karol Herbst wrote:
> > do you have one of these? https://en.wikipedia.org/wiki/DMS-59
>
> Ah, DMS =3D=3D Dual Monitor Solution :-)
>
> Yap, that's exactly what the GPU has. And the Y-cable is 2xDVI. It is
> a Dell workstation and it came this way, meaning I haven't done any
> changes there.
>
> Thx.

right.. seems like on my GPU with such a connector I'm not seeing any
issues... let me dig further into the vbios and see if I can figure
something out there.

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
>


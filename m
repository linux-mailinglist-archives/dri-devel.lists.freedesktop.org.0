Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7268777EBBE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 23:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5AE10E100;
	Wed, 16 Aug 2023 21:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DD610E100
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 21:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692221239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhlCltG/6J4T9mqv57bOozrctEIXFs/9BESilmBG2aE=;
 b=VQZDcXc7TefFXZJtlGW5et8r+KV6Fh0tUggpRgYard6wPQOQOQd5WniSCnI4EMPP1sZlne
 HknbzvphXSF3C+Dff6gu/vmGfSlLYcOWRFQCtAoZSrc2LtckmY+wRCghigLvUpJahmglab
 UnEITyOI3BwDUDbVKD38qkrHxtcrhEw=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-e3goBI5kOxubAXhEqIjPBQ-1; Wed, 16 Aug 2023 17:27:18 -0400
X-MC-Unique: e3goBI5kOxubAXhEqIjPBQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2a7a6393ba6so12788101fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 14:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692221236; x=1692826036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bhlCltG/6J4T9mqv57bOozrctEIXFs/9BESilmBG2aE=;
 b=RkdvzaN4yv1prqc/aCVTbcdZr59jVLUJ4TKO3xCBVNey6DrAKaw05kjaN5OyP13gwJ
 Lkawkdh3XsF4X14Ofvyh4H129klN1oCwS8Y2earF0Hq8LzlfZSr/KSAlv78adihAM2VT
 i8MM62ADZP/MKwz31NTC7gFodruaF1TTFvwT4YGTjYBZy/GMIe9+pU5t50rM/dGS9Yg6
 WSf/HL628F3ZUGef6BQnX8mhrCZijwgPawRrtYmCt6hFnALG0yPjmu0AkD/Ii9VRzqix
 vMUZbTi1czFDUVT7fmSNp8n406udM4q59g5RtpvgV9/fUN45lGru3qohwdB4I0KoGbuB
 Tm8w==
X-Gm-Message-State: AOJu0YwsLnSCKGe5T3o8PXAZIw53KPyls4iHac6aTSKU2V/Q2SVGq2Gm
 7gZ/08wfqMjBYSJv2ZVsabkMmEkZzdSwnSHwpWkBcl3dDEhevVQjMSX6ypOzDp/2tlFBDzmt4Lw
 T0tbsb2kWiZatDKb4F+3cV4UA+fNMQHtIQXnLOGwjpS24
X-Received: by 2002:a2e:b53a:0:b0:2b8:3c52:113 with SMTP id
 z26-20020a2eb53a000000b002b83c520113mr2446674ljm.5.1692221236442; 
 Wed, 16 Aug 2023 14:27:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqEJkEAo5Pa4rNZ4q8LahYF0AcRVhQvLqoo9MCByspT6ADS2ntaRvd1hh34mL6+q7aFi+DN5uWeOnI1es4zj0=
X-Received: by 2002:a2e:b53a:0:b0:2b8:3c52:113 with SMTP id
 z26-20020a2eb53a000000b002b83c520113mr2446668ljm.5.1692221236114; Wed, 16 Aug
 2023 14:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230814144933.3956959-1-kherbst@redhat.com>
 <20230816093015.GDZNyXJ28y9uspb4Mr@fat_crate.local>
 <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
 <20230816145338.GIZNzi8o3d9x9bcPzX@fat_crate.local>
 <CACO55ttasKLxBTmZjN-XBOuJFC7rng2PbLgxCT8WT6ukOZNGzQ@mail.gmail.com>
 <20230816151252.GKZNzndDNySuWC+Vwz@fat_crate.local>
In-Reply-To: <20230816151252.GKZNzndDNySuWC+Vwz@fat_crate.local>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 16 Aug 2023 23:27:05 +0200
Message-ID: <CACO55tunC5mEu3Tw64rKLqNM6MN6d=N90kYQKYwXWNMB=ahDaw@mail.gmail.com>
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

On Wed, Aug 16, 2023 at 5:13=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Wed, Aug 16, 2023 at 04:57:28PM +0200, Karol Herbst wrote:
> > Do you have any connectors listed in "/sys/class/drm"?
>
> tree /sys/class/drm/
> /sys/class/drm/
> =E2=94=9C=E2=94=80=E2=94=80 card0 -> ../../devices/pci0000:00/0000:00:02.=
0/0000:03:00.0/drm/card0
> =E2=94=9C=E2=94=80=E2=94=80 renderD128 -> ../../devices/pci0000:00/0000:0=
0:02.0/0000:03:00.0/drm/renderD128
> =E2=94=94=E2=94=80=E2=94=80 version
>
> > Also, mind sharing your vbios.rom file from
> > "/sys/kernel/debug/dri/0/vbios.rom"?
>
> Attached.

that GPU has only a `DMS-59` connector, is that right? I have such a
GPU myself, so maybe I can trigger that bug there, let's see..

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette


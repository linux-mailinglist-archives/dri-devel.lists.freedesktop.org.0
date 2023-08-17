Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58A177F3FB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 12:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970A810E41E;
	Thu, 17 Aug 2023 10:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A187210E41E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 10:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692266461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxvFWtLfZHUU3yR6UuCUCdkToTTydlxIuObM2X2y+A0=;
 b=I74Jt8dgG2kPZwinPquctPlMt+MgCT1FuBH/yMRWbtY+Fyf55++fzz+o7NjpGREdlYfZg9
 JRNltwyI3PyNOJH9JOfJcDfYDkE2teCD5MpfUldEQpwwdQt/5ILKkKufwDoaPiRZROKtwP
 J6NPezDCNKh+hdPvMlyO+9N9dH3+siw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-YaKJWoSDOmK9xjBLoKgcmQ-1; Thu, 17 Aug 2023 06:01:00 -0400
X-MC-Unique: YaKJWoSDOmK9xjBLoKgcmQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b9d5bc6161so13735451fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 03:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692266458; x=1692871258;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SxvFWtLfZHUU3yR6UuCUCdkToTTydlxIuObM2X2y+A0=;
 b=kT1ItKMpSDq/iPTsw2K4EvGlzCA50TVy1HTa0E2xMUK4RUZhTtNnVsltVKsERRAGXU
 STyCl2qGREf5n1cEvaJ9BzHN1DU24wne3iMHsPPU2lUcJc/jWr3OxXqGGkvX5gmTdzfZ
 rCV6i35wVc9cXCsEJdcZlnVjszUTo8UbeXRAWUn4BqXXA+AXgDISnRy0gp79+DDRZchc
 s2QCENtrFkMjL6sUvUF1uMvA1lQc62uKgupH3ByGZA77PurEhlx3bzkGS9JfVqjDCiAm
 IdwuSmPLptYU5mKX4RH+C3gWWIQdgEyXvlfPK4rYsUR4PsLpX75sPmOtSu7pf2wjVPtS
 XezQ==
X-Gm-Message-State: AOJu0YzFEx2b2Jhj/RDfm1OkGzDvy17nKZyP2x+ksP7/E0TTN7jhtHrC
 YgdtmyvdiOTiNIci6oRUbom8JLydDAVW6/h0siDIzgO7ThG+wLx0Sm7WJ8+50ZrhA77ze2qVLmY
 fYxeoTEyoXAjeAy6hZU8E/OnDlIKNRVD12jwYJ6IwHrAe
X-Received: by 2002:a2e:9043:0:b0:2b9:e10b:a511 with SMTP id
 n3-20020a2e9043000000b002b9e10ba511mr3029746ljg.0.1692266458793; 
 Thu, 17 Aug 2023 03:00:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX6/54OJqwhp3VR3zAVcKja7LAQ8KhRaL+hfdqOgYduGmKxKWNx/Sz3QfKQ1PMt/yuW5leDc5yD5ItStaUNh0=
X-Received: by 2002:a2e:9043:0:b0:2b9:e10b:a511 with SMTP id
 n3-20020a2e9043000000b002b9e10ba511mr3029732ljg.0.1692266458510; Thu, 17 Aug
 2023 03:00:58 -0700 (PDT)
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
 <CACO55tv-dKnDzUYYFW+d2pNoAhEoEniUT=QAmD4-c_xKQw0cfw@mail.gmail.com>
In-Reply-To: <CACO55tv-dKnDzUYYFW+d2pNoAhEoEniUT=QAmD4-c_xKQw0cfw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 17 Aug 2023 12:00:47 +0200
Message-ID: <CACO55tuWTYngfw+MZnan+U4eYyE+SvOWgxzffaCMNGQgriq3ig@mail.gmail.com>
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

On Thu, Aug 17, 2023 at 11:58=E2=80=AFAM Karol Herbst <kherbst@redhat.com> =
wrote:
>
> On Thu, Aug 17, 2023 at 10:10=E2=80=AFAM Borislav Petkov <bp@alien8.de> w=
rote:
> >
> > On Thu, Aug 17, 2023 at 01:18:12AM +0200, Karol Herbst wrote:
> > > do you have one of these? https://en.wikipedia.org/wiki/DMS-59
> >
> > Ah, DMS =3D=3D Dual Monitor Solution :-)
> >
> > Yap, that's exactly what the GPU has. And the Y-cable is 2xDVI. It is
> > a Dell workstation and it came this way, meaning I haven't done any
> > changes there.
> >
> > Thx.
>
> right.. seems like on my GPU with such a connector I'm not seeing any
> issues... let me dig further into the vbios and see if I can figure
> something out there.
>

btw, what would help is to know where `nvkm_uconn_uevent` actually
fails, or rather, are you running into this "/* TODO: support DP IRQ
on ANX9805 and remove this hack. */" condition?

> >
> > --
> > Regards/Gruss,
> >     Boris.
> >
> > https://people.kernel.org/tglx/notes-about-netiquette
> >


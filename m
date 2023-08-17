Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE44A77F443
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 12:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8C610E42E;
	Thu, 17 Aug 2023 10:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4E510E432
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 10:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692267899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1IRxWEvpry+CMCB1V4M7R9Ft7ALq/o4jMyxueGSdGQE=;
 b=KIH4PzMw33zvBgI3uF7YkDOj/R1xvs1kh++GHbBo4ACLUvCZrISrfO1DMAaXas1DE395qA
 kvETQ19fiQCxxk14FvbNdhKEeos5AQR/wgk6wuzdh7hMcKAC00u0Xk6iWet0vqFs+nx2Ey
 j8RIVx3t72OoNbPZNh9ORNe1LLEmtSY=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-YbiiIFtCM6itR5wMwtn29w-1; Thu, 17 Aug 2023 06:24:58 -0400
X-MC-Unique: YbiiIFtCM6itR5wMwtn29w-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b9b7375e49so17543891fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 03:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692267897; x=1692872697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1IRxWEvpry+CMCB1V4M7R9Ft7ALq/o4jMyxueGSdGQE=;
 b=LRNIYAO5WgzjD4Moa3CJpIfSJlkHboFk7VtNdr884zt76CStU2BWmKlLwmp1OD7wng
 JaUVfISeiTfveP90y0m80nS2eDvMcC30pl6DJKpu3WZogTluTciwl7b7C8COL1h3XGbi
 x6cf74AGGi5vKr4C2lsK4sUrDmMZh1nKuc4Fr0yXXo0JQAjyfgM/KYwH2u2ws4C1e9cT
 4ol9D6w4zFAuExviWtkTABwdaK72xWbA3Rza9Z95arufdomrzOJDTDxwe4P++X5wpQnn
 ZvgszWhPuELyS8xQs29Q0oRR0TPjqCBtKFTkZEBFCOWRgqlxtzqUiZIVTCC40Hx8ggY6
 08AQ==
X-Gm-Message-State: AOJu0YxhCDPPXnEo7xlkqd9SdMEf0A0yEXQoddj74GxDpPca9BO7ZZMF
 PMnbfjIdp6o7z8vP81v0aSv8Jk9SM+49fesz2l7UBLoNQIijSURhAkV92KoEvUlM//ER7z1iGAc
 1BI6IP8thwIdkKlYp/LkLFe54LhFIefw9DZgnqy0gG4qI
X-Received: by 2002:a2e:511a:0:b0:2b9:7034:9bbe with SMTP id
 f26-20020a2e511a000000b002b970349bbemr2980381ljb.4.1692267896884; 
 Thu, 17 Aug 2023 03:24:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBgIDULJ6Inl1Pke61/jYkvIRMPsZ4hSRwZSoxXgucJresEcAyxdEKMlWsoFg6hvKo7nHipu3sd9ZNJWFoGNg=
X-Received: by 2002:a2e:511a:0:b0:2b9:7034:9bbe with SMTP id
 f26-20020a2e511a000000b002b970349bbemr2980368ljb.4.1692267896541; Thu, 17 Aug
 2023 03:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
 <20230816145338.GIZNzi8o3d9x9bcPzX@fat_crate.local>
 <CACO55ttasKLxBTmZjN-XBOuJFC7rng2PbLgxCT8WT6ukOZNGzQ@mail.gmail.com>
 <20230816151252.GKZNzndDNySuWC+Vwz@fat_crate.local>
 <CACO55tunC5mEu3Tw64rKLqNM6MN6d=N90kYQKYwXWNMB=ahDaw@mail.gmail.com>
 <20230816221353.GXZN1KIXloRn8cGt5E@fat_crate.local>
 <CACO55ts7430tAUDC+0qY0EZ5ReO=2Rjwj1SzHaBLodmyBgrUrw@mail.gmail.com>
 <20230817081032.GAZN3V+NQ1blzQC2sU@fat_crate.local>
 <CACO55tv-dKnDzUYYFW+d2pNoAhEoEniUT=QAmD4-c_xKQw0cfw@mail.gmail.com>
 <CACO55tuWTYngfw+MZnan+U4eYyE+SvOWgxzffaCMNGQgriq3ig@mail.gmail.com>
 <20230817101129.GCZN3yUTWHkt22Jgec@fat_crate.local>
In-Reply-To: <20230817101129.GCZN3yUTWHkt22Jgec@fat_crate.local>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 17 Aug 2023 12:24:45 +0200
Message-ID: <CACO55tt9ZLKjaTyARXQ4VePgd41nYCQBn+wAGGDJRw1QV3hPBQ@mail.gmail.com>
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

On Thu, Aug 17, 2023 at 12:11=E2=80=AFPM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Thu, Aug 17, 2023 at 12:00:47PM +0200, Karol Herbst wrote:
> > btw, what would help is to know where `nvkm_uconn_uevent` actually
> > fails, or rather, are you running into this "/* TODO: support DP IRQ
> > on ANX9805 and remove this hack. */" condition?
>
> Send me a diff, I'll run it here and catch output over serial.
>

simply throw a

printk(KERN_WARNING "nvkm_uconn_uevent %u\n", outp->info.location);

inside drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c:104 after that
mentioned comment.

> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
>


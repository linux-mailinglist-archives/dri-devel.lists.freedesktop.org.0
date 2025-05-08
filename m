Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D89AB036A
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 21:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B458310E961;
	Thu,  8 May 2025 19:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="J8qWSCxt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C672710E961
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 19:12:05 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-708a853c362so12953627b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 12:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1746731522;
 x=1747336322; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RTf3AI95bM3SluiF+bL7cREfN/HXYnAFwT21a0zqJvw=;
 b=J8qWSCxt+9DsUcBeCZ2sTf2i7EpheyZCw6ameEm3+p5Q7wBvJWeyzUSdSAwJVXjO+R
 x3yczkSfCos/HipYbMsK1JWwLfVJ/eBgq6Knw7VK4IPgB93nXyeX5sSEZ+/BWbgdMedQ
 7fHbMWrq2Gq+BPt+ueHUZIys2N6tyTI12t+5eisbToqz0X9dKC2Wq+ffo3tMdxMhW40E
 5NxZiYyugQmApi7QfLLInAm1aUSpoGNDDFxHct7rgsH8RL3nxN6YeMmx2VTvQX5Bt5t4
 bQ4QsuboQyt4pI3tAltQD+F/kJ2KQb1MosrFetnyOO9/lDc2a5rAcQ2iY1W4hc/qZqHs
 HdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746731522; x=1747336322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RTf3AI95bM3SluiF+bL7cREfN/HXYnAFwT21a0zqJvw=;
 b=aUcMb2tSUJnhvGsiW5337e97qG+42tt+QJdCo8AnYjnU+XodQjPEORlemapI03SXko
 neqk3/6lcaqd766+nmeRLtHFLbfu5L1PB5C1omO6cCyE3dqCc2Hs8y+73ZPN0I93+Z88
 MMLzsamTzJwXRaHf4zH7KmtCeuxfbXsCc2wDy4hL/xtyHHqnyHu2/DHCx4O1KoG6LsVL
 VcpF4IC1iHTQoG/vhthtvSAhN7UZ0g5N/YE/LJcehblpjB+Fdg7MUDHL2vl0dAf9+sh9
 hz/GmKkzOoKw+8HS2qQi5QrD1FiupuN5rndIANkbT8c4BY+h9zJFkzBtaAT0gnBupdkc
 Y25w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJFF/1EqovbqYh7f3ZvTd8k5Sy7p0W1DYKUKP6TkUcefgWspt+q2iYX5/VCBeDY+5Ii95Bx7d0d/g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2oW73qV5PydsX8ankOhsyIZvXopVeDK8jIPCg1ct4gmcjuHCH
 NJVYQlwbwZvPn6ab6HJoamg+yUwfyUvm6e7bXuWTMGspOLrsNfDZEo6A0HRuLQ3ENUHoeBeX8Yf
 dvBdcUQ==
X-Gm-Gg: ASbGncuJny2wPVcjs4Q4ZOvL+TgCg0/aWgdhKhUArl3T7P0gPes6+K1bstpJEB3uQqt
 Wz0RgK8WEAzUKTMxMdRVz4XK9hGXV8uA5cCVftyLDWG8BkOcCGcvdaiI7DyuEzGWMf+mctZxye5
 3djEMVyEr6R3nBx+yZzzRDmta7xITe6+O9J5lJvOuOYSl7eMW9Cd/BXn/SvnGxFJqa+iNtik/+W
 JB9cjcYsnr3ql/+t/QoGFsJ0uzqMBhSaUTJRFMSK5BJ4B2nCV+28SzyKlzypaJdBlh3blMXrtjC
 O8CIa6T5/SEsSawencfb0PnrniEL59BSZcEQH2lulM3nGJSR8nGTi31uAW5HLGOnMfrLbx4W7dC
 6OdQQ89Mt
X-Google-Smtp-Source: AGHT+IEM/fzzXs1956VU17theM/urtccdrmfKcouqy4HT5UuiysZTr0icphh81TtuH38lZMVic6yww==
X-Received: by 2002:a05:690c:3803:b0:6fb:b37f:2072 with SMTP id
 00721157ae682-70a3fa57232mr8929227b3.22.1746731522048; 
 Thu, 08 May 2025 12:12:02 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-70a3d8be1ecsm1993547b3.50.2025.05.08.12.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 12:12:01 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e740a09eae0so1302017276.1; 
 Thu, 08 May 2025 12:12:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCViVGWQ0r8FAqpv+0GUCpMnrKNtiYNN6iNC33GL2RpSnrcHwSAuMTf0QcKYyiTg83hncV6dBbd5mQ==@lists.freedesktop.org,
 AJvYcCWY8v8xeCQ4osJDCspijC5cUiz5EwcM6GMhriOo7qGwtzKIIrBFo4AbmcivivvtN682inDKlcXTlmg=@lists.freedesktop.org
X-Received: by 2002:a05:6902:210e:b0:e73:2039:10b5 with SMTP id
 3f1490d57ef6-e78fdbe1809mr948464276.5.1746731520724; Thu, 08 May 2025
 12:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
 <20250508145624.4154317-1-tomeu@tomeuvizoso.net>
 <a18f214ab0487a1c562f9e2f7f66ab1345925177.camel@pengutronix.de>
In-Reply-To: <a18f214ab0487a1c562f9e2f7f66ab1345925177.camel@pengutronix.de>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 8 May 2025 21:11:48 +0200
X-Gmail-Original-Message-ID: <CAAObsKDwVB7w0mK3qkJJ-x3sOVxbcM5pbjxJk-106baaiwM=dg@mail.gmail.com>
X-Gm-Features: ATxdqUHU3XaLDR8S2zaGYwUwcL8lv1VNDzcEDTTYilVdMESYY9EBz9Cry6NW0ic
Message-ID: <CAAObsKDwVB7w0mK3qkJJ-x3sOVxbcM5pbjxJk-106baaiwM=dg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/etnaviv: Fix flush sequence logic
To: Lucas Stach <l.stach@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 8, 2025 at 7:08=E2=80=AFPM Lucas Stach <l.stach@pengutronix.de>=
 wrote:
>
> Am Donnerstag, dem 08.05.2025 um 16:56 +0200 schrieb Tomeu Vizoso:
> > We should be comparing the last submitted sequence number with that of
> > the address space we may be switching to.
> >
> This isn't the relevant change here though: if we switch the address
> space, the comparison is moot, as we do a full flush on AS switch
> anyway. The relevant change is that with the old code we would record
> the flush sequence of the AS we switch away from as the current flush
> sequence, so we might miss a necessary flush on the next submission if
> that one doesn't require a AS switch, but would only flush based on
> sequence mismatch.

Ah, you are right.

> Mind if I rewrite the commit message along those lines while applying?

Sure, no problem.

Thanks,

Tomeu

> Regards,
> Lucas
>
> > Fixes: 27b67278e007 ("drm/etnaviv: rework MMU handling")
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm=
/etnaviv/etnaviv_buffer.c
> > index b13a17276d07..88385dc3b30d 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> > @@ -347,7 +347,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, =
u32 exec_state,
> >       u32 link_target, link_dwords;
> >       bool switch_context =3D gpu->exec_state !=3D exec_state;
> >       bool switch_mmu_context =3D gpu->mmu_context !=3D mmu_context;
> > -     unsigned int new_flush_seq =3D READ_ONCE(gpu->mmu_context->flush_=
seq);
> > +     unsigned int new_flush_seq =3D READ_ONCE(mmu_context->flush_seq);
> >       bool need_flush =3D switch_mmu_context || gpu->flush_seq !=3D new=
_flush_seq;
> >       bool has_blt =3D !!(gpu->identity.minor_features5 &
> >                         chipMinorFeatures5_BLT_ENGINE);
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0496BE559
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 10:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8ED10EEB5;
	Fri, 17 Mar 2023 09:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C8610EEAF;
 Fri, 17 Mar 2023 09:17:43 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id g18so4375512ljl.3;
 Fri, 17 Mar 2023 02:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679044662;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3uLwGBxnZ1mAAqp3kTFoVsk1Zncv2fMmnt4yJjzaSC8=;
 b=ThkJ4upO2U9CB7ruJSqqqRCeWvmgm8ZAj4QsOTm1eC4gVChNyzDjQlKVuwvk1pO1Fw
 xt7F2HUHYa0c/ylvlXnMBydDEKBF6iDyMDFGwBfHgSp4mHudp+up9hMsJ6HgiUK1EFOY
 pUkT03WY1yR7BwkS4KhtxBEQTsqrR6kGVXk9Cytg4D3yo1j2ojLdWH5oE8RZHoJXgF2x
 Kd1CBEoJEqNmdG9tBeHLiowK59HhG6w+afImzrcdPPUKxmomDpY69VWFAs9DiyBq4zbt
 njWqSx1+A4HuZHg4uS+TAYcgNDOaHLpJFor6KennsYkCUG4gcAa6kw3mk1bxPTAzIaBN
 iGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679044662;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3uLwGBxnZ1mAAqp3kTFoVsk1Zncv2fMmnt4yJjzaSC8=;
 b=5zw1SyOlskI/JvW+J4YFAEv+rnG2Zq+uWuToYwUI5c3HDszDE9tUsi6GL2O0vOa4Hl
 WvnztUeIzz947txOHtYiSJ2mZakR5xw0/JP/bJseVajnz/HQXYYQfmu+SuJHxllBW3a6
 jHgPQGLESNpy/aETZY1eLkhdctTbleeRLJj1eB8WFnJDRnm2TNJim0JfKQ+ry8KnR7/d
 4Jh/+icFyVOhQU+NZnRq45bo9c26MSYOEPDmOelBUcOjoNZBLsNxtDp5VrOlUMbw8Itp
 mAK07T29rr2u8YFvaS8XxaoMdxNtDAQvMsDbkPaUnN2iFT11kHJ01Vp+OWzMP4Ujb/LB
 W3Pg==
X-Gm-Message-State: AO0yUKUSq6uCp0F4rekXB+k908gzmsd4OVjXVUzLCiBHTjNrgpLtlrCK
 i9nd6SLiPhxopu3oWjV4/yA=
X-Google-Smtp-Source: AK7set8Wy+EAASUZlw92CKWNn4SHSF73SNcbsJZangV3rMR/ZtM8l7f1OxSnUfUPci3N1EtDFWGHmg==
X-Received: by 2002:a2e:6816:0:b0:299:ac58:1c4 with SMTP id
 c22-20020a2e6816000000b00299ac5801c4mr1330636lja.1.1679044661786; 
 Fri, 17 Mar 2023 02:17:41 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 v5-20020a056512048500b004db513b0175sm280708lfq.136.2023.03.17.02.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 02:17:41 -0700 (PDT)
Date: Fri, 17 Mar 2023 11:17:37 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH v10 01/15] dma-buf/dma-fence: Add deadline awareness
Message-ID: <20230317111737.48702bca@eldfell>
In-Reply-To: <20230317110921.0862cc8b@eldfell>
References: <20230308155322.344664-1-robdclark@gmail.com>
 <20230308155322.344664-2-robdclark@gmail.com>
 <ZAtQspuFjPtGy7ze@gmail.com>
 <CAF6AEGsGOr5+Q10wX=5ttrWCSUJfn7gzHW8QhxFC0GDLgagMHg@mail.gmail.com>
 <ZBHNvT3BLgS3qvV5@gmail.com>
 <CAF6AEGu1S2CXzRxV_c5tE_H+XUGiO=n0tXjLZ_u_tW-eMqMsQw@mail.gmail.com>
 <ZBLg0t0tTVvuPuiJ@gmail.com>
 <CAF6AEGvV5arZThTyju_=xFFDWRbMaexgO_kkdKZuK-zeCxrN7Q@mail.gmail.com>
 <CA+hFU4xbssR+=Sf4ia5kPdsSb4y9SQUd4nx_2p1Szcbtna28CA@mail.gmail.com>
 <20230317110921.0862cc8b@eldfell>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q5zE_g6+8PZb=tpp8CN.PRC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Rob Clark <robdclark@chromium.org>, DMA@freedesktop.org,
	Jonathan Corbet <corbet@lwn.net>,
	Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
	intel-gfx@lists.freedesktop.org,
	"open  list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org,
	Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Q5zE_g6+8PZb=tpp8CN.PRC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 17 Mar 2023 11:09:21 +0200
Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Thu, 16 Mar 2023 23:22:24 +0100
> Sebastian Wick <sebastian.wick@redhat.com> wrote:

> > Vblank can be really long, especially with VRR where the additional
> > time you get to finish the frame comes from making vblank longer.

Btw. VRR extends front porch, not vblank.


Thanks,
pq

--Sig_/Q5zE_g6+8PZb=tpp8CN.PRC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQUMDEACgkQI1/ltBGq
qqdONw//Rgotd8hOFTtCdsTpbSF7YOFikuzzzDIDxuXPRDAkMFSndLcsdjesT/3L
KZqIPV4Ep1pelG71zllYvYB/cRQ9tMa8iITUhMVcAwYCp7I1645/1yhOJ2HHDiFZ
sWHoek/TEIB46ReOidtjFo2xHX4xWMF5+MNqOevoo3ZB54nqvCTmNZSbisuGaBsn
IVtV98giR2ioxwxsPmrhKufULtu+DP2eQmZv8Y9SIQBIIqlAr6dqF5Z0jwaITRsw
/XK1o0CpJv/L1SEo5Of8XhT7YCU5l16cpUXA4OjPQsHZdIiZ/1+4wcm7seJNSM6Q
D/HKZuvmmE5FJV8M6O7rhKeYmxRefMntg5wngAxwqpuu80PxZa3MRH0dk1wcuvei
EinMcr4IukkOijVlQQ05yDy6SpNUGTOaez0zWy6ftLUI7bNk8jL2DVsgyfU9zkUZ
7QT5CDKTIUtLuCs+5QT7iphcGo+iBq1M9bgQyM2MU26oOOnP95dIFAEXw5Ofcuab
ZxcQDNE22dJlDOj5zGz2r9B30zzaX6E+Tw2CFq6Tm58BBRBv9o9MuM3StNUNuOQ8
lsF9q7BZiuBDr3pFks+YIWt6Ia5Wz/LMw92UYkSx+vnNKcZO3k/kcAYYnpU0izfH
gd082Gvt7zd/rjURoruKFxaG6hQOIzqHZuRukX6Oj4rTSva/mPQ=
=kkpl
-----END PGP SIGNATURE-----

--Sig_/Q5zE_g6+8PZb=tpp8CN.PRC--

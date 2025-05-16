Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0983EAB98B1
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 11:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E856C10EA10;
	Fri, 16 May 2025 09:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="0CtsKsz0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4B610EA06
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 09:23:28 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-476977848c4so21110721cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 02:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1747387408;
 x=1747992208; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ghCVBFohCqPYMNm54QVPyhJ+LtBlN+TIFH3Qtc52S1A=;
 b=0CtsKsz0UXBMrpJEO3zKz01342c3sJUoxPbYbQ64+SDfuntOV4HKAhAvuOKFZNULAU
 DnLk7DO5LzRxfNDOE2X2bLxfUC3qBxvNDmCFp4/CIEAd2yG2LEUnIaYDt6xeMcZVC5Tt
 HpnjaCLskG9fmUEBYUzof1UpJhkSW9UrXEXOsbWLbA3BM9k/cN5xboigTh3GxUrWVwoJ
 PUiJQooJbKfnV7Rb+pmLddFzjmEqbFSgKMEgrN95nGxSg+DVR5lUynQYZU5UQJeN1hMT
 aku9i9JS8J4BS6dCFuua10M43q76PbD6XBdaSzRGIO/LnRz6QqzMz7UZi3chCliwtN2X
 ke6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747387408; x=1747992208;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ghCVBFohCqPYMNm54QVPyhJ+LtBlN+TIFH3Qtc52S1A=;
 b=chZC1r2db06tJH9lvuNbtn1dy2JR3cPTRskX/B0dltQZDXV3XraiWCXtiEAW0H1/ig
 N/HVXXiIMcn3kX+dnbU2GFiPIrU1nDiNEaY/DUHUBxyKOJz6ZtOww3Kvzy5fAR74E+YT
 E3rfcyR2lS7sS/y7Y9MHrVfvtR83KDxN6YVde0FGYKGySw3ADCWPBQyAk88jKol9Qnvm
 1oxCiXyL4xDsYSVsoeIJI3usSfGXuC36RecLi2dhJtJtLB8kTtrlITPXw605HVe9gWe6
 fs0uvCR56WoYgIou1Pn4Y49CLLBy8I+jtLUEQibpt15/00RLVrBms4kHqfN2rM0M1BBR
 t33Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjr33WkoSHVFRwV2A90eZlY3LQ7+2e/8wLdZXnUrJmHtVMfm+AhQw4upu59eghx0KFP5sF8uQIt+g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLFPa5F0pqEo3pSPTO2MYqK/CAiubGjad2zIatGXt+S7/1n/L2
 qWZRoV7yt2j93z+k6htHFmUnAjqy3bDq5XQc1cUgBWdhTYWb8AfdZKujsRXL7sRW/jozCCCNTPk
 SKYdMrwXHfw==
X-Gm-Gg: ASbGncsKVEQ8aAyC3n44h7EyWafM1lojMyk4/P1vcoBiqSe6hOrcHAK0eaACyo8sfKu
 kUwRI/PiZMF0UXivGTkCMl6aJZErirekfZ1Pl1DJrXGSygYfF1GhbzO38Cjl+CT8bWOe0W8Ifei
 jiYzqBgEP6YGF7kbzydXKsaCukigcY+NPuJuNbjhxGsdiQVweWBRQaXT7S/pnJvTWWmV005v1BP
 lPbeQD8XAUjLTdK/4l1LU2Rj1bp6IPsz3nTAC6HQSgPtzh2e/6/umlUG8Pb6NIFUnZaV0Ry9ivD
 PMgESXzJI0bKBpHVbqguZptOQzcQnwRESU5o6Zn9XMWUNYZxrzD6hTw9WsylpKWwxH5EMMaindF
 hFDsn/SdfD5nkh6XeJjM=
X-Google-Smtp-Source: AGHT+IGU4q2wYLiG5SX6kg63ufR9Mt/Y31jnbAZzNe6VBOGETyUicKmwNvE2LeX2UepuTb984ueGNg==
X-Received: by 2002:a05:622a:1b29:b0:477:1f2f:1717 with SMTP id
 d75a77b69052e-494ae3ba064mr41858491cf.20.1747387407614; 
 Fri, 16 May 2025 02:23:27 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com.
 [209.85.160.170]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae4277a0sm9231871cf.43.2025.05.16.02.23.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 02:23:27 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-47686580529so20198231cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 02:23:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXVfZT2ZUVb1N6wAUkCSnP9s5RpnXRs8dIqpeRnPu5NYotDFVIt74enwvEqXtmKOcj/k4K6JQExbpk=@lists.freedesktop.org
X-Received: by 2002:a05:6902:4888:b0:e7a:b59a:e99 with SMTP id
 3f1490d57ef6-e7b6a08f866mr3989501276.22.1747386940957; Fri, 16 May 2025
 02:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-4-d4dbcfafc141@tomeuvizoso.net>
 <2950819.ElGaqSPkdT@workhorse>
In-Reply-To: <2950819.ElGaqSPkdT@workhorse>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 16 May 2025 11:15:29 +0200
X-Gmail-Original-Message-ID: <CAAObsKBrXZscvhjYnSb2DBL1KGsaMHpPVfB_QrFUPihd2+srdw@mail.gmail.com>
X-Gm-Features: AX0GCFs7JNRTyA51Mp_5c2sfGP8DF36VD9y5YcZK4C0Caod07VePTbyWDenldvk
Message-ID: <CAAObsKBrXZscvhjYnSb2DBL1KGsaMHpPVfB_QrFUPihd2+srdw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] accel/rocket: Add a new driver for Rockchip's NPU
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
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

On Fri, Apr 25, 2025 at 8:22=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Tuesday, 25 February 2025 08:55:50 Central European Summer Time Tomeu =
Vizoso wrote:
> > This initial version supports the NPU as shipped in the RK3588 SoC and
> > described in the first part of its TRM, in Chapter 36.
> >
> > This NPU contains 3 independent cores that the driver can submit jobs
> > to.
> >
> > This commit adds just hardware initialization and power management.
> >
> > v2:
> > - Split cores and IOMMUs as independent devices (Sebastian Reichel)
> > - Add some documentation (Jeffrey Hugo)
> > - Be more explicit in the Kconfig documentation (Jeffrey Hugo)
> > - Remove resets, as these haven't been found useful so far (Zenghui Yu)
> > - Repack structs (Jeffrey Hugo)
> > - Use DEFINE_DRM_ACCEL_FOPS (Jeffrey Hugo)
> > - Use devm_drm_dev_alloc (Jeffrey Hugo)
> > - Use probe log helper (Jeffrey Hugo)
> > - Introduce UABI header in a later patch (Jeffrey Hugo)
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> >  Documentation/accel/index.rst           |    1 +
> >  Documentation/accel/rocket/index.rst    |   19 +
> >  MAINTAINERS                             |    8 +
> >  drivers/accel/Kconfig                   |    1 +
> >  drivers/accel/Makefile                  |    1 +
> >  drivers/accel/rocket/Kconfig            |   25 +
> >  drivers/accel/rocket/Makefile           |    8 +
> >  drivers/accel/rocket/rocket_core.c      |   71 +
> >  drivers/accel/rocket/rocket_core.h      |   29 +
> >  drivers/accel/rocket/rocket_device.c    |   29 +
> >  drivers/accel/rocket/rocket_device.h    |   29 +
> >  drivers/accel/rocket/rocket_drv.c       |  273 ++
> >  drivers/accel/rocket/rocket_drv.h       |   13 +
> >  drivers/accel/rocket/rocket_registers.h | 4425 +++++++++++++++++++++++=
++++++++
> >  14 files changed, 4932 insertions(+)
> >
> > [...]
> > diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/r=
ocket_drv.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..c22d965f20f1239a36b1d82=
3d5fe5f372713555d
> > --- /dev/null
> > +++ b/drivers/accel/rocket/rocket_drv.c
> > @@ -0,0 +1,273 @@
> > [...]
> > +static int rocket_probe(struct platform_device *pdev)
> > +{
> > +     struct component_match *match =3D NULL;
> > +     struct device_node *core_node;
> > +
> > +     if (fwnode_device_is_compatible(pdev->dev.fwnode, "rockchip,rk358=
8-rknn-core"))
> > +             return component_add(&pdev->dev, &rocket_core_ops);
> > +
> > +     for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-c=
ore") {
> > +             if (!of_device_is_available(core_node))
> > +                     continue;
> > +
> > +             drm_of_component_match_add(&pdev->dev, &match,
> > +                                        component_compare_of, core_nod=
e);
> > +     }
> > +
> > +     return component_master_add_with_match(&pdev->dev, &rocket_drm_op=
s, match);
> > +}
>
> Hi Tomeu,
>
> something I've noticed while playing with this: currently, it doesn't see=
m like
> it's possible to support 1-core NPUs. rknn-core-top is a real core, but i=
f no
> rknn-core is enabled beside it, it'll call component_master_add_with_matc=
h with
> match being NULL. This causes a kernel Oops.
>
> I'm not sure what the proper fix is, since the component API doesn't seem=
 to
> really have a consideration for a master with no other components.

Yeah, I think we could add a code path for single-core NPUs that
doesn't make use of the component API at all.

> I ran into this when I was trying to debug why I get job timeouts followe=
d by
> a full SoC lock-up on RK3576 by running with only one of the two cores en=
abled.
>
> As an aside note, my throwaway rocket-on-RK3576-hacking-branch is at [1] =
and
> contains some changes you may want to consider for v3, e.g. [2] and [3]+[=
4]. In
> [4], specifically the `domain-supply` part which means the NPU regulators=
 don't
> have to be always-on. Though feel free to pull in my entire ROCK 5B enabl=
ement
> patch.

Ok, [2] I already had in my WIP branch. Will pick up [3] and [4],
though I cannot test them myself.

Regards,

Tomeu

> Kind regards,
> Nicolas Frattaroli, who discovered that his cat is apparently 5% space he=
ater
> according to mobilenet while playing with this patch series.
>
> [1]: https://gitlab.collabora.com/fratti/linux/-/commits/tomeu-npu?ref_ty=
pe=3Dheads
> [2]: https://gitlab.collabora.com/fratti/linux/-/commit/73aba31a00b34c254=
be575b524da568e115d985d
> [3]: https://gitlab.collabora.com/fratti/linux/-/commit/bd3a7bf5054c54c29=
15a9dc0396730d0f24b3b7c
> [4]: https://gitlab.collabora.com/fratti/linux/-/commit/5da44d61b09c34530=
9f76159574d447d071c295d
>
>
>

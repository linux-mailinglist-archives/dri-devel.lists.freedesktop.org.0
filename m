Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E67CE49FB
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 08:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8812410F687;
	Sun, 28 Dec 2025 07:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d4AGTtaW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5510F10F6F6
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 07:54:44 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-5dbdb139b5bso7331833137.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 23:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766908483; x=1767513283; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QCyx6Mqpzdar9VYEKGCLb4kdS1Mp74Ev7TEjgfeFuw0=;
 b=d4AGTtaWIA7tYSyUFy8v4M1QA0EIVloOzQy1sD8Azf3HmqSYQQJ7GOGSbk8IQCmAHC
 +49RbuAXTgHuav4iQQ3uoOsYCCjp+4sSzftFYDEzbcYhjl8UU1qviorVccoDi6tLipix
 DjeFdryHPzf5SkvLC+yaOzrJ46Kv69G9aycQwYUyyqtzrBVvXaK/t9xZeBR5jZA9BlAX
 q8MEX34lQT6eT1tJbaPN4KcJoqFZfUfd/Lf0eigrbTjSMbFOHQTP+WlDp+ACmPLI7SUU
 B4eYkrT4GymRCpwV5TnZznDu6HlNXQtrGF8aj4q757+n+dvIOEbjO00KIcXcUtse7kY6
 +FSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766908483; x=1767513283;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QCyx6Mqpzdar9VYEKGCLb4kdS1Mp74Ev7TEjgfeFuw0=;
 b=qFDV0I0PiOCkiGyL4ulRgYurv9GjECGuvtvf5ajX/cIyyHYjZfVKw6j/9lBsqmXad7
 9anP1qh35nJ5JPoo84sPDyEKXWNOmEaXoFomvknIZKnd55BXcL1ly+w0cP3WJJU97VRq
 ndaA7q9hLOLNSchh3LNPhCQlRoCQ1GJqqc+tUtQoi3p0Tlr1kEen19pQ8jkrpJ/vwwTV
 12nEbXCkE7syh2i7p9O5QXJoXfEpNugEpsOK7HGlCjx4vWcLeSVLAp1V3E+gcwjr4QBU
 EsSE3nhiqfNhqYra55kEu2C/kBt5ex5S4rFjxesg0FnXTI4+2C1irx9RXyktWOpKkpdY
 ejcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW19uWhNglZfGADh82RHUQtYrT8FK4fpcptYmTod4EbF6Lo8/yxQ5+vw3E6L0669xk5JNIlFLX/FeI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoshbDb9wbXMJ82r8fgfsYj2atX19s3eDe/d4GzRlW1EI2Nm0h
 JJunQ3t0hN/uvtfrjmS1jgk+N+BMMEo5gbni/I+9C/Qd4IUijAh/N9JZWliQa4TnlqCc5HMbEzd
 gExZmJCVjdCg8FvCk8chPR2NNlxHHGyM=
X-Gm-Gg: AY/fxX68rDEObAn3Foc/hVDvdQ8vPHT5ARoO4+sSe1K8fZXIBzSr9WCV2ihos588UBs
 Wmm1QDYlxjPk32+/XeFus7OqFTGLbRqGJf5te6wwmBHACdwFMNrPQEkGm0PAj7cVS1QeBJ57vMI
 q8zgj2kxZHS4QCmGUigB9aTqwYJL2Fys8d6AeZCf/RVvbpVVTm6XpwFf45jXx6z/JXtIR1YS35K
 hfSkIJvgJ+k+mIfZs26dlSqnlUYu4kYhr6jvIf1YHZ6eXx+MtTaTqmr0Yr/mAP2GzfrMpWHu+nV
 6t17GTevx1aoiVsEydMYwwyF3poIonqmq0bSJ6LfUKiAOyWDQRZfOMUGrDqD
X-Google-Smtp-Source: AGHT+IGVFw4oN6vVpsJvVT3zYapZ4PgCC6CBlt/bXWp1hbVF3nJvyRYFG+o8Vhg82iSdQ8egqcYOxboHJROhnTHc1mg=
X-Received: by 2002:a05:6102:9d9:b0:5df:b7f3:5875 with SMTP id
 ada2fe7eead31-5eb1a6259a2mr8916658137.3.1766908482707; Sat, 27 Dec 2025
 23:54:42 -0800 (PST)
MIME-Version: 1.0
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-3-zhengxingda@iscas.ac.cn>
 <D5A173F1-D439-49FB-A4A0-B632550BF35B@gmail.com>
 <20251227-gigantic-handsome-falcon-3c31bf@quoll>
 <CAAT7Ki9m+MD2_EntEt=-2ZPFxbMNt6LV_kZu-aAvGZ70e_SUhw@mail.gmail.com>
 <27c89053-ea11-4165-9a85-9dcfa093c56a@kernel.org>
In-Reply-To: <27c89053-ea11-4165-9a85-9dcfa093c56a@kernel.org>
From: Han Gao <rabenda.cn@gmail.com>
Date: Sun, 28 Dec 2025 15:54:31 +0800
X-Gm-Features: AQt7F2rJ5Jy8N41aXl0xe_8wJa_GDgLM1pD4NXthJd81_UcUbDbPnhm9CA4Evis
Message-ID: <CAAT7Ki_BxdC8cS7Qs8qVhJJXPPf8ma9MROFLA22J1WOOSgj=dg@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] dt-bindings: display: add verisilicon,dc
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, Yao Zi <ziyao@disroot.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Icenowy Zheng <uwu@icenowy.me>
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

On Sun, Dec 28, 2025 at 3:49=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/12/2025 13:08, Han Gao wrote:
> > On Sat, Dec 27, 2025 at 7:09=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Thu, Dec 25, 2025 at 05:45:00PM +0800, Han Gao (Revy) wrote:
> >>>> +            dpu_out_dp1: endpoint@1 {
> >>>> +              reg =3D <1>;
> >>>> +              remote-endpoint =3D <&hdmi_in>;
> >>>> +            };
> >>>> +          };
> >>>> +        };
> >>>> +      };
> >>>> +    };
> >>>> --
> >>>> 2.52.0
> >>>>
> >>>
> >>> Tested-by: Han Gao <gaohan@iscas.ac.cn>
> >>
> >> NAK, not true. Otherwise explain me how can you test the bindings.
> >>
> >>
> > I cherry-picked the patches I gave to Tested-by on my test branch,
> > compiled and ran them on Lichee Pi 4a.
>
> You cannot "run a binding".

I understand now. My understanding of dt-binding testing was incorrect.
I will not repeat this mistake in Tested-By.

>
>
>
> Best regards,
> Krzysztof

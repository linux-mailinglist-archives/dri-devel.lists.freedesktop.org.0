Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B81C9D2A989
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 04:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DE410E201;
	Fri, 16 Jan 2026 03:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BkEqDP5y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA8B10E201
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 03:14:32 +0000 (UTC)
Received: by mail-dl1-f52.google.com with SMTP id
 a92af1059eb24-123387e3151so77569c88.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 19:14:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768533272; cv=none;
 d=google.com; s=arc-20240605;
 b=SB/UGTFZELhT4QiuwCmxHLbabVup8M2eG6hfFX1oC5euaN5/rG5y6mONyHKiSQ+2VK
 Rg9CwlV1HuBFwHG8Fsv+CWOtsc+MSkWL32SoY6D+JIXb9BRIK6cUVO3mrsmKOw7Y5JKe
 CdBmI4cidgSzsTpY6riAFC2cr+82WG8z8BU7vE5GqfAFO4scdHQSiWQ3kRe45wjtLNgp
 55lAXID2Ug31PKWSHdB/VSLFivwI83xLLXWWoSWoygjK71EbWjJXxOI/12Dpz89jKdNj
 PSyu0hOSeOhkPBhqsJHdi7+qqX9FHHAhUitZ7nL5PQvhEeHaGl3wUp2zW1LE3FxvrDsG
 cPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=y8uyqOJ2QcHQe+ruRr+rUSDi8IHNCrdMbjlnyzSx4RA=;
 fh=sybKbF/Z79rVKfQZUVB24wCew+F0Puqu/kzyTTJVTw8=;
 b=WZFvWXovM2qsRgK1qslqlYbktzqN32Fx3Ccu+wv1rEZNjEzLXGvoKLs0yR6axe5klg
 2d16roWhkvwRz9qRWCN/LMox++lgltRUIsBtQlwqZBsY6UDX/2qETRneOHfzdIJ1B95R
 DX/Y6s5l3yNPbdkuJXEude7yvs1CFIUSgh8W0geGNXdjHKmwPhlMYRbqL+soYu5Z0jpj
 PIIhmvCvMY5267fyFjD0uHzgWUUe1oilTZrI73MWI3k82HtCizZ6Z/XOSlqRjCnJ1A+/
 iZ/CpKSIo5chQ8M0L841Y3irBS65iReSUuAmZDa6HA8j74ptDoEq2rvQrqc8bhObjxuI
 VZ+Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768533272; x=1769138072; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y8uyqOJ2QcHQe+ruRr+rUSDi8IHNCrdMbjlnyzSx4RA=;
 b=BkEqDP5yy6hAHUOEyS/LiFgxFuac4wRsX/g5ZaEAoUpxR4xrZJVyeLpZ8Uw8wqLMYg
 PSh5YYlmMoiqrf1OL3fspozz+9mAu7cvdFu0ZTDywvfdEpOOIDOBSfH8o9Z2V6t9n1Yz
 MY2Y6AqHSiOY4TqILJhmI/lws22PKDcVB93+3uWkrafrktHatqPdT7kqTf7yeS+cELSE
 wjbBXTyMEpVIOuNktfJ+zJOK8SyRPcj+3CD5wK3MWP467ObQrY+p6BRVAKXtJtS3zyGN
 th1RveEyQX81T1l4gyg2zNQ61rdwo3e8za368N03Fk3pYnYKPi693o0WvcFYc2dGAdiT
 RM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768533272; x=1769138072;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=y8uyqOJ2QcHQe+ruRr+rUSDi8IHNCrdMbjlnyzSx4RA=;
 b=giozlwBtsVfAhzEGo71STZZ1/XIKMpvuNMwkssIp4++BvN147dNpEfEwYkGXeSAAfe
 J1oXCWXn4vEedCJ2MXnfpjWKfVGn3G9Ocyl8WiLR5tekVitEBiYLqKdgfRD5kcZ7w47M
 ZomWjOm8UDqMOb7WioWmqUy9x6zGChSbV112A+NrNZQH3ZUQLxxizb9doi8tjvko76zj
 o9eUIHo+lLzp0hLX31ASZKL9WJTrS5ELLt+M03Pr/QlTwQLoz42wbM/kuJXgCglaSy9h
 C2KRnVFKidoAaMbOxilDh9+FZfe5KMy2XA4oHccVWkKrwOsiJxRkzdutYy8SkikJZBvj
 MdZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkFilafGOqlDPQr1jfcKF9wxNAkLjx92ZytXvAT61N6DZRBZnDcI1MORd/8Xh34mVCP5uIEmRGpZo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJgKUhR67BtJztkCyuXwi2Tez+ISsx6GVSH1Dtvw01FMC1kAxp
 cjFqIVzeOHYK8xnxxUHJWMV2Um09NbfSXOwuSPdBmCWTVJ1gcNFOS40YSkVCwcUbnIKlr56DrI2
 J3Om0ff3oFPF4FGubb99qCTFYlPQql3g=
X-Gm-Gg: AY/fxX6J7EMvDGuBW9WURVbnA6fvY0UdLtcNhRfB1tCk7NxP0c7tuYrWfFfHMiT+0wV
 zBLG59J0YJX+r6B0x0wXgUQD6lQTocj8BTvSb2yITK7OgOsEDEsU6+SBFk2HzGoYNylrPJDZUlg
 uzog+wdjQGqN9scrBmYqYWTbf35keDAB7nZDi2stGXHGrD0jxV7BJO0z8gR6tv7aAnSUEiYoTsI
 XV4CO0IlGDccJII6hhu/fIVis3AfG1gPkUP6w85JfygQLwciyy9f18aDeA6K0TR9Msvx2N8
X-Received: by 2002:a05:7022:3b83:b0:11e:3e9:3e9c with SMTP id
 a92af1059eb24-1244a817bd4mr782142c88.7.1768533271804; Thu, 15 Jan 2026
 19:14:31 -0800 (PST)
MIME-Version: 1.0
References: <Z678TNhCbTk363Tw@kspp>
 <864c7dd5-0deb-4adb-a1cf-c8a809514d7e@embeddedor.com>
 <217b00f5-d03d-4624-9ba9-d838199ef7b9@embeddedor.com>
 <CADnq5_M5Jv4A5CXAKY2Qd-dhrfmecnauRtVY_ghSsut7i=KNww@mail.gmail.com>
 <d07b4edc-6048-4c10-b8ac-dcccd5a932d3@embeddedor.com>
 <d43dac3e-122d-4c16-9c1e-760eac91b8da@embeddedor.com>
 <CADnq5_Mqa2HWWKrAYTAfjdvEQTMUeB1MBnhtRxJZjXLWcz1nmg@mail.gmail.com>
 <202601151612.79AAC91869@keescook>
In-Reply-To: <202601151612.79AAC91869@keescook>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Jan 2026 22:14:20 -0500
X-Gm-Features: AZwV_QhaEijQPE2R1uX7dLX9VVSiTVRCUmrApYg-eiHu8Z06MK5pP2UxHwM2ZZU
Message-ID: <CADnq5_O4SQEmXxod8y+_9zBW1uBRJL7WpyJkcTUo1B7Pa7Yj-g@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/pm: Avoid multiple
 -Wflex-array-member-not-at-end warnings
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Kenneth Feng <kenneth.feng@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
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

On Thu, Jan 15, 2026 at 7:14=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Aug 13, 2025 at 08:57:58AM -0400, Alex Deucher wrote:
> > On Wed, Aug 13, 2025 at 1:12=E2=80=AFAM Gustavo A. R. Silva
> > <gustavo@embeddedor.com> wrote:
> > >
> > > Hi!
> > >
> > > On 22/04/25 23:58, Gustavo A. R. Silva wrote:
> > > >
> > > >
> > > > On 16/04/25 09:04, Alex Deucher wrote:
> > > >> Can you resend, I can't seem to find the original emails.
> > > >> Additionally, all of the NISLANDS structures are unused in amdgpu,=
 so
> > > >> those could be removed.
> > >
> > > I'm taking a look at this, and it seems that those NISLANDS structs a=
re actually
> > > needed in amdgpu code. For instance, `struct si_power_info` contains =
a member
> > > of the type of `struct ni_power_info`, and this latter struct contain=
s a
> > > member of the type of `NISLANDS_SMC_STATETABLE`, thus `NISLANDS_SMC_S=
WSTATE`
> > > and `NISLANDS_SMC_HW_PERFORMANCE_LEVEL` are needed, and so on.
> > >
> > > So, it seems that all those structs should stay. What do you think?
> >
> > They are not used for programming the hardware.  They were just
> > inherited from radeon.  All of the NI SMC stuff can be dropped.
>
> (Looking through patchwork...)
>
> It's not obvious for me how to drop that stuff. It seems pretty
> integral? What's wanted here?

All of the NI stuff has been removed.  You can rebase your patch.

Alex

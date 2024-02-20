Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F60E85BB15
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 12:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3681D10E375;
	Tue, 20 Feb 2024 11:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="k1bbwSNq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDB910E36A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 11:55:52 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dc745927098so4735357276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 03:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708430152; x=1709034952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uumLRt54NCf1C2r2Jw813VJ80gZwOfopdqyWnHS9j/Y=;
 b=k1bbwSNqafW8DzMe/sq4H/jzurvLciNK+BqbFdzRDFlK3Ed804C0NZ4GzwqoMAntxK
 Wpgz2AEe0FTtfCksMZDUTaYNRIhvX9aydQlbs8gWaW7vlmwMgQAbt2q5AS70w4sfUhpt
 gs/YgJqvO5k2DwzFOirrxIIuCYC1Qkz5nTlzrxAo8QF4nlvPJhk22ovMi9/+o7hzJXop
 JvMcfkZHDSD534gNR5qKTHeAFlbEoVzLcZlIk4gFKv3+vJkN6NUH4jqMZADVaAwWlhRD
 PVF2CFTWTtaP4kkbEoEAS47M/yIwhleoUwPcRU1jR2jj8378KAoo+gVJ+kx8ROq8S0nt
 dLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708430152; x=1709034952;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uumLRt54NCf1C2r2Jw813VJ80gZwOfopdqyWnHS9j/Y=;
 b=ehvNwqtGPiLkx2LhLNtPgp3G7eyaKxLs/WiwgoKb05jFbfd1/61WC0hkzM8v08FNMP
 y5c2QIDuJGy4BCP9wcvhykO7PeLQlIO2MVHIhzQG+kCCSl0IdQljju5yV1S0WqYp3G4L
 U3TIZDp4vTGZ2MVf7cz4KWL2xCl9pa/7opFFa7ZgoJFvaURxMnXKVLAiAE+GamBKmTTY
 mdGqBksFVhDEZ3mUAC2dPTQA6nUe1Jr05EjusYYA6wugyY+jk5tk1L5ipPEN2ctjDCwn
 L7/alU9GhI3Z5UWUCqqQbB5loRU8ShSjep20pzwOXm+FERuV7Lhj21aBi/9YDiSrZzAL
 yJDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ8S9mg2TX/dFzwTzdoFHURDpIrQZkg3tmGo1AHiNEg5ZQOESjsv2nTqdqKnKF8ziIThhkUePnSa8THqPPr/2JL8bM3XWp/nvn2pg8zIfM
X-Gm-Message-State: AOJu0Yxlw448SA+loG4qkSMRVJ61boI2J0/8cJkmJtki4YII6ppApVcJ
 cr5Wnh53dDMYsy4BM6xBmdUvNKlJdYlpxQb34xMnTuinxZWasjdWDn7mkVVjTEuah3L7S26DNGb
 tUQDiIbhJIdJoo1Ppht3AKE5vzG6v928TjKvddg==
X-Google-Smtp-Source: AGHT+IExpvpD8AgXA3aIHbCHCE4RqNcFOBxn35EoCinO8Hpk+aekmgbnXIo/496q/fTFdU86koAVpAivWwXL7BwqeFo=
X-Received: by 2002:a25:8d0d:0:b0:dcb:ef22:3869 with SMTP id
 n13-20020a258d0d000000b00dcbef223869mr12986540ybl.16.1708430151780; Tue, 20
 Feb 2024 03:55:51 -0800 (PST)
MIME-Version: 1.0
References: <20240217150228.5788-2-johan+linaro@kernel.org>
 <c95f5ff3-8dad-4302-9384-92a9b83f7bdc@web.de>
 <ZdRTx2lmHBVlcLub@hovoldconsulting.com>
 <1afc87c-2c1f-df10-a0c8-2a267d44122@inria.fr>
In-Reply-To: <1afc87c-2c1f-df10-a0c8-2a267d44122@inria.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 20 Feb 2024 13:55:40 +0200
Message-ID: <CAA8EJppH9ey97yKFUccNLHhMKs3eUS55+rY0tXm_a6KGp9jtug@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/bridge: aux-hpd: fix OF node leaks
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Johan Hovold <johan@kernel.org>, Markus Elfring <Markus.Elfring@web.de>, 
 Johan Hovold <johan+linaro@kernel.org>, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Bjorn Andersson <andersson@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Vinod Koul <vkoul@kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@gmail.com>
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

On Tue, 20 Feb 2024 at 13:52, Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>
> On Tue, 20 Feb 2024, Johan Hovold wrote:
>
> > On Mon, Feb 19, 2024 at 06:48:30PM +0100, Markus Elfring wrote:
> > > > The two device node references taken during allocation need to be
> > > > dropped when the auxiliary device is freed.
> > > =E2=80=A6
> > > > +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> > > =E2=80=A6
> > > > @@ -74,6 +75,8 @@ struct device *drm_dp_hpd_bridge_register(struct =
device *parent,
> > > >
> > > >   ret =3D auxiliary_device_init(adev);
> > > >   if (ret) {
> > > > +         of_node_put(adev->dev.platform_data);
> > > > +         of_node_put(adev->dev.of_node);
> > > >           ida_free(&drm_aux_hpd_bridge_ida, adev->id);
> > > >           kfree(adev);
> > > >           return ERR_PTR(ret);
> > >
> > > The last two statements are also used in a previous if branch.
> > > https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/gpu/drm/brid=
ge/aux-hpd-bridge.c#L63
> > >
> > > How do you think about to avoid such a bit of duplicate source code
> > > by adding a label here?
> >
> > No, the current code is fine and what you are suggesting is in any case
> > unrelated to this fix.
> >
> > If this function ever grows a third error path like that, I too would
> > consider it however.
>
> I guess these of_node_puts can all go away shortly with cleanup anyway?

I'm not sure about it. Those are long-living variables, so they are
not a subject of cleanup.h, are they?


--=20
With best wishes
Dmitry

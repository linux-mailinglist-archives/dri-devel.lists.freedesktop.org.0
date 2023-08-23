Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7E9785FA8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 20:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E7310E097;
	Wed, 23 Aug 2023 18:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1988E10E097
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 18:31:16 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-99c0290f0a8so751115866b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 11:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692815474; x=1693420274;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q3RwIooZabMesmbY4FdeXUzYTvCj8JKd8sUgSjAw+Sc=;
 b=BxTOnK3F1QMjyw875e9kMNH6xjAD9wR12Wgx81wJB6V04l5XQOr2mIcOWgW+eM8AmD
 uI1+ENB838GntHgWCEGbkuG/FRhCrdHaKT82+G7y6uhLD4PjbxthAJQ+yw9uu/2hcP62
 fC0SNQ2Ay7vx7vL9APRyGmSAYnDJ9pimkv02s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692815474; x=1693420274;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q3RwIooZabMesmbY4FdeXUzYTvCj8JKd8sUgSjAw+Sc=;
 b=Om940sBNEhZmxNiujpeC79ZOeR+hXEGq0D2pOZBbn5lopgsFTGb83TyysYEmXdxXhK
 EdiYud4002pxjiTlou3N1/0bKAeqWHRTgKgK4EVYdxGNOVZRu8P/GsYwE4vLL8eUMtSn
 OGHSxsDz2jk/+Nmz4ScMsaQK1O/u9XwrKguZO3DZHF8CCM+BuWuWCBTIWuvo2PQuHKpc
 FyNbSiPPymrfEDHv6H1a+6J/jwVrPY6jhQFeMvgiUK+eWMMzAM7SAGSziD5EhwpCC3J3
 H73968nZ9iBzyEECCw7W+yLfAJ149JWlO5XOLzBQsbPrq16qwV5xVLRqRhjQ8P4+pakK
 xRRw==
X-Gm-Message-State: AOJu0YzekGArMkzRFKzK9OZl/Naa/Di3KEcq1+wcNkZP6Hn0x2dukuNP
 Lw0IsBn2rZY6RQ8jkxyFqB6GsxpkM6d2NRIYcPwr2i3S
X-Google-Smtp-Source: AGHT+IEYeGv9fGcwnlFvn4xegOf/cE0GPJ6Ir93mEPwdTigSJFH64qKYfSq7rGjj6m6bQbEzK7AZzQ==
X-Received: by 2002:a17:906:8a55:b0:9a1:ffa7:d2da with SMTP id
 gx21-20020a1709068a5500b009a1ffa7d2damr194654ejc.17.1692815474178; 
 Wed, 23 Aug 2023 11:31:14 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 jw11-20020a17090776ab00b0099d0a8ccb5fsm10034628ejc.152.2023.08.23.11.31.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Aug 2023 11:31:13 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4005f0a6c2bso11255e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 11:31:13 -0700 (PDT)
X-Received: by 2002:a05:600c:3ba0:b0:3fe:dd72:13ae with SMTP id
 n32-20020a05600c3ba000b003fedd7213aemr312232wms.0.1692815473212; Wed, 23 Aug
 2023 11:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
 <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
 <OS0PR01MB5922E0300F53BED1AFFD916E861CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VcjA-99ckLWNczNuP5f2FGx67o1=O8MFVThBTVzPzJBdA@mail.gmail.com>
 <CAHp75VeJ-JjcrfLZd2dyisBmq5r66j=Sq5ubSLpK=kFrodzb-g@mail.gmail.com>
In-Reply-To: <CAHp75VeJ-JjcrfLZd2dyisBmq5r66j=Sq5ubSLpK=kFrodzb-g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 23 Aug 2023 11:31:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VbsfAc4Pb3LY3w3-krqfkmmaZLiBxcxjgea+4S0HU1Vw@mail.gmail.com>
Message-ID: <CAD=FV=VbsfAc4Pb3LY3w3-krqfkmmaZLiBxcxjgea+4S0HU1Vw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/analogix/anx78xx: Extend match data support
 for ID table
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 23, 2023 at 10:10=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> > No. Please, do not remove the I2C ID table. It had already been
> > discussed a few years ago.
> >
> > > Yes, it make sense, as it saves some memory
>
> Okay, reading code a bit, it seems that it won't work with purely i2c
> ID matching.

OK, so you are in agreement that it would be OK to drop the I2C ID table?


> So the question here is "Do we want to allow enumeration via sysfs or not=
?"

Is there some pressing need for it? If not, I guess I'd tend to wait
until someone needs this support before adding it.

-Doug

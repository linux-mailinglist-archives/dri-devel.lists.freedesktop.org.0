Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E41BF7180D3
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 14:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3123510E1CD;
	Wed, 31 May 2023 12:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE73110E1CD
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 12:59:05 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-33c1fb9f2ecso1922365ab.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 05:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685537944; x=1688129944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q+L470TQIODyLvHi77w9JVQYomaA1IumCXuk4QHQjaw=;
 b=eF12ngu7SQy3X+RDZSl9xWRctkAysJ2sSnjcOnqajD8VroQYgI7WZ6HWYxaW4RWGk8
 ngARVZYx02rPN9vt3EKNgnZYof79gDcOYAtd8nkox7Y3BVxSOfQSM58XqdNRu3IojT/S
 WV7Rw16jqgmcj7JZGFzvNO7G+PzpOg97xWl7o3D65aTZ1FgQ/PruSQLEpEHRe31gZ5di
 4mQC1cxokKSTtj5qKdOq+3VHorZ2+SyTYUztHIGpm6EZUy/qZkY6Pn7NXE0V+NBPW2hY
 AqEBZPjJ/2zgS0Hqi3H+Zfn9jhl9ZiJzmAD/qUl/u0B2l2gPiYHX5iNUWAYrw0lzINRm
 7eEA==
X-Gm-Message-State: AC+VfDxBpcihxDcdoCSOUOmU7c71VOJ+3Zkk7qCnwjrPBdacTGlnPq5P
 BtyU9aFP/N8KXuz2WAYzEptzpBM/fTrUPg==
X-Google-Smtp-Source: ACHHUZ4e+UtJ2r/qumZWV24n6LbFRvEbCj/H/KXouj0CjkwyaqmJEZRhbMfijWD993sdEnmCkYDT4w==
X-Received: by 2002:a05:6e02:5cf:b0:335:9028:d6d1 with SMTP id
 l15-20020a056e0205cf00b003359028d6d1mr2194501ils.32.1685537944453; 
 Wed, 31 May 2023 05:59:04 -0700 (PDT)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com.
 [209.85.210.179]) by smtp.gmail.com with ESMTPSA id
 d7-20020a63ed07000000b00530621e5ee4sm1242939pgi.9.2023.05.31.05.59.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 05:59:04 -0700 (PDT)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-64d5f65a2f7so3998107b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 05:59:04 -0700 (PDT)
X-Received: by 2002:a25:e706:0:b0:ba8:68b3:c67c with SMTP id
 e6-20020a25e706000000b00ba868b3c67cmr6116103ybh.34.1685537522036; Wed, 31 May
 2023 05:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
 <20230529080552.GJ25984@pendragon.ideasonboard.com>
 <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531085941.GA27043@pendragon.ideasonboard.com>
In-Reply-To: <20230531085941.GA27043@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 31 May 2023 14:51:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
Message-ID: <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Wolfram Sang <wsa@kernel.org>
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, May 31, 2023 at 10:59=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, May 29, 2023 at 09:00:43AM +0000, Biju Das wrote:
> > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device A=
PI
> > > And why do you need this ?
> >
> > As per Krzysztof [2],
> >
> > The DT schema allows multiple addresses for children. But we lack
> > implementation of parent child relationship, As parent owns the resourc=
es.
> > Child device needs to parse parent node to get some resource
> > like clocks.
> >
> > [2] https://lore.kernel.org/linux-renesas-soc/TYCPR01MB5933BFFD4EB556F5=
FB4EA82186729@TYCPR01MB5933.jpnprd01.prod.outlook.com/
>
> The I2C ancillary clients are not meant to be handled by separate
> drivers. You're supposed to have one device node in DT, which causes the
> I2C core to instantiate a main i2c_client, and bind it to one driver.
> That driver then uses i2c_new_ancillary_device() to create other
> i2c_client instances for the secondary I2C addresses. Those i2c_client
> instances are not bound to a separate driver, so there should be no code
> that needs to look at the parent for resources.

In Biju's particular use case, the i2c device responds to two addresses,
which is the standard i2c ancillary use case.  However, what's special
is that the second instance is a derivative of an existing i2c device
with an existing Linux driver.  Hence the desire to make the existing
driver match against the second instance, which requires these changes
to i2c_new_ancillary_device().

As some resources are shared (knowledge about the clocks), splitting
this in two distinct devices in DT (which is what Biju's initial patch
series did) would need phandles to link both nodes together.

Do you have a better idea how to represent this?

Wolfram: time to chime in ;-)

Thanks!


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD6E9B6D86
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 21:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EBF10E0BB;
	Wed, 30 Oct 2024 20:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ZDtJPcyu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6A110E0BB
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 20:21:12 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2e2b9480617so171489a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 13:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1730319672; x=1730924472;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VxptXU8oKSlVF2fvRzkZip9fG/KS/MTrvVI6j9ReCRo=;
 b=ZDtJPcyu2YyefuLEDMM2dCtHTRvaK2NTILPWHo0PxSLsqmrmJ2e2EamL3xXas2CsdX
 mLATGVEuDJruxGw8PacWVSPbUNEvZb+LcGIzqWSCbwiuTpbq3bTKewCEp8+gwwJz/rDz
 Ml1BFVpiA5bJkdrE4ohFwZe/VtXWK1L6INFd8m5KM/Tix/Kr8xku/SLlk3/csFN9RS7J
 WScL4AUGd0zFEuXiZPNXSf/0kBv044JMMy+7IVGt6TAHSHlD+nOlmIM4cUqqi9n6o6Jz
 OIW1YWF8D4IrLtSor8LFEtsV2HJqBHQrm4PYVqGyN7JL0f4uLGK2Q+tFsZQiYNl0Z1CD
 wo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730319672; x=1730924472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VxptXU8oKSlVF2fvRzkZip9fG/KS/MTrvVI6j9ReCRo=;
 b=AtCPePBuze7pPOwz+R6T4Jgp6d/qZ7JX1sLBPS3MDUq5C2vWfzjgkmjNbnvIj1gBfo
 5r+foQlnkLREjDUiqRgRUCjgdX1uBJpfuWaOM5GEY2eab5akBCHMWWhfsBxUVvkmm96u
 LG7u27meM6br4BiwUcZZAnQUAFZSQqAiw5pHjWBQnU4+IRxDzYeAoidgmOA7sv3U2mCt
 nGJTdLDrL1aQgPo4H42v4DffMimAGU3tfb0aIGN/dBgAuehDvyK7/tTImCSRWd3aQoTz
 qcGDcJE5GOxSuxBDojedhg68YyJSls+WK7L4wVcsga9MKs8ZylvedvjOVco4vLr/2iP8
 Z8lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQJV32CZwYoljL5Lw1QAyRNE/9jpdc5Eabb+C7m/Zzc9fqGHr689G1APdL1lbAl9tu2Ohr67yHNNQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBypTGWriHpVw5uwstKiBOhng2ketz4IQxvlPxhg/CQ4qT6wZf
 Pl8C4JZSTQrmn5jmJhytNMmNaTCL/bPX4WW4wGQ1DDBkESbftCodClVUZdjsQiUuZSMqVL0r5QQ
 +wHX6fpeLLaih7gQXWciS9Eb4441e3Lm9p8VA
X-Google-Smtp-Source: AGHT+IEP9wXNWXu2pk9j6AVVN/5LTlwN5rgVci/DlwsY/hQHHrt79TYJSPQXM7eBts4e9mwGpTVwOvfM4MoIEhR+9sI=
X-Received: by 2002:a17:90b:1c84:b0:2e2:b6ef:1611 with SMTP id
 98e67ed59e1d1-2e93c1710afmr870053a91.18.1730319671512; Wed, 30 Oct 2024
 13:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240203165307.7806-1-aford173@gmail.com>
 <20241025080544.136280-1-mailinglist1@johanneskirchmair.de>
 <6d039ecf-0e48-415a-afd8-6bfce60081ae@kontron.de>
 <CAHCN7xKevGWipBSch6gKVeJRT9Zb8QTchhxg3c=96XhnAvnjZw@mail.gmail.com>
In-Reply-To: <CAHCN7xKevGWipBSch6gKVeJRT9Zb8QTchhxg3c=96XhnAvnjZw@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 30 Oct 2024 13:20:32 -0700
Message-ID: <CAGETcx-LGZ1k-seh4LkvCobsxUk67QK40swiQvH6Wrzs0Log0A@mail.gmail.com>
Subject: Re: imx8mp: HDMI display blank/black problems
To: Adam Ford <aford173@gmail.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 mailinglist1@johanneskirchmair.de, 
 johannes.kirchmair@skidata.com, Laurent.pinchart@ideasonboard.com, 
 airlied@gmail.com, alexander.stein@ew.tq-group.com, andrzej.hajda@intel.com, 
 catalin.marinas@arm.com, conor+dt@kernel.org, daniel@ffwll.ch, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 festevam@gmail.com, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 kernel@pengutronix.de, kishon@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 l.stach@pengutronix.de, linux-arm-kernel@lists.infradead.org, 
 linux-imx@nxp.com, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, marex@denx.de, mripard@kernel.org, 
 neil.armstrong@linaro.org, p.zabel@pengutronix.de, rfoss@kernel.org, 
 robh+dt@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, 
 tzimmermann@suse.de, ulf.hansson@linaro.org, victor.liu@nxp.com, 
 vkoul@kernel.org, will@kernel.org
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

On Wed, Oct 30, 2024 at 10:28=E2=80=AFAM Adam Ford <aford173@gmail.com> wro=
te:
>
> On Wed, Oct 30, 2024 at 4:01=E2=80=AFAM Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
> >
> > Hi Johannes,
> >
> > On 25.10.24 10:05 AM, mailinglist1@johanneskirchmair.de wrote:
> > > [Sie erhalten nicht h=C3=A4ufig E-Mails von mailinglist1@johanneskirc=
hmair.de. Weitere Informationen, warum dies wichtig ist, finden Sie unter h=
ttps://aka.ms/LearnAboutSenderIdentification ]
> > >
> > > Hey,
> > > We had some problems with the hdmi on the imx8mp and wanted to leave,=
 what we found out about it, somewhere for others to find it.
> > >
> > > The problem was that our hdmi display sometimes stayed blank after ho=
t plugging and sometimes at startup. On older kernel versions 6.6 we did no=
t have the problem with the not mainlined hdmi patches.
> > > We tracked the commit down that introduced the problem for us. It was=
 the following =E2=80=9Cdriver core: Enable fw_devlink=3Drpm by default=E2=
=80=9D  https://lore.kernel.org/lkml/20231113220948.80089-1-saravanak@googl=
e.com/
> > > So we switched back to FW_DEVLINK_FLAGS_ON via kernel parameter. Don=
=E2=80=99t really understand what the problem with RPM is.
> > >
> > > So, this information is just for reference. Maybe someone has an idea=
 what is going on here. And how to fix the problem in a more proper way.
> >
> > Thanks for investigating and sharing your results!
> >
> > I'm seeing the same symptoms and previously found out that this is
> > related to LCDIF underrun errors. See [1] for more information.
> >
> > Adam has also started this thread: [2].
> >
> > Anyway, knowing that this is related to fw_devlink=3Drpm is really
> > helpful. I just tried with fw_devlink=3Don and wasn't able to see any
> > issues anymore. So this confirms your findings.
>
> I was off in the weeds thinking there was something wrong in timing
> and/or a race condition around the PLL or something.  This is good
> news.
> Please forgive my ignorance, what does fw_devlink do?  Is there
> something we can do in the driver itself to force its behavior?

fw_devlink figures out supplier/consumer dependencies between devices
and creates device links between them. This ensures proper
probe/suspend/resume/shutdown/runtime PM ordering.

fw_devlink=3Drpm vs on means "enforce all of these" vs "enforce all of
these except runtime PM".

> adam
> >
> > I hope that some of the driver framework and runtime PM experts can hel=
p
> > to find out what is actually wrong and how the correct fix might look l=
ike.
> >
> > I'm also CC-ing Saravana who authored the change from fw_devlink=3Don t=
o
> > fw_devlink=3Drpm to see if they have anything to add.

When fw_devlink=3Drpm, you'll have device links created between
consumers and suppliers with the DL_FLAG_PM_RUNTIME flag set. So
before your device is runtime resumed, it'll make sure all your
suppliers are resumed first.

My guess is that there is some issue in the runtime PM handling in
these drivers. I don't have enough context to provide further insight.

-Saravana

> >
> > Thanks
> > Frieder
> >
> > [1]
> > https://patchwork.kernel.org/project/linux-phy/cover/20240904233100.114=
611-1-aford173@gmail.com/#26014057
> > [2]
> > https://lore.kernel.org/imx/8cfd3052-c85a-4235-b9b8-6d2929e9e455@kontro=
n.de/T/

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD214B6E26
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 14:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7237610E54A;
	Tue, 15 Feb 2022 13:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C660F10E544;
 Tue, 15 Feb 2022 13:55:40 +0000 (UTC)
Date: Tue, 15 Feb 2022 13:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1644933337;
 bh=6lNlCoTfcpMqvqhkT68B9BYySvB6qEPhyvPf8Q7RTQA=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=FV5jLIpDbsQD4XNbDQkQA59s8nRJV6faVAqWXc971NcsmVKHkV3WFz9CryCy95bLx
 5fsjgglR+qDN2pAG4VVMHRwiAW7wXc36jCrXRS53wKMt7fzTzs55bc4vbCunEn3BAO
 Tmv6nP77HGsnX02nIOQ8IrjXl+VSweaREZ7QvAy0WPIyaIHZJiF+wUQhGw9MSGBfLo
 qgnWv3NMfCuRNuSAJUdB1Fg6FknYIt7YMJoCxO4gh+GCkoF+MPbXltblCW/FsJeHuv
 NvAiabP6tolfvRebFUuddQF+PsgMjroMmSaHLkMYJmetJAyvBb3HrcDh0oks/v4+3M
 J1BM1xgrLuF9A==
To: Emil Velikov <emil.l.velikov@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [Intel-gfx] [PATCH v8 1/3] gpu: drm: separate panel orientation
 property creating and value setting
Message-ID: <KW6DNh6IRRgVJx9DfOFBnEqc4a0x-AnDXEbMxwpfEbk8dOn_KGVzAfo-slJWq-4nWW728Uc-OVpFh2w4fDE4-bxfkDuz1hFILRVvbcuXqaw=@emersion.fr>
In-Reply-To: <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE
 shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Alex Deucher <alexander.deucher@amd.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, February 15th, 2022 at 13:04, Emil Velikov <emil.l.velikov@gmai=
l.com> wrote:

> Greetings everyone,
>
> Padron for joining in so late o/
>
> On Tue, 8 Feb 2022 at 08:42, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > drm_dev_register() sets connector->registration_state to
> > DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> > drm_connector_set_panel_orientation() is first called after
> > drm_dev_register(), it will fail several checks and results in followin=
g
> > warning.
> >
> > Add a function to create panel orientation property and set default val=
ue
> > to UNKNOWN, so drivers can call this function to init the property earl=
ier
> > , and let the panel set the real value later.
> >
>
> The warning illustrates a genuine race condition, where userspace will
> read the old/invalid property value/state. So this patch masks away
> the WARNING without addressing the actual issue.
> Instead can we fix the respective drivers, so that no properties are
> created after drm_dev_register()?
>
> Longer version:
> As we look into drm_dev_register() it's in charge of creating the
> dev/sysfs nodes (et al). Note that connectors cannot disappear at
> runtime.
> For panel orientation, we are creating an immutable connector
> properly, meaning that as soon as drm_dev_register() is called we must
> ensure that the property is available (if applicable) and set to the
> correct value.

Unfortunately we can't quite do this. To apply the panel orientation quirks=
 we
need to grab the EDID of the eDP connector, and this happened too late in m=
y
testing.

What we can do is create the prop early during module load, and update it w=
hen
we read the EDID (at the place where we create it right now). User-space wi=
ll
receive a hotplug event after the EDID is read, so will be able to pick up =
the
new value if any.

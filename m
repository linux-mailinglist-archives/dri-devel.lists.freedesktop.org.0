Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E635941BCB6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 04:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBF06E15C;
	Wed, 29 Sep 2021 02:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AC66E15C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 02:27:59 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i4so4368947lfv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 19:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fJjBCR4+9bCZVm0Fu8Xcmw+g/rqGltdjILLNILMG/mA=;
 b=gZItg880S7ngvt1ScsVFZbT92Pz35STUpkg7MtmBPG38S8oE0RNWXVxg5AsCJmsiso
 gjU9EtdpeqLxN8TOF5kWZEb6v6ULSNqjKWay2YeRQCSYzJo2aiENwykZpJGyAuHjhXlY
 nukor5W0hJzjkNO93yWm4lxshhwfHKxlrCThA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fJjBCR4+9bCZVm0Fu8Xcmw+g/rqGltdjILLNILMG/mA=;
 b=NWzvRTIb71dmp7PHlFJ4PM/VBUP2uo9uBo0OkepeqaySpBgNRSV7XNchAYg65IvNNd
 9gaHq3dzddtzk+HVnlsuBBNInLZyi8VCwOXVLrE9+sik/Hu6N+nOvMfcuxuJ0N4bareV
 BuMPGPXTQhK3OtQkZJdQoRA+r4GkzKYms36LTtJ7seXXxeT7/f0r6xeAthRwBHyULwUh
 sBXtY4Ol6WvzpN21n+mhmfgky/1glxaDqv38DGyzByaOJqSFkuVi/9qRC/O4NX1z3K4y
 5KAz2jkxTEdVkpb3gtyeFLFXFe76akTDTH72oWULcg/y0y7n4m2WS+msgUJb7O95hcx2
 UdNw==
X-Gm-Message-State: AOAM532luwoqSrCGjbwbOnDjbokKu16Syjl0MjVj+0hqwHPZZyoDU+9m
 hurWk+aSzqcA04ahsWnzsZ3EvipWjAn3h/6hWoH9HQ==
X-Google-Smtp-Source: ABdhPJxtLJKFI2ooM24bJMRumtCIgTrU9ia9VK2xsan8DKGDUzhXg/ByJkFUAByLAPwnyRDMK4Wt9rw5VOO0jFuGCL8=
X-Received: by 2002:ac2:495b:: with SMTP id o27mr8638251lfi.501.1632882477417; 
 Tue, 28 Sep 2021 19:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210928213552.1001939-1-briannorris@chromium.org>
 <20210928143413.v3.1.Ic2904d37f30013a7f3d8476203ad3733c186827e@changeid>
In-Reply-To: <20210928143413.v3.1.Ic2904d37f30013a7f3d8476203ad3733c186827e@changeid>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Sep 2021 10:27:46 +0800
Message-ID: <CAGXv+5FO2GrH9BQ=ohH-oE_A6rKAoEfpbAB_1Qsq9v0vGJ+7ww@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/rockchip: dsi: Hold pm-runtime across
 bind/unbind
To: Brian Norris <briannorris@chromium.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Sandy Huang <hjc@rock-chips.com>, 
 Thomas Hebb <tommyhebb@gmail.com>, aleksandr.o.makarov@gmail.com,
 stable@vger.kernel.org, 
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
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

On Wed, Sep 29, 2021 at 5:36 AM Brian Norris <briannorris@chromium.org> wro=
te:
>
> In commit 43c2de1002d2, we moved most HW configuration to bind(), but we
> didn't move the runtime PM management. Therefore, depending on initial
> boot state, runtime-PM workqueue delays, and other timing factors, we
> may disable our power domain in between the hardware configuration
> (bind()) and when we enable the display. This can cause us to lose
> hardware state and fail to configure our display. For example:
>
>   dw-mipi-dsi-rockchip ff968000.mipi: failed to write command FIFO
>   panel-innolux-p079zca ff960000.mipi.0: failed to write command 0
>
> or:
>
>   dw-mipi-dsi-rockchip ff968000.mipi: failed to write command FIFO
>   panel-kingdisplay-kd097d04 ff960000.mipi.0: failed write init cmds: -11=
0
>
> We should match the runtime PM to the lifetime of the bind()/unbind()
> cycle.
>
> Tested on Acer Chrometab 10 (RK3399 Gru-Scarlet), with panel drivers
> built either as modules or built-in.
>
> Side notes: it seems one is more likely to see this problem when the
> panel driver is built into the kernel. I've also seen this problem
> bisect down to commits that simply changed Kconfig dependencies, because
> it changed the order in which driver init functions were compiled into
> the kernel, and therefore the ordering and timing of built-in device
> probe.
>
> Fixes: 43c2de1002d2 ("drm/rockchip: dsi: move all lane config except LCDC=
 mux to bind()")
> Link: https://lore.kernel.org/linux-rockchip/9aedfb528600ecf871885f7293ca=
4207c84d16c1.camel@gmail.com/
> Reported-by: <aleksandr.o.makarov@gmail.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

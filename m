Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0742F3E28E7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 12:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977F76E0DD;
	Fri,  6 Aug 2021 10:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90D96E828
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 10:37:19 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id x11so14359728ejj.8
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Aug 2021 03:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TVGZoE5gGRjdrzp11QJfyMJlwcXTvAtUoyy+JrT+IQA=;
 b=tQEG6YzPxZYaUfm8emfjyn1WQFufEBobsHOf2wIgqUNzArRiVwdyJkOY9t8gOk+3IR
 vT4VvKckYd0jrRQzATYiCfUCoy0TfUxwzzwpq1OiS3Q2AVq4m4gWgAuxZTIlEjnWwt59
 pru94xbHnAJzrcoxhCAjzHTTkUatiOXaVXRPaBj3jlvDw59GHBlSTGPMwoAw9FgvgDPE
 ImlV2e+CmYICx4ZkMx2AEiu4CTp7EN4OJRYRS8xKzf8vFaCKrEczCWyGFdtMOUcU2Y8p
 xKBVtmt6XWAeTvFKPxe/ZbI+NAH/K7fa1hKIbwr16XrJzECI4N3fCdDLiTLk5l4e8CEQ
 aVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TVGZoE5gGRjdrzp11QJfyMJlwcXTvAtUoyy+JrT+IQA=;
 b=fUlOp7Zh73xYzawY4HotHmqJqbQLH6bCWnUOYJRlANlrzK7JzkI9jrKuJBjWwJqE3y
 YmiBOOgIMTYC7vpCzL8xct/13o1yMmeEdyu2jEPQLui0UMbatVqJ7tjNQL7YERCr5bKE
 v0880kuoz70ot0lltuJb3stnjfzAEyVVEd/vRHA10NlwNq9ythDqQyr0wTJKF3ueQ71q
 D3Q7MakWLow8TZGHDbAUC/7xcWZ5/dlOFv5LzUVklDV3ID329Fre1eDnvVAhWzU37XG5
 8aPbmzTeXhzO3dXlJQVV4NAJLOLhK8xBzErGknpO00IT9NY3JRPDTCdDqh2LczJJAeFE
 6sTQ==
X-Gm-Message-State: AOAM531YjRMP1jB1J+BagjqmJYxlpnwZslhr8VFKLq/F6nJVXfCTpCMr
 c+NPEenBlxH+dft6gMwPJLxd94BVS5zYjkPU3jYhEg==
X-Google-Smtp-Source: ABdhPJxTJcwPze+uSxEQwjciI5+zYaAJQYWtC+KmZeML3RJiEQnV0SiGzTiN96DDfWVpuQf7vTNj/fNHDmuyFMk/5Lc=
X-Received: by 2002:a17:907:1b06:: with SMTP id
 mp6mr9404647ejc.188.1628246238490; 
 Fri, 06 Aug 2021 03:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210323025501.1568039-1-quanyang.wang@windriver.com>
 <YFquZaW4JTTM7ogS@pendragon.ideasonboard.com>
In-Reply-To: <YFquZaW4JTTM7ogS@pendragon.ideasonboard.com>
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 6 Aug 2021 12:37:07 +0200
Message-ID: <CAHTX3d+uZsqevn0+7Lo+z62mk-1+S7n7VuO-QU8Q1Y-gP0Ugyw@mail.gmail.com>
Subject: Re: [V2][PATCH] drm: xlnx: zynqmp: release reset to DP controller
 before accessing DP registers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Quanyang Wang <quanyang.wang@windriver.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 06 Aug 2021 10:49:40 +0000
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

Hi,

st 24. 3. 2021 v 4:15 odes=C3=ADlatel Laurent Pinchart
<laurent.pinchart@ideasonboard.com> napsal:
>
> Hi Quanyang,
>
> Thank you for the patch.
>
> On Tue, Mar 23, 2021 at 10:55:01AM +0800, quanyang.wang@windriver.com wro=
te:
> > From: Quanyang Wang <quanyang.wang@windriver.com>
> >
> > When insmod zynqmp-dpsub.ko after rmmod it, system will hang with the
> > error log as below:
> >
> > root@xilinx-zynqmp:~# insmod zynqmp-dpsub.ko
> > [   88.391289] [drm] Initialized zynqmp-dpsub 1.0.0 20130509 for fd4a00=
00.display on minor 0
> > [   88.529906] Console: switching to colour frame buffer device 128x48
> > [   88.549402] zynqmp-dpsub fd4a0000.display: [drm] fb0: zynqmp-dpsubdr=
m frame buffer device
> > [   88.571624] zynqmp-dpsub fd4a0000.display: ZynqMP DisplayPort Subsys=
tem driver probed
> > root@xilinx-zynqmp:~# rmmod zynqmp_dpsub
> > [   94.023404] Console: switching to colour dummy device 80x25
> > root@xilinx-zynqmp:~# insmod zynqmp-dpsub.ko
> >       <hang here>
> >
> > This is because that in zynqmp_dp_probe it tries to access some DP
> > registers while the DP controller is still in the reset state. When
> > running "rmmod zynqmp_dpsub", zynqmp_dp_reset(dp, true) in
> > zynqmp_dp_phy_exit is called to force the DP controller into the reset
> > state. Then insmod will call zynqmp_dp_probe to program the DP register=
s,
> > but at this moment the DP controller hasn't been brought out of the res=
et
> > state yet since the function zynqmp_dp_reset(dp, false) is called later=
 and
> > this will result the system hang.
> >
> > Releasing the reset to DP controller before any read/write operation to=
 it
> > will fix this issue. And for symmetry, move zynqmp_dp_reset() call from
> > zynqmp_dp_phy_exit() to zynqmp_dp_remove().
> >
> > Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Can someone pick this patch?

Thanks,
Michal

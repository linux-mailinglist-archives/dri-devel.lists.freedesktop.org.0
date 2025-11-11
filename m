Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79933C4D94F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 13:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BB689C83;
	Tue, 11 Nov 2025 12:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fyjIzro3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8A389C83
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 12:07:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 863A0FE;
 Tue, 11 Nov 2025 13:05:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1762862713;
 bh=O8CvrRoMfamiivBrhxyLoF+42dG2wZYImhw8qkUTm7Y=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=fyjIzro3aBiXkBcHDQQx8QsTQC8m9VXT5JaBenEIju1kycZ+PDjvx3biBqD5F6r2J
 xYvqYyWVOoe/PrLUAS48CJgw1AHSUWEZ/bentPCNtclZcEn/HPr8MRgpty6xFjzc2l
 kuNmuj1EWPGO0HZLV3o/Z9sdsXJV5Gxa2tGt1Ql8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250910-rcar-vsp-underrun-revert-v1-1-2fa8d3b1b879@ideasonboard.com>
References: <20250910-rcar-vsp-underrun-revert-v1-1-2fa8d3b1b879@ideasonboard.com>
Subject: Re: [PATCH] Revert "media: vsp1: Add underrun debug print"
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Duy Nguyen <duy.nguyen.rh@renesas.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 11 Nov 2025 12:07:09 +0000
Message-ID: <176286282930.2141792.17722042639840544380@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
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

Quoting Tomi Valkeinen (2025-09-10 08:26:43)
> This reverts commit 1dc30075fb0fe02b74b1ea7fd1c1c734a89f1448.
>=20
> There have been reports of lots of underruns happening on earlier
> generation SoCs (M3, E3) with display use cases, e.g.:
>=20
> vsp1 fea28000.vsp: Underrun occurred at WPF0 (total underruns 1)
>=20
> but the display still working fine, and reverting the above commit,
> which added underrun prints, makes the prints go away (obviously).
>=20
> I made some tests on a remote M3, with no display connected, and I can
> confirm that there seem to be a single underrun report quite often when
> enabling a display, and an underrun flood when using interlace display
> modes.
>=20
> E3 does not have interlace display support as far as I can see, so the
> interlace issue does not concern it.
>=20
> Debugging display issues remotely without a display is quite
> challenging, and I did not find any issues in the code, nor could I find
> a way to stop the underruns by twiddling with the related registers.
>=20
> My pure guess is that the single underruns occurring when starting the
> display hint at either a startup sequence issue, or some kind of initial
> fifo loading issue. The interlace underruns hint at a bigger
> misconfiguration, but as the display works fine, the issue might be just
> an underrun at the start of the frame and the HW quickly catching up, or
> at the end of the frame, where one block in the pipeline expects more
> data but the previous block has already stopped (so maybe a misconfig
> between using interlaced height vs progressive height?).
>=20
> But at the moment I have no solution to this, and as the displays work
> fine, I think it makes sense to just revert the print.

Is there any value in instead 'ignoring' any underruns if say the frame
count is < 5 to ignore startup underruns, and keep it as an active print
if something causes underruns later once the pipeline is established?

But maybe that doesn't change much - and if there's no current perceived
issue


Anyway, I don't object to this revert. It's low impact and it's only
undoing 'your' work so no one else will complain :D

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drm.c  |  3 ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c  | 11 +----------
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.h |  2 --
>  drivers/media/platform/renesas/vsp1/vsp1_regs.h |  2 --
>  4 files changed, 1 insertion(+), 17 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/med=
ia/platform/renesas/vsp1/vsp1_drm.c
> index 15d266439564..b8f211db16fc 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -721,9 +721,6 @@ int vsp1_du_setup_lif(struct device *dev, unsigned in=
t pipe_index,
>                 return 0;
>         }
> =20
> -       /* Reset the underrun counter */
> -       pipe->underrun_count =3D 0;
> -
>         drm_pipe->width =3D cfg->width;
>         drm_pipe->height =3D cfg->height;
>         pipe->interlaced =3D cfg->interlaced;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/med=
ia/platform/renesas/vsp1/vsp1_drv.c
> index b8d06e88c475..68e92d3c5915 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -47,8 +47,7 @@
> =20
>  static irqreturn_t vsp1_irq_handler(int irq, void *data)
>  {
> -       u32 mask =3D VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE |
> -                  VI6_WPF_IRQ_STA_UND;
> +       u32 mask =3D VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE;
>         struct vsp1_device *vsp1 =3D data;
>         irqreturn_t ret =3D IRQ_NONE;
>         unsigned int i;
> @@ -63,14 +62,6 @@ static irqreturn_t vsp1_irq_handler(int irq, void *dat=
a)
>                 status =3D vsp1_read(vsp1, VI6_WPF_IRQ_STA(i));
>                 vsp1_write(vsp1, VI6_WPF_IRQ_STA(i), ~status & mask);
> =20
> -               if ((status & VI6_WPF_IRQ_STA_UND) && wpf->entity.pipe) {
> -                       wpf->entity.pipe->underrun_count++;
> -
> -                       dev_warn_ratelimited(vsp1->dev,
> -                               "Underrun occurred at WPF%u (total underr=
uns %u)\n",
> -                               i, wpf->entity.pipe->underrun_count);
> -               }
> -
>                 if (status & VI6_WPF_IRQ_STA_DFE) {
>                         vsp1_pipeline_frame_end(wpf->entity.pipe);
>                         ret =3D IRQ_HANDLED;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/me=
dia/platform/renesas/vsp1/vsp1_pipe.h
> index 7f623b8cbe5c..9cc2f1646b00 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> @@ -137,8 +137,6 @@ struct vsp1_pipeline {
> =20
>         unsigned int partitions;
>         struct vsp1_partition *part_table;
> -
> -       u32 underrun_count;
>  };
> =20
>  void vsp1_pipeline_reset(struct vsp1_pipeline *pipe);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/me=
dia/platform/renesas/vsp1/vsp1_regs.h
> index 10cfbcd1b6e0..188d26289714 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> @@ -32,12 +32,10 @@
>  #define VI6_STATUS_SYS_ACT(n)          BIT((n) + 8)
> =20
>  #define VI6_WPF_IRQ_ENB(n)             (0x0048 + (n) * 12)
> -#define VI6_WPF_IRQ_ENB_UNDE           BIT(16)
>  #define VI6_WPF_IRQ_ENB_DFEE           BIT(1)
>  #define VI6_WPF_IRQ_ENB_FREE           BIT(0)
> =20
>  #define VI6_WPF_IRQ_STA(n)             (0x004c + (n) * 12)
> -#define VI6_WPF_IRQ_STA_UND            BIT(16)
>  #define VI6_WPF_IRQ_STA_DFE            BIT(1)
>  #define VI6_WPF_IRQ_STA_FRE            BIT(0)
> =20
>=20
> ---
> base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
> change-id: 20250908-rcar-vsp-underrun-revert-f3e64612c62d
>=20
> Best regards,
> --=20
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>

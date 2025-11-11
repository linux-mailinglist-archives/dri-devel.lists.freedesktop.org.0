Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CBCC4F3A6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 18:21:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8290210E344;
	Tue, 11 Nov 2025 17:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dGzxIXGt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC94710E344
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 17:21:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (82-203-161-95.bb.dnainternet.fi
 [82.203.161.95])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 204461D29;
 Tue, 11 Nov 2025 18:19:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1762881571;
 bh=O8mHQn3liP2UUlM+m+8C3tF9osLYbychnmMSAfVoFLk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dGzxIXGtlQ5L+Iapz2cmB+eUbSgZNY7dVy0UcLiiGUG0eP7hLLH5gUYeh9o+lwAKU
 PWYr+Xg9mdInlXCnKvMk9bfBuzWtZGvyj0KpOUJilAMPOdwReU1BngnydP+FN05gbq
 MrbJgZEI03PSVgnUe/cmZKyLWcIN13Mq6iCRmUzg=
Date: Tue, 11 Nov 2025 19:21:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Duy Nguyen <duy.nguyen.rh@renesas.com>
Subject: Re: [PATCH] Revert "media: vsp1: Add underrun debug print"
Message-ID: <20251111172124.GH4270@pendragon.ideasonboard.com>
References: <20250910-rcar-vsp-underrun-revert-v1-1-2fa8d3b1b879@ideasonboard.com>
 <176286282930.2141792.17722042639840544380@ping.linuxembedded.co.uk>
 <c5ab80df-0d60-4984-ad21-7dd1182b990f@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c5ab80df-0d60-4984-ad21-7dd1182b990f@ideasonboard.com>
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

On Tue, Nov 11, 2025 at 02:23:05PM +0200, Tomi Valkeinen wrote:
> On 11/11/2025 14:07, Kieran Bingham wrote:
> > Quoting Tomi Valkeinen (2025-09-10 08:26:43)
> >> This reverts commit 1dc30075fb0fe02b74b1ea7fd1c1c734a89f1448.
> >>
> >> There have been reports of lots of underruns happening on earlier
> >> generation SoCs (M3, E3) with display use cases, e.g.:
> >>
> >> vsp1 fea28000.vsp: Underrun occurred at WPF0 (total underruns 1)
> >>
> >> but the display still working fine, and reverting the above commit,
> >> which added underrun prints, makes the prints go away (obviously).
> >>
> >> I made some tests on a remote M3, with no display connected, and I can
> >> confirm that there seem to be a single underrun report quite often when
> >> enabling a display, and an underrun flood when using interlace display
> >> modes.
> >>
> >> E3 does not have interlace display support as far as I can see, so the
> >> interlace issue does not concern it.
> >>
> >> Debugging display issues remotely without a display is quite
> >> challenging, and I did not find any issues in the code, nor could I find
> >> a way to stop the underruns by twiddling with the related registers.
> >>
> >> My pure guess is that the single underruns occurring when starting the
> >> display hint at either a startup sequence issue, or some kind of initial
> >> fifo loading issue. The interlace underruns hint at a bigger
> >> misconfiguration, but as the display works fine, the issue might be just
> >> an underrun at the start of the frame and the HW quickly catching up, or
> >> at the end of the frame, where one block in the pipeline expects more
> >> data but the previous block has already stopped (so maybe a misconfig
> >> between using interlaced height vs progressive height?).
> >>
> >> But at the moment I have no solution to this, and as the displays work
> >> fine, I think it makes sense to just revert the print.
> > 
> > Is there any value in instead 'ignoring' any underruns if say the frame
> > count is < 5 to ignore startup underruns, and keep it as an active print
> > if something causes underruns later once the pipeline is established?
> > 
> > But maybe that doesn't change much - and if there's no current perceived
> > issue
> 
> A single underrun at enable time could/should probably be ignored, as it
> might be just issue with the initial fifo filling or such (even then
> it's a bit annoying, but I've seen some HW docs (not on this platform)
> telling to ignore such underruns).
> 
> But that wouldn't help with the underrun flood for interlace. I think
> there's a clear issue for ilace here, but I have no idea where exactly.
> And, the display works fine, so the display controller can recover
> instantly.
> 
> > Anyway, I don't object to this revert. It's low impact and it's only
> > undoing 'your' work so no one else will complain :D
> 
> Yep... I hate disabling error reporting, but I think it's the best
> option here, at least until someone with the board can debug it
> properly. In any case, if there are "real" underruns, the error is also
> visible on the display, you don't need the console print to show it.

Quoting https://lore.kernel.org/all/1651584010-10156-1-git-send-email-erosca@de.adit-jv.com/

"A barely noticeable (especially if hardly reproducible) display flicker
may not be the biggest concern in the development environment. However,
an automotive OEM will not only notice it, but will also be haunted by
its phenomenon/nature till it is understood in the greatest detail and
ultimately eradicated, to avoid impairing user experience.

Troubleshooting the above without the right tools becomes a nightmare."

I think we need to get to the bottom of this and fix the root cause,
unless we receive an explicit acknowledgement from Renesas that underrun
detection is not desired.

> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>  drivers/media/platform/renesas/vsp1/vsp1_drm.c  |  3 ---
> >>  drivers/media/platform/renesas/vsp1/vsp1_drv.c  | 11 +----------
> >>  drivers/media/platform/renesas/vsp1/vsp1_pipe.h |  2 --
> >>  drivers/media/platform/renesas/vsp1/vsp1_regs.h |  2 --
> >>  4 files changed, 1 insertion(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> >> index 15d266439564..b8f211db16fc 100644
> >> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> >> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> >> @@ -721,9 +721,6 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
> >>                 return 0;
> >>         }
> >>  
> >> -       /* Reset the underrun counter */
> >> -       pipe->underrun_count = 0;
> >> -
> >>         drm_pipe->width = cfg->width;
> >>         drm_pipe->height = cfg->height;
> >>         pipe->interlaced = cfg->interlaced;
> >> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> >> index b8d06e88c475..68e92d3c5915 100644
> >> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> >> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> >> @@ -47,8 +47,7 @@
> >>  
> >>  static irqreturn_t vsp1_irq_handler(int irq, void *data)
> >>  {
> >> -       u32 mask = VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE |
> >> -                  VI6_WPF_IRQ_STA_UND;
> >> +       u32 mask = VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE;
> >>         struct vsp1_device *vsp1 = data;
> >>         irqreturn_t ret = IRQ_NONE;
> >>         unsigned int i;
> >> @@ -63,14 +62,6 @@ static irqreturn_t vsp1_irq_handler(int irq, void *data)
> >>                 status = vsp1_read(vsp1, VI6_WPF_IRQ_STA(i));
> >>                 vsp1_write(vsp1, VI6_WPF_IRQ_STA(i), ~status & mask);
> >>  
> >> -               if ((status & VI6_WPF_IRQ_STA_UND) && wpf->entity.pipe) {
> >> -                       wpf->entity.pipe->underrun_count++;
> >> -
> >> -                       dev_warn_ratelimited(vsp1->dev,
> >> -                               "Underrun occurred at WPF%u (total underruns %u)\n",
> >> -                               i, wpf->entity.pipe->underrun_count);
> >> -               }
> >> -
> >>                 if (status & VI6_WPF_IRQ_STA_DFE) {
> >>                         vsp1_pipeline_frame_end(wpf->entity.pipe);
> >>                         ret = IRQ_HANDLED;
> >> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> >> index 7f623b8cbe5c..9cc2f1646b00 100644
> >> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> >> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> >> @@ -137,8 +137,6 @@ struct vsp1_pipeline {
> >>  
> >>         unsigned int partitions;
> >>         struct vsp1_partition *part_table;
> >> -
> >> -       u32 underrun_count;
> >>  };
> >>  
> >>  void vsp1_pipeline_reset(struct vsp1_pipeline *pipe);
> >> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> >> index 10cfbcd1b6e0..188d26289714 100644
> >> --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> >> +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> >> @@ -32,12 +32,10 @@
> >>  #define VI6_STATUS_SYS_ACT(n)          BIT((n) + 8)
> >>  
> >>  #define VI6_WPF_IRQ_ENB(n)             (0x0048 + (n) * 12)
> >> -#define VI6_WPF_IRQ_ENB_UNDE           BIT(16)
> >>  #define VI6_WPF_IRQ_ENB_DFEE           BIT(1)
> >>  #define VI6_WPF_IRQ_ENB_FREE           BIT(0)
> >>  
> >>  #define VI6_WPF_IRQ_STA(n)             (0x004c + (n) * 12)
> >> -#define VI6_WPF_IRQ_STA_UND            BIT(16)
> >>  #define VI6_WPF_IRQ_STA_DFE            BIT(1)
> >>  #define VI6_WPF_IRQ_STA_FRE            BIT(0)
> >>  
> >>
> >> ---
> >> base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
> >> change-id: 20250908-rcar-vsp-underrun-revert-f3e64612c62d

-- 
Regards,

Laurent Pinchart

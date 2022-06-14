Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43F254B70A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 18:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B51F10E958;
	Tue, 14 Jun 2022 16:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA33A10E958
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 16:59:32 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id m20so18341127ejj.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 09:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GLHWj748874QLOEq9D3A2DOln1p7mfw6PQqmvrjagzw=;
 b=IwBKv7Uq37K9eJpQFDTZWDhIcNLRxt59EBDxh1wlRCblzMk/2OT7zsQf/CGM764ORI
 jmSQHIgqsPFcvLyOYxr8O52V7ZNvQL2BhuskfLiYcy2drzB01G/lfxk9o7ImM3HwvEcq
 wI4s1eHn9N6Zp5IwGAr84lM0Jet4EpIkaCCBnR75Awz955VKxbqX7SQh0Z50XanyIVIi
 H4EeQ5RCFcVTd+qEyRny2+XQ868eYK6zy8ZbV5VG36hKtXNlhsox/2u/zP66T6KMkEZ4
 FF0Vrz4WsW9zWWM1UxlpOxWuotMfRcqJqc0zQPC/rxIE820mlDEcUzd7BxtKBflObcLQ
 YD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GLHWj748874QLOEq9D3A2DOln1p7mfw6PQqmvrjagzw=;
 b=pxdeVlwV3VolH8Ghm+GV86A2HpVJ/yY9uVZl3K0ur2AJMVpQezWkDfbWsVJ0T4ZuYj
 MuUFrIILpEi5rMTPpWdpoThonsHL/aNJm/vh3HqssGaOkSlKCzTvxuOb4i24wl+QzPeP
 4A8YVw3IPffhwU0G856RLJ85F22H92kvn/d8X4IL4/A945WL+nfY1fyRrhisACjFjAnN
 4mlg1KT2WyUJ3P+74BZusyTsAlJxHV3fnO0nXpETxZEvriWgjreYWmVHtZL9ovoPP6LL
 bQPGMHf2p5jxPDWCVNHu033iKtDya6EiTeHtJFNT5J1DX90Oq6uB/tQKtGMFCDUvt0qw
 xHig==
X-Gm-Message-State: AOAM5310LHMyGh+MlDlmE5PHXtNP1jP1Esm7aF2/IsaECQTrrJuphe2J
 P2DiW1WTz6VvAzJ6dMp23X1DP2SUhEMmNljd6djWqNNp9Cn2Qt26
X-Google-Smtp-Source: ABdhPJyCspAogzr1kzXbbBgK8Fy9sRQPgul36WkEgyyNbFzaiEuTlDVr+d8rFoq7oyQlAJTYxG/u7oUYSzJTIO/hmNo=
X-Received: by 2002:a17:907:8a13:b0:707:194c:30df with SMTP id
 sc19-20020a1709078a1300b00707194c30dfmr5243543ejc.154.1655225971353; Tue, 14
 Jun 2022 09:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-14-maxime@cerno.tech>
 <CAPY8ntDY3pCbc=zrC7Nx6fVv5CFmxXKPHdSNWGYNJo2dn32XUA@mail.gmail.com>
In-Reply-To: <CAPY8ntDY3pCbc=zrC7Nx6fVv5CFmxXKPHdSNWGYNJo2dn32XUA@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 17:59:15 +0100
Message-ID: <CAPY8ntCLLSr5SHxwzcsQ=sN2KNE-=nqX7jBFZAR87eextDaXNg@mail.gmail.com>
Subject: Re: [PATCH 13/64] drm/vc4: hvs: Protect device resources after removal
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Jun 2022 at 16:11, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Maxime
>
> On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Whenever the device and driver are unbound, the main device and all the
> > subdevices will be removed by calling their unbind() method.
> >
> > However, the DRM device itself will only be freed when the last user will
> > have closed it.
> >
> > It means that there is a time window where the device and its resources
> > aren't there anymore, but the userspace can still call into our driver.
> >
> > Fortunately, the DRM framework provides the drm_dev_enter() and
> > drm_dev_exit() functions to make sure our underlying device is still there
> > for the section protected by those calls. Let's add them to the HVS driver.
>
> The framework appears to rely on the remove function calling
> drm_dev_unplug instead of drm_dev_unregister, but I haven't seen a
> patch that makes that change in the vc4 driver.
> Have I missed it, or is there some other route to set the unplugged
> flag that drm_dev_enter/exit are relying on?
>
>   Dave
>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_drv.h |   1 +
> >  drivers/gpu/drm/vc4/vc4_hvs.c | 106 +++++++++++++++++++++++++++++++---
> >  2 files changed, 99 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> > index aa4c5910ea05..080deae55f64 100644
> > --- a/drivers/gpu/drm/vc4/vc4_drv.h
> > +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> > @@ -317,6 +317,7 @@ struct vc4_v3d {
> >  };
> >
> >  struct vc4_hvs {
> > +       struct drm_device *dev;
> >         struct platform_device *pdev;
> >         void __iomem *regs;
> >         u32 __iomem *dlist;
> > diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> > index 2a58fc421cf6..483053e7b14f 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> > @@ -25,6 +25,7 @@
> >  #include <linux/platform_device.h>
> >
> >  #include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_drv.h>
> >  #include <drm/drm_vblank.h>
> >
> >  #include "vc4_drv.h"
> > @@ -66,11 +67,15 @@ static const struct debugfs_reg32 hvs_regs[] = {
> >
> >  void vc4_hvs_dump_state(struct vc4_hvs *hvs)
> >  {
> > +       struct drm_device *drm = hvs->dev;
> >         struct drm_printer p = drm_info_printer(&hvs->pdev->dev);
> > -       int i;
> > +       int idx, i;
> >
> >         drm_print_regset32(&p, &hvs->regset);
> >
> > +       if (!drm_dev_enter(drm, &idx))
> > +               return;
> > +
> >         DRM_INFO("HVS ctx:\n");
> >         for (i = 0; i < 64; i += 4) {
> >                 DRM_INFO("0x%08x (%s): 0x%08x 0x%08x 0x%08x 0x%08x\n",
> > @@ -80,6 +85,8 @@ void vc4_hvs_dump_state(struct vc4_hvs *hvs)
> >                          readl((u32 __iomem *)hvs->dlist + i + 2),
> >                          readl((u32 __iomem *)hvs->dlist + i + 3));
> >         }
> > +
> > +       drm_dev_exit(idx);
> >  }
> >
> >  static int vc4_hvs_debugfs_underrun(struct seq_file *m, void *data)
> > @@ -132,14 +139,18 @@ static int vc4_hvs_upload_linear_kernel(struct vc4_hvs *hvs,
> >                                         struct drm_mm_node *space,
> >                                         const u32 *kernel)
> >  {
> > -       int ret, i;
> > +       struct drm_device *drm = hvs->dev;
> > +       int idx, ret, i;
> >         u32 __iomem *dst_kernel;
> >
> > +       if (!drm_dev_enter(drm, &idx))
> > +               return -ENODEV;
> > +

vc4_hvs_upload_linear_kernel is only called from vc4_hvs_bind, so
unless bind and unbind calls can be concurrent, then there's no need
for protection here.

> >         ret = drm_mm_insert_node(&hvs->dlist_mm, space, VC4_KERNEL_DWORDS);
> >         if (ret) {
> >                 DRM_ERROR("Failed to allocate space for filter kernel: %d\n",
> >                           ret);
> > -               return ret;
> > +               goto err_dev_exit;
> >         }
> >
> >         dst_kernel = hvs->dlist + space->start;
> > @@ -153,16 +164,26 @@ static int vc4_hvs_upload_linear_kernel(struct vc4_hvs *hvs,
> >                 }
> >         }
> >
> > +       drm_dev_exit(idx);
> >         return 0;
> > +
> > +err_dev_exit:
> > +       drm_dev_exit(idx);
> > +       return ret;
> >  }
> >
> >  static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
> >                              struct vc4_crtc *vc4_crtc)
> >  {
> > +       struct drm_device *drm = hvs->dev;
> >         struct drm_crtc *crtc = &vc4_crtc->base;
> >         struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
> > +       int idx;
> >         u32 i;
> >
> > +       if (!drm_dev_enter(drm, &idx))
> > +               return;
> > +
> >         /* The LUT memory is laid out with each HVS channel in order,
> >          * each of which takes 256 writes for R, 256 for G, then 256
> >          * for B.
> > @@ -177,6 +198,8 @@ static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
> >                 HVS_WRITE(SCALER_GAMDATA, vc4_crtc->lut_g[i]);
> >         for (i = 0; i < crtc->gamma_size; i++)
> >                 HVS_WRITE(SCALER_GAMDATA, vc4_crtc->lut_b[i]);
> > +
> > +       drm_dev_exit(idx);
> >  }
> >
> >  static void vc4_hvs_update_gamma_lut(struct vc4_hvs *hvs,
> > @@ -198,7 +221,12 @@ static void vc4_hvs_update_gamma_lut(struct vc4_hvs *hvs,
> >
> >  u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
> >  {
> > +       struct drm_device *drm = hvs->dev;
> >         u8 field = 0;
> > +       int idx;
> > +
> > +       if (!drm_dev_enter(drm, &idx))
> > +               return 0;
> >
> >         switch (fifo) {
> >         case 0:
> > @@ -215,6 +243,7 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
> >                 break;
> >         }
> >
> > +       drm_dev_exit(idx);
> >         return field;
> >  }
> >
> > @@ -226,6 +255,12 @@ int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output)
> >         if (!hvs->hvs5)
> >                 return output;
> >
> > +       /*
> > +        * NOTE: We should probably use drm_dev_enter()/drm_dev_exit()
> > +        * here, but this function is only used during the DRM device
> > +        * initialization, so we should be fine.
> > +        */
> > +
> >         switch (output) {
> >         case 0:
> >                 return 0;
> > @@ -273,12 +308,17 @@ int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output)
> >  static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
> >                                 struct drm_display_mode *mode, bool oneshot)
> >  {
> > +       struct drm_device *drm = hvs->dev;
> >         struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
> >         struct vc4_crtc_state *vc4_crtc_state = to_vc4_crtc_state(crtc->state);
> >         unsigned int chan = vc4_crtc_state->assigned_channel;
> >         bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
> >         u32 dispbkgndx;
> >         u32 dispctrl;
> > +       int idx;
> > +
> > +       if (!drm_dev_enter(drm, &idx))
> > +               return -ENODEV;
> >
> >         HVS_WRITE(SCALER_DISPCTRLX(chan), 0);
> >         HVS_WRITE(SCALER_DISPCTRLX(chan), SCALER_DISPCTRLX_RESET);
> > @@ -320,13 +360,21 @@ static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
> >          */
> >         vc4_hvs_lut_load(hvs, vc4_crtc);
> >
> > +       drm_dev_exit(idx);
> > +
> >         return 0;
> >  }
> >
> >  void vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
> >  {
> > +       struct drm_device *drm = hvs->dev;
> > +       int idx;
> > +
> > +       if (!drm_dev_enter(drm, &idx))
> > +               return;
> > +
> >         if (HVS_READ(SCALER_DISPCTRLX(chan)) & SCALER_DISPCTRLX_ENABLE)
> > -               return;
> > +               goto out;
> >
> >         HVS_WRITE(SCALER_DISPCTRLX(chan),
> >                   HVS_READ(SCALER_DISPCTRLX(chan)) | SCALER_DISPCTRLX_RESET);
> > @@ -343,6 +391,9 @@ void vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
> >         WARN_ON_ONCE((HVS_READ(SCALER_DISPSTATX(chan)) &
> >                       (SCALER_DISPSTATX_FULL | SCALER_DISPSTATX_EMPTY)) !=
> >                      SCALER_DISPSTATX_EMPTY);
> > +
> > +out:
> > +       drm_dev_exit(idx);
> >  }
> >
> >  int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
> > @@ -384,9 +435,15 @@ static void vc4_hvs_install_dlist(struct drm_crtc *crtc)
> >         struct vc4_dev *vc4 = to_vc4_dev(dev);
> >         struct vc4_hvs *hvs = vc4->hvs;
> >         struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
> > +       int idx;
> > +
> > +       if (!drm_dev_enter(dev, &idx))
> > +               return;
> >
> >         HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
> >                   vc4_state->mm.start);
> > +
> > +       drm_dev_exit(idx);
> >  }
> >
> >  static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
> > @@ -471,6 +528,10 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
> >         bool enable_bg_fill = false;
> >         u32 __iomem *dlist_start = vc4->hvs->dlist + vc4_state->mm.start;
> >         u32 __iomem *dlist_next = dlist_start;
> > +       int idx;
> > +
> > +       if (!drm_dev_enter(dev, &idx))
> > +               return;
> >
> >         if (debug_dump_regs) {
> >                 DRM_INFO("CRTC %d HVS before:\n", drm_crtc_index(crtc));
> > @@ -541,26 +602,44 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
> >                 DRM_INFO("CRTC %d HVS after:\n", drm_crtc_index(crtc));
> >                 vc4_hvs_dump_state(hvs);
> >         }
> > +
> > +       drm_dev_exit(idx);
> >  }
> >
> >  void vc4_hvs_mask_underrun(struct vc4_hvs *hvs, int channel)
> >  {
> > -       u32 dispctrl = HVS_READ(SCALER_DISPCTRL);
> > +       struct drm_device *drm = hvs->dev;
> > +       u32 dispctrl;
> > +       int idx;
> >
> > +       if (!drm_dev_enter(drm, &idx))
> > +               return;
> > +
> > +       dispctrl = HVS_READ(SCALER_DISPCTRL);
> >         dispctrl &= ~SCALER_DISPCTRL_DSPEISLUR(channel);
> >
> >         HVS_WRITE(SCALER_DISPCTRL, dispctrl);
> > +
> > +       drm_dev_exit(idx);
> >  }
> >
> >  void vc4_hvs_unmask_underrun(struct vc4_hvs *hvs, int channel)
> >  {
> > -       u32 dispctrl = HVS_READ(SCALER_DISPCTRL);
> > +       struct drm_device *drm = hvs->dev;
> > +       u32 dispctrl;
> > +       int idx;
> >
> > +       if (!drm_dev_enter(drm, &idx))
> > +               return;
> > +
> > +       dispctrl = HVS_READ(SCALER_DISPCTRL);
> >         dispctrl |= SCALER_DISPCTRL_DSPEISLUR(channel);
> >
> >         HVS_WRITE(SCALER_DISPSTAT,
> >                   SCALER_DISPSTAT_EUFLOW(channel));
> >         HVS_WRITE(SCALER_DISPCTRL, dispctrl);
> > +
> > +       drm_dev_exit(idx);
> >  }
> >
> >  static void vc4_hvs_report_underrun(struct drm_device *dev)
> > @@ -581,6 +660,17 @@ static irqreturn_t vc4_hvs_irq_handler(int irq, void *data)
> >         u32 control;
> >         u32 status;
> >
> > +       /*
> > +        * NOTE: We don't need to protect the register access using
> > +        * drm_dev_enter() there because the interrupt handler lifetime
> > +        * is tied to the device itself, and not to the DRM device.
> > +        *
> > +        * So when the device will be gone, one of the first thing we
> > +        * will be doing will be to unregister the interrupt handler,
> > +        * and then unregister the DRM device. drm_dev_enter() would
> > +        * thus always succeed if we are here.
> > +        */
> > +
> >         status = HVS_READ(SCALER_DISPSTAT);
> >         control = HVS_READ(SCALER_DISPCTRL);
> >
> > @@ -613,10 +703,10 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
> >         u32 dispctrl;
> >         u32 reg;
> >
> > -       hvs = devm_kzalloc(&pdev->dev, sizeof(*hvs), GFP_KERNEL);
> > +       hvs = drmm_kzalloc(drm, sizeof(*hvs), GFP_KERNEL);
> >         if (!hvs)
> >                 return -ENOMEM;
> > -
> > +       hvs->dev = drm;
> >         hvs->pdev = pdev;
> >
> >         if (of_device_is_compatible(pdev->dev.of_node, "brcm,bcm2711-hvs"))
> > --
> > 2.36.1
> >

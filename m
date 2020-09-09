Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB616262E66
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 14:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158CA6EB4D;
	Wed,  9 Sep 2020 12:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752166E861
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 12:17:17 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id y5so2073160otg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 05:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5sk7BCWu7uTrrEXhCDzowgQp262uwpVX2mj3sACcYvw=;
 b=QiALuz1ie6MsTqecTWiph/yJ5Kcb1XhjLM8+SfG77FwnKp0Bo6slhDpq80dMi9olnW
 VTHLsOL87z+8FYBiJ+sz/FvUTT8qOreTYUd7dGnkwvd/wo/CK5KFgX3XnxM+P16MlEVx
 XH5eixpMWr5q/SyRpnr+3OmBC+BYo5qnlgOgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5sk7BCWu7uTrrEXhCDzowgQp262uwpVX2mj3sACcYvw=;
 b=LfVwnQgxvY3ChV7mabWn2QlLpXbUtR39QJf6loi8LVSUPWSxbVdz/fYRakcejnODAi
 LHJlG99eGphK8Y4O0qVOF/GXjxnpIMLfLbq8VJXwEJfsJs67zVLdot7h/kLmg6wHpA92
 BC0sZkWurxstUFf4U1mRyR6PlDC7nh8Kcwl1SvPoaWJ8UNPVLmpUCk7zJMHjOBp/FqLX
 kSxbqNXy/lF/ppArbaltFTenC4xB0reKCFmJfccoLgmFWDK2hkGdQmO630hJgX+zpxSB
 JMCqP66+Da8L7GN25TMtjibBgkLIFx1mGJI/AfJIDAmeMdvAuvbpLq/9mNHNxcLpZh6F
 KJCw==
X-Gm-Message-State: AOAM531+wwS2o0397aUiRotlDjH6fp6dt6BL2Yb/kV7TRbqh6Jr1S1KC
 yPVLGFv87kVTpc2+AmHwq5+/wkfF19YQtBbTWpe+UQ==
X-Google-Smtp-Source: ABdhPJyCtCbjbu27Le1efhvwBJtfMMTDolo2xiqiG5T2GpZP4+BPTHzYFjbQytZxLLgSkFb8heVZujBIw3fRu6WPNdc=
X-Received: by 2002:a05:6830:1e56:: with SMTP id
 e22mr456672otj.303.1599653836543; 
 Wed, 09 Sep 2020 05:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200806022649.22506-1-laurent.pinchart+renesas@ideasonboard.com>
 <3c2147d8-b5bc-b0e8-6435-4d3ec0154249@ideasonboard.com>
 <20200908155208.GF11405@pendragon.ideasonboard.com>
 <6e66b920-96d6-591a-af59-353558b89f98@ideasonboard.com>
In-Reply-To: <6e66b920-96d6-591a-af59-353558b89f98@ideasonboard.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 9 Sep 2020 14:17:05 +0200
Message-ID: <CAKMK7uGHyWpsQ2HWa_jhZ7iDVqUYGESSMQty7cYseudoy-ebuQ@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Fix pitch handling for fully planar YUV
 formats
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
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
Cc: "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 8, 2020 at 6:05 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Hi Laurent,
>
> On 08/09/2020 16:52, Laurent Pinchart wrote:
> > Hi Kieran,
> >
> > On Tue, Sep 08, 2020 at 04:42:58PM +0100, Kieran Bingham wrote:
> >> On 06/08/2020 03:26, Laurent Pinchart wrote:
> >>> When creating a frame buffer, the driver verifies that the pitches for
> >>> the chroma planes match the luma plane. This is done incorrectly for
> >>> fully planar YUV formats, without taking horizontal subsampling into
> >>> account. Fix it.
> >>>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>> ---
> >>>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 52 ++++++++++++++++++++++++++-
> >>>  drivers/gpu/drm/rcar-du/rcar_du_kms.h |  1 +
> >>>  2 files changed, 52 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >>> index 482329102f19..2fda3734a57e 100644
> >>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >>> @@ -40,6 +40,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >>>             .v4l2 = V4L2_PIX_FMT_RGB565,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>             .pnmr = PnMR_SPIM_TP | PnMR_DDDF_16BPP,
> >>>             .edf = PnDDCR4_EDF_NONE,
> >>>     }, {
> >>> @@ -47,6 +48,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >>>             .v4l2 = V4L2_PIX_FMT_ARGB555,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>             .pnmr = PnMR_SPIM_ALP | PnMR_DDDF_ARGB,
> >>>             .edf = PnDDCR4_EDF_NONE,
> >>>     }, {
> >>> @@ -61,6 +63,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >>>             .v4l2 = V4L2_PIX_FMT_XBGR32,
> >>>             .bpp = 32,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>             .pnmr = PnMR_SPIM_TP | PnMR_DDDF_16BPP,
> >>>             .edf = PnDDCR4_EDF_RGB888,
> >>>     }, {
> >>> @@ -68,6 +71,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >>>             .v4l2 = V4L2_PIX_FMT_ABGR32,
> >>>             .bpp = 32,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>             .pnmr = PnMR_SPIM_ALP | PnMR_DDDF_16BPP,
> >>>             .edf = PnDDCR4_EDF_ARGB8888,
> >>>     }, {
> >>> @@ -75,6 +79,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >>>             .v4l2 = V4L2_PIX_FMT_UYVY,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 2,
> >>>             .pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
> >>>             .edf = PnDDCR4_EDF_NONE,
> >>>     }, {
> >>> @@ -82,6 +87,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >>>             .v4l2 = V4L2_PIX_FMT_YUYV,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 2,
> >>>             .pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
> >>>             .edf = PnDDCR4_EDF_NONE,
> >>>     }, {
> >>> @@ -89,6 +95,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >>>             .v4l2 = V4L2_PIX_FMT_NV12M,
> >>>             .bpp = 12,
> >>>             .planes = 2,
> >>> +           .hsub = 2,
> >>>             .pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
> >>>             .edf = PnDDCR4_EDF_NONE,
> >>>     }, {
> >>> @@ -96,6 +103,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >>>             .v4l2 = V4L2_PIX_FMT_NV21M,
> >>>             .bpp = 12,
> >>>             .planes = 2,
> >>> +           .hsub = 2,
> >>>             .pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
> >>>             .edf = PnDDCR4_EDF_NONE,
> >>>     }, {
> >>> @@ -103,6 +111,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >>>             .v4l2 = V4L2_PIX_FMT_NV16M,
> >>>             .bpp = 16,
> >>>             .planes = 2,
> >>> +           .hsub = 2,
> >>>             .pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
> >>>             .edf = PnDDCR4_EDF_NONE,
> >>>     },
> >>> @@ -115,156 +124,187 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >>>             .v4l2 = V4L2_PIX_FMT_RGB332,
> >>>             .bpp = 8,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_ARGB4444,
> >>>             .v4l2 = V4L2_PIX_FMT_ARGB444,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_XRGB4444,
> >>>             .v4l2 = V4L2_PIX_FMT_XRGB444,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_RGBA4444,
> >>>             .v4l2 = V4L2_PIX_FMT_RGBA444,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_RGBX4444,
> >>>             .v4l2 = V4L2_PIX_FMT_RGBX444,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_ABGR4444,
> >>>             .v4l2 = V4L2_PIX_FMT_ABGR444,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_XBGR4444,
> >>>             .v4l2 = V4L2_PIX_FMT_XBGR444,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_BGRA4444,
> >>>             .v4l2 = V4L2_PIX_FMT_BGRA444,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_BGRX4444,
> >>>             .v4l2 = V4L2_PIX_FMT_BGRX444,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_RGBA5551,
> >>>             .v4l2 = V4L2_PIX_FMT_RGBA555,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_RGBX5551,
> >>>             .v4l2 = V4L2_PIX_FMT_RGBX555,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_ABGR1555,
> >>>             .v4l2 = V4L2_PIX_FMT_ABGR555,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_XBGR1555,
> >>>             .v4l2 = V4L2_PIX_FMT_XBGR555,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_BGRA5551,
> >>>             .v4l2 = V4L2_PIX_FMT_BGRA555,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_BGRX5551,
> >>>             .v4l2 = V4L2_PIX_FMT_BGRX555,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_BGR888,
> >>>             .v4l2 = V4L2_PIX_FMT_RGB24,
> >>>             .bpp = 24,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_RGB888,
> >>>             .v4l2 = V4L2_PIX_FMT_BGR24,
> >>>             .bpp = 24,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_RGBA8888,
> >>>             .v4l2 = V4L2_PIX_FMT_BGRA32,
> >>>             .bpp = 32,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_RGBX8888,
> >>>             .v4l2 = V4L2_PIX_FMT_BGRX32,
> >>>             .bpp = 32,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_ABGR8888,
> >>>             .v4l2 = V4L2_PIX_FMT_RGBA32,
> >>>             .bpp = 32,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_XBGR8888,
> >>>             .v4l2 = V4L2_PIX_FMT_RGBX32,
> >>>             .bpp = 32,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_BGRA8888,
> >>>             .v4l2 = V4L2_PIX_FMT_ARGB32,
> >>>             .bpp = 32,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_BGRX8888,
> >>>             .v4l2 = V4L2_PIX_FMT_XRGB32,
> >>>             .bpp = 32,
> >>>             .planes = 1,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_YVYU,
> >>>             .v4l2 = V4L2_PIX_FMT_YVYU,
> >>>             .bpp = 16,
> >>>             .planes = 1,
> >>> +           .hsub = 2,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_NV61,
> >>>             .v4l2 = V4L2_PIX_FMT_NV61M,
> >>>             .bpp = 16,
> >>>             .planes = 2,
> >>> +           .hsub = 2,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_YUV420,
> >>>             .v4l2 = V4L2_PIX_FMT_YUV420M,
> >>>             .bpp = 12,
> >>>             .planes = 3,
> >>> +           .hsub = 2,
> >>
> >> I guess vertical subsampling is handled distinctly?
> >> (perhaps the height of the plane or such?)
> >
> > Vertical subsampling doesn't affect the pitch, so there's no specific
> > constraint there.
>
> Good point, I wrongly assumed there would be a need to validate that
> specifically.
>
> But the height covers it.
>
> >
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_YVU420,
> >>>             .v4l2 = V4L2_PIX_FMT_YVU420M,
> >>>             .bpp = 12,
> >>>             .planes = 3,
> >>> +           .hsub = 2,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_YUV422,
> >>>             .v4l2 = V4L2_PIX_FMT_YUV422M,
> >>>             .bpp = 16,
> >>>             .planes = 3,
> >>> +           .hsub = 2,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_YVU422,
> >>>             .v4l2 = V4L2_PIX_FMT_YVU422M,
> >>>             .bpp = 16,
> >>>             .planes = 3,
> >>> +           .hsub = 2,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_YUV444,
> >>>             .v4l2 = V4L2_PIX_FMT_YUV444M,
> >>>             .bpp = 24,
> >>>             .planes = 3,
> >>> +           .hsub = 1,
> >>>     }, {
> >>>             .fourcc = DRM_FORMAT_YVU444,
> >>>             .v4l2 = V4L2_PIX_FMT_YVU444M,
> >>>             .bpp = 24,
> >>>             .planes = 3,
> >>> +           .hsub = 1,
> >>>     },
> >>>  };
> >>>
> >>
> >> I wonder when we can have a global/generic set of format tables so that
> >> all of this isn't duplicated on a per-driver basis.
> >
> > Note that this table also contains register values, so at least that
> > part will need to be kept. For the rest, do you mean a 4CC library that
>
> Yes, the driver specific mappings of course need to be driver specific.
>
>
> > would be shared between DRM/KMS and V4L2 ? That's a great idea. Too bad
> > it has been shot down when patches were submitted :-S
>
>
>  /o\ ... It just seems like so much data replication that must be used
> by many drivers.

Just to clarify: It wasn't shot down categorically, but I shot down
the specific approach of first sharing code, and then trying to align
the subsystems somehow later on with lots of hand-waving.

The trouble with format enumerations that the devil's always in the
details, so you have to absolutely align first, and then share code
second, or it'll just become a complete mess.

E.g. even in the drm world we lots of overlapping enumerations because
they come from different standard bodies. There's a bit of a push to
fully standardize on drm_fourcc.h codes at least in the low-level
stuff, but e.g. vk/gl will always have their own.

So yeah if you want to share format code with v4l, step 1 is to figure
out how to establish common definitions. And not as in "we'll use the
same numbers", but with stuff like userspace in gstreamer and
everywhere assuming that they match perfectly (like we do between mesa
and drm-modesetting drivers), with all that implies. And we're not
even close to such a world.

Cheers, Daniel

> Even without mapping the DRM/V4L2 fourccs - even a common table in each
> subsystem would be beneficial wouldn't it?
>
> I mean - RCar-DU isn't the only device that needs to know how many
> planes DRM_FORMAT_YUV422 has, or what horizontal subsampling it uses?
>
> Anyway, that's not an issue with this patch, it just seems glaring to me
> that these entries are common across all hardware that use them ...
>
> (the bpp/planes/subsampling of course, not the hardware specific registers).
>
>
>
> >>> @@ -311,6 +351,7 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> >>>  {
> >>>     struct rcar_du_device *rcdu = dev->dev_private;
> >>>     const struct rcar_du_format_info *format;
> >>> +   unsigned int chroma_pitch;
> >>>     unsigned int max_pitch;
> >>>     unsigned int align;
> >>>     unsigned int i;
> >>> @@ -353,8 +394,17 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> >>>             return ERR_PTR(-EINVAL);
> >>>     }
> >>>
> >>> +   /*
> >>> +    * Calculate the chroma plane(s) pitch using the horizontal subsampling
> >>> +    * factor. For semi-planar formats, the U and V planes are combined, the
> >>> +    * pitch must thus be doubled.
> >>> +    */
> >>> +   chroma_pitch = mode_cmd->pitches[0] / format->hsub;
> >>> +   if (format->planes == 2)
> >>> +           chroma_pitch *= 2;
> >>> +
> >>>     for (i = 1; i < format->planes; ++i) {
> >>> -           if (mode_cmd->pitches[i] != mode_cmd->pitches[0]) {
> >>> +           if (mode_cmd->pitches[i] != chroma_pitch) {
> >>>                     dev_dbg(dev->dev,
> >>>                             "luma and chroma pitches do not match\n");
> >>
> >> Is this statement still sufficient?
> >> I'd perhaps say 'are not compatible' or 'are not correct'. - but its
> >> only a debug print, so it really doesn't matter.
> >
> > I like "are not compatible", I'll switch to that.
> >
> >> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>
> >>>                     return ERR_PTR(-EINVAL);
> >>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.h b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
> >>> index 0346504d8c59..8f5fff176754 100644
> >>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.h
> >>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
> >>> @@ -22,6 +22,7 @@ struct rcar_du_format_info {
> >>>     u32 v4l2;
> >>>     unsigned int bpp;
> >>>     unsigned int planes;
> >>> +   unsigned int hsub;
> >>>     unsigned int pnmr;
> >>>     unsigned int edf;
> >>>  };
> >
>
> --
> Regards
> --
> Kieran
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

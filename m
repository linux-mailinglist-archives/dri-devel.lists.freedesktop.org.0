Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE9D37778F
	for <lists+dri-devel@lfdr.de>; Sun,  9 May 2021 18:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A06D89CBE;
	Sun,  9 May 2021 16:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8188B89CBE;
 Sun,  9 May 2021 16:24:55 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 82-20020a1c01550000b0290142562ff7c9so7505623wmb.3; 
 Sun, 09 May 2021 09:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eDSzWlroomnQ5h3Y6dUDqkb1FsjYS2fbu1DIxKf7c3A=;
 b=cQozjKYypAyMo0LvueEtTElyTE89pbNeSyAoFIrXqpB1CpGFAdKfj7MVmVliTQj8q9
 wbN9Nxi/zHWx8eZu4r9G59UNIuDM6+PtVjJiN1YBECdhW71T2vjY0vnnH5KpALtLXFek
 Xums8DkBafio8UuYgRN6YGcnQQRUZ7H6hxO6genyBZWTKwj++V9YdtZ3QHDHqaaghcw0
 LrUxJkyi8UDEjjDd62HYANDeBdcI1/zO6AyKgtL7RqSbdhV6FOcfX+TDgbk/PyD7lON2
 dFL9H5Ud8wOUsk18ENiOcnGSzTpQdTOdnKUTTVRdfeoCeApLMmQXb+hoG1ZkZIynMuzG
 IsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eDSzWlroomnQ5h3Y6dUDqkb1FsjYS2fbu1DIxKf7c3A=;
 b=AzPQU24umP8QpCTGEYu7ERXRz1TosSzkP/klPeMcZFxFtUM3aTIMX6i6lepau2/nVS
 nBC2KyrIZztzgQ80u31GWPthSO8nEIK2NkXfOWZW2fQb3o+CgpbC6jFkIKQ3P7HfkYEX
 Fpopdq9FZDKWBKWlnVtlLlg7kL7F7GRE1f4HwlwqYcT26onER/24VHBZFSyT8jq1O+G2
 ncwoHFwwZZvKT+ed9PAbVo/RLDEpl0H7Dq4Ihlp9lBcVZi2JqJKOlMhRCr7QKN/q7I97
 yetjrGF9RJI33d/5bHQl2QgDXqVsPf3TdukYTtxp1vl1RD91mF+toAsccldpkGuwpBY2
 SPpw==
X-Gm-Message-State: AOAM530Uo+PituxY+tJeZaz4z576RUvr8TJsZceX689lPv/wyaJKX1bH
 15HLKg6+q1Uf7RKb+r03iLzkb43gTlCs+HpaFwtYU7dTI/I=
X-Google-Smtp-Source: ABdhPJxCTH5X6v8qARUz2sTxBc7o5z4ShukPhUKB3YkniYCZ9F1AhWzx8i6yLXakzqyxm36pS5Poti9A3Xxakw2v9vQ=
X-Received: by 2002:a7b:c101:: with SMTP id w1mr33251557wmi.164.1620577493717; 
 Sun, 09 May 2021 09:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210508195641.397198-1-robdclark@gmail.com>
 <20210508195641.397198-3-robdclark@gmail.com>
In-Reply-To: <20210508195641.397198-3-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 9 May 2021 09:28:35 -0700
Message-ID: <CAF6AEGvWJuOQqf7QqoVHB3CSM_uhgRLh3JZVFa=4m+FiD-hu3A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: Wire up needs_dirtyfb
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Ryan Houdek <Houdek.Ryan@fex-emu.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Hongbo Yao <yaohongbo@huawei.com>, open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Qinglang Miao <miaoqinglang@huawei.com>, Maxime Ripard <maxime@cerno.tech>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 8, 2021 at 12:53 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

From Ryan (sending this for him because mailing list workflow is lame):

I have tested this on my end and it resolves the 120hz problem.

Tested-By: Ryan Houdek <Houdek.Ryan@fex-emu.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 5a74f93e29da..868ee6136438 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -143,6 +143,19 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
>         return true;
>  }
>
> +static bool dpu_crtc_needs_dirtyfb(struct drm_crtc *crtc)
> +{
> +       struct drm_encoder *encoder;
> +
> +       drm_for_each_encoder_mask (encoder, crtc->dev, crtc->state->encoder_mask) {
> +               if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_CMD) {
> +                       return true;
> +               }
> +       }
> +
> +       return false;
> +}
> +
>  static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>                 struct dpu_plane_state *pstate, struct dpu_format *format)
>  {
> @@ -1343,6 +1356,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
>         .atomic_begin = dpu_crtc_atomic_begin,
>         .atomic_flush = dpu_crtc_atomic_flush,
>         .get_scanout_position = dpu_crtc_get_scanout_position,
> +       .needs_dirtyfb = dpu_crtc_needs_dirtyfb,
>  };
>
>  /* initialize crtc */
> --
> 2.30.2
>

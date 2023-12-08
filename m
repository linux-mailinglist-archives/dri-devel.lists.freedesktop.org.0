Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6E380A2B5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 12:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0FA10EA95;
	Fri,  8 Dec 2023 11:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF8F10EA9A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 11:54:26 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5c08c47c055so18836337b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 03:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702036465; x=1702641265; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3Y3Se1GcDGIbYUefqj6qyxR6DT7anpk4KRXh007rVt4=;
 b=YbSoiHa799A9RN/bAtVYgAtUtcGchS4U67CchZKfkx2WPAkWlai5zmfYh6BZO1VB8W
 O+wGniXfyPl79GPerMevi5yzx1zwT8c06rYL5S4VjsXHgxpF6+OnnTIhj6GzQ+Ap5aPk
 lWZ447FT2NaE156q67rt7QyB1HsX3yOKBkzAWew+poRhzzRW6RHlR38Xur6nIrwFwfTY
 Po9H/JCCG7Kou7hXTQGY8GV97cimgTMapd00HoApAFHIudA/DRASfbaqbSsb/RnOFcpc
 5XH3ezTsftM9KeD1yEsSMXDx3gEj0wWIbencQs/mZtPkFJZ5zkAutxFbHrDBfnQtXbfb
 zgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702036465; x=1702641265;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Y3Se1GcDGIbYUefqj6qyxR6DT7anpk4KRXh007rVt4=;
 b=l+rWMQ89NPZXy78xJniW3Rb8M2sRqdfaTSGWzZ0nJZg30kb3810QoTiXWBHeHUqjtX
 PK+zNmTvLUwDxaan6XQYJHLwgEh9r2nBjeZYt5ZO2fKrqkWDstiSQ4aOrtF5KbXlLdeA
 p++qQJemJCcDcoPcrVgQNdAJnRkq1GA6kRn7qIkSGb2AN8ih0OVbeFHB4TJT4+yqHNLD
 riuM2z+F/wxTGlRgTQrb3C0x9qaxzrvraOZzkM1lZQej4kXUXAI5ctWTshxFUzH7WfFR
 u0M9ANrfJQg9xMYN33+ojL0VK8xpHlQoaS09IqSC9Wx/6hBBhmRQX/SRuXPJMOp959ae
 D0BQ==
X-Gm-Message-State: AOJu0Yw7f+zVF1jRRWq/PGygfoEXqhxFmAWN7NeZiExBVYRL8scZBHbw
 Ke+gFOPFBvq+k7YAtS6MisONfLuiKx5ZrD+bV6xQ2A==
X-Google-Smtp-Source: AGHT+IEho6li6mBQtcvkKv7dl+SZrnSSWaZwoy9kNhdxT/+JJRDfIAUab3CIjuSQnHHcGRdbsl9H5uqFhk2EHSNzRws=
X-Received: by 2002:a81:4c86:0:b0:5d6:c21a:de9e with SMTP id
 z128-20020a814c86000000b005d6c21ade9emr3630952ywa.37.1702036465703; Fri, 08
 Dec 2023 03:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-15-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-15-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:54:13 +0200
Message-ID: <CAA8EJpo4XVMJ7RqsZZ6Eh_PjoPeWiMmAW3P1a4dkZ_EHqz7GkQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] drm/msm/dpu: reserve cdm blocks for writeback in
 case of YUV output
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Reserve CDM blocks for writeback if the format of the output fb
> is YUV. At the moment, the reservation is done only for writeback
> but can easily be extended by relaxing the checks once other
> interfaces are ready to output YUV.
>
> changes in v2:
>         - use needs_cdm from topology struct
>         - drop fb related checks from atomic_mode_set()

It looks like this should be squashed with the patch 11. The 'unbind
CDM' doesn't really make sense without this patch. We need to allocate
it first,  before touching it.

>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 27 +++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 862912727925..a576e3e62429 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -16,6 +16,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_framebuffer.h>
>
>  #include "msm_drv.h"
>  #include "dpu_kms.h"
> @@ -583,6 +584,7 @@ static int dpu_encoder_virt_atomic_check(
>         struct drm_display_mode *adj_mode;
>         struct msm_display_topology topology;
>         struct dpu_global_state *global_state;
> +       struct drm_framebuffer *fb;
>         struct drm_dsc_config *dsc;
>         int i = 0;
>         int ret = 0;
> @@ -623,6 +625,22 @@ static int dpu_encoder_virt_atomic_check(
>
>         topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
>
> +       /*
> +        * Use CDM only for writeback at the moment as other interfaces cannot handle it.
> +        * if writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
> +        * earlier.
> +        */
> +       if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> +               fb = conn_state->writeback_job->fb;
> +
> +               if (fb && DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))))
> +                       topology.needs_cdm = true;
> +               if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> +                       crtc_state->mode_changed = true;
> +               else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> +                       crtc_state->mode_changed = true;
> +       }
> +
>         /*
>          * Release and Allocate resources on every modeset
>          * Dont allocate when active is false.
> @@ -1063,6 +1081,15 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>
>         dpu_enc->dsc_mask = dsc_mask;
>
> +       if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> +               struct dpu_hw_blk *hw_cdm = NULL;
> +
> +               dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +                                             drm_enc->base.id, DPU_HW_BLK_CDM,
> +                                             &hw_cdm, 1);
> +               dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
> +       }
> +
>         cstate = to_dpu_crtc_state(crtc_state);
>
>         for (i = 0; i < num_lm; i++) {
> --
> 2.40.1
>


--
With best wishes

Dmitry

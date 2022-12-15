Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEEE64E475
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 00:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AA310E59A;
	Thu, 15 Dec 2022 23:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7AD210E59A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 23:04:51 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-40b40ff39f1so10631537b3.10
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 15:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Jj+Yw0LnI+4S2TE6CziTLpc8F6+12sJM98glvhhKdCU=;
 b=l4pudfWMlR8d8XZK35gg+50oSmIqkABAOSzCWaJ66QqpQNIXemXlYs9C2A5BSd+a94
 xPA1bTrKeLHvKGJDeU41KRxL7wX8NLIjPqJAHkUFruV6iQjnuvTBy1mCcH7GXIVzvNdI
 cyq3wg82/dw/Jwg5SZjwaQgV7qvnOSpXCANEygJKWl+Tgeg1zoIRuIpEBNcQ0EAvil/3
 3Ex/SWZA1f37jPiWpQ3xx9ejVPVf/decSo1fZblMcwvd5LkzHRhEBlQCdcHxjSpw92Cl
 nhfYBFPzYlnyEX3At4DS+5w865dL/EU2RPDLedNGkUbT36Z0QezFGRikUzmHE82i1y42
 XggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jj+Yw0LnI+4S2TE6CziTLpc8F6+12sJM98glvhhKdCU=;
 b=EmajUwmG4mVEvUoDRZ1TpskByIL4zB0VDtXC6jCUIMZDlsX4S7dG38W0wDAKhMOuJW
 46Ey2+IzZAKtRLJ8GgY9obsXO6VJR5FiHKDJS8DJS2Me53wPGaZ9vA2VCy/IGMl3+OVO
 4hs2QmfoHSp4J1mff9vYeiQFuD9aqtjb2gvFBZ7ZvpNn/032jjOSQNe7d+mdxraeDEAS
 FlshEXE9imgrxGuW0lQOR5Dq1xB1Y3R7oTV2I5uUpOFuSOjezcKjN+i2djSsyPKTw5+1
 655Xz622pbsdz+0BBIzFMgrraTTMvpHtBm6SeQAKbfdFDA2bbUIfC+qvzgroSrvDWoGw
 Wnrw==
X-Gm-Message-State: ANoB5pm+DN48yLIbQ2katFxFYae1iIfWOLJhnmrHdmezVFsdkyR8I1qQ
 IsILEEePVvqCRc2WMG1FZDClYfLuUwnFoWaszhEaYQ==
X-Google-Smtp-Source: AA0mqf5aCvorXkICWtqWSDt6Cusf3MZN1wuC0dmniym8Rep7BtRxEq7rTvb0u6aXueNsjvbiI7Xrn/t9pqgnrH4ctJ0=
X-Received: by 2002:a81:53d4:0:b0:3c0:c065:7608 with SMTP id
 h203-20020a8153d4000000b003c0c0657608mr3117813ywb.378.1671145490997; Thu, 15
 Dec 2022 15:04:50 -0800 (PST)
MIME-Version: 1.0
References: <1671144775-19077-1-git-send-email-quic_khsieh@quicinc.com>
 <1671144775-19077-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1671144775-19077-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 16 Dec 2022 01:04:40 +0200
Message-ID: <CAA8EJprkXEH=g4XyH3JEAg3MNpbs7NHcKQ2OCBX6s9VcCikoLg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm/msm/dp: do not complete dp_aux_cmd_fifo_tx()
 if irq is not for aux transfer
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Dec 2022 at 00:53, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> There are 3 possible interrupt sources are handled by DP controller,
> HPDstatus, Controller state changes and Aux read/write transaction.
> At every irq, DP controller have to check isr status of every interrupt
> sources and service the interrupt if its isr status bits shows interrupts
> are pending. There is potential race condition may happen at current aux
> isr handler implementation since it is always complete dp_aux_cmd_fifo_tx()
> even irq is not for aux read or write transaction. This may cause aux read
> transaction return premature if host aux data read is in the middle of
> waiting for sink to complete transferring data to host while irq happen.
> This will cause host's receiving buffer contains unexpected data. This
> patch fixes this problem by checking aux isr and return immediately at
> aux isr handler if there are no any isr status bits set.
>
> Current there is a bug report regrading eDP edid corruption happen during
> system booting up. After lengthy debugging to found that that VIDEO_READY
> interrupt was continuously firing during system booting up which cause
> dp_aux_isr() to complete dp_aux_cmd_fifo_tx() prematurely to retrieve data
> from aux hardware buffer which is not yet contains complete data transfer
> from sink. This cause edid corruption.
>
> Follows are the signature at kernel logs when problem happen,
> EDID has corrupt header
> panel-simple-dp-aux aux-aea0000.edp: Couldn't identify panel via EDID
> panel-simple-dp-aux aux-aea0000.edp: error -EIO: Couldn't detect panel nor find a fallback
>
> Changes in v2:
> -- do complete if (ret == IRQ_HANDLED) ay dp-aux_isr()
> -- add more commit text
>
> Changes in v3:
> -- add Stephen suggested
> -- dp_aux_isr() return IRQ_XXX back to caller
> -- dp_ctrl_isr() return IRQ_XXX back to caller
>
> Changes in v4:
> -- split into two patches
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
>

The same feedback as the one I gave for v2 or v3:

There should be no empty lines between tags. And you still have one
empty line here.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Tested-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index d030a93..cc3efed 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -423,6 +423,10 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
>
>         isr = dp_catalog_aux_get_irq(aux->catalog);
>
> +       /* no interrupts pending, return immediately */
> +       if (!isr)
> +               return;
> +
>         if (!aux->cmd_busy)
>                 return;
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry

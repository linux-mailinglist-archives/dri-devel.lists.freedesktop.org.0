Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD4C7A26D8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 21:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5906B10E033;
	Fri, 15 Sep 2023 19:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D133910E66F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 19:02:36 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-d818d4230f6so2217250276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 12:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694804556; x=1695409356; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=euz/IHIc0mhpSJvprvTibU0nvlspa5qnPH9if5eZjIU=;
 b=oJyvypkzWX/njjAngyGgidYwICbMmkFTjq0tvIw/nEvla7y1KKTOAV0SRCbOqsD5+D
 fEruVnp0BAkradOB/htM9qaSAhv62D6g5TIAzB5pJX+KFuK21hpaSDfliTP1RbRfvom9
 GOrKi+/u/2+PWynMsCymr2lvutfKHlas4uGNombut+a+4NozrvTRdC+BPOgff2zuqL7O
 q0XrHLbXO9fnLsqsdIEEI4gouhfFqZFXDPqUluHCrIZDVNi6R6ttXGthReoZA3U0gYtq
 mjxR3QYl8OyVnaeNgOkXEV7N+Xk5TUBRGjpftlr3kooYNgAj4gI6L7xmkvcsiO08Vnhi
 WI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694804556; x=1695409356;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=euz/IHIc0mhpSJvprvTibU0nvlspa5qnPH9if5eZjIU=;
 b=ehWO8IlVyc3VI9CwHhapnTqXHTptyL1M5wzIN31uBq0VjcXCdkB7ACVLGsV9H5vZNT
 tB9pU60Fs+3kLX5hqL8Ooc+sm/qXlg5zThQV9tUh97RJkmlqlK6eOhaEiGO+uwVnkLgh
 kvrdsYjaNhsb6QZPYOv1tyn69bsw+uyu0PtuFGjG1YMf6kxaPGSdHOSkmmv0+oxvfFEX
 7HII1dU/PTv9lme7ihDnDcO5OD9YLiZjt0lrhgyb+DwEaVLUmDAB5GNqK9dM3+ataBKq
 MqaIVyBVKOOR/4SeSftpxJFZgLs/zaQ9VM8DeEUNirilEQ0okCtuVJ9r9j2YkA62SJ9U
 J4lA==
X-Gm-Message-State: AOJu0YxRHlixwxnVAdzANNSCB1jnXI8YcG1i9w/kkDIPME/X8umCVG6F
 8Wq7fNScmdw88wuQ6tw8l12Q0YqOTjWBEAAyeGVCpg==
X-Google-Smtp-Source: AGHT+IHjvbgo6WAOZyaLXnz4gisXVihpdX/YxZz482tKbWXr6KliN8j5UIIdtWwak5bLhfxaD9Fmf6SeDLlP6dEFAas=
X-Received: by 2002:a25:8250:0:b0:d81:43ea:d018 with SMTP id
 d16-20020a258250000000b00d8143ead018mr2631057ybn.42.1694804555819; Fri, 15
 Sep 2023 12:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230915183010.32077-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20230915183010.32077-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Sep 2023 22:02:24 +0300
Message-ID: <CAA8EJpp-eK1spEBSJtT0YtRkJtSL6MWPyxN5c4AB-1MJMJXs9A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: skip the wait for video mode done if not
 applicable
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
Cc: Hai Li <hali@codeaurora.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_parellan@quicinc.com,
 quic_jesszhan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Sept 2023 at 21:30, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> dsi_wait4video_done() API wait for the DSI video mode engine to
> become idle so that we can transmit the DCS commands in the
> beginning of BLLP. However, with the current sequence, the MDP
> timing engine is turned on after the panel's pre_enable() callback
> which can send out the DCS commands needed to power up the panel.
>
> During those cases, this API will always timeout and print out the
> error spam leading to long bootup times and log flooding.
>
> Fix this by checking if the DSI video engine was actually busy before
> waiting for it to become idle otherwise this is a redundant wait.
>
> Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 0c4ec0530efc..31495e423c56 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1075,9 +1075,21 @@ static void dsi_wait4video_done(struct msm_dsi_host *msm_host)
>
>  static void dsi_wait4video_eng_busy(struct msm_dsi_host *msm_host)
>  {
> +       u32 data;
> +
> +       data = dsi_read(msm_host, REG_DSI_STATUS0);
> +
>         if (!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO))
>                 return;

We can probably skip reading REG_DSI_STATUS0 if the host is in CMD mode.
LGTM otherwise.

>
> +       /* if video mode engine is not busy, its because
> +        * either timing engine was not turned on or the
> +        * DSI controller has finished transmitting the video
> +        * data already, so no need to wait in those cases
> +        */
> +       if (!(data & DSI_STATUS0_VIDEO_MODE_ENGINE_BUSY))
> +               return;
> +
>         if (msm_host->power_on && msm_host->enabled) {
>                 dsi_wait4video_done(msm_host);
>                 /* delay 4 ms to skip BLLP */
> --
> 2.40.1
>


-- 
With best wishes
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D704640CCF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 19:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537C510E71C;
	Fri,  2 Dec 2022 18:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174E710E71C
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 18:06:11 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id 128so5359871vsz.12
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Dec 2022 10:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Bd9XMM2xXc5d3WaSzcwmX5OfPJpMdrj/2STZxWIDP30=;
 b=sM4FgIAUd6W7+jfR0yRPLsNWlmTGQwc8SJHWA5BATk8XXJfPwBnkpfbTl16l0gI6BQ
 36s7vZ7he9pEooG86WDpLHqQ+XBPJFlSNUX77RVVACcubKwWQyjkRZD8hbQ+WHstEAo/
 tJaDugHTDYqAHmOVQsmBldAWSHhlvU6OAdix4Wc3o2VhUsapaArGFCcakOeUO5uYuJsk
 y0ucGNdRxnJDBUEDDGJvWEENuQdMOKxZSlAGTjGF0ruVEAKZHmNxBtCMv8L7wylCnvBA
 7yWstQwv04UUhrEKxUGh9ug/UcxjJ76aXhXzBupCI+PrIXvseopRhBrPEfUZcFHc7KvV
 b+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bd9XMM2xXc5d3WaSzcwmX5OfPJpMdrj/2STZxWIDP30=;
 b=SMnqxmDWuUVbW8TY3JBxrygb7lfyRGFhBL2iTm+rNQGbvgxIFuXyOj6uzTV4APWjw6
 q2CMs/lO0nAnOfYOo8rXZfNqwVswlN+rsA4sSmkg9hh+hR3IjxWBoinlqj5Cd95Ccy/c
 2wfyxth9WFGrGLO/Ifyb/xXCBPJkqCkjkXrfyZbaU6VhSUqg+FjuZKKqlGpdSESfGSmb
 6ke8g/BVHVmjiD0rjuE9KiJtaymAWDBmFaHn7EoENJBcnzdJYKBQqmFdUiA1S9AcvH62
 B8aGrT7YzKTMTgCE7d7DJ9tJWMRRNS+YC3hJe73A5A1H7qXUZOuAbro4pYcy+Ykq2ZgE
 qLig==
X-Gm-Message-State: ANoB5pmnpZz1VOhV/lWJCXzkYXn6x//wnIMKGFKfhq42XfGQtzW8TLwZ
 1CDr6bCo7MjFwLmqPrsUbxFln7fkY2RG8K+lpfDU
X-Google-Smtp-Source: AA0mqf59/7uddfiskq46h96rpMnKsZl1n1l57s68PalSPgdgl9iK9BhoY3POPuXf+ocA/0kF0aAQxQ1b1RFC56X+nUM=
X-Received: by 2002:a67:f88d:0:b0:3b0:8797:46d0 with SMTP id
 h13-20020a67f88d000000b003b0879746d0mr22697162vso.57.1670004370024; Fri, 02
 Dec 2022 10:06:10 -0800 (PST)
MIME-Version: 1.0
References: <20221202082028.11454-1-shangxiaojing@huawei.com>
In-Reply-To: <20221202082028.11454-1-shangxiaojing@huawei.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 2 Dec 2022 10:05:57 -0800
Message-ID: <CANDhNCpW47nwVc=oXUkmpEL=2+SiwM8R4zFAgoD5u3CRUyr2RA@mail.gmail.com>
Subject: Re: [PATCH] drm: kirin: Fix missing clk_disable_unprepare in
 ade_power_up()
To: Shang XiaoJing <shangxiaojing@huawei.com>
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
Cc: architt@codeaurora.org, xinliang.liu@linaro.org, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, kong.kongxinwei@hisilicon.com,
 Yongqin Liu <yongqin.liu@linaro.org>, tiantao6@hisilicon.com,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 2, 2022 at 12:22 AM Shang XiaoJing <shangxiaojing@huawei.com> wrote:
>
> The clk_disable_unprepare() should be called in the error handling of
> ade_power_up(). So as reset_control_assert().
>
> Fixes: 783ad972c9a0 ("drm/hisilicon: Add crtc driver for ADE")
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>

Looks reasonable to me. Thanks for sending this out!
CC'ing YongQin and Sumit as they have hardware to test against.

Acked-by: John Stultz <jstultz@google.com>


> ---
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> index 871f79a6b17e..439e87923bcf 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> @@ -229,12 +229,15 @@ static int ade_power_up(struct ade_hw_ctx *ctx)
>         ret = reset_control_deassert(ctx->reset);
>         if (ret) {
>                 DRM_ERROR("failed to deassert reset\n");
> +               clk_disable_unprepare(ctx->media_noc_clk);
>                 return ret;
>         }
>
>         ret = clk_prepare_enable(ctx->ade_core_clk);
>         if (ret) {
>                 DRM_ERROR("failed to enable ade_core_clk (%d)\n", ret);
> +               reset_control_assert(ctx->reset);
> +               clk_disable_unprepare(ctx->media_noc_clk);
>                 return ret;
>         }
>
> --
> 2.17.1
>

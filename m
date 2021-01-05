Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB552EBB5B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 09:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED0889D9A;
	Wed,  6 Jan 2021 08:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C8B6E067
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 17:20:51 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id 15so299033oix.8
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 09:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+8HnMKmmR3irntqkPoTijDAmi9RNifSyt345Lj9jh6w=;
 b=il0accWtmynUoVPPyoPVH6gyX/ThyX7SepTuN+TqIHOJOgLcTmpIb94QylPI1WdF+S
 ay6kvBxfMtFbX/maKQ4dYCW8Ww2K6ehsrtJQY2CwCW7wODVMoIMjT18tlbQPbnittNB0
 9zu2sMzf2Vo7WvMj+sVspN9Njgu8EPUe3ggxELdlQlbPAHpiBi/pwJGIpd7DCsViWDdp
 XV2gCWjl9VExBHHBhvgzxolmOPROTBEyf3COvhIsOZ1VUK0vIM/4UgoVh7XXQvYZytxb
 dhC8RwTx4xY5k7vfLPul3EWUgOKEK4LCM/h3lLAW07/le+00y0E4fY5dmSCHPpFo6oAx
 XGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+8HnMKmmR3irntqkPoTijDAmi9RNifSyt345Lj9jh6w=;
 b=uW3V2Ry8sgu2tZFmgsj/HJJL7b+GzzQGuAnnN2d6EOtAmJSGoNJkcRqEdHo/xS5KE4
 G9w03wW5jNkzrTB8JH7QkUXjtUhVmBtq29RPWeEbRIDGTf20zrbIgTOPLbqCE4jsizzp
 ZNmyF+2XJGTuemAkW0g+jiiMKCLsnKiYQoHQIeU9zHwtZshIJ2GlffyLrkQrRXT2BovP
 4b2YVPrvzDg98HvQkzvsIAdMmL7eBOcSwlgQ5w2j9DBg+ljKKTsnXp0V9i/Gxdx9YIOj
 0MjakvcmaWwtg0Z8atEyLmwVVyUaAjuGhEEQORWPGbjxWsybIZ8i6PFK9L8ynisihgG+
 uMfQ==
X-Gm-Message-State: AOAM530Co5R6P9zIa8CEir0ejdX7gfQEievbIlI9/kNAHvUhQkh5Nrx7
 MriwkrCyKpzD4ZOeEbYApJu2RAAik3IcSE8q4bBB9yTpyHUUPw==
X-Google-Smtp-Source: ABdhPJzN1UkVYjni3vMilZQJdc51y6RwbIuedWU+HTPoj5Wtm9vhtknU2n6LLuCN6/ypA122eWF7PY0hANL7ft6T9IM=
X-Received: by 2002:a05:6808:64d:: with SMTP id
 z13mr399416oih.177.1609867250595; 
 Tue, 05 Jan 2021 09:20:50 -0800 (PST)
MIME-Version: 1.0
References: <20201127092316.122246-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201127092316.122246-1-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Jan 2021 20:20:39 +0300
Message-ID: <CAA8EJpoetah-BHxe1Xao=8R3rR4CocdA9AXLERTjc-yKJ+Z0UQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge/lontium-lt9611uxc: fix waiting for EDID to
 become available
To: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
X-Mailman-Approved-At: Wed, 06 Jan 2021 08:52:53 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gracious ping for these two patches

On Fri, 27 Nov 2020 at 12:23, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> - Call wake_up() when EDID ready event is received to wake
>   wait_event_interruptible_timeout()
>
> - Increase waiting timeout, reading EDID can take longer than 100ms, so
>   let's be on a safe side.
>
> - Return NULL pointer from get_edid() callback rather than ERR_PTR()
>   pointer, as DRM code does NULL checks rather than IS_ERR().
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 0c98d27f84ac..b708700e182d 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -145,8 +145,10 @@ static irqreturn_t lt9611uxc_irq_thread_handler(int irq, void *dev_id)
>
>         lt9611uxc_unlock(lt9611uxc);
>
> -       if (irq_status & BIT(0))
> +       if (irq_status & BIT(0)) {
>                 lt9611uxc->edid_read = !!(hpd_status & BIT(0));
> +               wake_up_all(&lt9611uxc->wq);
> +       }
>
>         if (irq_status & BIT(1)) {
>                 if (lt9611uxc->connector.dev)
> @@ -465,7 +467,7 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
>  static int lt9611uxc_wait_for_edid(struct lt9611uxc *lt9611uxc)
>  {
>         return wait_event_interruptible_timeout(lt9611uxc->wq, lt9611uxc->edid_read,
> -                       msecs_to_jiffies(100));
> +                       msecs_to_jiffies(500));
>  }
>
>  static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
> @@ -503,7 +505,10 @@ static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
>         ret = lt9611uxc_wait_for_edid(lt9611uxc);
>         if (ret < 0) {
>                 dev_err(lt9611uxc->dev, "wait for EDID failed: %d\n", ret);
> -               return ERR_PTR(ret);
> +               return NULL;
> +       } else if (ret == 0) {
> +               dev_err(lt9611uxc->dev, "wait for EDID timeout\n");
> +               return NULL;
>         }
>
>         return drm_do_get_edid(connector, lt9611uxc_get_edid_block, lt9611uxc);
> --
> 2.29.2
>


-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

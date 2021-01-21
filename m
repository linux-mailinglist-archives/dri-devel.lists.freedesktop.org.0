Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0E82FFE7C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A032C6E9B9;
	Fri, 22 Jan 2021 08:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7B36E057
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 09:50:59 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id t29so1171437pfg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 01:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BbxFki6tRqBX44IegEJe/BsZNExFbfRgQ7K/DMqXpe8=;
 b=A1AJnTLR1KCTSKBNCZ3JyEbtViSOVuzkHWv6idUgfWTfqy+UYL3/XgVlhkw3gUTrZL
 3GY386GwUpruFJZD6FaCnygmfq2zZQCl3n7h6l+0WpFIpGT0u3MeCiWcj6fxItmgMgML
 /Yjc9zlGywzrlno0Tfs9FkGe6jyAWlB9hIVpj9OmgoWYfW1A71uMrMAr06MYroD271li
 UZ+1bdV1CQ1uMWEKBhF08lHe+LsML/w3wThdojfW76E2uR2WdWav/6V6XEVBFhh9NJ39
 Ls949nwzS6aD+uhFedHdK6LQe16aYjDCCRKp3R5aksY58DnTNVTMfH5f0UGi7PLRuvsu
 BVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BbxFki6tRqBX44IegEJe/BsZNExFbfRgQ7K/DMqXpe8=;
 b=WAwxkPfjV5L5dMEwPkwU29JBDU7m4k/iXBMKSSjGs+kLjUkgymTG+XQyVAjlWqO0rS
 EdnbHVIby0ATG/M/bwta5TejuzMBabXBdO3KFiFr263L6NbwVyGgcYTPbU9p/mDgwvR/
 OORNywtOr/+LA+RgDVDnv2/D/uBelmGgL7wrqU8bkIeLUJNDQEyDuEJJdF8apyxFJVWj
 IaofUsVdgOpmfeNZ1peHCGqWWy3X92vHvFcFm5evYPdiTVwto/7H0vpQvYBkfeQhnd4G
 JLh0jOdsGyCkmHWdSviGM8d59gja0YwIYxEPT8sq+Sg4/KoxkrG7E6R3ZWqAArE09Men
 0tnw==
X-Gm-Message-State: AOAM533h34rod36qp+oKgITIqE8xTGPDXt9Mfd5o2NSGzLaFdizxHXI9
 3bdDHT98PSYZZIGxswVwxUx9OGK4rlkBjYRHH73qOQ==
X-Google-Smtp-Source: ABdhPJy4QmxdDGGbdf9i+h1GcKiwufxe5Plh47FVzcuGSR7wU0aFKJI9QhaFtI+6AWpwyCxBgfhH/vaW0W5o0h154jo=
X-Received: by 2002:aa7:8edd:0:b029:1b7:9f41:c4d8 with SMTP id
 b29-20020aa78edd0000b02901b79f41c4d8mr13464399pfr.39.1611222658609; Thu, 21
 Jan 2021 01:50:58 -0800 (PST)
MIME-Version: 1.0
References: <20201217140933.1133969-1-robert.foss@linaro.org>
In-Reply-To: <20201217140933.1133969-1-robert.foss@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 21 Jan 2021 10:50:47 +0100
Message-ID: <CAG3jFyuzjbPsMBOOgc2DBBT92H7FPBNdJLKWHF8+7K10LujMbw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: lt9611: Fix handling of 4k panels
To: Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, jonas@kwiboo.se, 
 jernej.skrabec@siol.net, dri-devel@lists.freedesktop.org, 
 linux-kernel <linux-kernel@vger.kernel.org>, a.hajda@samsung.com, 
 Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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
Cc: airlied@linux.ie, Anibal Limon <anibal.limon@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Peter Collingbourne <pcc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

+Sam Ravnborg

I think this patch is ready to get pulled into the drm-misc tree.

On Thu, 17 Dec 2020 at 15:09, Robert Foss <robert.foss@linaro.org> wrote:
>
> 4k requires two dsi pipes, so don't report MODE_OK when only a
> single pipe is configured. But rather report MODE_PANEL to
> signal that requirements of the panel are not being met.
>
> Reported-by: Peter Collingbourne <pcc@google.com>
> Suggested-by: Peter Collingbourne <pcc@google.com>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Tested-by: John Stultz <john.stultz@linaro.org>
> Tested-by: Anibal Limon <anibal.limon@linaro.org>
> Acked-By: Vinod Koul <vkoul@kernel.org>
> Tested-by: Peter Collingbourne <pcc@google.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index d734d9402c35..e8eb8deb444b 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -867,8 +867,14 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
>                                                      const struct drm_display_mode *mode)
>  {
>         struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
> +       struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>
> -       return lt9611_mode ? MODE_OK : MODE_BAD;
> +       if (!lt9611_mode)
> +               return MODE_BAD;
> +       else if (lt9611_mode->intfs > 1 && !lt9611->dsi1)
> +               return MODE_PANEL;
> +       else
> +               return MODE_OK;
>  }
>
>  static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
> --
> 2.27.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DF627BDC2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5FD6E450;
	Tue, 29 Sep 2020 07:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1616E192
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 00:12:00 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id o25so2384315pgm.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 17:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=oqWyH6KVz5GIgpx9XiQ64/ocouDLY41IiN7VadeGWLY=;
 b=Hm7mijcf4yTe2S04g2+xRURW1lE1jbPN3E3nOMLrSEei6s4g6gKBOEdcu9tYXNqCPa
 Wj+U5w2mOsd0BDZsyYLCChOLht0aFCuDGSnPiBYMMM/r4zsP03KjZYNNlN7uQ96zWTrP
 jxYeTZ3biQA3MY34GNhI7u3zESWw7RpIq/030=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=oqWyH6KVz5GIgpx9XiQ64/ocouDLY41IiN7VadeGWLY=;
 b=LH67NvQst6uA5aZFBR0yKS1nwLOC1/6JmhZzDGuKY0P5+Ziq/MkvAENceTQeuk968a
 ghkgFMRGi7enmB+jtlLurW+ksTpluPINPbOdMu8cxDYbWL6OD77K0GvjAXJntdn+XxYd
 XOucQNj+mq41r8z/EnJjd0LiRnF9sPsxEEJorxHrOgqiNeRSd9yVmbMt8kJELWu0W638
 MdN5ZbEgcbd18jwYbV9fxXECKGDX6K8CXw3AKye6fPQgba6YJCyB6A6kZbJmCecs1YIW
 HJmxxHUXXYFogjsQZH9EVcNgLqGqqfmFicdKyR9/upFozPgTABsp15bYqumV3Y3yiAc9
 1E8Q==
X-Gm-Message-State: AOAM533taN0WwZLZ8bud/CJZVhek+msq3KfWEGsS8ykDGxYBBktuJHN3
 CBfiWEaEhet6gHAboRl9d/NQKg==
X-Google-Smtp-Source: ABdhPJxVVfU0xg3mWqPJAhBF+FuRzxs4/X7TUAoQRVTfy3Sk1faTdz1q8IeeLCSnhuuFYPzSneX8cQ==
X-Received: by 2002:a05:6a00:2283:b029:142:2501:35e0 with SMTP id
 f3-20020a056a002283b0290142250135e0mr1668976pfe.64.1601338320155; 
 Mon, 28 Sep 2020 17:12:00 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id l5sm117304pjt.33.2020.09.28.17.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 17:11:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200926203454.13643-1-khsieh@codeaurora.org>
References: <20200926203454.13643-1-khsieh@codeaurora.org>
Subject: Re: [PATCH v2] drm/msm/dp: return correct connection status after
 suspend
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Mon, 28 Sep 2020 17:11:58 -0700
Message-ID: <160133831826.310579.7427870479947629849@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2020-09-26 13:34:54)
> At dp_pm_resume, reinitialize both dp host controller and hpd block

dp_pm_resume()

> so that hpd connection can be detected at realtime by reading hpd state
> status register. Also hpd plug interrupt can be generated accordingly.

Can you describe more here? The subject says "return correct connection
status after suspend" so it seems that suspend connection status is
broken. How is it broken? What can be done to see if it is broken? I
think you can suspend, disconnect the DP cable, and then resume and see
that the device is connected still?

What does "hpd plug interrupt can be generated accordingly" mean? Is the
interrupt not being generated?

> 
> Changes in v2:
> -- use container_of to cast correct dp_display_private pointer
>    at both dp_pm_suspend and dp_pm_resume.
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>

Any Fixes tag?

> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index b15b4ce4ba35..63c5ada34c21 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -572,6 +572,19 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
>         dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
>  }
>  
> +u32 dp_catalog_hpd_get_state_status(struct dp_catalog *dp_catalog)
> +{
> +       struct dp_catalog_private *catalog = container_of(dp_catalog,
> +                               struct dp_catalog_private, dp_catalog);
> +       u32 status = 0;

We don't need to assign to 0 to reassign immediately after.

> +
> +       status = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
> +       status >>= DP_DP_HPD_STATE_STATUS_BITS_SHIFT;
> +       status &= DP_DP_HPD_STATE_STATUS_BITS_MASK;
> +
> +       return status;
> +}
> +
>  u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog)
>  {
>         struct dp_catalog_private *catalog = container_of(dp_catalog,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

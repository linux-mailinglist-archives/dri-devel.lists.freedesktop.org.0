Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDFB34868B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 02:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A72F6EB11;
	Thu, 25 Mar 2021 01:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FAC6EB11
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 01:49:07 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id m7so218392pgj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 18:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=lTT11oRd2IP/7R9HW0QYaEhU1Zlu1DFDIzRADDCnLQQ=;
 b=Z+z2A1yAfmKe+FCUbdH4KIOqFTHUUfHCkPioKvw+4xukLDm9HfIDtt02qZwkXLM/SK
 ND1RSq9RFZF3e2qR+20GVfw3hsd6gQ3zn0Q2XZVOLjqr/OmTdYw3vScyzdWZWEhGC9rH
 TlLUDd8ocYtWZsjnlzybGhQpOat8bCD3oD5gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=lTT11oRd2IP/7R9HW0QYaEhU1Zlu1DFDIzRADDCnLQQ=;
 b=B3STTPkh6Te5rHj162ZUxdhw8odBAVEWhsGHdQn1dmU0ayJXvHCLss4X3Xl7d+Acox
 RmhmsUBNVu5E24YnULWPAlk0uT93kGAzPnT4sWOPgDsU5jby8x9RYRFHLleMyS7YkBZc
 KewwWjDsgczrnQP3VglFPCYcCSDns9PlWgaeGJMvtHiwzVjhls4/qCzSj+walgV9Rbb5
 QBDxIfrUlWijIWDg+GqjoVymkoqKww8lAO1Nw85zYOMJ2MPMLv2+0R/ECsT6rqWnL7S7
 t1svjfYZb9KAFBErYwqM2G8BwLilJH9KUd/7mt5tCZylYF7ye7dkrR4eOoM5U/eRGW4a
 +oCw==
X-Gm-Message-State: AOAM531eDJ6AlQ5RP4GWUFxiZRw02Zml2rOJK1cOY+ugHj4eGTbljsnO
 XF0nYw7KmAMhKr0AJfGibZ4edQ==
X-Google-Smtp-Source: ABdhPJyy21bCd9n+vhHQdGXzdNqyTIFIwyuAXQ2gaSqWta5/XpKxeLBm8XOfJtheWbAiseDrIDousQ==
X-Received: by 2002:a63:5924:: with SMTP id n36mr5562187pgb.183.1616636947460; 
 Wed, 24 Mar 2021 18:49:07 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:84ac:62f7:16a8:ccc7])
 by smtp.gmail.com with ESMTPSA id s26sm3750220pfd.5.2021.03.24.18.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 18:49:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210318200544.2244007-1-dmitry.baryshkov@linaro.org>
References: <20210318200544.2244007-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
From: Stephen Boyd <swboyd@chromium.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Date: Wed, 24 Mar 2021 18:49:05 -0700
Message-ID: <161663694524.3012082.11889553997747135632@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2021-03-18 13:05:44)
> if GPU components have failed to bind, shutdown callback would fail with
> the following backtrace. Add safeguard check to stop that oops from
> happening and allow the board to reboot.
[...]
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 94525ac76d4e..fd2ac54caf9f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1311,6 +1311,10 @@ static int msm_pdev_remove(struct platform_device *pdev)
>  static void msm_pdev_shutdown(struct platform_device *pdev)
>  {
>         struct drm_device *drm = platform_get_drvdata(pdev);
> +       struct msm_drm_private *priv = drm ? drm->dev_private : NULL;
> +
> +       if (!priv || !priv->kms)
> +               return;
>  

I see a problem where if I don't get a backlight probing then my
graphics card doesn't appear but this driver is still bound. I was
hoping this patch would fix it but it doesn't. I have slab poisoning
enabled so sometimes the 'priv' pointer is 0x6b6b6b6b6b6b6b6b meaning it
got all freed.

I found that the 'drm' pointer here is pointing at junk. The
msm_drm_init() function calls drm_dev_put() on the error path and that
will destroy the drm pointer but it doesn't update this platform drivers
drvdata. Do we need another patch that sets the drvdata to NULL on
msm_drm_init() failing? One last note, I'm seeing this on 5.4 so maybe I
missed something and the drvdata has been set to NULL somewhere else
upstream. I sort of doubt it though.

---8<----
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c842a270806d..895d74aa8834 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -577,6 +577,7 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 	kfree(priv);
 err_put_drm_dev:
 	drm_dev_put(ddev);
+	platform_set_drvdata(pdev, NULL);
 	return ret;
 }
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

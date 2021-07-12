Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 438DA3C5EE7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 17:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7726889836;
	Mon, 12 Jul 2021 15:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4DD89836
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 15:14:16 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id z12so14130298qtj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 08:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G9baPyoe19aSY4gVB/3oWJMLdAbb4C4qxIoTSkRWfKs=;
 b=fidzIvRNZBVUP6B/wA+TNckKJdtJ2HpsB1mzlLN7JAky5Ot74bN92JSMLxrLzKzeii
 YiD5iB6nv8GuuasMmsdQnfr41naE74briTafCcpO5TLXEpLSvNgHGU7nJj0YreVHLLhx
 N26O5dgEWa36eceGc7lm6KtBS3TOObj6FmlJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G9baPyoe19aSY4gVB/3oWJMLdAbb4C4qxIoTSkRWfKs=;
 b=HEh4mpiVk2Qtvbp1iicjbI3s9xp7KZ46V8kfRxfhcF4ficBnDrGNqiuIRLOaihhsO6
 JmoIkW2EO5L5wfcSEJypn3XW82oy2HN/meetIEesBVmbH9gPnIBLiN+X8z6HWz48UCF8
 rhylbD6dG3L7PUOIavxNAqNbvCPIxuU58HC7ycB6XgQrt0eV3dtrOvnfJ2UKC39K/hmi
 elQjEharoF7k5fgDZnFMLERvR0SH/QlGcR7x03URAj8q40DQVX7yqP8lfjsiWGWQKQR1
 1GxyOVkOjDcqWz+yIURj+ZpnR2ahFttSQRnXCuH/gIjKzvZyVmdaDql3II1RB4CkM/wn
 y7hw==
X-Gm-Message-State: AOAM5314q4lvLRKtvfOdQSFE+DKV5SFUtrT8zui6ih6Aj8J+GTRTqPK5
 T2rCJVa6ZyJGCWzbI/U8epC6Q5xuqCrB1A==
X-Google-Smtp-Source: ABdhPJyoubYD5UAEGlmpxokOpeF3jGaILcptZp54RVobOzWQ7jcNUlXCu0aaQ/DH9Z8AXEX0s3Xb8w==
X-Received: by 2002:a05:622a:11c3:: with SMTP id
 n3mr48140609qtk.211.1626102855706; 
 Mon, 12 Jul 2021 08:14:15 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169])
 by smtp.gmail.com with ESMTPSA id j10sm5684024qta.96.2021.07.12.08.14.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 08:14:15 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id y38so29542827ybi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 08:14:15 -0700 (PDT)
X-Received: by 2002:a25:80d4:: with SMTP id c20mr65334614ybm.345.1626102382992; 
 Mon, 12 Jul 2021 08:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210709152909.1.I23eb4cc5a680341e7b3e791632a635566fa5806a@changeid>
 <67ff22da55104dda57a0015e073cdfcc@codeaurora.org>
In-Reply-To: <67ff22da55104dda57a0015e073cdfcc@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Jul 2021 08:06:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOmJpX1Jwkc+U9_S9f1G8Ta46WXPmu0YRT1YadO6rYOA@mail.gmail.com>
Message-ID: <CAD=FV=UOmJpX1Jwkc+U9_S9f1G8Ta46WXPmu0YRT1YadO6rYOA@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: Move panel DP AUX backlight support to
 drm_dp_helper
To: Rajeev Nandan <rajeevny@codeaurora.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Jul 10, 2021 at 3:29 AM <rajeevny@codeaurora.org> wrote:
>
> > @@ -209,18 +208,11 @@ static inline int
> > of_drm_get_panel_orientation(const struct device_node *np,
> >  #if IS_ENABLED(CONFIG_DRM_PANEL) &&
> > (IS_BUILTIN(CONFIG_BACKLIGHT_CLASS_DEVICE) || \
> >       (IS_MODULE(CONFIG_DRM) && IS_MODULE(CONFIG_BACKLIGHT_CLASS_DEVICE)))
>
> Thanks, for the fix. Changes look good to me. I checked this on Trogdor
> Lazor device.
>
> I have one small doubt, shouldn't we add above (or similar) check around
> drm_panel_dp_aux_backlight() in drm_dp_helper source & header files?
> This function is using devm_backlight_device_register() that needs
> CONFIG_BACKLIGHT_CLASS_DEVICE for compilation.
>
> If that's not an issue,
> Reviewed-by: Rajeev Nandan <rajeevny@codeaurora.org>

Indeed you are correct. I tried trying off the
CONFIG_BACKLIGHT_CLASS_DEVICE and it was unhappy. I've posted a v2
which I think fixes this [1]. I left your review tag off to give you a
chance to confirm I didn't goof anything else up in the v2. Thanks!

[1] https://lore.kernel.org/lkml/20210712075933.v2.1.I23eb4cc5a680341e7b3e791632a635566fa5806a@changeid/

-Doug

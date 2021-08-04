Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3D33E05DA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 18:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727C96E3EF;
	Wed,  4 Aug 2021 16:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FDA89733
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 16:24:36 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 c2-20020a0568303482b029048bcf4c6bd9so2130326otu.8
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 09:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=bPGAJ1O4XY4xsJwp1tio/KzVLh6cCEwMAyfzs69Wdns=;
 b=KOO128q3ZaIvPyPvjxovgNX30WEEa6/W/NpQhKwj13IOSiOJOIsKO/VXr6ItCk5W5O
 fg2gVArGO2n8ipiJ+RhV1fkJZgWm5Df72mRdKsWj9ouiDgQu6iB61BIiK6zbwPydqvTQ
 RkCEQ0DjUHHyamMi8cXB+PUfj1bbuC9YLQpuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=bPGAJ1O4XY4xsJwp1tio/KzVLh6cCEwMAyfzs69Wdns=;
 b=mNaxKLfmD4gjURMTXUsUsbdPyLS9hMbCq7R2Ha3wnSOqYckaLEha+5PZ9fTQG5BABx
 VezTrats7V9lniJBovk6oO6sNlMyhBL+2Me+hLB/gZxnAo199sBXrL+pRrkx1V6f7sKr
 QoXHilH4CePrs2dEWTsE7TWZuPBPIgqP5Zx36uv6PmMTTf8gaaLqiGwpCuu4as6ikTB+
 ikAAJxadA8XWty0H5tooiVMQNaedwDOCeOIqSw+c0FrK5p/hqsSJi9fMMr7/AWS41rwm
 zYhokHALcJElZgY0jt07+HzkUp5RGH4hHyZzK2wtsYMw4C2cj7DJaxcus4XFZsCsjAH2
 P2GQ==
X-Gm-Message-State: AOAM532upMCH1cBdPp7oWgNHu05CMjZDXpjJbsoE/QaRtk1lg9MWmODO
 pTaab22Cd1KUEZdto5+wyp6JfPGwIyzY51jiEveIaA==
X-Google-Smtp-Source: ABdhPJwESZ2fueBO9Cwh5ZfEKrgIdlZyanmaz/kvcpyGNnZR1WLw1cWI+G4ecqRzKDmX26tsafgzDe4YPwUFx/Hsyas=
X-Received: by 2002:a05:6830:1490:: with SMTP id
 s16mr411904otq.233.1628094275464; 
 Wed, 04 Aug 2021 09:24:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Aug 2021 09:24:34 -0700
MIME-Version: 1.0
In-Reply-To: <ab2a7aadb6ada58246ec972c4938c627@codeaurora.org>
References: <1628007913-29892-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n51yNrmrqgDrkj2+c2Bx-bYxNs1m2pQBxvVkSpBH2hxzoA@mail.gmail.com>
 <ab2a7aadb6ada58246ec972c4938c627@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 4 Aug 2021 09:24:34 -0700
Message-ID: <CAE-0n52bpS4mxM+=xxXvxQYSc5p_xyhkPQ07E1ad9uM1ZBKLwA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: update is_connected status base on sink
 count at dp_pm_resume()
To: khsieh@codeaurora.org
Cc: agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com, 
 sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org, 
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting khsieh@codeaurora.org (2021-08-04 08:48:04)
> On 2021-08-03 12:05, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2021-08-03 09:25:13)
> >> @@ -1327,14 +1327,26 @@ static int dp_pm_resume(struct device *dev)
> >>
> >>         dp_catalog_ctrl_hpd_config(dp->catalog);
> >>
> >> -       status = dp_catalog_link_is_connected(dp->catalog);
> >> +       /*
> >> +        * set sink to normal operation mode -- D0
> >> +        * before dpcd read
> >> +        */
> >> +       dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> >> +
> >> +       /* if sink conencted, do dpcd read sink count */
> >
> > s/conencted/connected/
> >
> > This also just says what the code is doing. Why do we only read the
> > sink
> > count if the link is connected? Can we read the sink count even if the
> > link isn't connected and then consider sink count as 0 if trying to
> > read
> > fails?
> >
> yes, we can do that.
> But it will suffer aux time out and retry.
> i think it is better to avoid this overhead by check connection first.
>

Hmm ok. Maybe something is wrong with the aux channel where it doesn't
avoid the timeout if the connection is obviously not established yet.

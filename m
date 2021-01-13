Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAB22F5D74
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D1F6E12D;
	Thu, 14 Jan 2021 09:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9859889259
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 20:22:13 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id b5so1902517pjk.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 12:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=uYdhB/IsYvawJycPiJl/5+j+upKU06AcD0VCLNhUlaw=;
 b=Rnw8wZNgL/NU7d2j/IIT/v+xRriznTX2qmL+omKVWccZWTvuTw7vDiomDS6UqXCVtu
 RDi9A8BkpwgPlvTPdfZPVe2go7pOrs5TIR1bdHo9kHujsG0rM7sKTOUJ+lm0Y8jnkZBb
 VFVtI49gAXxI3why8VhPZj/v+9SFTgJJD2Q6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=uYdhB/IsYvawJycPiJl/5+j+upKU06AcD0VCLNhUlaw=;
 b=DkM3Yw+btMIPe4nfpABQqcA1nQV2O51Lc0CIPSkmRtcV6bxf9xTEAC06G6ZShxMmjw
 lg9y9kKx+n3Fj8iLl3duoBSVT6M83xgLa7/DFApkr/VE6IQFjRzeauH47BA7pveCls/I
 EO9Ugv7ZnFFW5V+ay+R+TuUd9EQbbMA5jhJbgReZETiV4+ZB3JW0dY0XWNANbi9/aYqx
 81ZSx+lM4xBKkL4TtAPs2xJCydMMb/WA8mShImXpcPwQJHzDx+lk8cbhK4PZAX7oygu2
 g3gBXH9K2M9kK+lJY/q6ohkwenIU5BRhSs+JWRHRCGjFODkP2QB7ArOsGC6O12A9M9xn
 kduQ==
X-Gm-Message-State: AOAM531Y1lQYgMwl71kJlSnkWGrNcWD5HOFLG/XEYbrD08ynGXvsuiyp
 DMgkvaUPi4U6wMcBOTFi1f3/SW64h64Pnw==
X-Google-Smtp-Source: ABdhPJyBYSOo7yqM0F3+0FagAGnq8EmkmQDZ6U/aCeqO+pjCFDUxsNUGyXyAWMpF2WReDekTNDdTcQ==
X-Received: by 2002:a17:90a:8985:: with SMTP id
 v5mr1011035pjn.27.1610569332989; 
 Wed, 13 Jan 2021 12:22:12 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id l197sm3488968pfd.97.2021.01.13.12.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 12:22:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <17a116011ae60194834210a4a0c877b3@codeaurora.org>
References: <y> <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
 <1610051425-20632-2-git-send-email-khsieh@codeaurora.org>
 <161039491877.3661239.1387205899512360969@swboyd.mtv.corp.google.com>
 <17a116011ae60194834210a4a0c877b3@codeaurora.org>
Subject: Re: [PATCH 1/2] drm/msm/dp: postpone irq_hpd event during connection
 pending state
From: Stephen Boyd <swboyd@chromium.org>
To: khsieh@codeaurora.org
Date: Wed, 13 Jan 2021 12:22:10 -0800
Message-ID: <161056933099.3661239.9450322359293035316@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting khsieh@codeaurora.org (2021-01-13 09:44:24)
> On 2021-01-11 11:55, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2021-01-07 12:30:24)
> >> irq_hpd event can only be executed at connected state. Therefore
> >> irq_hpd event should be postponed if it happened at connection
> >> pending state. This patch also make sure both link rate and lane
> > 
> > Why does it happen at connection pending state?
> plug in need two state to complete it.
> advance to connection pending state once link training completed and 
> sent uevent notification to frame work.
> transition to connected state after frame work provided resolution 
> timing and start transmit video panel.
> Therefore irq_hpd should not be handled if it occurred before connected 
> state.

Sure that's what's going on in the patch but you didn't answer my
question. Why does irq_hpd happen before connected state?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23552F5D7B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE0E6E153;
	Thu, 14 Jan 2021 09:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69DD6E8A0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 00:00:37 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id j13so2191715pjz.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 16:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=k57ZhRrdloPs/GcEcxbbSOcP9IUvd/QqVLj/vQtWOGA=;
 b=PgROP4CZyTegHbcBGSGPfzlbQ9iKI2HXds7Jv7ExYN4ghND4hn600Tl7055MY/5Mkt
 iL7JRhMLvwikZgba5xx01mAYvFRY7sQnvsHfF9b0mB1BBbifjrCiUrKdfd+Wn/FbMlBA
 NsJwax1laWdmIqQDmj6+/QXl+VcfSjQbhVUMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=k57ZhRrdloPs/GcEcxbbSOcP9IUvd/QqVLj/vQtWOGA=;
 b=jCLyqT6s8DbtzexCtiqGC5+vpz6GvdwAeXLKnGL8f4JMjeRPJqTWLn6QdfQGtN2136
 HA/2xG9SNN/2oC+8o+49G1ymULeNDsAi/PrRH9H/+GvyoaLcSjxc6+dTDiRGr8j2oj6a
 qwH+3yZjM+kulDZSLlup7LvzzGa6HraLCvoNqfN7fQIeHvdqSWCGAdkBjqq/AkD3U8XR
 GwcY2dQrHJhnrZBDW8CJfvxVqiohbos89/VIBqmf0e5bh0cQYDQ8PTRPMX5qvdwY8RQT
 1lcJjC05mLvo1znJYQ8x0xaE544/L0Lc/uu4vHTIRSi8MJAmLUnjNjfZiTIQmaLoQLV7
 375Q==
X-Gm-Message-State: AOAM532bdTX1E33wDrM1cfstFweMba95F3OTLLRI4fFhk6Hl+LZAuvvW
 6hj6ozCqmhGcF9yFxGvSkAceANCfcbft1A==
X-Google-Smtp-Source: ABdhPJwMhTtYcwAsWs3Qi+OwSYJ2CR9NoQDmaOCjU+lahm8EBylFHvEC6lIxGvYRKNkWIFX4SvYUig==
X-Received: by 2002:a17:90a:9304:: with SMTP id
 p4mr1854399pjo.220.1610582437210; 
 Wed, 13 Jan 2021 16:00:37 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id b19sm3591694pfo.24.2021.01.13.16.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 16:00:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <b4a6e7695d12c3191bff75668f386da9@codeaurora.org>
References: <y> <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
 <1610051425-20632-2-git-send-email-khsieh@codeaurora.org>
 <161039491877.3661239.1387205899512360969@swboyd.mtv.corp.google.com>
 <17a116011ae60194834210a4a0c877b3@codeaurora.org>
 <161056933099.3661239.9450322359293035316@swboyd.mtv.corp.google.com>
 <b4a6e7695d12c3191bff75668f386da9@codeaurora.org>
Subject: Re: [PATCH 1/2] drm/msm/dp: postpone irq_hpd event during connection
 pending state
From: Stephen Boyd <swboyd@chromium.org>
To: khsieh@codeaurora.org
Date: Wed, 13 Jan 2021 16:00:35 -0800
Message-ID: <161058243505.3661239.4173340912311093207@swboyd.mtv.corp.google.com>
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

Quoting khsieh@codeaurora.org (2021-01-13 15:44:32)
> On 2021-01-13 12:22, Stephen Boyd wrote:
> > Quoting khsieh@codeaurora.org (2021-01-13 09:44:24)
> >> On 2021-01-11 11:55, Stephen Boyd wrote:
> >> > Quoting Kuogee Hsieh (2021-01-07 12:30:24)
> >> >> irq_hpd event can only be executed at connected state. Therefore
> >> >> irq_hpd event should be postponed if it happened at connection
> >> >> pending state. This patch also make sure both link rate and lane
> >> >
> >> > Why does it happen at connection pending state?
> >> plug in need two state to complete it.
> >> advance to connection pending state once link training completed and
> >> sent uevent notification to frame work.
> >> transition to connected state after frame work provided resolution
> >> timing and start transmit video panel.
> >> Therefore irq_hpd should not be handled if it occurred before 
> >> connected
> >> state.
> > 
> > Sure that's what's going on in the patch but you didn't answer my
> > question. Why does irq_hpd happen before connected state?
> 
> I have no idea why it happen this way.
> during debug 
> https://partnerissuetracker.corp.google.com/issues/170598152
> I saw two different scenario
> 1) irq_hpd followed by unplug with less than 20 ms in between. this one 
> fixed by this patch set.
> 2) plug followed by irq_hpd around 300ms in between. it does not cause 
> problem. but it should be handled in order (after connected state).

Ok. So nobody understands why the hardware is acting this way and we're
papering over the problem by forcing the HPD state to be what we think
it should be? That's not great.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AA62F5D7D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2A66E145;
	Thu, 14 Jan 2021 09:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6C589259
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 20:21:20 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id v3so1701161plz.13
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 12:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=u6R4AQJwna1Zvnrc86J9azzfneuprQEtwwFsQuVc3og=;
 b=iGXcSZ3vf/7+lrMXeBvMLEppSiK1QOGxXONM1Ag/hWB8KQDBSrKEAAFvMTVAdX8mo2
 904o7LBICMF1rvrHUaBQjuc6HXgMDjU58eUM9Bo7IEbtvn1CjU0CPmJprq1EE7mt5lrJ
 kMGx+WtjLTWHCgokFZwc9UoaNZ94W7yzydDh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=u6R4AQJwna1Zvnrc86J9azzfneuprQEtwwFsQuVc3og=;
 b=NGmC3JbcNmzPnVhM6IOmm0cmPGy4kJZcrk+a38mgOAscEaYA/pxCvkJdtI2SGmMTAX
 runM3ONBtOAi4VLv9mXgRQhwxtgTCdkVeTRLmfCATG/0nDRAMvUcAmXCvuk46ZETeBXP
 TeFzvLpNThtpr/yOP7CgisYLgrsUOdbpllxJFn9xZkvjv+MdQhYmNRSCbK5zmonINw9h
 8kRA6XdjnXVRSGozCLCRV/xs8ZbHrfI+NC3Co4EtOHqWWkKX0xYTscm6zfpPrrVsWL9R
 YpjSr61Kjdib6ABiYfTLByPBCnm8p2G6XtJvCQC2yR1z9YrZAueGlm9hHu+5O5ot2vmD
 vL2g==
X-Gm-Message-State: AOAM533Wo1vejs/RPvti/EuNc/8fk0OjkAWO7r9AgVagv13jUG1gcrWk
 /Q/RIXFYj2b3Xczky42kCTxTLBl20B1bJA==
X-Google-Smtp-Source: ABdhPJxcze093Ox1ieIVbzxnheFHDjdf8Jr9Y7KtYj1RjSs7J3v7DkFm1CU87BqHfMy/L0UhxaPWgA==
X-Received: by 2002:a17:90a:3e4f:: with SMTP id
 t15mr1038628pjm.57.1610569279973; 
 Wed, 13 Jan 2021 12:21:19 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id g26sm3323866pfo.35.2021.01.13.12.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 12:21:19 -0800 (PST)
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
Date: Wed, 13 Jan 2021 12:21:17 -0800
Message-ID: <161056927774.3661239.6186577459996584479@swboyd.mtv.corp.google.com>
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
> > 
> >> are valid before start link training.
> > 
> > Can this part about link rate and lane being valid be split off into
> > another patch?
> > 
> ok, i will spilt this patch into two.
> I will merge irq_hpd event part into 2nd patch (drm/msm/dp: unplug 
> interrupt missed after irq_hpd handler).

It looks like Rob already picked this patch up

https://gitlab.freedesktop.org/drm/msm/-/commit/2b5f09cadfc576817c0450e01d454f750909b103
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

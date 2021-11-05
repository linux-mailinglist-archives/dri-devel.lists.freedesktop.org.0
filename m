Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A8E446AEE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 23:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9666ECD9;
	Fri,  5 Nov 2021 22:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282DD6E84D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 22:33:03 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id l15so16757029oie.8
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 15:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=fWPW6vOrV4yWuNKQyKDDkLamXrngpvFNOzlcY43dNqs=;
 b=iKVG85gppzXqEaEOcL5Bb84m05PjYOdlnIwqPMXq+hWd3vGImllScnpAoM8rou02x6
 zYzmGPkKPG7RowxQPg4xyPG3c/FKplaDd2p/I4ccOzLnNlzFKWulOb4CUOHAjMOZBCG/
 axL+CUfZ9a8YWytneRUIm9D4Wx2ZZB7f5YCZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=fWPW6vOrV4yWuNKQyKDDkLamXrngpvFNOzlcY43dNqs=;
 b=ubUDtfeM5rOa14hJhHka/Yjir8eh/4w1LKXQpWghRoG6WlEOAf4yh24q13lrWtQ4i2
 LYjcfCILz3EjNMyeL8n6HmT//jwRTCIGhUezKz0CUG6VU3GAydWPN2wsWNzLsCdjgSEQ
 8iyx/d8Fy18Xjm89aHurD45KaiBiRtQtd37c98G6H5dpLwJc7Mn9t6OIYjgZXTU3YWre
 kZRYtDM97SFfKcYddXBX0IouoXvIizpHl9H+NffknX0P1vEHy10vJQucbTjZ3s+XXfjd
 XLlsvZ9bKVPie01nd7EyQ3kKxHZpwo/ZPwrRNSeBW37Q8yXVquLTvnDZcXZmz/1tSRDp
 3fgw==
X-Gm-Message-State: AOAM530hJ8B41Oanw8bvNwv/o7sINa/MyziT01+P8sdleYCc+LpR7w4V
 pTYyB/SMbFeZqXVIUlUTe1Dqo94clq8MP9yJ+fQCTg==
X-Google-Smtp-Source: ABdhPJz+sZay+XktcSS+5myteHfFnaSYRjh0L2fXVqz51OpDz37VcMg34X0qvr4jMDBdhRGzkOJ7h2s7RmQz9/39vB0=
X-Received: by 2002:a05:6808:a96:: with SMTP id
 q22mr16520113oij.164.1636151582339; 
 Fri, 05 Nov 2021 15:33:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 5 Nov 2021 15:33:01 -0700
MIME-Version: 1.0
In-Reply-To: <YYVudQzp8Kxweewq@ripper>
References: <1636133291-10551-1-git-send-email-quic_khsieh@quicinc.com>
 <YYVudQzp8Kxweewq@ripper>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 5 Nov 2021 15:33:01 -0700
Message-ID: <CAE-0n526B0_ZyyPs++cVUHy9w+ruadLY7BzYuDH8acn5qq6A_g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: do not initialize phy until plugin interrupt
 received
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: airlied@linux.ie, freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 aravindh@codeaurora.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-11-05 10:48:37)
> On Fri 05 Nov 10:28 PDT 2021, Kuogee Hsieh wrote:
>
> > From: Kuogee Hsieh <khsieh@codeaurora.org>
> >
> > Combo phy supports both USB and DP simultaneously. There may has a
> > possible conflict during phy initialization phase between USB and
> > DP driver which may cause USB phy timeout when USB tries to power
> > up its phy. This patch has the DP driver not initialize its phy
> > during DP driver initialization phase. Instead DP driver only enable
> > required regulators and clocks so that it is able to receive HPD
> > interrupts after completion of initialization phase. DP driver will
> > initialize its phy when HPD plug-in interrupt received.
>
> Is this a hardware requirement, or is this a issue with the current
> implementation of the QMP combo phy driver? We should not hack up the DP
> driver to circumvent the latter.
>
> Also, I don't suppose there's anything here that prevents the HPD to
> come before the USB PHY is powered up? Even though that seems less
> likely in practice...
>
> > This patch also provides a positive side effects which balance regulator
> > enable count since regulator only enabled at initialize phase and resume
> > and disabled at followed suspend.
> >
>
> Is this something that needs to be fixed separately, so that it can be
> backported to stable kernels?

Agreed. Please split the regulator balance problem from the DP
initialization delay.

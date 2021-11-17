Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C812145411C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 07:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1FD6E241;
	Wed, 17 Nov 2021 06:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2B36E249
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:44:41 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so2967986otj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 22:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=4KLLnT3lbE++1zW9IFNlDp63h9Sm/+5C3hvYnuVhVto=;
 b=Pou//tJ+XTHrkeW/AllQYZpDimofzYxEc7jVKrltzTA3GjLP7+nyqqdUg7UgoOcl0P
 NeahRDIxD6QXIcKG5oT/GnvwX2bYABXdVEn8lxIwicbPnLhKrhPeq8CxOAxtQwleVefn
 o33v1ohDjye4Z3ztHsH0vrGjImvOhvUoqvRRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=4KLLnT3lbE++1zW9IFNlDp63h9Sm/+5C3hvYnuVhVto=;
 b=ndRenL7zAqP0dy/3ztibo/u7ggukrIp9UHLkmfDR0uFRZNvvaJZiIeZCepGNPp0iho
 M5IER11iBG//kG5Qdz+TgP5zduA8vMTHmVdZmtXBQNssY50P82QUQJ/s5LWK3H4bPLMc
 ibHewiHK3FxJ9pYJhlcKAurwf8gf4K2rac9BVQk+cVhdWmLkE4u8tO+IYvlriz05rGDS
 wwKrI5a7FfavpH6lQcDeDMFFWg9dtO+Eu0Sb6LsHRMptvqYUNuxh9gZFggBRJ2QiR2RF
 IaqkNBzkTuBuXpxMXHXdJHoymAIU8h0KFQmX1UOE+Txy8hDsbyg5YnYjaJkutM6oBa/r
 wgZA==
X-Gm-Message-State: AOAM533yW4bD9umV4KsA5+ggHdXpNeKoDQqTUhUQ5mfr5VJowPx5xvK6
 JC8y4DDsjU+8zTEeATRw013Qv9nmAxYzu0pGh9daIw==
X-Google-Smtp-Source: ABdhPJzyXkbDI3NrFOfsZtutYyMeBpAr8cH2dtM4PqNy4KOdAZHLaC2NYpVU1JLU58nPIOoLn0OLZ322dDNO0JgsrYU=
X-Received: by 2002:a9d:7655:: with SMTP id o21mr11601317otl.126.1637131480911; 
 Tue, 16 Nov 2021 22:44:40 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Nov 2021 22:44:40 -0800
MIME-Version: 1.0
In-Reply-To: <1637046458-20607-4-git-send-email-quic_sbillaka@quicinc.com>
References: <1637046458-20607-1-git-send-email-quic_sbillaka@quicinc.com>
 <1637046458-20607-4-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 16 Nov 2021 22:44:40 -0800
Message-ID: <CAE-0n50jpAq7jynEL5opHJd06zThUaWVzLvc_zidi-qYUxiwcQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] phy: qcom: Program SSC only if supported by sink
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_abhinavk@quicinc.com,
 quic_khsieh@quicinc.com, seanpaul@chromium.org, quic_mkrishn@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2021-11-15 23:07:38)
> Some legacy eDP sinks may not support SSC. The support for SSC is
> indicated through an opts flag from the controller driver. This
> change will enable SSC only if the sink supports it.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

I suppose as long as the existing user has already chosen to set the
opts in the controller driver then this is fine.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2382B1EC165
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 19:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F22D6E44A;
	Tue,  2 Jun 2020 17:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567D76E44A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 17:52:34 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id c17so7922658lji.11
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 10:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HZgulanud4yuYVbSEY2anFOdC3z8THltqCrqmdc0mYo=;
 b=dO9rC6U35ZJVsEEqeyiT2wqhpSYN9ZFHMHcUxncLMNKJV//15BuMSc2wnN6tjCAEjn
 TGbDcIgy4BS7Dl6Cg5LOM9okR/1FIFpXnuFgZF/LIexlxoI3jpg6+QOS+Cg58yW6wyS0
 WKG1Dr+gmDrfMfj0ZKPlm+bWhBzIbkCDIV20Wt9UtHpsMOJ02zBPUAQKeii04sISDLAH
 OFTa8PehKlXok+f1TsVFQUCaXwQrxXJ1Fs8Rlms6BmuU2aMwAmixXfMXCSvFxUbiHbCB
 XNxz8DVWLPEzDOlU65p4syvY0bUbOKKy2msR0RdtwqXQE4eqWdmg7pTz1Q11FqLhyGlY
 +y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HZgulanud4yuYVbSEY2anFOdC3z8THltqCrqmdc0mYo=;
 b=DLqnMy0rvqzwR8MK7wqb8+TDWhWtVa3sJ/1+2LNMS00VCmDqjNw+P+0/C0AZrfgq+l
 nW/+SZDw7SXz/VWCUM3pjCL/97iH1GMLT4H3v22viq6fFRndeiuU9RiWjLcpV5uOvl5h
 ItRBHSbtFve2ed/k7ziKtNQFh6wWOzoMKnlc0KPO41e73/YTsiZYY43dKQNiWtrp6KyX
 GQouZwXeAbLIVzb+8VDa3p5ABbs8JDijFW8vO9ntGfa40pFLSCdwjjNlt9q7hLDicGA+
 B50aeHdgnuh1Pm5k8EPYssK7fzCokSIt9aOtlq6g4mMM4dAZDwV+S8HGiCc7y09Pzh1C
 35OQ==
X-Gm-Message-State: AOAM532aO8DLXctHPAwPdkRcdUMcpndVFBO7cNcEpihS1BsSRp5tFNay
 ARdhnRtRqSleAoWMUmvBoEppJ59X8IsV/362Ve0q7Q==
X-Google-Smtp-Source: ABdhPJyb9Q+yOpWaTEJsS6SMTCHwieIBoNC2oRXbg7gqhPZ+it4nX/xFtvhER8sXJsj/q7/Cf6w1wYITBiLYGaiqulI=
X-Received: by 2002:a2e:8ed3:: with SMTP id e19mr135042ljl.367.1591120352694; 
 Tue, 02 Jun 2020 10:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <1aaadf9a5176591c891622cb00b0c50f42e569dc.1590594512.git-series.maxime@cerno.tech>
 <CADaigPWQdeTd2CGCK-yxq+TAU6xKMVsdZfhSVptn4RSENxpdxg@mail.gmail.com>
 <20200602125227.fe3mt5jnqd6u4pft@gilmour>
In-Reply-To: <20200602125227.fe3mt5jnqd6u4pft@gilmour>
From: Eric Anholt <eric@anholt.net>
Date: Tue, 2 Jun 2020 10:52:21 -0700
Message-ID: <CADaigPUYwmwcFDtH3ZtyDaGWvutAYSX=JuMhXh2EtfNVLU6iDQ@mail.gmail.com>
Subject: Re: [PATCH v3 015/105] drm/vc4: hvs: Boost the core clock during
 modeset
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 2, 2020 at 5:52 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Eric,
>
> On Wed, May 27, 2020 at 09:33:44AM -0700, Eric Anholt wrote:
> > On Wed, May 27, 2020 at 8:49 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > In order to prevent timeouts and stalls in the pipeline, the core clock
> > > needs to be maxed at 500MHz during a modeset on the BCM2711.
> >
> > Like, the whole system's core clock?
>
> Yep, unfortunately...
>
> > How is it reasonable for some device driver to crank the system's core
> > clock up and back down to some fixed-in-the-driver frequency? Sounds
> > like you need some sort of opp thing here.
>
> That frequency is the minimum rate of that clock. However, since other
> devices have similar requirements (unicam in particular) with different
> minimum requirements, we will switch to setting a minimum rate instead
> of enforcing a particular rate, so that patch would be essentially
> s/clk_set_rate/clk_set_min_rate/.

clk_set_min_rate makes a lot more sense to me.  r-b with that obvious
change. Thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

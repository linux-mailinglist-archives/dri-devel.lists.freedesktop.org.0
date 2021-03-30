Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA9234F149
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 20:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D272E6E952;
	Tue, 30 Mar 2021 18:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF6989DFE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 18:56:18 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id y2so6637489plg.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 11:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=A1Cm9DKwzI8CvORdDIEy1/TIc9c8R+sdsGDmBgQsdac=;
 b=bmpKFJU8/TpETST1kxi1bOPIfxziXa9chsB5tnTM+0YDM/puKEhUGNgzKasiHR/al8
 f6JJuCL4TJ5Uc823xq+xSgwBzRniXNw7aCv2lWnJF02QEKfZMNPLcSMK7E1SbJqmvsC/
 075H8wWeQG61RXZBG1R7XQ1jPgXIChh6ZKIHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=A1Cm9DKwzI8CvORdDIEy1/TIc9c8R+sdsGDmBgQsdac=;
 b=Q9fbHyVtwHxObOJSv3JpJfcYaND27O2zzBJlfEvf7DZhaV5SA4Cp5wVP8V9ctwJXpx
 FF9A43V81l1MOy6ViWR48/4W6AI5hmeLcuWXD4wDSL5Fym0sR2Eo3si1SAlA1ZUM22Li
 XDpQg3UzT4efXxzZMldXgDUUEoDW5pVkBkr4LMOWt5xvVJjqiErMjlNK3lZ0V9x+eI1F
 Y+q+G2Ao+r85bTPBSFJY3nm39ur1pHik2O6KtlrWyfOYB4/rmBylM6euH0kZKLvnbTtb
 LqKCOd0lpT2u/P6gcRUzhNNEiHeHQfRIkhpkKezVhV1WyyyojZGB5pFGXV1p6kByVI1J
 p5Ng==
X-Gm-Message-State: AOAM532zFNX2gKMxyNTrSGkTRxUUYMIeI4ljvDnmVRvwkjlASlsnhXv4
 UOonPsCREJd3Zqbmb2wo/xqgPIMw2gMLvg==
X-Google-Smtp-Source: ABdhPJx6ssFA3V35D5q1Icohe6M7TsyX+5kBYa9lFs9XO/Eaik1VuChmrs8OYk5LP8unOTL2xOnZqg==
X-Received: by 2002:a17:90a:a618:: with SMTP id
 c24mr5718708pjq.108.1617130577746; 
 Tue, 30 Mar 2021 11:56:17 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:c8c2:b814:df0f:253f])
 by smtp.gmail.com with ESMTPSA id x4sm20545016pfn.134.2021.03.30.11.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 11:56:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210330153527.gw33t4o2b35wwzbg@gilmour>
References: <20210219120032.260676-1-maxime@cerno.tech>
 <20210219120032.260676-10-maxime@cerno.tech>
 <161706912161.3012082.17313817257247946143@swboyd.mtv.corp.google.com>
 <20210330153527.gw33t4o2b35wwzbg@gilmour>
Subject: Re: [PATCH v3 10/11] drm: Use state helper instead of the plane state
 pointer
From: Stephen Boyd <swboyd@chromium.org>
To: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 30 Mar 2021 11:56:15 -0700
Message-ID: <161713057558.2260335.5422873422021430866@swboyd.mtv.corp.google.com>
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
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2021-03-30 08:35:27)
> Hi Stephen,
> 
> On Mon, Mar 29, 2021 at 06:52:01PM -0700, Stephen Boyd wrote:
> > Trimming Cc list way down, sorry if that's too much.
> > 
> > Quoting Maxime Ripard (2021-02-19 04:00:30)
> > > Many drivers reference the plane->state pointer in order to get the
> > > current plane state in their atomic_update or atomic_disable hooks,
> > > which would be the new plane state in the global atomic state since
> > > _swap_state happened when those hooks are run.
> > 
> > Does this mean drm_atomic_helper_swap_state()?
> 
> Yep. Previous to that call in drm_atomic_helper_commit, plane->state is
> the state currently programmed in the hardware, so the old state (that's
> the case you have with atomic_check for example)
> 
> Once drm_atomic_helper_swap_state has run, plane->state is now the state
> that needs to be programmed into the hardware, so the new state.

Ok, and I suppose that is called by drm_atomic_helper_commit()? So
presumably a modeset is causing this? I get the NULL pointer around the
time we switch from the splash screen to the login screen. I think
there's a modeset during that transition.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

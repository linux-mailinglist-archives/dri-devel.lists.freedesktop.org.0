Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E7B40F091
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 05:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F51C6EB49;
	Fri, 17 Sep 2021 03:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAD56EB4E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 03:53:51 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 c8-20020a9d6c88000000b00517cd06302dso11105906otr.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 20:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=si11JPg2tUx3AsVeQ/TovCztnetl7T3psWWpp1fS5lA=;
 b=DZOnQvfjYVw2eK0gwNwwxEXWEm5xLno5eGrvLjhgQGrgMCGhtM4kv/W42j9sLJbi3O
 pcEBZnF0iu+0HiMKill8pmsE1UQpkECyjgiq3K0ICvlL6rldHZyw/e152XjZ/43P2ZnG
 mzjiCCe9lkGDxEZvO+/SMpdWDYkRwaGvJ8SB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=si11JPg2tUx3AsVeQ/TovCztnetl7T3psWWpp1fS5lA=;
 b=u5xdCLsiIEFcahhnOOiubYJ7qMXd/uwx+cluCoOSTe0GsQMMolmz3t3C44SI8Fw81w
 Mq6Xk/lxZv0M3VuTOoCjLQI/z6KRHblaSXyQcpzeIlVQ7++Bx7TVmUXZBwO76e19aL2d
 xJ5PJP0rNK39D7/MvsoqK8RqG17yuCW+QMJV7DEX7Gv5otbCEpWJ/LIQmdnhRx8QFC8U
 ECqD4dszFrMKiPnq348JC9dz8bpM6NAiGLBnqhxta62ElR2Y3U9XQwtg2lzS9T/E096X
 gMHP3gWbsh6qmflFJE0mHIESt3VOWBvQ7XQaCsAXji2dS6sgduuyOROT63nqFfp/+rAc
 LsdA==
X-Gm-Message-State: AOAM533BPAcjwyQSKSmancKz12jeDqOz3drA/o41QVl5VgTXci/su8zf
 UFPKrkU0Ybr72D7WlDBdbzq3Kgzs7X8SnZQLWkyvMQ==
X-Google-Smtp-Source: ABdhPJy6tPkXKq2HM2Xabj28+m9bCyAX8hcbLJrNjiL+b85iLZXT99WZxbBBCWiIknpSoYbGwM1DrBLiHpKljB+xkBQ=
X-Received: by 2002:a05:6830:18c7:: with SMTP id
 v7mr7659104ote.126.1631850831069; 
 Thu, 16 Sep 2021 20:53:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 20:53:50 -0700
MIME-Version: 1.0
In-Reply-To: <20210915203834.1439-11-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-11-sean@poorly.run>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 16 Sep 2021 20:53:50 -0700
Message-ID: <CAE-0n53uAEcj8Rpx36cRUU34k9mqtg2_tiXW_4+CYmrcihguHg@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] drm/msm/dpu: Remove encoder->enable() hack
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
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

Quoting Sean Paul (2021-09-15 13:38:29)
> From: Sean Paul <seanpaul@chromium.org>
>
> encoder->commit() was being misused because there were some global
> resources which needed to be tweaked in encoder->enable() which were not
> accessible in dpu_encoder.c. That is no longer true and the redirect
> serves no purpose any longer. So remove the indirection.

When did it become false? Just curious when this became obsolete.

>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-11-sean@poorly.run #v1
>
> Changes in v2:
> -None
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>

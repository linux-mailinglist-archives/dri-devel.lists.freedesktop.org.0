Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8D83D2C69
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 21:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D766EB1A;
	Thu, 22 Jul 2021 19:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2AC6EB1A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 19:08:04 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 59-20020a9d0ac10000b0290462f0ab0800so6272006otq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 12:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=scp+1rc24jdnxfL7eF19kK3DL+3J9gDohwlrgvGebZ0=;
 b=Kzg1+v+ASBz1l6YFdUYjoIJ1ycL30KyMVNUxiZbSsy/9xwgH7nYvbx0C2luXa/RK6v
 hHxo0L2IjE8alE4iJAA9A3eGelmKnpSy2X9ID5+zVi+2oucyhkHRSZFjbrdICtI1EGtp
 EERE2M2fk6+PWXVFGXH8veERzxrjmQZPsQdMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=scp+1rc24jdnxfL7eF19kK3DL+3J9gDohwlrgvGebZ0=;
 b=Hb3pi9cdXyw2lAErA2gpCSJncU12+CEyytRQdVmHtKCVBQI3p1YIcdm/mb2EW7TRA/
 Gqi0OBKONbBrfMcAxp6+tqna5s2714OPsUlZCFB97rtE45w/v9lpLlJ5k2zwyYGIDSDO
 rwlnUO6m1hbTaIMb0T8jCqhgEaWCkN6ZBBhUyTLLBP/QyvnwgUTsx7Xzct9LadBY4aui
 rJKoq+/jy7uN6QMzBzmt5ReGH+5VTon+qB7inQr9+mKL/RzzB73fp9ZjjdwvMRTwI+ZV
 30GQi8HOu7nVqWtDMNhlMH/EPfOaJIr1F9x46YP9tERY+anp6HU7mUB6MCBP9Bz049vr
 wpXA==
X-Gm-Message-State: AOAM531g/sU0oIRpi9V1Khv24m9XaESzSdMbw1wGsnabjcgTPlw2Wnat
 tfRW4XVH2KiHEXirQSJBlnVOH7s0DPtzvqyVEV3Xug==
X-Google-Smtp-Source: ABdhPJzKPYX4blphNqYsrnAPfYagc8nG5lxdFDRdRvNxCcZa50YCfFPtbMdNhV6GjS7SG0R1yOQPOpaxxJ5vYACZZ0E=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr838011otl.233.1626980883940; 
 Thu, 22 Jul 2021 12:08:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:08:03 +0000
MIME-Version: 1.0
In-Reply-To: <1626191647-13901-4-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
 <1626191647-13901-4-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 19:08:03 +0000
Message-ID: <CAE-0n5121VG4V9mqw6UTj2T4DrN66r53aCONMJr4bqe_niHz_w@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] drm/msm/dp: reset aux controller after
 dp_aux_cmd_fifo_tx() failed.
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-07-13 08:54:03)
> Aux hardware calibration sequence requires resetting the aux controller
> in order for the new setting to take effect. However resetting the AUX
> controller will also clear HPD interrupt status which may accidentally
> cause pending unplug interrupt to get lost. Therefore reset aux
> controller only when link is in connection state when dp_aux_cmd_fifo_tx()
> fail. This fixes Link Layer CTS cases 4.2.1.1 and 4.2.1.2.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

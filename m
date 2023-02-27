Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEFF6A4BB7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 20:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0364F10E3D6;
	Mon, 27 Feb 2023 19:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF61A10E3D6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 19:53:46 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id z42so7684941ljq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1677527625;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=6Iog3w5RRep9QzX37UOT5VU6YtZPIJP1phd7Cipxg/4=;
 b=MlrScDn0uLRC083HdGy5QHOQFhYZ0UhHe8h98ssx4wE9iG2IlU14pW+svk1bwuUUXh
 lmtOrZ6TQLAstp4sXJgny76pWW++iPT2/N4XgNoaAf8qXxmrxDckPD8YuKhA56ZQADXO
 5iufKDnd0bCNkJlQHhteTngGIXOEme+n5fX80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677527625;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Iog3w5RRep9QzX37UOT5VU6YtZPIJP1phd7Cipxg/4=;
 b=Wg91qHZqHlsjznhdXzxOqm2KOa+PtOVyPzfdneWR7WC8YEtiazpcYSZivvMFtUOjbu
 PTIABl2oVSuYPXr50ySV8b9z/NUpVKnlLJu2S+kR5pCxzb+KB1u/voB2J4lKnnr3JNRP
 anB/7CSQ4BbYuYpOwRp3UdKCCH2q3d9DVL2mhSB5/9nr15K/dLqNAk2N5V1IrDXvUsyB
 sIKobVZlmzGg528fQLpAduGf9wQDNEgcHSMUnAgkIDiRuo4ATFQVho5hnnZOmgli3W/f
 kac6SzglITvOxCC9hEvQojTuGjD5RlkZwxlnM1dnr7EV23BFvU1j6soUsSTH2sGv3uDz
 t94A==
X-Gm-Message-State: AO0yUKWy0tGRzksSMasqQftXalFhZ3vmvQSHb7oPK5aSsY7sPCoQNJtu
 aVBZoArxkqV/nIIB/qK/7QfB8NUwvTrHlZQA9zmTlg==
X-Google-Smtp-Source: AK7set9u/nN5Vzao374dais8uxKf3RxzP5pIYQ6lkrJ2r0ZXV/mqpKtvXzlYxqTmuIGQ+TLof9Pu75FYo+aKuNXKi3U=
X-Received: by 2002:a2e:a4b7:0:b0:295:897c:6f7a with SMTP id
 g23-20020a2ea4b7000000b00295897c6f7amr6940229ljm.0.1677527624730; Mon, 27 Feb
 2023 11:53:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Feb 2023 14:53:44 -0500
MIME-Version: 1.0
In-Reply-To: <1677263398-13801-1-git-send-email-quic_khsieh@quicinc.com>
References: <1677263398-13801-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 27 Feb 2023 14:53:44 -0500
Message-ID: <CAE-0n514WpXDhE17DzqF9X7DYg_3DYuYSGzhvx-=eXVJpgq3Yg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: check core_initialized flag at both
 host_init() and host_deinit()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 airlied@gmail.com, 
 andersson@kernel.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2023-02-24 10:29:58)
> There is a reboot/suspend test case where system suspend is forced during
> system booting up. Since host_init() of external DP is executed at hpd

dp_display_host_init()?

> thread context, this test case may created a scenario that host_deinit()

dp_display_host_deinit()?

> from pm_suspend() run before host_init() if hpd thread has no chance to
> run during booting up while suspend request command was issued.
> At this scenario system will crash at aux register access at host_deinit()
> since aux clock had not yet been enabled by host_init().  Therefore we

The aux clk is enabled in dp_power_clk_enable() right? Can you clarify?

> have to ensure aux clock enabled by checking core_initialized flag before
> access aux registers at pm_suspend.

I'd much more like to get rid of 'core_initialized'. What is preventing
us from enabling the power (i.e. dp_power_init()), or at least enough
clks and pm runtime state, during probe? That would fix this problem and
also clean things up. As I understand, the device is half initialized in
probe and half initialized in the kthread. If we put all power
management into the runtime PM ops and synced that state during probe so
that runtime PM state matched device probe state we could make runtime
PM be the only suspend function and then push the power state tracking
into the device core.

>
> Fixes: 989ebe7bc446 ("drm/msm/dp: do not initialize phy until plugin interrupt received")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

The code looks OK to me, so

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

once the commit text is cleaned up to indicate the proper function
names.

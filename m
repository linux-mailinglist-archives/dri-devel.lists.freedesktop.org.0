Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194376726C1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 19:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAF310E07D;
	Wed, 18 Jan 2023 18:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4190210E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 18:24:43 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id o20so20965857lfk.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 10:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=Na6xMADEzYhZzXrlHJxxzhXM5YRKt3/PwZV0GUrKKGc=;
 b=FtbWDIbw43u/20f6aUHdQZhGNF5q7hwzxM44DWYHHZguw4CyS+ovFhwIGEtmOHfbj9
 I94uNKk6/UXOxgfSZKCPkOSVywK307UXAxAhrHPaBiplbKj8UD7F85O5zsEjYiafZ4eP
 vTQhrJ/8od1gBb2UvbLmF2hi3hTlYVOQ84Jp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Na6xMADEzYhZzXrlHJxxzhXM5YRKt3/PwZV0GUrKKGc=;
 b=Jn4/f6THydzJ8FxRwZ9QcceebWOzj8qK0oiHZome+ojN4DKcshEZyEwQaws4LtdIPe
 Z8BC9qtMCrWQSI6pYsPx7SOutqwHLcrOZE7eSTY449UBqobhJTkGMKtQYfcFoAKr/LpM
 7gsR0bnO1/F7vvXmhu8sI4uvA8PvPcAs/Be5YlWOeCuBc2tm7WVEEX7i7rQViLTyNlks
 ggjRf40FevncXZJ3z9ZPjmBAiYe6Lp43vdZBcOg9xYpB3Mhe+QAyk8+4Kd8mpwpPy3XK
 FMhnQ+PnuHvdp4aUTLfZuxw0dQ35gZq/C0s1SyItJ2toWIumpqlggW8VAQPHWN2Jbokk
 mVZQ==
X-Gm-Message-State: AFqh2kpcN62FFnpdHiXNxkBKv2q7TGO0qRV8Ky4/EndwIcwYjmIt4RON
 PQvkB7LiDOMQXb263pRFoq68bxOqlAeIRxLyuEuk1fI81Vnexg==
X-Google-Smtp-Source: AMrXdXu8H4rHNVOE2wtoG3S0Z9KJVoxXo4Da1sSK6RbMP0C1hgRXWtHRAK5N7Qtj8aQOi1yS8Qs1CTyTfwDonhSoIJg=
X-Received: by 2002:a05:6512:2114:b0:4bd:35fd:65b5 with SMTP id
 q20-20020a056512211400b004bd35fd65b5mr759204lfr.297.1674066281456; Wed, 18
 Jan 2023 10:24:41 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Jan 2023 12:24:40 -0600
MIME-Version: 1.0
In-Reply-To: <CAE-0n51XmyzSeKuGNn2BsJew3fK_cEHNoDpVVRqStNAF+Zzp1A@mail.gmail.com>
References: <20230106030108.2542081-1-swboyd@chromium.org>
 <Y7nV+aeFiq5aD0xU@ravnborg.org>
 <CAE-0n50QOv_+j1Pe19xKj4Cx2Y5_Ak5Kt68UBJuZt10D-jQ44g@mail.gmail.com>
 <Y8FwGTWeYtX0j8MX@ravnborg.org>
 <CAE-0n51XmyzSeKuGNn2BsJew3fK_cEHNoDpVVRqStNAF+Zzp1A@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 18 Jan 2023 12:24:40 -0600
Message-ID: <CAE-0n51HAkYAcGdsJ=0gbV7JRJSGt9cZ_vHPC3kDepa4rooyvg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed
 during disable
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Stephen Boyd (2023-01-13 12:49:43)
> Quoting Sam Ravnborg (2023-01-13 06:52:09)
> > Hi Stephen,
> > On Tue, Jan 10, 2023 at 11:29:41AM -0800, Stephen Boyd wrote:
> > >
> > > After this patch the unprepare only bails out early if the bool
> > > 'prepared' flag isn't set.
> > OK, then everything is fine.
> >
>
> Doug pointed out that enable isn't symmetric because it doesn't do the
> DSI writes. I've updated the patch and I'll send a v2.

Turns out that splitting prepare into prepare and enable breaks the
display even more for me. For now this is the best patch I have and it
fixes the regression I see in v6.1 kernels. Can I get your Reviewed-by
on this patch?

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A88664C75
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 20:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F279310E494;
	Tue, 10 Jan 2023 19:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2EC10E494
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 19:29:44 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id bn6so13612252ljb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 11:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=C0mrhoty+Ut/5gp43tpMbErT7DWwGt+4GLr6GpRkjbQ=;
 b=i1+w0zA7s1qv8jt4zUE+emrBPpmeSdaUBPz0yCFo1nbNg9YBG5C9AAvS4RNrL0co/Y
 dqSyexwdFchejaYEPv5Wfg4lBoPaVxUCnM4E9fys7J60ul6YlINQL+lxBN5cjLvLT7fy
 V1Xpg8rHHMcctUni8OS7+vepJW4M0IZKby69k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C0mrhoty+Ut/5gp43tpMbErT7DWwGt+4GLr6GpRkjbQ=;
 b=S/ahaQiZQmdkvnBNY3lCwDbbnKMGTA9Zedo4IYMZHMjpWSCMuUzEVHP3h0ddBREjcL
 1+CiS13xZDfEqf1ZJtoe2uBCAWdTr5c0NfReMv5WIZ/Vy5+CopJJETltnDtlNirXqtJr
 qblskJqT97uXGKNrEJdLDp1HEZwnK5S73XrlWQafSzKZvB29jxfNHRcIiujvMsD+x1qS
 vHgS1uKl+jEjzHBvNvNAQk2MGFCLNnUy01Jg8c36Q0B1TzRgtmF3vRS0baYivGgISpoH
 coI2Yl9iGmK36xDaojbNrFv2AW2dP26TBfRKUrdnTq9RQ/EoUoTMGQwTZhKWmWjAQg4B
 L1Yw==
X-Gm-Message-State: AFqh2kqWORUpDhkCRys7tF2uqVdENgMylYX29O/tAKFpUkgfWRZcFZUT
 3fPV0lfQt0uJsWven/KUC4dxKU5tuI5dRtA4b+QmTA==
X-Google-Smtp-Source: AMrXdXvM2MfqylLeD7zuAdCzxczA9kWaE3YYfn4AhNYhK9aWSE+eYRCCCjZP2dMjqs5j2772EMlAYv4Eqh5jwd26EBI=
X-Received: by 2002:a2e:2ac4:0:b0:27f:cc03:496a with SMTP id
 q187-20020a2e2ac4000000b0027fcc03496amr3837868ljq.359.1673378982518; Tue, 10
 Jan 2023 11:29:42 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Jan 2023 11:29:41 -0800
MIME-Version: 1.0
In-Reply-To: <Y7nV+aeFiq5aD0xU@ravnborg.org>
References: <20230106030108.2542081-1-swboyd@chromium.org>
 <Y7nV+aeFiq5aD0xU@ravnborg.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 10 Jan 2023 11:29:41 -0800
Message-ID: <CAE-0n50QOv_+j1Pe19xKj4Cx2Y5_Ak5Kt68UBJuZt10D-jQ44g@mail.gmail.com>
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

Quoting Sam Ravnborg (2023-01-07 12:28:41)
> On Thu, Jan 05, 2023 at 07:01:08PM -0800, Stephen Boyd wrote:
> > The unprepare sequence has started to fail after moving to panel bridge
> > code in the msm drm driver (commit 007ac0262b0d ("drm/msm/dsi: switch to
> > DRM_PANEL_BRIDGE")). You'll see messages like this in the kernel logs:
> >
> >    panel-boe-tv101wum-nl6 ae94000.dsi.0: failed to set panel off: -22
> >
> > This is because boe_panel_enter_sleep_mode() needs an operating DSI link
> > to set the panel into sleep mode. Performing those writes in the
> > unprepare phase of bridge ops is too late, because the link has already
> > been torn down by the DSI controller in post_disable, i.e. the PHY has
> > been disabled, etc. See dsi_mgr_bridge_post_disable() for more details
> > on the DSI .
> >
> > Split the unprepare function into a disable part and an unprepare part.
> > For now, just the DSI writes to enter sleep mode are put in the disable
> > function. This fixes the panel off routine and keeps the panel happy.
> >
> > My Wormdingler has an integrated touchscreen that stops responding to
> > touch if the panel is only half disabled too. This patch fixes it. And
> > finally, this saves power when the screen is off because without this
> > fix the regulators for the panel are left enabled when nothing is being
> > displayed on the screen.
>
> The pattern we use in several (but not all) panel drivers are that
> errors in unprepare/disable are logged but the function do not skip
> the remainder of the function. This is to avoid that we do not disable
> power supplies etc.

Ah that would have made it so I didn't see a problem. But I wonder if
the panel gets borked if you don't disable it via DSI writes before
yanking the power?

>
> For this case we could ask ourself if the display needs to enter sleep
> mode right before we disable the regulator. But if the regulator is
> fixed, so the disable has no effect, this seems OK.

What do you mean by fixed?

>
> Please fix the unprepare to not jump out early, on top of or together
> with the other fix.

After this patch the unprepare only bails out early if the bool
'prepared' flag isn't set. Are you suggesting to get rid of that flag
and unconditionally disable the regulators? Is it possible for the
unprepare to be called multiple times without a balanced call to
prepare?

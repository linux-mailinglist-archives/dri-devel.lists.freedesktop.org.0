Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CF366A46B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 21:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC4510EAF0;
	Fri, 13 Jan 2023 20:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A08310EAF0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 20:49:46 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id x40so658687lfu.12
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 12:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=fkHnDayGcMAohLKGEspej/e05EdmPSY3auvLO5nhKvg=;
 b=B1hyLm+idg00BzqYNZMLiXGprSAGG6i9IwN0XKFvJoTp+bbSmW2iNf+GJtXCutZOO3
 8RgU6vVG5lOlOdS4Jh+/EFjzMIfNlQs2UESZqPIAVNO8K6uwqRQpbb6GfpuoMr4V1iJU
 C54ylt/YF1UuhIaYBPOGvyctdx3Rtziy4tGIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fkHnDayGcMAohLKGEspej/e05EdmPSY3auvLO5nhKvg=;
 b=BRGAFXCGGYMlKYVOexm940YuuoF55lPg9yQBdnSm2vIyJ0zxiQmN3j+rleR3E/MYZa
 14OEvIDWNMn2lfwLKBxzneLsU1bgxFkGdkIbAml2yoOt/E2l/uimde0fso24vQZ6mdQQ
 IDbDLuOXcpQbjUmMpRfRiK2w33YyYUKLNZbv4BhoSEeJSkwYPVpQIrK8f0lW1bGvoiLr
 MTCDVur2KwyQOzvetVTiRspZUzpmi+KxOaxVJDvHo3saYlOZ5jAG0OUKYwmgYXRnzDEt
 8F1wN5B96apEGBQZm56gS5ub+xle/jHGlgNfXhGOo92dQp2eSfTiyf+Yrd8TNbxFLgvK
 04wg==
X-Gm-Message-State: AFqh2ko+YlfWmXMBHNiQ/Nj4Bw+s4uCMu46oW81CGhPccugCZlvXWC2N
 ZNWVsA/mlBxFbQAniEZR3qAQ4vxAmiIOf+6rWI3OXQ==
X-Google-Smtp-Source: AMrXdXsFLXpkYgLqPlD2aDMji/uNDYTLN9rr6vjDLKKJD82SrMUZ1JiyUGLTXyWhvAyNsS4E39x10UQlL6/nncEdZ5s=
X-Received: by 2002:ac2:4e50:0:b0:4ca:e48d:2b4b with SMTP id
 f16-20020ac24e50000000b004cae48d2b4bmr8301849lfr.511.1673642984424; Fri, 13
 Jan 2023 12:49:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 13 Jan 2023 14:49:43 -0600
MIME-Version: 1.0
In-Reply-To: <Y8FwGTWeYtX0j8MX@ravnborg.org>
References: <20230106030108.2542081-1-swboyd@chromium.org>
 <Y7nV+aeFiq5aD0xU@ravnborg.org>
 <CAE-0n50QOv_+j1Pe19xKj4Cx2Y5_Ak5Kt68UBJuZt10D-jQ44g@mail.gmail.com>
 <Y8FwGTWeYtX0j8MX@ravnborg.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 13 Jan 2023 14:49:43 -0600
Message-ID: <CAE-0n51XmyzSeKuGNn2BsJew3fK_cEHNoDpVVRqStNAF+Zzp1A@mail.gmail.com>
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

Quoting Sam Ravnborg (2023-01-13 06:52:09)
> Hi Stephen,
> On Tue, Jan 10, 2023 at 11:29:41AM -0800, Stephen Boyd wrote:
> > Quoting Sam Ravnborg (2023-01-07 12:28:41)
> >
> > >
> > > For this case we could ask ourself if the display needs to enter sleep
> > > mode right before we disable the regulator. But if the regulator is
> > > fixed, so the disable has no effect, this seems OK.
> >
> > What do you mean by fixed?
> What I tried to say here is if we have a fixed regulator - or in others
> words a supply voltage we cannot turn off, then entering sleep mode is
> important to reduce power consumption.
> But any sane design where power consumption is a concern will have the
> possibility to turn off the power anyway.

Ok got it!

>
> >
> > >
> > > Please fix the unprepare to not jump out early, on top of or together
> > > with the other fix.
> >
> > After this patch the unprepare only bails out early if the bool
> > 'prepared' flag isn't set.
> OK, then everything is fine.
>

Doug pointed out that enable isn't symmetric because it doesn't do the
DSI writes. I've updated the patch and I'll send a v2.

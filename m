Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 282687E4A8F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 22:24:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79AD10E3BA;
	Tue,  7 Nov 2023 21:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FBC10E3BA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 21:23:56 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-da819902678so4793735276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 13:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699392235; x=1699997035; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dvTG10ABG0x3sP4grZoASxI3B60KESzfNKXhZ50ortI=;
 b=BpoIjSXvdmqULP47SprpoOIChCkF4YjuOeZknZXu3Xp+6Oo0pEeKq2s2btjs3mB2hG
 ZRHQAGedTMtSUqD6NeRhxDbHVRjDJMtUmIV8aA4oRTbbYze78sY9Y8ZwntGbWI1Bxs6N
 f052RTJeoAS350OE7i9ScwnAQknwJfsjusgnSkQqEtnqWrIrA6c0sr35doqwIASFzhqE
 Bjx2AK4t3TcuZrQrvfkhYPR51GzKjcBGCD9V4uOF9T1eYlNXcy8Y2lwNx88LjqqPmLnD
 w7AOXp7fZgQrxSG00jAb/ey3m78xhYQphQkeOxJgsXCIqqLqgLDlxtkb+6RuUiHJ7Bje
 rShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699392235; x=1699997035;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dvTG10ABG0x3sP4grZoASxI3B60KESzfNKXhZ50ortI=;
 b=heWrjgh69fMGUC1kEauLDTSK9Xs3twwtqETy6NPjTRwvaXKIQJqH8xfpHZEtp2ZEUf
 zbq+GUXWLF5OGQwvRHDiYGxtV6LXCJIhL/b7aff/STe6GGJfjgWDMTZgdRaPGOEKKp3S
 ulawXuUK55C1nAzo+tFSw/EQ6VUhurzrC7BaYg+CAxoh54B/FWEJpttM0tFbnlzhJE8K
 xx0kn+zk+GKi4syQmgd+9GqijYdW9hLIBId2/RpKnirU2t/QIq4wiPyrQFeHfyglhpi4
 gPUuKFQKe++nPISRlPCpxIkbse3omhO2deLF81mD+sM3kwzubkt7iwIdbAEAmbKp0hcD
 gg1w==
X-Gm-Message-State: AOJu0YzUzz/KO52Hmy4FjLayN4k7QGrEp9J6cLilBi4ubR0cKqKtVuWN
 Qek+tLjSKIbiylJhgMJpoYgx+T+kZtM8HZpMSxTDsw==
X-Google-Smtp-Source: AGHT+IGTIU8jvCkV2BUmMTj6P61DCp2zrVll07uOzohXhnifKAxxWHa52coxZVe3Ciqk7nE0PKdFhk/25bhDX0311ks=
X-Received: by 2002:a25:202:0:b0:da3:b4a0:8807 with SMTP id
 2-20020a250202000000b00da3b4a08807mr19738231ybc.65.1699392235379; Tue, 07 Nov
 2023 13:23:55 -0800 (PST)
MIME-Version: 1.0
References: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpoFRp+7GyO=F3Ar21tfG5Yt0cL6zkAquqg7D1XXQjp50Q@mail.gmail.com>
 <55a4f98e-2772-e4fd-ae8a-132f92582c78@quicinc.com>
In-Reply-To: <55a4f98e-2772-e4fd-ae8a-132f92582c78@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 23:23:43 +0200
Message-ID: <CAA8EJpo9CFf-Z3eiuKPvwf-y6eGkSibro-q-=SBxKK_L-zFOBA@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] incorporate pm runtime framework and eDP clean up
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 7 Nov 2023 at 23:01, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 11/6/2023 5:55 PM, Dmitry Baryshkov wrote:
> > On Sat, 7 Oct 2023 at 01:55, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> The purpose of this patch series is to incorporate pm runtime framework
> >> into MSM eDP/DP driver so that eDP panel can be detected by DRM eDP panel
> >> driver during system probe time. During incorporating procedure, original
> >> customized pm realted fucntions, such as dp_pm_prepare(), dp_pm_suspend(),
> >> dp_pm_resume() and dp_pm_prepare(), are removed and replaced with functions
> >> provided by pm runtiem framework such as pm_runtime_force_suspend() and
> >> pm_runtime_force_resume(). In addition, both eDP aux-bus and irq handler
> >> are bound at system probe time too.
> >
> > With this patchset in place I can crash the board using the following
> > sequence (SM8350-HDK):
> >
> > - plug the USBC DP dongle
> > - run modetest at any mode, don't press Enter yet
> > - unplug the dongle
> > - press Enter to stop modetest
> >
> > => the board resets to Sahara.
> >
> > Please ping me if you need any additional information from my side.
>
> questiosn,
>
> 1) which dongle are you used?

I have used several Dell and Hama USB-C dongles.

>
> 2) what code branch shoud I used to duplicate this problem.

I have pushed my kernel tree to
git.codelinaro.org/dmitry.baryshkov/linux.git, branch test-dp-rpm
I had several UCSI patches on top, but they should not be relevant.

>
> I can not duplicate  system crash problem at my setup kodiak (SM7325)
> chrome book with my PM runtime patch series.
>
> my code base is Linux 6.6-rc2 + pm runtime patch series (7 patches)
>
> I did:
>
> 1) plugin either apple dongle (DP-to-HDMI) + 1080p display or DP typeC
> cable directly to 1080p display
>
> 2)  stop ui
>
> 3) /usr/bin/modetest -M msm -s 34:1920x1080 (see test pattern show at
> display)
>
> 4) unplug apple dongle or DP typeC cable
>
> 5) hit enter key
>
> 6) start ui
>
> 7) display back to login page of chrome book
>
>


-- 
With best wishes
Dmitry

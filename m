Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E43B642EA1
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 18:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6440410E0EB;
	Mon,  5 Dec 2022 17:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54BB10E25A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 17:24:15 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id l8so14303650ljh.13
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 09:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zuiUksNOM6qjg/saNKPV3HLkYlvFS8YHXnEydeWz/00=;
 b=V6pXPOsONW28DFzm/Iowr1sBrIf9HJK/ng6s0LMGPRVTqF1GHur1rO06PZgjWpL6Ua
 BvzJpVo80CddN2dCgIJn+QJ95QGB+s1xb3hFsSRLtDE6f77SwEe0qSNSvuJg81fh+o54
 hW4SiaVyTdi10AJVfssFmh8lJ942T1mO6EHXGKFmcSrXVQ+LtdK3FSalSMOM+kKmnPpE
 BWop1jQP+Uh77ZmcltmpR7l8lDISLfuL5GlkPwxWAF//M/18Ca7mt2aZJH7CZ31oCE0Y
 IgwqfqVEyCghDWFCxYHFXQt+iVKRJ8ri0FGjL8IY9RUX2iSuaWo6gcuXlW5qtdfdkCvg
 zong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zuiUksNOM6qjg/saNKPV3HLkYlvFS8YHXnEydeWz/00=;
 b=JRFSi094mNJadYv1QhWFgfRjKY2Ycss5F2J+SkDwWJQ0+2jXCujhN6dgsqrNm+ql/s
 AvIcbWq8/HqGAXGfKiclMGaJwe61jN2fx2P7Vgx8JIAOlMy5UooBYmWWrQUEjoFoH3/C
 hiVQqdbHauR26Y3TDRsqqEljQE+hwbjSZomtBsocROVjnvAXn4rxxxlhnML71i8Fd+XZ
 2ivBYMNnmTJ9kBacG65WBpD7Rdl9w0pYSzDD/NrrMoSdvp6/RUvDslUkYvaWYoKJlbt7
 x5mPlBKVKBjlU6QZ1auFBlom/7PQm/PN3CW/hG16H1JVeDaebOAlVhHt2qS3NR1pa8De
 LuPg==
X-Gm-Message-State: ANoB5pni7+AL2jt3cvD2eLIxJSCwMz4Ce2msln1Amjd//XVlAYiZiwbM
 Lq9GInYqgJtjT4V19eLDyHQ+9abBfZe5R5Xc5E+Orw==
X-Google-Smtp-Source: AA0mqf5yyTpVNob6rWacu8haY5UlBDgb4Z2hOuZ/R2GXdkeAMaFYAr/oRcQhPE3LaGd1yRYmPe8kxD2IJo+RENWXqBc=
X-Received: by 2002:a2e:9015:0:b0:27a:722:2fd7 with SMTP id
 h21-20020a2e9015000000b0027a07222fd7mr840298ljg.229.1670261054064; Mon, 05
 Dec 2022 09:24:14 -0800 (PST)
MIME-Version: 1.0
References: <20221202082028.11454-1-shangxiaojing@huawei.com>
 <CANDhNCpW47nwVc=oXUkmpEL=2+SiwM8R4zFAgoD5u3CRUyr2RA@mail.gmail.com>
In-Reply-To: <CANDhNCpW47nwVc=oXUkmpEL=2+SiwM8R4zFAgoD5u3CRUyr2RA@mail.gmail.com>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Tue, 6 Dec 2022 01:24:01 +0800
Message-ID: <CAMSo37V=BgPX6OPBkkcVE6TzZM8xTuNzof-8GZeg4jwVBdTnVg@mail.gmail.com>
Subject: Re: [PATCH] drm: kirin: Fix missing clk_disable_unprepare in
 ade_power_up()
To: John Stultz <jstultz@google.com>, Shang XiaoJing <shangxiaojing@huawei.com>
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
Cc: architt@codeaurora.org, xinliang.liu@linaro.org, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, kong.kongxinwei@hisilicon.com,
 tiantao6@hisilicon.com, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, John

Thanks for sharing this information!

Hi, XiaoJing

I boot tested this change with hikey and hikey960 android-mainline builds,
both could boot to the home screen.

But I am not sure what the problem is without this change, so I could
not check if this change
helps fix any problem, just checked that it did not cause any problem
for the boot.

Thanks,
Yongqin Liu
On Sat, 3 Dec 2022 at 02:06, John Stultz <jstultz@google.com> wrote:
>
> On Fri, Dec 2, 2022 at 12:22 AM Shang XiaoJing <shangxiaojing@huawei.com> wrote:
> >
> > The clk_disable_unprepare() should be called in the error handling of
> > ade_power_up(). So as reset_control_assert().
> >
> > Fixes: 783ad972c9a0 ("drm/hisilicon: Add crtc driver for ADE")
> > Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
>
> Looks reasonable to me. Thanks for sending this out!
> CC'ing YongQin and Sumit as they have hardware to test against.
>
> Acked-by: John Stultz <jstultz@google.com>
>
>
> > ---
> >  drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> > index 871f79a6b17e..439e87923bcf 100644
> > --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> > +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> > @@ -229,12 +229,15 @@ static int ade_power_up(struct ade_hw_ctx *ctx)
> >         ret = reset_control_deassert(ctx->reset);
> >         if (ret) {
> >                 DRM_ERROR("failed to deassert reset\n");
> > +               clk_disable_unprepare(ctx->media_noc_clk);
> >                 return ret;
> >         }
> >
> >         ret = clk_prepare_enable(ctx->ade_core_clk);
> >         if (ret) {
> >                 DRM_ERROR("failed to enable ade_core_clk (%d)\n", ret);
> > +               reset_control_assert(ctx->reset);
> > +               clk_disable_unprepare(ctx->media_noc_clk);
> >                 return ret;
> >         }
> >
> > --
> > 2.17.1
> >



-- 
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android

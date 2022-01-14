Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C211B48F2F0
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jan 2022 00:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6187E10E2E8;
	Fri, 14 Jan 2022 23:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA77110E2E8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 23:23:38 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 k15-20020a4a850f000000b002dc3cdb0256so3025709ooh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 15:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=qDCNZk+YHFKWNX9eKzf4zq71PK1bylZW31lIPLOmEsY=;
 b=H5NbI8kgzCbCfyozFmjg6/uEr7qn6iL5p8UFPpWfMcQpmR/nlKJXRlkUC3bOQSTyQ6
 ySatRAtQEd3zeyO96nkLxISch3EU1dCm8OHaWlMnsurOn9Jc747u7wReSr+lN5aGSpvG
 KI3N8xrb6MvXpomk7+A3w0lc3EIXsXm8vJ+KE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=qDCNZk+YHFKWNX9eKzf4zq71PK1bylZW31lIPLOmEsY=;
 b=kHBPs2r3Wyso6+zmt8hnBBjH2qk/HcZTXgBM5RfCFlGMdEAZC42mUBA2aj7d2zgFIs
 zY2JzgajBjQNRwvgEFWfX9Gd6jj5BO5HXJAM6lMCZQSjqtN7wMMWFgsR0s5fnOVQew74
 bjMFgUT/WHuelLnFP8xLTGIwMzdVH/9USMtTpNTDqqdUGQzJ+78XWBxcL1FtONtAk0lW
 N8ZB+qqMdp86jWwL1zdfj3d82KfVXUSyQTjKuvapgTCPr0ormpOAM4AA8Xbci4J4rchB
 2c68D350pZ4yU2ndaZ7d0GXdVnWo8kY7jtfwA+0TYWqCnDQnXBo7gYemNUr04ageqVfy
 Qoyw==
X-Gm-Message-State: AOAM532fWDySz50+kiTeVLSuZhFQYFGJSZcDSt+hw43H7q5D8kJhZ8yZ
 FwnkfUzErF7xbn1L91+7iJEYiCrtB3dlGS7Cq8WPKg==
X-Google-Smtp-Source: ABdhPJwFIlGlvXAoDe/iKVuwTu1YxkR5y8K8TamhM3kFUbDLWi5fw79LhahGE6BjuvnDxlQiIsIzQ7PVcl4D+uMg3nY=
X-Received: by 2002:a4a:d818:: with SMTP id f24mr8003573oov.25.1642202617985; 
 Fri, 14 Jan 2022 15:23:37 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Jan 2022 17:23:37 -0600
MIME-Version: 1.0
In-Reply-To: <f5a282ed-0b4a-9fb2-fc04-17842745feaa@quicinc.com>
References: <1642194710-2512-1-git-send-email-quic_khsieh@quicinc.com>
 <1642194710-2512-2-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52UYBajrqGFqppun5oK82V3ppjvQxANU27kL95gCZtURg@mail.gmail.com>
 <f5a282ed-0b4a-9fb2-fc04-17842745feaa@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 14 Jan 2022 17:23:37 -0600
Message-ID: <CAE-0n53GTt5W8DjVCGJ+D8E6N3HgZ3jhPoZVCw1jLOx4uxJdKA@mail.gmail.com>
Subject: Re: [PATCH v15 1/4] drm/msm/dp: do not initialize phy until plugin
 interrupt received
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-14 14:28:52)
>
> On 1/14/2022 1:41 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-01-14 13:11:47)
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm=
/dp/dp_display.c
> >> index 7cc4d21..7cd6222 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -696,12 +699,9 @@ static int dp_irq_hpd_handle(struct dp_display_pr=
ivate *dp, u32 data)
> >>           * dp core (ahb/aux clks) must be initialized before
> >>           * irq_hpd be handled
> >>           */
> >> -       if (dp->core_initialized) {
> >> -               ret =3D dp_display_usbpd_attention_cb(&dp->pdev->dev);
> >> -               if (ret =3D=3D -ECONNRESET) { /* cable unplugged */
> >> -                       dp->core_initialized =3D false;
> >> -               }
> >> -       }
> >> +       if (dp->core_initialized)
> > When is this condition false? The irq isn't unmasked until the core has
> > been initialized. On the resume path I suppose the irq is enabled in
> > dp_display_host_init() calling dp_ctrl_reset_irq_ctrl(), and then we
> > could immediately get the interrupt but it will block on the event_mute=
x
> > lock.
>
> This is left over form Lazor.
>
> I remember that there is an extreme case that several irq_hpd interrupts
> happen right after dongle plug in=C2=A0 (happen at resume too) and someti=
me
> cause system crash at dpcd read due to AHB clock is not enabled yet. It
> took some time to debug it.
>
>  From looking into code, it does not look likely it will happen. But it
> did happen at real world.

How does it happen after this patch is applied? I remember the duplicate
irq_hpd problem but that should have been solved by de-duplicating the
irq in the hardware by leaving it pending until it was handled. Note,
I'm not suggesting we remove the enabling of the core, just the check
that the core is initialized. Now that the check for core_initialized is
removed from the init function we have to make sure we only call the
function one time to match what was there before.

>
> So that I would like to keep this condition checking.

I'd rather not leave around dead code in this driver. The sharp edges
are what we need to smooth out.

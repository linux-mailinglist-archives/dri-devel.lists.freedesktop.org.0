Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A9C425CE2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 22:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C676E833;
	Thu,  7 Oct 2021 20:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558156E833
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 20:04:46 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id a3so10603771oid.6
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 13:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=b/PqRzpyVtlyjPlyKdFSeiLQuecNKo6Y9AE2/S+px8k=;
 b=Gz1HykHmxh4Mw+C+mrzq4VdONjEqw2WqUmXkj/sl0682+oWXeTB16Z7j4DU8tWnawG
 DWdViQjJ8Zb6vlX/EQ8gHv4hJALqwCLdmp56xM9V4v9f3YNL6rMlTwD3Gkg6kkdE9oLh
 1GkU8eqdf9bWmS5g37zYvXkzmj4p/au7g4khQ1Bw/uoOCJyjTt5mrgG+UMNxg9CE/m3Q
 oOQY15t0V2r0s2W5yx2x96o/sxor7RbbG/QW+WqIVk78j0VLwhXHZYOUS04yQhk5bqcS
 rbNGK+d10HBIjN+89UUsAyC+8qMRwLXgWQB9YTDEEBG8lAOnviAUMAniwnh6oWIPKGqE
 wcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b/PqRzpyVtlyjPlyKdFSeiLQuecNKo6Y9AE2/S+px8k=;
 b=NJqyMnskyqBOmIZQ95QVZxuir5H0XzZr7NrCdNFh16XqWle8X7SQGqaH9P6qLadDMs
 Emo86i5EzeNVJ8Yi6ayC9DRk/onNjEb6n/QaMTKQC46P8trdy3ldHeDeNNGBUmlwPIH8
 yp+lqkkYzDljSLZRYjGC/bKrdfnO/wyqFF8N3+qvM3WRK72dsd971FJIsa6xClDD7of8
 nF1BodYgkG07207frp5DPagg9ruvayKHIpftiG9p3eKDQ0NMLOeywSTyUkZq62pUE8vd
 HFmuhrrq7youjv3DYjvxD26yudaYZ2+DYuCozS9JN6l+qw8wtWuVTvyc0AsP9oleqaSh
 /D3A==
X-Gm-Message-State: AOAM530laFNJgaTg5D2dqidM8MqKLnqQPlR03V8hKUWaTGO41XVrdw1d
 92ArGUBwFDizF/fA3iCi4pEUxQ==
X-Google-Smtp-Source: ABdhPJz1MsOchcTt/Fs6xxXAJt0IgIp9aBJPtFq+os4WRdFTdntvX2t+hBIxXWlByHNgz2w92qz+jw==
X-Received: by 2002:a05:6808:15a3:: with SMTP id
 t35mr4684496oiw.92.1633637085537; 
 Thu, 07 Oct 2021 13:04:45 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id l2sm95100otu.23.2021.10.07.13.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 13:04:45 -0700 (PDT)
Date: Thu, 7 Oct 2021 13:06:24 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: khsieh@codeaurora.org
Cc: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sankeerth Billakanti <sbillaka@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: Shorten SETUP timeout
Message-ID: <YV9TQEKPh4SXYFF/@ripper>
References: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
 <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com>
 <YVzGVmJXEDH0HfIL@ripper>
 <CAE-0n53FC7JCCJoye_uKeqaLKrZeHXLtvObxWFedaUzjirmBaA@mail.gmail.com>
 <a4a4980e586a70e3b7de989bc61a3e33@codeaurora.org>
 <YV0FlTyMEzlyNsN9@ripper>
 <3dbe0fe48da88af9dee396a85b940e76@codeaurora.org>
 <YV3dddt/GOidTmlN@ripper>
 <9dc50145fb3e9b189fd38857b20f326a@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dc50145fb3e9b189fd38857b20f326a@codeaurora.org>
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

On Thu 07 Oct 12:51 PDT 2021, khsieh@codeaurora.org wrote:

> On 2021-10-06 10:31, Bjorn Andersson wrote:
> > On Wed 06 Oct 08:37 PDT 2021, khsieh@codeaurora.org wrote:
> > 
> > > On 2021-10-05 19:10, Bjorn Andersson wrote:
> > > > On Tue 05 Oct 16:04 PDT 2021, khsieh@codeaurora.org wrote:
> > > >
> > > > > On 2021-10-05 15:36, Stephen Boyd wrote:
> > > > > > Quoting Bjorn Andersson (2021-10-05 14:40:38)
> > > > > > > On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:
> > > > > > >
> > > > > > > > Quoting Bjorn Andersson (2021-10-04 19:37:50)
> > > > > > > > > Found in the middle of a patch from Sankeerth was the reduction of the
> > > > > > > > > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
> > > > > > > > > is initalized and HPD interrupt start to be serviced, so in the case of
> > > > > > > > > eDP this reduction improves the user experience dramatically - i.e.
> > > > > > > > > removes 9.9s of bland screen time at boot.
> > > > > > > > >
> > > > > > > > > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> > > > > > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > > > > > > ---
> > > > > > > >
> > > > > > > > Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
> > > > > > > > re-read the code a couple times to understand that it's waiting 100ms
> > > > > > > > times the 'delay' number. Whaaaaat?
> > > > > > > >
> > > > > > >
> > > > > > > I assume you're happy with the current 10s delay on the current
> > > > > > > devices, so I don't think we should push for this to be backported.
> > > > > > > I have no need for it to be backported on my side at least.
> > > > > > >
> > > > > >
> > > > > > Sure. Fixes tag != backported to stable trees but it is close.
> > > > > >
> > > > > > > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > > > > >
> > > > >   dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1); <== to 100ms
> > > > >
> > > > > This patch will prevent usb3 from working due to dp driver
> > > > > initialize phy
> > > > > earlier than usb3 which cause timeout error at power up usb3 phy
> > > > > when both
> > > > > edp and dp are enabled.
> > > >
> > > > Can you please help me understand what you mean here, I use this on my
> > > > sc8180x with both eDP and USB-C/DP right now. What is it that doesn't
> > > > work? Or am I just lucky in some race condition?
> > > >
> > > > Thanks,
> > > > Bjorn
> > > >
> > > The problem is seen at sc7280.
> > > Apple dongle have both  hdmi and usb port.
> > > plug Apple dongle into type-c, then plug DP into apple's hdmi port
> > > and usb
> > > mouse into apple's usb port.
> > > If edp enabled at this time, then usb mouse will not work due to
> > > timeout at
> > > phy power up.
> > > 
> > 
> > Okay, so you're saying that if the DP driver invokes phy_power_on()
> > before the USB driver does, USB initialization fails (or at least USB
> > doesn't work)?
> 
> if dp driver call qcom_qmp_phy_init() before usb3 call qcom_qmp_phy_init(),
> usb3 driver will timeout at readl_poll_timeout(status, val, (val & mask) ==
> ready, 10, PHY_INIT_COMPLETE_TIMEOUT) of qcom_qmp_phy_power_on().

Thanks, I will try to reproduce this on my side. So the 10 seconds here
is strictly to give good enough time for the dwc3 driver to probe...

Any idea why you're saying that this is specific to sc7280, what changed
from sc7180?

> > 
> > Sounds like something we need to work out in the QMP phy driver. Do you
> > have any more details about what's going wrong.
> > 
> > 
> > Also, I've seen various references to said "Apple dongle", do you have a
> > link to the exact one you're testing with so I can pick one up for
> > testing purposes as well?
> 
> Apple A2119 hdmi+usb dongle.
> https://www.amazon.com/Apple-USB-C-Digital-Multiport-Adapter/dp/B07WF96FY5/ref=sr_1_2?dchild=1&keywords=apple+a2119&qid=1633636227&sr=8-2
> 

Thanks,
Bjorn

> > 
> > Regards,
> > Bjorn
> > 
> > > > > I had prepared a patch (drm/msm/dp: do not initialize combo phy
> > > > > until plugin
> > > > > interrupt) to fix this problem.
> > > > > Unfortunately, my patch is depend on Bjorn's patch (PATCH v3 3/5]
> > > > > drm/msm/dp: Support up to 3 DP controllers).
> > > > > I will submit my patch for review once Bjorn's patches merged in.
> > > > > Therefore I would think this patch should go after both Bjorn's
> > > > > patches and
> > > > > my patch.
> > > > >
> > > > >
> > > > >

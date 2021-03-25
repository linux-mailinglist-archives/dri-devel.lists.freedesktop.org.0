Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD90A3487FE
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 05:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EA589C27;
	Thu, 25 Mar 2021 04:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F5E89134
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 04:39:14 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so395440pjg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 21:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=lqtjDfDMRVrpsCVybPd2ASGnB4nenRyEa0GnMoEEPwY=;
 b=b5jMeiV+ocRjjNz5omI21Ydi/8N5u+2EQ2NfpVZXwQVBsmXzn1PzgxlQ0hDT7vJbXv
 G62/4zcvb8CKiJIbAzIppqFu6rSJTbgJXElWUg6fBBjnffhHdqbvqss+t1ToOrZs2cqm
 v5rmgR0zZNs2/1AUY0zKSfKajVNbnHAshggOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=lqtjDfDMRVrpsCVybPd2ASGnB4nenRyEa0GnMoEEPwY=;
 b=a5nHVC4pKG/J7Ro7H0wAd+0C0LwfcIcEHgn+snldf4gKBeFubZ9GGFC6hzS4IhzG8D
 o3YLfJlKLstNE/punNvctJc41xldiQVHk7hDCMqdtgxfftkElq65oSnfBIeYIe+icYYb
 ih/8WTqUoAmbb560n6QDySJOmzHRZjD0B7k/iYG64IWpRuO4cOMkMqg+yRcJ439h660S
 jqqJApy25Wv+719/G5y1f5jDoqahXudcHw1p+/dmi3gpVFoz2O0oau1XZDFxqnx/p26P
 9QNBG8lBZogeKLQtjtd/JDqhhjivWrDAgn2iD5AwxHyv4cGk5l3ujpB1Av83kgtppR+S
 GYkg==
X-Gm-Message-State: AOAM530FMo5YoL/Gg7PzIbPyNxzLM1OXNJx/csUecoeoc6qWA1K+lg6c
 7B3lT8Qo399QsPhrjSDPc3bSt3Ve6ZnY0g==
X-Google-Smtp-Source: ABdhPJycAkp6+8nMtAx+aLtk0wJ9huxG4982NBY/lWZC+yW47viKbLHWAYy7tBkt6DpjDE8D1OZXKA==
X-Received: by 2002:a17:90a:5103:: with SMTP id
 t3mr7021407pjh.68.1616647153731; 
 Wed, 24 Mar 2021 21:39:13 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:84ac:62f7:16a8:ccc7])
 by smtp.gmail.com with ESMTPSA id h6sm4291699pfb.157.2021.03.24.21.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 21:39:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAF6AEGsRKPn-pLtP8dmG+_VSH1TbyaW10HHtaOT10Xc3D+DMTg@mail.gmail.com>
References: <20210318200544.2244007-1-dmitry.baryshkov@linaro.org>
 <161663694524.3012082.11889553997747135632@swboyd.mtv.corp.google.com>
 <CAF6AEGsRKPn-pLtP8dmG+_VSH1TbyaW10HHtaOT10Xc3D+DMTg@mail.gmail.com>
Subject: Re: [PATCH v2] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Date: Wed, 24 Mar 2021 21:39:11 -0700
Message-ID: <161664715135.3012082.16581922607390567861@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rob Clark (2021-03-24 20:09:37)
> On Wed, Mar 24, 2021 at 6:49 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2021-03-18 13:05:44)
> > > if GPU components have failed to bind, shutdown callback would fail with
> > > the following backtrace. Add safeguard check to stop that oops from
> > > happening and allow the board to reboot.
> > [...]
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > > index 94525ac76d4e..fd2ac54caf9f 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > @@ -1311,6 +1311,10 @@ static int msm_pdev_remove(struct platform_device *pdev)
> > >  static void msm_pdev_shutdown(struct platform_device *pdev)
> > >  {
> > >         struct drm_device *drm = platform_get_drvdata(pdev);
> > > +       struct msm_drm_private *priv = drm ? drm->dev_private : NULL;
> > > +
> > > +       if (!priv || !priv->kms)
> > > +               return;
> > >
> >
> > I see a problem where if I don't get a backlight probing then my
> > graphics card doesn't appear but this driver is still bound. I was
> > hoping this patch would fix it but it doesn't. I have slab poisoning
> > enabled so sometimes the 'priv' pointer is 0x6b6b6b6b6b6b6b6b meaning it
> > got all freed.
> >
> > I found that the 'drm' pointer here is pointing at junk. The
> > msm_drm_init() function calls drm_dev_put() on the error path and that
> > will destroy the drm pointer but it doesn't update this platform drivers
> > drvdata. Do we need another patch that sets the drvdata to NULL on
> > msm_drm_init() failing? One last note, I'm seeing this on 5.4 so maybe I
> > missed something and the drvdata has been set to NULL somewhere else
> > upstream. I sort of doubt it though.
> 
> the hw that I guess you are running on should work pretty well w/
> upstream kernel.. but I don't think there is any important delta
> between upstream and the 5.4 based kernel that you are running that
> would fix this..
> 
> so *probably* you are right..

linux-next is failing like this today for me on Lazor right after the
screen turns on. I'll have to figure out what's wrong before checking
upstream.

[   10.734752] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000080
[   10.744482] Mem abort info:
[   10.747462]   ESR = 0x96000006
[   10.750644]   EC = 0x25: DABT (current EL), IL = 32 bits
[   10.756125]   SET = 0, FnV = 0
[   10.759290]   EA = 0, S1PTW = 0
[   10.762543] Data abort info:
[   10.765519]   ISV = 0, ISS = 0x00000006
[   10.769485]   CM = 0, WnR = 0
[   10.772553] user pgtable: 4k pages, 39-bit VAs, pgdp=0000000123474000
[   10.779212] [0000000000000080] pgd=0800000123475003, p4d=0800000123475003, pud=0800000123475003, pmd=0000000000000000
[   10.790128] Internal error: Oops: 96000006 [#1] PREEMPT SMP
[   10.795856] Modules linked in: ath10k_snoc qmi_helpers ath10k_core ath mac80211 cfg80211 r8152 mii joydev
[   10.805705] CPU: 5 PID: 1576 Comm: DrmThread Not tainted 5.12.0-rc4-next-20210324+ #13
[   10.813832] Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
[   10.820535] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO BTYPE=--)
[   10.826703] pc : dpu_plane_atomic_update+0x80/0xcb8
[   10.831730] lr : dpu_plane_restore+0x5c/0x88
[   10.836117] sp : ffffffc012963920
[   10.839521] x29: ffffffc0129639c0 x28: ffffffed5c9ad000 
[   10.844979] x27: ffffffed5c736000 x26: ffffffed5ca3f000 
[   10.850443] x25: ffffffed5c736000 x24: 0000000000000000 
[   10.855903] x23: 0000000000000000 x22: ffffff80ad007400 
[   10.861361] x21: ffffff8085193808 x20: 0000000000000000 
[   10.866818] x19: ffffff8085193800 x18: 0000000000000008 
[   10.872274] x17: 0000000000800000 x16: 0000000020000000 
[   10.877738] x15: 0000000000000001 x14: 0000000000000000 
[   10.883201] x13: ffffff80852324a8 x12: 0000000000000008 
[   10.888657] x11: ffffffed5c3b7890 x10: 0000000000000000 
[   10.894112] x9 : 0000000000000000 x8 : 0000000000000000 
[   10.899570] x7 : 0000000000004000 x6 : 0000000000010000 
[   10.905026] x5 : 0000000000040000 x4 : 0000000000000800 
[   10.910482] x3 : 0000000000000000 x2 : 0000000000020041 
[   10.915946] x1 : ffffff80ad2e2600 x0 : ffffff8085193800 
[   10.921402] Call trace:
[   10.923923]  dpu_plane_atomic_update+0x80/0xcb8
[   10.928585]  dpu_plane_restore+0x5c/0x88
[   10.932620]  dpu_crtc_atomic_flush+0xd4/0x1a0
[   10.937105]  drm_atomic_helper_commit_planes+0x1b4/0x1e0
[   10.942565]  msm_atomic_commit_tail+0x2d4/0x670
[   10.947223]  commit_tail+0xac/0x148
[   10.950814]  drm_atomic_helper_commit+0x104/0x10c
[   10.955653]  drm_atomic_commit+0x58/0x68
[   10.959686]  drm_mode_atomic_ioctl+0x438/0x51c
[   10.964261]  drm_ioctl_kernel+0xa8/0x124
[   10.968295]  drm_ioctl+0x24c/0x3ec
[   10.971800]  drm_compat_ioctl+0xe0/0xf4
[   10.975745]  __arm64_compat_sys_ioctl+0xcc/0x104
[   10.980499]  el0_svc_common+0xa4/0x128
[   10.984358]  do_el0_svc_compat+0x2c/0x38
[   10.988395]  el0_svc_compat+0x20/0x30
[   10.992164]  el0_sync_compat_handler+0xc0/0xf0
[   10.996734]  el0_sync_compat+0x174/0x180
[   11.000774] Code: d0003d61 91204821 52800020 97fe8c65 (39420288)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

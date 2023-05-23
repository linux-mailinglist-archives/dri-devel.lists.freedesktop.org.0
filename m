Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6025170E05D
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 17:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF9B10E458;
	Tue, 23 May 2023 15:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4BD10E456;
 Tue, 23 May 2023 15:24:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 096BE60F9A;
 Tue, 23 May 2023 15:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B18AC433D2;
 Tue, 23 May 2023 15:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684855440;
 bh=id6Ze6Hu+PqRUZZVVqJiBhbnqqCMbcdVAtw6ZAFwtmo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mlMhs2i3JhpqXBZbookXDxEtR7hNMdrz5dLT2v8fhPzPvPy+X9NTq89QUWil82lVF
 NaibKJtMgxicJACKlir1mQaPE0fbnKy30qodJinOqxbkWU34QPQ7rWj4J5u1Qt4Ili
 IRMl6oOiC+EePCNmK+Ibr2LnISsHo+l9NCF9aN5o1PVDNRtNlo/L86BSRY4Vkrxub/
 e8fr8Q3cx3an4alHxD8hJko8U6av/pHEwuS4yIAWeQJ6Fm07mNHaFUVsjrt7AdwRZu
 soz6vppYmVHO+kMOn2keN6Sx/pECMxOwbUEH4+cG62/OsEZTFgFR5AHYZqbXdVQKr2
 41XeN1uxRyvbQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1q1Tro-0007Qn-8f; Tue, 23 May 2023 17:24:04 +0200
Date: Tue, 23 May 2023 17:24:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dp: add module parameter for PSR
Message-ID: <ZGzalLjTvUfzEADU@hovoldconsulting.com>
References: <20230427232848.5200-1-quic_abhinavk@quicinc.com>
 <053819bd-b3c4-a72c-9316-85d974082ad6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <053819bd-b3c4-a72c-9316-85d974082ad6@linaro.org>
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
Cc: dianders@chromium.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, linux-arm-msm@vger.kernel.org, quic_jesszhan@quicinc.com,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 09:13:04PM +0300, Dmitry Baryshkov wrote:
> On 28/04/2023 02:28, Abhinav Kumar wrote:
> > On sc7280 where eDP is the primary display, PSR is causing
> > IGT breakage even for basic test cases like kms_atomic and
> > kms_atomic_transition. Most often the issue starts with below
> > stack so providing that as reference
> > 
> > Call trace:
> >   dpu_encoder_assign_crtc+0x64/0x6c
> >   dpu_crtc_enable+0x188/0x204
> >   drm_atomic_helper_commit_modeset_enables+0xc0/0x274
> >   msm_atomic_commit_tail+0x1a8/0x68c
> >   commit_tail+0xb0/0x160
> >   drm_atomic_helper_commit+0x11c/0x124
> >   drm_atomic_commit+0xb0/0xdc
> >   drm_atomic_connector_commit_dpms+0xf4/0x110
> >   drm_mode_obj_set_property_ioctl+0x16c/0x3b0
> >   drm_connector_property_set_ioctl+0x4c/0x74
> >   drm_ioctl_kernel+0xec/0x15c
> >   drm_ioctl+0x264/0x408
> >   __arm64_sys_ioctl+0x9c/0xd4
> >   invoke_syscall+0x4c/0x110
> >   el0_svc_common+0x94/0xfc
> >   do_el0_svc+0x3c/0xb0
> >   el0_svc+0x2c/0x7c
> >   el0t_64_sync_handler+0x48/0x114
> >   el0t_64_sync+0x190/0x194
> > ---[ end trace 0000000000000000 ]---
> > [drm-dp] dp_ctrl_push_idle: PUSH_IDLE pattern timedout
> > 
> > Other basic use-cases still seem to work fine hence add a
> > a module parameter to allow toggling psr enable/disable till
> > PSR related issues are hashed out with IGT.
> 
> For the reference: Bjorn reported that he has issues with VT on a 
> PSR-enabled laptops. This patch fixes the issue for him

Module parameters are almost never warranted, and it is definitely not
the right way to handle a broken implementation.

I've just sent a revert that unconditionally disables PSR support until
the implementation has been fixed:

	https://lore.kernel.org/lkml/20230523151646.28366-1-johan+linaro@kernel.org/

Johan

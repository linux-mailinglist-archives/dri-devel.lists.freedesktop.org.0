Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9B59D2753
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 14:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3013C10E646;
	Tue, 19 Nov 2024 13:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PDVzOL2a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EFC10E646;
 Tue, 19 Nov 2024 13:52:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3F2F85C486D;
 Tue, 19 Nov 2024 13:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9BF9C4CECF;
 Tue, 19 Nov 2024 13:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732024367;
 bh=1Pjxc+Ys+Og1dQEoe7LKD4sONGdg5iwH6SoYoSWLLhE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PDVzOL2a+NXq3DDuDEfG7H9mCnJV9VPjPcUTcHAv6vLtAj8nmbCKKRwmNyOOh4JL1
 j81sxVPE+uvgioOr8X9OsQJiHup3pJ8GqO92UIV6PNNKsHZQ76GuoUPy6dRkALmnKA
 9CpGNiJqV+RAuIMYWk0hvu34vPdBd2tiNnU5iVyTEGiIXWUtV3LvRjd1rCrB/wlSuF
 o8oe2f8Gpo1GKUQAmo4XoCzmQ1aXJSYJ7ZLicz9S5jDWfP+fhmS/h+94uvMHVBfBsg
 aNK1mur2XHwk2iLqclwIdzCo3l/DZ25DJLS8Isl6M7G2vfnu6EEaiNwAsS4OQNzhHE
 KOSenjVwLOUEQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1tDOeh-00000000856-2jXa;
 Tue, 19 Nov 2024 14:52:35 +0100
Date: Tue, 19 Nov 2024 14:52:35 +0100
From: Johan Hovold <johan@kernel.org>
To: =?utf-8?Q?Gy=C3=B6rgy?= Kurucz <me@kuruczgy.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org,
 Leonard Lausen <leonard@lausen.nl>, Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [v2,1/2] drm/msm/dpu1: don't choke on disabling the writeback
 connector
Message-ID: <ZzyYI8KkWK36FfXf@hovoldconsulting.com>
References: <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
 <b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com>
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

On Fri, Aug 30, 2024 at 07:36:32PM +0200, György Kurucz wrote:

> For context, I have a Lenovo Yoga Slim 7x laptop, and was having issues 
> with the display staying black after sleep. As a workaround, I could 
> switch to a different VT and back.
> 
> > [ 1185.831970] [dpu error]connector not connected 3
> 
> I can confirm that I was seeing this exact error message as well.
> 
> >   	if (!conn_state || !conn_state->connector) {
> >   		DPU_ERROR("invalid connector state\n");
> >   		return -EINVAL;
> > -	} else if (conn_state->connector->status != connector_status_connected) {
> > -		DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
> > -		return -EINVAL;
> >   	}
> >   
> >   	crtc = conn_state->crtc;
> 
> After applying this patch, the screen now resumes successfully, and the 
> errors are gone.

I'm seeing the same issue as György on the x1e80100 CRD and Lenovo
ThinkPad T14s. Without this patch, the internal display fails to resume
properly (switching VT brings it back) and the following errors are
logged:

	[dpu error]connector not connected 3
	[drm:drm_mode_config_helper_resume [drm_kms_helper]] *ERROR* Failed to resume (-22)

I see the same symptoms with Xorg as well as sway.

Can we please get this fixed and backported as soon as possible?

Even if there are further issues with some "Night Light" functionality
on one machine, keeping this bug as workaround does not seem warranted
given that it breaks basic functionality for users.

The x1e80100 is the only platform I have access to with a writeback
connector, but this regression potentially affects a whole host of older
platforms as well.

Johan

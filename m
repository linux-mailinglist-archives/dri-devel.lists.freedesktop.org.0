Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6770F9E8EA7
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 10:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6444810E6A7;
	Mon,  9 Dec 2024 09:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cCMxqDnz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C22A10E6B2;
 Mon,  9 Dec 2024 09:25:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 113065C5890;
 Mon,  9 Dec 2024 09:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523E1C4CED1;
 Mon,  9 Dec 2024 09:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733736332;
 bh=88xmwrsOxb/rfeNxdG6aUEgD3A6p2p0EBuhsh7SZGvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cCMxqDnz7YQUfzPVxRb4JKz9/JanER6RYYKBQZuj7IMT9GdDWfAaEnSYGW2MZT6b4
 ZAITV0DMiwMG08wSVNzUf5NPcqaReGI3KBOSzckRRcKWCh9VKpQBBhoxhxQKufuHf4
 PTLdN5fvAc7SnKWFcnCdPditNcy0z3cnWJmOjWuDjnodAycqMtT8eHlnXU3d8nwy4d
 vzzKW6W8PAeDT2f/FHvhK0xI7bfP+4m1JlrO0uFWYIOeXcVHWMxfvmkCnmdiSzkRG4
 EN4LkE3mL2M38S0Bm2/ziqyXwMmAak5ggHdV/fl2gfBRU7IUMdWoeN9yNqoSKudk0h
 oqxL8zyMw3UyA==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1tKa1E-0000000073t-1px6;
 Mon, 09 Dec 2024 10:25:33 +0100
Date: Mon, 9 Dec 2024 10:25:32 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>,
 =?utf-8?Q?Gy=C3=B6rgy?= Kurucz <me@kuruczgy.com>,
 Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3] drm/msm/dpu1: don't choke on disabling the writeback
 connector
Message-ID: <Z1a3jOB8CutzRZud@hovoldconsulting.com>
References: <20241208-dpu-fix-wb-v3-1-a1de69ce4a1b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241208-dpu-fix-wb-v3-1-a1de69ce4a1b@linaro.org>
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

Dmitry,

Looks like you just silently ignored my reviewed feedback, yet included
my conditional reviewed-by tag. Repeating below.

On Sun, Dec 08, 2024 at 07:29:11PM +0200, Dmitry Baryshkov wrote:
> During suspend/resume process all connectors are explicitly disabled and
> then reenabled. However resume fails because of the connector_status check:
> 
> [ 1185.831970] [dpu error]connector not connected 3

Please also include the follow-on resume error. I'm seeing:

	[dpu error]connector not connected 3
	[drm:drm_mode_config_helper_resume [drm_kms_helper]] *ERROR* Failed to resume (-22)

and say something about that this can prevent *displays* from being
enabled on resume in *some* setups (preferably with an explanation why
if you have one).

> It doesn't make sense to check for the Writeback connected status (and
> other drivers don't perform such check), so drop the check.
> 
> Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")

I noticed that the implementation had this status check also before
71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to
dpu_writeback.c").

Why did this not cause any trouble back then? Or is this not the right
Fixes tag?

> Cc: stable@vger.kernel.org
> Reported-by: Leonard Lausen <leonard@lausen.nl>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57

Please include mine an György's reports here too.

Since this has dragged on for many months now, more people have run into
this issue and have reported this to you. Giving them credit for this is
the least you can do especially since you failed to include the
corresponding details about how this manifests itself to users in the
commit message:

Reported-by: György Kurucz <me@kuruczgy.com>
Link: https://lore.kernel.org/all/b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com/

Reported-by: Johan Hovold <johan+linaro@kernel.org>
Link: https://lore.kernel.org/all/ZzyYI8KkWK36FfXf@hovoldconsulting.com/

> Tested-by: Leonard Lausen <leonard@lausen.nl> # on sc7180 lazor
> Tested-by: György Kurucz <me@kuruczgy.com>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Leonard Lausen reported an issue with suspend/resume of the sc7180
> devices. Fix the WB atomic check, which caused the issue.
> ---
> Changes in v3:
> - Rebased on top of msm-fixes
> - Link to v2: https://lore.kernel.org/r/20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org

Johan

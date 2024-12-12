Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A20F19EE17C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 09:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD32410ECF9;
	Thu, 12 Dec 2024 08:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t1549Ovb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A0410ECF9;
 Thu, 12 Dec 2024 08:41:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 26929A42657;
 Thu, 12 Dec 2024 08:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A90C4CECE;
 Thu, 12 Dec 2024 08:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733992885;
 bh=V9ZgLYGS9V5D6sBRuPJglgqlae/xhudICyCZ7OL/n2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t1549Ovbr5zL06yJKspZfmXMo8dUwEMV8eT3j8RWWpS608U5NPB76hbmWFa1Y06M7
 T2sMOwViHk6hKi5SIZN258drWGkyeHHAUEzeRBA8K/pwwcEXKSmqQ+pd7z34FJE6NX
 Nqe0kOzdi45/n4a41fz9y9QECic4KnIzaHYVmdHbt2GGryPin7eCGUlQyDptlJNN/Y
 XxNBuunkR5hgYcUkzWEo5xfLdsk5xS1G7FU10x1eIjcB5k5v5uy0QD+bpZ5znv2YPU
 HQREUJPPOzLwS1qO2HCk25kr81GKC65lL8PjMWo5DEFbIRkdD64qW8v6TebmUAKGKC
 XpEorO1fIO/tQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1tLelD-000000006Rn-36L4;
 Thu, 12 Dec 2024 09:41:28 +0100
Date: Thu, 12 Dec 2024 09:41:27 +0100
From: Johan Hovold <johan@kernel.org>
To: neil.armstrong@linaro.org
Cc: Abel Vesa <abel.vesa@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <Z1qht5W66I1-3RLL@hovoldconsulting.com>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
 <Z1mk08SHEd5_vc99@hovoldconsulting.com>
 <0d0a8157-32a4-4e8e-92cd-dac9a4471641@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d0a8157-32a4-4e8e-92cd-dac9a4471641@linaro.org>
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

On Thu, Dec 12, 2024 at 09:31:09AM +0100, neil.armstrong@linaro.org wrote:
> On 11/12/2024 15:42, Johan Hovold wrote:

> >> +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
> > 
> > This appears to be what the driver currently uses, but why not
> > EXPORT_SYMBOL_GPL?
> 
> drivers/gpu/drm/display/drm_dp_helper.c is not GPL licenced, so
> this is the right macro to use.

Wow. I should have checked the header. Thanks for explaining.

Johan

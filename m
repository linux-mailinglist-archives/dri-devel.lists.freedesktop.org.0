Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AAF85AD1B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 21:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC0D10E283;
	Mon, 19 Feb 2024 20:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bCfB3zaI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063BA10E25C;
 Mon, 19 Feb 2024 20:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708374354;
 bh=vqsWU3WOB4sjA2l3XLi4NnyhHkvwjCNUEm//eGLsems=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bCfB3zaI7v3YWH1wFD8uhQNGQvA/sR/qgP7t67HvHzDus+44sOlifiKwnTVj1+yWs
 slZUUcTR0Hf31Qz02fyukAAZSOfn7tUqUuwNg5+51fEeC6/PdnzEIt5qqtierW7sfE
 0566etSq+JnOU1nWy+59AXHVPWJR+Noh1a2K0YLXHB2T6+wAA7OTnWQsHK6SH/oSWr
 kn6v6qWSNioK70XO5NZ6w11G+ST09iGWWf9lRfLSFQ1FX/GcFvn+mtbwpEu6WZ0jgf
 vY6P7sYA/nQgN5s3KV/W2U+QrhVzwvk8l9Jz1FaEcb80mgmMvF4vc09U7Qe3Xg4txP
 Hn8ppQ7GkUl5A==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 06AD83782085;
 Mon, 19 Feb 2024 20:25:50 +0000 (UTC)
Message-ID: <dc9872dc-c51a-4f8b-8963-9f92e43c7246@collabora.com>
Date: Mon, 19 Feb 2024 17:25:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/ci: mark universal-plane-sanity as failing on
 SC7180
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
 <20240218041204.2522828-3-dmitry.baryshkov@linaro.org>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240218041204.2522828-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 18/02/2024 01:12, Dmitry Baryshkov wrote:
> The test kms_universal_plane@universal-plane-sanity fails on both SC7180
> platforms. The drm/msm returns -ERANGE as it can not handle passet
> scaling range, however the test is not ready to handle that. Mark the
> test as failing until it is fixed.
> 
> ERROR - Igt error: (kms_universal_plane:1554) CRITICAL: Test assertion failure function sanity_test_pipe, file ../tests/kms_universal_plane.c:438:
> ERROR - Igt error: (kms_universal_plane:1554) CRITICAL: Failed assertion: drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id, output->config.crtc->crtc_id, test.oversized_fb.fb_id, 0, 0, 0, mode->hdisplay + 100, mode->vdisplay + 100, IGT_FIXED(0,0), IGT_FIXED(0,0), IGT_FIXED(mode->hdisplay,0), IGT_FIXED(mode->vdisplay,0)) == expect
> ERROR - Igt error: (kms_universal_plane:1554) CRITICAL: Last errno: 34, Numerical result out of range
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>   .../gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt    | 1 +
>   .../drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt    | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> index 7e4d8744fcc6..f0576aa629e8 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> @@ -15,3 +15,4 @@ kms_plane_alpha_blend@alpha-7efc,Fail
>   kms_plane_alpha_blend@coverage-7efc,Fail
>   kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>   kms_rmfb@close-fd,Fail
> +kms_universal_plane@universal-plane-sanity,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> index 7e4d8744fcc6..f0576aa629e8 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> @@ -15,3 +15,4 @@ kms_plane_alpha_blend@alpha-7efc,Fail
>   kms_plane_alpha_blend@coverage-7efc,Fail
>   kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>   kms_rmfb@close-fd,Fail
> +kms_universal_plane@universal-plane-sanity,Fail

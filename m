Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228744F7C3F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFF010E264;
	Thu,  7 Apr 2022 09:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3D710E1DE;
 Thu,  7 Apr 2022 09:58:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 18CC71F45CC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649325506;
 bh=4JhwlWRjO0CnzyWEzVO1sVOFEnHl7+kZT9rj4eGLerw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bNraVnOH9Rg8cMTjWdgj0JSpgVHxQRUECNA+C7JwxDOZVVd0Rs+ZVbOD6eCeaEUK4
 amfTO9YV0GuLdFz5iQU1LRj6lTD/kORLNt0j/xbgUUK+DAYcw1UeWYIEwFFurSEVhO
 j1i1gLkCk2q2rA1sQUjmeR3ODlI9uncSekbN41AqAnmfqfVFbolxRbb0H47irTI3wc
 XdQzJ0Srp5LbqDY/5actT3/tKAK+c2CaKD9XMyjzyQ0gpM7VdaBSrSVboK5Qv6JQyF
 QEv1uO6wjLeDoGRDLnuLFlxTBZaJt4DgjSehnVKF8PNKUBHK+7TK7nXC9lvWS7QKQh
 zxwjFqJZp6v6w==
Message-ID: <2fd35c28-0911-df87-c7e4-f7cbdba1f09d@collabora.com>
Date: Thu, 7 Apr 2022 12:58:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 10/10] drm/msm: Add a way for userspace to allocate GPU
 iova
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220406214636.1156978-1-robdclark@gmail.com>
 <20220406214636.1156978-11-robdclark@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220406214636.1156978-11-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Emma Anholt <emma@anholt.net>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/7/22 00:46, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The motivation at this point is mainly native userspace mesa driver in a
> VM guest.  The one remaining synchronous "hotpath" is buffer allocation,
> because guest needs to wait to know the bo's iova before it can start
> emitting cmdstream/state that references the new bo.  By allocating the
> iova in the guest userspace, we no longer need to wait for a response
> from the host, but can just rely on the allocation request being
> processed before the cmdstream submission.  Allocation failures (OoM,
> etc) would just be treated as context-lost (ie. GL_GUILTY_CONTEXT_RESET)
> or subsequent allocations (or readpix, etc) can raise GL_OUT_OF_MEMORY.
> 
> v2: Fix inuse check
> v3: Change mismatched iova case to -EBUSY
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++
>  drivers/gpu/drm/msm/msm_drv.c           | 21 +++++++++++
>  drivers/gpu/drm/msm/msm_gem.c           | 48 +++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_gem.h           |  8 +++++
>  drivers/gpu/drm/msm/msm_gem_vma.c       |  2 ++
>  include/uapi/drm/msm_drm.h              |  3 ++
>  6 files changed, 92 insertions(+)

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

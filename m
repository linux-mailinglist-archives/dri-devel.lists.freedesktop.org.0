Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1F75EA30C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 13:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1F710E293;
	Mon, 26 Sep 2022 11:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (mail.nfschina.com [124.16.136.209])
 by gabe.freedesktop.org (Postfix) with ESMTP id BCFE810E293;
 Mon, 26 Sep 2022 11:19:21 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id C4E331E80D6C;
 Mon, 26 Sep 2022 19:15:18 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HM1C-YBnYyoV; Mon, 26 Sep 2022 19:15:16 +0800 (CST)
Received: from [172.30.38.124] (unknown [180.167.10.98])
 (Authenticated sender: liqiong@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id D82A01E80D3D;
 Mon, 26 Sep 2022 19:15:15 +0800 (CST)
Subject: Re: [PATCH] drm/msm/gem: Use size_add() against integer overflow
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220926092315.17193-1-liqiong@nfschina.com>
From: liqiong <liqiong@nfschina.com>
Message-ID: <80db9ee7-481e-9793-87a6-83a9be6836ec@nfschina.com>
Date: Mon, 26 Sep 2022 19:19:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20220926092315.17193-1-liqiong@nfschina.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Yu Zhe <yuzhe@nfschina.com>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



在 2022年09月26日 17:23, Li Qiong 写道:
> "struct_size() + n" may cause a integer overflow,
> use size_add() to handle it.
>
> Signed-off-by: Li Qiong <liqiong@nfschina.com>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index c9e4aeb14f4a..3dec87e46e50 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -30,8 +30,8 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>  	uint64_t sz;
>  	int ret;
>  
> -	sz = struct_size(submit, bos, nr_bos) +
> -			((u64)nr_cmds * sizeof(submit->cmd[0]));
> +	sz = size_add(struct_size(submit, bos, nr_bos),
> +			((u64)nr_cmds * sizeof(submit->cmd[0])));
>  
>  	if (sz > SIZE_MAX)
>  		return ERR_PTR(-ENOMEM);

Sorry,  This patch a mistake, drop it ,  please.




Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6DE9C40E8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 15:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CF610E1D6;
	Mon, 11 Nov 2024 14:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="rCmAHFyt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496A510E1D6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 14:29:15 +0000 (UTC)
Message-ID: <295ec119-b862-4ab9-bc24-c1a98313cd39@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1731335353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Ln2j19kFbUmJ8iVDewbftH/CZUQmtLyzIATkBOnw74=;
 b=rCmAHFytQ5/ZUTUZ2PSgwSERD83R8BbD6/6IHj9Kwd19otl+lEUNZGEFDQY7QEjhWoduXa
 99ZTZVbjHx3m187hglFCaSO9tcSOh+jEQlo+weGMYnUeGbNMU/Hi+x+WWmn7Z/VWqGGa2R
 TLyjtfP3GlV/XG1toAPtrtF7AT5H3B4=
Date: Mon, 11 Nov 2024 09:29:08 -0500
MIME-Version: 1.0
Subject: Re: [PATCH next] drm: zynqmp_dp: Unlock on error in
 zynqmp_dp_bridge_atomic_enable()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <b4042bd9-c943-4738-a2e1-8647259137c6@stanley.mountain>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <b4042bd9-c943-4738-a2e1-8647259137c6@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On 11/11/24 04:06, Dan Carpenter wrote:
> We added some locking to this function, but accidentally forgot to unlock
> if zynqmp_dp_mode_configure() failed.  Use a guard lock to fix it.
> 
> Fixes: a7d5eeaa57d7 ("drm: zynqmp_dp: Add locking")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 25c5dc61ee88..0bea908b281e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1537,7 +1537,7 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>  
>  	pm_runtime_get_sync(dp->dev);
>  
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>  	zynqmp_dp_disp_enable(dp, old_bridge_state);
>  
>  	/*
> @@ -1598,7 +1598,6 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>  	zynqmp_dp_write(dp, ZYNQMP_DP_SOFTWARE_RESET,
>  			ZYNQMP_DP_SOFTWARE_RESET_ALL);
>  	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 1);
> -	mutex_unlock(&dp->lock);
>  }
>  
>  static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>

Although this reverses the order of pm_runtime_put and mutex_unlock in
the error case, I don't think it matters.

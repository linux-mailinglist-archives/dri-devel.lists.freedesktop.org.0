Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C39284733
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E306E40B;
	Tue,  6 Oct 2020 07:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from r3-24.sinamail.sina.com.cn (r3-24.sinamail.sina.com.cn
 [202.108.3.24])
 by gabe.freedesktop.org (Postfix) with SMTP id CD47F89DA8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 09:24:34 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([123.123.27.212])
 by sina.com with ESMTP
 id 5F7AE64C00029A31; Mon, 5 Oct 2020 17:24:30 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 19312254919387
From: Hillf Danton <hdanton@sina.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 13/14] drm/msm: Drop struct_mutex in shrinker path
Date: Mon,  5 Oct 2020 17:24:19 +0800
Message-Id: <20201005092419.15608-1-hdanton@sina.com>
In-Reply-To: <20201004192152.3298573-14-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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
 Hillf Danton <hdanton@sina.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun,  4 Oct 2020 12:21:45
> From: Rob Clark <robdclark@chromium.org>
> 
> Now that the inactive_list is protected by mm_lock, and everything
> else on per-obj basis is protected by obj->lock, we no longer depend
> on struct_mutex.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c          |  1 -
>  drivers/gpu/drm/msm/msm_gem_shrinker.c | 54 --------------------------
>  2 files changed, 55 deletions(-)
> 
[...]

> @@ -71,13 +33,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>  {
>  	struct msm_drm_private *priv =
>  		container_of(shrinker, struct msm_drm_private, shrinker);
> -	struct drm_device *dev = priv->dev;
>  	struct msm_gem_object *msm_obj;
>  	unsigned long freed = 0;
> -	bool unlock;
> -
> -	if (!msm_gem_shrinker_lock(dev, &unlock))
> -		return SHRINK_STOP;
>  
>  	mutex_lock(&priv->mm_lock);

Better if the change in behavior is documented that SHRINK_STOP will
no longer be needed.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

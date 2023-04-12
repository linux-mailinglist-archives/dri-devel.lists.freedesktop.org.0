Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E116DED1C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 10:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28A310E732;
	Wed, 12 Apr 2023 08:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C9710E732
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 07:59:59 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f05f61adbeso1772915e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 00:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681286398;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hFlRIIUh3fBa8yw0wSF2rOl9C95JD+4ynAFq7zW8TwE=;
 b=OpxTU0fGJxKU+CrXRczin0Q+PgR+zvxqLE/pQiaMqy5DnqEmRva70ckUZJizotmC9r
 5Mb4nw44HoJ/d2rmHg9DAYKmp/CPnLykUGaEeb5husVOGxS6++jnJRHpZsOOry7I+T6P
 CZej2GVVlh7bWYVYH2suqmZVAUMIK6xfwZ+HM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681286398;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hFlRIIUh3fBa8yw0wSF2rOl9C95JD+4ynAFq7zW8TwE=;
 b=x+ZZRxzyI4MBBlrEVER9T5tOii4fk4sHONiXMePoHcC3/mIr7X8fNq+3ahjMa3vb8e
 jTMitgGbeCRe+c6A7CJ5l8dXNnycPWiCitDKyvtqCzu6zUrD8LaWYLujXdY/VT8OTnot
 fKRWOcqA3PqYbDnh3tbW0eyvPukREbnWjJiU2e8K0OcJ6/La0jntR7Bewl/cMD9S3bUZ
 NgyIV6T92+xSQgSKPiFkA2dK29fs97UNp6CpesMvv1renrXLPJaM2ud2PwAMHh3t3gmz
 p4vXuoawG2arZkHgd274bigS2Ih8S+3pAYBjx7cGTrolTfrfP0oBRBi+MmSsKgQJtVdS
 UgHA==
X-Gm-Message-State: AAQBX9cbztsqOY+nJvshMIYaYr+GlIQnKBnq7jraKKth0vuia5WTARDr
 xaSIOxWoJmi8QeOYz39hB31+eg==
X-Google-Smtp-Source: AKy350ZHiR9c7VWZmADxLh2om5p/3nqBGUH/HLC8Y+BXO7bBWAfjGJFy8BkJOsZcgsiemAe1kirxWA==
X-Received: by 2002:a05:600c:4f08:b0:3ed:793d:9dd6 with SMTP id
 l8-20020a05600c4f0800b003ed793d9dd6mr1199398wmq.1.1681286397728; 
 Wed, 12 Apr 2023 00:59:57 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 m10-20020a05600c3b0a00b003ef5e5f93f5sm1466970wms.19.2023.04.12.00.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 00:59:57 -0700 (PDT)
Date: Wed, 12 Apr 2023 09:59:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v3 5/7] drm/etnaviv: Switch to fdinfo helper
Message-ID: <ZDZk+8uWouvMtWle@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Christopher Healy <healych@amazon.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20230411225725.2032862-1-robdclark@gmail.com>
 <20230411225725.2032862-6-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411225725.2032862-6-robdclark@gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 03:56:10PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

You're on an old tree, this got reverted. But I'm kinda wondering whether
another patch on top shouldn't just includ the drm_show_fdinfo in
DRM_GEM_FOPS macro ... There's really no good reasons for drivers to not
have this I think?
-Daniel

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 44ca803237a5..170000d6af94 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -476,9 +476,8 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
>  	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
>  };
>  
> -static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
> +static void etnaviv_fop_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>  {
> -	struct drm_file *file = f->private_data;
>  	struct drm_device *dev = file->minor->dev;
>  	struct etnaviv_drm_private *priv = dev->dev_private;
>  	struct etnaviv_file_private *ctx = file->driver_priv;
> @@ -487,8 +486,6 @@ static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
>  	 * For a description of the text output format used here, see
>  	 * Documentation/gpu/drm-usage-stats.rst.
>  	 */
> -	seq_printf(m, "drm-driver:\t%s\n", dev->driver->name);
> -	seq_printf(m, "drm-client-id:\t%u\n", ctx->id);
>  
>  	for (int i = 0; i < ETNA_MAX_PIPES; i++) {
>  		struct etnaviv_gpu *gpu = priv->gpu[i];
> @@ -507,7 +504,7 @@ static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
>  			cur = snprintf(engine + cur, sizeof(engine) - cur,
>  				       "%sNN", cur ? "/" : "");
>  
> -		seq_printf(m, "drm-engine-%s:\t%llu ns\n", engine,
> +		drm_printf(p, "drm-engine-%s:\t%llu ns\n", engine,
>  			   ctx->sched_entity[i].elapsed_ns);
>  	}
>  }
> @@ -515,7 +512,7 @@ static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
>  static const struct file_operations fops = {
>  	.owner = THIS_MODULE,
>  	DRM_GEM_FOPS,
> -	.show_fdinfo = etnaviv_fop_show_fdinfo,
> +	.show_fdinfo = drm_fop_show_fdinfo,
>  };
>  
>  static const struct drm_driver etnaviv_drm_driver = {
> @@ -529,6 +526,7 @@ static const struct drm_driver etnaviv_drm_driver = {
>  #ifdef CONFIG_DEBUG_FS
>  	.debugfs_init       = etnaviv_debugfs_init,
>  #endif
> +	.show_fdinfo        = etnaviv_fop_show_fdinfo,
>  	.ioctls             = etnaviv_ioctls,
>  	.num_ioctls         = DRM_ETNAVIV_NUM_IOCTLS,
>  	.fops               = &fops,
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

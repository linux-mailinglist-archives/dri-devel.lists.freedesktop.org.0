Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1373A290D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 12:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F9E6ECBB;
	Thu, 10 Jun 2021 10:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E8D6ECBB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 10:10:57 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so6047373wmg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 03:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=5ZeqK3HUGMU0I48g2CrdimQGpsG/P2Fm0SB2rJBA/ig=;
 b=aGMbzbK1h0Cd5C0t9Z3TF/pasVGK/w7r/+ch+aAz14hUy40O+6QVoqnFZNjaC55ljP
 4GUNwDrHQSKJlfOx8+UdoGm4fzDfKYDrlhtpHvPhS48xm1xIUrr8RoImy7ZCnPMAUjKw
 sgoqEt6SSmGZnYnIznUd1/Pf96LsWkqPvGayU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=5ZeqK3HUGMU0I48g2CrdimQGpsG/P2Fm0SB2rJBA/ig=;
 b=TrmUnNKYOC/8G+6//jHUmQ3XdO0j5ODOkx1C/oIIR0wMX2Ucy6IBUvL2ekwllpAAKL
 ENJxHDQpsAuAA3ifut8LJuSK4ViuglcbluLQ6PZSmLE4xjEX9rCv6xjnyK1cTtlVFRL9
 eWFucjBRcsZ9MF6oZTko/jhRCyEoQmeb0ryN9K+OZj8hpLPr4l13CPSQTXINxbqJLZ36
 AP9yj3DpcHIZd/wKroTnezXqg9EcC3nuk+pMluohC+Obc3rpL5r3fnqGc69DGGIM1OwP
 QdGMhs+SPXmOc1r3+HhifTXJgdEj6mStYcpD/FrIT/pPelyd3Np9viGVGIxXBpBQOTYP
 tKLw==
X-Gm-Message-State: AOAM530jzJTZrNO46v9W90oKxoPJ6VDKYVo60Qkg9LGNaXKjf32d1P2m
 xAweFMPc48QyjvJ6GbZ22sqbgEVcvbr4Vw==
X-Google-Smtp-Source: ABdhPJx8m3+mYf6GO8iNd3ecqDNmRAG+tsOPxNYY58+AEcXlbsFNNcsRKOlwZ/kVSeNufh93SOrIVQ==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr4353737wmh.130.1623319856112; 
 Thu, 10 Jun 2021 03:10:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f5sm3386554wrf.22.2021.06.10.03.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 03:10:55 -0700 (PDT)
Date: Thu, 10 Jun 2021 12:10:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH] drm: Lock pointer access in drm_master_release()
Message-ID: <YMHlLQHRLWgWlXTs@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20210609092119.173590-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609092119.173590-1-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: tzimmermann@suse.de, airlied@linux.ie, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 09, 2021 at 05:21:19PM +0800, Desmond Cheong Zhi Xi wrote:
> This patch eliminates the following smatch warning:
> drivers/gpu/drm/drm_auth.c:320 drm_master_release() warn: unlocked access 'master' (line 318) expected lock '&dev->master_mutex'
> 
> The 'file_priv->master' field should be protected by the mutex lock to
> '&dev->master_mutex'. This is because other processes can concurrently
> modify this field and free the current 'file_priv->master'
> pointer. This could result in a use-after-free error when 'master' is
> dereferenced in subsequent function calls to
> 'drm_legacy_lock_master_cleanup()' or to 'drm_lease_revoke()'.
> 
> An example of a scenario that would produce this error can be seen
> from a similar bug in 'drm_getunique()' that was reported by Syzbot:
> https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803
> 
> In the Syzbot report, another process concurrently acquired the
> device's master mutex in 'drm_setmaster_ioctl()', then overwrote
> 'fpriv->master' in 'drm_new_set_master()'. The old value of
> 'fpriv->master' was subsequently freed before the mutex was unlocked.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Thanks a lot. I've done an audit of this code, and I found another
potential problem in drm_is_current_master. The callers from drm_auth.c
hold the dev->master_mutex, but all the external ones dont. I think we
need to split this into a _locked function for use within drm_auth.c, and
the exported one needs to grab the dev->master_mutex while it's checking
master status. Ofc there will still be races, those are ok, but right now
we run the risk of use-after free problems in drm_lease_owner.

Are you up to do that fix too?

I think the drm_lease.c code also needs an audit, there we'd need to make
sure that we hold hold either the lock or a full master reference to avoid
the use-after-free issues here.

Patch merged to drm-misc-fixes with cc: stable.
-Daniel

> ---
>  drivers/gpu/drm/drm_auth.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index f00e5abdbbf4..b59b26a71ad5 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -315,9 +315,10 @@ int drm_master_open(struct drm_file *file_priv)
>  void drm_master_release(struct drm_file *file_priv)
>  {
>  	struct drm_device *dev = file_priv->minor->dev;
> -	struct drm_master *master = file_priv->master;
> +	struct drm_master *master;
> 
>  	mutex_lock(&dev->master_mutex);
> +	master = file_priv->master;
>  	if (file_priv->magic)
>  		idr_remove(&file_priv->master->magic_map, file_priv->magic);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

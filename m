Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730231FF66C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 17:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94536EB40;
	Thu, 18 Jun 2020 15:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92B76EB40
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592493512;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQYmuQ6MgsURSBqJgRafWuUZH2kgHeoFm2q5Vrdf7kM=;
 b=Eg+vedmJicogq6ACIDh9gok9aOoSkSS3gXXSulJDhm+/4ZfQ+jDBbUO9KwgLhSLKiq2ldg
 gUxwhe+7Jb38LiQmHtqJGrQxRhdcmUuBYiDadX+49j7+5uyVFEcrPQ9ttfq6JCcbg1Eqgr
 HpEZ/PjL8UUN83gCL20bbjRypw6cZXY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-tHQy24EiOpG4POlmI9NUBA-1; Thu, 18 Jun 2020 11:18:28 -0400
X-MC-Unique: tHQy24EiOpG4POlmI9NUBA-1
Received: by mail-qt1-f200.google.com with SMTP id x6so2648268qtq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 08:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=rQYmuQ6MgsURSBqJgRafWuUZH2kgHeoFm2q5Vrdf7kM=;
 b=MMqzXcK/Y3LxzJvBNnbRc9tNrpPEVzTUTOQYi+z0zy9jRO/ouQWx1JjQIgDow00HcC
 2SUjTf9ueXMaB3nW1rpPwFRUaWZjNWp4z5KQop4Q/HUtUtsoyi38f/uKEbAz/eYmWYGb
 VEbhpCQKdQKQ2B27k1BDLy9leksKE+OxIw/lZu0hDVvfc4ByQHLxeR1A+p+jdVnQYtaP
 8Yy5s+AXKuIyA0WiFvVIAVZO1SxR7R/URoFtQqR87ICiJDAQdr6X3yHPpoXwHrSFsWnM
 GvbFrQVCd95KbzThUbh9SGAh2i8rdwMhGBQWqRvbqq7CQRYELH+7M+N0ltq3wYF+SBU4
 olKQ==
X-Gm-Message-State: AOAM5315ki3c5ZpWBl+ykuYDjsOzGnGaR4ZL1+N6kwyjyHHGdYUP6V5Q
 XTUBNVbQHev+4+yStppRWL6b4k5RwmG0I8UP6kqR+l8lziVFI/0hE0W+Xs4K0Qd+y3MrT/ETuPV
 bzXIlVGbULojYuClX7c87Xkm8XR2u
X-Received: by 2002:ac8:23fb:: with SMTP id r56mr4946257qtr.197.1592493508009; 
 Thu, 18 Jun 2020 08:18:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLgX4Z87MobK3H78vsTvXLd+/eu1CkxpTofEBBUyoXsAsemLOYYh7GV5x0KAA4BnDYUAMf5w==
X-Received: by 2002:ac8:23fb:: with SMTP id r56mr4946222qtr.197.1592493507790; 
 Thu, 18 Jun 2020 08:18:27 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (static-173-76-190-23.bstnma.ftas.verizon.net. [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id c2sm3131786qkl.58.2020.06.18.08.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 08:18:26 -0700 (PDT)
Message-ID: <0b1c1a07b6589e91701a1815400a56b66c5f480d.camel@redhat.com>
Subject: Re: [PATCH] drm/noveau: fix reference count leak in
 nv50_disp_atomic_commit
From: Lyude Paul <lyude@redhat.com>
To: Aditya Pakki <pakki001@umn.edu>
Date: Thu, 18 Jun 2020 11:18:25 -0400
In-Reply-To: <20200614012920.121567-1-pakki001@umn.edu>
References: <20200614012920.121567-1-pakki001@umn.edu>
Organization: Red Hat
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: wu000273@umn.edu, David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 James Jones <jajones@nvidia.com>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2020-06-13 at 20:29 -0500, Aditya Pakki wrote:
> nv50_disp_atomic_commit() calls calls pm_runtime_get_sync and in turn
> increments the reference count. In case of failure, decrement the
> ref count before returning the error.
> 
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index d472942102f5..b4039907f0d6 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2157,8 +2157,10 @@ nv50_disp_atomic_commit(struct drm_device *dev,
>  	int ret, i;
>  
>  	ret = pm_runtime_get_sync(dev->dev);
> -	if (ret < 0 && ret != -EACCES)
> +	if (ret < 0 && ret != -EACCES) {
> +		pm_runtime_put_autosuspend(dev->dev);

s/noveau/nouveau/ in the commit title, but other than that:

Reviewed-by: Lyude Paul <lyude@redhat.com>

>  		return ret;
> +	}
>  
>  	ret = drm_atomic_helper_setup_commit(state, nonblock);
>  	if (ret)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3827314CFFC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 18:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA91F6F60F;
	Wed, 29 Jan 2020 17:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF9E6F5FC;
 Wed, 29 Jan 2020 17:59:35 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20051116-1500050 for multiple; Wed, 29 Jan 2020 17:59:20 +0000
MIME-Version: 1.0
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200129082410.1691996-6-daniel.vetter@ffwll.ch>
References: <20200129082410.1691996-1-daniel.vetter@ffwll.ch>
 <20200129082410.1691996-6-daniel.vetter@ffwll.ch>
Message-ID: <158032075960.11197.12460347497729057056@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 5/5] drm: Nerv drm_global_mutex BKL for good drivers
Date: Wed, 29 Jan 2020 17:59:19 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2020-01-29 08:24:10)
> @@ -378,9 +409,10 @@ int drm_open(struct inode *inode, struct file *filp)
>         if (IS_ERR(minor))
>                 return PTR_ERR(minor);
>  
> -       mutex_unlock(&drm_global_mutex);
> -
>         dev = minor->dev;
> +       if (drm_dev_needs_global_mutex(dev))
> +               mutex_unlock(&drm_global_mutex);

Too soon, too soon.

> +
>         if (!atomic_fetch_inc(&dev->open_count))
>                 need_setup = 1;
>  
> @@ -398,13 +430,15 @@ int drm_open(struct inode *inode, struct file *filp)
>                 }
>         }
>  
> -       mutex_unlock(&drm_global_mutex);
> +       if (drm_dev_needs_global_mutex(dev))
> +               mutex_unlock(&drm_global_mutex);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA6E36853C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 18:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B719A6E0F3;
	Thu, 22 Apr 2021 16:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834986E0F3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 16:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2pmAAOlphVEHdnesrIql5j61oUTICxEPDYF38ZYro+4=; b=XNUj/TZ/3Y5CP92TUWGlGR0b9l
 pKHKyqo2nzYRqDSeP5P+cBk5x0uyLs85EEm9ZdnX1toRiu5tBaefkIV8uNQEmbMYgj4k9SRL37TjN
 w/ZBpVmEq7SPKecX+9zWgeAlkMiS9THCHJOQ00ygQ+vpoTb1UzRgTKAWZz+OXBSq7mDQR07ncYw0h
 eO8jaG5ZMKTJeCQm8lf6weyjKzVPasCXtbe2680rV3wgev+/6E5m2I51rVKWJvtquRMmwXruAoxIw
 W1neIHx3RD371qXEEPpsoujjN7wvmxiLidWLL5hraUrty3K2phXSTgNV19bwBe7TBiavwJJSUGMkS
 54QGLypQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lZcXC-000Xk6-DC; Thu, 22 Apr 2021 16:50:42 +0000
Date: Thu, 22 Apr 2021 17:50:34 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu/amdgpu_drv.c: Replace
 drm_modeset_lock_all with drm_modeset_lock
Message-ID: <20210422165034.GP3596236@casper.infradead.org>
References: <20210422155951.6314-1-fmdefrancesco@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210422155951.6314-1-fmdefrancesco@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Melissa Wen <melissa.srw@gmail.com>,
 outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 22, 2021 at 05:59:51PM +0200, Fabio M. De Francesco wrote:
> -		drm_modeset_lock_all(drm_dev);
> -
>  		drm_for_each_crtc(crtc, drm_dev) {
> +			drm_modeset_lock(&crtc->mutex, NULL);
>  			if (crtc->state->active) {
>  				ret = -EBUSY;
> -				break;
>  			}
> +			drm_modeset_unlock(&crtc->mutex);
> +			if (ret < 0)
> +				break;
>  		}
>  
> -		drm_modeset_unlock_all(drm_dev);
> -

I might remove the {} around ret = -EBUSY, but this is good.

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

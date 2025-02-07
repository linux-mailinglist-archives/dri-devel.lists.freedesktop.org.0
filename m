Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E783EA2C935
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 17:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C4710EB82;
	Fri,  7 Feb 2025 16:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Wx9CkIbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F87110EB7B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 16:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738946707;
 bh=vZhYNhVJlENcmP350wa8xjJ2Q4xsjVpRGiaD0AjrCik=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wx9CkIbZGlkze2Fe2FqWzWFvdFku+27oX6MLedl5eDs6eQlhZnPfy6Seo9GhFbjh3
 j9ALab2XYraH7ZOd+AFrE0OCiVCWGY2giw2w+4w2c3kdpNILdhA2gJs46Y0JM0TWuo
 hDSgxCsrm/wIC0yd6lZkj/UGUjrJYnl8EAiudg73D/0UyoOSkBtBM91m6aAyJnwfAs
 iuBqusb9Y+vthwIFKJG8+ynYCjYqqs4mtYEQ3f7h8uyz2Q5cR0ehZ/W5GQTLse197z
 8N+HbZNdRAQIxzd9bVExTCt9uZrQDzkRxFWEHpOEbPDVBBHYi9EpiGv0uNEIUyNk+3
 3ggN5n5eEc1UA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 85FA117E0239;
 Fri,  7 Feb 2025 17:45:06 +0100 (CET)
Date: Fri, 7 Feb 2025 17:44:56 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Su Hui <suhui@nfschina.com>, steven.price@arm.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, mary.guillemard@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: avoid garbage value in
 panthor_ioctl_dev_query()
Message-ID: <20250207174456.04eeee9c@collabora.com>
In-Reply-To: <01bf1bd2-2764-41a1-85aa-962f1197387f@stanley.mountain>
References: <20250119025828.1168419-1-suhui@nfschina.com>
 <01bf1bd2-2764-41a1-85aa-962f1197387f@stanley.mountain>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 20 Jan 2025 10:21:49 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> On Sun, Jan 19, 2025 at 10:58:29AM +0800, Su Hui wrote:
> > 'priorities_info' is uninitialized, and the uninitialized value is copied
> > to user object when calling PANTHOR_UOBJ_SET(). Using memset to initialize
> > 'priorities_info' to avoid this garbage value problem.
> > 
> > Fixes: f70000ef2352 ("drm/panthor: Add DEV_QUERY_GROUP_PRIORITIES_INFO dev query")
> > Signed-off-by: Su Hui <suhui@nfschina.com>  
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

Queued to drm-misc-fixes.

> 
> How did you find this bug?
> 
> regards,
> dan carpenter
> 


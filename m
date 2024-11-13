Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5A79C7807
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 16:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5D710E733;
	Wed, 13 Nov 2024 15:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="W3NX9bUr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC5D10E733
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731513575;
 bh=Le8D+asCfzeTxHXRhoA4dbUmRExEKstHkOVLC5hyQtY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W3NX9bUrZjRx+rmkg3R3HJCYF+Nli9r3b9Aojs0QSILP0HaFQS4WIRQQGmBceVMSi
 j/GPBwEOdFMLOA4jXpucuAz6arueINAUmjzahCwBa+oHVIaiAp5yMA2MsuldILUnfo
 i6Oaesilyw4rcJu1h8/t2VeEo1Ud6IkgrGLa+meR9WdmaXoF/cTPc7rKZ92iOFrOHo
 dC5XayRYMLl4xC7Rd4m5GGRvSvH2Tz1rf2A52XbZ4oPPFfqFCEL3nxzTfIXYE4yMh4
 MOOdBmAK7T4YIeH0rkXm7wET9nwTmnkzED4Kuzc7CLxtRcKR3O9uhuP20uD8yAP6KQ
 CbmNJx40Lv6SQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A627617E36F1;
 Wed, 13 Nov 2024 16:59:35 +0100 (CET)
Date: Wed, 13 Nov 2024 16:59:32 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH 2/5] drm/panthor: Be robust against runtime PM resume
 failures in the suspend path
Message-ID: <20241113165932.18df39fb@collabora.com>
In-Reply-To: <20241113154257.1971284-3-boris.brezillon@collabora.com>
References: <20241113154257.1971284-1-boris.brezillon@collabora.com>
 <20241113154257.1971284-3-boris.brezillon@collabora.com>
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

On Wed, 13 Nov 2024 16:42:54 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> @@ -541,17 +547,4 @@ int panthor_device_suspend(struct device *dev)
>  	clk_disable_unprepare(ptdev->clks.core);
>  	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
>  	return 0;
> -
> -err_set_active:
> -	/* If something failed and we have to revert back to an
> -	 * active state, we also need to clear the MMIO userspace
> -	 * mappings, so any dumb pages that were mapped while we
> -	 * were trying to suspend gets invalidated.
> -	 */
> -	mutex_lock(&ptdev->pm.mmio_lock);
> -	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_ACTIVE);
> -	unmap_mapping_range(ptdev->base.anon_inode->i_mapping,
> -			    DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
> -	mutex_unlock(&ptdev->pm.mmio_lock);
> -	return ret;
>  }

This chunk should be in patch 3.

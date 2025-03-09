Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D75A5895A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 00:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF1310E0AB;
	Sun,  9 Mar 2025 23:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JpILkOrk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DAE10E0AB
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 23:48:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4CA1D5C46B9;
 Sun,  9 Mar 2025 23:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F69CC4CEE3;
 Sun,  9 Mar 2025 23:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741564117;
 bh=lf6ZBbuxeUauTWqDo8TNf9cQ+rK8UKnvv+A3eXrj1X4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JpILkOrk2UpE7/J+gySr+GPsQabyHxxhL4ZOmM8tEEpJ6wzUnPJn+bJwsQ4Ydt4zn
 Ll9e2A9bkVA+bMLSV09+hhUpZ16gYgFerIBUKm9Lf6gk8PWLpBdkDIdbWkgHfnmnqI
 pUDIcK3jVkn3GP90Isji4FNO+RnJEPP3Yf5hn41CFj0CbEA+btaPMDpqIyJtfAYCvS
 qW3GH97rNMJo+1DsFYi9Uu9bp+S8zxOP60S3Z3jyU+24NHbZ22pc//jizGgzjl6W5H
 NQBQ4xfU8rsyDir0e26bnGno/ucdBVmK+2EdPWXY25BWc051AWwJB2RO8MkNWMT8No
 N5dQl7zTIFCGA==
Date: Sun, 9 Mar 2025 23:48:36 +0000
From: Wei Liu <wei.liu@kernel.org>
To: mhklinux@outlook.com
Cc: drawat.floss@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, christophe.jaillet@wanadoo.fr,
 ssengar@linux.microsoft.com, wei.liu@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/hyperv: Fix address space leak when Hyper-V DRM
 device is removed
Message-ID: <Z84o1IEo_irAp8mJ@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <20250210193441.2414-1-mhklinux@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210193441.2414-1-mhklinux@outlook.com>
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

On Mon, Feb 10, 2025 at 11:34:41AM -0800, mhkelley58@gmail.com wrote:
> From: Michael Kelley <mhklinux@outlook.com>
> 
> When a Hyper-V DRM device is probed, the driver allocates MMIO space for
> the vram, and maps it cacheable. If the device removed, or in the error
> path for device probing, the MMIO space is released but no unmap is done.
> Consequently the kernel address space for the mapping is leaked.
> 
> Fix this by adding iounmap() calls in the device removal path, and in the
> error path during device probing.
> 
> Fixes: f1f63cbb705d ("drm/hyperv: Fix an error handling path in hyperv_vmbus_probe()")
> Fixes: a0ab5abced55 ("drm/hyperv : Removing the restruction of VRAM allocation with PCI bar size")
> Signed-off-by: Michael Kelley <mhklinux@outlook.com>

Applied to hyperv-fixes. Thanks.

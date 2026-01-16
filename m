Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F3FD2E90B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 10:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE25710E83A;
	Fri, 16 Jan 2026 09:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="blMA4ccs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407ED10E838
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 09:13:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AFC3643A6F;
 Fri, 16 Jan 2026 09:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CC1C116C6;
 Fri, 16 Jan 2026 09:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768554820;
 bh=mLYzN5UqM+HvTCcP8XCike0pwHL9S/sIn2p4PFTMQC0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=blMA4ccs2NpwNePBouS27UscMZUBtyVqvXEfqIpT0Z3dXytTOpvIz6IBx9Sh5HWTg
 gH+UIO1q5nfmuXfglCIOYKDxuCDDrNlRcvbvnQYKQiFEQmTraDCw+40cErq6j8s5le
 HOgg2u+hggxKGMDyT3xwueILf25Xe6wGXfFAxhJcLIHWMxM20B7GyREz72QJ8Oksbm
 +cc9axGurjCAls17U4CfFP8WVr21H6N9Cqfx5mZrmYjvRmfnvcLuzQYkmFNOxRSCdo
 SrvAocr6+UdlSisCugR++V62Xhhe6z7yAfQZ3howS+cQ4qJePvK9AjE13szg81n+ym
 C/GnBAHiM5l2Q==
Date: Fri, 16 Jan 2026 09:13:36 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
 samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 00/12] drm, coreboot: Add DRM coreboot driver
Message-ID: <aWoBQGckP3q8KcDX@google.com>
References: <20260115082128.12460-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082128.12460-1-tzimmermann@suse.de>
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

On Thu, Jan 15, 2026 at 08:57:10AM +0100, Thomas Zimmermann wrote:
> Coreboot implements framebuffer support via simple-framebuffer. Provide a
> dedicated DRM driver. Keep the simple-framebuffer code for now.
> 
> For each firmware's provided framebuffer, we prefer a dedicated DRM driver
> tailored towards the platform's feature set. The coreboot framebuffer
> device currently creates a simple-framebuffer device for the provided
> framebuffer aperture. But simple-framebuffer is for DeviceTree nodes; not
> for coreboot. The simple-framebuffer infrastructure should be phased out
> for non-DT use cases. Coreboot is one of the final users of the code
> (besides n64).
> 
> Patches 1 to 5 start by fixing problems in the coreboot framebuffer
> implementation. There is a possible dangling pointer, the memory is
> marked as busy, the device hierarchy is incorrect, and a few minor things.
> 
> Patches 6 to 9 prepare the coreboot support for use by external drivers.
> Specifically, structures for the entries os the coreboot payload table
> have to be exported.
> 
> Patches 10 to 12 add corebootdrm, a DRM driver for the new
> coreboot-framebuffer platform device. Corebootdrm follows the pattern
> established by similar drivers. It also uses the same sysfb helpers. It
> is therefore fairly small. With patch 11, it has feature parity with
> simpledrm on the old simple-framebuffer. Patch 12 adds support for panel-
> orientation flags that coreboot makes available.

What would you suggest to submit the patches (e.g., which patches submit
through which tree)?  Do they have build-time dependencies?

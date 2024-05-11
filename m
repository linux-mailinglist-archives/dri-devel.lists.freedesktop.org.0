Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268EF8C308C
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 12:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E8410E07D;
	Sat, 11 May 2024 10:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J7baCJoX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A1610E07D
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 10:13:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 48955CE062A;
 Sat, 11 May 2024 10:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C630C4AF09;
 Sat, 11 May 2024 10:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1715422388;
 bh=sY4E2uikkRVPa50fJdTiW26GKT1LoEB7hA3kqOi786o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J7baCJoXTFIuOLfL4afkEaDIDcNcBHiY34IOwFbKvzytrpfdIJHlp9WRcqGDSGCY9
 tZHBgrkXjXvVMFAG4JaH2P1OmTJC6A4tKyTcJiHCwjXg3qgRsYguDK7CGYFyK39H55
 CCykDM3P32OjwgaBJaa6k7c1SQcDli/PjzFSHCDo=
Date: Sat, 11 May 2024 11:13:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/bridge: aux-hpd-bridge: correct
 devm_drm_dp_hpd_bridge_add() stub
Message-ID: <2024051133-morphing-cradling-d7b8@gregkh>
References: <20240511-fix-aux-hpd-stubs-v1-1-98dae71dfaec@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240511-fix-aux-hpd-stubs-v1-1-98dae71dfaec@linaro.org>
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

On Sat, May 11, 2024 at 11:54:30AM +0300, Dmitry Baryshkov wrote:
> If CONFIG_DRM_AUX_HPD_BRIDGE is not enabled, the aux-bridge.h header
> provides a stub for the bridge's functions. Correct the arguments list
> of one of those stubs to match the argument list of the non-stubbed
> function.
> 
> Fixes: e5ca263508f7 ("drm/bridge: aux-hpd: separate allocation and registration")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202405110428.TMCfb1Ut-lkp@intel.com/
> Cc: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  include/drm/bridge/aux-bridge.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

You beat me to it, thanks!  I'll take this through the usb-next tree as
we have a commit there that requires this to build properly on 0-day
testing.

greg k-h

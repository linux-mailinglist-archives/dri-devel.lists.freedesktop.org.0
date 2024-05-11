Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ECD8C3097
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 12:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DF510E0BF;
	Sat, 11 May 2024 10:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P+m/I/Xe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B52410E0BF
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 10:29:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9F725CE01C8;
 Sat, 11 May 2024 10:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B746C2BBFC;
 Sat, 11 May 2024 10:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715423362;
 bh=PMAOwpgrZ/FIs0F+Zm1F7GYZkjeMZ8mXeT9Vjz1iQKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P+m/I/XepZWIXPMMtrcIJyMaaTAVELjIGDXFmg2qEADMWmje79euTE0sVQAe9UU2b
 FrqUySHoJI+qxgdWk2CEKwZtGIo4Qg+9cW+5VhVQRlONW99TIRdq3GUKGvWZ6eN1m0
 uMiDYVokDyvWwwNR27Xs0/J2N+jsUkrmbFxmlsNLLCz4OQ5lUxmUBOTLVhw/HzBKaI
 gxgcPrzrZhCQfOySVg5iaO+dqtwhSkdsveySxX91Nhk1TJmTcpUAHH0P33tQCJFTEw
 7VQxV//HrfQCYAPuobJ5l0/p1jkZ1Pp77OrwCBVb/aGRW39bWmqOoyT/1gTy20eqL7
 N+wQJ6+gtGbGg==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1s5jyr-000000004cA-1Mhi;
 Sat, 11 May 2024 12:29:29 +0200
Date: Sat, 11 May 2024 12:29:29 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/bridge: aux-hpd-bridge: correct
 devm_drm_dp_hpd_bridge_add() stub
Message-ID: <Zj9IiezupybPOxIn@hovoldconsulting.com>
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

Thanks for fixing this.

This one should also be backported (e.g. as the patch that can trigger
this probably also should be backported to 6.8 [1]):

Cc: stable@vger.kernel.org	# 6.8
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Johan

[1] https://lore.kernel.org/r/20240424-qc-pmic-typec-hpd-split-v4-1-f7e10d147443@linaro.org 

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C487F87D9CC
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 11:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC09210E6C3;
	Sat, 16 Mar 2024 10:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fFlut+ct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75D510E6C3
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 10:41:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A792ECE1A4B;
 Sat, 16 Mar 2024 10:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833DBC43390;
 Sat, 16 Mar 2024 10:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710585705;
 bh=VvZZEADe/yjZo+gK5HdF8YmkQc3//fHA5cwRHHUoupI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fFlut+ctJhF18SbVxoUKwpANag+xrSwhU4G9rzBfcB0QYShA86thiC3nc5Glm6yzq
 A88I4dyu6EpFFc8MMNgOBgiANqAFQIqzt6dw+PzuWfk9uT8DboNr5Ih3+pL8hGk/0D
 3kHEf9bn8jWAH7JvcO9+qkhyUAmJ/fASoargC3F9Pw6Byx2fDKF2jZ1HEyo66zNDBI
 daOHh4ZSSgtJcV+tmA9SRNQqI61WB95M1UOnt3aFf7MEuMpheEfpfOcnVxXkpzjfCm
 zL7tzMHLggeBLsxDCdKG1CO2sGIYvE83Pxej0LgKljGElw+pv3f0GbADAT3iUzBhjb
 pHQRVRZR8i5DQ==
Date: Sat, 16 Mar 2024 06:41:44 -0400
From: Sasha Levin <sashal@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: stable@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH stable-6.7] soc: qcom: pmic_glink_altmode: fix drm bridge
 use-after-free
Message-ID: <ZfV3aIjuV9PDplWn@sashalap>
References: <20240308090357.8758-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240308090357.8758-1-johan+linaro@kernel.org>
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

On Fri, Mar 08, 2024 at 10:03:57AM +0100, Johan Hovold wrote:
>commit b979f2d50a099f3402418d7ff5f26c3952fb08bb upstream.
>
>A recent DRM series purporting to simplify support for "transparent
>bridges" and handling of probe deferrals ironically exposed a
>use-after-free issue on pmic_glink_altmode probe deferral.
>
>This has manifested itself as the display subsystem occasionally failing
>to initialise and NULL-pointer dereferences during boot of machines like
>the Lenovo ThinkPad X13s.
>
>Specifically, the dp-hpd bridge is currently registered before all
>resources have been acquired which means that it can also be
>deregistered on probe deferrals.
>
>In the meantime there is a race window where the new aux bridge driver
>(or PHY driver previously) may have looked up the dp-hpd bridge and
>stored a (non-reference-counted) pointer to the bridge which is about to
>be deallocated.
>
>When the display controller is later initialised, this triggers a
>use-after-free when attaching the bridges:
>
>	dp -> aux -> dp-hpd (freed)
>
>which may, for example, result in the freed bridge failing to attach:
>
>	[drm:drm_bridge_attach [drm]] *ERROR* failed to attach bridge /soc@0/phy@88eb000 to encoder TMDS-31: -16
>
>or a NULL-pointer dereference:
>
>	Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>	...
>	Call trace:
>	  drm_bridge_attach+0x70/0x1a8 [drm]
>	  drm_aux_bridge_attach+0x24/0x38 [aux_bridge]
>	  drm_bridge_attach+0x80/0x1a8 [drm]
>	  dp_bridge_init+0xa8/0x15c [msm]
>	  msm_dp_modeset_init+0x28/0xc4 [msm]
>
>The DRM bridge implementation is clearly fragile and implicitly built on
>the assumption that bridges may never go away. In this case, the fix is
>to move the bridge registration in the pmic_glink_altmode driver to
>after all resources have been looked up.
>
>Incidentally, with the new dp-hpd bridge implementation, which registers
>child devices, this is also a requirement due to a long-standing issue
>in driver core that can otherwise lead to a probe deferral loop (see
>commit fbc35b45f9f6 ("Add documentation on meaning of -EPROBE_DEFER")).
>
>[DB: slightly fixed commit message by adding the word 'commit']
>Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
>Fixes: 2bcca96abfbf ("soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE")
>Cc: <stable@vger.kernel.org>      # 6.3
>Cc: Bjorn Andersson <andersson@kernel.org>
>Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>Reviewed-by: Bjorn Andersson <andersson@kernel.org>
>Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>Link: https://patchwork.freedesktop.org/patch/msgid/20240217150228.5788-4-johan+linaro@kernel.org
>[ johan: backport to 6.7 which does not have DRM aux bridge ]
>Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Queued up, thanks!

-- 
Thanks,
Sasha

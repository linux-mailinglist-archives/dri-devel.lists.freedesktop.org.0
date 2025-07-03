Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D04AF6FE2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 12:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7991110E05E;
	Thu,  3 Jul 2025 10:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="UMvZTPf5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBA510E05E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 10:21:45 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250703102143euoutp02f2db49f0d4752d403fb791014b9ddd23~OtqATatPV0930209302euoutp02O
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 10:21:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250703102143euoutp02f2db49f0d4752d403fb791014b9ddd23~OtqATatPV0930209302euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1751538103;
 bh=nS7gGLPcYu431wACYDIpnQCjfgmdMYV2m+06WEOimxI=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=UMvZTPf5MFlYbVthTszDlaAh2NyGedz2J80TIqan8EPLEip18Xoe//ExhI+DzeMZ7
 Y414rsSATVtoYPH/HyaGIRHkKHOIJbBL0jjLdx0Ln3JoUL8WtRta+WIHlpziSIfn4m
 j5SnuJeiSMBtJPx9MMOL0WQSQXWRykSbsz9ilvEw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250703102143eucas1p273c64519df9ebb05e9b3a7d9a38ad341~Otp-qSogJ1836718367eucas1p2p;
 Thu,  3 Jul 2025 10:21:43 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250703102141eusmtip2ab7c1f9865f3ac73941aa40cc36a67b8~Otp_moHuq2747427474eusmtip20;
 Thu,  3 Jul 2025 10:21:41 +0000 (GMT)
Message-ID: <fa235fa1-d5ad-44b7-bf52-068ea41fc9ea@samsung.com>
Date: Thu, 3 Jul 2025 12:21:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drm/imagination: Use pwrseq for TH1520 GPU power
 management
To: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel
 <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Drew Fustini <fustini@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250626-apr_14_for_sending-v7-1-6593722e0217@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250703102143eucas1p273c64519df9ebb05e9b3a7d9a38ad341
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250626093356eucas1p1adfcd565173d939f82e15252189c316f
X-EPHeader: CA
X-CMS-RootMailID: 20250626093356eucas1p1adfcd565173d939f82e15252189c316f
References: <20250626-apr_14_for_sending-v7-0-6593722e0217@samsung.com>
 <CGME20250626093356eucas1p1adfcd565173d939f82e15252189c316f@eucas1p1.samsung.com>
 <20250626-apr_14_for_sending-v7-1-6593722e0217@samsung.com>
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



On 6/26/25 11:33, Michal Wilczynski wrote:
> Update the Imagination PVR DRM driver to leverage the pwrseq framework
> for managing the complex power sequence of the GPU on the T-HEAD TH1520
> SoC.
> 
> To cleanly separate platform specific logic from the generic driver,
> this patch introduces a `pwr_power_sequence_ops` struct containing
> function pointers for power_on and power_off operations. This allows for
> different power management strategies to be selected at probe time based
> on the device's compatible string.
> 
> A `pvr_device_data` struct, associated with each compatible in the
> of_device_id table, points to the appropriate ops table (manual or
> pwrseq).
> 
> At probe time, the driver inspects the assigned ops struct. If the
> pwrseq variant is detected, the driver calls
> devm_pwrseq_get("gpu-power"), deferring probe if the sequencer is not
> yet available. Otherwise, it falls back to the existing manual clock and
> reset handling. The runtime PM callbacks now call the appropriate
> functions via the ops table.
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/gpu/drm/imagination/pvr_device.c |  36 +++++++-
>  drivers/gpu/drm/imagination/pvr_device.h |  17 ++++
>  drivers/gpu/drm/imagination/pvr_drv.c    |  27 +++++-
>  drivers/gpu/drm/imagination/pvr_power.c  | 139 ++++++++++++++++++++++---------
>  drivers/gpu/drm/imagination/pvr_power.h  |  13 +++
>  5 files changed, 185 insertions(+), 47 deletions(-)
> 

Hi,

I'm checking in on the status of my pwrseq patch above. Is this on track
for the next merge window?

Please let me know if there's anything else needed from my end to help
get it ready.

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

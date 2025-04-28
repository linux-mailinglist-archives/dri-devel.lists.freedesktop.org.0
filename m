Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4C1A9E9CD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 09:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D16910E1FE;
	Mon, 28 Apr 2025 07:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hddJxAKF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C92810E0C6;
 Mon, 28 Apr 2025 07:45:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 12C5E5C578A;
 Mon, 28 Apr 2025 07:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B8FC4CEE4;
 Mon, 28 Apr 2025 07:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745826323;
 bh=t0Da91DWrbzujPj1g6eKoWgpJ0WoF4h007/WWJU4frk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hddJxAKFJISn2zWBvXWpe1bcwMG1Bww03EhSUYat2xtGuVjmbgrwIntzPhyCCrgiS
 cYmxEfK2NNIHTvDlr2qg1U1Jk2rWeSJXf70ViBJ88dsFGuSFapG8lwRwuX7HXVTr89
 7TXSJB5eyt3X7uOQpQkJzmjY7/JtFQBgkvWc9kmPZEGxhkGEWvu3vG67vRokCrQkaC
 b5wDioRo90sKLnMQVxcRwqSbEvTniIb6etAYizIV6WPW5W/Oo03Fr7bOJM4xECu6vW
 es9P4uj9BUYolIcqqxSnPLFkWMR5hynxvveh71EjF2NDMcld/6VQc4UQ47ZuHF4Mrf
 G+KKVTDXJRZQQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1u9JB6-000000004zK-0H1W;
 Mon, 28 Apr 2025 09:45:24 +0200
Date: Mon, 28 Apr 2025 09:45:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-1-alex.vinarskis@gmail.com>
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

On Thu, Apr 17, 2025 at 04:10:31AM +0200, Aleksandrs Vinarskis wrote:
> Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> to non-transparent mode to enable video output on X1E-based devices
> that come with LTTPR on the motherboards. However, video would not work
> if additional LTTPR(s) are present between sink and source, which is
> the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).

Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
adapters or docks with retimers in transparent mode?

You describe at least one of this patches as a fix but I'm not seeing
any Fixes tags or indication that these need to go into 6.15-rc to fix
a regression.

> Changes in v3:
> - Split 1st patch into 3
> - Simplified handling of max_lttpr_lanes/max_lttpr_rate
> - Moved lttpr_common_caps to msm_dp_link (not msm_dp_panel, as LTTPRs
>   are link related, not panel related)
> - Picked Stefan's T-b tag (last patch only, as 1st one is getting split)
> - Droped Abel's R-b tags from 1st patch that got split due to high diff
> - Fixed alignment issues, initialization of variables, debug prints
> - Moved lttpr_count to avoid ugly pointer
> - Link to v2: https://lore.kernel.org/all/20250311234109.136510-1-alex.vinarskis@gmail.com/

I tested v2 due to the dependencies in msm-next and DP altmode still
works on my X13s and T14s (while not using any docks):

Tested-by: Johan Hovold <johan+linaro@kernel.org>

> Aleksandrs Vinarskis (4):
>   drm/msm/dp: Fix support of LTTPR initialization
>   drm/msm/dp: Account for LTTPRs capabilities
>   drm/msm/dp: Prepare for link training per-segment for LTTPRs
>   drm/msm/dp: Introduce link training per-segment for LTTPRs

Johan

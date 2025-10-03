Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0983DBB6BDD
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 15:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E55110E8FA;
	Fri,  3 Oct 2025 13:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tfbXoc6i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1073210E10C;
 Fri,  3 Oct 2025 13:03:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EC11962127;
 Fri,  3 Oct 2025 13:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C28C4CEFB;
 Fri,  3 Oct 2025 13:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759496605;
 bh=Gd7Oq5ZU+13w8PNpzBPg8aE98Rba9qJgv1pDoDLal7Q=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=tfbXoc6iH2ebCBIYmywEqOfOL/br7+yO0pTJ1zHz+lzYWI4OM+43mHTAer5bdl6eg
 343HXDFp8oVnTSn8W9v8ePX8PQuPAVggFPOOjvqRHK8W1/a5+tX5Z99Z8NtRsS0kmz
 0rPGKsA0kInxjb1wqWndhnavSx5EzOMBYz2157XwoNY11ApGGHNWOfdsI5pxfqT6si
 bfiokh0TN7SjphfFMa9UP3cx5TsWqeAtHZZuuLnY6j0b5bKV8GnrrMk7LDMbhHnwfj
 Gr1hossT+lKhqL09Zkl7sCKn3mvSr4Oc1TuqCYPItKtmSstLQM2bhWrZ+ihVaTNDfp
 2sbvGsJMbhn8g==
Message-ID: <795f1dc6b340cc75c40c957ef8d38b0d@kernel.org>
Date: Fri, 03 Oct 2025 13:03:22 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/9] drm/display: hdmi-state-helpers: warn on
 unsupported InfoFrame types
In-Reply-To: <20250928-limit-infoframes-2-v2-1-6f8f5fd04214@oss.qualcomm.com>
References: <20250928-limit-infoframes-2-v2-1-6f8f5fd04214@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Andy
 Yan" <andy.yan@rock-chips.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>,
 "Jessica Zhang" <jessica.zhang@oss.qualcomm.com>, "Jonas
 Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Maxime Ripard" <mripard@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Rob Clark" <robin.clark@oss.qualcomm.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sean Paul" <sean@poorly.run>,
 "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
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

On Sun, 28 Sep 2025 11:24:46 +0300, Dmitry Baryshkov wrote:
> In preparation to tightening driver control over generated InfoFrames,
> make sure to warn the user if the driver rejects the InfoFrames on the
> grounds of it being unsupported.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

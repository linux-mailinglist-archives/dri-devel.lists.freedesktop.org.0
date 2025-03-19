Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBF1A69419
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 16:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5F610E53A;
	Wed, 19 Mar 2025 15:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YfHBY8Rz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41A810E535;
 Wed, 19 Mar 2025 15:52:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2D7E261559;
 Wed, 19 Mar 2025 15:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB99AC4CEE4;
 Wed, 19 Mar 2025 15:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742399570;
 bh=oYiINVdzIoBCxFX8j1b/goCcPvWMDU9tBsffGEb/1xA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=YfHBY8RzU2fcusIAFAdOxWb6tFvKbcDvIekN/cATF4QnlSepo1vEAjaCFltpG0qw6
 DYqhQd58EEljH3a8mmJjOMak+MUJB7IfjCkScuXt/kMAY6K89HtmBsQ6nwsxPSWdUL
 ZZ8sDhKxvFi9GxxJu3UxDSgUaoXJ601gt1TxeUAldfU5Kbu9bz8fT5gzxTB+U4CvZ5
 ZGoyHq2mPKdSocoyvPbUykVMrjXzHquCyHYi6VXwRd4u3uNjw/PtfWMtFRjczaSi1M
 9oHmByJtYIFWXUBTySK3P5fN3FVGJA4+Jnw/j7xfeHSD8F0ih+aBdoEBX2EOhqVW3E
 Pt/ke3htc6bvw==
Message-ID: <30c25e064d7c46ee6e70a6a32eddd819@kernel.org>
Date: Wed, 19 Mar 2025 15:52:47 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/4] drm/bridge-connector: hook DisplayPort audio
 support
In-Reply-To: <20250314-dp-hdmi-audio-v6-3-dbd228fa73d7@oss.qualcomm.com>
References: <20250314-dp-hdmi-audio-v6-3-dbd228fa73d7@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Hermes
 Wu" <Hermes.wu@ite.com.tw>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Rob Clark" <robdclark@gmail.com>, "Robert Foss" <rfoss@kernel.org>,
 "Sean Paul" <sean@poorly.run>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Fri, 14 Mar 2025 11:36:50 +0200, Dmitry Baryshkov wrote:
> Reuse existing code plumbing HDMI audio support and the existing HDMI
> audio helpers that register HDMI codec device and plumb in the
> DisplayPort audio interfaces to be handled by the drm_bridge_connector.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81126A618A8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 18:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF68C10E319;
	Fri, 14 Mar 2025 17:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AjTAUCj1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3B010E318;
 Fri, 14 Mar 2025 17:53:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3F233A487E2;
 Fri, 14 Mar 2025 17:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E7CC4CEE3;
 Fri, 14 Mar 2025 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741974826;
 bh=s5sHm7/QnN7CVS7K9YFNqIidGfIhRwMnWMvEDWIzRJE=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=AjTAUCj1AqyVFILuqDf1htnLC/n62fgzlyWA5H1BD+dsyXp0Bezik4MJ2zfCreNrZ
 7zIvkQhkDFUaZwkGqBp6VmKVjpoSZ9LAnHumSkaVJ4OTJDkvtzHqgCiI3zOUZDk0tV
 qL9kilD6gIdHzzJaOa64ZMi3yC6LLdmJWPf/sHqLUQnYqEMEtv6d62fWnlu8AFHtg5
 5T2CXO9P3RQkQgz6k4fc87k/ByPD3g4qe4bq+1viJ4Ay72N7eqgpBIALy3hssFL+PJ
 T8UvGgGHwMdOqHpT/I9iAOwjpWMrtFfp+n8dKcdv3Jw4jRFgGGfvQDICdC7ke9ic9Q
 3DdsLkLSb8kJA==
Message-ID: <26194ac041ad313a9e48ec1c7ef21cfc@kernel.org>
Date: Fri, 14 Mar 2025 17:53:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] drm/bridge: add function interface for
 DisplayPort audio implementation
In-Reply-To: <20250314-dp-hdmi-audio-v6-2-dbd228fa73d7@oss.qualcomm.com>
References: <20250314-dp-hdmi-audio-v6-2-dbd228fa73d7@oss.qualcomm.com>
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

On Fri, 14 Mar 2025 11:36:49 +0200, Dmitry Baryshkov wrote:
> It is common for the DisplayPort bridges to implement audio support. In
> preparation to providing a generic framework for DP audio, add
> corresponding interface to struct drm_bridge. As suggested by Maxime
> for now this is mostly c&p of the corresponding HDMI audio API.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

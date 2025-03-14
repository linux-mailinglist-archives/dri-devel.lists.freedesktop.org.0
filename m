Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F18A618A4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 18:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9621710E1CD;
	Fri, 14 Mar 2025 17:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bUIcLe7B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9203210E1CD;
 Fri, 14 Mar 2025 17:53:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 79CB7A487CE;
 Fri, 14 Mar 2025 17:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E918C4CEE3;
 Fri, 14 Mar 2025 17:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741974800;
 bh=5NZxvad2uFczUGWwHFcIrEEWa5q75IDbRp+3vgAAUdM=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=bUIcLe7BZXsuxfxRLxhFOe4XDbUgIDCeAo1QrGvwNrmdvFbLlTMWcKuOLI8rPY5RW
 p+XP5QNd5nlL0tg0IzWqYmLnZn4saPAXMgJvKuS4k6gqe3xJWq0QWCdH9kd6jZ2oX6
 s5xTRCNUDFMmA3fQcJ44NP4VzX9ZBUaWr34QsAf77bPE4MwJiMeqEn2tg8pcblmQYJ
 2t9wVNWCDHJNG77cQipcAIQVnLP1Ur+2jQPY47nVi8U74jA6yXFccprXDD+hldxheI
 VW7gWoUAL0uvGAbRX0ZQCHI/juGj6oX10UvFxP4uODy2hJUGuoxTLOn1QinsvvmyLP
 tLyTp2w/IQ82w==
Message-ID: <b56aa82c22a2e2ee41dd9689185bc99f@kernel.org>
Date: Fri, 14 Mar 2025 17:53:17 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/4] drm/bridge: split HDMI Audio from
 DRM_BRIDGE_OP_HDMI
In-Reply-To: <20250314-dp-hdmi-audio-v6-1-dbd228fa73d7@oss.qualcomm.com>
References: <20250314-dp-hdmi-audio-v6-1-dbd228fa73d7@oss.qualcomm.com>
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

On Fri, 14 Mar 2025 11:36:48 +0200, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <lumag@kernel.org>
> 
> As pointed out by Laurent, OP bits are supposed to describe operations.
> Split DRM_BRIDGE_OP_HDMI_AUDIO from DRM_BRIDGE_OP_HDMI instead of
> overloading DRM_BRIDGE_OP_HDMI.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

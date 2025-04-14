Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C63A886FF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 17:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9EC10E60D;
	Mon, 14 Apr 2025 15:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="emZdFVaj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B63F10E60D;
 Mon, 14 Apr 2025 15:24:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4C02F43578;
 Mon, 14 Apr 2025 15:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C434FC4CEE2;
 Mon, 14 Apr 2025 15:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744644286;
 bh=o3nILmGE9JYuIUmFfw9p9jVeAhSXeW6qek1u5R4dIvs=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=emZdFVajAeVubJKYb8s7PmiiNnkgFKaE43N1jrqLWj47+kbQtOsjvfQjoU59iEblB
 JBLwRWwZ4onwjAhMsqOXd0nJwisC3B7zgs9q+m/WDKSWmJIsh71VbO1Qjv1mYxy/zq
 I/1ZaRT9UfIVKuq71krfK+sLsx3El79qT/DNAlBGPbmNbEW7gU13pPBtMVeTp1yzIn
 DCBtCwKgetLdsZvLNzVd3SzoN5sqoe1+GnuYfYClRZ8AU2WZtzWbkKYHnaR2gm4sec
 ki3hKOaadJwVwOhnnydemqLYBeklK5bYCoe+WFQK8PCqvkikrKE+IjYmyV7CNldfjE
 HV4hzaNOP/zeg==
Message-ID: <905b834cc0c09405570199ef5acfb92a@kernel.org>
Date: Mon, 14 Apr 2025 15:24:43 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] drm/display: hdmi: provide central data
 authority for ACR params
In-Reply-To: <20250408-drm-hdmi-acr-v2-1-dee7298ab1af@oss.qualcomm.com>
References: <20250408-drm-hdmi-acr-v2-1-dee7298ab1af@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Dmitry
 Baryshkov" <lumag@kernel.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Rob
 Clark" <robdclark@gmail.com>, "Robert Foss" <rfoss@kernel.org>,
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

On Tue, 8 Apr 2025 16:54:25 +0300, Dmitry Baryshkov wrote:
> HDMI standard defines recommended N and CTS values for Audio Clock
> Regeneration. Currently each driver implements those, frequently in
> somewhat unique way. Provide a generic helper for getting those values
> to be used by the HDMI drivers.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

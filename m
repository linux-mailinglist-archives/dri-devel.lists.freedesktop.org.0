Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4535D902072
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 13:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13E310E450;
	Mon, 10 Jun 2024 11:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UAihqqsn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D363A10E42D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:37:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2ABB260A1C;
 Mon, 10 Jun 2024 11:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA96C4AF1C;
 Mon, 10 Jun 2024 11:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718019452;
 bh=W5QzFncy0sUTy2B+uXEQTMtsMrR22hJS0osVxJ7jZF8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UAihqqsn0XnGRCucJWFCNxmRvk8TZlo++RhoqeW6SiLXJW3f/EIFyyKSJUNWNC9ak
 /Iq6ALFJZhvYeOIa9kh24gOnK3/HCqMMyFldZQSrSjjhYpYCB7XOYzr/wUC8PuQ/8w
 c99nxitWMQCtKSJj2K/FXdI+hbKiNYCWIs76EfqAzhFX/DA+mFBzbF687jJARrHRD5
 +fsOLl43LeJCWZPGEy95l7d5s6xLw0/ibmN2a2lOEiMRD36izWJo1qx7ic5KQg6dMz
 EbCW8a0Wmke49XVE3Iots7qdCl71BlQ+QPqg+pC5YD8Ary1mROmWlBgjHJhvU2k0FK
 MyGxsWuojx2wg==
From: Robert Foss <rfoss@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 David Airlie <airlied@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, kernel-janitors@vger.kernel.org
In-Reply-To: <6c8c6746-34e2-4a97-9dff-622ed29071e9@kili.mountain>
References: <6c8c6746-34e2-4a97-9dff-622ed29071e9@kili.mountain>
Subject: Re: [PATCH v2] drm/bridge: it6505: remove unnecessary NULL checks
Message-Id: <171801944880.382402.4293639602145071155.b4-ty@kernel.org>
Date: Mon, 10 Jun 2024 13:37:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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

On Mon, 10 Jun 2024 13:50:26 +0300, Dan Carpenter wrote:
> Smatch complains correctly that the NULL checking isn't consistent:
> 
>     drivers/gpu/drm/bridge/ite-it6505.c:2583 it6505_poweron()
>     error: we previously assumed 'pdata->pwr18' could be null
>     (see line 2569)
> 
> These the ->pwr18 pointer is allocated during probe using the
> devm_regulator_get() function.  If CONFIG_REGULATOR is disabled then,
> yes, it can return NULL but in that case regulator_enable() and
> disable() functions are no-ops so passing a NULL pointer is okay.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: it6505: remove unnecessary NULL checks
      (no commit info)



Rob


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76049A2861
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 18:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC62010E1DB;
	Thu, 17 Oct 2024 16:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nyLUiinp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC1810E1DB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 16:18:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 01723A44119;
 Thu, 17 Oct 2024 16:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E48C4CEC3;
 Thu, 17 Oct 2024 16:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729181905;
 bh=/ppNeeFH3ToWFdjqK0Z7lUfEpmEMU5Eo/SBOmaOgyFI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nyLUiinp/UgPO4lddkPqW7MvkHPLukAO5nEpTGqjTXVjMmYankRxIaecC00d8juzd
 g8wwF5tDz9LUQL6xhfa55mp/7Jm7L5rGe1VCYoBr5AM76mwGxnh+nCKme2HikD9UQS
 SZCmhPayRsn+KcTVc2Y+sy0iXXH8HRnzIWWw+JtJ+NjHgUc4GoNXKfiAi1IyiJ2KPi
 OP8C+QYBsZXYolEJfpQ5UffK0dyxZ1ZWyFc9VjGQbAf6yqBHUDDR53kVvf5oYLN/AS
 bUicUvZLQJnZgVph8saPMAXEeYPqHbG5oKuCvCBCtmDLTI1k5Iv+uIKPnRwyfKqmLF
 /yMScNDeQ6IzA==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1t1TCq-000000006yy-3qyb;
 Thu, 17 Oct 2024 18:18:33 +0200
Date: Thu, 17 Oct 2024 18:18:32 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: Mark the of_node of the aux bridge device as
 reused
Message-ID: <ZxE42DvdBwrOnaEa@hovoldconsulting.com>
References: <20241017-drm-aux-bridge-mark-of-node-reused-v1-1-7cd5702bb4f2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017-drm-aux-bridge-mark-of-node-reused-v1-1-7cd5702bb4f2@linaro.org>
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

On Thu, Oct 17, 2024 at 06:35:26PM +0300, Abel Vesa wrote:
> There are some cases where sharing the of_node renders different resources
> providers confused about the same resource being shared by two different
> devices.

Can you be more specific about what type of issue you are trying to
avoid here? Is it due to pinctrl for example?

> Avoid that by marking the of_node as reused since the aux bridge
> device is reusing the parent of_node.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/bridge/aux-bridge.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
> index b29980f95379ec7af873ed6e0fb79a9abb663c7b..ec3299ae49d6abdb75ee98acfe0682f1acc459f8 100644
> --- a/drivers/gpu/drm/bridge/aux-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-bridge.c
> @@ -60,6 +60,7 @@ int drm_aux_bridge_register(struct device *parent)
>  	adev->dev.parent = parent;
>  	adev->dev.of_node = of_node_get(parent->of_node);
>  	adev->dev.release = drm_aux_bridge_release;
> +	adev->dev.of_node_reused = true;

Please use the intended device_set_of_node_from_dev() helper for this.
  
>  	ret = auxiliary_device_init(adev);
>  	if (ret) {

Johan

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A7E53B42B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 09:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB96810E4A1;
	Thu,  2 Jun 2022 07:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4880910E410
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 07:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654153879; x=1685689879;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=fpjlwrOa7aHxyExEPvIZqTy3mwVCJEL8+LMJCa+H2mk=;
 b=d+j5Tzx9zcG5OsXhaO59dpJqV26FCQ+4JqOOBb0j9Lnet6LOvMmWKAAG
 JGHiJHp+XpveMo1Vd000XUfVx9Umd1QfY00ZCUZktrm/UQXvpc1ti3D+f
 d3YL2QTtEBkeXw0mDyckHFyQoBRilMLx3hnaRmeU7Gp894r7F5t7naga5
 7XSXrNgRcms6LuM9X4t6Ai6i0ZmuArQbvqjL04rT4/z4LMLLo78gD1Llp
 rsnWovV0KB/+H2IRkTTDIroRDBlIPfcEsnWA4CkO9l8AxyD0hJNzFEqYf
 P8ZIN5jxmqpij59bl6DEsLDedfm39ECCfbRVCoNbMP+WnOIycV6zLQv/m A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="274653340"
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="274653340"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 00:11:18 -0700
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="577366751"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.13.51])
 ([10.213.13.51])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 00:11:13 -0700
Message-ID: <ba8d5d00-0ef7-6133-e609-7942cdbd7c84@intel.com>
Date: Thu, 2 Jun 2022 09:11:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [RESEND PATCH] drm/mipi-dsi: Fix error handling in
 mipi_dsi_device_register_full
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220601124024.10137-1-linmq006@gmail.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220601124024.10137-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 01.06.2022 14:40, Miaoqian Lin wrote:
> In mipi_dsi_device_alloc(), it calls device_initialize(&dsi->dev);
> We need to use put_device() instead freeing directly.
>
> Fixes: 068a002 ("drm: Add MIPI DSI bus support")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Looks correct.
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index c40bde96cfdf..8cc8deca006f 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -228,7 +228,7 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
>   	ret = mipi_dsi_device_add(dsi);
>   	if (ret) {
>   		drm_err(host, "failed to add DSI device %d\n", ret);
> -		kfree(dsi);
> +		put_device(&dsi->dev);
>   		return ERR_PTR(ret);
>   	}
>   


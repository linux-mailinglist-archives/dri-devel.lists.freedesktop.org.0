Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B5A874C60
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 11:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A6D10EFB9;
	Thu,  7 Mar 2024 10:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SDlIs6zK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF6710EFF8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 10:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709807365;
 bh=qQoAPE4XH25CEU6J2ar4XCd0VI3maVhc+dknw7Ptp7s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SDlIs6zK3Jw1APuXKGz3rdR9MXqUnidA/kxzDEdgMbWOJi1AeTJIcxGwFy8m6C8jB
 O2KiL1MSwcjvyQJ1h37VjXvfKnqDbCJY8ntQXWUlsYVXiX+TbDWUZE7lw850E5tAoi
 gp01m3eoWF6RMIoDnKGrRFbJ27vMpY91S84kifbAGawBJr7fXWKYyNtSLTeGxTlom9
 pp9d/5sq1nZ9ZH6Cc2OAEFLiCfNHCfjfQnt23MQ1p59Hr4F6S/bTDLrOdHPrwhKuwS
 14pLlgVPojJf/DQDJKqsQc5xB1IEwtiVXLvQ8qBVmtf1NkMu/nwH56OEZMLaoRcFN0
 fzXVfVW6Rl6nA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 02F193780EC6;
 Thu,  7 Mar 2024 10:29:24 +0000 (UTC)
Message-ID: <4c588295-d9aa-43fa-a2e7-adbace573b8c@collabora.com>
Date: Thu, 7 Mar 2024 11:29:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Add 0 size check to mtk_drm_gem_obj
To: Justin Green <greenjustin@chromium.org>, linux-mediatek@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org,
 fshao@chromium.org
References: <20240306203702.3924719-1-greenjustin@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240306203702.3924719-1-greenjustin@chromium.org>
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

Il 06/03/24 21:37, Justin Green ha scritto:
> Add a check to mtk_drm_gem_init if we attempt to allocate a GEM object
> of 0 bytes. Currently, no such check exists and the kernel will panic if
> a userspace application attempts to allocate a 0x0 GBM buffer.
> 
> Tested by attempting to allocate a 0x0 GBM buffer on an MT8188 and
> verifying that we now return EINVAL.
> 
> Signed-off-by: Justin green <greenjustin@chromium.org>

You need a Fixes tag for this one. Please add the right one and resend.

After adding the correct Fixes tag,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index 4f2e3feabc0f..ee49367b6138 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -38,6 +38,9 @@ static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
>   
>   	size = round_up(size, PAGE_SIZE);
>   
> +        if (size == 0)
> +		return ERR_PTR(-EINVAL);
> +
>   	mtk_gem_obj = kzalloc(sizeof(*mtk_gem_obj), GFP_KERNEL);
>   	if (!mtk_gem_obj)
>   		return ERR_PTR(-ENOMEM);



Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F2D92A1B0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 13:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BE410E22F;
	Mon,  8 Jul 2024 11:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="n98jwju1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A2110E251;
 Mon,  8 Jul 2024 11:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1720439708;
 bh=w3xvsgnndMrOM/34Wyw1Scx/GCcX7wlvt69E7QiIYkg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=n98jwju1/uzeoV0fEL8f8dFVQZNtHK4ynGYPEq6fTbt9U0wsIbuv2k1DLmv2PZ5CH
 sO1zo6Xy9NaN0z3g+MtcZh5ecoYQ/E/uUCXmgj1doOF6mHCUb0vzhAJbi7ZhrjVkuz
 G1dHyxtsO3CMmto9RRXJDZCnLj8l0c1wTm5FmNpir1jrHEIoX6rh0nhzecdKBYfpY5
 69qksMV2eEDSKwJVI1GRC3YsKWFP3JfddOQiUB8LtSkNqZ0P3DiMK7oewEqfpB76uJ
 BvJpjRVeBsJDyGmgDJpQotrx8omTbsLcIBUGRNi72BEZ9Y/m6ZW/7mrn0Sn4VCkNQV
 ct+6daOAFYzOg==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3CF7E378216D;
 Mon,  8 Jul 2024 11:55:07 +0000 (UTC)
Message-ID: <b18c4505-efd2-403b-9bde-eed510c832f9@collabora.com>
Date: Mon, 8 Jul 2024 14:55:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/qxl: Pin buffer objects for internal mappings
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 kraxel@redhat.com, zack.rusin@broadcom.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: regressions@leemhuis.info, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 David Kaplan <david.kaplan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20240702142034.32615-1-tzimmermann@suse.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240702142034.32615-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
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

On 7/2/24 17:20, Thomas Zimmermann wrote:
> @@ -190,7 +190,13 @@ int qxl_bo_vmap(struct qxl_bo *bo, struct iosys_map *map)
>  	if (r)
>  		return r;
>  
> +	r = qxl_bo_pin_locked(bo);
> +	if (r)
> +		return r;

Is qxl_bo_unreserve() missing here?

> +
>  	r = qxl_bo_vmap_locked(bo, map);
> +	if (r)
> +		qxl_bo_unpin_locked(bo);
>  	qxl_bo_unreserve(bo);
>  	return r;

-- 
Best regards,
Dmitry


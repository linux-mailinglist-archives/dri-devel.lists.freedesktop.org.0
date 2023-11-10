Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E40F7E85E2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 23:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A6010E2A7;
	Fri, 10 Nov 2023 22:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFCD10E2A4;
 Fri, 10 Nov 2023 22:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=tOYDo1cN44RiDSLhxs/Illj/iOMmKhabusTff9O6hu0=; b=v71dnxDYZHCZAkGzhtHw4hR1y6
 a8dMFJswTCTC5/DAovSq9dmPAJ0JabpQZLRHRmFhIftoCZBuQvsPUmbrqlQsg4mhxDVe8js0KQiPL
 CTB/0jhgj8xqMqAWzYScg38eGDA/A1fuQajZ5VQFDhh4pEHKRfbyZLyv6qwZG7J4aNRa/YRtS9rQK
 f2+IelZQwXFWHV9LZXgY1+upS4Gg4+0snZLevvaR7VmCqa4pWktkkiCUNhGDEcyh6Ka9EKA9G5HYD
 MwSDwPq5xhNEADoxPkUFTsbaNJeuxjbGeUIbnZtkReqIoixjBJWgfqgnC+Gr0sgtVM0tGx3JFjt0X
 6VLdZXnA==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r1aNf-009aVR-2f; Fri, 10 Nov 2023 22:53:39 +0000
Message-ID: <3027ec81-304a-4501-808f-67596e61fb9f@infradead.org>
Date: Fri, 10 Nov 2023 14:53:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Document device reset methods
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20231110155548.20599-1-andrealmeid@igalia.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231110155548.20599-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: alexander.deucher@amd.com, ray.huang@amd.com, christian.koenig@amd.com,
 kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi--

On 11/10/23 07:55, André Almeida wrote:
> Document what each amdgpu driver reset method does.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index a79d53bdbe13..500f86c79eb7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -504,6 +504,26 @@ struct amdgpu_allowed_register_entry {
>  	bool grbm_indexed;
>  };
>  
> +/**
> + * enum amd_reset_method - Methods for resetting AMD GPU devices
> + *
> + * @AMD_RESET_METHOD_NONE: The device will not be reset.
> + * @AMD_RESET_LEGACY: Method reserved for SI/CIK asics.

                                                    ASICs.

> + * @AMD_RESET_MODE0: High level PCIe reset.
> + * @AMD_RESET_MODE1: Resets each IP block (SDMA, GFX, VCN, etc.) individually.
> + *                   Suitable only for some discrete GPUs.
> + * @AMD_RESET_MODE2: Resets only the GFX block. Useful for APUs, giving that
> + *                   the rest of IP blocks and SMU is shared with the CPU.
> + * @AMD_RESET_BACO: BACO (Bus Alive, Chip Off) method powers off and on the card
> + *                  but without powering off the PCI bus. Suitable only for
> + *                  discrete GPUs.
> + * @AMD_RESET_PCI: Does a full bus reset, including powering on and off the
> + *                 card.
> + *
> + * Methods available for AMD GPU driver for resetting the device. Not all
> + * methods are suitable for every device. User can overwrite the method using

s/overwrite/override/
would make more sense to me.

Otherwise looks good. Thanks.

> + * module parameter `reset_method`.
> + */
>  enum amd_reset_method {
>  	AMD_RESET_METHOD_NONE = -1,
>  	AMD_RESET_METHOD_LEGACY = 0,

-- 
~Randy

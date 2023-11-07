Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6097E4D94
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 00:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A2010E2FD;
	Tue,  7 Nov 2023 23:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hs01.dakr.org (hs01.dk-develop.de [173.249.23.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DD310E2FB;
 Tue,  7 Nov 2023 23:53:07 +0000 (UTC)
Message-ID: <04fd39a8-174d-44e7-a910-5e808d8563b5@dakr.org>
Date: Wed, 8 Nov 2023 00:52:52 +0100
MIME-Version: 1.0
Subject: Re: [Nouveau] [PATCH] nouveau/gsp: fix UBSAN array bounds warning in
 PACKED_REGISTRY_TABLE
Content-Language: en-US
To: Timur Tabi <ttabi@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20231107234726.854248-1-ttabi@nvidia.com>
From: Danilo Krummrich <me@dakr.org>
In-Reply-To: <20231107234726.854248-1-ttabi@nvidia.com>
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

On 11/8/23 00:47, Timur Tabi wrote:
> Change PACKED_REGISTRY_TABLE so that its last member is a variable-length
> array instead of a zero-length array.  UBSAN treats zero-length arrays
> literally and warns if they are dereferenced.  Changing the "[0]" to "[]"
> tells the compiler that the array is variable-length.

Do you also intend to fix this upstream? (And with upstream I mean the
open-gpu-kernel-modules in this case.)

> 
> This fixes the following warning in function r535_gsp_rpc_set_registry
> when CONFIG_UBSAN_BOUNDS is enabled:
> 
> UBSAN: array-index-out-of-bounds in drivers/gpu/drm/nouveau/nvkm/
> subdev/gsp/r535.c:1066:33
> index 2 is out of range for type 'PACKED_REGISTRY_ENTRY [*]'
> 
> Fixes: b5bad8c16b9b ("nouveau/gsp: move to 535.113.01")
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>   .../include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h        | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h
> index 754c6af42f30..1d236c68fa30 100644
> --- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h
> @@ -38,7 +38,7 @@ typedef struct PACKED_REGISTRY_TABLE
>   {
>       NvU32                   size;
>       NvU32                   numEntries;
> -    PACKED_REGISTRY_ENTRY   entries[0];
> +    PACKED_REGISTRY_ENTRY   entries[];
>   } PACKED_REGISTRY_TABLE;
>   
>   #endif

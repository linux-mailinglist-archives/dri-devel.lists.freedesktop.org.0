Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2679D849FD1
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 17:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B5810EEBC;
	Mon,  5 Feb 2024 16:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 530 seconds by postgrey-1.36 at gabe;
 Mon, 05 Feb 2024 16:49:47 UTC
Received: from hs01.dakr.org (hs01.dk-develop.de [173.249.23.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4847110F739;
 Mon,  5 Feb 2024 16:49:47 +0000 (UTC)
Message-ID: <46dc2e91-261d-4de7-bae0-3bdfc50c1975@dakr.org>
Date: Mon, 5 Feb 2024 17:40:44 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] nouveau/gsp: use correct size for registry rpc.
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240130032643.2498315-1-airlied@gmail.com>
From: Danilo Krummrich <me@dakr.org>
In-Reply-To: <20240130032643.2498315-1-airlied@gmail.com>
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

On 1/30/24 04:26, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Timur pointed this out before, and it just slipped my mind,
> but this might help some things work better, around pcie power
> management.
> 
> Fixes: 8d55b0a940bb ("nouveau/gsp: add some basic registry entries.")
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Added stable CC for v6.7 and applied it to drm-misc-fixes.

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 9ee58e2a0eb2..5e1fa176aac4 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -1078,7 +1078,6 @@ r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
>   	if (IS_ERR(rpc))
>   		return PTR_ERR(rpc);
>   
> -	rpc->size = sizeof(*rpc);
>   	rpc->numEntries = NV_GSP_REG_NUM_ENTRIES;
>   
>   	str_offset = offsetof(typeof(*rpc), entries[NV_GSP_REG_NUM_ENTRIES]);
> @@ -1094,6 +1093,7 @@ r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
>   		strings += name_len;
>   		str_offset += name_len;
>   	}
> +	rpc->size = str_offset;
>   
>   	return nvkm_gsp_rpc_wr(gsp, rpc, false);
>   }

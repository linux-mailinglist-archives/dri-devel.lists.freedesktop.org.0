Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96F27EB70A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 20:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A23D10E22E;
	Tue, 14 Nov 2023 19:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hs01.dakr.org (hs01.dk-develop.de [173.249.23.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2901E10E22E;
 Tue, 14 Nov 2023 19:54:18 +0000 (UTC)
Message-ID: <39561fc8-185b-4430-b051-2eebc865838d@dakr.org>
Date: Tue, 14 Nov 2023 20:54:08 +0100
MIME-Version: 1.0
Subject: Re: [Nouveau] [PATCH] nouveau: don't fail driver load if no display
 hw present.
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231105203700.2152487-1-airlied@gmail.com>
From: Danilo Krummrich <me@dakr.org>
In-Reply-To: <20231105203700.2152487-1-airlied@gmail.com>
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
Cc: nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/5/23 21:37, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> If we get back ENODEV don't fail load.

Maybe worth to note why this is OK in this case, might not be obvious
to future readers of the code.

> 
> Fixes: 15740541e8f0 ("drm/nouveau/devinit/tu102-: prepare for GSP-RM")

Maybe I'm missing something subtle here, but did you maybe pick the wrong
commit here? At a first glance it looks like commit 073bde453635
("drm/nouveau/kms/nv50-: disable dcb parsing") introduced the issue.

- Danilo

> Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/270
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_display.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index d8c92521226d..f28f9a857458 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -726,6 +726,11 @@ nouveau_display_create(struct drm_device *dev)
>   
>   	if (nouveau_modeset != 2) {
>   		ret = nvif_disp_ctor(&drm->client.device, "kmsDisp", 0, &disp->disp);
> +		/* no display hw */
> +		if (ret == -ENODEV) {
> +			ret = 0;
> +			goto disp_create_err;
> +		}
>   
>   		if (!ret && (disp->disp.outp_mask || drm->vbios.dcb.entries)) {
>   			nouveau_display_create_properties(dev);

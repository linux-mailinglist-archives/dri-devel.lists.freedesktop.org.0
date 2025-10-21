Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2CEBF7CEF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 19:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE1610E626;
	Tue, 21 Oct 2025 17:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cse.ust.hk header.i=@cse.ust.hk header.b="mwlRwnKK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cse.ust.hk (cssvr7.cse.ust.hk [143.89.41.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A02010E626;
 Tue, 21 Oct 2025 17:02:45 +0000 (UTC)
Received: from chcpu18 (191host009.mobilenet.cse.ust.hk [143.89.191.9])
 (authenticated bits=0)
 by cse.ust.hk (8.18.1/8.12.5) with ESMTPSA id 59LH2V42779999
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 22 Oct 2025 01:02:37 +0800
ARC-Seal: i=1; a=rsa-sha256; d=cse.ust.hk; s=arccse; t=1761066158; cv=none;
 b=T/+4lEACQsGHm9udGaaM8aihrcqTVOZWFMG5F6JFTX6O29X4zQZJiKQrzOHaxLRU+TYJsGkQRHU3tjXryqiqgGc7KJk2elxnVrcyA/Mvoeibz+Pzj33l0AGvdmVwNOYeUAo+cwO8r6eqmBR6wuzCErqMQUWX8CAoTbSlOoiytpg=
ARC-Message-Signature: i=1; a=rsa-sha256; d=cse.ust.hk; s=arccse;
 t=1761066158; c=relaxed/relaxed;
 bh=FRVfiD6X5NXLrHjgmPEma2QRAwCTtDTlCJMspqk53gA=;
 h=DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version;
 b=raDpEqVXBRFjJ+wUSmpp+P5YZX13JFY763EFGLojsAm+RjHi87pcnobAFrsD0vwZkLzLTY9hubuslyhvuNW5z01X8BeF0ajY4UpCh0pSIIVj2fi22fA913vR9n9oweBRKicWL+VqmC7A9gTlrtAnKEldHMr8xkv4tp+EMdPi+Do=
ARC-Authentication-Results: i=1; cse.ust.hk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cse.ust.hk;
 s=cseusthk; t=1761066158;
 bh=FRVfiD6X5NXLrHjgmPEma2QRAwCTtDTlCJMspqk53gA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mwlRwnKKPlBkjp3sWnD8EgVcbM/N++9LiW8IlROkRqjbjbzRlLTmg7lQJHzbrG2qW
 aIDSzRBg1+MM2UqOgD5pJyEa7zPj1JEgLuPN7A15TuOAsATKh1i4izXe+Qm8kqJVOe
 s2FCrgZbTxk+vgaMx9KSo5SixHbjlgQ3wOXoZzLY=
Date: Tue, 21 Oct 2025 17:02:26 +0000
From: Shuhao Fu <sfual@cse.ust.hk>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/nouveau: Fix refcount leak in
 nouveau_connector_detect
Message-ID: <aPe8optzxlZ8Rwf5@chcpu18>
References: <aOPy5aCiRTqb9kjR@homelab>
 <aOXYV5pgilTvqMxR@osx.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOXYV5pgilTvqMxR@osx.local>
X-Env-From: sfual
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

Hi, this is a friendly reminder of this patch. Please do let me know if
it needs any rework.

On Wed, Oct 08, 2025 at 11:20:15AM +0800, Shuhao Fu wrote:
> A possible inconsistent refcount update has been identified in function
> `nouveau_connector_detect`, which may cause a resource leak.
> 
> After calling `pm_runtime_get_*(dev->dev)`, the usage counter of `dev->dev`
> gets increased. In case function `nvif_outp_edid_get` returns negative,
> function `nouveau_connector_detect` returns without decreasing the usage
> counter of `dev->dev`, causing a refcount inconsistency.
> 
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/450
> Fixes: 0cd7e0718139 ("drm/nouveau/disp: add output method to fetch edid")
> Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
> Cc: stable@vger.kernel.org
> 
> Change in v3:
> - Cc stable
> Change in v2:
> - Add "Fixes" and "Cc" tags
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 63621b151..45caccade 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -600,8 +600,10 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
>                                 new_edid = drm_get_edid(connector, nv_encoder->i2c);
>                 } else {
>                         ret = nvif_outp_edid_get(&nv_encoder->outp, (u8 **)&new_edid);
> -                       if (ret < 0)
> -                               return connector_status_disconnected;
> +                       if (ret < 0) {
> +                               conn_status = connector_status_disconnected;
> +                               goto out;
> +                       }
>                 }
> 
>                 nouveau_connector_set_edid(nv_connector, new_edid);
> --
> 2.39.5
> 

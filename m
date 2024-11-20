Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F959D39A3
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 12:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D82D10E714;
	Wed, 20 Nov 2024 11:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NX+o7Tp5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0B910E714
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 11:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732102891;
 bh=R89d6A5mpwXuErqQT+DVy8w/GHdyMclAMWFBAG1D84E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NX+o7Tp5Ee3wuIvWGNWF704zgabeh6RLROGj+n+3cECHTbk4Vu/OMxxDYEYfEZDNg
 v93h8y46MGAe3Q5gmPmpAm7UOQin/PC3NwR0bFOQKMOzdDtI9YDctNK6VrppyN+rMQ
 xyRgEJmSOAq9cLxGkMrtZym7Md8+TGaRgLs1NTPda+B6aT7wBy754halz29Upn5Gy6
 qNoMaLhMQD1c7QCe74MrtGlmydEHUHD+WxeDiwuWwg23bjv2RYN297R8qA+B0k/vO9
 ijfrv9ZtTe0x89jXxzbpqlh7eR0xV0+nGmG+zx79Xapqo2q3aCYJuI/L1MR/EuZJXu
 Bu2PKM4gm7D+Q==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B50E17E362F;
 Wed, 20 Nov 2024 12:41:31 +0100 (CET)
Date: Wed, 20 Nov 2024 12:41:25 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>
Subject: Re: [PATCH] drm/panthor: Fix compilation failure on panthor_fw.c
Message-ID: <20241120124125.0bf1b9ac@collabora.com>
In-Reply-To: <20241119164455.572771-1-liviu.dudau@arm.com>
References: <20241119164455.572771-1-liviu.dudau@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 19 Nov 2024 16:44:55 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> Commit 498893bd596e ("drm/panthor: Simplify FW fast reset path") forgot
> to copy the definition of glb_iface when it move one line of code.
> 
> Fixes: Commit 498893bd596e ("drm/panthor: Simplify FW fast reset path")
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Liviu, can you queue this patch to drm-misc if that's not already done?

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 4bc52b1b1a286..c807b6ce71bd4 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1133,6 +1133,7 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
>  		 * This is not needed on a slow reset because FW sections are
>  		 * re-initialized.
>  		 */
> +		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
>  		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
>  
>  		ret = panthor_fw_start(ptdev);


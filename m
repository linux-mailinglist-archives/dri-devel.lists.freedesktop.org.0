Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500D494ECA6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 14:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A40A10E1CE;
	Mon, 12 Aug 2024 12:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jJwn7uAA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D5010E1CA;
 Mon, 12 Aug 2024 12:17:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E5566CE0DB4;
 Mon, 12 Aug 2024 12:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D57EC32782;
 Mon, 12 Aug 2024 12:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723465030;
 bh=bo9R7rxFMAahFwIa7Sm6As4QGNbA8l2dznmfmOr3GLI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jJwn7uAAVLNiNcdM+uPyGkHgvSSoEYxASpPpfqtIhLJgG88DGetjI6XQH5bHXwJDG
 EJVAf6nEcFiQlF6dghJChSmOSFgokFeWN04Nf7oV2nOIcBdYfehQbyCPqh71EbNVrg
 9NTmOF53El4S3sTjVIScdupc2+OQ0PTQVj3ztrdMwWWLwuiZ0r3C+dvx+hwDM0/FX6
 6AFgUwHZYg7p5Ye3tSPwY94eVndcAopUnIv2LHPRIEgkBOVGg68b7Wbxa2vWisMFEs
 pEgFg2PaeRD7Y3ayjzt5lEuAnGiM2ZkA8ZwhghK2thGNui5dsSpRbfCcNgSaoPllhS
 ZESfRMTfr+pAQ==
Message-ID: <61d77e67-a318-40ea-b904-e8686252b05c@kernel.org>
Date: Mon, 12 Aug 2024 14:17:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] drm/nouveau: Implement switcheroo reprobe with
 drm_client_dev_hotplug()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20240812083000.337744-1-tzimmermann@suse.de>
 <20240812083000.337744-6-tzimmermann@suse.de>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20240812083000.337744-6-tzimmermann@suse.de>
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

On 8/12/24 10:28 AM, Thomas Zimmermann wrote:
> Replace the call to drm_fb_helper_output_poll_changed() with a call
> to drm_client_dev_hotplug(). It is equivalent in functionality, but
> uses the DRM client infrastructure.
> 
> v2:
> - fix commit description
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Acked-by: Danilo Krummrich <dakr@kernel.org>

> ---
>   drivers/gpu/drm/nouveau/nouveau_vga.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
> index ee637f1fe03d..ab4e11dc0b8a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_vga.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
> @@ -58,8 +58,9 @@ static void
>   nouveau_switcheroo_reprobe(struct pci_dev *pdev)
>   {
>   	struct nouveau_drm *drm = pci_get_drvdata(pdev);
> +	struct drm_device *dev = drm->dev;
>   
> -	drm_fb_helper_output_poll_changed(drm->dev);
> +	drm_client_dev_hotplug(dev);
>   }
>   
>   static bool

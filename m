Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6766AC444
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 16:02:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4EC10E0DC;
	Mon,  6 Mar 2023 15:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C2E10E0DC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 15:02:08 +0000 (UTC)
Received: from arch-x395 (unknown [IPv6:2a00:5f00:102:0:9d43:3ed5:ed77:842c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: evelikov)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2D3F066018CA;
 Mon,  6 Mar 2023 15:02:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678114927;
 bh=imc7oHqxvqxmLW9aTXCorptkFhxj+2tr9Tu9ZKVTavw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=groQjaUtdb/65JFBoX/newBNJf6RZiLTnniV1HgrEVt/7ws5kseQ3iOK1Fj+ERPLx
 x1fU3fpNkJJRzwtiZ4AzaNiyX3ym2cUUUSYEmilOzDBQyLgX1CFlFLKGKja1wwimkB
 sBuTWTMabbMaLGDyiYBB8BM0mkscOGODDxzYmBn0uN44i93mfqW/9eo1XEArHEQ6DN
 BMLoPVedLiJDUk7E7yC4O9L47jgR2uNSjxG/Q8o6OCxECZ88jClZCF+BjCQzbhsjDb
 QRP/r4U5/Ri/zKsVP/4mjPBQW0HusZMZqlLc5U17HEvzz3T8HU6cDkey/r+HB/I2Ys
 PaZuDjusywNEw==
Date: Mon, 6 Mar 2023 15:02:04 +0000
From: Emil Velikov <emil.velikov@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v2] drm/virtio: Fix handling CONFIG_DRM_VIRTIO_GPU_KMS
 option
Message-ID: <ZAYAbIXlLLkNCB6f@arch-x395>
References: <20230306143234.1561759-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306143234.1561759-1-dmitry.osipenko@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ryan Neph <ryanneph@chromium.org>,
 David Airlie <airlied@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, kernel@collabora.com,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/03/06, Dmitry Osipenko wrote:
> VirtIO-GPU got a new config option for disabling KMS. There were two
> problems left unnoticed during review when the new option was added:
> 
> 1. The IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS) check in the code was
> inverted, hence KMS was disabled when it should be enabled and vice versa.
> 
> 2. The disabled KMS crashed kernel with a NULL dereference in
> drm_kms_helper_hotplug_event(), which shall not be invoked with a
> disabled KMS.
> 
> Fix the inverted config option check in the code and skip handling the
> VIRTIO_GPU_EVENT_DISPLAY sent by host when KMS is disabled in guest to fix
> the crash.
> 
> Fixes: 72122c69d717 ("drm/virtio: Add option to disable KMS support")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
> 
> Changelog:
> 
> v2: - Moved the "has_edid" under the "num_scanouts" condition, like was
>       suggested by Gerd Hoffmann.
> 

Hi Dmitry, I think there's more than one piece like that in the driver.

>  drivers/gpu/drm/virtio/virtgpu_kms.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 874ad6c2621a..15f2519988e7 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -43,11 +43,13 @@ static void virtio_gpu_config_changed_work_func(struct work_struct *work)
>  	virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
>  			events_read, &events_read);
>  	if (events_read & VIRTIO_GPU_EVENT_DISPLAY) {
> -		if (vgdev->has_edid)
> -			virtio_gpu_cmd_get_edids(vgdev);
> -		virtio_gpu_cmd_get_display_info(vgdev);
> -		virtio_gpu_notify(vgdev);
> -		drm_helper_hpd_irq_event(vgdev->ddev);
> +		if (vgdev->num_scanouts) {
> +			if (vgdev->has_edid)
> +				virtio_gpu_cmd_get_edids(vgdev);

Worth doing the same thing in virtio_gpu_init()? Aka move the has_edid
&& get_edids within the num_scanouts if block.

HTH
Emil

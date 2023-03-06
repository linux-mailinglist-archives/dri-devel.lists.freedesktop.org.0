Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A06386AB71F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 08:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B174610E0EA;
	Mon,  6 Mar 2023 07:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B099D10E0EA
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 07:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678087956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3OsqXLKNd2dBJmm8rJgq17jFb+t8dN7wBJ5vGDrT1jE=;
 b=f5O2dWWzlNv14Sg5OXkFNmrBQ5ukZ+cn1J2WZphlIazOMTC7kwzDAaNpiWTiXFLiga+eVH
 8sHAzOs8jgQ5wDGVn9CoWbtDDETFpqgkCSlg1SAfIgpx+gsQdiRIM2g8KuflMwuK2redUg
 TEwXKVcZoDPtcUW9NDUu9nEIpWzF1b4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-kBwuc6YxM4-fE9t2ts8G2w-1; Mon, 06 Mar 2023 02:32:32 -0500
X-MC-Unique: kBwuc6YxM4-fE9t2ts8G2w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B23E1C04322;
 Mon,  6 Mar 2023 07:32:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85BE540C83B6;
 Mon,  6 Mar 2023 07:32:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 32FAE1800613; Mon,  6 Mar 2023 08:32:30 +0100 (CET)
Date: Mon, 6 Mar 2023 08:32:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v1] drm/virtio: Fix handling CONFIG_DRM_VIRTIO_GPU_KMS
 option
Message-ID: <20230306073230.cka4j44sdteqrpao@sirius.home.kraxel.org>
References: <20230304220510.964715-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230304220510.964715-1-dmitry.osipenko@collabora.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
 Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, kernel@collabora.com,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -45,9 +45,11 @@ static void virtio_gpu_config_changed_work_func(struct work_struct *work)
>  	if (events_read & VIRTIO_GPU_EVENT_DISPLAY) {
>  		if (vgdev->has_edid)
>  			virtio_gpu_cmd_get_edids(vgdev);
> -		virtio_gpu_cmd_get_display_info(vgdev);
> -		virtio_gpu_notify(vgdev);
> -		drm_helper_hpd_irq_event(vgdev->ddev);
> +		if (vgdev->num_scanouts) {
> +			virtio_gpu_cmd_get_display_info(vgdev);
> +			virtio_gpu_notify(vgdev);
> +			drm_helper_hpd_irq_event(vgdev->ddev);
> +		}

I'd suggest to make the edid lines conditional too.

> -	if (IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS) || !vgdev->num_scanouts) {
> +	if (!IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS) || !vgdev->num_scanouts) {
>  		DRM_INFO("KMS disabled\n");
>  		vgdev->num_scanouts = 0;
>  		vgdev->has_edid = false;

Doesn't make a difference because has_edid gets set to false here,
but IMHO it is less confusing that way.

take care,
  Gerd


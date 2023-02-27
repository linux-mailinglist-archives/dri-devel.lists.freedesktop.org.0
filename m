Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B30B6A48B3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 18:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3D910E1DB;
	Mon, 27 Feb 2023 17:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C43610E1DB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 17:57:10 +0000 (UTC)
Received: from [192.168.2.206] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D945C6602FC1;
 Mon, 27 Feb 2023 17:57:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677520628;
 bh=NjhP5iSMYLWs3pPcOz+oxCC/RwMTQmIVwAH4A+dSJnY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SMj+t+p1aHOa7rw054TzSAQ8IMUmz5bkEewJktZu2djJOY3V0iy9uiPOvw0SnkGp5
 2bilwLjmUKmjzSpz+Qn0/DVwdb5xjAM2OaV7QHxvznTTQALrZQtEBck72GeS6TJcCn
 4RH8A+YGwSgRkHq0PhsLE2xNYj9g3psBUTURQlbETxB8QO0rKYIZHWM++7rTarsggb
 Iee6G2G0FtsKKOY6Bvfn7UWShAQ3Mo7jNxH3fMcF47DP0xZSFyltSiQ0sAkIJ+LONy
 tQhJbKcD2QyvWX33Kt18IGeXVv12M9qm0DtFQwZY1LdVL+5DlFPxFyw10MHp41zAl7
 A/ck3t2GaztIA==
Message-ID: <44e67d88-fce6-a1c1-79a9-a937e64a32bb@collabora.com>
Date: Mon, 27 Feb 2023 20:57:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] drm/virtio: Add option to disable KMS support
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230227173800.2809727-1-robdclark@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230227173800.2809727-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Ryan Neph <ryanneph@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/27/23 20:38, Rob Clark wrote:
...
> +	if (IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS)) {
> +		/* get display info */
> +		virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
> +				num_scanouts, &num_scanouts);
> +		vgdev->num_scanouts = min_t(uint32_t, num_scanouts,
> +					    VIRTIO_GPU_MAX_SCANOUTS);
> +		if (!vgdev->num_scanouts) {
> +			/*
> +			 * Having an EDID but no scanouts is non-sensical,
> +			 * but it is permitted to have no scanouts and no
> +			 * EDID (in which case DRIVER_MODESET and
> +			 * DRIVER_ATOMIC are not advertised)
> +			 */
> +			if (vgdev->has_edid) {
> +				DRM_ERROR("num_scanouts is zero\n");
> +				ret = -EINVAL;
> +				goto err_scanouts;
> +			}
> +			dev->driver_features &= ~(DRIVER_MODESET | DRIVER_ATOMIC);

If it's now configurable by host, why do we need the
CONFIG_DRM_VIRTIO_GPU_KMS?

-- 
Best regards,
Dmitry


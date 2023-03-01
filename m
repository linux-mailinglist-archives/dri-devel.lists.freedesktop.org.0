Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F10A6A7642
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 22:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090FD10E09C;
	Wed,  1 Mar 2023 21:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C2210E09C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 21:39:39 +0000 (UTC)
Received: from [192.168.2.206] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CDE0F6602090;
 Wed,  1 Mar 2023 21:39:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677706778;
 bh=qfDjYlzDwFwVfHyC4wdLJWT5MiWZh5diRa9lzEziWvA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fJtpAP3xqsNFJWkDiHKTcvTxy6ss1AkwYaXx/U2+rveCPUTNTOsRqASOuiTEUTiuB
 JnMXVSwGJq3OKL7NQ3z6S4s+Kqk2SU+ITdkmk546n1HwS2yarktgpk8/kWZhEVvuSP
 yR8qYWCASQNTim6j4QFNi5xIa9yLnQv5I29qfbfVE1Z5ZVrEy7V/yUbCAJpjHoq1Cs
 jX4FjK7oeip19SF2auP6KO5etkyT65LvchwoHdsZ1EzOQ8CSKElQBgeoMq67E1R9eJ
 hTuNSeXHGxPBKrW3TiWWJ5lBrYKlbdEiF3mZH2unhSmt9FNywKUUGXTilMTF6aw9+Y
 Bis9n+Pl6/GAg==
Message-ID: <6eb2cde8-f548-73ba-6091-131c1848690c@collabora.com>
Date: Thu, 2 Mar 2023 00:39:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5] drm/virtio: Add option to disable KMS support
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230301185432.3010939-1-robdclark@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230301185432.3010939-1-robdclark@gmail.com>
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
 Javier Martinez Canillas <javierm@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/1/23 21:54, Rob Clark wrote:
>  /* virtgpu_display.c */
> +#if defined(CONFIG_DRM_VIRTIO_GPU_KMS)
>  int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
>  void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
> +#else
> +static inline int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
> +{
> +	return 0;
> +}
> +static inline void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev)
> +{
> +}
> +#endif

In v4 Gerd wanted to keep building the virtgpu_display.o and instead add
the KSM config check to virtio_gpu_modeset_init/fini(). Is there any
reason why you didn't do that?

-- 
Best regards,
Dmitry


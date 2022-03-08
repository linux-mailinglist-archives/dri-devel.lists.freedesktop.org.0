Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9357D4D1CB7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 17:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7060510E19E;
	Tue,  8 Mar 2022 16:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886E910E171
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 16:04:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 577761F445B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646755486;
 bh=hOiZ9ykiaBDPKQzbGHfm3j2FlBLb1AlaOgBoAKkcoPg=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=FBtBWn9E/pS7cuhC9BkGYA5+Me1Js9aqgIplk3YYC1XpdPiYgr4/OV47uPbqINlQ2
 ePGG2EkSTYr/as5sSE0KgnvoLJs8H4t9MOXFrE/VCAYlOewQaXfLrZVIC1xFnCmJ3H
 +eS+TT3G+Ntg7T7LQxZkgEghutet5hVU/muOQ7z7nU+03X0Lh7dpQNLqsjmXRbN7qq
 330vN5NO2lS2lsBQuKoaIc0ULCjmHKjrUQiLNgR0WLoopfs/3T4Rte7UH3uS9xJ2Sq
 GR/NFtcru+JD4/hatzxB+pmDr4oOWhoPoAQ1lN38owV+9Yj8AgmFi8/uWVZ0mXd5q7
 tsTT0/7BvMSVw==
Message-ID: <d9c0cdc7-9650-d9e3-e872-4bf22f0c4baa@collabora.com>
Date: Tue, 8 Mar 2022 19:04:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 5/5] drm/virtio: Add memory shrinker
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>
References: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
 <20220308131725.60607-6-dmitry.osipenko@collabora.com>
In-Reply-To: <20220308131725.60607-6-dmitry.osipenko@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/8/22 16:17, Dmitry Osipenko wrote:
> @@ -246,20 +246,28 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
>  	struct virtio_gpu_device *vgdev = dev->dev_private;
>  	struct virtio_gpu_framebuffer *vgfb;
>  	struct virtio_gpu_object *bo;
> +	int err;
>  
>  	if (!new_state->fb)
>  		return 0;
>  
>  	vgfb = to_virtio_gpu_framebuffer(new_state->fb);
>  	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
> -	if (!bo || (plane->type == DRM_PLANE_TYPE_PRIMARY && !bo->guest_blob))
> +
> +	err = virtio_gpu_gem_pin(bo);
> +	if (err)
> +		return err;

I just noticed that this produces a refcount debug warning because I
missed to initialize the refcount when BO is created. That warning splat
was hidden by a huge lockdep splat produced by
drm_aperture_remove_conflicting_pci_framebuffers(), which probably
should be fixed. I'll correct it in v2.

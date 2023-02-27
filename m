Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE626A4A0F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 19:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BCA10E2D2;
	Mon, 27 Feb 2023 18:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E0A10E2D2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 18:44:35 +0000 (UTC)
Received: from [192.168.2.206] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2E69F6602135;
 Mon, 27 Feb 2023 18:44:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677523474;
 bh=tABKF9wTdWSWQ++4KVogjtpRwZoO5LJkPSCzhWoF5ns=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Hr7SiW1uYTRiZbtB/kl6JjRQxbFGPavMrU15he2IpXsnWyYWlgmzzXQFOW4Sfxfox
 U6jmhAxpDZ4IwHWdfwilXFHyFPCU/YAgv+6SWrbWXh93LFJfuhtlPCcJRFZBh40aOJ
 QrANhqZrJJUjHmU5GaP9gcM43OVdjTi0VVdQt+9tXN3IXiu0mV0sh6S2VspfINCwmt
 QNSf3LPSaBwjR7Xlr6zn6/MRhd5KTWjNxHZOFdksBE50pdADzi1ySm1ba7I/pyGUlI
 eM4zwF80AYLmg2tHzVfW4Eh7pxH/4mmDndlaI6YdOuG8cmsg38qsBQ0xcdVgmti0Oi
 4jFojkmXqUKxA==
Message-ID: <8499dacf-bd0d-7cee-aa98-a88fdf84de9e@collabora.com>
Date: Mon, 27 Feb 2023 21:44:30 +0300
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
>  static const struct drm_driver driver = {
> -	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIVER_ATOMIC,
> +	.driver_features =
> +#if defined(CONFIG_DRM_VIRTIO_GPU_KMS)

I'd also replace the `#if defined()` with `#if IS_ENABLED()`, for
consistency.

Maybe won't hurt to expand the commit message a tad, emphasizing the
security aspect and telling about the new num_scanouts=0 behaviour.

I can change it all while applying, if Gerd is okay with this patch.

Othwerise, good to me:

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry


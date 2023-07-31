Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 473C076A456
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 00:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9404210E090;
	Mon, 31 Jul 2023 22:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CA910E090
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 22:47:10 +0000 (UTC)
Received: from [192.168.2.174] (109-252-150-127.dynamic.spd-mgts.ru
 [109.252.150.127])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8EFBD6606FC2;
 Mon, 31 Jul 2023 23:47:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690843629;
 bh=3iLo+/X9Y+dd0aWL6FQv0wmSSpmb4uuYk6gaieZ7DU4=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=UNFEriavW1MbAfrmjfwXHPQBEkxiaSm45DZJJmk+ktPi+ftYrSpmjkvZ6jgcuP8ZJ
 HSgMyPYLvLp4Ig903kkkxHqXqlonWSmhC68fntkjnSot59ipMYp56+rtJ/VWd7FKYi
 WxN6k+1bvPBIxEWgOTJstnh6q/ePg3F3Eq6rlzVezXhWGJPOEhIiUi5VBEXV1GhyQL
 fNWGD9h4T6JwOPfKqezBP4fQSeFeAsjC9/1vSMU+6L1Mx/9P+nZ/vtB8E2kQH0CH4h
 hJBWcKuHzCljtCOLxgjPNt6CRhviJNtiNnaJ70TJMO52RhaUZlIgraMZcsu0x6Srgo
 O3ITQGhRrxLSA==
Message-ID: <c2ffc32d-d042-2ab1-b25c-07582e22859e@collabora.com>
Date: Tue, 1 Aug 2023 01:47:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v6 3/3] drm/virtio: Support sync objects
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <maraeo@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
 <20230416115237.798604-4-dmitry.osipenko@collabora.com>
In-Reply-To: <20230416115237.798604-4-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/16/23 14:52, Dmitry Osipenko wrote:
> Add sync object DRM UAPI support to VirtIO-GPU driver. Sync objects
> support is needed by native context VirtIO-GPU Mesa drivers, it also will
> be used by Venus and Virgl contexts.
> 
> Reviewed-by; Emil Velikov <emil.velikov@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c    |   3 +-
>  drivers/gpu/drm/virtio/virtgpu_submit.c | 219 ++++++++++++++++++++++++
>  include/uapi/drm/virtgpu_drm.h          |  16 +-
>  3 files changed, 236 insertions(+), 2 deletions(-)

Applied to misc-next

Made a minor comment change that was requested by Geert Uytterhoeven and
took into account that outfence now could be NULL after the recent
virtio-gpu changes

-- 
Best regards,
Dmitry


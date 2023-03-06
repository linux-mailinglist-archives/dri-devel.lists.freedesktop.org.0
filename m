Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F786ACAF5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 18:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53FE10E304;
	Mon,  6 Mar 2023 17:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0869910E304
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 17:44:34 +0000 (UTC)
Received: from [192.168.2.23] (109-252-117-89.nat.spd-mgts.ru [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7BAC06602EDC;
 Mon,  6 Mar 2023 17:44:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678124672;
 bh=NGzjM0Bz/bJtGBhnsK2Sj1Otpa8rXGyEL+fR0sF8Qlg=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=hCbvn9Wqk4+xRV3eP1W5ODccOmQUu1Xhw7wqpHvljXw3Dq/pFZXS+iPvANdO3ABjW
 HMvDSoY1Qt2LyprmbH/F8U6n4g8EAIMs7utlaCW5UCI1Wa4FwgQhrjBs6yMmU5Rr2q
 PhETT+a5jMernk4KjXiptMVeJAqwwbbTlWD1dSlzkhy4eJmgcFZx0RIoWtmR++7Ijt
 tXAWsr3XFYrgAFCavnLKNNKs6d8Gq7OMUu6Jtfb6/v2X06Idwmz0mxs87ad4kuKjMz
 0i34+7b5yoUp+pgmZNt07nRnpUgBy7uZKINRp/LLYu+ql4+d+rIok1D9HTr7t5REzE
 uJz/AC9HSKFTw==
Message-ID: <0341e228-a1a2-a42a-7b94-3509d17af56c@collabora.com>
Date: Mon, 6 Mar 2023 20:44:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] drm/virtio: Fix handling CONFIG_DRM_VIRTIO_GPU_KMS
 option
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Emil Velikov <emil.velikov@collabora.com>
References: <20230306163916.1595961-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20230306163916.1595961-1-dmitry.osipenko@collabora.com>
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
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/6/23 19:39, Dmitry Osipenko wrote:
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
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> Fixes: 72122c69d717 ("drm/virtio: Add option to disable KMS support")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---

Added r-b from Emil and applied to misc-next

-- 
Best regards,
Dmitry


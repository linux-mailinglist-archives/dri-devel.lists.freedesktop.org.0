Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E496AA0A9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 21:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C263895EE;
	Fri,  3 Mar 2023 20:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55B3895EE
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 20:36:15 +0000 (UTC)
Received: from [192.168.2.210] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 62BBE6602FB0;
 Fri,  3 Mar 2023 20:36:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677875774;
 bh=15/tXolhdND9XIfdhz6183l53lBlVVuHaxxsdm2MQ1Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZJNsEKRtAaKv3nwz3IfZe8MPnXYQwjDk8WvFbPrHiXcJRO0NYitdoTxxfbe36uRR2
 MCzru9LspKSJDjvSvP6+h04MGvlk9dGEENK6WIxHrxI4NiZXo3tKdFnE48Qj/rob+F
 MdJDWo47wvA48oW7Jso0bjeHeFZ9Sy2Z5LHBnsF/QZtHFnjuJB2oZhfDIj/TuwNMfO
 gYB3vS4hNEjBaVPbeAI0+9hXmp4JnVOIiRSEqaHITTWfGxuZ7vc2JtwYoVhy+PtJtX
 j//qbQncKnJxjvKQQtA6iTDMhE/7LZZP/4n0wdbfe35Tz8AYyES3piDyn/ABgHinWy
 VOztUL9w1NpQA==
Message-ID: <8bb4cf0f-dbb5-095d-edc6-47e1ff9dd6c8@collabora.com>
Date: Fri, 3 Mar 2023 23:36:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6] drm/virtio: Add option to disable KMS support
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20230302233506.3146290-1-robdclark@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230302233506.3146290-1-robdclark@gmail.com>
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
 David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/3/23 02:35, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add a build option to disable modesetting support.  This is useful in
> cases where the guest only needs to use the GPU in a headless mode, or
> (such as in the CrOS usage) window surfaces are proxied to a host
> compositor.
> 
> As the modesetting ioctls are a big surface area for potential security
> bugs to be found (it's happened in the past, we should assume it will
> again in the future), it makes sense to have a build option to disable
> those ioctls in cases where they serve no legitimate purpose.
> 
> v2: Use more if (IS_ENABLED(...))
> v3: Also permit the host to advertise no scanouts
> v4: Spiff out commit msg
> v5: Make num_scanouts==0 and DRM_VIRTIO_GPU_KMS=n behave the same
> v6: Drop conditionally building virtgpu_display.c and early-out of
>     it's init/fini fxns instead
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Applied to misc-next

-- 
Best regards,
Dmitry


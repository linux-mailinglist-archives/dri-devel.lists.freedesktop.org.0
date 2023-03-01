Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CED6A6453
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 01:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1EA10E03F;
	Wed,  1 Mar 2023 00:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F4310E03F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 00:37:30 +0000 (UTC)
Received: from [192.168.2.206] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id ADA126602176;
 Wed,  1 Mar 2023 00:37:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677631049;
 bh=BJGJp5r/8TcdJ4ZzAWHMPT9bm/EZ01/ZzjrqT4SG8Ek=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I2xgaCATuSX1p2pXuPAvoyDTM1CxPfqb24xvjqlDLsG8ngJSgjWTBv+O1EU9cLO0A
 3HJLdoVBtHBVE2F5f5Hnx4AwESVkRqc+OYDzU6LqpwKNJC+J9irlK/hOTzlHtP5UJv
 QU7dc5WKdJKo7AT66g2DP5a5mE5VZrYZb0ldgkRNU2aoNQQqDoQsWLtvxONKl4hFEY
 ApNVEFBHp9IUzysA6OfsosqoDrWXPcPhbHI3fKi8X7c/84OlK3A0rCZBZ0aq7VywsD
 MOGx1fJtX2AMtus1Q/kumMzjSmBoppPqxbPiwnCeFH2mHkBlCLSAgBjL13trgWG3lA
 iuVRYXw7/i4gw==
Message-ID: <583bf774-5594-5553-f5e2-45ccf7babff7@collabora.com>
Date: Wed, 1 Mar 2023 03:37:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] drm/virtio: Add option to disable KMS support
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20230228155406.2881252-1-robdclark@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230228155406.2881252-1-robdclark@gmail.com>
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
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/28/23 18:54, Rob Clark wrote:
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
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---

Gerd, to give you some context on the v4.. we've chatted a bit more on
the #dri-devel and concluded that config option is the most robust way
of having KMS disabled from a security stand point. We would also want
to have a per-driver option (and not global) because there are scenarios
of using passthrough GPU + virtio-gpu in a guest, hence we would only
want to toggle KMS for a particular driver.

-- 
Best regards,
Dmitry


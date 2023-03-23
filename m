Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9A86C72AF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 23:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B77A10EB67;
	Thu, 23 Mar 2023 22:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F53C10EB79
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 22:00:00 +0000 (UTC)
Received: from [192.168.2.179] (109-252-120-116.nat.spd-mgts.ru
 [109.252.120.116])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 950556603100;
 Thu, 23 Mar 2023 21:59:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1679608798;
 bh=60wGBuJj45XCCI/s63PRczMsiWd8B2jtfeIEzwRScu8=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=Jz5fJubEMEXtOrf6sJBCf4YJWA2vEtn2rP3P1O9oLy7JGzXWG0Ck9gId5s90NQ/MD
 oTP1If2L+r+OiCWIpxMDWW0zIGmKwBT2tXqtWXezuZqqOvr+aQyKZfFPis9xuCmQgz
 5ZmoKh2JLWwplhchtXxiahcDDd4lY4/YPGIDZTkYe/ey7e0c44apS2Qolu+JEhUjD1
 pwIQ3t+Lr9FRAXUiFNLf/jn4htGnYBjyS6ksv9Ss5QymatYdCDU33kFUEiWpNJnma9
 upPvZUmk83Fe9VXj2M6DR9w4vqcB3DFAsk2a1EszJbtqfgmHsW3X2aQQqDiOgIO6gB
 srwh2w1WMUBwg==
Message-ID: <fafecfaf-a3c2-3ffb-b9e3-1f3d96b1318a@collabora.com>
Date: Fri, 24 Mar 2023 00:59:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] drm/virtio: Support sync objects
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <maraeo@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
References: <20230323190340.950875-1-dmitry.osipenko@collabora.com>
 <20230323190340.950875-3-dmitry.osipenko@collabora.com>
In-Reply-To: <20230323190340.950875-3-dmitry.osipenko@collabora.com>
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

On 3/23/23 22:03, Dmitry Osipenko wrote:
>  struct virtio_gpu_submit {
> +	struct virtio_gpu_submit_post_dep *post_deps;
> +	unsigned int num_out_syncobjs;
> +
> +	struct drm_syncobj **in_syncobjs;
> +	unsigned int num_in_syncobjs;
> +	uint64_t *in_fence_ids;
> +	unsigned int num_in_fence_ids;

The in_fence_ids actually doesn't belong to this patch. Missed to remove
it on a rebase, will fix in v4.

-- 
Best regards,
Dmitry


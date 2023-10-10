Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9617C00CB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 17:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAEF10E3B5;
	Tue, 10 Oct 2023 15:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B056310E3AC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 15:52:20 +0000 (UTC)
Received: from [192.168.2.166] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C1E7C6602FFB;
 Tue, 10 Oct 2023 16:52:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696953139;
 bh=ucc4pX3pU2zT/ehfm8s0pPcq5VisVMikfVd/CN6DSxM=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=ObDB1aoHQC3XxXIiuQEz7ADG9xjmR7XxzUkewpwLexrSPV0cJPgstCbo1nUZfCZ8w
 0bE0ESaxBtvJUMtOr4CyttXAGxd78qpM6L8JtnA3fgdNKx3Y9TWIwh0oGb5fOZ5JF9
 s7ztzPw2ZREixPOGM3pngGx9AQbJ9hEe8WrK2hr06WLyD7h4MG0PK1PxDHU0fn/nSb
 avIoOsBv5s4/7R0ST9qGngpWWFTaOg0uZpc7W//3OUOu+VXgiEK553zoV3WmqsohVQ
 zPe7y+V1jAOOCluR4p1x+5SIg/d8cNn8iSDAQJOxlGuvqKbuPtLG74R035uQu0CESi
 jlLkdoA6xo5yg==
Message-ID: <2c162058-288c-9e9e-48d5-3b2ddb0cc1fa@collabora.com>
Date: Tue, 10 Oct 2023 18:52:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] drm/virtio: add new virtio gpu capset definitions
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20231010135722.1142265-1-ray.huang@amd.com>
 <2f8bcce1-6551-6c2d-481c-67502c82bc68@collabora.com>
In-Reply-To: <2f8bcce1-6551-6c2d-481c-67502c82bc68@collabora.com>
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
Cc: Honglei Huang <honglei1.huang@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Julia Zhang <julia.zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/23 18:40, Dmitry Osipenko wrote:
> On 10/10/23 16:57, Huang Rui wrote:
>> These definitions are used fro qemu, and qemu imports this marco in the
>> headers to enable gfxstream, venus, cross domain, and drm (native
>> context) for virtio gpu. So it should add them even kernel doesn't use
>> this.
>>
>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>
>> Changes V1 -> V2:
>> - Add all capsets including gfxstream and venus in kernel header (Dmitry Osipenko)
>>
>> Changes V2 -> V3:
>> - Add missed capsets including cross domain and drm (native context)
>>   (Dmitry Osipenko)
>>
>> v1: https://lore.kernel.org/lkml/20230915105918.3763061-1-ray.huang@amd.com/
>> v2: https://lore.kernel.org/lkml/20231010032553.1138036-1-ray.huang@amd.com/
>>
>>  include/uapi/linux/virtio_gpu.h | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
>> index f556fde07b76..240911c8da31 100644
>> --- a/include/uapi/linux/virtio_gpu.h
>> +++ b/include/uapi/linux/virtio_gpu.h
>> @@ -309,6 +309,10 @@ struct virtio_gpu_cmd_submit {
>>  
>>  #define VIRTIO_GPU_CAPSET_VIRGL 1
>>  #define VIRTIO_GPU_CAPSET_VIRGL2 2
>> +#define VIRTIO_GPU_CAPSET_GFXSTREAM 3
> 
> The GFXSTREAM capset isn't correct, it should be GFXSTREAM_VULKAN in
> accordance to [1] and [2]. There are more capsets for GFXSTREAM.
> 
> [1]
> https://github.com/google/crosvm/blob/main/rutabaga_gfx/src/rutabaga_utils.rs#L172
> 
> [2]
> https://patchwork.kernel.org/project/qemu-devel/patch/20231006010835.444-7-gurchetansingh@chromium.org/

Though, maybe those are "rutabaga" capsets that not related to
virtio-gpu because crosvm has another defs for virtio-gpu capsets [3].
The DRM capset is oddly missing in [3] and code uses "rutabaga" capset
for DRM and virtio-gpu.

[3]
https://github.com/google/crosvm/blob/main/devices/src/virtio/gpu/protocol.rs#L416

Gurchetan, could you please clarify which capsets definitions are
related to virtio-gpu and gfxstream. The
GFXSTREAM_VULKAN/GLES/MAGMA/COMPOSER or just the single GFXSTREAM?

-- 
Best regards,
Dmitry


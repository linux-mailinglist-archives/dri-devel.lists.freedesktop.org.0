Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8116AC5FA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 16:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B1410E270;
	Mon,  6 Mar 2023 15:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A6810E270
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 15:55:24 +0000 (UTC)
Received: from [192.168.2.23] (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3888D6602087;
 Mon,  6 Mar 2023 15:55:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678118121;
 bh=XyqnRCXolXHUZxZOJfpHbepcakk7OmYtZwrG/qj46gY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Prh0JZsxK166/cnlkXfFrU3mxiLAjoJU1J8EYhGbQwYJJOxnWxq7aKxSyR9rc9WEB
 8nIKH/KrkOmYyunzG1knBFnzoDh4RvPHdVf34C/kWbjm/p6KfRm+owk9l/tl7GB8ad
 NGbN8DSd/VOKXoyEVTSCzWDK8WtiUNeaSw2Utu6QW4uq3yBgIP0r+vB1AG6orGOgvo
 mnivsc4qsXUS8cVV964zR+Ni/zDjIzgXny/2t0ZXIDN0IFMqkWRJdVbUdzmiEji3fv
 Ppv4qmBTMRkUHNai7D4O9p+h2LBiEGdMqrXV+HEBiRXIz7uk5cEMAHnqzaAOgl/5GA
 TdAfuj4iaottQ==
Message-ID: <abcb4ae1-399c-d3c4-1e80-ade08b391329@collabora.com>
Date: Mon, 6 Mar 2023 18:55:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] drm/virtio: Fix handling CONFIG_DRM_VIRTIO_GPU_KMS
 option
To: Emil Velikov <emil.velikov@collabora.com>
References: <20230306143234.1561759-1-dmitry.osipenko@collabora.com>
 <ZAYAbIXlLLkNCB6f@arch-x395>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <ZAYAbIXlLLkNCB6f@arch-x395>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ryan Neph <ryanneph@chromium.org>,
 David Airlie <airlied@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, kernel@collabora.com,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/6/23 18:02, Emil Velikov wrote:
> On 2023/03/06, Dmitry Osipenko wrote:
>> VirtIO-GPU got a new config option for disabling KMS. There were two
>> problems left unnoticed during review when the new option was added:
>>
>> 1. The IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS) check in the code was
>> inverted, hence KMS was disabled when it should be enabled and vice versa.
>>
>> 2. The disabled KMS crashed kernel with a NULL dereference in
>> drm_kms_helper_hotplug_event(), which shall not be invoked with a
>> disabled KMS.
>>
>> Fix the inverted config option check in the code and skip handling the
>> VIRTIO_GPU_EVENT_DISPLAY sent by host when KMS is disabled in guest to fix
>> the crash.
>>
>> Fixes: 72122c69d717 ("drm/virtio: Add option to disable KMS support")
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>
>> Changelog:
>>
>> v2: - Moved the "has_edid" under the "num_scanouts" condition, like was
>>       suggested by Gerd Hoffmann.
>>
> 
> Hi Dmitry, I think there's more than one piece like that in the driver.
> 
>>  drivers/gpu/drm/virtio/virtgpu_kms.c | 14 ++++++++------
>>  1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
>> index 874ad6c2621a..15f2519988e7 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
>> @@ -43,11 +43,13 @@ static void virtio_gpu_config_changed_work_func(struct work_struct *work)
>>  	virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
>>  			events_read, &events_read);
>>  	if (events_read & VIRTIO_GPU_EVENT_DISPLAY) {
>> -		if (vgdev->has_edid)
>> -			virtio_gpu_cmd_get_edids(vgdev);
>> -		virtio_gpu_cmd_get_display_info(vgdev);
>> -		virtio_gpu_notify(vgdev);
>> -		drm_helper_hpd_irq_event(vgdev->ddev);
>> +		if (vgdev->num_scanouts) {
>> +			if (vgdev->has_edid)
>> +				virtio_gpu_cmd_get_edids(vgdev);
> 
> Worth doing the same thing in virtio_gpu_init()? Aka move the has_edid
> && get_edids within the num_scanouts if block.

Good catch, that could be done for consistency.

-- 
Best regards,
Dmitry


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD91C51DA7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 12:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47E0882B5;
	Wed, 12 Nov 2025 11:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="JoUm3bJT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 521 seconds by postgrey-1.36 at gabe;
 Wed, 12 Nov 2025 11:11:57 UTC
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B119D10E6F1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 11:11:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1762945914; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=L/lbvRNP8IvWWRYYidDbHBvmapKFQ+yJeGS5Qwxp41utal/8onZ3N0u47EXC7R2mfcwNA7uakudh3JjaMDZ9jKtDVL5bq3sQ1mODZTOrx85niEceQB4QX9ITpVegSOqA1U9MLyaD13NJ+HzgCerX8uDWW+E4TM3SEXoNZjGBEU4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1762945914;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=D20Ci6sfS2kiFyLEVliloiw47o3C8AK5TGMev28PMjk=; 
 b=gk2ZFK+YAZcf3z7DdE2E4gMbT0nTK0BDKQWzB2L11c+FD9POOB5JoNxFptIy6QDYdnbqyx8zmVz6mwCW//5M+V3LBuVmGk2S6zl4Fy/murBrbV6z8rY9U0rGPQImGPTjnjKYdd5Ab+KT5w8z+/qc0NuoZZBiJkivCythqXIp1wg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762945914; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=D20Ci6sfS2kiFyLEVliloiw47o3C8AK5TGMev28PMjk=;
 b=JoUm3bJTIL7trPcHFtACZQklAC+rYQ7gwbZvObi4Li+zCCYIoTOLckthOwlWZlGQ
 XHVkejgSAS4qVWyw9+Xn2KItckXarcDxD89tD8WqXac7JPm+6Ej0J2QLaySjR9P4HeY
 sURa8g9AyZg5+Yx9z0M/AtUQZGovIE5sZCIV0t/Q=
Received: by mx.zohomail.com with SMTPS id 176294591250710.938122553145263;
 Wed, 12 Nov 2025 03:11:52 -0800 (PST)
Message-ID: <55556365-4c6e-450c-89aa-9c49ede53b00@collabora.com>
Date: Wed, 12 Nov 2025 14:11:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] drm/virtio: Add PM notifier to restore objects
 after hibernation
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org
Cc: airlied@redhat.com, kraxel@redhat.com, nirmoyd@nvidia.com
References: <20251027205323.491349-1-dongwon.kim@intel.com>
 <20251027205323.491349-4-dongwon.kim@intel.com>
 <90f9c416-05d6-45f4-8205-027fc36e88e0@collabora.com>
Content-Language: en-US
In-Reply-To: <90f9c416-05d6-45f4-8205-027fc36e88e0@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/12/25 14:01, Dmitry Osipenko wrote:
> On 10/27/25 23:53, dongwon.kim@intel.com wrote:
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
>> index 676893e90a9f..5ff79e3775e8 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
>> @@ -207,6 +207,15 @@ static int virtgpu_restore(struct virtio_device *vdev)
>>  
>>  	virtio_device_ready(vdev);
>>  
>> +	if (vgdev->hibernation) {
>> +		vgdev->hibernation = false;
>> +		error = virtio_gpu_object_restore_all(vgdev);
>> +		if (error) {
>> +			DRM_ERROR("Failed to recover virtio-gpu objects\n");
>> +			return error;
>> +		}
>> +	}
> 
> What if hibernation was aborted and didn't happen? In that case
> restoring of objects will fail. Please investigate how to handle aborted
> hibernation properly.

One option could be to explicitly destroy all stored objs upon
hibernation, that way the restoring will always work.

-- 
Best regards,
Dmitry

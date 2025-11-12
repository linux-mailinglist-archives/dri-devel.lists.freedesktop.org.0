Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF51C51D05
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 12:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2534D10E6EA;
	Wed, 12 Nov 2025 11:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="jy0q5I5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD09210E6EA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 11:01:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1762945269; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bTCoxOfiuC8eaPSqTgSP9LZ2zbVluhzyb4dq+gBPiAaa8llxKt5pkrmJuCcLAHVRdl3f4lDsAraFmQU2ooyiWVp7TW6YuHwc3JiYnWqC06V6GrqBD1s5pmTCIcFGxrx5lt1PWZAEKDnvR7qSiy//wZHlpSHyOEjR9TEfsChQRsA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1762945269;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=0EYZqzpD1ykNrnawQ++xPKkLSKaxXDeHnl3YF6aWEGY=; 
 b=dep98odAS7Ga3m9WNTXAVM7NIYflMTWKzuM/Ln8UQ7lng6dcdxgvvJhL8qF5BDNw4bG1ZDWxdSsXmgizDiRvhKhPb8vo7m0PU2Vnkq49pIyF+8JaIZshdqyRdzp4svnj+9htoKwwAqcb8fDlnSYgIL0bYGzrAVTfGWAqMzOIix8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762945269; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=0EYZqzpD1ykNrnawQ++xPKkLSKaxXDeHnl3YF6aWEGY=;
 b=jy0q5I5J9J2ikV64vP62TbFeQ2RXFtuc+mCXQybGWSpogxcHxad53EZ5aGtiOFTL
 BOJkXb0uEsFFqE3oS6lHPwKuPtKUfsj34I0HupM2eeeg1dU4J5iOToJIzLz6ll6WBF6
 i2wBOu1feWbw/x0VZE1WHTwI7e8zGIQ6Zq01lwf8=
Received: by mx.zohomail.com with SMTPS id 1762945265515968.9016247587382;
 Wed, 12 Nov 2025 03:01:05 -0800 (PST)
Message-ID: <90f9c416-05d6-45f4-8205-027fc36e88e0@collabora.com>
Date: Wed, 12 Nov 2025 14:01:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] drm/virtio: Add PM notifier to restore objects
 after hibernation
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org
Cc: airlied@redhat.com, kraxel@redhat.com, nirmoyd@nvidia.com
References: <20251027205323.491349-1-dongwon.kim@intel.com>
 <20251027205323.491349-4-dongwon.kim@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20251027205323.491349-4-dongwon.kim@intel.com>
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

On 10/27/25 23:53, dongwon.kim@intel.com wrote:
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index 676893e90a9f..5ff79e3775e8 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -207,6 +207,15 @@ static int virtgpu_restore(struct virtio_device *vdev)
>  
>  	virtio_device_ready(vdev);
>  
> +	if (vgdev->hibernation) {
> +		vgdev->hibernation = false;
> +		error = virtio_gpu_object_restore_all(vgdev);
> +		if (error) {
> +			DRM_ERROR("Failed to recover virtio-gpu objects\n");
> +			return error;
> +		}
> +	}

What if hibernation was aborted and didn't happen? In that case
restoring of objects will fail. Please investigate how to handle aborted
hibernation properly.

-- 
Best regards,
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C066CAFE783
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 13:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2116C10E0CF;
	Wed,  9 Jul 2025 11:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="d1ki3IFG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51F710E0CF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 11:21:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752060076; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QNJvhSxmLc7FDMN/lzVG2MkyWwqG5GQ/OD0HTDzfrZhnVCfboAEMmIuL3QvV9YFPwDLNyuheq8NhsbofobMy6MtJlJ0BjjEbXhRi64n29xsycJBnlot84ZLVSOUunUHGqoZ+xxWtR6tqIofRPjuGJs5uKYkohy3wkPKfeYev1sQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752060076;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=u5DB5oDP/+FLeBn1J0zoZ28FqErYierqXhYH7bKY9dM=; 
 b=AjPyc8/Exv1O8KxJNyi4KaPzHzfuVsBooHJFr+q+d75yJrrNouaxxR17ikuBo3j9g1Bh6yY4FzIY6nTQ/I78fRvFdAKmUb0Co5jLJmeIAGDHg6qm09RvkGRaDXhMiHVlr+DFHO0SfU+oUKIXB6SahGghxavrUGN8TESLVbzeAnI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752060076; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=u5DB5oDP/+FLeBn1J0zoZ28FqErYierqXhYH7bKY9dM=;
 b=d1ki3IFGfgh5WnPE3SUt3AQQstAc/oIbMeioA0dmeUg5zeAIPgHNdU6qAAPac3GU
 6TdDFXpcQRrpHhikaqcAUqtPTKXMIZgzpsXlLkIhFXIGSnHhIV7SKmq/eu1zobD+y0G
 3I2teRzPbgriVTS8p0PxDGrZco+tZLwQbNHq0+GE=
Received: by mx.zohomail.com with SMTPS id 175206007443533.46690037156998;
 Wed, 9 Jul 2025 04:21:14 -0700 (PDT)
Message-ID: <27233b20-c200-4d08-87d4-32cf659afd17@collabora.com>
Date: Wed, 9 Jul 2025 14:21:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/virtio: Freeze and restore hooks to support
 suspend and resume
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
References: <20250702222430.2316723-1-dongwon.kim@intel.com>
 <20250702222430.2316723-2-dongwon.kim@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250702222430.2316723-2-dongwon.kim@intel.com>
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

On 7/3/25 01:24, dongwon.kim@intel.com wrote:
> +static int virtgpu_freeze(struct virtio_device *vdev)
> +{
> +	struct drm_device *dev = vdev->priv;
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
> +	int error;
> +
> +	error = drm_mode_config_helper_suspend(dev);
> +	if (error) {
> +		DRM_ERROR("suspend error %d\n", error);
> +		return error;
> +	}
> +
> +	flush_work(&vgdev->obj_free_work);
> +	flush_work(&vgdev->ctrlq.dequeue_work);
> +	flush_work(&vgdev->cursorq.dequeue_work);
> +	flush_work(&vgdev->config_changed_work);
> +
> +	wait_event(vgdev->ctrlq.ack_queue,
> +		   vgdev->ctrlq.vq->num_free == vgdev->ctrlq.vq->num_max);
> +
> +	wait_event(vgdev->cursorq.ack_queue,
> +		   vgdev->cursorq.vq->num_free == vgdev->cursorq.vq->num_max);

Should be more correct to first do a wait_event() and then flush_work()
to not race with the work completion.



-- 
Best regards,
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E190AFEA18
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 15:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A5210E7E8;
	Wed,  9 Jul 2025 13:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="OrVphZVZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45CC10E7E8
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 13:26:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752067566; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Nqd+MRiYJyJBYSmKTJB3oeln/DyfYcu3LTjJ1gUsfOIcZBRFKmA6bhTxWioF7HVg520SNaKvZkBu62uhot6rtdspUFAYTdnAYvR51O9Hsc8BfFnZsywIKbqToepoSzmWdqIMEUEG2dnYNG7LDBTYZB28yeN8DO3T00siUzjXPDw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752067566;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=e2sNfsZlsYgMUHiVJ4/ShLoFlEPjOkEJ9tfBQSq1Bho=; 
 b=Mtkc8pqoJwiI4N1Rys9CQGwELj4ptI+3ROXiph6SH3PygLxzFCLjEPBuQcGklZKfpkQ3a+JippD0Yz8s+3nENqwdZ00mUQC3DrKhKlIP3tO92D7xeHptPFGS2OBHqlCsoVItnKXoapS3DQ62IyOohb2wohbF4dGeRCoSNi/0mts=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752067566; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=e2sNfsZlsYgMUHiVJ4/ShLoFlEPjOkEJ9tfBQSq1Bho=;
 b=OrVphZVZOGIgGnShWibEFALxmQfDK7hJhZvHRg1K58EaaDzdAqGi2g6PnUQEVlcH
 r5nEIwKvhI5LWF/ulI2YFUlfHqG+1zpQLlqTcEDj6PFZp5Ne1Zu1k//eS12K/Sb7YRd
 0nG7cmYCzkrBm+Gi/SPAz/xn0hO+lTRs16G1bJWM=
Received: by mx.zohomail.com with SMTPS id 175206756463523.780457686326827;
 Wed, 9 Jul 2025 06:26:04 -0700 (PDT)
Message-ID: <633a9922-2281-4119-8378-8d35089ce89e@collabora.com>
Date: Wed, 9 Jul 2025 16:26:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/virtio: Implement save and restore for
 virtio_gpu_objects
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
References: <20250702222430.2316723-1-dongwon.kim@intel.com>
 <20250702222430.2316723-3-dongwon.kim@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250702222430.2316723-3-dongwon.kim@intel.com>
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
> +int virtio_gpu_object_restore_all(struct virtio_gpu_device *vgdev)
> +{
> +	struct virtio_gpu_object_restore *curr, *tmp;
> +	struct virtio_gpu_mem_entry *ents;
> +	unsigned int nents;
> +	int ret;
> +
> +	list_for_each_entry_safe(curr, tmp, &vgdev->obj_restore, node) {
> +		ret = virtio_gpu_object_shmem_init(vgdev, curr->bo, &ents, &nents);
> +		if (ret)
> +			break;
> +
> +		if (curr->params.blob) {
> +			virtio_gpu_cmd_resource_create_blob(vgdev, curr->bo, &curr->params,
> +							    ents, nents);
> +		} else if (curr->params.virgl) {
> +			virtio_gpu_cmd_resource_create_3d(vgdev, curr->bo, &curr->params,
> +							  NULL, NULL);
> +
> +			if (curr->bo->attached) {
> +				curr->bo->attached = false;
> +				virtio_gpu_object_attach(vgdev, curr->bo, ents, nents);
> +			}
> +		} else {
> +			virtio_gpu_cmd_create_resource(vgdev, curr->bo, &curr->params,
> +						       NULL, NULL);
> +			if (curr->bo->attached) {
> +				curr->bo->attached = false;
> +				virtio_gpu_object_attach(vgdev, curr->bo, ents, nents);
> +			}
> +		}
> +	}

So, back to the old question I posted on v1 about GPU reset... we need
to re-create BOs after resume because QEMU destroyed these BOs on
VirtIO-GPU reset that happens on suspend. This should be a wrong
behaiviour to begin with. We're suspending machine, hence the host
resources shouldn't disappear on resume. Can we avoid GPU resetting on
suspend?

The VQ freezing part is good to me, it pauses VirtIO-GPU gracefully on
suspend. But resetting GPU shouldn't happen and needs to be fixed, IMO.
Not doing reset should also make QEMU suspend/resume work for 3d contexts.

-- 
Best regards,
Dmitry

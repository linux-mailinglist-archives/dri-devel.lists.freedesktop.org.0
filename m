Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DE6BB73F8
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 16:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8752710E934;
	Fri,  3 Oct 2025 14:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Tki8Bz4Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D11610E934
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 14:55:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759503302; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Waz1bjudZP77lYALv+82CCNfAQ32DbDAcfC8jQkKOjeMzwxsytX6+98zdsqK2RR5QNI5WYLerqW/suFsh/EfjpXhCbOk/yYYK0tItoMQmF1PLmcQsgknqbQcmNdlihuo/C/aclZF3x1KLOVhihL8VFqoRfNjPeXQFAwpquO5Yqw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759503302;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=dcaiB+NpHPrQOs0CPQzH3Hh7l87VypE69OW3XauW+6k=; 
 b=hcBso6aEiwfVrm32uRBIgAZR/ZCBq/7VkslK4zDLZdBxDSGQeLUiWq6tY9ZBB6+DREG4hKamserbV6B2XBXIkRujzYU+JgrJC//KD/qEV/O9CAdh40drMCfsufeQa/Y39nqjvhjGU7t31p1xFXCntI48vflC+K7AU0Fs4ICeB/A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759503301; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=dcaiB+NpHPrQOs0CPQzH3Hh7l87VypE69OW3XauW+6k=;
 b=Tki8Bz4YjnOerPBgh91WgINug7VfqAV1Lud7+U/vtyGp3eaEYZikg7Vp5nFDZeHX
 CEL/wuXWmff2KyAPRYPZyEkYvw3vzi8+NcAoKjX24GMdScad5LHOdmrz3Sua7QvIt38
 0UccrMJhCRTrp/iSsfVAQCzMCkLnow230Q/CeWxc=
Received: by mx.zohomail.com with SMTPS id 175950330046115.46663806524009;
 Fri, 3 Oct 2025 07:55:00 -0700 (PDT)
Message-ID: <059d3074-dc1f-47cf-9bdd-ca582e150511@collabora.com>
Date: Fri, 3 Oct 2025 17:54:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org
Cc: nirmoyd@nvidia.com
References: <20251003053402.732218-1-dongwon.kim@intel.com>
 <20251003053402.732218-3-dongwon.kim@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20251003053402.732218-3-dongwon.kim@intel.com>
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

On 10/3/25 08:34, dongwon.kim@intel.com wrote:
> +int virtio_gpu_object_restore_all(struct virtio_gpu_device *vgdev)
> +{
> +	struct virtio_gpu_object *bo, *tmp;
> +	struct virtio_gpu_mem_entry *ents;
> +	unsigned int nents;
> +	int ret = 0;
> +
> +	spin_lock(&vgdev->obj_restore_lock);
> +	list_for_each_entry_safe(bo, tmp, &vgdev->obj_restore_list, list) {
> +		ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
> +		if (ret)
> +			break;
> +
> +		if (bo->params.blob) {
> +			virtio_gpu_cmd_resource_create_blob(vgdev, bo, &bo->params,
> +							    ents, nents);
> +		} else if (bo->params.virgl) {
> +			virtio_gpu_cmd_resource_create_3d(vgdev, bo, &bo->params,
> +							  NULL, NULL);
> +
> +			if (bo->attached) {
> +				bo->attached = false;
> +				virtio_gpu_object_attach(vgdev, bo, ents, nents);
> +			}
> +		} else {

No need to restore blob and 3d resources that we don't support restore
of and that won't be in the obj_restore_list since only shmem objs are
added to the list.

-- 
Best regards,
Dmitry

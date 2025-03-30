Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CB9A759DE
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 13:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0BC10E317;
	Sun, 30 Mar 2025 11:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="NursnY5U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD8610E158
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 11:57:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743335852; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=P1tA5miijZm+3Bkaa9rBMNSFiJGzZzDqlmjl1lXuM/EVN3i2TVng+DeVpipOoud+IcO301/mwGyy2zGhTCxBwAInWsC1Y8zDNf3u/Mx5xlTBY3OmnpfFjrwwOsASQ+0vIuZKd2FpbLtYa/dCBOgNadXvukHF30dnKAa69QAKe7A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743335852;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=k+FWJ5K9t0mIrr96HYol/5V+3rGiqIkEUOji+3QAT1Y=; 
 b=kuPRmpobneR8RySBIQn7w4RL2tGmgYw/JnXTu7y75zdTkeoQhi4rIoU86YWSR+VHpX2CvJlKtF/nHxtbGKnXV0xU0ZppgxEV19g2hYOVyMoXvSQgREK6d7Z50EveLDWKOAuD3E6lUzY8cONiMRwuuBEUSetI0Z4R6G0dk/hPop0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743335852; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=k+FWJ5K9t0mIrr96HYol/5V+3rGiqIkEUOji+3QAT1Y=;
 b=NursnY5U+MK+TQ8qk841K2J0F0ExANPF8xXTLM0a3gWi1cVtS6iOvrboQFn158oe
 JCwxNvjzo5cpli7yWUCxAHViH0HVOTKBavnMqZQw3EPy6fqOpleGA/iTaD9PTMhIfCn
 6OVqbFYLaMEAgBG1fyF76rEReMjvhGier9/TOlNY=
Received: by mx.zohomail.com with SMTPS id 1743335849988975.750692076512;
 Sun, 30 Mar 2025 04:57:29 -0700 (PDT)
Message-ID: <810789ec-c034-4bdd-961a-f49c67336e45@collabora.com>
Date: Sun, 30 Mar 2025 14:57:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/virtio: implement userptr: add interval tree
To: Honglei Huang <honglei1.huang@amd.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, Demi Marie Obenour <demiobenour@gmail.com>
References: <20250321080029.1715078-1-honglei1.huang@amd.com>
 <20250321080029.1715078-8-honglei1.huang@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250321080029.1715078-8-honglei1.huang@amd.com>
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

If the purpose of this feature is to dedup usrptr BOs of a the single
process/application, can this can be done in userspace?

On 3/21/25 11:00, Honglei Huang wrote:
>  int virtio_gpu_userptr_create(struct virtio_gpu_device *vgdev,
>  			      struct drm_file *file,
>  			      struct virtio_gpu_object_params *params,
> -			      struct virtio_gpu_object **bo_ptr)
> +			      struct virtio_gpu_object **bo_ptr,
> +			      struct drm_virtgpu_resource_create_blob *rc_blob)
>  {
> +	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
>  	struct virtio_gpu_object_userptr *userptr;
>  	int ret, si;
>  	struct sg_table *sgt;
> @@ -187,6 +290,20 @@ int virtio_gpu_userptr_create(struct virtio_gpu_device *vgdev,
>  		       params->size))
>  		return -EFAULT;
>  
> +	mutex_lock(&vfpriv->userptrs_tree_lock);
> +
> +	userptr = virtio_gpu_userptr_from_addr_range(
> +		vfpriv, params->userptr, params->userptr + params->size - 1UL);

Is it possible that userptr address will be same for two different
processes?

What if userptr->flags mismatch?

> +	if (userptr) {
> +		*bo_ptr = &userptr->base;
> +		rc_blob->res_handle = userptr->base.hw_res_handle;
> +		rc_blob->bo_handle = userptr->bo_handle;

Doesn't BO refcount need to be bumped?

> +		rc_blob->offset = virtio_gpu_userptr_get_offset(
> +			&userptr->base, rc_blob->userptr);
> +		mutex_unlock(&vfpriv->userptrs_tree_lock);
> +		return STATE_RES_EXISTS;

STATE_RES_EXISTS isn't a error code

-- 
Best regards,
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE709D8A76
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 17:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0854A10E6AE;
	Mon, 25 Nov 2024 16:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="D9rbVBn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D3910E6AE
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 16:34:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732552478; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Ip8385kyC8Rz6loFN6xFAL9xoYe24YdopvjbPNZjmVdc0rM0Vrg96Fu8rJjFLR2xQiLdj0TBeHavyZ63j0xd8HwXSpZ+HTDO0Tk60iSIQiHYealdM1+cjlf7vHMpqQ6hLtjv/r/oCKCkMRZr51rPsITj7C7dGmyIFdirPBMZ6tU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732552478;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=It34dkvIg3K+YCp8MVFRqktM7HO2VhDEvVdjm/IhPxo=; 
 b=Eq11csd86v2vja2XQFrdZtW4kl403OHx16ogevtB7l2PQ/Quu+XnsPBOSEv32eKxG1nXerywZFS45bQMRN+astXNvKhVfRO57nht4MGv3VcPTcJsakLt+eSShRujFdD08H6zp1VOcUrmBRInug7AExc6BZXO85dEf2VooJb2hiE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732552478; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=It34dkvIg3K+YCp8MVFRqktM7HO2VhDEvVdjm/IhPxo=;
 b=D9rbVBn2spvV0K3Mbaa4pp/Bulp1KYDOgQGOuqAji0w9dZVOxHjbUelwF35SxtzO
 JkuCT+9xaWDHeGyeGk0R1BuFpBgzK01EP2VL/Av6cGl04hg0dvr3KoHVv+m8ZLOHZW/
 BmetkJxvbYHJEbS2r56S6PikgWVbPj1oarfSNq9U=
Received: by mx.zohomail.com with SMTPS id 1732552477447737.8687669728856;
 Mon, 25 Nov 2024 08:34:37 -0800 (PST)
Message-ID: <fc4223c0-0346-4a14-96fd-8dced8b41167@collabora.com>
Date: Mon, 25 Nov 2024 19:34:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] drm/virtio: Import prime buffers from other
 devices as guest blobs
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20241125073313.3361612-1-vivek.kasireddy@intel.com>
 <20241125073313.3361612-5-vivek.kasireddy@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20241125073313.3361612-5-vivek.kasireddy@intel.com>
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

On 11/25/24 10:31, Vivek Kasireddy wrote:
>  struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
>  						struct dma_buf *buf)
>  {
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
> +	struct dma_buf_attachment *attach;
> +	struct virtio_gpu_object *bo;
>  	struct drm_gem_object *obj;
> +	int ret;
>  
>  	if (buf->ops == &virtgpu_dmabuf_ops.ops) {
>  		obj = buf->priv;
> @@ -275,7 +304,32 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
>  		}
>  	}
>  
> -	return drm_gem_prime_import(dev, buf);
> +	if (!vgdev->has_resource_blob || vgdev->has_virgl_3d)
> +		return drm_gem_prime_import(dev, buf);
> +
> +	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
> +	if (!bo)
> +		return ERR_PTR(-ENOMEM);
> +
> +	obj = &bo->base.base;
> +	obj->funcs = &virtgpu_gem_dma_buf_funcs;
> +	drm_gem_private_object_init(dev, obj, buf->size);
> +
> +	attach = dma_buf_dynamic_attach(buf, dev->dev,
> +					&virtgpu_dma_buf_attach_ops, obj);
> +	if (IS_ERR(attach)) {
> +		kfree(bo);
> +		return ERR_CAST(attach);
> +	}
> +
> +	obj->import_attach = attach;
> +	get_dma_buf(buf);
> +
> +	ret = virtgpu_dma_buf_init_obj(dev, bo, attach);
> +	if (ret < 0)
> +		return ERR_PTR(ret);

Perhaps for a future improvement. Think we can defer
virtgpu_dma_buf_init_obj() until first use of the object in a case where
exporter supports dynamic attachment. Otherwise, we're pinning object at
the import time, partially defeating the purpose of the dynamic
attachment, AFAICT. I.e. if importer never uses object, then there is no
need to bother the exporter with the pinning.

-- 
Best regards,
Dmitry

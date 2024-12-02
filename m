Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE429E0846
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 17:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AAA10E7C0;
	Mon,  2 Dec 2024 16:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="bAr+Jd6G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED3F10E7C0;
 Mon,  2 Dec 2024 16:19:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1733156379; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LsoCdLeq6EYAL0wGIbReDDAK55iGJwXrJzzxm7ZidOpcezLJGFZKfL/d3TG8G+SVynIdLf7lRfmhGgZ+RADg/coOpMbX/XDX0Qk02MYMxn7G31NTJLLaInn0GNPNS12nSd1X8dr+kz2P2NGBYpb8RCmJUTiE3VLalCLb/isD3Q4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1733156379;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=hvTFZp9I5yxeN/zmCcaf6GmfmPRKl/MYvUNTRFeSrLM=; 
 b=WSfN/Rh7++k8NNm2ncrESO7z2L2wgmCOZH17152ecS5cnOOGdqDKsaGfKmx3Zz0jfuDTx34gRhAe883d2n7DuQd4QuTc36oqDxQXjaXjpCTMBEetaxZM4CUf8jr8cvnIX9FCfRGiOQvxMxlI1hTxcgacOGixp29lIl5RcfZax6c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733156379; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=hvTFZp9I5yxeN/zmCcaf6GmfmPRKl/MYvUNTRFeSrLM=;
 b=bAr+Jd6GAH1T2eEsUIUiuZTUdIGB3mM0D3njEbgVJhEs/3IQEe+erVDdEQBXnjnw
 zwzNeMoSAykhD8B1NlkNeAzdWEkI/b/PYHqyMn8OUaQvr5Vrp6bfIxjhKLUxcdKd+9H
 glhk6HKRKKDvviq4/e6viyL4QrvPbjFpgmRqONj8=
Received: by mx.zohomail.com with SMTPS id 1733156377347547.5350538930811;
 Mon, 2 Dec 2024 08:19:37 -0800 (PST)
Message-ID: <3ca0382c-a410-4424-a5a4-7c1b8be7ebed@collabora.com>
Date: Mon, 2 Dec 2024 19:19:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/virtio: Add drm_panic support
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, airlied@redhat.com,
 kraxel@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, daniel@ffwll.ch, jfalempe@redhat.com,
 christophe.jaillet@wanadoo.fr
Cc: virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20241129122408.4167150-1-ryasuoka@redhat.com>
 <be01d2f7-8423-4e10-b65b-a84a7bc7c99e@collabora.com>
Content-Language: en-US
In-Reply-To: <be01d2f7-8423-4e10-b65b-a84a7bc7c99e@collabora.com>
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

On 12/2/24 17:29, Dmitry Osipenko wrote:
> On 11/29/24 15:24, Ryosuke Yasuoka wrote:
> ....
>> +static int virtio_drm_get_scanout_buffer(struct drm_plane *plane,
>> +					 struct drm_scanout_buffer *sb)
>> +{
>> +	struct virtio_gpu_object *bo;
>> +
>> +	if (!plane->state || !plane->state->fb || !plane->state->visible)
>> +		return -ENODEV;
>> +
>> +	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
>> +	if (virtio_gpu_is_vram(bo))
>> +		return -ENODEV;
> 
> VirtIO-GPU now supports importing external dmabufs, we should reject
> bo->base.base.import_attach here now too.
> 
>> +
>> +	/* try to vmap it if possible */
>> +	if (!bo->base.vaddr) {
>> +		int ret;
>> +
>> +		ret = drm_gem_shmem_vmap(&bo->base, &sb->map[0]);
>> +		if (ret)
>> +			return ret;
> 
> I've now noticed that drm_gem_shmem_vmap() expects BO reservation lock
> to be held and we can't take lock it at a panic time.
> 
> https://elixir.bootlin.com/linux/v6.12.1/source/drivers/gpu/drm/drm_gem_shmem_helper.c#L330
> 
> This resv warning isn't triggered because bo->base.vaddr is set for VT
> framebufffer BO when panic happens.
> 
> We actually should reject all BOs that don't have bo->base.vaddr set at
> the panic time. Please correct it in v6 and rebase on top of a recent
> drm-next tree.

Think ideally we need to have a pre-allocated and pre-mapped BO. Then
when panic happens, use that BO and tell host to display it, i.e. not to
reuse currently displayed BO. This will make panic display work in all
conditions. WDYT?

-- 
Best regards,
Dmitry

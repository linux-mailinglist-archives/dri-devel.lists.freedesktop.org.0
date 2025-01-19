Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EA3A163CA
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jan 2025 21:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE79A10E00F;
	Sun, 19 Jan 2025 20:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="OJS8KahW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA4B10E00F
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2025 20:02:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1737316961; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=beC1LHora5gXzb8vQYKjgV/Mg3lYljFtC6KIAFumDxOYl/0w4g70Zm2aDJ4sDULZUcTPpibGegkT81KgXf/cw7w0y8ATcWd9Xnv6FuYzFOGYKc9Nb/GkFPtnurFWCeeX/U3dg0/pVqNOrSglz8tSs1Bs1NbuPC5B4fNJoRcyTz8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1737316961;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=D4dwcubPkPtRrLkzyOZzR4BzI+5nrXqEN7ot+ch3GgI=; 
 b=bC02UkPjjn03yS8NXjDQiUhpFhKExdRYqOeJsLe/0BXpOH3WcRBhV9Y9KkYl7uvCy/EQZ/wMWEofIs4AErYWsqou9rpArjHeDkm9ErMKFT0Vj4SAxBsS/oLIO+kBkadjHZk4hS0NrzBOJgT3AEnDy9xl1jFfk9DQu5UrNMU5BKE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737316961; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=D4dwcubPkPtRrLkzyOZzR4BzI+5nrXqEN7ot+ch3GgI=;
 b=OJS8KahWiV2S6XGSS013rEhxhfDIE1BeK5SgdTA0LcQqh79i1pNIgW2UEMwX+aRu
 3AcyK1XVn+Bm0vF21nISupYMFvZVUFEOs39Druanb7wXbiik9cXUlcScZpS9hx3P/Z+
 z1782qT1EHMWnvetK3mio5M+Mwu8EtHYQocuNtnE=
Received: by mx.zohomail.com with SMTPS id 1737316958659120.36088823874036;
 Sun, 19 Jan 2025 12:02:38 -0800 (PST)
Message-ID: <a6b7a3a1-e6f9-4da7-96b3-62aefb82dced@collabora.com>
Date: Sun, 19 Jan 2025 23:02:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Support partial maps of GEM objects
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20250109-virtgpu-gem-partial-map-v1-1-a914b48776bd@gmail.com>
 <2f51584c-0590-432b-a4db-7a2af99cde15@collabora.com>
 <CAMT+MTT11xg-14KrcqUTx3DxF=1NnYZAMY8RoZFoTesc0zEiVA@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <CAMT+MTT11xg-14KrcqUTx3DxF=1NnYZAMY8RoZFoTesc0zEiVA@mail.gmail.com>
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

On 1/19/25 19:18, Sasha Finkelstein wrote:
> On Sun, 19 Jan 2025 at 12:50, Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>>>       ret = io_remap_pfn_range(vma, vma->vm_start,
>>> -                              vram->vram_node.start >> PAGE_SHIFT,
>>> +                              (vram->vram_node.start >> PAGE_SHIFT) + vma->vm_pgoff,
>>>                                vm_size, vma->vm_page_prot);
>>>       return ret;
>>>  }
>>
>> The vma->vm_pgoff is fake in DRM, it's used for looking up DRM GEM
>> object based on the vma->vm_pgoff value when mmap is invoked.
> 
> If my understanding is correct, vm_pgoff gets "unfaked" by
> https://elixir.bootlin.com/linux/v6.12.6/source/drivers/gpu/drm/virtio/virtgpu_vram.c#L48
> 
>> vma->vm_pgoff should be treated as zero here. Hence we can map a part of
>> GEM, but only from its start. See drm_gem_mmap().
> 
> I've had a "v0" (not on ml) of this patch that always treated vma->vm_pgoff as
> zero. This broke when anything tried to mmap with a non-zero offset. Adding
> vm_pgoff made it work correctly.

I've tested this patch. Partial mapping with a non-zero offset doesn't
work because drm_gem_mmap() rejects it. I'd want to see your sample code
that performs mmaping, maybe I'm missing something.

>> Please correct vma->vm_pgoff in v2.
> 
> I need apps to be able to mmap with a non-zero offset for my usecase.
> While the correct value may be something else other than what is in
> the current patch, 0 is definitely incorrect for at least some workloads.

drm_gem_mmap() uses drm_vma_offset_exact_lookup_locked() that doesn't
allow vma->vm_pgoff != node.start. AFAICT, no one driver supports
mapping with a non-zero offset, perhaps for a reason that I don't know
about.

-- 
Best regards,
Dmitry

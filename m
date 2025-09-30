Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167C8BAE04C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 18:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0374210E5FD;
	Tue, 30 Sep 2025 16:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kipK6wKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC9710E5FC;
 Tue, 30 Sep 2025 16:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759248579;
 bh=zNOqW8q3K8VzrkGpGhn/Rwg2ryt2C/LYQAHlbYXM5zQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kipK6wKfCNDwXwPqAORdhW6HgjiNlNdE0KuHuBqz2AHHfRWmbcMjSrLfFIdXkLnpz
 p1M8hRm8VMktfTq1sULOVF+By7uOvMef3OfFPZW2hlzz9zlCbIZuc7sVIVHE9kTpDv
 Qzqu6Gi2EkT6BOpsLFvjVo8Hz++DRwsTFSAf+jF2WKYTxEx1pDJurafyWxK1JdrQnS
 tPyt36VADlrD9S+otqgz4MoUQrrys9qZIfE9zLIvuFBzDQ6R7DFGoXNhgUS0YjSY+V
 xuFkAzEubr5lEy5gp9gpYnc0Y5/rMd3WqyQMhvoOhvrdT5DBqq3Uh1o5d3t1Q/3q/G
 F1rT/b30CeMFg==
Received: from [IPV6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa] (unknown
 [IPv6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C64D17E010B;
 Tue, 30 Sep 2025 18:09:38 +0200 (CEST)
Message-ID: <cd9084e1-16d9-4fd6-9c64-1876d53d5225@collabora.com>
Date: Tue, 30 Sep 2025 18:09:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/gem: Introduce drm_gem_get_unmapped_area() fop
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>, Al Viro
 <viro@zeniv.linux.org.uk>, =?UTF-8?Q?Miko=C5=82aj_Wasiak?=
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, kernel@collabora.com
References: <20250929200316.18417-1-loic.molinari@collabora.com>
 <20250929200316.18417-3-loic.molinari@collabora.com>
 <20250930123003.75370854@fedora>
Content-Language: fr
From: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>
Organization: Collabora Ltd
In-Reply-To: <20250930123003.75370854@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 30/09/2025 12:30, Boris Brezillon wrote:
> On Mon, 29 Sep 2025 22:03:10 +0200
>
> Loïc Molinari <loic.molinari@collabora.com> wrote:
>> +unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
>> +					unsigned long len, unsigned long pgoff,
>> +					unsigned long flags)
>> +{
>> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> +	struct drm_gem_object *obj;
>> +	unsigned long ret;
>> +
>> +	obj = drm_gem_object_lookup_from_offset(filp, pgoff, len >> PAGE_SHIFT);
>> +	if (IS_ERR(obj))
>> +		return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0,
>> +					    flags);
>> +
>> +	ret = shmem_get_unmapped_area(obj->filp, uaddr, len, 0, flags);
>> +
>> +	drm_gem_object_put(obj);
>> +
>> +	return ret;
>> +#else
>> +	return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0, flags);
> 
> Looks like the above code covers the non-THP case too, do we really need
> to specialize for !CONFIG_TRANSPARENT_HUGEPAGE here?

It does cover the !CONFIG_TRANSPARENT_HUGEPAGE case 
(shmem_get_unmapped_area() would just call and return the 
mm_get_unmapped_area() address) but the idea here is to avoid the GEM 
object lookup cost by calling mm_get_unmapped_area() directly.

>> +#endif
>> +}
>> +EXPORT_SYMBOL(drm_gem_get_unmapped_area);

Loïc

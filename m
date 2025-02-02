Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 164F3A250D7
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 00:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE5810E11F;
	Sun,  2 Feb 2025 23:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=asahilina.net header.i=@asahilina.net header.b="aObAO7Gf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4701610E0C2;
 Sun,  2 Feb 2025 23:56:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id B7858425F5;
 Sun,  2 Feb 2025 23:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1738540566;
 bh=XxSMXL+/QTvPenPoEdFCaxa+GXolURGhYNxTlnUOi/w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=aObAO7GfWqEeA7trzJ86f/XnseVBckks3Wp4/oXznHSilYgYVoqZIWDOvj71xgkib
 lgmCn4V/J95HXPuWr/BC9UezFlKNi7fChuM++IKjdHyEnniFWEdcFH3P80QjT4GKT8
 7FXJpcyV5rxXbJB/o77o3DyY6W0ZxXjoEFTCGaMdjI9Qu614oQ9ehN29qeFz5nc71y
 n6Vb2X9YqAd8aVCrFAhZkk9YlgsEa1fvwSHKLjn9QIyM149G8f40pXF85PmeGbCrRC
 CDm8c7tFbkfvpwTOQgds27hLzVDN6ZHCf/i3csfpUeE+/V/ONQ2WElOVQKGkCcKlui
 L9Utcl2DNDEPA==
Message-ID: <4a431b98-cccc-495e-b72e-02362828c96b@asahilina.net>
Date: Mon, 3 Feb 2025 08:56:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/gpuvm: Add support for single-page-filled mappings
To: Danilo Krummrich <dakr@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, asahi@lists.linux.dev
References: <20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net>
 <Z5-_O8vkCO0LXcl7@pollux.localdomain>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <Z5-_O8vkCO0LXcl7@pollux.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 2/3/25 3:53 AM, Danilo Krummrich wrote:
> Hi Lina,
> 
> On Sun, Feb 02, 2025 at 10:34:49PM +0900, Asahi Lina wrote:
>> Some hardware requires dummy page mappings to efficiently implement
>> Vulkan sparse features. These mappings consist of the same physical
>> memory page, repeated for a large range of address space (e.g. 16GiB).
>>
>> Add support for this to drm_gpuvm. Currently, drm_gpuvm expects BO
>> ranges to correspond 1:1 to virtual memory ranges that are mapped, and
>> does math on the BO offset accordingly. To make single page mappings
>> work, we need a way to turn off that math, keeping the BO offset always
>> constant and pointing to the same page (typically BO offset 0).
>>
>> To make this work, we need to handle all the corner cases when these
>> mappings intersect with regular mappings. The rules are simply to never
>> mix or merge a "regular" mapping with a single page mapping.
>>
>> drm_gpuvm has support for a flags field in drm_gpuva objects. This is
>> normally managed by drivers directly. We can introduce a
>> DRM_GPUVA_SINGLE_PAGE flag to handle this. However, to make it work,
>> sm_map and friends need to know ahead of time whether the new mapping is
>> a single page mapping or not. Therefore, we need to add an argument to
>> these functions so drivers can provide the flags to be filled into
>> drm_gpuva.flags.
>>
>> These changes should not affect any existing drivers that use drm_gpuvm
>> other than the API change:
>>
>> - imagination: Does not use flags at all
>> - nouveau: Only uses drm_gpuva_invalidate(), which is only called on
>>   existing drm_gpuva objects (after the map steps)
>> - panthor: Does not use flags at all
>> - xe: Does not use drm_gpuva_init_from_op() or
>>   drm_gpuva_remap()/drm_gpuva_map() (which call it). This means that the
>> flags field of the gpuva object is managed by the driver only, so these
>> changes cannot clobber it.
>>
>> Note that the way this is implemented, drm_gpuvm does not need to know
>> the GPU page size. It only has to never do math on the BO offset to meet
>> the requirements.
>>
>> I suspect that after this change there could be some cleanup possible in
>> the xe driver (which right now passes flags around in various
>> driver-specific ways from the map step through to drm_gpuva objects),
>> but I'll leave that to the Xe folks.
>>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> ---
>> Asahi Lina (4):
>>       drm/gpuvm: Add a flags argument to drm_gpuvm_sm_map[_*]
>>       drm/gpuvm: Plumb through flags into drm_gpuva_op_map
>>       drm/gpuvm: Add DRM_GPUVA_SINGLE_PAGE flag and logic
>>       drm/gpuvm: Plumb through flags into drm_gpuva_init
> 
> Without looking into any details yet:
> 
> This is a bit of tricky one, since we're not even close to having a user for
> this new feature upstream yet, are we?

I'd hope we're at least somewhere "this year" close to upstreaming
drm/asahi!

> 
> I wonder if we could do an exception by adding some KUnit tests (which
> admittedly I never got to) validating things with and without this new feature.
> 
> Speaking of tests, how did you validate this change to validate the behavior
> without DRM_GPUVA_SINGLE_PAGE?

Mostly just making sure our driver passes GL/Vulkan CTS including sparse
after this change. I do want to put together some low-level tests in
igt-gpu-tools, but I haven't gotten around to it yet...

~~ Lina


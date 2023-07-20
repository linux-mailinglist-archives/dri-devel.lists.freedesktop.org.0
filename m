Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E620875AC3D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107ED10E5A4;
	Thu, 20 Jul 2023 10:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3084410E5A4;
 Thu, 20 Jul 2023 10:44:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5F902F4;
 Thu, 20 Jul 2023 03:44:52 -0700 (PDT)
Received: from [10.1.36.21] (e122027.cambridge.arm.com [10.1.36.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A7883F6C4;
 Thu, 20 Jul 2023 03:44:05 -0700 (PDT)
Message-ID: <2bf64010-c40a-8b84-144c-5387412b579e@arm.com>
Date: Thu, 20 Jul 2023 11:44:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v8 01/12] drm: manager to keep track of GPUs
 VA mappings
Content-Language: en-GB
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net,
 christian.koenig@amd.com, bskeggs@redhat.com, Liam.Howlett@oracle.com,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
 willy@infradead.org, jason@jlekstrand.net, donald.robson@imgtec.com
References: <20230720001443.2380-1-dakr@redhat.com>
 <20230720001443.2380-2-dakr@redhat.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230720001443.2380-2-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/07/2023 01:14, Danilo Krummrich wrote:
> Add infrastructure to keep track of GPU virtual address (VA) mappings
> with a decicated VA space manager implementation.
> 
> New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
> start implementing, allow userspace applications to request multiple and
> arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
> intended to serve the following purposes in this context.
> 
> 1) Provide infrastructure to track GPU VA allocations and mappings,
>    making using an interval tree (RB-tree).
> 
> 2) Generically connect GPU VA mappings to their backing buffers, in
>    particular DRM GEM objects.
> 
> 3) Provide a common implementation to perform more complex mapping
>    operations on the GPU VA space. In particular splitting and merging
>    of GPU VA mappings, e.g. for intersecting mapping requests or partial
>    unmap requests.
> 
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Tested-by: Matthew Brost <matthew.brost@intel.com>
> Tested-by: Donald Robson <donald.robson@imgtec.com>
> Suggested-by: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

[...]

> diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
> new file mode 100644
> index 000000000000..dee2235530d6
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_gpuva_mgr.c

[...]

> +static bool
> +drm_gpuva_check_overflow(u64 addr, u64 range)
> +{
> +	u64 end;
> +
> +	return WARN(check_add_overflow(addr, range, &end),
> +		    "GPUVA address limited to %lu bytes.\n", sizeof(end));
> +}

This produces a warning on 32 bit systems as sizeof() isn't necessarily 
an unsigned long. The fix below silences the warning.

Thanks,

Steve

---8<-----
From 9c7356580362b6ac4673724f18ea6e8453b52913 Mon Sep 17 00:00:00 2001
From: Steven Price <steven.price@arm.com>
Date: Thu, 20 Jul 2023 10:58:09 +0100
Subject: [PATCH] drm: manager: Fix printk format for size_t

sizeof() returns a size_t which may be different to an unsigned long.
Use the correct format specifier of '%zu' to prevent compiler warnings.

Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/drm_gpuva_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
index 0b80177592a6..f86bfad74ff8 100644
--- a/drivers/gpu/drm/drm_gpuva_mgr.c
+++ b/drivers/gpu/drm/drm_gpuva_mgr.c
@@ -619,7 +619,7 @@ drm_gpuva_check_overflow(u64 addr, u64 range)
 	u64 end;
 
 	return WARN(check_add_overflow(addr, range, &end),
-		    "GPUVA address limited to %lu bytes.\n", sizeof(end));
+		    "GPUVA address limited to %zu bytes.\n", sizeof(end));
 }
 
 static bool
-- 
2.39.2



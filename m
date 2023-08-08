Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34987773A8B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 15:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8FA10E08E;
	Tue,  8 Aug 2023 13:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD11910E08E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 13:46:21 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4RKvbt03tMz9sTC;
 Tue,  8 Aug 2023 15:46:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1691502378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tJaPJCb57rFcTjifY7HDh29RsuKKFz2of9slLTwxsBc=;
 b=H9pw2RY1RsE8VJrHAg8s6wkROee8RInItzUQQKlJrXOEKL27ySn6uRcgAmMXpMAmbAFekk
 JcZqzY8sF/VIfy0jyU2BLM953MmfvkbyTElVh/+O2+5AqJKjQs1/TeqbH50x83bTGIBIgJ
 Rzjmk2Z2mQLRATC/0MIAYNNwvfkOz0gGnDy7GLHsmxGbA+p/DtWp0tLHpggFuDjOqlO7Zj
 E8jtAXBuDetiQwVlhGdUkTKPy95a4i8o8u7nadhesxaGVwgqkUhh+EU3fZXsPnj8SHVnHH
 X9KbgAuOiEu/zDDaiNUGTElg9PjTYfD97StkO9OM4Y7eMoo8Dwl82uY5uWWZCg==
Message-ID: <dd2ceacc-f59b-9c3c-e4ce-30b3bbd6939b@mailbox.org>
Date: Tue, 8 Aug 2023 15:46:14 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v4 03/17] drm/imagination/uapi: Add PowerVR driver UAPI
To: Sarah Walker <sarah.walker@imgtec.com>
References: <20230714142543.111625-1-sarah.walker@imgtec.com>
Content-Language: en-CA
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20230714142543.111625-1-sarah.walker@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: c3pcynk7cpw94jyg1qwudy3osh1qy5xp
X-MBO-RS-ID: ec8b53fa39038fb6f46
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
Cc: matthew.brost@intel.com, hns@goldelico.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mripard@kernel.org, afd@ti.com,
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 tzimmermann@suse.de, boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/14/23 16:25, Sarah Walker wrote:
> 
> +/**
> + * DOC: PowerVR IOCTL CREATE_BO interface
> + */
> +
> +/**
> + * DOC: Flags for CREATE_BO
> + *
> + * The &struct drm_pvr_ioctl_create_bo_args.flags field is 64 bits wide and consists
> + * of three groups of flags: creation, device mapping and CPU mapping.
> + *
> + * We use "device" to refer to the GPU here because of the ambiguity between
> + * CPU and GPU in some fonts.
> + *
> + * Creation options
> + *    These use the prefix ``DRM_PVR_BO_CREATE_``.
> + *
> + *    :ZEROED: Require the allocated buffer to be zeroed before returning. Note
> + *      that this is an active operation, and is never zero cost. Unless it is
> + *      explicitly required, this option should not be set.

Making this optional is kind of problematic from a security standpoint (information leak, at least if the memory was previously used by a different process). See e.g. the discussion starting at https://gitlab.freedesktop.org/mesa/mesa/-/issues/9189#note_1972986 .

AFAICT the approach I suggested there (Clear freed memory in the background, and make it available for allocation again only once the clear has finished) isn't really possible with gem_shmem in its current state though. There seems to be ongoing work to do something like that for __GFP_ZERO in general, maybe gem_shmem could take advantage of that when it lands. I'm afraid this series can't depend on that though.


> +/**
> + * DOC: PowerVR IOCTL VM_MAP and VM_UNMAP interfaces
> + *
> + * The VM UAPI allows userspace to create buffer object mappings in GPU virtual address space.
> + *
> + * The client is responsible for managing GPU address space. It should allocate mappings within
> + * the heaps returned by %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
> + *
> + * %DRM_IOCTL_PVR_VM_MAP creates a new mapping. The client provides the target virtual address for
> + * the mapping. Size and offset within the mapped buffer object can be specified, so the client can
> + * partially map a buffer.
> + *
> + * %DRM_IOCTL_PVR_VM_UNMAP removes a mapping. The entire mapping will be removed from GPU address
> + * space. For this reason only the start address is provided by the client.
> + */

FWIW, the amdgpu driver uses a single ioctl for VM map & unmap (plus two additional operations for partial residency). Maybe this would make sense for the PowerVR driver as well, in particular if it might support partial residency in the future.

(amdgpu also uses similar multiplexer ioctls for other things such as context create/destroy/...)

Just an idea, feel free to ignore.


> +/**
> + * DOC: Flags for SUBMIT_JOB ioctl geometry command.
> + *
> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_GEOM_CMD_FIRST
> + *
> + *    Indicates if this the first command to be issued for a render.
> + *
> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_GEOM_CMD_LAST

Does user space really need to pass in the FIRST/LAST flags, can't the kernel driver determine this implicitly? What happens if user space sets these incorrectly?


> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_PREVENT_CDM_OVERLAP
> + *
> + *    Disallow compute overlapped with this render.

Does this affect only compute from the same context, or also from other contexts?

(Similar question for DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_PREVENT_ALL_OVERLAP)


P.S. I mostly just skimmed the other patches of the series, but my impression is that the patches and code are cleanly structured and well-documented.

-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer


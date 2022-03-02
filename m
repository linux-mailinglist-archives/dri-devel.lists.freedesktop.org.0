Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EB74CAFC1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 21:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457B010E707;
	Wed,  2 Mar 2022 20:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA11410E5EC;
 Wed,  2 Mar 2022 20:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646253062; x=1677789062;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GHL+JIPG3x184/pxJbSBFeF64NXauuVxdh0tdfUG+nw=;
 b=m+Fb8gvkFD/J3W2QySwy42aVA7WP7XDDeV1u71XZliFMeWMxYnamvsYc
 MNGUk6poLIwvrwtmpYLVVwUGzRldE39SGerW/BmpC0+Lwdsq0/mJDoao6
 Jh4F/IpX+Gh0BDBDQoTynalmyhSvzYZ0PY9anE6mZqHZhwttSr7XYZ4ud
 WXITizAYvATyteon/tA180sEMtWkG6FL0wmEhKs2qKxTV1TqZ9WQxHfLi
 j4zXHy0qEI70SPmLoE96FKkeYbJaVSfB4+RZhrxzviE9bKBhzOxEbU6C0
 FygZZXAvn9zcqXuXcAZRp1lYqyPqkMnhDbwh/7iyQq7s10M2Py/B0aL3n w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="316711840"
X-IronPort-AV: E=Sophos;i="5.90,150,1643702400"; d="scan'208";a="316711840"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 12:31:02 -0800
X-IronPort-AV: E=Sophos;i="5.90,150,1643702400"; d="scan'208";a="508331542"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 12:31:02 -0800
Date: Wed, 2 Mar 2022 12:33:19 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 1/3] drm/i915: Remove the vm open count
Message-ID: <20220302203319.GG25117@nvishwa1-DESK>
References: <20220302102200.158637-1-thomas.hellstrom@linux.intel.com>
 <20220302102200.158637-2-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220302102200.158637-2-thomas.hellstrom@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 02, 2022 at 11:21:58AM +0100, Thomas Hellström wrote:
>vms are not getting properly closed. Rather than fixing that,
>Remove the vm open count and instead rely on the vm refcount.
>
>The vm open count existed solely to break the strong references the
>vmas had on the vms. Now instead make those references weak and
>ensure vmas are destroyed when the vm is destroyed.
>
>Unfortunately if the vm destructor and the object destructor both
>wants to destroy a vma, that may lead to a race in that the vm
>destructor just unbinds the vma and leaves the actual vma destruction
>to the object destructor. However in order for the object destructor
>to ensure the vma is unbound it needs to grab the vm mutex. In order
>to keep the vm mutex alive until the object destructor is done with
>it, somewhat hackishly grab a vm_resv refcount that is released late
>in the vma destruction process, when the vm mutex is no longer needed.
>
>v2: Address review-comments from Niranjana
>- Clarify that the struct i915_address_space::skip_pte_rewrite is a hack and
>  should ideally be replaced in an upcoming patch.
>- Remove an unneeded continue in clear_vm_list and update comment.
>
>Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>---
> drivers/gpu/drm/i915/display/intel_dpt.c      |  2 +-
> drivers/gpu/drm/i915/gem/i915_gem_context.c   | 29 ++-----
> .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  6 ++
> .../gpu/drm/i915/gem/selftests/mock_context.c |  5 +-
> drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  2 +-
> drivers/gpu/drm/i915/gt/intel_ggtt.c          | 30 +++----
> drivers/gpu/drm/i915/gt/intel_gtt.c           | 54 ++++++++----
> drivers/gpu/drm/i915/gt/intel_gtt.h           | 56 ++++--------
> drivers/gpu/drm/i915/gt/selftest_execlists.c  | 86 +++++++++----------
> drivers/gpu/drm/i915/i915_gem.c               |  6 +-
> drivers/gpu/drm/i915/i915_vma.c               | 55 ++++++++----
> drivers/gpu/drm/i915/i915_vma_resource.c      |  2 +-
> drivers/gpu/drm/i915/i915_vma_resource.h      |  6 ++
> drivers/gpu/drm/i915/i915_vma_types.h         |  7 ++
> drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  4 +-
> 15 files changed, 186 insertions(+), 164 deletions(-)
>

Looks good to me.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>


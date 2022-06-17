Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9BD54F06F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 07:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8745011AB1B;
	Fri, 17 Jun 2022 05:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF5711AB1A;
 Fri, 17 Jun 2022 05:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655442855; x=1686978855;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QD+RaLgjgo1+pbnG5NsxybiDO4iHFsWo9LN38Qm2qvs=;
 b=Dv6+wHGZ9aYellLzfQBMTvc5d4RD3YynoItPqM/YGXjkQT505+zzjduT
 vQbG06J9oe1Px3OmcE3smI3xb6m6S7qzel/Jeu8qrLPO3w2gpOkxeD4W6
 rEdi5qrBu06ihHFVjQNaVVJVlqND+Jdo5zaisvQrwhzuspOOjVBjl8bHp
 U6szNxOYFw0lRYG6bz0+MlvCoS44bWEkTHc92W5ddETQUu9bAz5r0ABk2
 g2IeFyS63JXqsECnj3ARZvsIAXvnEmE1hvdfNeIq8kJ/6gRRKiJXw6fVo
 qRoTzjjEjOvhxJYTFoSU26pNyePn2fy+UqPte7U1ceQ8ryZxTSXmt6R1J Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280134216"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="280134216"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 22:14:13 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="688141658"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 22:14:13 -0700
Date: Thu, 16 Jun 2022 22:13:54 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@intel.com
Subject: Re: [Intel-gfx] [PATCH 0/3] drm/doc/rfc: i915 VM_BIND feature design
 + uapi
Message-ID: <20220617051354.GS376@nvishwa1-DESK>
References: <20220610070711.32407-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220610070711.32407-1-niranjana.vishwanathapura@intel.com>
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
Cc: christian.koenig@amd.com, thomas.hellstrom@intel.com,
 paulo.r.zanoni@intel.com, chris.p.wilson@intel.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 10, 2022 at 12:07:08AM -0700, Niranjana Vishwanathapura wrote:
>This is the i915 driver VM_BIND feature design RFC patch series along
>with the required uapi definition and description of intended use cases.
>

Some of us had an offline dicussion on this.
Based on that,

1) The scope of this work (VM_BIND support in i915) will reduced to
   support simple Mesa use case. So, I will remove all compute related
   uapi for now.
2) VM_BIND/UNBIND will only support an 'out' fence. ie., it won't
   support 'in' fences and hence no timeline fence array as well.
   UMDs are expected to handle any 'in' fence requirement.
3) We will not support any VM_BIND/UNBIND queues. The binding and
   unbinding operations can get completed out of submission order.
   Normally, they will get completed synchronously, but if the object
   is being moved, the binding will happen once that is complete
   and out fence will be signaled after binding is complete.
4) We will still have execbuf3 for VM_BIND mode.

I will update the patch series and send out.

Thanks,
Niranjana

>This series is an updated version of the below RFC series. It address
>the review feedback by adding execbuf3 ioctl for vm_bind, adding
>multiple queues support for vm_bind/unbind ioctls and some formatting
>and documentation updates.
>https://www.spinics.net/lists/dri-devel/msg347731.html
>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>Niranjana Vishwanathapura (3):
>  drm/doc/rfc: VM_BIND feature design document
>  drm/i915: Update i915 uapi documentation
>  drm/doc/rfc: VM_BIND uapi definition
>
> Documentation/driver-api/dma-buf.rst   |   2 +
> Documentation/gpu/rfc/i915_vm_bind.h   | 490 +++++++++++++++++++++++++
> Documentation/gpu/rfc/i915_vm_bind.rst | 309 ++++++++++++++++
> Documentation/gpu/rfc/index.rst        |   4 +
> include/uapi/drm/i915_drm.h            | 203 +++++++---
> 5 files changed, 963 insertions(+), 45 deletions(-)
> create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
> create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst
>
>-- 
>2.21.0.rc0.32.g243a4c7e27
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7ADA6EA48
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 08:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C6510E105;
	Tue, 25 Mar 2025 07:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ioWZUlfF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C5A10E02E;
 Tue, 25 Mar 2025 07:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742887172; x=1774423172;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fmAmuTHq8vU0T8QHc+oXeSQFjrfslVBl8fxxg0Yci0Q=;
 b=ioWZUlfFBDs2uR9POxn2rhnMD2PDvSbB+k99QKKoTW/AJZUIqIg6QHpo
 Re9k1GpDhGpVwi1/vbsobKYB5X464PHdCNaRau4MonqviGOhT1yysiRUs
 favvU+YxVjmiR420Ux3US6PpubggjCr+kVkqNwJN6jOF9iYsMTlLhaQao
 wh1qPUwnqc/O/G8JN+xIZVpwWxPw5cwbBQxqK76U6iWYyda/hDlFaddiv
 EO6bR6CqbFfQ9WOv3TpyP3PgA95e/8XUKXe3QLOZlk0/h/LVSdvbX9UXV
 zg9KvbHaTN0G2Rb5oVnWjAfg2zXHSCllZCA3bK0MYn5ImC5ExKxx0ND7B Q==;
X-CSE-ConnectionGUID: s4Vc4ssiQga2LHL/DhoQUQ==
X-CSE-MsgGUID: 332ktq2dSyqdPncEjSUmGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47993227"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="47993227"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 00:19:32 -0700
X-CSE-ConnectionGUID: AeBtrb5bT7eGmg3sPqN8jw==
X-CSE-MsgGUID: pzp5HpOdSY6xljS5fgBE9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124460689"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 00:19:30 -0700
Date: Tue, 25 Mar 2025 09:19:26 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "Mrozek, Michal" <michal.mrozek@intel.com>
Subject: Re: [PATCH v10 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Message-ID: <Z-JY_kzjHq5fSRBg@black.fi.intel.com>
References: <20250320152616.74587-1-jonathan.cavitt@intel.com>
 <20250320152616.74587-6-jonathan.cavitt@intel.com>
 <Z934F9fz_-d1oGiC@black.fi.intel.com>
 <CH0PR11MB5444C9D9B706616AFC314810E5A42@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Z-HN3Yvci8x7JwWc@black.fi.intel.com>
 <CH0PR11MB544414B6A0B6FBD0B790CFD4E5A42@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH0PR11MB544414B6A0B6FBD0B790CFD4E5A42@CH0PR11MB5444.namprd11.prod.outlook.com>
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

On Tue, Mar 25, 2025 at 03:01:27AM +0530, Cavitt, Jonathan wrote:
> From: Jadav, Raag <raag.jadav@intel.com> 
> > On Mon, Mar 24, 2025 at 10:27:08PM +0530, Cavitt, Jonathan wrote:
> > > From: Jadav, Raag <raag.jadav@intel.com> 
> > > > On Thu, Mar 20, 2025 at 03:26:15PM +0000, Jonathan Cavitt wrote:
> > > > > Add support for userspace to request a list of observed faults
> > > > > from a specified VM.
> > > > 
> > > > ...
> > > > 
> > > > > +static int xe_vm_get_property_size(struct xe_vm *vm, u32 property)
> > > > > +{
> > > > > +	int size = -EINVAL;
> > > > 
> > > > Mixing size and error codes is usually received with mixed feelings.
> > > > 
> > > > > +
> > > > > +	switch (property) {
> > > > > +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> > > > > +		spin_lock(&vm->faults.lock);
> > > > > +		size = vm->faults.len * sizeof(struct xe_vm_fault);
> > > > 
> > > > size_mul() and,
> > > > [1] perhaps fill it up into the pointer passed by the caller here?
> > > 
> > > "The pointer passed by the caller".  You mean the args pointer?
> > > 
> > > We'd still need to check that the args->size value is empty here before overwriting
> > > it, and we'd also still need to return the size to the ioctl so we can verify it's
> > > acceptable later in xe_vm_get_property_verify_size.
> > > 
> > > Unless you want to merge those two processes together into here?
> > 
> > The semantics are a bit fuzzy to me. Why do we have a single ioctl for
> > two different processes? Shouldn't they be handled separately?
> 
> No.  Sorry.  Let me clarify.
> "two different processes" = getting the size + verifying the size.

Yes, which seems like they should be handlded with _FAULT_NUM and
_FAULT_DATA ioctls but I guess we're way past it now.

I'm also not much informed about the history here. Is there a real
usecase behind exposing them? What is the user expected to do with
this information?

Raag

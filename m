Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F042A5176AC
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 20:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EAE10EF03;
	Mon,  2 May 2022 18:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA43410EF03;
 Mon,  2 May 2022 18:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651516790; x=1683052790;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wSx2snvDTKh1F7GlIS6ClioHHCNt24Ogh9KCnHJ8ku8=;
 b=kol4722tR5ZMmyOzAsub4s87CYYHygFM86M8soUUXIfpmpQFRJnsmMrQ
 T5c+PYnNU0BYNvoHuzM/zKuhi2ViBFFY3T6NPn5OrZ9ULPWxOXA3Un7pS
 xhaJInj44g5ZbFNU1Ze/Ji7EHx9TLknmkHJaTy5Nr1PhZk3DGcMhhPWbU
 NTvkOAc/zl/lTF2XKnvNyAsMFz1tEK1eonqAcErERHoPAyD/S2tTt1oZa
 HEZ+nZAaFX1nI6B1mM/3Wd5rgIaVDMT9k3jmuHKbAMjyq6KQ6xYLZxA+6
 Ug5HAydnha0nslx6Jo1IqY9MjZQ46Zn6CKqZAcDifTjlEucvzab4c93xA A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="247207513"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="247207513"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 11:39:50 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="690617253"
Received: from ldmartin-desk2.jf.intel.com ([134.134.244.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 11:39:50 -0700
Date: Mon, 2 May 2022 11:39:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH 03/11] drm/i915/pvc: Define MOCS table for PVC
Message-ID: <20220502183948.2kjtwbqrixjbuc5j@ldmartin-desk2.jf.intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
 <20220502163417.2635462-4-matthew.d.roper@intel.com>
 <YnALz9E2cNkAVnK0@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YnALz9E2cNkAVnK0@mdroper-desk1.amr.corp.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 02, 2022 at 09:50:23AM -0700, Matt Roper wrote:
>On Mon, May 02, 2022 at 09:34:09AM -0700, Matt Roper wrote:
>> From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
>>
>> Bspec: 45101, 72161
>> Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/intel_gt_types.h    |  1 +
>>  drivers/gpu/drm/i915/gt/intel_mocs.c        | 24 ++++++++++++++++++++-
>>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 13 ++++++++---
>>  drivers/gpu/drm/i915/i915_drv.h             |  2 ++
>>  drivers/gpu/drm/i915/i915_pci.c             |  3 ++-
>>  drivers/gpu/drm/i915/intel_device_info.h    |  1 +
>>  6 files changed, 39 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> index b06611c1d4ad..7853ea194ea6 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> @@ -221,6 +221,7 @@ struct intel_gt {
>>
>>  	struct {
>>  		u8 uc_index;
>> +		u8 wb_index; /* Only for platforms listed in Bspec: 72161 */
>>  	} mocs;
>>
>>  	struct intel_pxp pxp;
>> diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
>> index c4c37585ae8c..265812589f87 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_mocs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
>> @@ -23,6 +23,7 @@ struct drm_i915_mocs_table {
>>  	unsigned int n_entries;
>>  	const struct drm_i915_mocs_entry *table;
>>  	u8 uc_index;
>> +	u8 wb_index; /* Only for platforms listed in Bspec: 72161 */
>>  	u8 unused_entries_index;
>>  };
>>
>> @@ -47,6 +48,7 @@ struct drm_i915_mocs_table {
>>
>>  /* Helper defines */
>>  #define GEN9_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
>> +#define PVC_NUM_MOCS_ENTRIES	3
>
>Should this be 4?  The value here should reflect the number of entries
>that can defined in hardware rather than the size of the table we're
>asked to program.  Since there are two registers (each with a high and a
>low entry), that would imply we should set 4 here to ensure that the
>fourth entry is initialized according to unused_entries_index rather
>than left at whatever the hardware defaults might be.

not sure I understand what you mean here. The n_entries specifies, as
you said, the number of entries we can have. Bspec 45101 shows entries
for indexes 0, 1 and 2. As does the pvc_mocs_table below.

Also, from bspec 44509:
"For PVC, only 3 MOCS states are supported. The allowed index values are
in range [0, 2]..."

So, I don't think we want to program any fourth entry.

Lucas De Marchi

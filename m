Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D6DAAE6C9
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 18:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A18610E065;
	Wed,  7 May 2025 16:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNWOlAMd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DA910E063;
 Wed,  7 May 2025 16:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746635650; x=1778171650;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mcUp8oyS+RnrIlNXQEQLu+JDcf/RStdptqZKs365a44=;
 b=DNWOlAMdewXpWEIAANgoqzoG3HlU+uekE0Ybf1eeEbYtU6mKlja5oe8C
 DufenSPfXcGAyk67M7/drjDthCA9ny2Ub6KlZ1xEqa9KsryL5CwZzkt+G
 ZTqayVekWNWdr6uBnrbb81we8baw/HvP7Q1MHrAS4ch5IBesyCg6lBns4
 ZkBIO6COPJsBJBgCA0dZ1FCPBYwzjDjlqyaGMUhTgeuw+kk6rCI/X82/Y
 PlVx+i+UPsvnRZ5+6pS7C90bKB6x/Q974R5rJZaEvVJ+Wm0ivHUieyVhD
 gq0uY91bXEO70k1LyRqjEm7w2q08ARWzagVayZQybGqUPZVBDdOZ7up6r A==;
X-CSE-ConnectionGUID: jAAMsNc+SX6fpwvTPFqPPw==
X-CSE-MsgGUID: dq67tteSSIW1Nh/IgefJIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48088794"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48088794"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:34:09 -0700
X-CSE-ConnectionGUID: pzRQPMceRyaFKaidSJzSzg==
X-CSE-MsgGUID: 9b1EBkBfRKqFPi4d+erHdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="135875596"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 07 May 2025 09:34:05 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3D1FB32EA9;
 Wed,  7 May 2025 17:34:03 +0100 (IST)
Message-ID: <c328fce4-761c-44d1-b9a3-0b20e6da7125@intel.com>
Date: Wed, 7 May 2025 18:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 2/5] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
To: Dafna Hirschfeld <dafna.hirschfeld@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, joonas.lahtinen@linux.intel.com,
 matthew.brost@intel.com, jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, michal.mrozek@intel.com,
 raag.jadav@intel.com, john.c.harrison@intel.com, ivan.briano@intel.com,
 matthew.auld@intel.com
References: <20250424204917.172708-1-jonathan.cavitt@intel.com>
 <20250424204917.172708-3-jonathan.cavitt@intel.com>
 <zqvdl3mu7q5vynymsbz7ax76sz2opyfhr4cwyp6vsi5yz4fl5w@jxxwcgbzoqhf>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <zqvdl3mu7q5vynymsbz7ax76sz2opyfhr4cwyp6vsi5yz4fl5w@jxxwcgbzoqhf>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29.04.2025 16:22, Dafna Hirschfeld wrote:
> On 24.04.2025 20:49, Jonathan Cavitt wrote:
>> Move the pagefault struct from xe_gt_pagefault.c to the
>> xe_gt_pagefault_types.h header file, and move the associated enum values
>> into the regs folder under xe_pagefault_desc.h
>>
>> Since xe_pagefault_desc.h is being initialized here, also move the
>> xe_guc_pagefault_desc hardware formats to the new file.
>>
>> v2:
>> - Normalize names for common header (Matt Brost)
>>
>> v3:
>> - s/Migrate/Move (Michal W)
>> - s/xe_pagefault/xe_gt_pagefault (Michal W)
>> - Create new header file, xe_gt_pagefault_types.h (Michal W)
>> - Add kernel docs (Michal W)
>>
>> v4:
>> - Fix includes usage (Michal W)
>> - Reference Bspec (Michal W)
>>
>> v5:
>> - Convert enums to defines in regs folder (Michal W)
>> - Move xe_guc_pagefault_desc to regs folder (Michal W)
>>
>> Bspec: 77412

maybe also mention 59654 here?

>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
>> Acked-by: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
>> ---
>> drivers/gpu/drm/xe/regs/xe_pagefault_desc.h | 49 +++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_gt_pagefault.c        | 43 ++++--------------
>> drivers/gpu/drm/xe/xe_gt_pagefault_types.h  | 42 ++++++++++++++++++
>> drivers/gpu/drm/xe/xe_guc_fwif.h            | 28 ------------
>> 4 files changed, 100 insertions(+), 62 deletions(-)
>> create mode 100644 drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
>> create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_pagefault_desc.h b/drivers/
>> gpu/drm/xe/regs/xe_pagefault_desc.h
>> new file mode 100644
>> index 000000000000..a169ac274e14
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
> 
> Maybe change the file name to xe_guc_pagefault_desc.h ,
> since this is currently guc specific.

IMO 'guc' tag is not applicable here

my understanding was that GuC sends data as it was read from the HW
regs, so the origin of the struct layout is HW, hence we put it in regs/
where we have all the HW defs, not in the abi/ folder which is for FW defs.

unless we want to make this struct part of the stable GuC pagefault ABI,
and then even if HW definition/layout would change, we will stick with
current layout. Then agree, we should move all this to abi/ and also
drop the Bspec reference as n/a

> 
> Also, the define 'PF_MSG_LEN_DW    4' relates to the
> length of this struct so should move here.

any G2H message related definitions should be in the abi/ GuC files, not
here in regs/ where we keep HW definitions.

and please don't start define name with "PF", use "GUC" instead

and btw, in many places by message length we assume also HXG header
length, so the actual length of the G2H 6002 message is 5 as it includes
1 DW of header with DATA0 and 4 DWs of payload with DATA1..4

#define GUC2HOST_NOTIFY_PAGE_FAULT_REQ_DESC_MSG_LEN \
	(GUC_HXG_REQUEST_MSG_MIN_LEN + 4u)

> 
> Thanks,
> Dafna
> 

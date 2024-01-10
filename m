Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD5F82980B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 11:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E216310E59C;
	Wed, 10 Jan 2024 10:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6896510E59C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 10:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704884021; x=1736420021;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=5BzcUIOx3hvINuHDPHKJehtnAdk+VPmkW6SVpw9rTBc=;
 b=RcwxP5qBtjiMCkN9xcqAMXmvyuvXcvzCtXF6AN1wMVFGu/ktizW5184A
 hOMUh2DULpxAaHGkOOxBhS/P1C4hlWPLtIduWLerDdzfwo5VMk9DfhM9h
 MHxNuZOUFRRpMZpYD7MmlI/pPa/NKXDhMhyau6HCcLXP0dlvq/q/KmFqA
 Y5T+UYmS/hfRB5tfrleieTiXPMI04YnfqBisS3pCxh43ubSTBPdZaupiL
 KOXLHx85lW03lxhGGSYUDWwJ1c9vmKnHl/WeIP1KKhvg4U//mcVzuALYR
 +fjEfBETVoNAuDqfKOoo5iBp6oCXoYfKP6PVy8oh+covfnx09awAHBwob g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="398172404"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="398172404"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 02:53:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="955326628"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="955326628"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.245.80.160])
 ([10.245.80.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 02:53:34 -0800
Message-ID: <275a7da0-6261-4aaa-b131-979495d2ddc2@linux.intel.com>
Date: Wed, 10 Jan 2024 11:53:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] accel/ivpu: Disable buffer sharing among VPU
 contexts
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
 <20240105112218.351265-9-jacek.lawrynowicz@linux.intel.com>
 <89018441-7994-9c78-e2a9-1fd9bc257375@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <89018441-7994-9c78-e2a9-1fd9bc257375@quicinc.com>
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

On 05.01.2024 17:46, Jeffrey Hugo wrote:
> On 1/5/2024 4:22 AM, Jacek Lawrynowicz wrote:
>> This was not supported properly. A buffer was imported to another VPU
>> context as a separate buffer object with duplicated sgt.
>> Both exported and imported buffers could be DMA mapped causing a double
>> mapping on the same device.
>>
>> Imported buffer from another VPU context will now have just reference
>> increased and there will be a single sgt fixing above problem but
>> buffers still can't be shared among VPU contexts because each context
>> have its own MMU mapping and ivpu_bo supports only single MMU mapping.
>>
>> The solution would be to use a mapping list as in panfrost or etnaviv
>> drivers and it will be implemented in future if required.
>>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_gem.c | 44 +++++------------------------------
>>   1 file changed, 6 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
>> index 4de454bfbf91..8cb4d337552e 100644
>> --- a/drivers/accel/ivpu/ivpu_gem.c
>> +++ b/drivers/accel/ivpu/ivpu_gem.c
>> @@ -222,6 +222,12 @@ static int ivpu_bo_open(struct drm_gem_object *obj, struct drm_file *file)
>>       struct ivpu_bo *bo = to_ivpu_bo(obj);
>>       struct ivpu_addr_range *range;
>>   +    if (bo->ctx) {
>> +        ivpu_warn(vdev, "Can't add BO (vpu_addr 0x%llx) to ctx %u: already in ctx %u\n",
>> +              bo->vpu_addr, file_priv->ctx.id, bo->ctx->id);
> 
> Looks like the vpu_addr is being used as a unique identifier for the BO.  Is that really the best value to use?  Seems like if I want to attack another context, knowing the device address of something that context owns would be useful information.

OK, I'll remove vpu_addr form the message.

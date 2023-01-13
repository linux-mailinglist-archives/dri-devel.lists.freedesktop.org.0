Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2163B669109
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728A110E038;
	Fri, 13 Jan 2023 08:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2621410E038
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673598789; x=1705134789;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GqQXcShQAs9q4QNJtlNIgO10i+JkYjX2I3+Dx7McTOg=;
 b=V+iYlAz2Za3TMPOSf9y9UV2eYvXxXc78rGIFzolApolBUaw5c5bN116f
 0UJ3gieVU9CNzgpv5cnxwCBASTtBxAVWl+kC4COWthePbOKLSBmv+Z3tB
 28J1zeUnOckPlyezrQfD8xao3WLQMV19GBOU4q4rEgUK+2XI9YPiAHaZe
 /JSWyZCk+bPu6tTbzYNBnmeQgNItAYFa0fI+XwycXVFUqOSvFC7eZuBc1
 WARnJ6IPm7ddLwcdGxqXcJnOrJXO4bo06YEGBV3XInODdd9PuY/RK+WN+
 uTEGeYMVB+G5Pti/KDP162RfodD1dupPCstxCjWTgnaSWG741R4O9TjUY g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="324007744"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="324007744"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 00:33:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="782080139"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="782080139"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.132.57])
 ([10.249.132.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 00:33:05 -0800
Message-ID: <602fef65-f531-476c-def6-6ec89f2f04b8@linux.intel.com>
Date: Fri, 13 Jan 2023 09:33:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 3/7] accel/ivpu: Add GEM buffer object management
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org,
 oded.gabbay@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de
References: <20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com>
 <20230109122344.253994-4-jacek.lawrynowicz@linux.intel.com>
 <bf47516e-861b-36f2-97a3-579c5fe30f67@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <bf47516e-861b-36f2-97a3-579c5fe30f67@quicinc.com>
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
Cc: andrzej.kacprowski@linux.intel.com, stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12.01.2023 18:52, Jeffrey Hugo wrote:
> On 1/9/2023 5:23 AM, Jacek Lawrynowicz wrote:
>> Adds four types of GEM-based BOs for the VPU:
>>    - shmem
>>    - userptr
>>    - internal
>>    - prime
>>
>> All types are implemented as struct ivpu_bo, based on
>> struct drm_gem_object. VPU address is allocated when buffer is created
>> except for imported prime buffers that allocate it in BO_INFO IOCTL due
>> to missing file_priv arg in gem_prime_import callback.
>> Internal buffers are pinned on creation, the rest of buffers types
>> can be pinned on demand (in SUBMIT IOCTL).
>> Buffer VPU address, allocated pages and mappings are released when the
>> buffer is destroyed.
>> Eviction mechism is planned for future versions.
> 
> mechism -> mechanism
> 
> Hopefully whomever applies this can fix it up inline and this doesn't require a new revision.
> 

It's fine, I'm planning to send v6 early next week anyway to fix some other stuff as well.

Regards,
Jacek


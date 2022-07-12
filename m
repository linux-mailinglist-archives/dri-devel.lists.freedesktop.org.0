Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D8E571C48
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 16:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DB094B14;
	Tue, 12 Jul 2022 14:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8233B94B20;
 Tue, 12 Jul 2022 14:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657635731; x=1689171731;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LoMioghV+nWquLuGyQGrSZFnMEkThiMZmXo0rtNNBY0=;
 b=SMCLnXEiRJVfUmfvT965/DOYGhUd/p/smli7P/5lk+gBLjoXmer2qraH
 wWgb9x9H1vAeIIlsTRDHZxU6qlubacUfwXL8OT3UzDP4tWZ4YGUbj8d6v
 iModZuywPsnWpt+NJXo8q0cyIi+8y+AfD23DrJ42s5XpjUXXSSaN3bcGg
 siX3kXOu7gctBH6Qtkbv+WPoVOkItShCvqqNMqLoltYQjgheJbTJsd40A
 Rx6B3hYQAoW/iejkareHCo/jfFpb8ED4uJBw8YZfUw5ulOqIbfutA8jVP
 +jqb0Ez21pW0w4yzvKh+i5sv6yZAYPsgk873XdBIMpopQvKlHh+XHdczY g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="346628839"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="346628839"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 07:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="922219730"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 12 Jul 2022 07:22:08 -0700
Received: from [10.249.147.246] (unknown [10.249.147.246])
 by linux.intel.com (Postfix) with ESMTP id 7794C580890;
 Tue, 12 Jul 2022 07:22:04 -0700 (PDT)
Message-ID: <ea892ffc-4a03-7772-6d99-85a356a3738b@intel.com>
Date: Tue, 12 Jul 2022 17:22:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] drm/syncobj: Fix sync syncobj issue
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 jie1zhan <jesse.zhang@amd.com>, broonie@kernel.org,
 dri-devel-bounces@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220707102953.769684-1-jesse.zhang@amd.com>
 <22a21338-305d-bdf7-0079-df67fb030fc7@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <22a21338-305d-bdf7-0079-df67fb030fc7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 David Airlie <airlied@linux.ie>, Basavaraj.Hiregoudar@amd.com,
 lucas.demarchi@intel.com, open list <linux-kernel@vger.kernel.org>,
 nirmoy.das@linux.intel.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Vijendar.Mukunda@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'll let Lucas comment. I've only looked a little at it.
 From what I remember just enabling sw_signaling was enough to fix the 
issue.

-Lionel

On 12/07/2022 13:26, Christian König wrote:
> Ping to the Intel guys here. Especially Lucas/Nirmoy/Lionel.
>
> IIRC you stumbled over that problem as well, have you found any solution?
>
> Regards,
> Christian.
>
> Am 07.07.22 um 12:29 schrieb jie1zhan:
>> enable signaling after flatten dma_fence_chains on transfer
>>
>> Signed-off-by: jie1zhan <jesse.zhang@amd.com>
>> ---
>>   drivers/gpu/drm/drm_syncobj.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/drm_syncobj.c 
>> b/drivers/gpu/drm/drm_syncobj.c
>> index 7e48dcd1bee4..0d9d3577325f 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -920,6 +920,7 @@ static int 
>> drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>>       if (ret)
>>           goto err_free_fence;
>>   +    dma_fence_enable_sw_signaling(fence);
>>       chain = dma_fence_chain_alloc();
>>       if (!chain) {
>>           ret = -ENOMEM;
>


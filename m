Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF0B573164
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347FD12AC0F;
	Wed, 13 Jul 2022 08:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077C512AA72;
 Wed, 13 Jul 2022 08:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657701772; x=1689237772;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yU5zgyQcalCKx3f1uNTpJxvReddjKxaKURPv3zJdOtY=;
 b=T13t3adV2+iqLo0MxtsM8QpLUujv/H7h45zlA2xWwvVPcWA8QADyWZlP
 eTkbKjiKSPWkZW318JWIaaH1qqmq0UO1WixBrp1IcKTV1ViMcbJmB4ITk
 ZCzxazdbVIC55tjAd4lr0x3wOohMdryww7BOC5KjOwTwJX/tc68QNaHdG
 Gxe0ZHoaRvq6yAkaAQasqpDYdDVlM5f4Q21AjVTP/yVO7zt0zUIHDTnsq
 IUsm+zQi6xGbDgnKItDMrf3Y6vwfXVgp8ZhP9786KXsAxiBUUb1vvzjQ7
 0mu71hNQyOvSEnn4JjbOMPeD+xS9bmzrbhlDRO9eyLrExJtsYkQq1xdxz A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="265563552"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="265563552"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 01:42:51 -0700
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="685083290"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.18.234])
 ([10.252.18.234])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 01:42:47 -0700
Message-ID: <43192086-b9a6-387c-4a29-ea28aa65a3b4@linux.intel.com>
Date: Wed, 13 Jul 2022 10:42:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/syncobj: Fix sync syncobj issue
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 jie1zhan <jesse.zhang@amd.com>, broonie@kernel.org,
 dri-devel-bounces@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220707102953.769684-1-jesse.zhang@amd.com>
 <22a21338-305d-bdf7-0079-df67fb030fc7@amd.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
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
 lionel.g.landwerlin@intel.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Vijendar.Mukunda@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 7/12/2022 12:26 PM, Christian König wrote:
> Ping to the Intel guys here. Especially Lucas/Nirmoy/Lionel.
>
> IIRC you stumbled over that problem as well, have you found any solution?

I might be wrong but  I think you are talking about 
igt@syncobj_timeline@transfer-timeline-point testcase which seems to be

green in CI now 
https://intel-gfx-ci.01.org/tree/drm-tip/igt@syncobj_timeline@transfer-timeline-point.html

Lucas found out that the issues got fixed after ec8d985ff26f ("drm: use 
dma_fence_unwrap_merge() in drm_syncobj")


Regards,

Nirmoy

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

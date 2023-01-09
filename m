Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCF46624FF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 13:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E3610E3F5;
	Mon,  9 Jan 2023 12:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EEA10E3F5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 12:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673265983; x=1704801983;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5lFGoMTVRdHfa0UBdk60EqcOkXwDK8Rh6hSePWt1co4=;
 b=EWCvIBlzpoUjU18RySNpKuAnIBu8abgoOCQcympT0FDUbvz/j+zFLR09
 4G2Cg0J3hBJg3goeQC/wk5JiusM24E/evsDzjii5PpqhTtfdR2/a5NWxI
 OKTT1rV7V3A0U2HMeKhaCbMqMNFqwNghhO65CjJ/fe+hHlMfSZ4fF9y+Q
 9jnYZZ0XHX1CizWojthLmqQ7YFB/PCfCbgyJUm9bu6IkwP4inoz6EapGW
 4rqlkS7VlaR/RmLzpZXmtgIdG/B1Yr+cGab/h3tnpEvpuHuF9ofFwPZ6H
 7gIwOGw5iWzb5JHJKp81X8p5pfK7lwqzNxRlV9w58cOwpNg2j0l0Rcpc7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="303219899"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="303219899"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 04:06:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="606589344"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="606589344"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.157.189])
 ([10.249.157.189])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 04:06:20 -0800
Message-ID: <7b29f0b7-9a16-2460-3096-46b7ae977eed@linux.intel.com>
Date: Mon, 9 Jan 2023 13:06:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 3/7] accel/ivpu: Add GEM buffer object management
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Oded Gabbay <oded.gabbay@gmail.com>
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-4-jacek.lawrynowicz@linux.intel.com>
 <Y7f83SKldf9uaTi3@phenom.ffwll.local>
 <20230106132255.GD1586324@linux.intel.com>
 <CAKMK7uG8Qudy2Cf5zZ5CLwQd1+J5M3MyiNhKGuNrGbZNz4Bs4A@mail.gmail.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CAKMK7uG8Qudy2Cf5zZ5CLwQd1+J5M3MyiNhKGuNrGbZNz4Bs4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: andrzej.kacprowski@linux.intel.com, quic_jhugo@quicinc.com,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 06.01.2023 19:25, Daniel Vetter wrote:
> On Fri, 6 Jan 2023 at 14:23, Stanislaw Gruszka
> <stanislaw.gruszka@linux.intel.com> wrote:
>>
>> On Fri, Jan 06, 2023 at 11:50:05AM +0100, Daniel Vetter wrote:
>>> On Thu, Dec 08, 2022 at 12:07:29PM +0100, Jacek Lawrynowicz wrote:
>>>> Adds four types of GEM-based BOs for the VPU:
>>>>   - shmem
>>>>   - userptr
>>>>   - internal
>>>
>>> Uh what do you need this for? Usually the way we do these is just alloce a
>>> normal bo, and then pin them.
>>
>> I think we do alloc/pin this way, but all our bo's are GEM based.
>> For those bo's we use internally and other non-shmem we create them
>> with drm_gem_private_object_init(). I think this way is simpler than
>> have separate code for non-GEM and GEM bo's ...
> 
> They should be all gem bo, I guess you mean shmem vs non-shmem? And
> the allocate+pin is the standard approach for drivers that have
> somewhat dynamic bo (i.e. not using dma_alloc) and need some of them
> (hopefully only for driver internal objects, not for userspace) pinned
> in place. So you handrolling a perma-pinned gem bo for internal
> objects is rather strange by drm driver standards.
> 
>>> Also, gem shmem helpers should be able to mostly cover you here, why not
>>> use those? Might need some work to push basic userptr to them, but we have
>>> enough drivers reinventing that wheel to justify that work.
>>>
>>> Can I guess also be done after merging.
>>
>> ... but if not, we can add this to TODO.
> 
> Yeah I'm fine with todo to cut these over to shmem helpers, this
> driver has been stuck in limbo for way too long anyway.

Yeah, I think it would be easier for everyone if this driver was merged.
Especially for me :)
I feel like I'm shifting tons of coal every time I need to update it.
But also from the reviewer perspective it would be easier to track changes
between driver revisions if only delta was posted instead of the whole 8K lines of code.

Guys, please make my day and merge it to 6.3.

Regards,
Jacek


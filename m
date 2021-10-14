Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C4242D3A4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 09:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7066EC20;
	Thu, 14 Oct 2021 07:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F626EC1E;
 Thu, 14 Oct 2021 07:29:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="227578244"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="227578244"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 00:29:59 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="442631628"
Received: from lapeders-mobl.ger.corp.intel.com (HELO [10.249.254.221])
 ([10.249.254.221])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 00:29:57 -0700
Message-ID: <cae33057-8218-6746-2d82-e8fda1e5d14d@linux.intel.com>
Date: Thu, 14 Oct 2021 09:29:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/6] drm/i915: Failsafe migration blits
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20211008133530.664509-1-thomas.hellstrom@linux.intel.com>
 <CAPM=9tzt3wr5=ZdDGqH6TTOpKqp_-Wbxw+LBMK=f3Nm=og_14Q@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <CAPM=9tzt3wr5=ZdDGqH6TTOpKqp_-Wbxw+LBMK=f3Nm=og_14Q@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave,

On 10/14/21 03:50, Dave Airlie wrote:
> On Fri, 8 Oct 2021 at 23:36, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> This patch series introduces failsafe migration blits.
>> The reason for this seemingly strange concept is that if the initial
>> clearing or readback of LMEM fails for some reason, and we then set up
>> either GPU- or CPU ptes to the allocated LMEM, we can expose old
>> contents from other clients.
> Can we enumerate "for some reason" here?
>
> This feels like "security" with no defined threat model. Maybe if the
> cover letter contains more details on the threat model it would make
> more sense.

TBH, I'd be quite happy if we could find a way to skip this series (or 
even a reworked version) completely.

Assuming that the migration request setup code is bug-free enough to not 
never cause an engine reset, there are at least two ways I can see the 
migration fail:

1) The migration fence we will be depending on when fully async 
(ttm->moving) may signal with error after the following:
malicious_batchbuffer_causing_reset -> async eviction -> allocation -> 
async clearing

2) malicious_batchbuffers_causing_gt_wedge submitted to copy engine -> 
migration_blit submitted to  copy_engine. If wedging the gt, the 
migration blit will never be executed, fence->error will end up with 
-EIO but TTM will happily fault the pages to user-space.

Now we had other versions around looking at the ttm_bo->moving errors at 
vma binding and cpu faulting, but this was the direction chosen after 
discussions with our arch team. Either way we'd probably want to block 
the error propagation after async_eviction.

I can of course add 1) and 2) above to the cover-letter, but if you have 
any additional input on the best way to handle this, that'd be appreciated.

Thanks,

Thomas





> Dave.

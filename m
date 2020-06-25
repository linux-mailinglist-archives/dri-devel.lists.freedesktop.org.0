Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB56209FB3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 15:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB4F6E1EE;
	Thu, 25 Jun 2020 13:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC626E1B9;
 Thu, 25 Jun 2020 13:23:28 +0000 (UTC)
IronPort-SDR: 0eYm+A90jFXafHK1SIexs3GSxmh13Dv2DvHIZkNpfpfcIM7bAhisLZx9BjeGcSN/uOB4m3WGaC
 HYdiBTJ9HiSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="209990372"
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="209990372"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 06:23:28 -0700
IronPort-SDR: mWEGvML3jEQqPLMelPh2EfBTjv1fT6AMQsZTNt9y/46FEmSMPnFGUejTB3T8hB/to1NiHIrve0
 Mt3aQevFIsPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="479473571"
Received: from schiml-mobl3.ger.corp.intel.com (HELO [10.249.41.48])
 ([10.249.41.48])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jun 2020 06:23:26 -0700
Subject: Re: [Intel-gfx] [PATCH 2/2] dma-buf: fix dma-fence-chain out of order
 test
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
References: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
 <20200625123443.19680-2-lionel.g.landwerlin@intel.com>
 <159309113252.4527.2883585204850736358@build.alporthouse.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <c6f72d4d-c8a0-c484-7c31-761e9c37b85e@intel.com>
Date: Thu, 25 Jun 2020 16:23:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <159309113252.4527.2883585204850736358@build.alporthouse.com>
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org, christian.koenig@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/06/2020 16:18, Chris Wilson wrote:
> Quoting Lionel Landwerlin (2020-06-25 13:34:43)
>> There was probably a misunderstand on how the dma-fence-chain is
>> supposed to work or what dma_fence_chain_find_seqno() is supposed to
>> return.
>>
>> dma_fence_chain_find_seqno() is here to give us the fence to wait upon
>> for a particular point in the timeline. The timeline progresses only
>> when all the points prior to a given number have completed.
> Hmm, the question was what point is it supposed to wait for.
>
> For the simple chain of [1, 3], does 1 being signaled imply that all
> points up to 3 are signaled, or does 3 not being signaled imply that all
> points after 1 are not. If that's mentioned already somewhere, my bad.
> If not, could you put the answer somewhere.
> -Chris

In [1, 3], if 1 is signaled, the timeline value is 1. And find_seqno(2) 
should return NULL.


In the out_of_order selftest the chain was [1, 2, 3], 2 was signaled and 
the test was expecting no fence to be returned by find_seqno(2).

But we still have to wait on 1 to complete before find_seqno(2) can 
return NULL (as in you don't have to wait on anything).


Hope that answer the question.


-Lionel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

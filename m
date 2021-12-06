Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56896469B51
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 16:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADBD73B0D;
	Mon,  6 Dec 2021 15:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E68073B0D;
 Mon,  6 Dec 2021 15:13:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10189"; a="237144345"
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; d="scan'208";a="237144345"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 07:13:34 -0800
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; d="scan'208";a="460859985"
Received: from bgodonne-mobl1.amr.corp.intel.com (HELO [10.252.17.226])
 ([10.252.17.226])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 07:13:33 -0800
Message-ID: <bf98883a-e774-ea5f-99a9-d0bb9520e06d@intel.com>
Date: Mon, 6 Dec 2021 15:13:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 0/8] DG2 accelerated migration/clearing support
Content-Language: en-GB
To: Daniel Stone <daniel@fooishbar.org>
References: <20211206133140.3166205-1-matthew.auld@intel.com>
 <CAPj87rOuZpEcHoO-4nJ-ndvfR32FE82iFfJFV2kUZ=u-PtPvwg@mail.gmail.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <CAPj87rOuZpEcHoO-4nJ-ndvfR32FE82iFfJFV2kUZ=u-PtPvwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/12/2021 14:49, Daniel Stone wrote:
> Hi Matthew,
> 
> On Mon, 6 Dec 2021 at 13:32, Matthew Auld <matthew.auld@intel.com> wrote:
>> Enable accelerated moves and clearing on DG2. On such HW we have minimum page
>> size restrictions when accessing LMEM from the GTT, where we now have to use 64K
>> GTT pages or larger. With the ppGTT the page-table also has a slightly different
>> layout from past generations when using the 64K GTT mode(which is still enabled
>> on via some PDE bit), where it is now compacted down to 32 qword entries. Note
>> that on discrete the paging structures must also be placed in LMEM, and we need
>> to able to modify them via the GTT itself(see patch 7), which is one of the
>> complications here.
>>
>> The series needs to be applied on top of the DG2 enabling branch:
>> https://cgit.freedesktop.org/~ramaling/linux/log/?h=dg2_enabling_ww49.3
> 
> What are the changes to the v1/v2?

Yeah, I should have added that somewhere. Sorry.

v2: Add missing cover letter
v3:
- Add some r-b tags
- Drop the GTT_MAPPABLE approach. We can instead simply pass along the 
required size/alignment using alloc_pt().

> 
> Cheers,
> Daniel
> 

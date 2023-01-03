Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA56765BFCA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 13:21:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDA810E1FD;
	Tue,  3 Jan 2023 12:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191D210E15B;
 Tue,  3 Jan 2023 12:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672748472; x=1704284472;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=KmEeBB6ogEn4O+bmDHObjHdGkcyXpgi7TRjPctoOmoc=;
 b=AKPy9rf4rPKGAbs0+yUgiDZXO1m6b/SLhpAV+yyyQ3CGYRfZd+mqAHJI
 Kwbczvl7hi5PmkoHvbSNqNG6qdIoHTXa04gKRkeVcI//feCy4AJQTOnET
 gPkVgM/RC39CLrFSdB5WL8NshB1zaLrWzEmA1sgdRJK+1HyqO/7F6M/Mp
 1x/UrjNN9xta5/TTALHfwXr/ld9gKxzi6XjRX4vTVGMy36L+CC6eSWro3
 yKoh4OA6E9LVJMeGWX/yGTDolgKugVB6AHCIszXeOnypHArHsXpZ+HCxV
 mv4gIun1rjMNU1o0cxfuP/XINqAs7/V1hj1IL0xYiJPyeEZ53LHLHY1SA A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="322880623"
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; d="scan'208";a="322880623"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2023 04:21:11 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="778839135"
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; d="scan'208";a="778839135"
Received: from adorney-mobl.ger.corp.intel.com (HELO [10.213.222.30])
 ([10.213.222.30])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2023 04:21:10 -0800
Message-ID: <cd0e2491-92d4-58df-628b-985768472157@linux.intel.com>
Date: Tue, 3 Jan 2023 12:21:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [Intel-gfx] [RFC PATCH 00/20] Initial Xe driver submission
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20221222222127.34560-1-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/12/2022 22:21, Matthew Brost wrote:
> Hello,
> 
> This is a submission for Xe, a new driver for Intel GPUs that supports both
> integrated and discrete platforms starting with Tiger Lake (first platform with
> Intel Xe Architecture). The intention of this new driver is to have a fresh base
> to work from that is unencumbered by older platforms, whilst also taking the
> opportunity to rearchitect our driver to increase sharing across the drm
> subsystem, both leveraging and allowing us to contribute more towards other
> shared components like TTM and drm/scheduler. The memory model is based on VM
> bind which is similar to the i915 implementation. Likewise the execbuf
> implementation for Xe is very similar to execbuf3 in the i915 [1].
> 
> The code is at a stage where it is already functional and has experimental
> support for multiple platforms starting from Tiger Lake, with initial support
> implemented in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), as well
> as in NEO (for OpenCL and Level0). A Mesa MR has been posted [2] and NEO
> implementation will be released publicly early next year. We also have a suite
> of IGTs for XE that will appear on the IGT list shortly.
> 
> It has been built with the assumption of supporting multiple architectures from
> the get-go, right now with tests running both on X86 and ARM hosts. And we
> intend to continue working on it and improving on it as part of the kernel
> community upstream.
> 
> The new Xe driver leverages a lot from i915 and work on i915 continues as we
> ready Xe for production throughout 2023.
> 
> As for display, the intent is to share the display code with the i915 driver so
> that there is maximum reuse there. Currently this is being done by compiling the
> display code twice, but alternatives to that are under consideration and we want
> to have more discussion on what the best final solution will look like over the
> next few months. Right now, work is ongoing in refactoring the display codebase
> to remove as much as possible any unnecessary dependencies on i915 specific data
> structures there..
> 
> We currently have 2 submission backends, execlists and GuC. The execlist is
> meant mostly for testing and is not fully functional while GuC backend is fully
> functional. As with the i915 and GuC submission, in Xe the GuC firmware is
> required and should be placed in /lib/firmware/xe.

What is the plan going forward for the execlists backend? I think it 
would be preferable to not upstream something semi-functional and so to 
carry technical debt in the brand new code base, from the very start. If 
it is for Tigerlake, which is the starting platform for Xe, could it be 
made GuC only Tigerlake for instance?

Regards,

Tvrtko

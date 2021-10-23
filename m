Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B2C438491
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 19:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903626E094;
	Sat, 23 Oct 2021 17:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643986E094;
 Sat, 23 Oct 2021 17:46:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10146"; a="216376237"
X-IronPort-AV: E=Sophos;i="5.87,175,1631602800"; d="scan'208";a="216376237"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2021 10:46:51 -0700
X-IronPort-AV: E=Sophos;i="5.87,175,1631602800"; d="scan'208";a="485077395"
Received: from morelmal-mobl1.ger.corp.intel.com (HELO [10.249.254.110])
 ([10.249.254.110])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2021 10:46:50 -0700
Message-ID: <42cb2c7c-ce69-1cae-6e0c-a1f2b3cd5a67@linux.intel.com>
Date: Sat, 23 Oct 2021 19:46:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] drm/i915/selftests: Allow engine reset failure to do a GT
 reset in hangcheck selftest
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211011234705.30853-1-matthew.brost@intel.com>
 <f8f1ae021e8cabc2c6d76996b5e74912cb0913db.camel@linux.intel.com>
 <20211021203747.GA27209@jons-linux-dev-box>
 <ee989711-779e-874f-6737-ab9288557d1a@linux.intel.com>
 <20211022170356.GA23182@jons-linux-dev-box>
 <070ab480-6306-653c-514a-6648ac495253@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <070ab480-6306-653c-514a-6648ac495253@intel.com>
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


On 10/22/21 20:09, John Harrison wrote:
> And to be clear, the engine reset is not supposed to fail. Whether 
> issued by GuC or i915, the GDRST register is supposed to self clear 
> according to the bspec. If we are being sent the G2H notification for 
> an engine reset failure then the assumption is that the hardware is 
> broken. This is not a situation that is ever intended to occur in a 
> production system. Therefore, it is not something we should spend huge 
> amounts of effort on making a perfect selftest for.

I don't agree. Selftests are there to verify that assumptions made and 
contracts in the code hold and that hardware behaves as intended / 
assumed. No selftest should ideally trigger in a production driver / 
system. That doesn't mean we can remove all selftests or ignore updating 
them for altered assumptions / contracts. I think it's important here to 
acknowledge the fact that this and the perf selftest have found two 
problems that need consideration for fixing for a production system.

>
> The current theory is that the timeout in GuC is not quite long enough 
> for DG1. Given that the bspec does not specify any kind of timeout, it 
> is only a best guess anyway! Once that has been tuned correctly, we 
> should never hit this case again. Not ever, Not in a selftest, not in 
> an end user use case, just not ever.

..until we introduce new hardware for which the tuning doesn't hold 
anymore or somebody in a two years wants to lower the timeout wondering 
why it was set so long?

/Thomas



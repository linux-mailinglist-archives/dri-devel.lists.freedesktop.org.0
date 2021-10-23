Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A77F04384B7
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 20:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CE96E0F1;
	Sat, 23 Oct 2021 18:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499456E092;
 Sat, 23 Oct 2021 18:36:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10146"; a="228229461"
X-IronPort-AV: E=Sophos;i="5.87,176,1631602800"; d="scan'208";a="228229461"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2021 11:36:51 -0700
X-IronPort-AV: E=Sophos;i="5.87,176,1631602800"; d="scan'208";a="485085192"
Received: from morelmal-mobl1.ger.corp.intel.com (HELO [10.249.254.110])
 ([10.249.254.110])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2021 11:36:49 -0700
Message-ID: <933e9a65-6a17-eba9-0645-8d9ad07be51a@linux.intel.com>
Date: Sat, 23 Oct 2021 20:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] drm/i915/selftests: Allow engine reset failure to do a GT
 reset in hangcheck selftest
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211011234705.30853-1-matthew.brost@intel.com>
 <f8f1ae021e8cabc2c6d76996b5e74912cb0913db.camel@linux.intel.com>
 <20211021203747.GA27209@jons-linux-dev-box>
 <ee989711-779e-874f-6737-ab9288557d1a@linux.intel.com>
 <20211022170356.GA23182@jons-linux-dev-box>
 <070ab480-6306-653c-514a-6648ac495253@intel.com>
 <42cb2c7c-ce69-1cae-6e0c-a1f2b3cd5a67@linux.intel.com>
 <20211023181838.GA35211@jons-linux-dev-box>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211023181838.GA35211@jons-linux-dev-box>
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


On 10/23/21 20:18, Matthew Brost wrote:
> On Sat, Oct 23, 2021 at 07:46:48PM +0200, Thomas Hellström wrote:
>> On 10/22/21 20:09, John Harrison wrote:
>>> And to be clear, the engine reset is not supposed to fail. Whether
>>> issued by GuC or i915, the GDRST register is supposed to self clear
>>> according to the bspec. If we are being sent the G2H notification for an
>>> engine reset failure then the assumption is that the hardware is broken.
>>> This is not a situation that is ever intended to occur in a production
>>> system. Therefore, it is not something we should spend huge amounts of
>>> effort on making a perfect selftest for.
>> I don't agree. Selftests are there to verify that assumptions made and
>> contracts in the code hold and that hardware behaves as intended / assumed.
>> No selftest should ideally trigger in a production driver / system. That
>> doesn't mean we can remove all selftests or ignore updating them for altered
>> assumptions / contracts. I think it's important here to acknowledge the fact
>> that this and the perf selftest have found two problems that need
>> consideration for fixing for a production system.
>>
> I'm confused - we are going down the rabbit hole here.
>
> Back to this patch. This test was written for very specific execlists
> behavior. It was updated to also support the GuC. In that update we
> missed fixing the failure path, well because it always passed. Now it
> has failed, we see that it doesn't fail gracefully, and takes down the
> machine. This patch fixes that. It also openned my eyes to the horror
> show reset locking that needs to be fixed long term.

Well the email above wasn't really about the correctness of this 
particular patch (I should probably have altered the subject to reflect 
that) but rather about the assumption that failures that should never 
occur in a production system are not worth spending time on selftests for.

For the patch itself, I'll take a deeper look at the patch and get back.

/Thomas



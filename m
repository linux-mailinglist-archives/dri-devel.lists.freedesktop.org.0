Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 108515781FA
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 14:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321C518B11F;
	Mon, 18 Jul 2022 12:15:56 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A092318AF54;
 Mon, 18 Jul 2022 12:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658146554; x=1689682554;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1owmYBRo5gdx05iMYsHTim4Nr/X4OnG/OARed9RqP94=;
 b=jbujzVGf0POSKf6RIyf2p1fa7idf27xH2xprWwq3HXoJjQXfd6Owp5lh
 oowLoeXVCp03QOwRn+Vd9TS+GVd/CAvEci7nAURyFwHBruOyWphzwZ5cx
 K3dOD5CujYyDaU/RORlt7LLX+oWlqvik4CA8T6jI0Rk23Lssw90O4w9HW
 VkmbV5xI7QTkhqQp6yAGVEdSfs0ZBDr7Ap+uYIqS41APRt4XxdQqEobKv
 /Kfgxt433qsr0JKAh6xhTVP/t1ms+Gw7ib4+cCclBt2h0Xqj2+oL6FGmm
 V98luxxjwlblureYbD+g2muORinimmr55IQ37urSKm4s3CWQ0tHUaMN3c A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="286946053"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="286946053"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 05:15:54 -0700
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="723839142"
Received: from smyint-mobl1.amr.corp.intel.com (HELO [10.212.107.15])
 ([10.212.107.15])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 05:15:53 -0700
Message-ID: <d1cfac14-4c01-ce53-586f-01f8998bbab4@linux.intel.com>
Date: Mon, 18 Jul 2022 13:15:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH 01/12] drm/i915: Remove bogus GEM_BUG_ON in
 unpark
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-2-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220712233136.1044951-2-John.C.Harrison@Intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 13/07/2022 00:31, John.C.Harrison@Intel.com wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> Remove bogus GEM_BUG_ON which compared kernel context timeline seqno to
> seqno in memory on engine PM unpark. If a GT reset occurred these values
> might not match as a kernel context could be skipped. This bug was
> hidden by always switching to a kernel context on park (execlists
> requirement).

Reset of the kernel context? Under which circumstances does that happen?

It is unclear if the claim is this to be a general problem or the assert 
is only invalid with the GuC. Lack of a CI reported issue suggests it is 
not a generic problem?

Regards,

Tvrtko

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_pm.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> index b0a4a2dbe3ee9..fb3e1599d04ec 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> @@ -68,8 +68,6 @@ static int __engine_unpark(struct intel_wakeref *wf)
>   			 ce->timeline->seqno,
>   			 READ_ONCE(*ce->timeline->hwsp_seqno),
>   			 ce->ring->emit);
> -		GEM_BUG_ON(ce->timeline->seqno !=
> -			   READ_ONCE(*ce->timeline->hwsp_seqno));
>   	}
>   
>   	if (engine->unpark)

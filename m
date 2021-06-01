Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E5638E7F8
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 15:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BAE6E81D;
	Mon, 24 May 2021 13:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1126E811;
 Mon, 24 May 2021 13:45:35 +0000 (UTC)
IronPort-SDR: Led7OWL6BjpnfOtZupzRpdUn2k0tA9tDG3n7FTW8CuA8s20rPJFdPDI0pRK7tXQFSjrtBD6B0t
 oUEfb55elXeg==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="263146740"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="263146740"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 06:45:33 -0700
IronPort-SDR: v0i494EOs/8XIzke9IFSlf5xkJPSPdqtANs2NlefI21d8uJVFwh/DO0hCgitCewVUkHvu/Em7T
 Gz+6kb3y4Bdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="396954061"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga006.jf.intel.com with ESMTP; 24 May 2021 06:45:31 -0700
Received: from [10.249.134.123] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.134.123])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 14ODjUmn023603; Mon, 24 May 2021 14:45:30 +0100
Subject: Re: [RFC PATCH 40/97] drm/i915/guc: Module load failure test for CT
 buffer creation
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-41-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ddc957f2-f3a6-7fd4-e8f7-f2ed5fc97f1c@intel.com>
Date: Mon, 24 May 2021 15:45:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210506191451.77768-41-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: tvrtko.ursulin@intel.com, jason.ekstrand@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 06.05.2021 21:13, Matthew Brost wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Add several module failure load inject points in the CT buffer creation
> code path.
> 
> Signed-off-by: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index d6895d29ed2d..586e6efc3558 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -177,6 +177,10 @@ static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
>  {
>  	int err;
>  
> +	err = i915_inject_probe_error(guc_to_gt(ct_to_guc(ct))->i915, -ENXIO);
> +	if (unlikely(err))
> +		return err;
> +
>  	err = guc_action_register_ct_buffer(ct_to_guc(ct), type,
>  					    desc_addr, buff_addr, size);
>  	if (unlikely(err))
> @@ -228,6 +232,10 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
>  	u32 *cmds;
>  	int err;
>  
> +	err = i915_inject_probe_error(guc_to_gt(guc)->i915, -ENXIO);
> +	if (err)
> +		return err;
> +
>  	GEM_BUG_ON(ct->vma);
>  
>  	blob_size = 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE + CTB_G2H_BUFFER_SIZE;
> 

likely could be introduced earlier, maybe right after patch 5/97

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

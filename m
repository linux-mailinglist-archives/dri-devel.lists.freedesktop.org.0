Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 780C648D453
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 10:21:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741F010E9E3;
	Thu, 13 Jan 2022 09:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FDC10E9E3;
 Thu, 13 Jan 2022 09:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642065681; x=1673601681;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kJXpkD0TqGstWjsq8Z/m8Tr6Aqf885r5vhHL1qEhWr4=;
 b=KjkzXh5hmBv52PLnwlztZyHpCcmXgCVtjInEJtdJNv/yMpLNr3pCzmkx
 Yq5tlH26qyWg5LH3h1WgkaLjJNGFsJID7zDufqKP3uCN1uQM++DWGl0WF
 Ki6jMwgDKKTJxzP2aKn8CabVy5uW13ozKRUWJ3BPWLuh0tNqapNaj8LVO
 8hedctvlEW1Y303JLw0NHa6BMidjJmzudm7xCAh2Cr4d5mq2FdPRfUdTO
 xW2+rxvDwVcjNuAJsNiACimO9zg+vClZ4eIAk6SKByWgpD0CLIsnsPMd5
 Ojh91lhK3OVUavt1THX7qG/82cIq53N702F7ypRcVRQD5Ng6s3/poONb2 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="304705306"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="304705306"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 01:21:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="529590256"
Received: from joneil3-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.0.221])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 01:21:17 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH][RESEND] i915: make array flex_regs static const
In-Reply-To: <20220112223435.949071-1-colin.i.king@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220112223435.949071-1-colin.i.king@gmail.com>
Date: Thu, 13 Jan 2022 11:21:15 +0200
Message-ID: <87h7a86lf8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Jan 2022, Colin Ian King <colin.i.king@gmail.com> wrote:
> Don't populate the read-only array flex_regs on the stack but
> instead it static const. Also makes the object code a little smaller.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>
> ---
>
> RESEND: Use correct e-mail address for sign-off and From: in e-mail.

There are a number of things at play here:

- Our tooling checks for certain things, such as author/signed-off-by
  match, after applying the patch.

- You have an entry in the kernel git .mailmap.

- The git log.mailmap config default has changed from false to true.

We apply the patch, and, with the default options, git show will display
a different author than the signed-off-by.

We should use --no-use-mailmap when examining a commit to ensure the
commit is internally consistent, regardless of .mailmap.


BR,
Jani.


>
> ---
>  drivers/gpu/drm/i915/i915_perf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index e27f3b7cf094..df698960fdc0 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -2114,7 +2114,7 @@ gen8_update_reg_state_unlocked(const struct intel_context *ce,
>  	u32 ctx_oactxctrl = stream->perf->ctx_oactxctrl_offset;
>  	u32 ctx_flexeu0 = stream->perf->ctx_flexeu0_offset;
>  	/* The MMIO offsets for Flex EU registers aren't contiguous */
> -	i915_reg_t flex_regs[] = {
> +	static const i915_reg_t flex_regs[] = {
>  		EU_PERF_CNTL0,
>  		EU_PERF_CNTL1,
>  		EU_PERF_CNTL2,

-- 
Jani Nikula, Intel Open Source Graphics Center

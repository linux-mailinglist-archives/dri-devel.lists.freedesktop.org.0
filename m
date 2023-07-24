Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D731675EEB6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 11:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B7E10E294;
	Mon, 24 Jul 2023 09:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C777310E294;
 Mon, 24 Jul 2023 09:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690189680; x=1721725680;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=I58K0v9UqhRQ1cf0m06D7w6DlOunW6JSlGn5MyOsU2w=;
 b=VfxRGl8BPoi9Tg06GbFjcmBJhQa5x3OfDcfhWhwC/UOdo03d63NTmdWZ
 MEqmBHzaqXrWBstNX0X9VdBSMyEP9379l4RyHsO9482iO7MG+FvTTrrEu
 0HMQzBjlo6z3lDl35TEAoT6/JX+SsUywHjixtnAkLtJkbDix1q4eZpV4r
 05kTxyGifDNj+VcP5KOrsUvioYTWkdBn1HnBTI8UD855dxWfVHm2L6Sbd
 4lPL2vGDIv2LCUaE/OyT8khEYBUUjoz3FiL8TF9myykuU3n0vUCd6JHd5
 Mrd9pBZpujnAml7f/zhCcQW30NexlW/FC5kBsziK+hM5QeFfgBGE+1F3S w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="431185441"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
 d="scan'208,217";a="431185441"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="839377225"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
 d="scan'208,217";a="839377225"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.58.138])
 ([10.252.58.138])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:07:56 -0700
Content-Type: multipart/alternative;
 boundary="------------Oh5agQrCsvbftU3HoNcxmD09"
Message-ID: <dc09292f-e2e8-c800-b39e-99f5364a8a76@linux.intel.com>
Date: Mon, 24 Jul 2023 11:07:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 6/9] drm/i915/gt: Refactor intel_emit_pipe_control_cs()
 in a single function
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
References: <20230721161514.818895-1-andi.shyti@linux.intel.com>
 <20230721161514.818895-7-andi.shyti@linux.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230721161514.818895-7-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 linux-stable <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------Oh5agQrCsvbftU3HoNcxmD09
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi  Andi,

On 7/21/2023 6:15 PM, Andi Shyti wrote:
> Just a trivial refactoring for reducing the number of code
> duplicate. This will come at handy in the next commits.
>
> Meantime, propagate the error to the above layers if we fail to
> emit the pipe control.
>
> Signed-off-by: Andi Shyti<andi.shyti@linux.intel.com>
> Cc:<stable@vger.kernel.org>  # v5.8+
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 47 +++++++++++++-----------
>   1 file changed, 26 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 139a7e69f5c4d..5e19b45a5cabe 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -7,6 +7,7 @@
>   #include "i915_drv.h"
>   #include "intel_engine_regs.h"
>   #include "intel_gpu_commands.h"
> +#include "intel_gt_print.h"
>   #include "intel_lrc.h"
>   #include "intel_ring.h"
>   
> @@ -189,23 +190,30 @@ u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv
>   	return cs;
>   }
>   
> +static int gen12_emit_pipe_control_cs(struct i915_request *rq, u32 bit_group_0,
> +				      u32 bit_group_1, u32 offset)
> +{
> +	u32 *cs;
> +
> +	cs = intel_ring_begin(rq, 6);
> +	if (IS_ERR(cs))
> +		return PTR_ERR(cs);
> +
> +	cs = gen12_emit_pipe_control(cs, bit_group_0, bit_group_1,
> +				     LRC_PPHWSP_SCRATCH_ADDR);
> +	intel_ring_advance(rq, cs);
> +
> +	return 0;
> +}
> +
>   static int mtl_dummy_pipe_control(struct i915_request *rq)
>   {
>   	/* Wa_14016712196 */
>   	if (IS_MTL_GRAPHICS_STEP(rq->engine->i915, M, STEP_A0, STEP_B0) ||
> -	    IS_MTL_GRAPHICS_STEP(rq->engine->i915, P, STEP_A0, STEP_B0)) {
> -		u32 *cs;
> -
> -		/* dummy PIPE_CONTROL + depth flush */
> -		cs = intel_ring_begin(rq, 6);
> -		if (IS_ERR(cs))
> -			return PTR_ERR(cs);
> -		cs = gen12_emit_pipe_control(cs,
> -					     0,
> -					     PIPE_CONTROL_DEPTH_CACHE_FLUSH,
> -					     LRC_PPHWSP_SCRATCH_ADDR);
> -		intel_ring_advance(rq, cs);
> -	}
> +	    IS_MTL_GRAPHICS_STEP(rq->engine->i915, P, STEP_A0, STEP_B0))
> +		return gen12_emit_pipe_control_cs(rq, 0,
> +					PIPE_CONTROL_DEPTH_CACHE_FLUSH,
> +					LRC_PPHWSP_SCRATCH_ADDR);

Don't think this will get backported to 5.8+. I think mtl introduced 
after that.

If that is not an issue for rest of the series and then

|Reviewed-by: Nirmoy Das <nirmoy.das@intel.com> Regards, Nirmoy |


>   
>   	return 0;
>   }
> @@ -222,7 +230,6 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   		u32 bit_group_0 = 0;
>   		u32 bit_group_1 = 0;
>   		int err;
> -		u32 *cs;
>   
>   		err = mtl_dummy_pipe_control(rq);
>   		if (err)
> @@ -256,13 +263,11 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   		else if (engine->class == COMPUTE_CLASS)
>   			bit_group_1 &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>   
> -		cs = intel_ring_begin(rq, 6);
> -		if (IS_ERR(cs))
> -			return PTR_ERR(cs);
> -
> -		cs = gen12_emit_pipe_control(cs, bit_group_0, bit_group_1,
> -					     LRC_PPHWSP_SCRATCH_ADDR);
> -		intel_ring_advance(rq, cs);
> +		err = gen12_emit_pipe_control_cs(rq, bit_group_0, bit_group_1,
> +						 LRC_PPHWSP_SCRATCH_ADDR);
> +		if (err)
> +			gt_warn(engine->gt,
> +				"Failed to emit flush pipe control\n");
>   	}
>   
>   	if (mode & EMIT_INVALIDATE) {
--------------Oh5agQrCsvbftU3HoNcxmD09
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi  Andi,<br>
    </p>
    <div class="moz-cite-prefix">On 7/21/2023 6:15 PM, Andi Shyti wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230721161514.818895-7-andi.shyti@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Just a trivial refactoring for reducing the number of code
duplicate. This will come at handy in the next commits.

Meantime, propagate the error to the above layers if we fail to
emit the pipe control.

Signed-off-by: Andi Shyti <a class="moz-txt-link-rfc2396E" href="mailto:andi.shyti@linux.intel.com">&lt;andi.shyti@linux.intel.com&gt;</a>
Cc: <a class="moz-txt-link-rfc2396E" href="mailto:stable@vger.kernel.org">&lt;stable@vger.kernel.org&gt;</a> # v5.8+
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 47 +++++++++++++-----------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 139a7e69f5c4d..5e19b45a5cabe 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -7,6 +7,7 @@
 #include "i915_drv.h"
 #include "intel_engine_regs.h"
 #include "intel_gpu_commands.h"
+#include "intel_gt_print.h"
 #include "intel_lrc.h"
 #include "intel_ring.h"
 
@@ -189,23 +190,30 @@ u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv
 	return cs;
 }
 
+static int gen12_emit_pipe_control_cs(struct i915_request *rq, u32 bit_group_0,
+				      u32 bit_group_1, u32 offset)
+{
+	u32 *cs;
+
+	cs = intel_ring_begin(rq, 6);
+	if (IS_ERR(cs))
+		return PTR_ERR(cs);
+
+	cs = gen12_emit_pipe_control(cs, bit_group_0, bit_group_1,
+				     LRC_PPHWSP_SCRATCH_ADDR);
+	intel_ring_advance(rq, cs);
+
+	return 0;
+}
+
 static int mtl_dummy_pipe_control(struct i915_request *rq)
 {
 	/* Wa_14016712196 */
 	if (IS_MTL_GRAPHICS_STEP(rq-&gt;engine-&gt;i915, M, STEP_A0, STEP_B0) ||
-	    IS_MTL_GRAPHICS_STEP(rq-&gt;engine-&gt;i915, P, STEP_A0, STEP_B0)) {
-		u32 *cs;
-
-		/* dummy PIPE_CONTROL + depth flush */
-		cs = intel_ring_begin(rq, 6);
-		if (IS_ERR(cs))
-			return PTR_ERR(cs);
-		cs = gen12_emit_pipe_control(cs,
-					     0,
-					     PIPE_CONTROL_DEPTH_CACHE_FLUSH,
-					     LRC_PPHWSP_SCRATCH_ADDR);
-		intel_ring_advance(rq, cs);
-	}
+	    IS_MTL_GRAPHICS_STEP(rq-&gt;engine-&gt;i915, P, STEP_A0, STEP_B0))
+		return gen12_emit_pipe_control_cs(rq, 0,
+					PIPE_CONTROL_DEPTH_CACHE_FLUSH,
+					LRC_PPHWSP_SCRATCH_ADDR);</pre>
    </blockquote>
    <p>Don't think this will get backported to 5.8+. I think mtl
      introduced after that.</p>
    <p>If that is not an issue for rest of the series and then <br>
    </p>
    <pre class="moz-quote-pre" wrap=""><code style="padding: 0px; tab-size: 8;" class="hljs diff language-diff">Reviewed-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>

Regards,
Nirmoy
</code></pre>
    <p></p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20230721161514.818895-7-andi.shyti@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
 
 	return 0;
 }
@@ -222,7 +230,6 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 		u32 bit_group_0 = 0;
 		u32 bit_group_1 = 0;
 		int err;
-		u32 *cs;
 
 		err = mtl_dummy_pipe_control(rq);
 		if (err)
@@ -256,13 +263,11 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 		else if (engine-&gt;class == COMPUTE_CLASS)
 			bit_group_1 &amp;= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
-		cs = intel_ring_begin(rq, 6);
-		if (IS_ERR(cs))
-			return PTR_ERR(cs);
-
-		cs = gen12_emit_pipe_control(cs, bit_group_0, bit_group_1,
-					     LRC_PPHWSP_SCRATCH_ADDR);
-		intel_ring_advance(rq, cs);
+		err = gen12_emit_pipe_control_cs(rq, bit_group_0, bit_group_1,
+						 LRC_PPHWSP_SCRATCH_ADDR);
+		if (err)
+			gt_warn(engine-&gt;gt,
+				"Failed to emit flush pipe control\n");
 	}
 
 	if (mode &amp; EMIT_INVALIDATE) {
</pre>
    </blockquote>
  </body>
</html>

--------------Oh5agQrCsvbftU3HoNcxmD09--

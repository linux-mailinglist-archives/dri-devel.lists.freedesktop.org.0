Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B26974D29A3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 08:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480B410E428;
	Wed,  9 Mar 2022 07:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F122B10E61E;
 Tue,  8 Mar 2022 13:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646744528; x=1678280528;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=6w0Cw2NnRiuEX9yftsc+XScX5Mg51Zv8P11X8CazHyo=;
 b=nSRWrSXJ4iEDsQhEL9THTKbfIRhEO/u9eofUcgs9OOVaOu7yArBK1coc
 66lJqhkjaIHnlgFW8MG8+eTMBlg6ugWh1nbFApQ/+TINzGO515PNNYXmY
 5wnvJigl8angyf3TMG6exBXSnt1AfYd3GimJJFLIFsNqKOtTYXvKMRHSb
 fizIVPHPu/CyyUWbAGTvH/gNatkSKm6pRLyGUM8h4+zcthveR1Jdxs+6a
 sUNDPcE4tZ8IWFRcu4nZqfaHbP2JGzY+Jsf8eYNm/O8fvzfWsENxX/xbz
 y6oMKsYFqzLd7T/2OGDaWLp+K3f1NqeVolALVzoeBvREF4Va7tLxmNHHw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="234630402"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
 d="scan'208,217";a="234630402"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 05:02:07 -0800
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
 d="scan'208,217";a="553608512"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.218.61])
 ([10.251.218.61])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 05:02:06 -0800
Content-Type: multipart/alternative;
 boundary="------------FxguhPwXl54QhIFAwAFpwJHv"
Message-ID: <42e30a3e-1724-df69-4530-383ee4f215f5@linux.intel.com>
Date: Tue, 8 Mar 2022 14:02:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gtt: reduce overzealous alignment
 constraints for GGTT
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220303100229.839282-1-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220303100229.839282-1-matthew.auld@intel.com>
X-Mailman-Approved-At: Wed, 09 Mar 2022 07:40:04 +0000
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------FxguhPwXl54QhIFAwAFpwJHv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

|Acked-by: Nirmoy Das <nirmoy.das@intel.com>|

On 03/03/2022 11:02, Matthew Auld wrote:
> Currently this will enforce both 2M alignment and padding for any LMEM
> pages inserted into the GGTT. However, this was only meant to be applied
> to the compact-pt layout with the ppGTT. For the GGTT we can reduce the
> alignment and padding to 64K.
>
> Bspec: 45015
> Fixes: 87bd701ee268 ("drm/i915: enforce min GTT alignment for discrete cards")
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
> Cc: Robert Beckett<bob.beckett@collabora.com>
> Cc: Ramalingam C<ramalingam.c@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gtt.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 4bcdfcab3642..a5f5b2dda332 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -234,7 +234,8 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
>   	memset64(vm->min_alignment, I915_GTT_MIN_ALIGNMENT,
>   		 ARRAY_SIZE(vm->min_alignment));
>   
> -	if (HAS_64K_PAGES(vm->i915) && NEEDS_COMPACT_PT(vm->i915)) {
> +	if (HAS_64K_PAGES(vm->i915) && NEEDS_COMPACT_PT(vm->i915) &&
> +	    subclass == VM_CLASS_PPGTT) {
>   		vm->min_alignment[INTEL_MEMORY_LOCAL] = I915_GTT_PAGE_SIZE_2M;
>   		vm->min_alignment[INTEL_MEMORY_STOLEN_LOCAL] = I915_GTT_PAGE_SIZE_2M;
>   	} else if (HAS_64K_PAGES(vm->i915)) {
--------------FxguhPwXl54QhIFAwAFpwJHv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre class="moz-quote-pre" wrap=""><code style="padding: 0px; tab-size: 8;" class="hljs diff language-diff"><span class="hljs-addition">Acked-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></span></code></pre>
    <div class="moz-cite-prefix">On 03/03/2022 11:02, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220303100229.839282-1-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">Currently this will enforce both 2M alignment and padding for any LMEM
pages inserted into the GGTT. However, this was only meant to be applied
to the compact-pt layout with the ppGTT. For the GGTT we can reduce the
alignment and padding to 64K.

Bspec: 45015
Fixes: 87bd701ee268 ("drm/i915: enforce min GTT alignment for discrete cards")
Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Cc: Robert Beckett <a class="moz-txt-link-rfc2396E" href="mailto:bob.beckett@collabora.com">&lt;bob.beckett@collabora.com&gt;</a>
Cc: Ramalingam C <a class="moz-txt-link-rfc2396E" href="mailto:ramalingam.c@intel.com">&lt;ramalingam.c@intel.com&gt;</a>
---
 drivers/gpu/drm/i915/gt/intel_gtt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 4bcdfcab3642..a5f5b2dda332 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -234,7 +234,8 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
 	memset64(vm-&gt;min_alignment, I915_GTT_MIN_ALIGNMENT,
 		 ARRAY_SIZE(vm-&gt;min_alignment));
 
-	if (HAS_64K_PAGES(vm-&gt;i915) &amp;&amp; NEEDS_COMPACT_PT(vm-&gt;i915)) {
+	if (HAS_64K_PAGES(vm-&gt;i915) &amp;&amp; NEEDS_COMPACT_PT(vm-&gt;i915) &amp;&amp;
+	    subclass == VM_CLASS_PPGTT) {
 		vm-&gt;min_alignment[INTEL_MEMORY_LOCAL] = I915_GTT_PAGE_SIZE_2M;
 		vm-&gt;min_alignment[INTEL_MEMORY_STOLEN_LOCAL] = I915_GTT_PAGE_SIZE_2M;
 	} else if (HAS_64K_PAGES(vm-&gt;i915)) {
</pre>
    </blockquote>
  </body>
</html>

--------------FxguhPwXl54QhIFAwAFpwJHv--

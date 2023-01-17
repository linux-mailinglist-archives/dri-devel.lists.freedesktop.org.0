Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B481F66E312
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874B110E2EE;
	Tue, 17 Jan 2023 16:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F8A10E2EE;
 Tue, 17 Jan 2023 16:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673971595; x=1705507595;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=wCGKjItQYcTzbCx034yZc62DBLBpIa//43sovUibnR8=;
 b=W8o6Zd0LBEQO7zd6btMloEZyw3YhOUPfi7FunTn9RqRztd0i1VoT7GLG
 5CHlvjB/jjMWJ794DLhROD6Z/xBtuD3rPUNOQ1/ZnUFueGYR6AbuwLpXG
 zhbFSoKSQYzT2nLmgv14COvm7Dmcc4k/gOQjIVN0qbQJ+W4MBZc4koRHS
 QxZY259/Zf/etp2M0UlZbh7eLTK+qMJZEdzR5lti+GlQA0bWePZ9WyIY6
 NfTrYwzsESOyPegDL2b5k2wlWruaqjgt6CUnquGhLjtt8dRJ5RXXwUUEn
 8ouHh7yMZRdgbZ/WOmxivaZpV/e/E8aD96JUBqUqiLdNNPvy3IeaIf2MF Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="322421691"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
 d="scan'208,217";a="322421691"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 08:06:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="833221153"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
 d="scan'208,217";a="833221153"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.222.166])
 ([10.251.222.166])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 08:05:58 -0800
Content-Type: multipart/alternative;
 boundary="------------HhGYSLWyvs0zrVGzvNbFCAvy"
Message-ID: <56b0492f-b0f4-54b3-a0b9-fb0d43198170@linux.intel.com>
Date: Tue, 17 Jan 2023 17:05:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] drm/i915/selftests: Unwind hugepages to drop wakeref
 on error
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230117123234.26487-1-nirmoy.das@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230117123234.26487-1-nirmoy.das@intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, chris.p.wilson@linux.intel.com,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------HhGYSLWyvs0zrVGzvNbFCAvy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

|Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>|

On 1/17/2023 1:32 PM, Nirmoy Das wrote:
> From: Chris Wilson<chris.p.wilson@linux.intel.com>
>
> Make sure that upon error after we have acquired the wakeref we do
> release it again.
>
> v2: add another missing "goto out_wf"(Andi).
>
> Fixes: 027c38b4121e ("drm/i915/selftests: Grab the runtime pm in shrink_thp")
> Cc: Andi Shyti<andi.shyti@linux.intel.com>
> Reviewed-by: Matthew Auld<matthew.auld@intel.com>
> Reviewed-by: Andrzej Hajda<andrzej.hajda@intel.com>
> Signed-off-by: Chris Wilson<chris.p.wilson@linux.intel.com>
> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> index c281b0ec9e05..defece0bcb81 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> @@ -1855,7 +1855,7 @@ static int igt_shrink_thp(void *arg)
>   			I915_SHRINK_ACTIVE);
>   	i915_vma_unpin(vma);
>   	if (err)
> -		goto out_put;
> +		goto out_wf;
>   
>   	/*
>   	 * Now that the pages are *unpinned* shrinking should invoke
> @@ -1871,19 +1871,19 @@ static int igt_shrink_thp(void *arg)
>   		pr_err("unexpected pages mismatch, should_swap=%s\n",
>   		       str_yes_no(should_swap));
>   		err = -EINVAL;
> -		goto out_put;
> +		goto out_wf;
>   	}
>   
>   	if (should_swap == (obj->mm.page_sizes.sg || obj->mm.page_sizes.phys)) {
>   		pr_err("unexpected residual page-size bits, should_swap=%s\n",
>   		       str_yes_no(should_swap));
>   		err = -EINVAL;
> -		goto out_put;
> +		goto out_wf;
>   	}
>   
>   	err = i915_vma_pin(vma, 0, 0, flags);
>   	if (err)
> -		goto out_put;
> +		goto out_wf;
>   
>   	while (n--) {
>   		err = cpu_check(obj, n, 0xdeadbeaf);
--------------HhGYSLWyvs0zrVGzvNbFCAvy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre class="moz-quote-pre" wrap=""><code style="padding: 0px; tab-size: 8;" class="hljs diff language-diff">Reviewed-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></code></pre>
    <p></p>
    <div class="moz-cite-prefix">On 1/17/2023 1:32 PM, Nirmoy Das wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230117123234.26487-1-nirmoy.das@intel.com">
      <pre class="moz-quote-pre" wrap="">From: Chris Wilson <a class="moz-txt-link-rfc2396E" href="mailto:chris.p.wilson@linux.intel.com">&lt;chris.p.wilson@linux.intel.com&gt;</a>

Make sure that upon error after we have acquired the wakeref we do
release it again.

v2: add another missing "goto out_wf"(Andi).

Fixes: 027c38b4121e ("drm/i915/selftests: Grab the runtime pm in shrink_thp")
Cc: Andi Shyti <a class="moz-txt-link-rfc2396E" href="mailto:andi.shyti@linux.intel.com">&lt;andi.shyti@linux.intel.com&gt;</a>
Reviewed-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Reviewed-by: Andrzej Hajda <a class="moz-txt-link-rfc2396E" href="mailto:andrzej.hajda@intel.com">&lt;andrzej.hajda@intel.com&gt;</a>
Signed-off-by: Chris Wilson <a class="moz-txt-link-rfc2396E" href="mailto:chris.p.wilson@linux.intel.com">&lt;chris.p.wilson@linux.intel.com&gt;</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index c281b0ec9e05..defece0bcb81 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1855,7 +1855,7 @@ static int igt_shrink_thp(void *arg)
 			I915_SHRINK_ACTIVE);
 	i915_vma_unpin(vma);
 	if (err)
-		goto out_put;
+		goto out_wf;
 
 	/*
 	 * Now that the pages are *unpinned* shrinking should invoke
@@ -1871,19 +1871,19 @@ static int igt_shrink_thp(void *arg)
 		pr_err("unexpected pages mismatch, should_swap=%s\n",
 		       str_yes_no(should_swap));
 		err = -EINVAL;
-		goto out_put;
+		goto out_wf;
 	}
 
 	if (should_swap == (obj-&gt;mm.page_sizes.sg || obj-&gt;mm.page_sizes.phys)) {
 		pr_err("unexpected residual page-size bits, should_swap=%s\n",
 		       str_yes_no(should_swap));
 		err = -EINVAL;
-		goto out_put;
+		goto out_wf;
 	}
 
 	err = i915_vma_pin(vma, 0, 0, flags);
 	if (err)
-		goto out_put;
+		goto out_wf;
 
 	while (n--) {
 		err = cpu_check(obj, n, 0xdeadbeaf);
</pre>
    </blockquote>
  </body>
</html>

--------------HhGYSLWyvs0zrVGzvNbFCAvy--

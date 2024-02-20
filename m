Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C262285B69B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 10:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B217D10E053;
	Tue, 20 Feb 2024 09:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PLzNP2xl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E85010E228;
 Tue, 20 Feb 2024 09:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708419934; x=1739955934;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=rK9FL6IDYVMVqTKSg8C6FYwyy3TTQyNND9BPOP/bnN4=;
 b=PLzNP2xlkFQW0po31KuY5yasjiPSRBE3WR8NdNFY3z3cNAu/PwDe71lR
 KUuGrfw4euKiM/28nvnk2I4Or/8Ms0vDO+CZsrwjho8+DvUNKVjfSb7rd
 yxxEjfPX6M0dCj4nvaCW3xXy+wvpK3uFtbhE3P4jLa2d9kCt5QoVuzx7T
 WzlXzK1WE+BkYbV5n4UavJO/JZXJpk/PKRzKiBYtKbP8cImsZY/G1mdKv
 RNv4UYxXK2/2y0aNQSm29wVwgri4ex6Xt+OoAtcA8JH5GoAH4dg3ydg8d
 4jxsK5j3aG3ZE2NKffANeww8y54F45ft89DnQEMxzNpIDBIj8JPQz6cVO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="6328628"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208,217";a="6328628"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 01:05:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208,217";a="9419269"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.50.249])
 ([10.246.50.249])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 01:05:31 -0800
Content-Type: multipart/alternative;
 boundary="------------10jooFcKQFnxlMRDcWq7DseM"
Message-ID: <97d6c6a4-dd1c-44af-a670-4867b6ae3cab@linux.intel.com>
Date: Tue, 20 Feb 2024 10:05:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: check before removing mm notifier
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Shawn Lee <shawn.c.lee@intel.com>
References: <20240219125047.28906-1-nirmoy.das@intel.com>
 <ZdO2IYev7Amcbtt1@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZdO2IYev7Amcbtt1@intel.com>
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

This is a multi-part message in MIME format.
--------------10jooFcKQFnxlMRDcWq7DseM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rodrigo,

On 2/19/2024 9:12 PM, Rodrigo Vivi wrote:
> On Mon, Feb 19, 2024 at 01:50:47PM +0100, Nirmoy Das wrote:
>> Error in mmu_interval_notifier_insert() can leave a NULL
>> notifier.mm pointer. Catch that and return early.
>>
>> Cc: Andi Shyti<andi.shyti@linux.intel.com>
>> Cc: Shawn Lee<shawn.c.lee@intel.com>
>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>> index 0e21ce9d3e5a..61abfb505766 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>> @@ -349,6 +349,9 @@ i915_gem_userptr_release(struct drm_i915_gem_object *obj)
>>   {
>>   	GEM_WARN_ON(obj->userptr.page_ref);
>>   
>> +	if (!obj->userptr.notifier.mm)
>> +		return;
>> +
> hmmm... right, it looks that we need this protection. But...
>
> I mean, feel free to use
> Reviewed-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
>
> for this patch,
>
> but I believe that if this mmu insert failed we might have other
> deeper problems like when checking i915_gem_object_is_userptr() ?
>
> No?!

We are returning an error if mmu insert fails while creating a userptr 
object  so the obj struct is only available to obj cleanup methods.

As far as I see, i915_gem_object_is_userptr() should not happen on such obj struct.

Thanks,
Nirmoy

>>   	mmu_interval_notifier_remove(&obj->userptr.notifier);
>>   	obj->userptr.notifier.mm = NULL;
>>   }
>> -- 
>> 2.42.0
>>
--------------10jooFcKQFnxlMRDcWq7DseM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Rodrigo, <br>
    </p>
    <div class="moz-cite-prefix">On 2/19/2024 9:12 PM, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZdO2IYev7Amcbtt1@intel.com">
      <pre class="moz-quote-pre" wrap="">On Mon, Feb 19, 2024 at 01:50:47PM +0100, Nirmoy Das wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Error in mmu_interval_notifier_insert() can leave a NULL
notifier.mm pointer. Catch that and return early.

Cc: Andi Shyti <a class="moz-txt-link-rfc2396E" href="mailto:andi.shyti@linux.intel.com">&lt;andi.shyti@linux.intel.com&gt;</a>
Cc: Shawn Lee <a class="moz-txt-link-rfc2396E" href="mailto:shawn.c.lee@intel.com">&lt;shawn.c.lee@intel.com&gt;</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 0e21ce9d3e5a..61abfb505766 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -349,6 +349,9 @@ i915_gem_userptr_release(struct drm_i915_gem_object *obj)
 {
 	GEM_WARN_ON(obj-&gt;userptr.page_ref);
 
+	if (!obj-&gt;userptr.notifier.mm)
+		return;
+
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
hmmm... right, it looks that we need this protection. But...

I mean, feel free to use
Reviewed-by: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>

for this patch,

but I believe that if this mmu insert failed we might have other
deeper problems like when checking i915_gem_object_is_userptr() ?

No?!
</pre>
    </blockquote>
    <p>We are returning an error if mmu insert fails while creating a
      userptr object  so the obj struct is only available to obj cleanup
      methods.</p>
    <pre class="moz-quote-pre" wrap="">As far as I see, i915_gem_object_is_userptr() should not happen on such obj struct.

Thanks,
Nirmoy </pre>
    <p></p>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZdO2IYev7Amcbtt1@intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 	mmu_interval_notifier_remove(&amp;obj-&gt;userptr.notifier);
 	obj-&gt;userptr.notifier.mm = NULL;
 }
-- 
2.42.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------10jooFcKQFnxlMRDcWq7DseM--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E30477AE8F1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 11:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A883A10E384;
	Tue, 26 Sep 2023 09:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8361510E384;
 Tue, 26 Sep 2023 09:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695720279; x=1727256279;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=eCGZEh4D+iYY+zkacYYpEOYJxMZmB/wavWpjow03kdw=;
 b=kKRQZn0n+As3r+pZPkr0As1v+vmibf9t3uvzx1Zfnhhn0nF3NT3XVwT6
 qn3RHyk16E8VpvdYRpHiCcO/O4PltfCWiFpGAoKfxVqWlP8v+zQiflnQz
 Iautn1/WPmsRq/xueLJugvKgDrXWwBmvgtPMtB5vxIzq2P25Yz1XoQijb
 Cazost0UZJ14ApqtdkaEyrerrJUUJeILgDu4zyjCN/itNNlpVvghmZflN
 bsyb1v1e/ZGYTGezKJASo2+lgvA++K+advkGDDua/MZh2z45jbNZkG8GS
 mv9XMUwzK54RSIPLOuW0Tg3KDF0h1xZX5rKAyCWRHpSLoP4ZLDPxWbVxD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467809594"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
 d="scan'208,217";a="467809594"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 02:24:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="872434774"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
 d="scan'208,217";a="872434774"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.41.5])
 ([10.252.41.5])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 02:24:18 -0700
Content-Type: multipart/alternative;
 boundary="------------kYp0fDNOxy9tq0ghhvaO3wLf"
Message-ID: <78ce5784-b74f-e693-d376-e171e986b517@linux.intel.com>
Date: Tue, 26 Sep 2023 11:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3] drm/i915/gem: Make i915_gem_shrinker multi-gt aware
Content-Language: en-US
To: intel-gfx@lists.freedesktop.org, andi.shyti@linux.intel.com
References: <20230925171048.19245-1-nirmoy.das@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230925171048.19245-1-nirmoy.das@intel.com>
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
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------kYp0fDNOxy9tq0ghhvaO3wLf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/25/2023 7:10 PM, Nirmoy Das wrote:
> From: Jonathan Cavitt<jonathan.cavitt@intel.com>
>
> Where applicable, use for_each_gt instead of to_gt in the
> i915_gem_shrinker functions to make them apply to more than just the
> primary GT.  Specifically, this ensure i915_gem_shrink_all retires all
> requests across all GTs, and this makes i915_gem_shrinker_vmap unmap
> VMAs from all GTs.
>
> v2: Pass correct GT to intel_gt_retire_requests(Andrzej).
> v3: Remove unnecessary braces(Andi)
eh I will resend the v2 with your r-b, Andi.

drivers/gpu/drm/i915/gem/i915_gem_shrinker.c: In function ‘i915_gem_shrink’:
drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:152:5: error: suggest explicit braces to avoid ambiguous ‘else’ [-Werror=dangling-else]
   152 |  if (shrink & I915_SHRINK_ACTIVE)
       |     ^

>
> Signed-off-by: Jonathan Cavitt<jonathan.cavitt@intel.com>
> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
> Reviewed-by: Andrzej Hajda<andrzej.hajda@intel.com>
> Reviewed-by: Andi Shyti<andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 41 ++++++++++++--------
>   1 file changed, 24 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> index 214763942aa2..e79fcbdfab25 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> @@ -14,6 +14,7 @@
>   #include <linux/vmalloc.h>
>   
>   #include "gt/intel_gt_requests.h"
> +#include "gt/intel_gt.h"
>   
>   #include "i915_trace.h"
>   
> @@ -119,7 +120,8 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
>   	intel_wakeref_t wakeref = 0;
>   	unsigned long count = 0;
>   	unsigned long scanned = 0;
> -	int err = 0;
> +	int err = 0, i = 0;
> +	struct intel_gt *gt;
>   
>   	/* CHV + VTD workaround use stop_machine(); need to trylock vm->mutex */
>   	bool trylock_vm = !ww && intel_vm_no_concurrent_access_wa(i915);
> @@ -148,8 +150,9 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
>   	 * contexts around longer than is necessary.
>   	 */
>   	if (shrink & I915_SHRINK_ACTIVE)
> -		/* Retire requests to unpin all idle contexts */
> -		intel_gt_retire_requests(to_gt(i915));
> +		for_each_gt(gt, i915, i)
> +			/* Retire requests to unpin all idle contexts */
> +			intel_gt_retire_requests(gt);
>   
>   	/*
>   	 * As we may completely rewrite the (un)bound list whilst unbinding
> @@ -389,6 +392,8 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
>   	struct i915_vma *vma, *next;
>   	unsigned long freed_pages = 0;
>   	intel_wakeref_t wakeref;
> +	struct intel_gt *gt;
> +	int i;
>   
>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
>   		freed_pages += i915_gem_shrink(NULL, i915, -1UL, NULL,
> @@ -397,24 +402,26 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
>   					       I915_SHRINK_VMAPS);
>   
>   	/* We also want to clear any cached iomaps as they wrap vmap */
> -	mutex_lock(&to_gt(i915)->ggtt->vm.mutex);
> -	list_for_each_entry_safe(vma, next,
> -				 &to_gt(i915)->ggtt->vm.bound_list, vm_link) {
> -		unsigned long count = i915_vma_size(vma) >> PAGE_SHIFT;
> -		struct drm_i915_gem_object *obj = vma->obj;
> -
> -		if (!vma->iomap || i915_vma_is_active(vma))
> -			continue;
> +	for_each_gt(gt, i915, i) {
> +		mutex_lock(&gt->ggtt->vm.mutex);
> +		list_for_each_entry_safe(vma, next,
> +					 &gt->ggtt->vm.bound_list, vm_link) {
> +			unsigned long count = i915_vma_size(vma) >> PAGE_SHIFT;
> +			struct drm_i915_gem_object *obj = vma->obj;
> +
> +			if (!vma->iomap || i915_vma_is_active(vma))
> +				continue;
>   
> -		if (!i915_gem_object_trylock(obj, NULL))
> -			continue;
> +			if (!i915_gem_object_trylock(obj, NULL))
> +				continue;
>   
> -		if (__i915_vma_unbind(vma) == 0)
> -			freed_pages += count;
> +			if (__i915_vma_unbind(vma) == 0)
> +				freed_pages += count;
>   
> -		i915_gem_object_unlock(obj);
> +			i915_gem_object_unlock(obj);
> +		}
> +		mutex_unlock(&gt->ggtt->vm.mutex);
>   	}
> -	mutex_unlock(&to_gt(i915)->ggtt->vm.mutex);
>   
>   	*(unsigned long *)ptr += freed_pages;
>   	return NOTIFY_DONE;
--------------kYp0fDNOxy9tq0ghhvaO3wLf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 9/25/2023 7:10 PM, Nirmoy Das wrote=
:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20230925171048.19245-1-nirmoy.das@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Jonathan Cavitt <a cla=
ss=3D"moz-txt-link-rfc2396E" href=3D"mailto:jonathan.cavitt@intel.com">&l=
t;jonathan.cavitt@intel.com&gt;</a>

Where applicable, use for_each_gt instead of to_gt in the
i915_gem_shrinker functions to make them apply to more than just the
primary GT.  Specifically, this ensure i915_gem_shrink_all retires all
requests across all GTs, and this makes i915_gem_shrinker_vmap unmap
VMAs from all GTs.

v2: Pass correct GT to intel_gt_retire_requests(Andrzej).
v3: Remove unnecessary braces(Andi) </pre>
    </blockquote>
    eh I will resend the v2 with your r-b, Andi.<br>
    <pre class=3D"panel-body test-result" style=3D"box-sizing: border-box=
; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New=
&quot;, monospace; font-size: 13px; display: block; padding: 15px; margin=
: 0px; line-height: 14.3px; color: rgb(51, 51, 51); word-break: break-all=
; overflow-wrap: break-word; background-color: white; border-width: 1px 0=
px 0px; border-top-style: solid; border-right-style: initial; border-bott=
om-style: initial; border-left-style: initial; border-top-color: rgb(221,=
 221, 221); border-right-color: initial; border-bottom-color: initial; bo=
rder-left-color: initial; border-image: initial; border-radius: 0px; font=
-style: normal; font-variant-ligatures: normal; font-variant-caps: normal=
; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -=
webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-d=
ecoration-style: initial; text-decoration-color: initial;">drivers/gpu/dr=
m/i915/gem/i915_gem_shrinker.c: In function =E2=80=98i915_gem_shrink=E2=80=
=99:
drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:152:5: error: suggest explic=
it braces to avoid ambiguous =E2=80=98else=E2=80=99 [-Werror=3Ddangling-e=
lse]
  152 |  if (shrink &amp; I915_SHRINK_ACTIVE)
      |     ^</pre>
    <blockquote type=3D"cite"
      cite=3D"mid:20230925171048.19245-1-nirmoy.das@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Signed-off-by: Jonathan Cavitt <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>
Signed-off-by: Nirmoy Das <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
Reviewed-by: Andrzej Hajda <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:andrzej.hajda@intel.com">&lt;andrzej.hajda@intel.com&gt;</a>
Reviewed-by: Andi Shyti <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:andi.shyti@linux.intel.com">&lt;andi.shyti@linux.intel.com&gt;</a>
---
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 41 ++++++++++++--------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_shrinker.c
index 214763942aa2..e79fcbdfab25 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -14,6 +14,7 @@
 #include &lt;linux/vmalloc.h&gt;
=20
 #include "gt/intel_gt_requests.h"
+#include "gt/intel_gt.h"
=20
 #include "i915_trace.h"
=20
@@ -119,7 +120,8 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
 	intel_wakeref_t wakeref =3D 0;
 	unsigned long count =3D 0;
 	unsigned long scanned =3D 0;
-	int err =3D 0;
+	int err =3D 0, i =3D 0;
+	struct intel_gt *gt;
=20
 	/* CHV + VTD workaround use stop_machine(); need to trylock vm-&gt;mute=
x */
 	bool trylock_vm =3D !ww &amp;&amp; intel_vm_no_concurrent_access_wa(i91=
5);
@@ -148,8 +150,9 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
 	 * contexts around longer than is necessary.
 	 */
 	if (shrink &amp; I915_SHRINK_ACTIVE)
-		/* Retire requests to unpin all idle contexts */
-		intel_gt_retire_requests(to_gt(i915));
+		for_each_gt(gt, i915, i)
+			/* Retire requests to unpin all idle contexts */
+			intel_gt_retire_requests(gt);
=20
 	/*
 	 * As we may completely rewrite the (un)bound list whilst unbinding
@@ -389,6 +392,8 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, uns=
igned long event, void *ptr
 	struct i915_vma *vma, *next;
 	unsigned long freed_pages =3D 0;
 	intel_wakeref_t wakeref;
+	struct intel_gt *gt;
+	int i;
=20
 	with_intel_runtime_pm(&amp;i915-&gt;runtime_pm, wakeref)
 		freed_pages +=3D i915_gem_shrink(NULL, i915, -1UL, NULL,
@@ -397,24 +402,26 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, u=
nsigned long event, void *ptr
 					       I915_SHRINK_VMAPS);
=20
 	/* We also want to clear any cached iomaps as they wrap vmap */
-	mutex_lock(&amp;to_gt(i915)-&gt;ggtt-&gt;vm.mutex);
-	list_for_each_entry_safe(vma, next,
-				 &amp;to_gt(i915)-&gt;ggtt-&gt;vm.bound_list, vm_link) {
-		unsigned long count =3D i915_vma_size(vma) &gt;&gt; PAGE_SHIFT;
-		struct drm_i915_gem_object *obj =3D vma-&gt;obj;
-
-		if (!vma-&gt;iomap || i915_vma_is_active(vma))
-			continue;
+	for_each_gt(gt, i915, i) {
+		mutex_lock(&amp;gt-&gt;ggtt-&gt;vm.mutex);
+		list_for_each_entry_safe(vma, next,
+					 &amp;gt-&gt;ggtt-&gt;vm.bound_list, vm_link) {
+			unsigned long count =3D i915_vma_size(vma) &gt;&gt; PAGE_SHIFT;
+			struct drm_i915_gem_object *obj =3D vma-&gt;obj;
+
+			if (!vma-&gt;iomap || i915_vma_is_active(vma))
+				continue;
=20
-		if (!i915_gem_object_trylock(obj, NULL))
-			continue;
+			if (!i915_gem_object_trylock(obj, NULL))
+				continue;
=20
-		if (__i915_vma_unbind(vma) =3D=3D 0)
-			freed_pages +=3D count;
+			if (__i915_vma_unbind(vma) =3D=3D 0)
+				freed_pages +=3D count;
=20
-		i915_gem_object_unlock(obj);
+			i915_gem_object_unlock(obj);
+		}
+		mutex_unlock(&amp;gt-&gt;ggtt-&gt;vm.mutex);
 	}
-	mutex_unlock(&amp;to_gt(i915)-&gt;ggtt-&gt;vm.mutex);
=20
 	*(unsigned long *)ptr +=3D freed_pages;
 	return NOTIFY_DONE;
</pre>
    </blockquote>
  </body>
</html>

--------------kYp0fDNOxy9tq0ghhvaO3wLf--

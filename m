Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E22E3B7EB8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 10:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DBC6E947;
	Wed, 30 Jun 2021 08:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE046E947;
 Wed, 30 Jun 2021 08:12:06 +0000 (UTC)
Received: from [192.168.1.190] (unknown [91.155.165.229])
 (Authenticated sender: martin.peres@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4F9015FFAD;
 Wed, 30 Jun 2021 10:11:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1625040724;
 bh=ezyJz45Tsx6GAz9cFK8xp2tdcLvGnYIA5ytIhHDvaE4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=SFKT+1JU/dj19sEgiWATH16WolGNnBjKAfzytIjgIS7d0esflC1+XXTPQ17eoA7dV
 EZa3V7to6HNc3odfyGgvJJ0TpP6DKQIPleUAEN4TH51Cwj99W3RltnP/+GsybC/NPq
 wxvNuAyisxu8AWXf9e5HxyXvcfl+VkwtpFF5DRTNIJYFxABnpPMT9CPk6vVbLhB9Kv
 FkFtoD6wbH6GAPdumxFcV2b0RC+EXaPsZAvzCHvGZ7Zp6zdw9bwDkYqlZhqUXA3vCq
 q0uq48oRHwaScWz7wBn+/s252i3hSVUBzIU7l5eY95N6vdTVbLbjAsJxEaYE7NmEnt
 1eBUCtzec5Puw==
Subject: Re: [PATCH 1/2] drm/doc/rfc: i915 GuC submission / DRM scheduler
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210629193511.124099-1-matthew.brost@intel.com>
 <20210629193511.124099-2-matthew.brost@intel.com>
From: Martin Peres <martin.peres@free.fr>
Message-ID: <7d7db7e2-8d83-d7b4-1ed2-527d635577ef@free.fr>
Date: Wed, 30 Jun 2021 11:11:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629193511.124099-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

On 29/06/2021 22:35, Matthew Brost wrote:
> Add entry for i915 GuC submission / DRM scheduler integration plan.
> Follow up patch with details of new parallel submission uAPI to come.
> 
> v2:
>   (Daniel Vetter)
>    - Expand explaination of why bonding isn't supported for GuC
>      submission
>    - CC some of the DRM scheduler maintainers
>    - Add priority inheritance / boosting use case
>    - Add reasoning for removing in order assumptions
>   (Daniel Stone)
>    - Add links to priority spec
> v4:
>   (Tvrtko)
>    - Add TODOs section
>   (Daniel Vetter)
>    - Pull in 1 line from following patch
> v5:
>   (Checkpatch)
>    - Fix typos
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Acked-by: Dave Airlie <airlied@redhat.com>
> ---
>   Documentation/gpu/rfc/i915_scheduler.rst | 91 ++++++++++++++++++++++++
>   Documentation/gpu/rfc/index.rst          |  4 ++
>   2 files changed, 95 insertions(+)
>   create mode 100644 Documentation/gpu/rfc/i915_scheduler.rst
> 
> diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
> new file mode 100644
> index 000000000000..7acd386a6b49
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_scheduler.rst
> @@ -0,0 +1,91 @@
> +=========================================
> +I915 GuC Submission/DRM Scheduler Section
> +=========================================
> +
> +Upstream plan
> +=============
> +For upstream the overall plan for landing GuC submission and integrating the
> +i915 with the DRM scheduler is:
> +
> +* Merge basic GuC submission
> +	* Basic submission support for all gen11+ platforms
> +	* Not enabled by default on any current platforms but can be enabled via
> +	  modparam enable_guc

Just a quick reminder that a lot of users have this parameter set in 
their grub command line because of the incorrect assumption that quick 
sync requires the HuC which requires the GuC command submission.

Just bear that in mind and make sure there is a minimum of quality in 
the GuC backend before allowing users to use the GuC, even behind this 
kernel parameter.

Maybe a warning in the kernel logs saying that this feature is 
experimental, and use "enable_guc=1" for the fullest quick sync support 
will improve the user satisfaction, and save you some time handling 
unwanted bugs.

> +	* Lots of rework will need to be done to integrate with DRM scheduler so
> +	  no need to nit pick everything in the code, it just should be
> +	  functional, no major coding style / layering errors, and not regress
> +	  execlists
> +	* Update IGTs / selftests as needed to work with GuC submission
> +	* Enable CI on supported platforms for a baseline

What's the plan to keep the comparison between GuC and execlists? The CI 
machines cannot just test the GuC as it would expose users to 
regressions in the default mode, and machines are hard to come by in the 
CI lab.

> +	* Rework / get CI heathly for GuC submission in place as needed
> +* Merge new parallel submission uAPI
> +	* Bonding uAPI completely incompatible with GuC submission, plus it has
> +	  severe design issues in general, which is why we want to retire it no
> +	  matter what
> +	* New uAPI adds I915_CONTEXT_ENGINES_EXT_PARALLEL context setup step
> +	  which configures a slot with N contexts
> +	* After I915_CONTEXT_ENGINES_EXT_PARALLEL a user can submit N batches to
> +	  a slot in a single execbuf IOCTL and the batches run on the GPU in
> +	  paralllel

FYI, this is a typo

> +	* Initially only for GuC submission but execlists can be supported if
> +	  needed
> +* Convert the i915 to use the DRM scheduler
> +	* GuC submission backend fully integrated with DRM scheduler
> +		* All request queues removed from backend (e.g. all backpressure
> +		  handled in DRM scheduler)
> +		* Resets / cancels hook in DRM scheduler
> +		* Watchdog hooks into DRM scheduler
> +		* Lots of complexity of the GuC backend can be pulled out once
> +		  integrated with DRM scheduler (e.g. state machine gets
> +		  simplier, locking gets simplier, etc...)

As much as I would like more consistency in the English language, 
simplier is not a word in the dictionary.

> +	* Execlists backend will minimum required to hook in the DRM scheduler

Can't parse this sentence. How about: "Minimum integration of the 
execlists backend in the DRM scheduler"?

Other than these typographical nitpicks, I think the plan is sane 
provided that you can find enough CI machines and add the warning.

> +		* Legacy interface
> +		* Features like timeslicing / preemption / virtual engines would
> +		  be difficult to integrate with the DRM scheduler and these
> +		  features are not required for GuC submission as the GuC does
> +		  these things for us
> +		* ROI low on fully integrating into DRM scheduler
> +		* Fully integrating would add lots of complexity to DRM
> +		  scheduler
> +	* Port i915 priority inheritance / boosting feature in DRM scheduler
> +		* Used for i915 page flip, may be useful to other DRM drivers as
> +		  well
> +		* Will be an optional feature in the DRM scheduler
> +	* Remove in-order completion assumptions from DRM scheduler
> +		* Even when using the DRM scheduler the backends will handle
> +		  preemption, timeslicing, etc... so it is possible for jobs to
> +		  finish out of order
> +	* Pull out i915 priority levels and use DRM priority levels
> +	* Optimize DRM scheduler as needed
> +
> +TODOs for GuC submission upstream
> +=================================
> +
> +* Need an update to GuC firmware / i915 to enable error state capture
> +* Open source tool to decode GuC logs
> +* Public GuC spec
> +
> +New uAPI for basic GuC submission
> +=================================
> +No major changes are required to the uAPI for basic GuC submission. The only
> +change is a new scheduler attribute: I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP.
> +This attribute indicates the 2k i915 user priority levels are statically mapped
> +into 3 levels as follows:
> +
> +* -1k to -1 Low priority
> +* 0 Medium priority
> +* 1 to 1k High priority
> +
> +This is needed because the GuC only has 4 priority bands. The highest priority
> +band is reserved with the kernel. This aligns with the DRM scheduler priority
> +levels too.
> +
> +Spec references:
> +----------------
> +* https://www.khronos.org/registry/EGL/extensions/IMG/EGL_IMG_context_priority.txt
> +* https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/chap5.html#devsandqueues-priority
> +* https://spec.oneapi.com/level-zero/latest/core/api.html#ze-command-queue-priority-t
> +
> +New parallel submission uAPI
> +============================
> +Details to come in a following patch.
> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
> index 05670442ca1b..91e93a705230 100644
> --- a/Documentation/gpu/rfc/index.rst
> +++ b/Documentation/gpu/rfc/index.rst
> @@ -19,3 +19,7 @@ host such documentation:
>   .. toctree::
>   
>       i915_gem_lmem.rst
> +
> +.. toctree::
> +
> +    i915_scheduler.rst
> 

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 257EA134269
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 13:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0475D6E267;
	Wed,  8 Jan 2020 12:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2E76E267;
 Wed,  8 Jan 2020 12:56:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 04:56:22 -0800
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; d="scan'208";a="233592883"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 04:56:20 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 intel-gfx <Intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Ebrahim Byagowi <ebrahim@gnu.org>
Subject: Re: Fwd: [PATCH] drm/i915: Fix enable OA report logic
In-Reply-To: <CAHp75Vdi35+9_4s1OzFRs-G0w0_vcAkKa2av_BWU+Axu1sYskg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <d24e431a-a5ca-6bb0-812c-bb368ee64876@gnu.org>
 <CAHp75Vdi35+9_4s1OzFRs-G0w0_vcAkKa2av_BWU+Axu1sYskg@mail.gmail.com>
Date: Wed, 08 Jan 2020 14:56:17 +0200
Message-ID: <87a76yqf7y.fsf@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Jan 2020, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> I forwarding this to a (sub)set of correct MLs/maintainers. Please,
> follow the instructions they give.

Thanks, already fixed by commit 9278bbb6e43c ("drm/i915/perf: Reverse a
ternary to make sparse happy") in our -next.

BR,
Jani.

>
> ---------- Forwarded message ---------
> From: Ebrahim Byagowi <ebrahim@gnu.org>
> Date: Mon, Dec 23, 2019 at 12:17 PM
> Subject: [PATCH] drm/i915: Fix enable OA report logic
> To: <platform-driver-x86@vger.kernel.org>
>
>
>
> Clang raises
>
>   drivers/gpu/drm/i915/i915_perf.c:2474:50: warning: operator '?:' has
> lower precedence than '|'; '|' will be evaluated first
> [-Wbitwise-conditional-parentheses]
>                              !(stream->sample_flags & SAMPLE_OA_REPORT) ?
>                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
>   drivers/gpu/drm/i915/i915_perf.c:2474:50: note: place parentheses
> around the '|' expression to silence this warning
>                              !(stream->sample_flags & SAMPLE_OA_REPORT) ?
>                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
>   drivers/gpu/drm/i915/i915_perf.c:2474:50: note: place parentheses
> around the '?:' expression to evaluate it first
>                              !(stream->sample_flags & SAMPLE_OA_REPORT) ?
>                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
>
> with -Wbitwise-conditional-parentheses and apparently is right
> as '|' is evaluated before '?:' which doesn't seem to be the intention
> here so let's put parentheses in the right place to fix it.
>
> Signed-off-by: Ebrahim Byagowi <ebrahim@gnu.org>
> ---
>  drivers/gpu/drm/i915/i915_perf.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 2ae14bc14931..db963f7c2e2e 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -2471,9 +2471,9 @@ static int gen12_enable_metric_set(struct
> i915_perf_stream *stream)
>                             * If the user didn't require OA reports,
> instruct the
>                             * hardware not to emit ctx switch reports.
>                             */
> -                          !(stream->sample_flags & SAMPLE_OA_REPORT) ?
> -
> _MASKED_BIT_ENABLE(GEN12_OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS) :
> -
> _MASKED_BIT_DISABLE(GEN12_OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS));
> +                          (!(stream->sample_flags & SAMPLE_OA_REPORT) ?
> +
> _MASKED_BIT_ENABLE(GEN12_OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS) :
> +
> _MASKED_BIT_DISABLE(GEN12_OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS)));
>
>         intel_uncore_write(uncore, GEN12_OAG_OAGLBCTXCTRL, periodic ?
>                            (GEN12_OAG_OAGLBCTXCTRL_COUNTER_RESUME |
> --
> 2.24.0

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

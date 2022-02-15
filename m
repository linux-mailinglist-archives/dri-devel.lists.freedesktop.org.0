Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BEC4B7405
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 18:17:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA48E10E1A4;
	Tue, 15 Feb 2022 17:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E12F10E1A4;
 Tue, 15 Feb 2022 17:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644945455; x=1676481455;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wYSE1d1KywOXWozIw3qtjar4Hm4wpZeg71RZfiDgbYU=;
 b=cruhXExMnt0NW0ADFz4zOfQ1O+dj9SeRiIw03rpidj2cJiKn/nFHZRl6
 RV1q3jNnmbRTRiU0PF0tZZXpjAM0tHnET1asTaggqSJsgsuOJ146K8Vay
 mHBQG6ESsc6uk5Y+13FeFyiDm0smJgHTPVLsuPkQXXR0wz5IkqidovcDC
 lJeOsowW0uJPqjmtdWXdZP+kJR95htwcaQYcUc1amYcQd2SmmNEzRtTnG
 L/EvEiydrREvoyW1jytd5Fo6DRpBm5USaRcLjBkl2wJZjjPqsGsCzQppz
 K5SEHrNq9kaBuxgswyRM0s4WSqNQGvMuVyHn1V/wl5efLfceGIOxPkOng w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="336833097"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="336833097"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 09:14:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="544392412"
Received: from ylian16-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.20.230])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 09:14:52 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] drm/i915/selftests: Replace too verbose for-loop
 with simpler while
In-Reply-To: <20220215163213.54917-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220215163213.54917-1-andriy.shevchenko@linux.intel.com>
Date: Tue, 15 Feb 2022 19:14:49 +0200
Message-ID: <87o83859x2.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Feb 2022, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> It's hard to parse for-loop which has some magic calculations inside.
> Much cleaner to use while-loop directly.

I assume you're trying to prove a point following our recent
for-vs-while loop discussion. I really can't think of any other reason
you'd end up looking at this file or this loop.

With the change, the loop indeed becomes simpler, but it also runs one
iteration further than the original. Whoops.

It's a selftest. The loop's been there for five years. What are we
trying to achieve here? So we disagree on loops, fine. Perhaps this is
not the best use of either of our time? Please just let the for loops in
i915 be.


BR,
Jani.

>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/selftests/i915_syncmap.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_syncmap.c b/drivers/gpu/drm/i915/selftests/i915_syncmap.c
> index 47f4ae18a1ef..26981d1c3025 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_syncmap.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_syncmap.c
> @@ -36,10 +36,10 @@ __sync_print(struct i915_syncmap *p,
>  	unsigned int i, X;
>  
>  	if (depth) {
> -		unsigned int d;
> +		unsigned int d = depth;
>  
> -		for (d = 0; d < depth - 1; d++) {
> -			if (last & BIT(depth - d - 1))
> +		while (d--) {
> +			if (last & BIT(d))
>  				len = scnprintf(buf, *sz, "|   ");
>  			else
>  				len = scnprintf(buf, *sz, "    ");

-- 
Jani Nikula, Intel Open Source Graphics Center

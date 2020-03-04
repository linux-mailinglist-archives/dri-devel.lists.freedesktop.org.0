Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C35178D61
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 10:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9BC6EAF9;
	Wed,  4 Mar 2020 09:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8956EAF9;
 Wed,  4 Mar 2020 09:27:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 01:27:30 -0800
X-IronPort-AV: E=Sophos;i="5.70,513,1574150400"; d="scan'208";a="233968196"
Received: from ohoehne-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.249.39.231])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 01:27:27 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH][next] drm: i915_drm.h: Replace zero-length array with
 flexible-array member
In-Reply-To: <20200303220636.GA2788@embeddedor>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200303220636.GA2788@embeddedor>
Date: Wed, 04 Mar 2020 11:27:27 +0200
Message-ID: <87h7z4pj0g.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 03 Mar 2020, "Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:

My earlier question about making the change in uapi was really about
potentially bumping up userspace compiler requirements, though I did not
actually say so. :)

I guess effectively uapi already requires C99 to build? And we
(i915_drm.h) have both [0] and []. So go for it.

What's your baseline? I think you've missed one instance of struct
i915_engine_class_instance engines[0];

BR,
Jani.


>
> struct foo {
>         int stuff;
>         struct boo array[];
> };
>
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
>
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
>
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
>
> This issue was found with the help of Coccinelle.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  include/uapi/drm/i915_drm.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 2813e579b480..413d923b332a 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1729,7 +1729,7 @@ struct i915_context_engines_load_balance {
>  
>  	__u64 mbz64; /* reserved for future use; must be zero */
>  
> -	struct i915_engine_class_instance engines[0];
> +	struct i915_engine_class_instance engines[];
>  } __attribute__((packed));
>  
>  #define I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(name__, N__) struct { \
> @@ -1767,7 +1767,7 @@ struct i915_context_engines_bond {
>  	__u64 flags; /* all undefined flags must be zero */
>  	__u64 mbz64[4]; /* reserved for future use; must be zero */
>  
> -	struct i915_engine_class_instance engines[0];
> +	struct i915_engine_class_instance engines[];
>  } __attribute__((packed));
>  
>  #define I915_DEFINE_CONTEXT_ENGINES_BOND(name__, N__) struct { \

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6E341D705
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 12:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC5E6E3D2;
	Thu, 30 Sep 2021 10:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C903D6E3D2;
 Thu, 30 Sep 2021 10:00:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03E24106F;
 Thu, 30 Sep 2021 03:00:10 -0700 (PDT)
Received: from [10.1.36.24] (e122027.cambridge.arm.com [10.1.36.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A57EE3F793;
 Thu, 30 Sep 2021 03:00:08 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] drm/i915/utils: do not depend on config being
 defined
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@intel.com>, dri-devel@lists.freedesktop.org, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
References: <20210929183357.1490204-1-lucas.demarchi@intel.com>
 <20210929183357.1490204-3-lucas.demarchi@intel.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <2dd723c8-6aed-857c-23f3-d0381fcb52c2@arm.com>
Date: Thu, 30 Sep 2021 11:00:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210929183357.1490204-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

On 29/09/2021 19:33, Lucas De Marchi wrote:
> Like the IS_ENABLED() counterpart, we can make IS_CONFIG_NONZERO() to
> return the right thing when the config is not defined rather than a
> build error, with the limitation that it can't be used on preprocessor
> context.
> 
> The trick here is that macro names can't start with a number or dash, so
> we stringify the argument and check that the first char is a number != 0
> (or starting with a dash to cover negative numbers). Except for -O0
> builds the strings are all eliminated.
> 
> Taking CONFIG_DRM_I915_REQUEST_TIMEOUT in
> drivers/gpu/drm/i915/gem/i915_gem_context.c as example, we have the
> following output of the preprocessor:
> 
> old:
>  if (((20000) != 0) &&
> new:
>  if (( ("20000"[0] > '0' && "20000"[0] < '9') || "20000"[0] == '-' ) &&
> 
> New one looks worse, but is also eliminated from the object:
> 
> $ size drivers/gpu/drm/i915/gem/i915_gem_context.o.*
>    text    data     bss     dec     hex filename
>   52021    1070     232   53323    d04b drivers/gpu/drm/i915/gem/i915_gem_context.o.new
>   52021    1070     232   53323    d04b drivers/gpu/drm/i915/gem/i915_gem_context.o.old
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_utils.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index 02bbfa4d68d3..436ce612c46a 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -28,6 +28,7 @@
>  #include <linux/list.h>
>  #include <linux/overflow.h>
>  #include <linux/sched.h>
> +#include <linux/stringify.h>
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>  
> @@ -469,6 +470,9 @@ static inline bool timer_expired(const struct timer_list *t)
>   *
>   * Returns 0 if @config is 0, 1 if set to any value.
>   */
> -#define IS_CONFIG_NONZERO(config) ((config) != 0)
> +#define IS_CONFIG_NONZERO(config) (						\
> +	(__stringify_1(config)[0] > '0' && __stringify_1(config)[0] < '9') ||	\

Shouldn't this be "<= '9'". Otherwise numbers starting with a 9 are not
"non zero".

Steve

> +	__stringify_1(config)[0] == '-'						\
> +)
>  
>  #endif /* !__I915_UTILS_H */
> 


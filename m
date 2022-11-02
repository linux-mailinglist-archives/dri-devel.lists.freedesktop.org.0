Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D540B616DDF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 20:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCD610E5A5;
	Wed,  2 Nov 2022 19:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5B110E5A2
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 19:33:35 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id g24so17550873plq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 12:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Is8uxYlhyk8bBxYXj/AJ+5Ed7risnbmV/bZZuRONlGw=;
 b=YgTo3g4CWnxassQXwnQGCJRK8UV2dkG1gd5qUAMt9TS//89B3+EgDk8JBHMqQRWbqE
 SasIIt6rr9pasf/tRkH/JpmtucjEENqYnz4Ij31JPs/tyYvKfhh0Xab/ZL8Kv52Brl9z
 k+6eHolz1b5J42Hw8E/CNYhE3n7UgliU9iEI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Is8uxYlhyk8bBxYXj/AJ+5Ed7risnbmV/bZZuRONlGw=;
 b=WaBas9ZrNJz1vUGdhuJxHG3iJXbjaeptnDSycchrZr20uHwcPZ2JqxRKgD7UvgxSDm
 JLMkdyvr6w+z8/DiyIxlbkIsRVosH34Kgxd865rsb+c5VkS5QO6d2aUGOsCcz76GvF8v
 GrWVkLSzX/sgwWG61AjE7+1+o4ADPCWiCxURUYUMiTsWjDoImO6o677yaOGWCg+re9Es
 k7xflIhHrbYcXX5NIA4xWBLbeF16VLC6iIRjn9EoSYtq08by4LzmJ9ZAsDfkQ8E0I/ge
 BC3M3OGGQetDvL1cxoESftyQVlskCt0kHbXjqqfn7+KMXd4mP2rXl7o8aD7Dg26C3omw
 SMoA==
X-Gm-Message-State: ACrzQf2mFmqueYlPXc/ON35A1x190+vuzdr/OuhhjgoUOJ5E93K6TmUZ
 IKInXTk5RPqzEyTetkt2DVKcAw==
X-Google-Smtp-Source: AMsMyM53U0WVK/IltYw2wXUwLPZJui+ftOfV8T9ZqcZx2iahytioyLerdzpOUR84Yg1+mPoG2ixzFA==
X-Received: by 2002:a17:902:7446:b0:186:a3a1:782d with SMTP id
 e6-20020a170902744600b00186a3a1782dmr26452013plt.76.1667417615186; 
 Wed, 02 Nov 2022 12:33:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b001811a197797sm8605891plp.194.2022.11.02.12.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:33:34 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:33:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH v5] overflow: Introduce overflows_type() and
 castable_to_type()
Message-ID: <202211021233.02BF0D38@keescook>
References: <20220926191109.1803094-1-keescook@chromium.org>
 <20221024201125.1416422-1-gwan-gyeong.mun@intel.com>
 <307b90cb-b80d-6ce3-14ae-4a0b2ee5e447@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <307b90cb-b80d-6ce3-14ae-4a0b2ee5e447@prevas.dk>
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
Cc: airlied@linux.ie, trix@redhat.com, dlatypov@google.com,
 dri-devel@lists.freedesktop.org, gustavoars@kernel.org,
 linux-hardening@vger.kernel.org, linux-sparse@vger.kernel.org,
 llvm@lists.linux.dev, arnd@kernel.org, intel-gfx@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, nathan@kernel.org,
 rodrigo.vivi@intel.com, mchehab@kernel.org, tvrtko.ursulin@linux.intel.com,
 mauro.chehab@linux.intel.com, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, vitor@massaru.org, luc.vanoostenryck@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 02, 2022 at 12:52:32PM +0100, Rasmus Villemoes wrote:
> On 24/10/2022 22.11, Gwan-gyeong Mun wrote:
> > From: Kees Cook <keescook@chromium.org>
> > 
> > Implement a robust overflows_type() macro to test if a variable or
> > constant value would overflow another variable or type. This can be
> > used as a constant expression for static_assert() (which requires a
> > constant expression[1][2]) when used on constant values. This must be
> > constructed manually, since __builtin_add_overflow() does not produce
> > a constant expression[3].
> > 
> > Additionally adds castable_to_type(), similar to __same_type(), but for
> > checking if a constant value would overflow if cast to a given type.
> > 
> 
> > +#define __overflows_type_constexpr(x, T) (			\
> > +	is_unsigned_type(typeof(x)) ?				\
> > +		(x) > type_max(typeof(T)) ? 1 : 0		\
> > +	: is_unsigned_type(typeof(T)) ?				\
> > +		(x) < 0 || (x) > type_max(typeof(T)) ? 1 : 0	\
> > +		: (x) < type_min(typeof(T)) ||			\
> > +		  (x) > type_max(typeof(T)) ? 1 : 0)
> > +
> 
> Can't all these instances of "foo ? 1 : 0" be simplified to "foo"? That
> would improve the readability of this thing somewhat IMO.

Oh, good point. :P I'll fix these.

-- 
Kees Cook

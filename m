Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A240CD2CCE
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 11:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CEA10E1AF;
	Sat, 20 Dec 2025 10:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fr9EQrsO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4F210E1AF
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 10:02:05 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso10418855e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 02:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766224924; x=1766829724; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6b6TgfZ4l4yfYsx0rUlhXwOOOgK1ZGgIr0RlxGtU3To=;
 b=Fr9EQrsONjNhPeUJanm0dHa61REE92IQgA/Bp7cxKGhhE8Wx9Q78zDUcMX7v9/EMuS
 zcdiZrVqseVd0nw0OFqqpGPMfYmbJZW4A7cPcW99MOYZojkbpuXhLBdxL54B2D+DjJxB
 FB45IeNmomH24r0RInyv6Im7vGNZB3cKmG999aBw14spo/1QfEPyGEpNAVoO3IzNSWUv
 5eNlhJ9awZfM4RgGY1kU0XXwXL4MW28o3kbpO4DGue/Cxtyp69HUaYrUZA5ZoBdPNETp
 p+CIqrAdwZK2i/7K/dcK8yFo+9i7nNkW1dbxtieTlK5jxrdJHtPDF+zJNGED73N3WEL4
 h0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766224924; x=1766829724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6b6TgfZ4l4yfYsx0rUlhXwOOOgK1ZGgIr0RlxGtU3To=;
 b=OB6jp3FearFDYNldE1BDz2RDCCEAHdwAldiE8VfDj6Cx6MTCJM+D4zmduU0WWKmjaC
 K4vCKdHbXDfwnqDHetwhtHzEdJ4Q0rxVvP5+QNYcj0x0wlBd+D2IbeRQxIv1qzt8m0Wx
 YYK/INgzNE84UD36/rHPAUSDomp98aoaVnf05dA1ft0gIodnVuz45GoR2rJDiems6nmN
 6E39iFRG9UlnK7DyMA2CbEY9FEm5dORYDDpGwCCJLBCv41bcx3+F15w+xddkELkA2ePf
 U0vdcSF8EczCW7gvs/ds34qb2i9Hj7ESUErHtyX3SsZEcUG1hYk5ow3Lg+G7LaNrTdQi
 mwtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUorcSlJYCPpSzeOa7DG7aRAxNcYcjWVcFNcX69F+GiX0DLMAApRx2OKsNYZtGuDyAqgzRHmz6CXv0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+2egzpRDr+x6qOk8+TxlEhZgib1dPhmzyNp5alv2Ufq+7G1DF
 ynDOvZ5fXbWb80m6xUlBNVcqN8gkN6FNDKOg+lOqR1vhkC48aJgN7dG/
X-Gm-Gg: AY/fxX6Gh0PHf6Y9isl9AMNMJ9N4U5k/IZMmkCpVz39tvWnFwh3uJYJ3Ox40mCWQiP4
 IOcTBcypn4JWwlu1hIKxmVMcz8AanVSA3lqLry+qSrlCoCBm2AT/3O95MqjIDOCoX71QEbR/K7A
 +7G8aWYhN/WtrA5v+4P3fVxNeAQqN6Ffa6fGaRPy4BgkuvdsWposMlouoYi8eIDmhPDrJLHaq/G
 GTO0NBX+WU8+riDJ/gGIV/MYyOIY9HvPXw+sdB/dUxIMA6wI22AXScuKgXhFqAd2e4Wy61viAqV
 pm73acTmADYBpzR/tIuiWAkjJ6woS0WMyF1gL7T/emtn2Z8vhhab6MlpFR2reGXTBQ5ihoLHodb
 dRq/pk8spYz6N3+wAWDTA4n2/5/NEvtrQII+NQ2WBhFRuFulsXqfNGEfZwR34ikPPX0rJZxLWBK
 lR2JCP1fimFIueffipKNYnQPqZPx3beTeXVqb9NWNP8cOKTeSuh43u
X-Google-Smtp-Source: AGHT+IHQOJ0Ua+zWZlb0QPcZUUI/HtzVKK9z+yFIQMbNJiEgWc0RnGqXX7qQpeO5IWGkqcyJJpZw3A==
X-Received: by 2002:a05:600c:1d1d:b0:471:d2f:7987 with SMTP id
 5b1f17b1804b1-47d1958f9c5mr48722805e9.26.1766224923818; 
 Sat, 20 Dec 2025 02:02:03 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab257asm9840402f8f.38.2025.12.20.02.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 02:02:03 -0800 (PST)
Date: Sat, 20 Dec 2025 10:02:01 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chris Mason
 <clm@fb.com>, David Sterba <dsterba@suse.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org,
 linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-btrfs@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 4/4] minmax: remove useless cast in __is_nonneg()
Message-ID: <20251220100201.26d9b0db@pumpkin>
In-Reply-To: <20251219-remove_wtype-limits-v2-4-2e92b3f566c5@kernel.org>
References: <20251219-remove_wtype-limits-v2-0-2e92b3f566c5@kernel.org>
 <20251219-remove_wtype-limits-v2-4-2e92b3f566c5@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 19 Dec 2025 23:39:48 +0100
Vincent Mailhol <mailhol@kernel.org> wrote:

> The function like macro __is_nonneg() casts its argument to (long long)
> in an attempt to silence -Wtype-limits warnings on unsigned values.

nak.

The cast is needed for pointer types, not for -Wtype-limits.
which is why the '#if __SIZEOF_POINTER__ == __SIZEOF_LONG_LONG__'
test is there.

	David

> 
> But this workaround is incomplete as proven here:
> 
>   $ cat foo.c
>   #include <linux/minmax.h>
> 
>   int foo(unsigned int a)
>   {
>   	return __is_nonneg(a);
>   }
>   $ make CFLAGS_KERNEL="-Wtype-limits" foo.o
>     CALL    scripts/checksyscalls.sh
>     DESCEND objtool
>     INSTALL libsubcmd_headers
>     CC      foo.o
>   foo.c: In function 'foo':
>   ./include/linux/minmax.h:68:57: warning: comparison is always true due to limited range of data type [-Wtype-limits]
>      68 | #define __is_nonneg(ux) statically_true((long long)(ux) >= 0)
>         |                                                         ^~
>   ./include/linux/compiler.h:350:50: note: in definition of macro 'statically_true'
>     350 | #define statically_true(x) (__builtin_constant_p(x) && (x))
>         |                                                  ^
>   foo.c:5:16: note: in expansion of macro '__is_nonneg'
>       5 |         return __is_nonneg(a);
>         |                ^~~~~~~~~~~
>   ./include/linux/minmax.h:68:57: warning: comparison is always true due to limited range of data type [-Wtype-limits]
>      68 | #define __is_nonneg(ux) statically_true((long long)(ux) >= 0)
>         |                                                         ^~
>   ./include/linux/compiler.h:350:57: note: in definition of macro 'statically_true'
>     350 | #define statically_true(x) (__builtin_constant_p(x) && (x))
>         |                                                         ^
>   foo.c:5:16: note: in expansion of macro '__is_nonneg'
>       5 |         return __is_nonneg(a);
>         |                ^~~~~~~~~~~
> 
> And because -Wtype-limits is now globally disabled, such a workaround
> now becomes useless. Remove the __is_nonneg()'s cast and its related
> comment.
> 
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> ---
> Changelog:
> 
>   v1 -> v2: new patch
> ---
>  include/linux/minmax.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/include/linux/minmax.h b/include/linux/minmax.h
> index a0158db54a04..3e2e3e539ba1 100644
> --- a/include/linux/minmax.h
> +++ b/include/linux/minmax.h
> @@ -52,9 +52,6 @@
>  /*
>   * Check whether a signed value is always non-negative.
>   *
> - * A cast is needed to avoid any warnings from values that aren't signed
> - * integer types (in which case the result doesn't matter).
> - *
>   * On 64-bit any integer or pointer type can safely be cast to 'long long'.
>   * But on 32-bit we need to avoid warnings about casting pointers to integers
>   * of different sizes without truncating 64-bit values so 'long' or 'long long'
> @@ -65,7 +62,7 @@
>   * but they are handled by the !is_signed_type() case).
>   */
>  #if __SIZEOF_POINTER__ == __SIZEOF_LONG_LONG__
> -#define __is_nonneg(ux) statically_true((long long)(ux) >= 0)
> +#define __is_nonneg(ux) statically_true((ux) >= 0)
>  #else
>  #define __is_nonneg(ux) statically_true( \
>  	(typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
> 


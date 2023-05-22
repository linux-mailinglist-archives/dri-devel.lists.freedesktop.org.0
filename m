Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2953C70CAA1
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5409510E374;
	Mon, 22 May 2023 20:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C504E10E374
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 20:16:04 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1ae3a5dfa42so45480255ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684786564; x=1687378564;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lqoDgNZ9G+pnENJHcgKxrrSDm2QXQ2DN2DVXwRpe84M=;
 b=THb6a7A4+ZDhhztCUfCFsPY/zH0txXyjC+97nEgRFTe1FP6hH7wG4Rx1Ek+S2QkeNF
 rROT12GKEBSriZA/G+nXPcCRbwKUoWabsNyX9y4bwg6gYnpx4jqfuiWo86AeIMljKk3j
 mtLnQUhAfjXjiVaWPWRf4oLQqhq9xk4iIH0sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684786564; x=1687378564;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lqoDgNZ9G+pnENJHcgKxrrSDm2QXQ2DN2DVXwRpe84M=;
 b=fbrqYWSKyZgf22Gbw09GV7QuCHjLyyUEOjlZ6jideQev9iFT+HXFzNwC/neQCsaUv3
 s0pszEL4uEDJ9dVkgz5EJ65a6blcJPk7bV1LL2IIoFgkCaerggatpau1Rx+ELHWJbACo
 GShZPwFWm/AC/d9gWNgUWiaA3yKN3uEK6GU5DHpAtwbYzbn6+kS1Hg+bJ2soObUjBHzX
 ptvaE1NhOcwItPjuUtqmIIB4MOTR1wj4cosecURLJ2dzRjGxiMUov2yEAe/PVZpBefJk
 BrsxQGtZTpwNmrqjSosjJf/mGxan6pMi2mJd34cKHvO0e6GgDKElhoQfV9OIoQvuPwLl
 TuKg==
X-Gm-Message-State: AC+VfDztNy0xQw429mCbGp4z8Ps2U9Z6vvIY1XawV5JjmQlkU6MdRsmI
 eUJS5Ld+vZvFqwvAoBWqs4mztw==
X-Google-Smtp-Source: ACHHUZ5SQz5k2SFL2blrf696wn78BpsNXHQRqB45l9/xGKDzmS28pRewvtArfVcejoeUFg//+tPPxA==
X-Received: by 2002:a17:90b:1003:b0:255:5bde:e6cc with SMTP id
 gm3-20020a17090b100300b002555bdee6ccmr5042944pjb.17.1684786564102; 
 Mon, 22 May 2023 13:16:04 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 ei13-20020a17090ae54d00b0024744818bc5sm6340408pjb.9.2023.05.22.13.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 13:16:03 -0700 (PDT)
Date: Mon, 22 May 2023 13:16:03 -0700
From: Kees Cook <keescook@chromium.org>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Subject: Re: [PATCH] drm/i915: Replace all non-returning strlcpy with strscpy
Message-ID: <202305221316.2817AA4FC@keescook>
References: <20230522155228.2336755-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522155228.2336755-1-azeemshaikh38@gmail.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, linux-hardening@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 03:52:28PM +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
> 
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

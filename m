Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C035EB1F9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 22:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E6310E077;
	Mon, 26 Sep 2022 20:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F44510E7AE
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 20:17:31 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id b75so7787527pfb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 13:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=LBF//pAX5WHcz7xdaQr4Nf4d4GrRr37crvjLDzbblIk=;
 b=Bji77umcsdJeihjx85Wx1yJAb732Oz1ZA1q21x7/tJcnTUW/8fZte+SBOWKRr2y2X4
 t7UYhPhE3DC/SUmvxlRXNayEpDUn6fkDZy7UDvvNDbtu4owhre655mCikZL0f8jsHtqv
 cGn9ctLsI5otDOKjNY0EQMprAXB1loNeikeBDNXuhf21Gc6YNSGymHqhwg97uF5tGFMe
 IZ94nsGJZnj+0Ru0uhnDDrRz3FETUQWktqxCIkpnHZcyY5l8qG/NsoDS/+XHrgbZsJr4
 SbniuV3EE/E7bFBu3CiLO4p6FpJn/FlCsxGzzDKgRIkz5AdRBT3N+leywHBff6krEQW8
 RNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=LBF//pAX5WHcz7xdaQr4Nf4d4GrRr37crvjLDzbblIk=;
 b=SL1jzTTYjv57zatz+us2ftSrglwXEeg4X/ymV0ukcrOtmbRCEAIgiFA0X/OdorSuLN
 gmirPdeycV5gUTFomZ3k63wMGStap5wz3Ux42V/bJ2jjlFgET+7K6oO3+aH7f5kJjkXp
 +fnoH9F5/Z0DsHSpq3cUeLZMHg1OgSjdACthdefrNNEaj85p8eL1KJetvIWnb7X3Vflj
 YHfJUYqu3HEUvNpo7qezpi4riaL2dYeQ2Z08o/LHva9ViEG6eMtpvW5z3z5qNi/nCGJe
 TpUoYIEey0McG5APlaorEOWrXNpvy5l4q1PuJNaf/SkBPDGuF+PdklEJYlT6Q9GzSC6V
 dUvg==
X-Gm-Message-State: ACrzQf32X1ZuV8GDc1jhbvNZteQO0hkBjXJwnm5dIa5HaL6O0Je3lcDG
 KKbX03/Rnvixkvv+JBkoCgNqvcXtrkieD5Bm/z92yg==
X-Google-Smtp-Source: AMsMyM5Uwpd0MxiH9sRDQzapR2kQfL6PV2oxZumBsqYgeO5TWDHdWVPWGZZxNuX11VhdUYgOQnkrigoKWNVoBnjDEtY=
X-Received: by 2002:a63:2cd2:0:b0:41c:5901:67d8 with SMTP id
 s201-20020a632cd2000000b0041c590167d8mr21300624pgs.365.1664223450163; Mon, 26
 Sep 2022 13:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220926191109.1803094-1-keescook@chromium.org>
In-Reply-To: <20220926191109.1803094-1-keescook@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 26 Sep 2022 13:17:18 -0700
Message-ID: <CAKwvOdmCjAQpaF40VStbFNf1ZqmTxTTZzy2v4TwSF0LVO08GYw@mail.gmail.com>
Subject: Re: [PATCH v2] overflow: Introduce overflows_type() and
 castable_to_type()
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@kernel.org>, David Airlie <airlied@linux.ie>,
 Tom Rix <trix@redhat.com>, Daniel Latypov <dlatypov@google.com>,
 llvm@lists.linux.dev, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-sparse@vger.kernel.org,
 linux-hardening@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org, Vitor Massaru Iha <vitor@massaru.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Arnd

On Mon, Sep 26, 2022 at 12:11 PM Kees Cook <keescook@chromium.org> wrote:
> ---
> v2:
>  - fix comment typo
>  - wrap clang pragma to avoid GCC warnings
>  - style nit cleanups
>  - rename __castable_to_type() to castable_to_type()
>  - remove prior overflows_type() definition
> v1: https://lore.kernel.org/lkml/20220926003743.409911-1-keescook@chromium.org
> diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
> index f385ca652b74..fffc3f86181d 100644
> --- a/lib/overflow_kunit.c
> +++ b/lib/overflow_kunit.c
> @@ -16,6 +16,11 @@
>  #include <linux/types.h>
>  #include <linux/vmalloc.h>
>
> +/* We're expecting to do a lot of "always true" or "always false" tests. */
> +#ifdef CONFIG_CC_IS_CLANG
> +#pragma clang diagnostic ignored "-Wtautological-constant-out-of-range-compare"
> +#endif

Any chance we can reuse parts of __diag_ignore or __diag_clang from
include/linux/compiler_types.h or include/linux/compiler-clang.h
respectively?

Those are needed for pragmas within preprocessor macros, which we
don't have here, but I suspect they may be more concise to use here.

> +#define TEST_SAME_TYPE(t1, t2, same)                   do {    \
> +       typeof(t1) __t1h = type_max(t1);                        \
> +       typeof(t1) __t1l = type_min(t1);                        \
> +       typeof(t2) __t2h = type_max(t2);                        \
> +       typeof(t2) __t2l = type_min(t2);                        \

Can we use __auto_type here rather than typeof(macro expansion)?
-- 
Thanks,
~Nick Desaulniers

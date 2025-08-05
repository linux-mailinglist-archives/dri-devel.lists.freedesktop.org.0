Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EE4B1B742
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 17:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F59C10E6AB;
	Tue,  5 Aug 2025 15:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="MT4lr8pY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1B710E6AD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 15:18:25 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-707389a2fe3so55390386d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 08:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754407104; x=1755011904;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ei2suQoiKM6jZ+vrvxUS6sJAz8bgwy+vg3WdcqYInd4=;
 b=MT4lr8pYt4RXuhXHIknaKgQN93FlL+DLSoo7tpxSIOceBztgb0eBijvHmxq5DmUVz7
 V8HYOFEMOgkXO7SQS1Qgq1Pz6uL6oJkF6eoYoGC+Ka5yBn1FSXusDiKD3lkwaSn2VjYv
 MbAKlBvs/ghkYDKsUhLtgwDgnqonAbMZiRvUlptLGB/nCDHjTqcRMhK+R6skCGGVWI7W
 mSHJrP6wEBffE8oFab4JqXVw1CjM7147EQ1dlV36RG8hH/KyTN/Ps1jAMILSOtjaUpTE
 ALeKzO8JHyJ/E1nLm21hIUcFXSzi7zojp0yx1Fa4mSkfSL4ryc9SbIVs53bOZxiybV0O
 zdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754407104; x=1755011904;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ei2suQoiKM6jZ+vrvxUS6sJAz8bgwy+vg3WdcqYInd4=;
 b=GWH69sPrLql9wpZFOkRfO54A7FE/ZXQKn4Klewovk2TOIO6id5yJTZwuYgTiQq7lTf
 Vdu6RocN0kn1TiK5OXmaMS73dM4xT6xrVBrDi/wA6HD0CGU48Reub20Hs/+eZ2GJEIdO
 qmXPpWdh4sdcjfC3KgpTRHts8HeJMV8c4Wdldyds9NKHiLn+1spEUivu7lcL+p1ioeFa
 qhqyzaDxOjuCR+PPJYO1t1KSz9Ea2u4MKX78ufV3cOJ0zA2U0xwrFF5uP2rnGCO1pqmi
 VvCYxA7JpV6rsVc1jE4daxSoOPz6p0CZVEdkCFmehBAsl3KMhVzv1Mp4raQtPjB5SKSd
 4WXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXO4LNqHpJVotYkKqqpAqcCFsR837q3hdh4YSTqui0iuuwDdJmgexCHDr9/VyIhfU2Pg+qfJ2f62Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmO/Yl+qs5EiHsaeqEbLnaxGiIBNbJfI26nbCPPz3C2xD/jZxI
 R+m6JOO8ByhHrjE1ie5umClF+hbHDFDQ+d4a0S9bPtUhdrf5moTVpVCUPHEWO+mmUIHR1ViYuUV
 gGRjQ4hGJxoGgfUGJgI/2DLrMfH8j8hu9OF0TQnM8
X-Gm-Gg: ASbGnctSF+ufZSJt4pKgPp/Kv8nHHoI980yhjjUkKwCRPwmFcB0iHn8IB4Rh3+OScfF
 TH9o/IR//WHg9Nu0Flx5OqMtr+fBdpwWLybrd0HPbyYtpLLKuEdPofDFJss8xJK07Ju4iDJfSkD
 SdyNonuv4wAyQU1L53hBisCmA0D4PfLYAw3odz85NYVhPXyjcp6OM1m92fWZ2ob0Ewvcj4V2kNI
 X7IosdLUHL9UDzRAG3e4hQtzWc2uckt0SiWQJ/OYA==
X-Google-Smtp-Source: AGHT+IGlWdT5T+vrtEukolYStRP1zGethFLAlqa7L7jsXqEu+52gbiouMhUNWLt2Xp/Xbd7hHUETokSfoCGI9lBDsso=
X-Received: by 2002:ad4:5c62:0:b0:707:6302:90aa with SMTP id
 6a1803df08f44-7093626d773mr195026586d6.27.1754407103617; Tue, 05 Aug 2025
 08:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
 <20250729193647.3410634-4-marievic@google.com>
In-Reply-To: <20250729193647.3410634-4-marievic@google.com>
From: Rae Moar <rmoar@google.com>
Date: Tue, 5 Aug 2025 11:18:12 -0400
X-Gm-Features: Ac12FXz9W5TjaYltj_nslVN8LL6euuV8WCMgJLzVdBjdaff9DG8lUm24r6Pqnn8
Message-ID: <CA+GJov5Faik_aBzDO6QY3Rj_ycq=A6ZqOsuP-m6G1n3jtpNCYg@mail.gmail.com>
Subject: Re: [PATCH 3/9] kunit: Pass additional context to generate_params for
 parameterized testing
To: Marie Zhussupova <marievic@google.com>
Cc: davidgow@google.com, shuah@kernel.org, brendan.higgins@linux.dev, 
 elver@google.com, dvyukov@google.com, lucas.demarchi@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 kasan-dev@googlegroups.com, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jul 29, 2025 at 3:37=E2=80=AFPM Marie Zhussupova <marievic@google.c=
om> wrote:
>
> To enable more complex parameterized test scenarios,
> the `generate_params` function sometimes needs additional
> context beyond just the previously generated parameter.
> This patch modifies the `generate_params` function signature
> to include an extra `struct kunit *test` argument, giving
> users access to the parent kunit test's context when
> generating subsequent parameters.
>
> The `struct kunit *test` argument was added as the first parameter
> to the function signature as it aligns with the convention
> of other KUnit functions that accept `struct kunit *test` first.
> This also mirrors the "this" or "self" reference found
> in object-oriented programming languages.
>
> Signed-off-by: Marie Zhussupova <marievic@google.com>

Hello!

Extremely happy about this change. This will provide us much more
flexibility when defining test parameters. Thank you for this
implementation!

Reviewed-by: Rae Moar <rmoar@google.com>


-Rae

> ---
>  include/kunit/test.h | 9 ++++++---
>  lib/kunit/test.c     | 5 +++--
>  2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index d8dac7efd745..4ba65dc35710 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -128,7 +128,8 @@ struct kunit_attributes {
>  struct kunit_case {
>         void (*run_case)(struct kunit *test);
>         const char *name;
> -       const void* (*generate_params)(const void *prev, char *desc);
> +       const void* (*generate_params)(struct kunit *test,
> +                                      const void *prev, char *desc);
>         struct kunit_attributes attr;
>
>         /*
> @@ -1701,7 +1702,8 @@ do {                                               =
                              \
>   * Define function @name_gen_params which uses @array to generate parame=
ters.
>   */
>  #define KUNIT_ARRAY_PARAM(name, array, get_desc)                        =
                       \
> -       static const void *name##_gen_params(const void *prev, char *desc=
)                      \
> +       static const void *name##_gen_params(struct kunit *test,         =
                       \
> +                                            const void *prev, char *desc=
)                      \
>         {                                                                =
                       \
>                 typeof((array)[0]) *__next =3D prev ? ((typeof(__next)) p=
rev) + 1 : (array);      \
>                 if (__next - (array) < ARRAY_SIZE((array))) {            =
                       \
> @@ -1722,7 +1724,8 @@ do {                                               =
                              \
>   * Define function @name_gen_params which uses @array to generate parame=
ters.
>   */
>  #define KUNIT_ARRAY_PARAM_DESC(name, array, desc_member)                =
                       \
> -       static const void *name##_gen_params(const void *prev, char *desc=
)                      \
> +       static const void *name##_gen_params(struct kunit *test,         =
                       \
> +                                            const void *prev, char *desc=
)                      \
>         {                                                                =
                       \
>                 typeof((array)[0]) *__next =3D prev ? ((typeof(__next)) p=
rev) + 1 : (array);      \
>                 if (__next - (array) < ARRAY_SIZE((array))) {            =
                       \
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index d80b5990d85d..f50ef82179c4 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -696,7 +696,7 @@ int kunit_run_tests(struct kunit_suite *suite)
>                         /* Get initial param. */
>                         param_desc[0] =3D '\0';
>                         /* TODO: Make generate_params try-catch */
> -                       curr_param =3D test_case->generate_params(NULL, p=
aram_desc);
> +                       curr_param =3D test_case->generate_params(&test, =
NULL, param_desc);
>                         test_case->status =3D KUNIT_SKIPPED;
>                         kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT =
KUNIT_SUBTEST_INDENT
>                                   "KTAP version 1\n");
> @@ -727,7 +727,8 @@ int kunit_run_tests(struct kunit_suite *suite)
>
>                                 /* Get next param. */
>                                 param_desc[0] =3D '\0';
> -                               curr_param =3D test_case->generate_params=
(curr_param, param_desc);
> +                               curr_param =3D test_case->generate_params=
(&test, curr_param,
> +                                                                       p=
aram_desc);
>                         }
>                 }
>
> --
> 2.50.1.552.g942d659e1b-goog
>

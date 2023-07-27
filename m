Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E237765FE4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 00:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702E810E62D;
	Thu, 27 Jul 2023 22:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3B710E62D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 22:49:20 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-794cddcab71so668379241.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690498159; x=1691102959;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7NYvlsFz+3bTMfsTHbgY87g/2XWXC64dEH3md2UPJ6g=;
 b=bEhEEN4aoXgcgHk+7n4UIOPmdxMoQPFwdze+KHGhhUBZ5Ak4zM9xoDWKBQegUlH/o7
 BStTXrDJWU2jomd5NOCIoRJGqSxTBQaJTtKUEW8eIg4sPZVH8sUwSxz51RS2evN/OEh9
 zJwPquuESOUYwnk5GyJlbxbtXxtv3gVbrQCB8zee/hny6Oz8lg0yh/V4tjE4kjKTkwMX
 B9PClknNpeEICAlRKvJE+8th8h16OyO3xNr+1/gCRnbIVJYbEiy4yvZor+W8JIaMJZk8
 m76qHkVn4y6ZWmBNkEVRZfKgOZ3T46OqYVOtF4eHpP6NBy7u2rlntuIEcQiVresy9Nl1
 ieSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690498159; x=1691102959;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7NYvlsFz+3bTMfsTHbgY87g/2XWXC64dEH3md2UPJ6g=;
 b=Q6weHANs6BkFFVj3MWovLPduWTPjyOViCYWZO/27vwGKY8JpIP3YJRsv+NJnAlgdg+
 mh9weBabjyRALKa0DH+/Cq87Sd1E19Uq24dH8ZP/lrxGdJDtbH9oOF30Oq87Qt7wNKUW
 ByrnNr3lBiNKJnRGqJ2hEeSUfDh7AMQZXTOBLiSzF0WRb+60Z0MTFv9EAivZ1UIL/5nV
 3kPmEuOTpTH1PrE7LMSRyt5FTygt8PQqCYiPrn9sxquPRYjypFM7mpVCxCQ1sJ8FSbxs
 1yiex1AkQ5UeaYYZxnNEWH83DdiXNO/PAExHaY48jeXQ6KyscT77+Be36lj+uw9RCSAu
 a/vg==
X-Gm-Message-State: ABy/qLZG4rM9JnSuEqxts8jdOnlBgI4b0Y/EX3CYmR8DpGj8zmQmeYi7
 jThvMb+7fTj+9GCyu6Zdn5abQl08bn91/IfJfhKEUw==
X-Google-Smtp-Source: APBJJlG5eey1nYvnY0wcglb8pf7X62F5klJT4/NorDW09IyuqZbR3TF0CFSBVUD8fKyYR8ID3jyhQ9/thieq5ybt0NQ=
X-Received: by 2002:a67:fb46:0:b0:443:70ec:d28b with SMTP id
 e6-20020a67fb46000000b0044370ecd28bmr845103vsr.19.1690498159357; Thu, 27 Jul
 2023 15:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230727-amdgpu-v1-1-a95690e75388@google.com>
In-Reply-To: <20230727-amdgpu-v1-1-a95690e75388@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 27 Jul 2023 15:49:07 -0700
Message-ID: <CAKwvOdnQJcn_9h1v6b9JBNG+Mj-WczMOXmjiS9TnxUrqMjTQZQ@mail.gmail.com>
Subject: Re: [PATCH] drm: fix indirect goto into statement expression UB
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>
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
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 3:47=E2=80=AFPM <ndesaulniers@google.com> wrote:
>
> A new diagnostic in clang-17 now produces the following build error:
>
> drivers/gpu/drm/tests/drm_exec_test.c:41:3: error: cannot jump from this
> indirect goto statement to one of its possible targets
>    41 |                 drm_exec_retry_on_contention(&exec);
>       |                 ^
> include/drm/drm_exec.h:96:4: note: expanded from macro
> 'drm_exec_retry_on_contention'
>    96 |                         goto *__drm_exec_retry_ptr;
>       |                         ^
> drivers/gpu/drm/tests/drm_exec_test.c:39:2: note: possible target of
> indirect goto statement
>    39 |         drm_exec_until_all_locked(&exec) {
>       |         ^
> include/drm/drm_exec.h:79:33: note: expanded from macro
> 'drm_exec_until_all_locked'
>    79 |                 __label__ __drm_exec_retry;
> drivers/gpu/drm/tests/drm_exec_test.c:39:2: note: jump enters a
> statement expression
>
> The GCC manually currently states that:
> >> Jumping into a statement expression with a computed goto (see Labels
> >> as Values) has undefined behavior.
>
> So the diagnostic appears correct, even if codegen happened to produce
> working code.
>
> Looking closer at this code, while the original combination of statement
> expression, local label, and computed/indirect goto GNU C expressions
> were clever, a simple while loop and continue block might have sufficed.
>
> This approach might not work as expected if drm_exec_until_all_locked
> "loops" can be nested, but that doesn't appear to be an existing use
> case in the codebase.
>
> Fixes: commit 09593216bff1 ("drm: execution context for GEM buffers v7")
> Link: https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html
> Link: https://github.com/ClangBuiltLinux/linux/issues/1890
> Link: https://github.com/llvm/llvm-project/commit/20219106060208f0c2f5d09=
6eb3aed7b712f5067
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  include/drm/drm_exec.h | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index 73205afec162..393ac022ed3a 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -70,18 +70,9 @@ struct drm_exec {
>   * Core functionality of the drm_exec object. Loops until all GEM object=
s are
>   * locked and no more contention exists. At the beginning of the loop it=
 is
>   * guaranteed that no GEM object is locked.
> - *
> - * Since labels can't be defined local to the loops body we use a jump p=
ointer
> - * to make sure that the retry is only used from within the loops body.
>   */
>  #define drm_exec_until_all_locked(exec)                                \
> -       for (void *__drm_exec_retry_ptr; ({                     \
> -               __label__ __drm_exec_retry;                     \
> -__drm_exec_retry:                                              \
> -               __drm_exec_retry_ptr =3D &&__drm_exec_retry;      \
> -               (void)__drm_exec_retry_ptr;                     \
> -               drm_exec_cleanup(exec);                         \
> -       });)
> +       while(drm_exec_cleanup(exec))
>
>  /**
>   * drm_exec_retry_on_contention - restart the loop to grap all locks
> @@ -93,7 +84,7 @@ __drm_exec_retry:                                      =
       \
>  #define drm_exec_retry_on_contention(exec)                     \
>         do {                                                    \
>                 if (unlikely(drm_exec_is_contended(exec)))      \
> -                       goto *__drm_exec_retry_ptr;             \
> +                       continue;                               \

d'oh that's going to continue the do {} while(0) ... let me send a v2...

>         } while (0)
>
>  /**
>
> ---
> base-commit: 451cc82bd11eb6a374f4dbcfc1cf007eafea91ab
> change-id: 20230727-amdgpu-93c0e5302951
>
> Best regards,
> --
> Nick Desaulniers <ndesaulniers@google.com>
>


--=20
Thanks,
~Nick Desaulniers

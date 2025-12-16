Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5C4CC3D42
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 16:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2511810E12D;
	Tue, 16 Dec 2025 15:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KZyvvlYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A6A10E12D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 15:09:07 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2a110548f10so4191575ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 07:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765897747; x=1766502547; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TBQ+KEKtZFBQW9f8fhCsIZyeGJB9EoLToMD3vA7Aj08=;
 b=KZyvvlYvIZiRdhBFiDZlc0RZYJuZX0mSD4bviS9it8Lrvt58u+Invo7QI/6fYFlXRn
 un32SXESy9VpubS05vW17bUqWs3tTBfgt8sGEbL/sAiWyFUrIHM9dNdXG+I35z5Chna9
 dZmIgqrVOdcedBRnNiFHvvvd7NA8oOt/AtJUMp2q1D/yllX8AgK2ZePo1AewboOy+wRN
 6BI7dib6YE/2wtEXsX6O1Rccz9+jQUEjfMdWNuzrL3OwHBmUuaBVs16jFHQW/C7u/2xk
 1k5bVZwwbVaoi91VroIwLoLPPMncMwADqym0oozHczvoO6Sb3Kj5W4lyrAiguGb+MmrM
 r20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765897747; x=1766502547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TBQ+KEKtZFBQW9f8fhCsIZyeGJB9EoLToMD3vA7Aj08=;
 b=VETEn/fcndK9VFhThz7bmdi8BFwhWusWW9JPakrVnpyTXYZYr/wKtmzvfvjengewCh
 /0L5A5L7RTIKo8ncJ0r9FkBTquNsyGvUBDv4O9Sq9+wsjYiI6JQhMP7MZJrpPyB6WRMz
 I8d+Afkm+rcTVlHFuV6SYjTdkkKbu+mTQrPB6tNcJVxHDd2NdeK4RsBcIVAYkHN6ZbsB
 gpMujWx+hANkmI12py6c2zKMJKTMq4LGkl6hpaNRi8CJ3iQYjB1XP5JtehZSbVh0mYjh
 lEBF2oxJzMNZ+AyEfkdzfmEonCg5nklwvKMq3sMtyuFz8zeXtnnMVbAOIaxDm6KHt5/K
 YBgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRP59VfmC8rsmT+ZVK+q7Z7hP6UiqDbh6yLVRT/1sPlS8vU2e2zJ1aBLx7rq1YJ36Ka+DnbvoGkpo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIJMi3o1VfyE7Fn7YM1nuGfffAO6GfOUg4IiCSG0SeelCmZLmu
 I+Ae5uZxSm+TBK8qoUO0Rm0+CliwEbPIgJ696XNq+vhaReKobCq6DYJAcXJIVp9ak5khUROLoMi
 LCwfF74zEQHHNQxEHNPxFPWBVDBUHlro=
X-Gm-Gg: AY/fxX4qGqXjbtdEllwf3Cd38k1SXNSJ72RJt/UcJcjbG/L8U9emDsQ4LC2rC7Z/F0Z
 igUgKcX/uAwqb6HzIj3LNUcd/PlPXryqkif7lhZcV97GZ/OL7u40btiXDFU2hk0dzX5qDUi4rdG
 1QOdTh41psZluZJDEEC6ETDpWTX60FZG2mtO/2/wI8FZjV5c7+7WVMY3KVtm81elFWwVY9rB/VG
 XIrgnV24wLIsweQoii1xXQmZ1/K7GC5Jl9aDFqSdFYNqSQfMSfDyQtOwjjF9hyLEDdq3MYtRSdk
 LH78ZoE=
X-Google-Smtp-Source: AGHT+IE06XFlmMgvXerznAhzoCBIgwCI6cVyUE2Vj6xD/o7J8s5VveIDQEUmJl1xe3ToLTKUn/phA5QKg6FpsbGtWOw=
X-Received: by 2002:a05:7022:fa2:b0:11b:862d:8031 with SMTP id
 a92af1059eb24-11f34874285mr6126769c88.0.1765897746571; Tue, 16 Dec 2025
 07:09:06 -0800 (PST)
MIME-Version: 1.0
References: <20251213-dml-bump-frame-warn-clang-sanitizers-v1-1-0e91608db9eb@kernel.org>
In-Reply-To: <20251213-dml-bump-frame-warn-clang-sanitizers-v1-1-0e91608db9eb@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Dec 2025 10:08:55 -0500
X-Gm-Features: AQt7F2qcbLgX7_41oZokd-Bui00GaFx0PuQiAfWWLBHHuXsoZHZJuKEIq9MvOX0
Message-ID: <CADnq5_OHj3Vz1uVKer8AKH+h3jthM=FE+hCJ=M=xFox65sxcHw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Apply e4479aecf658 to dml
To: Nathan Chancellor <nathan@kernel.org>
Cc: Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, stable@vger.kernel.org
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

Applied.  Thanks!

On Sat, Dec 13, 2025 at 1:16=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> After an innocuous optimization change in clang-22, allmodconfig (which
> enables CONFIG_KASAN and CONFIG_WERROR) breaks with:
>
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.=
c:1724:6: error: stack frame size (3144) exceeds limit (3072) in 'dml32_Mod=
eSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>    1724 | void dml32_ModeSupportAndSystemConfigurationFull(struct display=
_mode_lib *mode_lib)
>         |      ^
>
> With clang-21, this function was already pretty close to the existing
> limit of 3072 bytes.
>
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.=
c:1724:6: error: stack frame size (2904) exceeds limit (2048) in 'dml32_Mod=
eSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>    1724 | void dml32_ModeSupportAndSystemConfigurationFull(struct display=
_mode_lib *mode_lib)
>         |      ^
>
> A similar situation occurred in dml2, which was resolved by
> commit e4479aecf658 ("drm/amd/display: Increase sanitizer frame larger
> than limit when compile testing with clang") by increasing the limit for
> clang when compile testing with certain sanitizer enabled, so that
> allmodconfig (an easy testing target) continues to work.
>
> Apply that same change to the dml folder to clear up the warning for
> allmodconfig, unbreaking the build.
>
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2135
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/dc/dml/Makefile | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/dr=
m/amd/display/dc/dml/Makefile
> index b357683b4255..268b5fbdb48b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -30,7 +30,11 @@ dml_rcflags :=3D $(CC_FLAGS_NO_FPU)
>
>  ifneq ($(CONFIG_FRAME_WARN),0)
>      ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> -        frame_warn_limit :=3D 3072
> +        ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
> +            frame_warn_limit :=3D 4096
> +        else
> +            frame_warn_limit :=3D 3072
> +        endif
>      else
>          frame_warn_limit :=3D 2048
>      endif
>
> ---
> base-commit: f24e96d69f5b9eb0f3b9c49e53c385c50729edfd
> change-id: 20251213-dml-bump-frame-warn-clang-sanitizers-0a34fc916aec
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>

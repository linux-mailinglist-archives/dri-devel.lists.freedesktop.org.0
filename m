Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7800A2D0D4A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 10:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C62C89DE5;
	Mon,  7 Dec 2020 09:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E7C89DE5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 09:45:45 +0000 (UTC)
Date: Mon, 07 Dec 2020 09:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607334343;
 bh=nfbfYES3vlQev1zpC2g1Fw2jEQFnC9MERngJ8u0E1FE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=BU2ZJ3ZDoA9ZoAfQvlCIpiFM9qIJmKQ+7qDXjOB7qdlSuGrIpDeo9H51W9M3J7N4J
 fLn0vaMyNxCdHFLhVFYTdF867pTDOONTtwsdhqVicFYJV+/1uPTj4wA1nHs5Pc+YNJ
 snwj8fv19/b/A7mo3MLYy5I+J+i3iFuqWBMBC504N9vqwFw5z1Sg4h+6T+BsDk+rOT
 3i7shAQAK41ihwg44sIdOnfl7xCgkMmlj0Z/+v1OkH4pUiD1vPg0c2pM+bHDhkclUA
 kHKpdknjwlBajh3zi8g81bze4FGg4NVI7EHva0va/+M/m1G1GdK4SycX7+MWb2jS/x
 y/2QkyMZQP5gw==
To: James Park <jpark37@lagfreegames.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
Message-ID: <V01BVRDu5ULkPDHO-WKC98pTaPlU3acbwd99o01-R6bWW0sO9SVlKjTo8l-bvUd6C1BwJafiZGBQ5XeWMFPteVDoc0bURCtVCu2A8IVau3w=@emersion.fr>
In-Reply-To: <1607215171-36-2-git-send-email-jpark37@lagfreegames.com>
References: <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
 <1607215171-36-1-git-send-email-jpark37@lagfreegames.com>
 <1607215171-36-2-git-send-email-jpark37@lagfreegames.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sunday, December 6th, 2020 at 1:39 AM, James Park <jpark37@lagfreegames.com> wrote:

> Create drm_basic_types.h to define types previously defined by drm.h.
>
> Use DRM_FOURCC_STANDALONE to include drm_fourcc.h, replacing drm.h
> dependency with drm_basic_types.h.

This approach looks better to me than the other alternatives.

> This will allow Mesa to port code to Windows more easily.
>
> Signed-off-by: James Park <jpark37@lagfreegames.com>
> ---
>  include/uapi/drm/drm.h             | 14 ++--------
>  include/uapi/drm/drm_basic_types.h | 52 ++++++++++++++++++++++++++++++++++++++
>  include/uapi/drm/drm_fourcc.h      |  4 +++
>  3 files changed, 58 insertions(+), 12 deletions(-)
>  create mode 100644 include/uapi/drm/drm_basic_types.h
>
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 808b48a..a7f38fc 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -36,32 +36,22 @@
>  #ifndef _DRM_H_
>  #define _DRM_H_
>
> +#include "drm_basic_types.h"
> +
>  #if defined(__KERNEL__)
>
> -#include <linux/types.h>
>  #include <asm/ioctl.h>
>  typedef unsigned int drm_handle_t;
>
>  #elif defined(__linux__)
>
> -#include <linux/types.h>
>  #include <asm/ioctl.h>
>  typedef unsigned int drm_handle_t;
>
>  #else /* One of the BSDs */
>
> -#include <stdint.h>
>  #include <sys/ioccom.h>
>  #include <sys/types.h>
> -typedef int8_t   __s8;
> -typedef uint8_t  __u8;
> -typedef int16_t  __s16;
> -typedef uint16_t __u16;
> -typedef int32_t  __s32;
> -typedef uint32_t __u32;
> -typedef int64_t  __s64;
> -typedef uint64_t __u64;
> -typedef size_t   __kernel_size_t;
>  typedef unsigned long drm_handle_t;
>
>  #endif
> diff --git a/include/uapi/drm/drm_basic_types.h b/include/uapi/drm/drm_basic_types.h
> new file mode 100644
> index 0000000..b3c00bb
> --- /dev/null
> +++ b/include/uapi/drm/drm_basic_types.h
> @@ -0,0 +1,52 @@
> +/*
> + * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
> + * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
> + * All rights reserved.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#ifndef _DRM_BASIC_TYPES_H_
> +#define _DRM_BASIC_TYPES_H_
> +
> +#if defined(__KERNEL__)
> +
> +#include <linux/types.h>
> +
> +#elif defined(__linux__)

Nit: these two #ifs can be combined together.

> +#include <linux/types.h>
> +
> +#else /* One of the BSDs */

Maybe replace with /* Not Linux */?

> +#include <stdint.h>
> +typedef int8_t   __s8;
> +typedef uint8_t  __u8;
> +typedef int16_t  __s16;
> +typedef uint16_t __u16;
> +typedef int32_t  __s32;
> +typedef uint32_t __u32;
> +typedef int64_t  __s64;
> +typedef uint64_t __u64;
> +typedef size_t   __kernel_size_t;
> +
> +#endif
> +
> +#endif
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 82f3278..5eb07a5 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -24,7 +24,11 @@
>  #ifndef DRM_FOURCC_H
>  #define DRM_FOURCC_H
>
> +#ifdef DRM_FOURCC_STANDALONE
> +#include "drm_basic_types.h"
> +#else
>  #include "drm.h"
> +#endif
>
>  #if defined(__cplusplus)
>  extern "C" {
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

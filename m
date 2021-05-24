Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204BE38F1BA
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 18:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54E46E8D6;
	Mon, 24 May 2021 16:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55E46E8CF;
 Mon, 24 May 2021 16:46:24 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id s12so11873718qta.3;
 Mon, 24 May 2021 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MQmBssjPsUtpDE9GBpD1aczql94NKYN/XiQEp1XJLz0=;
 b=MK3kPDg6zlGJfH+vfNJhjgak4lAvbkC5299fz/gt485KvoKv6/0UBJ+dRJ3O+Q7Ddm
 hJ/J5rCeG4NH0arBFWmV3Y2yAsx5chzAAxs+gcYI9oV6hT/iTTVSeUgJcclkPcqTqHvq
 S/cPVm0+hWiWUgxRf3eosTtxiZOxkCDs+sUR4x6cgwoUl5H+lWU9MgHHXwHbbJdygCh2
 SpfUTqOdwDLjezl57WTjCt553w423vQ9U3Rm7oIl+dk+hI+qgJxS/MQwAoHcpAJSITJV
 kRD0Is+UufZ0v8pwtXaY9L6khXDDVNfqw91CQqfHgA1bbN2isYPgDWT1sUjvxPgjVOa8
 N5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MQmBssjPsUtpDE9GBpD1aczql94NKYN/XiQEp1XJLz0=;
 b=PXY8VytP2SQNK96yU49NHeZ+hRDJGQEVOuMaEQxu94V6QpENsf7vC7v7W9DUp8JHpL
 OSXXscWNG624fi8hDPra8peFE6WOxd0xfcaOfym+KMlKSnvsb48OvHMyIj+rVsFnOAJe
 UTRa0+KkXjhx5+JTz8uRubcqA0OzetK1yDAG9muTbhN+QyM21qDYanOb88S+6J0DstDe
 gaCu9H4PFhhYIUvGxXPqsWDfcwdI/EyUrQYngDQpRlpSvy6TYhajYXWKPdG8LwBhyZnV
 7+kq1lXrs77ikSKh9Yy9cTvhArbXaiejc2Au8A3DvKaA/TJWV7oCaIr2CD+HAYgnztms
 eodQ==
X-Gm-Message-State: AOAM5318zGlPjtUxELHKLBwTYtfq/nxY/3frumpR3GCwYAMk3fvto933
 i5sl8V4LOmU4qs3+gUxYU0rq+TOj2tLMfIIWXsw=
X-Google-Smtp-Source: ABdhPJzQWUt3+VClwnFef0YSts2d7QcfvgAswlEaCUf1qsZ9UHaEdWyAqJl3wHiUWIGJWunYGgJDrkYix9uHw4Cszqg=
X-Received: by 2002:ac8:60d:: with SMTP id d13mr28265498qth.223.1621874784123; 
 Mon, 24 May 2021 09:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210521153253.518037-1-thomas.hellstrom@linux.intel.com>
 <20210521153253.518037-8-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210521153253.518037-8-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 24 May 2021 17:45:58 +0100
Message-ID: <CAM0jSHNqr-kUGsRaBavEvk3w-vr_SRrdSzQb4y-CDYrFnQgXdQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 07/12] drm, drm/i915: Move the
 memcpy_from_wc functionality to core drm
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 May 2021 at 16:33, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Memcpy from wc will be used as well by TTM memcpy.
> Move it to core drm, and make the interface do the right thing
> even on !X86.
>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@gmail.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---

<snip>

> +
> +#ifdef CONFIG_X86
> +bool drm_memcpy_from_wc(void *dst, const void *src, unsigned long len);
> +bool drm_memcpy_from_wc_dbm(struct dma_buf_map *dst,
> +                           const struct dma_buf_map *src,
> +                           unsigned long len);
> +void drm_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned l=
ong len);
> +
> +/* The movntdqa instructions used for memcpy-from-wc require 16-byte ali=
gnment,
> + * as well as SSE4.1 support. drm_memcpy_from_wc() will report if it can=
not
> + * perform the operation. To check beforehand, pass in the parameters to
> + * drm_can_memcpy_from_wc() - since we only care about the low 4 bits,
> + * you only need to pass in the minor offsets, page-aligned pointers are
> + * always valid.
> + *
> + * For just checking for SSE4.1, in the foreknowledge that the future us=
e
> + * will be correctly aligned, just use drm_has_memcpy_from_wc().
> + */
> +#define drm_can_memcpy_from_wc(dst, src, len) \
> +       drm_memcpy_from_wc((void *)((unsigned long)(dst) | (unsigned long=
)(src) | (len)), NULL, 0)
> +
> +#define drm_has_memcpy_from_wc() \
> +       drm_memcpy_from_wc(NULL, NULL, 0)
> +
> +void drm_memcpy_init_early(void);
> +
> +#else
> +
> +#define drm_memcpy_from_wc(_dst, _src, _len) (false)
> +#define drm_memcpy_from_wc_dbm(_dst, _src, _len) (false)
> +#define drm_can_memcpy_from_wc(_dst, _src, _len) (false)
> +#define drm_has_memcpy_from_wc() (false)

Does the compiler not complain for these on !x86, if called without
checking the result of the statement? Maybe just make these function
stubs?

Otherwise,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +#define drm_unaligned_memcpy_from_wc(_dst, _src, _len) WARN_ON(1)
> +#define drm_memcpy_init_early() do {} while (0)
> +#endif /* CONFIG_X86 */
> +#endif /* __DRM_MEMCPY_H__ */
> --
> 2.31.1
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

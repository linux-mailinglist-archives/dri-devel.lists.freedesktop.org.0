Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAEB38F2C7
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 20:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E660D6E214;
	Mon, 24 May 2021 18:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4406E214;
 Mon, 24 May 2021 18:12:28 +0000 (UTC)
IronPort-SDR: Uom0dkArOJsA1fqx3sQkH//72xcf6lkRZz8XDBITzsSFzlv9XEKxxsRVK5NRgcuddpmbv9t/P3
 Wc8JPznMVVrA==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="223155277"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="223155277"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 11:12:28 -0700
IronPort-SDR: MzMrCTn+8MtjrwfYKbbu/od2RURmBiVbMlUuQsB7YxDVefBLGLkeEc+1a1FJlOr5Q6TGYzyvXi
 4vig1xd+o14A==
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="475997705"
Received: from clanggaa-mobl1.ger.corp.intel.com ([10.249.254.179])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 11:12:26 -0700
Message-ID: <ba5cc30d2f5208aab3a7df8d9799f0c310f9989e.camel@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 07/12] drm, drm/i915: Move the
 memcpy_from_wc functionality to core drm
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 24 May 2021 20:12:23 +0200
In-Reply-To: <CAM0jSHNqr-kUGsRaBavEvk3w-vr_SRrdSzQb4y-CDYrFnQgXdQ@mail.gmail.com>
References: <20210521153253.518037-1-thomas.hellstrom@linux.intel.com>
 <20210521153253.518037-8-thomas.hellstrom@linux.intel.com>
 <CAM0jSHNqr-kUGsRaBavEvk3w-vr_SRrdSzQb4y-CDYrFnQgXdQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2021-05-24 at 17:45 +0100, Matthew Auld wrote:
> On Fri, 21 May 2021 at 16:33, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
> > 
> > Memcpy from wc will be used as well by TTM memcpy.
> > Move it to core drm, and make the interface do the right thing
> > even on !X86.
> > 
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Dave Airlie <airlied@gmail.com>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> 
> <snip>
> 
> > +
> > +#ifdef CONFIG_X86
> > +bool drm_memcpy_from_wc(void *dst, const void *src, unsigned long
> > len);
> > +bool drm_memcpy_from_wc_dbm(struct dma_buf_map *dst,
> > +                           const struct dma_buf_map *src,
> > +                           unsigned long len);
> > +void drm_unaligned_memcpy_from_wc(void *dst, const void *src,
> > unsigned long len);
> > +
> > +/* The movntdqa instructions used for memcpy-from-wc require 16-
> > byte alignment,
> > + * as well as SSE4.1 support. drm_memcpy_from_wc() will report if
> > it cannot
> > + * perform the operation. To check beforehand, pass in the
> > parameters to
> > + * drm_can_memcpy_from_wc() - since we only care about the low 4
> > bits,
> > + * you only need to pass in the minor offsets, page-aligned
> > pointers are
> > + * always valid.
> > + *
> > + * For just checking for SSE4.1, in the foreknowledge that the
> > future use
> > + * will be correctly aligned, just use drm_has_memcpy_from_wc().
> > + */
> > +#define drm_can_memcpy_from_wc(dst, src, len) \
> > +       drm_memcpy_from_wc((void *)((unsigned long)(dst) |
> > (unsigned long)(src) | (len)), NULL, 0)
> > +
> > +#define drm_has_memcpy_from_wc() \
> > +       drm_memcpy_from_wc(NULL, NULL, 0)
> > +
> > +void drm_memcpy_init_early(void);
> > +
> > +#else
> > +
> > +#define drm_memcpy_from_wc(_dst, _src, _len) (false)
> > +#define drm_memcpy_from_wc_dbm(_dst, _src, _len) (false)
> > +#define drm_can_memcpy_from_wc(_dst, _src, _len) (false)
> > +#define drm_has_memcpy_from_wc() (false)
> 
> Does the compiler not complain for these on !x86, if called without
> checking the result of the statement? Maybe just make these function
> stubs?
> 
> Otherwise,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Hmm, you're right. I'll fix. Thanks for reviewing!

/Thomas



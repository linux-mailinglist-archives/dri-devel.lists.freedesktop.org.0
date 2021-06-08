Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1673A0127
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 21:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7014A6EABF;
	Tue,  8 Jun 2021 19:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370266EABF;
 Tue,  8 Jun 2021 19:01:12 +0000 (UTC)
IronPort-SDR: MU7rknGy4AaxDHDzTKxoNDbUyrmsvw8s+9nUajZbzjYGPVpQ+4WwMyxwAZB+fUTfyfSVOMAKz+
 qZIzwDkM4uVw==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="184602392"
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; d="scan'208";a="184602392"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 12:01:05 -0700
IronPort-SDR: 7FlSl1gt3av8cE+PgD5/CzkP+wPhY8wY7xkiZ6AMokpAPM1ZtoC55PJkzMVW7kPlOBPwykZfbK
 PG4ZL6Bkbgkg==
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; d="scan'208";a="440586084"
Received: from arajji-mobl.ger.corp.intel.com (HELO [10.249.254.90])
 ([10.249.254.90])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 12:01:01 -0700
Message-ID: <5f4fbc762eb8560b468c6d4bcce70348eca57ca7.camel@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/9] drm/i915: Introduce a ww transaction
 helper
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 08 Jun 2021 21:00:58 +0200
In-Reply-To: <CAM0jSHOyOtORECkqjYuiCncj=rFrgUeoXP4DNvxBxkF2nBmFpg@mail.gmail.com>
References: <20210608092846.64198-1-thomas.hellstrom@linux.intel.com>
 <20210608092846.64198-4-thomas.hellstrom@linux.intel.com>
 <CAM0jSHOyOtORECkqjYuiCncj=rFrgUeoXP4DNvxBxkF2nBmFpg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-06-08 at 18:17 +0100, Matthew Auld wrote:
> On Tue, 8 Jun 2021 at 10:29, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
> > 
> > Introduce a for_i915_gem_ww(){} utility to help make the code
> > around a ww transaction more readable.
> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_gem_ww.h | 31
> > +++++++++++++++++++++++++++++-
> >  1 file changed, 30 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_gem_ww.h
> > b/drivers/gpu/drm/i915/i915_gem_ww.h
> > index f2d8769e4118..f6b1a796667b 100644
> > --- a/drivers/gpu/drm/i915/i915_gem_ww.h
> > +++ b/drivers/gpu/drm/i915/i915_gem_ww.h
> > @@ -11,11 +11,40 @@ struct i915_gem_ww_ctx {
> >         struct ww_acquire_ctx ctx;
> >         struct list_head obj_list;
> >         struct drm_i915_gem_object *contended;
> > -       bool intr;
> > +       unsigned short intr;
> > +       unsigned short loop;
> 
> Why are these now unsigned short?
> 
That's because I once got a harsh comment making some changes to the
core mutex code where I happened to stuff bools in the struct ww_mutex,
and was told that it was bad style putting bools in compound data types
in the linux kernel.

There's no checkpatch.pl checks for that though...

> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> >  };
> > 
> >  void i915_gem_ww_ctx_init(struct i915_gem_ww_ctx *ctx, bool intr);
> >  void i915_gem_ww_ctx_fini(struct i915_gem_ww_ctx *ctx);
> >  int __must_check i915_gem_ww_ctx_backoff(struct i915_gem_ww_ctx
> > *ctx);
> >  void i915_gem_ww_unlock_single(struct drm_i915_gem_object *obj);
> > +
> > +/* Internal functions used by the inlines! Don't use. */
> > +static inline int __i915_gem_ww_fini(struct i915_gem_ww_ctx *ww,
> > int err)
> > +{
> > +       ww->loop = 0;
> > +       if (err == -EDEADLK) {
> > +               err = i915_gem_ww_ctx_backoff(ww);
> > +               if (!err)
> > +                       ww->loop = 1;
> > +       }
> > +
> > +       if (!ww->loop)
> > +               i915_gem_ww_ctx_fini(ww);
> > +
> > +       return err;
> > +}
> > +
> > +static inline void
> > +__i915_gem_ww_init(struct i915_gem_ww_ctx *ww, bool intr)
> > +{
> > +       i915_gem_ww_ctx_init(ww, intr);
> > +       ww->loop = 1;
> > +}
> > +
> > +#define for_i915_gem_ww(_ww, _err, _intr)                      \
> > +       for (__i915_gem_ww_init(_ww, _intr); (_ww)->loop;       \
> > +            _err = __i915_gem_ww_fini(_ww, _err))
> > +
> >  #endif
> > --
> > 2.31.1
> > 
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx



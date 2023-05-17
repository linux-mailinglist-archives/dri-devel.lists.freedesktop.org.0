Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E03706EF2
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 19:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD90710E127;
	Wed, 17 May 2023 17:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19C410E127;
 Wed, 17 May 2023 17:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684342998; x=1715878998;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RZEcdw0n+wSEuOnmF0nicbByFX6z1wWU3WJ0adZ2GDg=;
 b=HwgMbZspY0f2w3YFb5MfPyxWh/X3toQJKwISTBvY79IYrwW4D7mGsnpI
 F5PaT1i8WT4Vdt350AFFHFJMnkJEs9wJqkY4HGF9GnhLb5OtPycIjS6nB
 emmsxkyCjB9Nvp6IcZ3JSmjCATBH763ZwIQsEoh48St4wg7OXcNmVX0Yw
 TnXwFcblJrSY2ETpK05vnrJ4LCnHU5Pq1FGHNj8FfL+FZwJRFc2Fplo4I
 hg2hIMb3amdi7itToma6AzeS+cCVrBKV5LXD4nbknzEnczfsg+pjaH0th
 yhasfH9S12a3KK7k36E/abLFo02ybmjRP7KzE675dUdZid8ORTPwQQWIB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="341209910"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="341209910"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 10:03:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="826037839"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="826037839"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO [10.249.254.183])
 ([10.249.254.183])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 10:03:13 -0700
Message-ID: <79df281c4b74ef7de401b6f93ea65301377a5319.camel@linux.intel.com>
Subject: Re: [PATCH v5 1/7] drm: fix drmm_mutex_init()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Stanislaw Gruszka
 <stanislaw.gruszka@linux.intel.com>
Date: Wed, 17 May 2023 19:03:10 +0200
In-Reply-To: <dcaf0964-3264-6a35-469d-75ff520d5f6b@intel.com>
References: <20230517152244.348171-1-matthew.auld@intel.com>
 <20230517160523.GA607652@linux.intel.com>
 <dcaf0964-3264-6a35-469d-75ff520d5f6b@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-05-17 at 17:29 +0100, Matthew Auld wrote:
> On 17/05/2023 17:05, Stanislaw Gruszka wrote:
> > On Wed, May 17, 2023 at 04:22:38PM +0100, Matthew Auld wrote:
> > > In mutex_init() lockdep seems to identify a lock by defining a
> > > static
> > > key for each lock class. However if we wrap the whole thing in a
> > > function the static key will be the same for everything calling
> > > that
> > > function, which looks to be the case for drmm_mutex_init(). This
> > > then
> > > results in impossible lockdep splats since lockdep thinks
> > > completely
> > > unrelated locks are the same lock class. The other issue is that
> > > when
> > > looking at splats we lose the actual lock name, where instead of
> > > seeing
> > > something like xe->mem_access.lock for the name, we just see
> > > something
> > > generic like lock#8.
> > >=20
> > > Attempt to fix this by converting drmm_mutex_init() into a macro,
> > > which
> > > should ensure that mutex_init() behaves as expected.
> >=20
> > Nice catch :-) we observed lockdep deadlock false alarms too, but I
> > could
> > not spot it out and were adding lockdep_set_class(key) to avoid
> > those.
> >=20
> >=20
> > > +static inline void __drmm_mutex_release(struct drm_device *dev,
> > > void *res)
> >=20
> > Can this be inline if used in drmm_add_action_or_reset() ?
>=20
> I think so. Did I missing something here? It at least builds for me.

I think in each file that contains a drmm_mutex_init(), the code will
need a pointer to the function __drmm_mutex_release() and the compiler
will therefore need to emit a non-inlined static version of the
function in that file. Not sure if that's a problem, though. If so
could make it extern?

/Thomas



>=20
> >=20
> >=20
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct mutex *lock =3D res=
;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_destroy(lock);
> > > +}
> > > +
> > > +/**
> > > + * drmm_mutex_init - &drm_device-managed mutex_init()
> > > + * @dev: DRM device
> > > + * @lock: lock to be initialized
> > > + *
> > > + * Returns:
> > > + * 0 on success, or a negative errno code otherwise.
> > > + *
> > > + * This is a &drm_device-managed version of mutex_init(). The
> > > initialized
> > > + * lock is automatically destroyed on the final drm_dev_put().
> > > + */
> > > +#define drmm_mutex_init(dev, lock)
> > > ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_init(lock);=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drmm_add_action_or_reset(d=
ev, __drmm_mutex_release,
> > > lock);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > +})=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >=20
> > Regards
> > Stanislaw
> >=20
> >=20


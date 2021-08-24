Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E0D3F5B6C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 11:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E4789C49;
	Tue, 24 Aug 2021 09:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE94D898B7;
 Tue, 24 Aug 2021 09:52:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="302859410"
X-IronPort-AV: E=Sophos;i="5.84,346,1620716400"; d="scan'208";a="302859410"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 02:52:37 -0700
X-IronPort-AV: E=Sophos;i="5.84,346,1620716400"; d="scan'208";a="526567561"
Received: from kmulhall-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.39.114])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 02:52:34 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YSPyNZ3I1LgvDYSw@Ryzen-9-3900X.localdomain>
References: <20210813171158.2665823-1-nathan@kernel.org>
 <YSPyNZ3I1LgvDYSw@Ryzen-9-3900X.localdomain>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftest: Fix use of err in
 igt_reset_{fail, nop}_engine()
Cc: John Harrison <John.C.Harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Nathan Chancellor <nathan@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <162979875184.5663.3119766810404831323@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Tue, 24 Aug 2021 12:52:31 +0300
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

Quoting Nathan Chancellor (2021-08-23 22:08:37)
> Ping? This is a pretty clear bug and it is not fixed in -next or
> drm-intel at this point.

Pushed to drm-intel-gt-next with my R-b.

Regards, Joonas

> On Fri, Aug 13, 2021 at 10:11:58AM -0700, Nathan Chancellor wrote:
> > Clang warns:
> >=20
> > In file included from drivers/gpu/drm/i915/gt/intel_reset.c:1514:
> > drivers/gpu/drm/i915/gt/selftest_hangcheck.c:465:62: warning: variable
> > 'err' is uninitialized when used here [-Wuninitialized]
> >         pr_err("[%s] Create context failed: %d!\n", engine->name, err);
> >                                                                   ^~~
> > ...
> > drivers/gpu/drm/i915/gt/selftest_hangcheck.c:580:62: warning: variable
> > 'err' is uninitialized when used here [-Wuninitialized]
> >         pr_err("[%s] Create context failed: %d!\n", engine->name, err);
> >                                                                   ^~~
> > ...
> > 2 warnings generated.
> >=20
> > This appears to be a copy and paste issue. Use ce directly using the %pe
> > specifier to pretty print the error code so that err is not used
> > uninitialized in these functions.
> >=20
> > Fixes: 3a7b72665ea5 ("drm/i915/selftest: Bump selftest timeouts for han=
gcheck")
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >  drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu=
/drm/i915/gt/selftest_hangcheck.c
> > index 08f011f893b2..2c1ed32ca5ac 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> > @@ -462,7 +462,7 @@ static int igt_reset_nop_engine(void *arg)
> > =20
> >               ce =3D intel_context_create(engine);
> >               if (IS_ERR(ce)) {
> > -                     pr_err("[%s] Create context failed: %d!\n", engin=
e->name, err);
> > +                     pr_err("[%s] Create context failed: %pe!\n", engi=
ne->name, ce);
> >                       return PTR_ERR(ce);
> >               }
> > =20
> > @@ -577,7 +577,7 @@ static int igt_reset_fail_engine(void *arg)
> > =20
> >               ce =3D intel_context_create(engine);
> >               if (IS_ERR(ce)) {
> > -                     pr_err("[%s] Create context failed: %d!\n", engin=
e->name, err);
> > +                     pr_err("[%s] Create context failed: %pe!\n", engi=
ne->name, ce);
> >                       return PTR_ERR(ce);
> >               }
> > =20
> >=20
> > base-commit: 927dfdd09d8c03ba100ed0c8c3915f8e1d1f5556
> > --=20
> > 2.33.0.rc2

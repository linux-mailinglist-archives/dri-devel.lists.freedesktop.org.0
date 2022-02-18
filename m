Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF1E4BB733
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64CE10F276;
	Fri, 18 Feb 2022 10:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DED10F24B;
 Fri, 18 Feb 2022 10:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645181209; x=1676717209;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:cc:from:to:subject:message-id:date;
 bh=Fa27J8k+mkzEXrxibrfM5fTTtM6r08rFkYCcasdmglc=;
 b=eHD4IMprRhfHGsed+G5/B5mKtMddb/6vVzkEivUu2uFFdxPELkiDAZ7/
 Lajtpp/g7L5skcdIfMlJUIgESKrkTK8Jl0eEDP0i8AiPgBFPf/d+HYAaw
 PClAgibAKj+pneeDHXWC56hGub5k1Pm/FoGV2NVQ4D9f3TgqOZ68KxUn9
 HW50ZqMOqucICqpeaO+bODVbd9dV5JnD9UmWnecwQ4aU1CvxTvIEqucKY
 RFv+bfAQZ0Wq9bEx36yN/6aHe5VTdKd0jkojjrVpIBWmJVDbnH3KySRLK
 gZrWGCLSBfCj1JITSSZc8akwCcbKI3ZFBfj+wDSBFR6Ph3ijf50JDPJar Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="314367628"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="314367628"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:46:49 -0800
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="546231552"
Received: from acangian-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.45.92])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:46:46 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Yg5vlgoTEfJRWP9U@intel.intel>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-6-andi.shyti@linux.intel.com>
 <12c2fcf8-ef3b-e59c-fe1e-23bc8f12cfe5@linux.intel.com>
 <Yg5vlgoTEfJRWP9U@intel.intel>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 5/7] drm/i915/gt: Create per-tile RC6 sysfs
 interface
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <164518120389.6218.14670990912373168491@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Fri, 18 Feb 2022 12:46:43 +0200
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Andi Shyti (2022-02-17 17:53:58)
> Hi Tvrtko,
>=20
> > > Now tiles have their own sysfs interfaces under the gt/
> > > directory. Because RC6 is a property that can be configured on a
> > > tile basis, then each tile should have its own interface
> > >=20
> > > The new sysfs structure will have a similar layout for the 4 tile
> > > case:
> > >=20
> > > /sys/.../card0
> > >           \u251c\u2500\u2500 gt
> > >           \u2502=C2=A0=C2=A0 \u251c\u2500\u2500 gt0
> > >           \u2502=C2=A0=C2=A0 \u2502=C2=A0=C2=A0 \u251c\u2500\u2500 id
> > >           \u2502=C2=A0=C2=A0 \u2502=C2=A0=C2=A0 \u251c\u2500\u2500 rc=
6_enable
> > >           \u2502=C2=A0=C2=A0 \u2502=C2=A0=C2=A0 \u251c\u2500\u2500 rc=
6_residency_ms
> > >           .   .   .
> > >           .   .   .
> > >           .   .
> > >           \u2502=C2=A0=C2=A0 \u2514\u2500\u2500 gtN
> > >           \u2502=C2=A0=C2=A0     \u251c\u2500\u2500 id
> > >           \u2502=C2=A0=C2=A0     \u251c\u2500\u2500 rc6_enable
> > >           \u2502=C2=A0=C2=A0     \u251c\u2500\u2500 rc6_residency_ms
> > >           \u2502       .
> > >           \u2502       .
> > >           \u2502
> > >           \u2514\u2500\u2500 power/                -+
> > >                \u251c\u2500\u2500 rc6_enable        |    Original int=
erface
> > >                \u251c\u2500\u2500 rc6_residency_ms  +->  kept as exis=
ting ABI;
> > >                .                     |    it multiplexes over
> > >                .                     |    the GTs
> > >                                     -+
> > >=20
> > > The existing interfaces have been kept in their original location
> > > to preserve the existing ABI. They act on all the GTs: when
> > > reading they provide the average value from all the GTs.
> >=20
> > Average feels very odd to me. I'd ask if we can get away providing an e=
rrno
> > instead? Or tile zero data?

Tile zero data is always wrong, in my opinion. If we have round-robin
scaling workloads like some media cases, part of the system load might
just disappear when it goes to tile 1.

> Real multiplexing would be providing something when reading and
> when writing. The idea of average came while revieweing with
> Chris the write multiplexing. Indeed it makes sense to provide
> some common value, but I don't know how useful it can be to the
> user (still if the user needs any average).

I think all read/write controls like min/max/boost_freq should return
an error from the global interface if all the tiles don't return same
value. Write will always overwrite per-tile values.

When we have frequency readbacks without control, returning MAX() across
tiles would be the logical thing. The fact that parts of the hardware can
be clocked lower when one part is fully utilized is the "new feature".

After that we're only really left with the rc6_residency_ms. And that is
the tough one. I'm inclined that MIN() across tiles would be the right
answer. If you are fully utilizing a single tile, you should be able to
see it.

This all would be what feels natural for an user who has their setup
tuned for single-tile device. And would allow simple round-robing
balancing across the tiles in somewhat coherent manner.

Regards, Joonas

>=20
> Joonas, Chris... any idea?
>=20
> > Case in point, and please correct me if I am wrong, legacy rc6_enable
> > returns tile zero, while residency returns average.
>=20
> As the interface is done now, the rc6_enable is just returning
> whether the gpu (i.e. i915, not gt) supports RC6 or not. I think
> there is a patch later.
>=20
> > Even the deprecated message gets logged with every access right?
> >=20
> > Btw is the deperecated message limited to multi-tile platforms (can't s=
ee
> > that it is) and what is the plan for that?
>=20
> yes, at this point the message would need to be removed and I
> forgot to do it.
>=20
> > It's a tough problem, no easy answers even after all this time. :D
>=20
> yeah! quite hard to get it conceptually right!
>=20
> Thanks Tvrtko,
> Andi

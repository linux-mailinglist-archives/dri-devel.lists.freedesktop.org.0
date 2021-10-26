Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1870843AEBE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 11:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E99189EA9;
	Tue, 26 Oct 2021 09:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1BF89EA9;
 Tue, 26 Oct 2021 09:11:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="217029911"
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; d="scan'208";a="217029911"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 02:11:15 -0700
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; d="scan'208";a="446654974"
Received: from scelesti-mobl.amr.corp.intel.com (HELO localhost)
 ([10.249.254.162])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 02:11:13 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <fd148c6c-4bd9-6a28-f096-80d9a41778fc@intel.com>
References: <20211025163404.2774-1-matthew.brost@intel.com>
 <fd148c6c-4bd9-6a28-f096-80d9a41778fc@intel.com>
Subject: Re: [PATCH] drm/i915/trace: Hide backend specific fields behind
 Kconfig
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: daniele.ceraolospurio@intel.com
To: John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <163523947144.6968.10786796223069147391@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Tue, 26 Oct 2021 12:11:11 +0300
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

Quoting John Harrison (2021-10-26 00:06:54)
> On 10/25/2021 09:34, Matthew Brost wrote:
> > Hide the guc_id and tail fields, for request trace points, behind
> > CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS Kconfig option. Trace points
> > are ABI (maybe?) so don't change them without kernel developers Kconfig
> > options.
> The i915 sw arch team have previously hard blocked requests for changes=20
> to trace points from user land tool developers on the grounds that trace =

> points are not ABI and are free to change at whim as and when the i915=20
> internal implementation changes. They are purely for use of developers=20
> to debug the i915 driver as the i915 driver currently stands at any=20
> given instant.

Correct. That is indicated by the LOW_LEVEL_TRACEPOINTS.

All the discussions about stable usage really revolve around the low level
backend specific scheduling tracepoints to analyze hardware utilization.
And those even become infeasible to expose when GuC scheduling is enabled
as the information really goes to GuC log.

Luckily we have added the mechanism to get the actual utilization
through OA via gpuvis tool, so we don't have to guesstimate it from the
KMD scheduling tracepoints (which are for KMD debugging).

> So I don't see how it can be argued that we must not update any trace=20
> points to allow for debugging of i915 scheduling issues on current=20
> platforms. And having to enable extra config options just to keep=20
> existing higher level trace points usable seems broken.

We can update them (even outside LOW_LEVEL_TRACEPOINTS) but there should
not be any backend specific data added outside the LOW_LEVEL_TRACEPOINTS,
just to prevent anyone from starting to use them in some
visualization/analysis tooling.

If you have the energy to drive the general LKML/Linux Plumbers level
discussion about tracepoint stability limbo into a conclusion, I'll be
more than happy to see it resolved :)

Regards, Joonas

>=20
> John.
>=20
>=20
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/i915_trace.h | 27 +++++++++++++++++++++++++++
> >   1 file changed, 27 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i=
915_trace.h
> > index 9795f456cccf..4f5238d02b51 100644
> > --- a/drivers/gpu/drm/i915/i915_trace.h
> > +++ b/drivers/gpu/drm/i915/i915_trace.h
> > @@ -787,6 +787,7 @@ TRACE_EVENT(i915_request_queue,
> >                     __entry->ctx, __entry->seqno, __entry->flags)
> >   );
> >  =20
> > +#if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS)
> >   DECLARE_EVENT_CLASS(i915_request,
> >           TP_PROTO(struct i915_request *rq),
> >           TP_ARGS(rq),
> > @@ -816,6 +817,32 @@ DECLARE_EVENT_CLASS(i915_request,
> >                     __entry->guc_id, __entry->ctx, __entry->seqno,
> >                     __entry->tail)
> >   );
> > +#else
> > +DECLARE_EVENT_CLASS(i915_request,
> > +         TP_PROTO(struct i915_request *rq),
> > +         TP_ARGS(rq),
> > +
> > +         TP_STRUCT__entry(
> > +                          __field(u32, dev)
> > +                          __field(u64, ctx)
> > +                          __field(u16, class)
> > +                          __field(u16, instance)
> > +                          __field(u32, seqno)
> > +                          ),
> > +
> > +         TP_fast_assign(
> > +                        __entry->dev =3D rq->engine->i915->drm.primary=
->index;
> > +                        __entry->class =3D rq->engine->uabi_class;
> > +                        __entry->instance =3D rq->engine->uabi_instanc=
e;
> > +                        __entry->ctx =3D rq->fence.context;
> > +                        __entry->seqno =3D rq->fence.seqno;
> > +                        ),
> > +
> > +         TP_printk("dev=3D%u, engine=3D%u:%u, ctx=3D%llu, seqno=3D%u",
> > +                   __entry->dev, __entry->class, __entry->instance,
> > +                   __entry->ctx, __entry->seqno)
> > +);
> > +#endif
> >  =20
> >   DEFINE_EVENT(i915_request, i915_request_add,
> >            TP_PROTO(struct i915_request *rq),
>=20

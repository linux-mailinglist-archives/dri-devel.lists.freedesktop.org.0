Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF95543C885
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 13:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC7D6E889;
	Wed, 27 Oct 2021 11:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0DF6E889;
 Wed, 27 Oct 2021 11:24:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="228889637"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="228889637"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 04:24:37 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="494762001"
Received: from aeremina-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.249.254.123])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 04:24:36 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211025163404.2774-1-matthew.brost@intel.com>
References: <20211025163404.2774-1-matthew.brost@intel.com>
Subject: Re: [PATCH] drm/i915/trace: Hide backend specific fields behind
 Kconfig
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <163533387364.68716.13754720935276506362@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Wed, 27 Oct 2021 14:24:33 +0300
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

Quoting Matthew Brost (2021-10-25 19:34:04)
> Hide the guc_id and tail fields, for request trace points, behind
> CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS Kconfig option. Trace points
> are ABI (maybe?) so don't change them without kernel developers Kconfig
> options.

I've pushed the simple fix to eliminate the 'guc_id' field.

In my opinion a separate tracepoint with more information would be a
better choice here compared to mutating an existing one.

The idea with LOW_LEVEL_TRACEPOINTS is to make sure there are two sets
of tracepoints: one that is quasi stable and the other that is unstable.
Mutating the other set when the unstable set is enabled kind of breaks
that clean split.

Regards, Joonas

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_trace.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i91=
5_trace.h
> index 9795f456cccf..4f5238d02b51 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -787,6 +787,7 @@ TRACE_EVENT(i915_request_queue,
>                       __entry->ctx, __entry->seqno, __entry->flags)
>  );
> =20
> +#if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS)
>  DECLARE_EVENT_CLASS(i915_request,
>             TP_PROTO(struct i915_request *rq),
>             TP_ARGS(rq),
> @@ -816,6 +817,32 @@ DECLARE_EVENT_CLASS(i915_request,
>                       __entry->guc_id, __entry->ctx, __entry->seqno,
>                       __entry->tail)
>  );
> +#else
> +DECLARE_EVENT_CLASS(i915_request,
> +           TP_PROTO(struct i915_request *rq),
> +           TP_ARGS(rq),
> +
> +           TP_STRUCT__entry(
> +                            __field(u32, dev)
> +                            __field(u64, ctx)
> +                            __field(u16, class)
> +                            __field(u16, instance)
> +                            __field(u32, seqno)
> +                            ),
> +
> +           TP_fast_assign(
> +                          __entry->dev =3D rq->engine->i915->drm.primary=
->index;
> +                          __entry->class =3D rq->engine->uabi_class;
> +                          __entry->instance =3D rq->engine->uabi_instanc=
e;
> +                          __entry->ctx =3D rq->fence.context;
> +                          __entry->seqno =3D rq->fence.seqno;
> +                          ),
> +
> +           TP_printk("dev=3D%u, engine=3D%u:%u, ctx=3D%llu, seqno=3D%u",
> +                     __entry->dev, __entry->class, __entry->instance,
> +                     __entry->ctx, __entry->seqno)
> +);
> +#endif
> =20
>  DEFINE_EVENT(i915_request, i915_request_add,
>              TP_PROTO(struct i915_request *rq),
> --=20
> 2.32.0
>=20

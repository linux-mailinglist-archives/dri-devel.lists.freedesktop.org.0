Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046EF92E84C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 14:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB8B10E24B;
	Thu, 11 Jul 2024 12:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QCMy9LNT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F0E10E1F8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 12:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=083n8a5rLgkBnou1X5SM3Llj+3SO/krNrJjKlPkaMTU=; b=QCMy9LNTKCQoTTvSxyNWPXqGBE
 fmh2A/3K5187ZScWj1uYpY6hCw3ifmF+PQo02NtYMIJPTmewxpl3KuomffIR1++1MRPLWbGP+a08D
 y0OYZG4uGWp03D9QVdjvNhi08ctKvM+F1Hqq5hUqYw7UwMQO/CFpvq7OlILrZ/sNLBs7HRqu5KZYN
 PsmOBRGMEF92A7nVVjn9WhBVavEkdW/kbaD5Vu0cy7tB4voR9ie93KcbLwh5lhaKaRe41PNV38sEc
 ItKkO38bmA8vRTbr+KhHgutQGtxkYd7HuhVRnL+dqvvrG7oyAwt/GBMIHFyNcXz8/XhV48f7Nsz8A
 ArF0/Zjg==;
Received: from [192.168.12.229] by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sRsxN-00Dgjb-Cu; Thu, 11 Jul 2024 14:31:29 +0200
Message-ID: <8b87ef7081452ee385135342c171c514a61c6646.camel@igalia.com>
Subject: Re: [PATCH 11/12] drm/v3d: Do not use intermediate storage when
 copying performance query results
From: Iago Toral <itoral@igalia.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 kernel-dev@igalia.com,  Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date: Thu, 11 Jul 2024 14:31:29 +0200
In-Reply-To: <20240709163425.58276-12-tursulin@igalia.com>
References: <20240709163425.58276-1-tursulin@igalia.com>
 <20240709163425.58276-12-tursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

El mar, 09-07-2024 a las 17:34 +0100, Tvrtko Ursulin escribi=C3=B3:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> Removing the intermediate buffer removes the last use of the
> V3D_MAX_COUNTERS define, which will enable further driver cleanup.
>=20
> While at it pull the 32 vs 64 bit copying decision outside the loop
> in
> order to reduce the number of conditional instructions.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c | 60 ++++++++++++++++++++----------=
-
> --
> =C2=A01 file changed, 37 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> b/drivers/gpu/drm/v3d/v3d_sched.c
> index fc8730264386..77f795e38fad 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -421,18 +421,23 @@ v3d_reset_timestamp_queries(struct v3d_cpu_job
> *job)
> =C2=A0	v3d_put_bo_vaddr(bo);
> =C2=A0}
> =C2=A0
> +static void write_to_buffer_32(u32 *dst, unsigned int idx, u32
> value)
> +{
> +	dst[idx] =3D value;
> +}
> +
> +static void write_to_buffer_64(u64 *dst, unsigned int idx, u64
> value)
> +{
> +	dst[idx] =3D value;
> +}
> +
> =C2=A0static void
> -write_to_buffer(void *dst, u32 idx, bool do_64bit, u64 value)
> +write_to_buffer(void *dst, unsigned int idx, bool do_64bit, u64
> value)
> =C2=A0{
> -	if (do_64bit) {
> -		u64 *dst64 =3D (u64 *)dst;
> -
> -		dst64[idx] =3D value;
> -	} else {
> -		u32 *dst32 =3D (u32 *)dst;
> -
> -		dst32[idx] =3D (u32)value;
> -	}
> +	if (do_64bit)
> +		write_to_buffer_64(dst, idx, value);
> +	else
> +		write_to_buffer_32(dst, idx, value);
> =C2=A0}
> =C2=A0
> =C2=A0static void
> @@ -505,18 +510,23 @@ v3d_reset_performance_queries(struct
> v3d_cpu_job *job)
> =C2=A0}
> =C2=A0
> =C2=A0static void
> -v3d_write_performance_query_result(struct v3d_cpu_job *job, void
> *data, u32 query)
> +v3d_write_performance_query_result(struct v3d_cpu_job *job, void
> *data,
> +				=C2=A0=C2=A0 unsigned int query)
> =C2=A0{
> -	struct v3d_performance_query_info *performance_query =3D &job-
> >performance_query;
> -	struct v3d_copy_query_results_info *copy =3D &job->copy;
> +	struct v3d_performance_query_info *performance_query =3D
> +						&job-
> >performance_query;
> =C2=A0	struct v3d_file_priv *v3d_priv =3D job->base.file-
> >driver_priv;
> =C2=A0	struct v3d_dev *v3d =3D job->base.v3d;
> -	struct v3d_perfmon *perfmon;
> -	u64 counter_values[V3D_MAX_COUNTERS];
> +	unsigned int i, j, offset;
> =C2=A0
> -	for (int i =3D 0; i < performance_query->nperfmons; i++) {
> -		perfmon =3D v3d_perfmon_find(v3d_priv,
> -					=C2=A0=C2=A0 performance_query-
> >queries[query].kperfmon_ids[i]);
> +	for (i =3D 0, offset =3D 0;
> +	=C2=A0=C2=A0=C2=A0=C2=A0 i < performance_query->nperfmons;
> +	=C2=A0=C2=A0=C2=A0=C2=A0 i++, offset +=3D DRM_V3D_MAX_PERF_COUNTERS) {
> +		struct v3d_performance_query *q =3D
> +				&performance_query->queries[query];

Looks like we could move this before the loop.

Otherwise this patch is:
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>


> +		struct v3d_perfmon *perfmon;
> +
> +		perfmon =3D v3d_perfmon_find(v3d_priv, q-
> >kperfmon_ids[i]);
> =C2=A0		if (!perfmon) {
> =C2=A0			DRM_DEBUG("Failed to find perfmon.");
> =C2=A0			continue;
> @@ -524,14 +534,18 @@ v3d_write_performance_query_result(struct
> v3d_cpu_job *job, void *data, u32 quer
> =C2=A0
> =C2=A0		v3d_perfmon_stop(v3d, perfmon, true);
> =C2=A0
> -		memcpy(&counter_values[i *
> DRM_V3D_MAX_PERF_COUNTERS], perfmon->values,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perfmon->ncounters * sizeof(u64))=
;
> +		if (job->copy.do_64bit) {
> +			for (j =3D 0; j < perfmon->ncounters; j++)
> +				write_to_buffer_64(data, offset + j,
> +						=C2=A0=C2=A0 perfmon-
> >values[j]);
> +		} else {
> +			for (j =3D 0; j < perfmon->ncounters; j++)
> +				write_to_buffer_32(data, offset + j,
> +						=C2=A0=C2=A0 perfmon-
> >values[j]);
> +		}
> =C2=A0
> =C2=A0		v3d_perfmon_put(perfmon);
> =C2=A0	}
> -
> -	for (int i =3D 0; i < performance_query->ncounters; i++)
> -		write_to_buffer(data, i, copy->do_64bit,
> counter_values[i]);
> =C2=A0}
> =C2=A0
> =C2=A0static void


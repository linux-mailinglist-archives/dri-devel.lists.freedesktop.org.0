Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF627FB4F1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 09:56:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB6C10E460;
	Tue, 28 Nov 2023 08:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6790E10E460
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 08:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NypebVAZML1AM1ysUFyFvugzaSeQ0WNltle7/JZIYnw=; b=hsXsGqBq22bVsZe1QsrhSfFlsZ
 R26udJvQug3J2Lt/56lcvlc6VX/Mdvne4r1KCYSr5UyYVA1okKnu7XCMs954c3XpeUOKwZaK87kq3
 8oymsv6Igi+uVqPtaWqNweyUqCoKeNKcuCrZ+0zDW68T9iEaIGQjQMqp3nQXLA8fDH/r+AekGXhRY
 VLj9nm92Ix0Bp0I5ypBduZqZ50EjCamwaT9jBUQlsgjnscTTabYrl6bUjB+V5afZW56KFN/5NMBzo
 j1tzXYWIfXtUF9GX1YooqTCg4AI2wbnTVEFcSfB0gmgJeWjvsJiFfExbTifvhsYQzy+vO0zLwFjCA
 rVWxbj2w==;
Received: from 93.49.60.213.dynamic.reverse-mundo-r.com ([213.60.49.93]
 helo=[192.168.0.100]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r7tsw-007xro-5P; Tue, 28 Nov 2023 09:56:02 +0100
Message-ID: <d954f0122558ec089fc2f432da1ce1c8145fad60.camel@igalia.com>
Subject: Re: [PATCH v3 16/17] drm/v3d: Create a CPU job extension for the
 reset performance query job
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 28 Nov 2023 09:56:01 +0100
In-Reply-To: <20231127185723.10348-18-mcanal@igalia.com>
References: <20231127185723.10348-2-mcanal@igalia.com>
 <20231127185723.10348-18-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

El lun, 27-11-2023 a las 15:48 -0300, Ma=C3=ADra Canal escribi=C3=B3:
(...)
> diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
> index a3ae1f220291..76a02d2c01e6 100644
> --- a/include/uapi/drm/v3d_drm.h
> +++ b/include/uapi/drm/v3d_drm.h
> @@ -76,6 +76,7 @@ struct drm_v3d_extension {
> =C2=A0#define DRM_V3D_EXT_ID_CPU_TIMESTAMP_QUERY=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x03
> =C2=A0#define DRM_V3D_EXT_ID_CPU_RESET_TIMESTAMP_QUERY=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A00x04
> =C2=A0#define DRM_V3D_EXT_ID_CPU_COPY_TIMESTAMP_QUERY=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x05
> +#define DRM_V3D_EXT_ID_CPU_RESET_PERFORMANCE_QUERY=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A00x06
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags; /* mbz */
> =C2=A0};
> =C2=A0
> @@ -492,6 +493,32 @@ struct drm_v3d_copy_timestamp_query {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u64 syncs;
> =C2=A0};
> =C2=A0
> +/**
> + * struct drm_v3d_reset_performance_query - ioctl extension for the
> CPU job to
> + * reset performance queries
> + *
> + * When an extension DRM_V3D_EXT_ID_CPU_RESET_PERFORMANCE_QUERY is
> defined, it
> + * points to this extension to define a reset performance
> submission. This CPU
> + * job will reset the performance queries by resetting the values of
> the
> + * performance monitors. Moreover, it will reset the syncobj to
> reset query
> + * availability.
> + */
> +struct drm_v3d_reset_performance_query {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_v3d_extension base;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Array of performance querie=
s's syncobjs to indicate its
> availability */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u64 syncs;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Number of queries */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u32 count;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Number of performance monit=
ors */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u32 nperfmons;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Array of u64 user-pointers =
that point to an array of
> kperfmon_ids */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u64 kperfmon_ids;
> +};
> +
> =C2=A0struct drm_v3d_submit_cpu {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Pointer to a u32 array=
 of the BOs that are referenced by
> the job.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> @@ -507,6 +534,9 @@ struct drm_v3d_submit_cpu {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * For DRM_V3D_EXT_ID_CPU=
_COPY_TIMESTAMP_QUERY, it must
> contain two
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * BOs. The first is the =
BO for which the timestamp queries
> results
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * will be written to. Th=
e second is the BO that contains the
> timestamp.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * For DRM_V3D_EXT_ID_CPU_RESE=
T_PERFORMANCE_QUERY, it must
> contain no
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * BOs.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
(...) The first is the BO where the timestamps queries will be written.
(...)

Iago

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u64 bo_handles;
> =C2=A0


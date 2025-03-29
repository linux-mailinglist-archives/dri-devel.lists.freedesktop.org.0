Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 662A8A756B8
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 15:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8203410E250;
	Sat, 29 Mar 2025 14:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="Ewx0gEgz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB8110E24F;
 Sat, 29 Mar 2025 14:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1743258814; x=1743518014;
 bh=xDKh0SEYG2UAlozeNWGpbQBdJE/U5hxRytnarzkniLw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=Ewx0gEgzTm/4skymrdCnUxvrMGoEmzhj9CRwDsgeBRDXFbFGBTC7iUgaY3iNq3Qec
 S/ek6UbYSoKT7b8vChXzeAYM8jIqvprVtTAGjAOg4xDaOL/bBQbeW4XsMb5FMyzhYl
 87kPpauFtR39a9a4BIABETmxLUcZ3VMZcEd87s7zdkBYADGiFhPqYyViuC7QpHRlVy
 xLAmXxOqboXMO49YdoFRch1F0qhvQcBoDvi4gB9YMjs06tYhD2ElhnFAV/v7VmdS3w
 b0lq0pj43oCV55ErVNL7rfMFl/BxCMiBKzWxsudlPUjD7ObHcmazy/7FJNtpSL7Bgx
 r2KCPxXQ8xanQ==
Date: Sat, 29 Mar 2025 14:33:27 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 10/43] drm/plane: Add COLOR PIPELINE property
Message-ID: <5xGNnbC-7q5cgvaDZS7MUb2jT1VizZ1zjr2eGKwLwwfP9RbSCtzszBDBRsEC8-eRLXSPMbTWLfWkzkaEGw7TqzJDi_eYM2uWoyu_vKaGSOc=@emersion.fr>
In-Reply-To: <20250326234748.2982010-11-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-11-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: c30abc44cc5700c2516214c6859b7254d65ed0a0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two nits below, regardless:

Reviewed-by: Simon Ser <contact@emersion.fr>

> +=09} else if (property =3D=3D plane->color_pipeline_property) {
> +=09=09/* find DRM colorop object */
> +=09=09struct drm_colorop *colorop =3D NULL;
> +
> +=09=09colorop =3D drm_colorop_find(dev, file_priv, val);
> +
> +=09=09if (val && !colorop)
> +=09=09=09return -EACCES;
> +
> +=09=09/* set it on drm_plane_state */
> +=09=09drm_atomic_set_colorop_for_plane(state, colorop);

Nit: I don't think these comments are especially useful, the names of the
functions are clear enough.

> +int drm_plane_create_color_pipeline_property(struct drm_plane *plane,
> +=09=09=09=09=09     const struct drm_prop_enum_list *pipelines,
> +=09=09=09=09=09     const int num_pipelines)

Nit: in general we don't mark non-pointer arguments as const: the function
cannot mutate the caller's value anyways.

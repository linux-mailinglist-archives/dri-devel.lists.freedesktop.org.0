Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 082D9A0B0D7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 09:18:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C2010E428;
	Mon, 13 Jan 2025 08:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="W77KwlgA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 801 seconds by postgrey-1.36 at gabe;
 Mon, 13 Jan 2025 08:18:53 UTC
Received: from mail-10624.protonmail.ch (mail-10624.protonmail.ch
 [79.135.106.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F140A10E428;
 Mon, 13 Jan 2025 08:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1736756332; x=1737015532;
 bh=tq0GsELHY1a4zUoLUNWdm6oz/LAOiZIefjdH5kB0eLM=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=W77KwlgAn/NP5A8HvNJT2q5b4wPCny2DdKH077nVmb+Yl3cf16is0CHj8BvKildo3
 n/PGY68OhCcu8BSEhrsL35CFycLq6WqsMHTXgJ9UIDqmZy741g3nZ/A88GvUG6uRIt
 +KvsOi5aUXp2n/XYN8qmE/z5dMDIoPRVFitGSWac/o/yIPv9445x0yy7FAaDxBDcYI
 aJhLP1uLu32r9GNqhVtrd+SIhUjcrDES6Jme5phXMElle0KKYVuWQforcjA9LTpOgC
 pzmVx389eNJ1+oDI/PLkiSgFHHf6GOpHzOJ4htgP2Bje91mLcoMxiDOR5hZ2PrMUMi
 FhJUHgXHC5IAA==
Date: Mon, 13 Jan 2025 08:18:45 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 08/45] Documentation/gpu: document drm_colorop
Message-ID: <eDrRzjuU_q4z4Jvq-DYxUnw2a-VUts65NbWMZbhrvqYoKbcW_jUawJ_ZirFIFQzrtMG4asLn6f9WP24o-k4DnP_oYf5R94PYoMIejFqdTZM=@emersion.fr>
In-Reply-To: <20241220043410.416867-9-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-9-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 7fb6c75bfdd91eef14442e82b2eae395ef272f1e
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

This patch should probably come after all patches introducing the
properties referenced in the docs, e.g. NEXT and COLOR_PIPELINE.
Probably after "[13/45] drm/colorop: Introduce
DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE"?

> +/**
> + * DOC: overview
> + *
> + * A colorop represents a single color operation. Colorops are chained
> + * via the NEXT property and make up color pipelines. Color pipelines
> + * are advertised and selected via the COLOR_PIPELINE &drm_plane
> + * property.
> + *
> + * A colorop will be of a certain type, advertised by the read-only TYPE
> + * property. Each type of colorop will advertise a different set of
> + * properties and is programmed in a different manner. Types can be
> + * enumerated 1D curves, 1D LUTs, 3D LUTs, matrices, etc. See the
> + * &drm_colorop_type documentation for information on each type.

It's not super nice to refer to internal kernel docs here, because AFAIU
this section is mostly written towards user-space developers. User-space
developers have no idea how internal kernel structs work.

It would be nicer to have a list of colorop types here, without referring
to kernel internals. For instance, we have a list of=20

> + * If a colorop advertises the BYPASS property it can be bypassed.
> + *
> + * Since colorops cannot stand-alone and are used to describe colorop
> + * operations on a plane they don't have their own locking mechanism but
> + * are locked and programmed along with their associated &drm_plane.

This sounds a bit too internal for overview docs - maybe should be in
the struct drm_colorop docs instead?

> + * Colorops are only advertised and valid for atomic drivers and atomic
> + * userspace that signals the DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE client

Nit: this cap can be linkified with a "&".

> + * cap. When a driver advertises the COLOR_PIPELINE property on a
> + * &drm_plane and userspace signals the
> + * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE the driver shall ignore all other
> + * plane color properties, such as COLOR_ENCODING and COLOR_RANGE.

Perhaps this should appear first in the doc? Start with instructions to
enable, then describe how it works?

> + * More information about colorops and color pipelines can be found at
> + * rfc/color_pipeline.rst.

Perhaps we should note that this document contains information about
design/architectural decisions? The "reference" should be this section, the
RFC doc is just about the motivation I believe. That is, if the API evolves=
,
the RFC is unliekly to get updated, but this document will.

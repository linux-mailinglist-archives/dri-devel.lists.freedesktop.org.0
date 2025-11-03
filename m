Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4194C2D8D5
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 19:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA58210E20B;
	Mon,  3 Nov 2025 18:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="o/mJmFIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5472A10E20B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 18:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762192873;
 bh=v7nCQ4DOQHDWAw61eMlJSqEgB2MJ8orXd+4NvUEuisk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o/mJmFIK7jLnuKziPtCSanZXuA5b6lvXm8mDe4sktpo/ddKbS+g8dyXyZg5figtKE
 jQW4CtABxtldKpVGWQ7IBDZCEAvPLlWXXm3VJ5r9xqW+J84sG/4/GP9iECSs8253g8
 wEILBUgCfJJwWBcu8uRG7JyoN21HedsxFrJ8mpAv1/z+dm+MXiCwVExAZ2AN5yLskw
 5FCeGblBdKNZJdhtSNz2kR9W6TW5rWRCmX1JY4JVDrEnRTssCodPAW5cZUn8gePqYR
 NFrVhS1BaahPgX1IFSdU1zykqXogHN0f6vxhxl9sKunrXCAWlwbu1IjpkF3+9ocmav
 2BElMbHM6mGKQ==
Received: from xpredator (unknown
 [IPv6:2a02:2f08:e41c:5800:e88e:21ff:fe65:be18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 91D7F17E090D;
 Mon,  3 Nov 2025 19:01:13 +0100 (CET)
Date: Mon, 3 Nov 2025 20:01:12 +0200
From: Marius Vlad <marius.vlad@collabora.com>
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, daniel.stone@collabora.com,
 dmitry.baryshkov@oss.qualcomm.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, derek.foreman@collabora.com
Subject: Re: [PATCH 1/2] drm: Introduce a new connector status
Message-ID: <aQjt6FMINYk9LrfX@xpredator>
References: <20250923083636.4749-1-marius.vlad@collabora.com>
 <20250923083636.4749-2-marius.vlad@collabora.com>
 <CAO6MGtj8T-ZHASj4xAr=yA-Y+jwsXZ7ErjrQ0FxaVV9Vp+-EFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAO6MGtj8T-ZHASj4xAr=yA-Y+jwsXZ7ErjrQ0FxaVV9Vp+-EFA@mail.gmail.com>
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

Hi Ian,

On Tue, Sep 23, 2025 at 12:34:58PM -0500, Ian Forbes wrote:
> On Tue, Sep 23, 2025 at 3:36=E2=80=AFAM Marius Vlad <marius.vlad@collabor=
a.com> wrote:
> >
> > This patch introduces a new boolean variable used to track connector's
> > connect/disconnect status and it is being used on both polling and
> > the HPD (Hot Plug Detect) paths.
> >
> > A subsequent patch would make use of this connector status to propagate
> > per-connector udev hot plug events. This allows user-space to receive
> > the connector's ID, rather than having a generic hot-plug event for all
> > connectors, or in the HPD path, just the first one found with a
> > connection status change.
> >
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > ---
>=20
> How do you see this working with virtual connectors which can hotplug
> without a connected -> disconnected -> connected cycle?

tbh I don't see how those hot plug events are generated on virtual
connectors. Do you have a particular driver in mind, or how do you
"simulate" that hotplug cycle?

Pushed today a v4 of this patches series which adds polling in the vkms
driver and with that in I'm able to use sysfs and simulate a hot plug
event, like you'd have regular connectors. I've CC'ed on that v4 if=20
you'd like to have another go.

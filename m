Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377DABAE173
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 18:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2860010E2DD;
	Tue, 30 Sep 2025 16:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eIpbCLbB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF0310E2C6;
 Tue, 30 Sep 2025 16:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759251140;
 bh=6F5HZUHWmfM84MuVuhHdpmdFxiNcPSoV525Ehw7vQXQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eIpbCLbBiLlNsrWXZWLfs66puqbb8GGKuERAQ4nZEmXBOeHs5dZfqwFFZya2GlnW+
 0E+jzeUfKSUR1efBo4yJtRnCAGCWv7jkkMzEpurVJKuD0P6Wo2RUiGlLIB1C6y9TRI
 XE6zlk+0Z5N6eS87R2l9pzogJel9iWxzIDGRVCWqG46ynhlb/Hl30lcRbvi6MsEd6p
 bgR2wSGIKSkRVuPldmehKVjZCoZP3TTid7rBWzRacr9VyvSke79j4L3wZSM8IgCUN3
 cKoC15XoXGr3CHSWntaNGPAzy78b+jG3El5BgLK5lhf/5usxv0ExM02bxdNQKUYpOH
 gZ3Arl9SmvKzg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 19C1317E02B0;
 Tue, 30 Sep 2025 18:52:19 +0200 (CEST)
Date: Tue, 30 Sep 2025 18:52:16 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?B?TWlrb8WCYWo=?= Wasiak
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>, Nitin
 Gote <nitin.r.gote@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org, kernel@collabora.com
Subject: Re: [PATCH 6/8] drm/panthor: Introduce huge tmpfs mount point option
Message-ID: <20250930185216.0219a542@fedora>
In-Reply-To: <d3b927b9-ddcb-492a-a72c-d42abbb11cff@collabora.com>
References: <20250929200316.18417-1-loic.molinari@collabora.com>
 <20250929200316.18417-7-loic.molinari@collabora.com>
 <20250930123416.4ff59b11@fedora>
 <d3b927b9-ddcb-492a-a72c-d42abbb11cff@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Tue, 30 Sep 2025 18:31:11 +0200
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> On 30/09/2025 12:34, Boris Brezillon wrote:
> > On Mon, 29 Sep 2025 22:03:14 +0200
> > Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:
> >  =20
> >> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/dr=
m/panthor/panthor_device.h
> >> index 4fc7cf2aeed5..54ca61567426 100644
> >> --- a/drivers/gpu/drm/panthor/panthor_device.h
> >> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> >> @@ -135,6 +135,9 @@ struct panthor_device {
> >>   	/** @devfreq: Device frequency scaling management data. */
> >>   	struct panthor_devfreq *devfreq;
> >>  =20
> >> +	/** @huge_mnt: tmpfs mount point with Transparent Hugepage enabled. =
*/
> >> +	struct vfsmount *huge_mnt; =20
> >=20
> > Now that we have a helper to create a huge mountpoint, wouldn't it
> > make sense to have this field in drm_device instead of having each
> > driver add a huge_mnt field to their <driver>_device object. =20
>=20
> Not sure this should be enforced for all DRM drivers since most of them=20
> don't create separate huge mountpoints (only 4 for now including this=20
> patchset) and I guess some maintainers might prefer to depend on the=20
> sysfs interace to enable huge pages.

I'm not saying we should create the huge mountpoint by default, but if
this is a generic helper, it makes sense to also manage this mountpoint
internally. In the end, it'd be a small price to pay for drivers that
don't need it (the size of a pointer in the drm_device object), and
with this in place, driver wouldn't even have to call
drm_gem_shmem_huge_mnt_free() manually (can be automated with a
drmm_add_action_or_reset() calling kern_unmount() inside
drm_gem_shmem_huge_mnt_create()).

>=20
> >> +
> >>   	/** @unplug: Device unplug related fields. */
> >>   	struct {
> >>   		/** @lock: Lock used to serialize unplug operations. */ =20
> >  =20
>=20
> Lo=C3=AFc


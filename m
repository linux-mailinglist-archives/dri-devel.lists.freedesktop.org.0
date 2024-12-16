Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCF29F30B8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 13:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6BF10E3DB;
	Mon, 16 Dec 2024 12:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bJWmWmDd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F37B10E3DB;
 Mon, 16 Dec 2024 12:42:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DB1CBA40EF6;
 Mon, 16 Dec 2024 12:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE179C4CEE0;
 Mon, 16 Dec 2024 12:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734352922;
 bh=v6bL/smeZNF++oogcyHNFgbpXP30gkHynV4auvO0VeE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bJWmWmDdDfMI2GOaNXhSzIY33H+b6BHPsMyLEFeqHMuN4/I7EohkIuGs2lSBc+aXM
 3R/qkicWrfFuGyZ+7sonLtz3Zg8h06/Zad1QPoh1JsZel7jFkU6JAPp3Q4hB71lDEy
 C0AtZRZriKH7uK8zw9Zf4pahGco4GwcaPMZ6rDlfeb/Q8YoriaMh7jWFxL/NhKmFEZ
 SoRj/g99ZFCX7PeQUJfAE6yUwXb2J9mjtDF7RDfQjySrzUowWDCJN5qYwzi4cTFj+c
 WIIRB1OXGT34BY/JumKoCaIz3qANKkWlO5Vt5ayG46UJ2HwIcum4wD61yINg3VtiCM
 ifB5FEqVBnBjA==
Date: Mon, 16 Dec 2024 13:41:56 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] drm/nouveau: remove drm_encoder_slave interface
Message-ID: <Z2AgFHV2BaaZYGTx@cassiopeiae>
References: <20241215-nouveau-encoder-slave-v2-0-ef7a0e687242@linaro.org>
 <Z2ASy3TQ4suupdvd@cassiopeiae>
 <fw7i3kusogrrsslb5sjdid27uqnwey5qa5yhyrfa677n4iqqhq@tfh5s6bmqgna>
 <20241216121651.GP32204@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216121651.GP32204@pendragon.ideasonboard.com>
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

On Mon, Dec 16, 2024 at 02:16:51PM +0200, Laurent Pinchart wrote:
> On Mon, Dec 16, 2024 at 02:11:41PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Dec 16, 2024 at 12:45:15PM +0100, Danilo Krummrich wrote:
> > > On Sun, Dec 15, 2024 at 12:19:22PM +0200, Dmitry Baryshkov wrote:
> > > > The nouveau driver is the only user of the drm_encoder_slave interface.
> > > > Demote it from KMS helpers module to the nouveau driver itself, moving
> > > > corresponding I2C encoders to be handled by nouveau driver too.
> > > 
> > > I understand nouveau is the only driver using this interface (and the
> > > corresponding i2c encoders).
> > > 
> > > However, I'm not quite seeing the advantage of folding the interface (including
> > > the two i2c drivers) into nouveau. I don't think this legacy interface does harm
> > > the subsystem in any way / does prevent the subsystem from moving forward.
> > > 
> > > Can't we just keep it as it is?
> > 
> > Well, drm_encoder_slave is a part of the DRM KMS helpers module, so it
> > take (a little bit) of space on every system. The nouveau situation
> > isn't unique, other drivers (i915, ast) also incorporate the code for
> > I2C backends. For the further discussion see the thread starting from
> > Laurent's email ([1]).
> > 
> > [1] https://lore.kernel.org/all/20241117205426.GE12409@pendragon.ideasonboard.com/

The drm_encoder_slave code it's rather small, but I guess this can be used as
argument for both, keeping it where it is and moving it.

If you want to move it to nouveau, I'm not going to object. But please fold the
helper code, such that we aren't left with unused functions and unnecessary
function pointer indirections through struct drm_encoder_slave_funcs.

> 
> It's also a question of whether maintenance of this code based used by
> the nouveau driver only should be the responsibility of the drm-misc
> community or the nouveau driver maintainers.

Good question. It's common infrastructure; do we expect / require the last user
of such infrastructure to take ownership?

> 
> > > > Ideally those two drivers should be converted to the drm_bridge
> > > > interface, but it's unclear if it's worth spending time on that.
> > > 
> > > Probably not.
> > > 
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > > Changes in v2:
> > > > - Renamed symbols in defconfig (Laurent)
> > > > - Added missing Kbuild file (Laurent, LKP)
> > > > - Renamed guarding defines in include files.
> > > > - Dropped mentions of two removed functions.
> > > > - Link to v1: https://lore.kernel.org/r/20241214-nouveau-encoder-slave-v1-0-beda767472e3@linaro.org
> > > > 
> > > > ---
> > > > Dmitry Baryshkov (2):
> > > >       drm/nouveau: incorporate I2C TV encoder drivers
> > > >       drm/nouveau: vendor in drm_encoder_slave API
> > > > 
> > > >  arch/arm/configs/multi_v7_defconfig                |   4 +-
> > > >  arch/parisc/configs/generic-32bit_defconfig        |   4 +-
> > > >  arch/parisc/configs/generic-64bit_defconfig        |   4 +-
> > > >  drivers/gpu/drm/Makefile                           |   1 -
> > > >  drivers/gpu/drm/i2c/Kconfig                        |  18 ----
> > > >  drivers/gpu/drm/i2c/Makefile                       |   6 --
> > > >  drivers/gpu/drm/nouveau/Kconfig                    |  20 ++++
> > > >  drivers/gpu/drm/nouveau/dispnv04/Kbuild            |   3 +
> > > >  drivers/gpu/drm/nouveau/dispnv04/dfp.c             |  12 +--
> > > >  drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild        |   5 +
> > > >  .../drm/{ => nouveau/dispnv04}/i2c/ch7006_drv.c    |  30 +++---
> > > >  .../drm/{ => nouveau/dispnv04}/i2c/ch7006_mode.c   |   8 +-
> > > >  .../drm/{ => nouveau/dispnv04}/i2c/ch7006_priv.h   |  11 ++-
> > > >  .../drm/{ => nouveau/dispnv04}/i2c/sil164_drv.c    |  33 ++++---
> > > >  .../dispnv04/nouveau_i2c_encoder.c}                |  85 +++++-----------
> > > >  drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |  20 ++--
> > > >  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |   4 +-
> > > >  .../gpu/drm/nouveau/include}/i2c/ch7006.h          |   4 +-
> > > >  .../gpu/drm/nouveau/include/i2c/encoder_i2c.h      | 109 ++++++++-------------
> > > >  .../gpu/drm/nouveau/include}/i2c/sil164.h          |   4 +-
> > > >  drivers/gpu/drm/nouveau/nouveau_connector.c        |   6 +-
> > > >  drivers/gpu/drm/nouveau/nouveau_encoder.h          |  13 +--
> > > >  22 files changed, 172 insertions(+), 232 deletions(-)
> > > > ---
> > > > base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
> > > > change-id: 20241214-nouveau-encoder-slave-a6dd422fa4a9
> 
> -- 
> Regards,
> 
> Laurent Pinchart

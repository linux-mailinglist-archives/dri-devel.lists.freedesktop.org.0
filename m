Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D10846C12
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 10:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137BC10E0F6;
	Fri,  2 Feb 2024 09:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AvLo5nUK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729D210E0F6
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 09:34:32 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id C3F1AC0D6A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 09:26:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58138E000A;
 Fri,  2 Feb 2024 09:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706865965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2efg9wk2C4VI6y/ULepSR89HvTsqcQDUyUZlb+CaPD0=;
 b=AvLo5nUKWxkD6+kvpqxMZ7XPPJNIO/PQWzhBM+K1am2dN8AncVyUrW9Q+of0m0It9WxzPC
 JQWlqgnbPzFhVzgroizK4cB7b+ISJOn8xe4LVookunZzYBFILVGpUZRvjdnXH7ILgFcTWc
 PS68lOBl36Q1nGcNbH+ninf58TsT7puu2NI3Ti1GLbOR8VcOyrZxQ4U4XieWdfxM+oQRTA
 m/73zQNtfMeM+37E/jn5glv+AsGGmkKxdZWQ0lr9jTJDPcOXJX0I61KwseCtKmg5NY6k+i
 d6/Th743wUg3UFEp+i0PY7josLuEQx54VcpWDImFD/md1uGpQ/lrSHP+0bgGnw==
Date: Fri, 2 Feb 2024 10:26:01 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, Haneen Mohammed
 <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, marcheu@google.com, seanpaul@google.com,
 nicolejadeyee@google.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 2/2] drm/vkms: Use a simpler composition function
Message-ID: <20240202102601.70b6d49c@xps-13>
In-Reply-To: <20240202105522.43128e19@eldfell>
References: <20240201-yuv-v1-0-3ca376f27632@bootlin.com>
 <20240201-yuv-v1-2-3ca376f27632@bootlin.com>
 <20240202105522.43128e19@eldfell>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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

Hi Pekka,

pekka.paalanen@haloniitty.fi wrote on Fri, 2 Feb 2024 10:55:22 +0200:

> On Thu, 01 Feb 2024 18:31:32 +0100
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
>=20
> > Change the composition algorithm to iterate over pixels instead of line=
s.
> > It allows a simpler management of rotation and pixel access for complex=
 formats.
> >=20
> > This new algorithm allows read_pixel function to have access to x/y
> > coordinates and make it possible to read the correct thing in a block
> > when block_w and block_h are not 1.
> > The iteration pixel-by-pixel in the same method also allows a simpler
> > management of rotation with drm_rect_* helpers. This way it's not needed
> > anymore to have misterious switch-case distributed in multiple places. =
=20
>=20
> Hi,
>=20
> there was a very good reason to write this code using lines:
> performance. Before lines, it was indeed operating on individual pixels.
>=20
> Please, include performance measurements before and after this series
> to quantify the impact on the previously already supported pixel
> formats, particularly the 32-bit-per-pixel RGB variants.
>=20
> VKMS will be used more and more in CI for userspace projects, and
> performance actually matters there.
>=20
> I'm worrying that this performance degradation here is significant. I
> believe it is possible to keep blending with lines, if you add new line
> getters for reading from rotated, sub-sampled etc. images. That way you
> don't have to regress the most common formats' performance.

While I understand performance is important and should be taken into
account seriously, I cannot understand how broken testing could be
considered better. Fast but inaccurate will always be significantly
less attractive to my eyes.

I am in favor of making this working first, and then improving the code
for faster results. Maybe the line-driven approach can be dedicated to
"simpler" formats where more complex corner cases do not happen. But
for now I don't see the point in comparing performances between broken
and (hopefully) non broken implementations.

Thanks,
Miqu=C3=A8l

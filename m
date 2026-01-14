Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6E0D1CD40
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 08:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D55210E5B6;
	Wed, 14 Jan 2026 07:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CxI/EbIw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716F610E5B6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:28:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D512E4E420CD;
 Wed, 14 Jan 2026 07:28:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 90F956074A;
 Wed, 14 Jan 2026 07:28:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3FF16103C8901; Wed, 14 Jan 2026 08:28:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768375686; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=p5mWdh+oo1CrKQ4jZ7NQo37rTS4jtBZUvQhZk6AM5J8=;
 b=CxI/EbIwU8+mSZIppJcXIoKZfW4D4qU/nFlIBys0llIXGXtwOnY3ii5u9jDs7AaAcHYPQq
 B06Zszn4VjtVb5RuBeBsBc3ZcNbXZAN9VVV0vO800FrsC0AVDevHrW7mBv9CMii8kbdicQ
 ZJsclOQ40pEnXMRyNBZi3d7ispG09VszP+jHHZNSZ8h/tea/4pthNqR0bQjqNQujIwiDwH
 WmKvhbSWvgK1vZ7sIaoenRj7+9XZgyJazFQPVu205MqNhUqBo3mhsORouiIozAbupBaeKD
 q449zHLD3cvXP0Sty1xAEbNZyIOB3DO7PYDSKtG9A5GY4NXVc9y1f3wzP3h3/A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 08:28:01 +0100
Message-Id: <DFO4V0UA4HLC.3FUCX0L1QX90W@bootlin.com>
Subject: Re: [PATCH] drm/bridge: Separate of_drm_find_bridge() preconditions
 list
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Stephen
 Rothwell" <sfr@canb.auug.org.au>
To: "Bagas Sanjaya" <bagasdotme@gmail.com>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux DRI Development"
 <dri-devel@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260113235615.11124-1-bagasdotme@gmail.com>
In-Reply-To: <20260113235615.11124-1-bagasdotme@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
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

Hello Bagas,

On Wed Jan 14, 2026 at 12:56 AM CET, Bagas Sanjaya wrote:
> Sphinx reports htmldocs warnings:
>
> Documentation/gpu/drm-kms-helpers:197: drivers/gpu/drm/drm_bridge.c:1521:=
 ERROR: Unexpected indentation. [docutils]
> Documentation/gpu/drm-kms-helpers:197: drivers/gpu/drm/drm_bridge.c:1523:=
 WARNING: Block quote ends without a blank line; unexpected unindent. [docu=
tils]
>
> Fix them by separating preconditions list in of_drm_find_bridge()
> kernel-doc comment from previous paragraph.
>
> Fixes: 9da0e06abda87b ("drm/bridge: deprecate of_drm_find_bridge()")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20260105155735.3b4012b6@canb.a=
uug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks for your patch.

However the issue had been previously reported on Dec 30 [0] and I had sent
a fix the next day [1], but without any feedback so I couldn't apply it to
drm-misc-next.

My patch is slightly different from yours. I'm OK with either version.

[0] https://lore.kernel.org/oe-kbuild-all/202512302319.1PGGt3CN-lkp@intel.c=
om/
[1] https://lore.kernel.org/lkml/20251231-drm-bridge-alloc-getput-drm_of_fi=
nd_bridge-kdoc-fix-v1-1-193a03f0609c@bootlin.com/

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1A653C5B8
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 09:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB25113D8E;
	Fri,  3 Jun 2022 07:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4248E113D8E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 07:07:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 62E5F61873;
 Fri,  3 Jun 2022 07:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C8BC385A9;
 Fri,  3 Jun 2022 07:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654240052;
 bh=k2DES+vJ/S4fJJUyfR81LuaIXq78K3H1om/oGYR8TvQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=UPvvex7SO4n1UUFQmE94IsZ8aAnl9VO3YVHnvHET+YQTWgvDIn3lmO7MOVO4zOPF3
 +pmmFoCv6P5x8DLCNoHEVwIqHMvWI4MsGTBINOP7YGDnMK1yK8EHKpKbxdcYkIfYnr
 +HxOTPtLEqE6LhHgtyBWO6tpIwNlCz3ADWBHfA4teyBAaAMyYFwbV9Inept1R7+Id7
 WbQiXbmPl1B979GtTpdljfkroZbafQvnMiEXYMHhB9l7tzi4JVGgr6yUmSY6oCH+ws
 MiBABA64CpnKztHs+XdJa8QUjjZEge21RwYVLYP+f9GsuKU88G+PnIdVRcqNRpIoCe
 LqV2wtmZwnD+g==
Message-ID: <5550435a41ca9ec190015ce1b872be85edcd71b7.camel@kernel.org>
Subject: Re: [PATCH v5 2/6] drm/v3d: Get rid of pm code
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 03 Jun 2022 09:07:26 +0200
In-Reply-To: <20220601110249.569540-3-pbrobinson@gmail.com>
References: <20220601110249.569540-1-pbrobinson@gmail.com>
 <20220601110249.569540-3-pbrobinson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Emma Anholt <emma@anholt.net>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Stefan Wahren <stefan.wahren@i2se.com>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Peter Robinson <pbrobinson@gmail.com>,
 maxime@cerno.tech, Will Deacon <will@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-06-01 at 12:02 +0100, Peter Robinson wrote:
> Runtime PM doesn't seem to work correctly on this driver. On top of
> that, commit 8b6864e3e138 ("drm/v3d/v3d_drv: Remove unused static
> variable 'v3d_v3d_pm_ops'") hints that it most likely never did as the
> driver's PM ops were not hooked-up.
>=20
> So, in order to support regular operation with V3D on BCM2711 (Raspberry
> Pi 4), get rid of the PM code. PM will be reinstated once we figure out
> the underlying issues.
>=20
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---

Hi Florian, any thoughts on this?
Are brcm,7268-v3d and brcm,7278-v3d using runtime PM downstream?

Nicolas

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A97D4CBF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 11:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1713810E30F;
	Tue, 24 Oct 2023 09:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C4F10E30F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 09:42:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B8446B82456;
 Tue, 24 Oct 2023 09:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9D0C433C8;
 Tue, 24 Oct 2023 09:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698140556;
 bh=QjXGnxtmyNJKXPp8tZ3P48eKB8+3bqonJw+CTu1bC+Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i5meVQgrzpsMwLI2RJsygH/8mGKOBovLuHJiUmILZL2YaNe1o1Cc6n1YvPHFobxoz
 lWEhITWWOUypPxN/81nMVcKpxWiuEUIfixAMgkXxwhKeqzAtG/MNWLp/Zx9xvIdrRf
 FkLFr66I9OuYTUyNAFo+SzhUnMX4XvkP4uJoCkm3bxAQQr7Mz1PQlUnvw4PT26+I1n
 gnaEyClBSc2kZLN9m2JaS9ccs2MbW6kSvJ0dZnydUZ5KCfxIB/w1s78V3V/MPqooU9
 Z1GabSC8wPyLA9IwLFmv+hsPsLys1Sq9+vM/HyNiz0/CWcWX1gVkAZ23nwVzIIpkZU
 rV4DPpNN1XG5A==
Date: Mon, 23 Oct 2023 12:09:36 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 0/2] fbdev/simplefb: Add missing simple-framebuffer
 features
Message-ID: <45ggpbow7usira6hqyelygyuf2lezbngdyecfk27fvukrlnyjk@rh7we3gszj5r>
References: <20231011143809.1108034-1-thierry.reding@gmail.com>
 <hrfj43uaoozwbm6wqvpbnqp2axqubuuu4rlantbmmrbddtitq5@6u6y7jibmpfg>
 <87wmvjovlk.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87wmvjovlk.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 19, 2023 at 10:38:31AM +0200, Javier Martinez Canillas wrote:
> Maxime Ripard <mripard@kernel.org> writes:
> > On Wed, Oct 11, 2023 at 04:38:07PM +0200, Thierry Reding wrote:
> >> From: Thierry Reding <treding@nvidia.com>
> >> This contains two patches that bring simplefb up to feature parity with
> >> simpledrm. The patches add support for the "memory-region" property th=
at
> >> provides an alternative to the "reg" property to describe the memory
> >> used for the framebuffer and allow attaching the simple-framebuffer
> >> device to one or more generic power domains to make sure they aren't
> >> turned off during the boot process and take down the display
> >> configuration.
> >
> > I just talked with Sima about it in the hallway at XDC. I'm fine with
> > those patches in principle, but it looks to me that simpledrm doesn't
> > have support for power domains and we'll want that :)
> >
>=20
> It has support since commit 61df9ca23107 ("drm/simpledrm: Add support for
> multiple "power-domains") AFAIK.

Ah, my bad I didn't look in drm-misc-next

All good then, thanks!
Maxime

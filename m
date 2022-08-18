Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCE85982F1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 14:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A6814A764;
	Thu, 18 Aug 2022 12:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 719 seconds by postgrey-1.36 at gabe;
 Thu, 18 Aug 2022 12:05:45 UTC
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [176.9.242.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D17014A137;
 Thu, 18 Aug 2022 12:05:39 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id 328EF103B1EE1;
 Thu, 18 Aug 2022 13:53:38 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 0E5F2D554; Thu, 18 Aug 2022 13:53:38 +0200 (CEST)
Date: Thu, 18 Aug 2022 13:53:38 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Switch TGL-H DP-IN to dGFX when it's supported
Message-ID: <20220818115338.GA26586@wunner.de>
References: <20220816025217.618181-1-kai.heng.feng@canonical.com>
 <87leror4sl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87leror4sl.fsf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: tvrtko.ursulin@linux.intel.com,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, rodrigo.vivi@intel.com,
 Zenghui Yu <yuzenghui@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 16, 2022 at 11:06:18AM +0300, Jani Nikula wrote:
> On Tue, 16 Aug 2022, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> > On mobile workstations like HP ZBook Fury G8, iGFX's DP-IN can switch to
> > dGFX so external monitors are routed to dGFX, and more monitors can be
> > supported as result.
> >
> > To switch the DP-IN to dGFX, the driver needs to invoke _DSM function 20
> > on intel_dsm_guid2. This method is described in Intel document 632107.
> 
> Is this the policy decision that we want to unconditionally make,
> though?

In general, we handle switching of outputs between GPUs in vga_switcheroo.c
upon a request from user space via sysfs (well, debugfs currently).
It's up to users to decide which policy suits their needs best.

That said, we never grew support to allow different switching policies for
the built-in panel and external outputs.  Laptops supporting this are
rare.  Older MacBook Pros introduced between 2008 and 2010 are among them:
They have separate muxes for the panel and external DP port.  Our policy
is documented in a code comment in drivers/platform/x86/apple-gmux.c:

 * The external DP port is only fully switchable on the first two unibody
 * MacBook Pro generations, MBP5 2008/09 and MBP6 2010. This is done by an
 * `NXP CBTL06141`_ which is controlled by gmux.
 [...]
 * Our switching policy for the external port is that on those generations
 * which are able to switch it fully, the port is switched together with the
 * panel when IGD / DIS commands are issued to vga_switcheroo. It is thus
 * possible to drive e.g. a beamer on battery power with the integrated GPU.
 * The user may manually switch to the discrete GPU if more performance is
 * needed.
 *
 * On all newer generations, the external port can only be driven by the
 * discrete GPU. If a display is plugged in while the panel is switched to
 * the integrated GPU, *both* GPUs will be in use for maximum performance.
 * To decrease power consumption, the user may manually switch to the
 * discrete GPU, thereby suspending the integrated GPU.

In other words, on these older MacBook Pros, we switch the panel and
external DP port in unison, thus always allowing one of the two GPUs
to runtime suspend and save power.

Thanks,

Lukas

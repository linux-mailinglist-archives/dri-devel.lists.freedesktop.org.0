Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA4154C605
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 12:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1038110F14D;
	Wed, 15 Jun 2022 10:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 37A7510F14D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 10:26:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB368153B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 03:26:23 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 89B4A3F792
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 03:26:23 -0700 (PDT)
Date: Wed, 15 Jun 2022 11:26:19 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/arm/hdlcd: Take over EFI framebuffer properly
Message-ID: <Yqmzy6EySTJ68KU+@e110455-lin.cambridge.arm.com>
References: <0f96c44b10dcd1444ad43e6027fd5c6aff34e54d.1655211704.git.robin.murphy@arm.com>
 <3d6303d4-4569-7078-76e1-0f7c46d9556c@suse.de>
 <54a8a681-3a96-22cb-846d-9e406f10bab7@arm.com>
 <8693a65a-6866-3ec5-d2e1-d7fd132f7dab@suse.de>
 <a8350570-0ed5-dc91-c4a4-76931dec0c1d@redhat.com>
 <0b6426ec-b436-29b4-43d8-cf6449b3a202@suse.de>
 <1c1f7dcc-7122-a3e2-1a39-79f1671371c3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c1f7dcc-7122-a3e2-1a39-79f1671371c3@redhat.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 15, 2022 at 10:00:52AM +0200, Javier Martinez Canillas wrote:
> On 6/15/22 09:53, Thomas Zimmermann wrote:
> > 
> > 
> > Am 15.06.22 um 09:50 schrieb Javier Martinez Canillas:
> > [...]
> >>> Historically, most drivers call this function very early. But for error
> >>> recovery it would be better to do it as late as possible.  Ideally,
> >>> drivers would first initialize their DRM software state, then kickout
> >>> the generic driver, and finally take over hardware. But that would
> >>> require a careful review of each driver. :/
> >>>
> >>
> >> We got bug reports on Fedora about regressions caused by the fact that some
> >> programs made the (wrong) assumption that /dev/dri/card0 would be the "main"
> >> display and just hard-coded that path.
> > 
> > Shh! Don't tell anyone.
> >
> 
> :)
> 
> What I tried to say is that deciding where to kick out the firmware-provided
> framebuffer isn't trivial and would just land the patch as is. At some point
> we should probably agree on the best place and audit all the drivers to make
> sure that are doing it properly. 

I agree, we should review v2 with the updated API and land the patch if it is
reasonable. Due to my "cleverness" HDLCD and mali-dp are probably the only drivers
that also use the component framework that adds extra complications in terms of
silently not having all dependencies met (you forgot to compile the I2C driver or you
didn't load it as a module), so taking over the efifb framebuffer late is a good
idea.

Best regards,
Liviu

> 
> -- 
> Best regards,
> 
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

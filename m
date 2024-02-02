Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADE3847D2E
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 00:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBA410E8DA;
	Fri,  2 Feb 2024 23:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yB/e/tJf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618A210E8DA;
 Fri,  2 Feb 2024 23:38:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5A017CE2EA8;
 Fri,  2 Feb 2024 23:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E89AC433C7;
 Fri,  2 Feb 2024 23:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1706917087;
 bh=aGafW+AuanYuQZedcyvo9CsIkWE3LqB3BWtfCaod+iA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yB/e/tJfVi4GSFcStZoVf6gdrzwDzzBD/18SbsHCvLff+CA24l2sk2KGeTooU2Aov
 pf0f3eJC7DiBXU/4wBBUxNaTgEpZg0PMy4e+2BUnwTfsM6oN+Z/rIKzcuehkwjLNuz
 FsBBYxoj0PWvI3k4Pzocj0rHAD8140unw5fPmQ90=
Date: Fri, 2 Feb 2024 15:38:06 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Le Ma <le.ma@amd.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 James Zhu <James.Zhu@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Joerg Roedel <jroedel@suse.de>,
 Iwona Winiarska <iwona.winiarska@intel.com>,
 Robin Murphy <robin.murphy@arm.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 1/3] driver core: bus: introduce can_remove()
Message-ID: <2024020224-unsoiled-velcro-86af@gregkh>
References: <20240202222603.141240-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202222603.141240-1-hamza.mahfooz@amd.com>
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

On Fri, Feb 02, 2024 at 05:25:54PM -0500, Hamza Mahfooz wrote:
> Currently, drivers have no mechanism to block requests to unbind
> devices.

And that is by design.

> However, this can cause resource leaks and leave the device in
> an inconsistent state, such that rebinding the device may cause a hang
> or otherwise prevent the device from being rebound.

That is a driver bug, please fix your driver.

> So, introduce the can_remove() callback to allow drivers to indicate
> if it isn't appropriate to remove a device at the given time.

Nope, sorry, the driver needs to be fixed.

What broken driver are you needing this for?

Also realize, only root can unbind drivers (and it can also unload
modules), so if the root user really wants to do this, it can, and
should be possible to.

sorry,

greg k-h

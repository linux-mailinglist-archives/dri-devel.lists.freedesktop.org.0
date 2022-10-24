Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D088960A7BF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194DB10E577;
	Mon, 24 Oct 2022 12:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053AA10E577
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 12:56:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0EC29612F3;
 Mon, 24 Oct 2022 12:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5A0C433C1;
 Mon, 24 Oct 2022 12:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666616204;
 bh=Aj8rGkbmlbOVvsUE/P4+4AlLKINoWqE4Q7Nwzv0ANHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aMmxozKyw9OJplpzt+RkqexSnmuK0Gy0h2xd2f8hOx6AkVAAzHx/FMi5Byq78EZ0E
 iSu9esJraklvE9cXz4/0pvumDibDJMfkR0PBQTm9EPXKLUcw0hOYfzWTSmF8zaFQD2
 22CplQAkic6eB5hPiC8CvGADAwywzKZ5kvvlnT/U=
Date: Mon, 24 Oct 2022 14:35:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [RFC PATCH 0/3] new subsystem for compute accelerator devices
Message-ID: <Y1aGqudfxAiSZV2W@kroah.com>
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <af4c71cb-be60-e354-ca4f-23e834aca6e1@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af4c71cb-be60-e354-ca4f-23e834aca6e1@suse.de>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>,
 John Hubbard <jhubbard@nvidia.com>, Oded Gabbay <ogabbay@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>, Jiho Chu <jiho.chu@samsung.com>,
 Alex Deucher <alexander.deucher@amd.com>, Kevin Hilman <khilman@baylibre.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 24, 2022 at 01:55:56PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 22.10.22 um 23:46 schrieb Oded Gabbay:
> > In the last couple of months we had a discussion [1] about creating a new
> > subsystem for compute accelerator devices in the kernel.
> > 
> > After an analysis that was done by DRM maintainers and myself, and following
> > a BOF session at the Linux Plumbers conference a few weeks ago [2], we
> > decided to create a new subsystem that will use the DRM subsystem's code and
> > functionality. i.e. the accel core code will be part of the DRM subsystem.
> > 
> > This will allow us to leverage the extensive DRM code-base and
> > collaborate with DRM developers that have experience with this type of
> > devices. In addition, new features that will be added for the accelerator
> > drivers can be of use to GPU drivers as well (e.g. RAS).
> > 
> > As agreed in the BOF session, the accelerator devices will be exposed to
> > user-space with a new, dedicated device char files and a dedicated major
> > number (261), to clearly separate them from graphic cards and the graphic
> > user-space s/w stack. Furthermore, the drivers will be located in a separate
> > place in the kernel tree (drivers/accel/).
> > 
> > This series of patches is the first step in this direction as it adds the
> > necessary infrastructure for accelerator devices to DRM. The new devices will
> > be exposed with the following convention:
> > 
> > device char files - /dev/accel/accel*
> > sysfs             - /sys/class/accel/accel*/
> > debugfs           - /sys/kernel/debug/accel/accel*/
> 
> I know I'm really late to this discussion, but wouldn't 'compute' be a
> better name?
> 
> (I agree that skynet would also be nice :)

See the summary of the meeting we all held at the Plumbers conference
about this.  "accel" was the "least hated" of all of the options, so I
think we'll stick with that for now.

thanks,

greg k-h

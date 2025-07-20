Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E3B0B3AB
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 08:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141DD10E147;
	Sun, 20 Jul 2025 06:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3221310E147
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 06:05:27 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id 27A9320091AE;
 Sun, 20 Jul 2025 08:05:25 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 11943CC674; Sun, 20 Jul 2025 08:05:25 +0200 (CEST)
Date: Sun, 20 Jul 2025 08:05:25 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Mario Limonciello <superm1@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, David Airlie <airlied@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL IOMMU (VT-d)" <iommu@lists.linux.dev>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "open list:SOUND" <linux-sound@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>
Subject: Re: [PATCH v9 9/9] PCI: Add a new 'boot_display' attribute
Message-ID: <aHyHJZwIgEya_yfn@wunner.de>
References: <20250718173648.GA2704349@bhelgaas>
 <c7c8b0bf-8602-4030-acbe-ac56678b633c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7c8b0bf-8602-4030-acbe-ac56678b633c@kernel.org>
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

On Fri, Jul 18, 2025 at 12:44:11PM -0500, Mario Limonciello wrote:
> On 7/18/2025 12:36 PM, Bjorn Helgaas wrote:
> > On Fri, Jul 18, 2025 at 12:29:05PM -0500, Mario Limonciello wrote:
> > > On 7/18/2025 12:25 PM, Bjorn Helgaas wrote:
> > > > In addition to Mani's question about whether /sys/bus/pci/ is the
> > > > right place for this (which is a very good question), it's also been
> > > > pointed out to me that we've been trying to get rid of
> > > > pci_create_sysfs_dev_files() for years.
> > > > 
> > > > If it's possible to make this a static attribute that would be much,
> > > > much cleaner.
> > > 
> > > Right - I tried to do this, but the problem is at the time the PCI device is
> > > created the information needed to make the judgement isn't ready.  The
> > > options end up being:
> > > * a sysfs file for every display device with 0/1
> > > * a sysfs file that is not accurate until later in the boot
> > 
> > What's missing?  The specifics might be helpful if someone has another
> > crack at getting rid of pci_create_sysfs_dev_files() in the future.
> 
> The underlying SCREEN_INFO code tries to walk through all the PCI devices in
> a loop, but at the time all the devices are walked the memory regions
> associated with the device weren't populated.
> 
> So my earlier hack was to re-run the screen info check, and it was awful.

Well have you explored the sysfs_update_group() approach you mentioned
earlier?

https://lore.kernel.org/r/5cc01163-1feb-4a18-8060-27f4da39b2e4@kernel.org/

Thanks,

Lukas

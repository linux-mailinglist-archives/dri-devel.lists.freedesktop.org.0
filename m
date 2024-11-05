Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4572D9BD20E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 17:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B756510E065;
	Tue,  5 Nov 2024 16:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sWLIMHKb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B812F10E043;
 Tue,  5 Nov 2024 16:15:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 461B35C5537;
 Tue,  5 Nov 2024 16:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D505C4CECF;
 Tue,  5 Nov 2024 16:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730823351;
 bh=I7deoQiI/I0s0AnBYc3st405nHQMaQq7EvD2UtzD7R0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=sWLIMHKbpYnvH6vRYHC5fNsdXCCNIXg5Ll5/2V0vc6iO6jH8ObMQ4Be/2WJlSRkFO
 96/qxRGVh6YcfDqHdyjqlzEV4fxUjiBENL+duJ1uiL+Rqhoa3pZpaqTPPM+IhiqIFZ
 1Sk/o475+agOHv0qmgOhR36E0RtNgKxTuBr1ZJhfrXdvCOWlPgobXmSzUv+OFDnq3o
 nfjm0YQ6eFyuk0wALiKZYhYt2TgA8p2WUZTSSBteEaJwAKQSjXx+/iCrS96AAI40Ua
 e4I7EQ0gtyiErnCjgLdP+OJ0QkEAmXj83mHJYpDx6YeObr9yAZURKrOoBK0wWz3FbB
 ACYyypzEASVoA==
Date: Tue, 5 Nov 2024 10:15:50 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Logan Gunthorpe <logang@deltatee.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-cxl@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v2 00/10] sysfs: constify struct bin_attribute (Part 1)
Message-ID: <20241105161550.GA1474637@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
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

On Sun, Nov 03, 2024 at 05:03:29PM +0000, Thomas Weißschuh wrote:
> struct bin_attribute contains a bunch of pointer members, which when
> overwritten by accident or malice can lead to system instability and
> security problems.
> Moving the definitions of struct bin_attribute to read-only memory
> makes these modifications impossible.
> The same change has been performed for many other structures in the
> past. (struct class, struct ctl_table...)

Throughout series, it would be more readable if you added blank lines
between paragraphs.

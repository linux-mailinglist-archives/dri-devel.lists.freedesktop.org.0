Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B5EA46C97
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 21:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36F910E0C6;
	Wed, 26 Feb 2025 20:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fV8iNAC7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3925710E0C6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 20:38:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D3787611FB;
 Wed, 26 Feb 2025 20:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6862C4CED6;
 Wed, 26 Feb 2025 20:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1740602333;
 bh=7XYXLxmDs/g+GFsdMP00ShC9As4ZJdRFjOnafekKWK4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fV8iNAC7l4sOXlbbBPxr62ebH5w2CCdPAcSqIvutoYztu5oPQJIO+VleFuSaNJwgu
 4XgUTLEITbZ/EXzbMYjOUaYvhSzh8lkiZR+OX0Og6mdEO8tbUqzELkCgiiGXTD8w+8
 VA5I1aWrxf8HjtmXFunV8nM5CekAUj0+LkOLORow=
Date: Wed, 26 Feb 2025 12:38:51 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>, Yaron Avizrat
 <yaron.avizrat@intel.com>, Oded Gabbay <ogabbay@kernel.org>, Julia Lawall
 <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, James Smart
 <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Ilya
 Dryomov <idryomov@gmail.com>, Dongsheng Yang <dongsheng.yang@easystack.cn>,
 Jens Axboe <axboe@kernel.dk>, Xiubo Li <xiubli@redhat.com>, Damien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Carlos Maiolino
 <cem@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, Sebastian Reichel
 <sre@kernel.org>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig
 <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Frank Li
 <Frank.Li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shyam Sundar S K
 <Shyam-sundar.S-k@amd.com>, Hans de Goede <hdegoede@redhat.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Henrique de
 Moraes Holschuh <hmh@hmh.eng.br>, Selvin Xavier
 <selvin.xavier@broadcom.com>, Kalesh AP
 <kalesh-anakkur.purayil@broadcom.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon
 Romanovsky <leon@kernel.org>, cocci@inria.fr, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sound@vger.kernel.org, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, linux-rdma@vger.kernel.org, Takashi
 Iwai <tiwai@suse.de>, Carlos Maiolino <cmaiolino@redhat.com>
Subject: Re: [PATCH v3 00/16] Converge on using secs_to_jiffies() part two
Message-Id: <20250226123851.a50e727d0a1bfe639ece4a72@linux-foundation.org>
In-Reply-To: <79b24031-5776-4eb3-960b-32b0530647fb@sirena.org.uk>
References: <20250225-converge-secs-to-jiffies-part-two-v3-0-a43967e36c88@linux.microsoft.com>
 <79b24031-5776-4eb3-960b-32b0530647fb@sirena.org.uk>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 26 Feb 2025 11:29:53 +0000 Mark Brown <broonie@kernel.org> wrote:

> On Tue, Feb 25, 2025 at 08:17:14PM +0000, Easwar Hariharan wrote:
> > This is the second series (part 1*) that converts users of msecs_to_jiffies() that
> > either use the multiply pattern of either of:
> > - msecs_to_jiffies(N*1000) or
> > - msecs_to_jiffies(N*MSEC_PER_SEC)
> > 
> > where N is a constant or an expression, to avoid the multiplication.
> 
> Please don't combine patches for multiple subsystems into a single
> series if there's no dependencies between them, it just creates
> confusion about how things get merged, problems for tooling and makes
> everything more noisy.  It's best to split things up per subsystem in
> that case.

I asked for this.  I'll merge everything, spend a few weeks gathering
up maintainer acks.  Anything which a subsystem maintainer merges will
be reported by Stephen and I'll drop that particular patch.

This way, nothing gets lost.  I take this approach often and it works.

If these were sent as a bunch of individual patches then it would be up
to the sender to keep track of what has been merged and what hasn't. 
That person will be resending some stragglers many times.  Until they
give up and some patches get permanently lost.

Scale all that across many senders and the whole process becomes costly
and unreliable.  Whereas centralizing it on akpm is more efficient,
more reliable, more scalable, lower latency and less frustrating for
senders.


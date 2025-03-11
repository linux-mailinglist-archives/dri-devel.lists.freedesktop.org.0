Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B55A5B676
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 03:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB2610E010;
	Tue, 11 Mar 2025 02:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="wQfQZG6I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2331110E010
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 02:08:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8CA06A4656C;
 Tue, 11 Mar 2025 02:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872A9C4CEE5;
 Tue, 11 Mar 2025 02:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1741658886;
 bh=EO2y2EASnimfmC0To8IgjADGLB03IrpBXSrBRgvMOXc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=wQfQZG6IKVV4Tew+S+0o+lnw12y0URQfWSPems1i8x5dKQTaPMYHdQMJDIg/0LCcq
 9ysqdCzIccJgUTy5+1XImjyPHewrVrCASW3U/ThAkRtkSNX1mJCMOLQBPQJNwR3UZE
 sXCoysWhDTs3Eikr7+eLtWHhOyIiad0yrUckBntM=
Date: Mon, 10 Mar 2025 19:08:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Yaron Avizrat <yaron.avizrat@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix
 <nicolas.palix@imag.fr>, James Smart <james.smart@broadcom.com>, Dick
 Kennedy <dick.kennedy@broadcom.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Chris Mason <clm@fb.com>, Josef Bacik
 <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Ilya Dryomov
 <idryomov@gmail.com>, Dongsheng Yang <dongsheng.yang@easystack.cn>, Jens
 Axboe <axboe@kernel.dk>, Xiubo Li <xiubli@redhat.com>, Damien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Carlos Maiolino
 <cem@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, Sebastian Reichel
 <sre@kernel.org>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig
 <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Frank Li
 <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Henrique de Moraes Holschuh
 <hmh@hmh.eng.br>, Selvin Xavier <selvin.xavier@broadcom.com>, Kalesh AP
 <kalesh-anakkur.purayil@broadcom.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon
 Romanovsky <leon@kernel.org>, Easwar Hariharan
 <eahariha@linux.microsoft.com>, cocci@inria.fr,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org,
 linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 linux-rdma@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, Carlos Maiolino
 <cmaiolino@redhat.com>
Subject: Re: (subset) [PATCH v3 00/16] Converge on using secs_to_jiffies()
 part two
Message-Id: <20250310190803.aaf868760781c9ae3fbe6df1@linux-foundation.org>
In-Reply-To: <174165504986.528513.3575505677065987375.b4-ty@oracle.com>
References: <20250225-converge-secs-to-jiffies-part-two-v3-0-a43967e36c88@linux.microsoft.com>
 <174165504986.528513.3575505677065987375.b4-ty@oracle.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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

On Mon, 10 Mar 2025 21:19:03 -0400 "Martin K. Petersen" <martin.petersen@oracle.com> wrote:

> On Tue, 25 Feb 2025 20:17:14 +0000, Easwar Hariharan wrote:
> 
> > This is the second series (part 1*) that converts users of msecs_to_jiffies() that
> > either use the multiply pattern of either of:
> > - msecs_to_jiffies(N*1000) or
> > - msecs_to_jiffies(N*MSEC_PER_SEC)
> > 
> > where N is a constant or an expression, to avoid the multiplication.
> > 
> > [...]
> 
> Applied to 6.15/scsi-queue, thanks!
> 
> [02/16] scsi: lpfc: convert timeouts to secs_to_jiffies()
>         https://git.kernel.org/mkp/scsi/c/a131f20804d6

Really, an acked-by would have been much easier all around, but whatever.

Did you get my fix?

From: Andrew Morton <akpm@linux-foundation.org>
Subject: scsi-lpfc-convert-timeouts-to-secs_to_jiffies-fix
Date: Tue Feb 25 07:32:03 PM PST 2025

fix build

Cc: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: James Bottomley <james.bottomley@HansenPartnership.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/scsi/lpfc/lpfc_sli.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/scsi/lpfc/lpfc_sli.c~scsi-lpfc-convert-timeouts-to-secs_to_jiffies-fix
+++ a/drivers/scsi/lpfc/lpfc_sli.c
@@ -3954,7 +3954,7 @@ void lpfc_poll_eratt(struct timer_list *
 	else
 		/* Restart the timer for next eratt poll */
 		mod_timer(&phba->eratt_poll,
-			  jiffies + secs_to_jiffies(phba->eratt_poll_interval);
+			  jiffies + secs_to_jiffies(phba->eratt_poll_interval));
 	return;
 }
 
_


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E5FA2117E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 19:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2656510E126;
	Tue, 28 Jan 2025 18:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P4RylrDT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B949510E126
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 18:28:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B4AC3A40F8F;
 Tue, 28 Jan 2025 18:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831A6C4CEE4;
 Tue, 28 Jan 2025 18:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738088938;
 bh=5vKlyluoIwL5MLSNFaVfQU6gpPWlLBGUfC043Y4ZA48=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P4RylrDTIX8Uy8PaKXepTKmo9JbD2s1TqRqjVjk79EX6UIO6eP0djQtJJK88za5Fk
 JwkXSxGvgFzlp0bbaHNaHN00HXwLVEDwoROTo5wDfRfsMG/11EZ/60VjHn4wEmzqLa
 kcHBrGV05EUJahj0VGnWlSX1miKbeH9kIAO+dxoNow3QgUmwhY5pXRiW1OXApD28B+
 xQIEadslx9mpHUs2SEA3p3YZ8dPP9LWiKFJVTR9KJ/66eUffexnSqE6XYU8c9mp7pG
 pv+Gt1KZVlb4zPDYIUoffAngd1LNkOTrkLP3jy3oC+qPbj05QBwYJ5EYU4eU5MsroI
 zPBbqI0b5RbTw==
Date: Tue, 28 Jan 2025 11:28:52 -0700
From: Keith Busch <kbusch@kernel.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Yaron Avizrat <yaron.avizrat@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 Jens Axboe <axboe@kernel.dk>, Xiubo Li <xiubli@redhat.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Frank Li <Frank.Li@nxp.com>,
 Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Selvin Xavier <selvin.xavier@broadcom.com>,
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 cocci@inria.fr, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sound@vger.kernel.org, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, linux-rdma@vger.kernel.org
Subject: Re: [PATCH 11/16] nvme: convert timeouts to secs_to_jiffies()
Message-ID: <Z5kh5BYrYaDArkkU@kbusch-mbp>
References: <20250128-converge-secs-to-jiffies-part-two-v1-0-9a6ecf0b2308@linux.microsoft.com>
 <20250128-converge-secs-to-jiffies-part-two-v1-11-9a6ecf0b2308@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-converge-secs-to-jiffies-part-two-v1-11-9a6ecf0b2308@linux.microsoft.com>
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

On Tue, Jan 28, 2025 at 06:21:56PM +0000, Easwar Hariharan wrote:
> Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
> secs_to_jiffies().  As the value here is a multiple of 1000, use
> secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplication.
> 
> This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci with
> the following Coccinelle rules:
> 
> @depends on patch@
> expression E;
> @@
> 
> -msecs_to_jiffies
> +secs_to_jiffies
> (E
> - * \( 1000 \| MSEC_PER_SEC \)
> )
> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  drivers/nvme/host/core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index 76b615d4d5b91e163e5a6e7baf451c959a2c3cab..87498215ede4bcaf48660b89c901075dfcfaf041 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -4459,11 +4459,9 @@ static void nvme_fw_act_work(struct work_struct *work)
>  	nvme_auth_stop(ctrl);
>  
>  	if (ctrl->mtfa)
> -		fw_act_timeout = jiffies +
> -				msecs_to_jiffies(ctrl->mtfa * 100);
> +		fw_act_timeout = jiffies + msecs_to_jiffies(ctrl->mtfa * 100);
>  	else
> -		fw_act_timeout = jiffies +
> -				msecs_to_jiffies(admin_timeout * 1000);
> +		fw_act_timeout = jiffies + secs_to_jiffies(admin_timeout);
>  
>  	nvme_quiesce_io_queues(ctrl);
>  	while (nvme_ctrl_pp_status(ctrl)) {
> 
> -- 

Acked-by: Keith Busch <kbusch@kernel.org>

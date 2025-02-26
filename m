Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 895DDA4528C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 03:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0259E89FA7;
	Wed, 26 Feb 2025 02:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lbvJaOgP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D41589FA7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 02:00:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1AA8D5C5675;
 Wed, 26 Feb 2025 02:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76A4C4CEDD;
 Wed, 26 Feb 2025 02:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740535253;
 bh=QOAgMMGKbnJ6hZHvx6ZJYTRK+iZXq18TAlHT3acDveU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lbvJaOgPkZbnkOP5hNZv3kt8F37sM5wVNdz5pQoKBOvWJpcWyMv2mVC7qw0zww0FC
 tw0rFBZp3tLMdImqLCpGhcY34tv8uho+Lu2q/YVztsAQwyT0nOq0d2HlE+yumDi+2G
 NnGD4V7HBDpFdEYrgDp0+8hLWBlWldNGcN9+JQ1uf7k8Z8tTkCxsl34NLWQ8Vawbdb
 K9795FHlijgsdEKshsQNQoxr3/DEjO/bi0eHV3p1/sO3PbUu61pZGpWQwOCIptZowS
 rIy49xymFJKzj4FXwPSz54+5ZyqnT56OBQv1abO0kJMDp0bQ7XnwlRxW3/2snteMgS
 vdipJDYHPyQ2Q==
Message-ID: <2632bed9-4e4a-494a-bb89-d5aac64f854e@kernel.org>
Date: Wed, 26 Feb 2025 11:00:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/16] ata: libata-zpodd: convert timeouts to
 secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Yaron Avizrat <yaron.avizrat@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, James Smart
 <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, Jens Axboe <axboe@kernel.dk>,
 Xiubo Li <xiubli@redhat.com>, Niklas Cassel <cassel@kernel.org>,
 Carlos Maiolino <cem@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Selvin Xavier <selvin.xavier@broadcom.com>,
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 cocci@inria.fr, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org,
 linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 linux-rdma@vger.kernel.org
References: <20250225-converge-secs-to-jiffies-part-two-v3-0-a43967e36c88@linux.microsoft.com>
 <20250225-converge-secs-to-jiffies-part-two-v3-8-a43967e36c88@linux.microsoft.com>
 <ff51bcfc-10c8-4461-9f82-ea1d5ed784f8@linux.microsoft.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <ff51bcfc-10c8-4461-9f82-ea1d5ed784f8@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
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

On 2/26/25 5:24 AM, Easwar Hariharan wrote:
> On 2/25/2025 12:17 PM, Easwar Hariharan wrote:
>> Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
>> secs_to_jiffies().  As the value here is a multiple of 1000, use
>> secs_to_jiffies() instead of msecs_to_jiffies() to avoid the multiplication
>>
>> This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci with
>> the following Coccinelle rules:
>>
>> @depends on patch@
>> expression E;
>> @@
>>
>> -msecs_to_jiffies
>> +secs_to_jiffies
>> (E
>> - * \( 1000 \| MSEC_PER_SEC \)
>> )
>>
>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>> ---
> 
> This was meant to carry Damien's ack once the subject line was fixed[1], but I fixed
> the subject line and missed adding the ack in. Damien, would you like to ack again?

Looks like Andrew already applied the patch, which is fine.
But nevertheless:

Acked-by: Damien Le Moal <dlemoal@kernel.org>


-- 
Damien Le Moal
Western Digital Research

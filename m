Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C12CA34C3E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8643A10EB63;
	Thu, 13 Feb 2025 17:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="MqwOKrlM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7124410EB63
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:45:43 +0000 (UTC)
Received: from [100.65.1.94] (unknown [20.236.11.69])
 by linux.microsoft.com (Postfix) with ESMTPSA id D7186203D61D;
 Thu, 13 Feb 2025 09:45:40 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D7186203D61D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1739468742;
 bh=CjdDB9uvZBBF3c03e9VylpCG5WkQPsjk1qSKlO3MQtE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=MqwOKrlM0wNKTlUgCtpn9gJKIpfGiwVh9dHGNNF4ycPmXa/idcQ30iiksOd4FJJaH
 jrqNCD9r00CbzdjGOPFOZ+MnFU6woy29/+YEkOfP14iTKCcgK64o8pGQaLxlVNUpHe
 bIb4sXQD9rr6g8CsvFcC34/zgx+kxX5/LItW+SLg=
Message-ID: <8f80b65e-724c-439c-a094-4bfbb1e296f1@linux.microsoft.com>
Date: Thu, 13 Feb 2025 09:45:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, Yaron Avizrat <yaron.avizrat@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, James Smart
 <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, Jens Axboe <axboe@kernel.dk>,
 Xiubo Li <xiubli@redhat.com>, Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Frank Li <Frank.Li@nxp.com>,
 Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
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
 linux-rdma@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 00/16] Converge on using secs_to_jiffies() part two
To: Andrew Morton <akpm@linux-foundation.org>
References: <20250128-converge-secs-to-jiffies-part-two-v1-0-9a6ecf0b2308@linux.microsoft.com>
 <20250128161643.289d9fe705ef2fdba0b82a52@linux-foundation.org>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <20250128161643.289d9fe705ef2fdba0b82a52@linux-foundation.org>
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

On 1/28/2025 4:16 PM, Andrew Morton wrote:
> On Tue, 28 Jan 2025 18:21:45 +0000 Easwar Hariharan <eahariha@linux.microsoft.com> wrote:
> 
>> This is the second series (part 1*) that converts users of msecs_to_jiffies() that
>> either use the multiply pattern of either of:
>> - msecs_to_jiffies(N*1000) or
>> - msecs_to_jiffies(N*MSEC_PER_SEC)
>>
>> where N is a constant or an expression, to avoid the multiplication.
>>
>> The conversion is made with Coccinelle with the secs_to_jiffies() script
>> in scripts/coccinelle/misc. Attention is paid to what the best change
>> can be rather than restricting to what the tool provides.
>>
>> Andrew has kindly agreed to take the series through mm.git modulo the
>> patches maintainers want to pick through their own trees.
> 
> I added patches 2-16 to mm.git.  If any of these later get merged into
> a subsystem tree, Stephen will tell us and I'll drop the mm.git copy.

Hi Andrew, I don't see these in mm-nonmm-unstable. Did these get dropped in the confusion around
casting secs_to_jiffies() to unsigned long[1]? That has since been merged in 6.14-rc2 via tglx' tree,
and I have a v2 for just the ceph patches that needed some fixups at [2].

[1] https://lore.kernel.org/all/20250130192701.99626-1-eahariha@linux.microsoft.com/
[2] https://lore.kernel.org/all/20250203-converge-secs-to-jiffies-part-two-v2-0-d7058a01fd0e@linux.microsoft.com/

Thanks,
Easwar (he/him)

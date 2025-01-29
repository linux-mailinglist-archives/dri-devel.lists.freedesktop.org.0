Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1571A223A4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 19:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F9F10E855;
	Wed, 29 Jan 2025 18:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="aAf9IIr/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0691610E855
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 18:14:40 +0000 (UTC)
Received: from [100.65.98.224] (unknown [20.236.10.163])
 by linux.microsoft.com (Postfix) with ESMTPSA id 28F3F2066C1F;
 Wed, 29 Jan 2025 10:14:38 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 28F3F2066C1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1738174479;
 bh=tZu7Aqdcq4BHW7QoklKujtbGCaxot/XApiLegvlW9Cg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=aAf9IIr/I90cgqgEBczLilZ7bdtCYRLZiEJHEhBdKJpSoOCumeMDEGeLf0xioaxnU
 Cxs0rQCB+cTOuTBJEpsGVDSTUnsyW+Sqnpdni5YRWUzescyOcAANxe89dy6cL7UnK5
 9o+lRZL0v3hO8jHtI+YxGsr5kQTHif7tO+OZbuMk=
Message-ID: <670dbe5b-cf5b-4994-9a47-53b0b52a4b20@linux.microsoft.com>
Date: Wed, 29 Jan 2025 10:14:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, Andrew Morton <akpm@linux-foundation.org>,
 Yaron Avizrat <yaron.avizrat@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, Jens Axboe <axboe@kernel.dk>,
 Xiubo Li <xiubli@redhat.com>, Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
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
Subject: Re: [PATCH 09/16] xfs: convert timeouts to secs_to_jiffies()
To: Christoph Hellwig <hch@lst.de>
References: <20250128-converge-secs-to-jiffies-part-two-v1-0-9a6ecf0b2308@linux.microsoft.com>
 <20250128-converge-secs-to-jiffies-part-two-v1-9-9a6ecf0b2308@linux.microsoft.com>
 <20250129052108.GB28513@lst.de>
 <3e4a8a44-483b-457a-b193-4119e4adfa85@linux.microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <3e4a8a44-483b-457a-b193-4119e4adfa85@linux.microsoft.com>
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

On 1/29/2025 9:12 AM, Easwar Hariharan wrote:
> On 1/28/2025 9:21 PM, Christoph Hellwig wrote:
>> On Tue, Jan 28, 2025 at 06:21:54PM +0000, Easwar Hariharan wrote:
>>>  		else
>>> -			cfg->retry_timeout = msecs_to_jiffies(
>>> -					init[i].retry_timeout * MSEC_PER_SEC);
>>> +			cfg->retry_timeout = secs_to_jiffies(init[i].retry_timeout);
>>
>> This messes up the formatting by introducing an overly long line.
>>
>> Otherwise the change looks fine.
> 
> I'll fix this in v2. Thanks for the review!
> 
> - Easwar (he/him)

Andrew seems to have fixed it up in his copy, so I'll skip this change
in v2. Thanks Andrew!

- Easwar

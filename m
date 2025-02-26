Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEC3A45DF6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 12:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F2C10E8BD;
	Wed, 26 Feb 2025 11:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="FgF5BQbo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD15010E8D4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 11:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1740570931; x=1741175731; i=markus.elfring@web.de;
 bh=sTX8xi6LRWxYofvmbcRQIPwzk4BhNjim5Kc1TZCgi5I=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:Cc:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=FgF5BQbol86RnWL2Sk24p7qdL5tQLOeT6f07Kvxk4P0VuErz4WgTRL7pn6j/9HBZ
 z+cak2KgFRXeyXt7h/+BTqXGvv0hTXqqct+9+hLjPcNj3botKQ3pCtj1zGcH4ifEh
 yFa3sBuphYKHeZZwVQaSV3wyFrLsvWanJ3Z6ukLmBSFQ8+HjJKTN807sEt43aEoUg
 HbB2HsK30RgebgKAq9z+FLUxZ7GFREklxLf4JkReYQU8HhTTePiNS5BpbM3Q4Iq3/
 /8xzXq7fVNqYLas56fa9vFIZ5anQ0OIXKnqjBE+M5zkQbuCHIU124L0CnFIHiM9E2
 ngho7wBag929Q1fQLw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.43]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M604f-1tfrLt2zXv-00E5Ph; Wed, 26
 Feb 2025 12:55:30 +0100
Message-ID: <5495665a-774b-4bc5-8eb2-a9680d09b0be@web.de>
Date: Wed, 26 Feb 2025 12:55:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [PATCH v3 04/16] ALSA: ac97: convert timeouts to
 secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>, cocci@inria.fr,
 Andrew Morton <akpm@linux-foundation.org>,
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
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Frank Li <Frank.Li@nxp.com>,
 Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Selvin Xavier <selvin.xavier@broadcom.com>,
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>
References: <20250225-converge-secs-to-jiffies-part-two-v3-0-a43967e36c88@linux.microsoft.com>
 <20250225-converge-secs-to-jiffies-part-two-v3-4-a43967e36c88@linux.microsoft.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org,
 linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 linux-rdma@vger.kernel.org, kernel@pengutronix.de,
 Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20250225-converge-secs-to-jiffies-part-two-v3-4-a43967e36c88@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ucYXuYgBQVTEWaObV/mFjtsvpzQ/KO5i5l5ZjdohfyGQ4hlxvcY
 sTVdlsTl9fld7Rgr2WyDph9nJLEmgybCGSVtuMLyhQK485ALORk88bsJZJIOfByFUNZedr7
 Tig7GhQucLbNWxtaLBapV3p7oWArgHdIII/eRzvvtip6IPoz+StdW8P4rzipPjdrxqJNq7V
 w9kH46OLKD2fAu1DJ4I4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NqOsrw7wXz4=;wwgFpUfWgrNKqonaHrxuK0zBMVo
 mDjqDBwUTGC2TEakQ0FQpQb+jPeq8+VUsHA9FysNiUMcu9jvRYzUnVW/cePngei1HuxUi+9jB
 gzwpaGWWDjDgiqloN8NkKw7fK1k9aiq9WO2QV+FahFVJxKCiEOht1QwMKGQlNmk9KSfqrx+xY
 /ZLupqHBoI8IrXEf4BLPHHel92dIDpHQKboSzjjYqqe+D17jNVvkdG6fNPyA61KaW3VNs4cNO
 VvTz7objQwY3sXV9VVKfi5xn57PHN9mTjtQuIqd+Fkmo2WDIvSm1qZXwIHn3nMByQ+tt7svzC
 Q8spwoR/tPpS2RHogJczvjm/AJwifCv3M4zmOA7P6thgwODVRmcvR/4vF01uKQLuK9qMgFlyc
 bcgjRUxbqZme7tOe+3/skv2xiRyQEbhJKJtGN5D+YuDiSWxugE0waVrKszeAKPmktude+e3Wm
 hb6pdZnYZCt8B9GbDEP5Vb/mlwKymujzJht1qssYcn8d3Ml1SMkSc3vuwSRHDX6T7apEaslxL
 H1ldZBfcHAqqxfpa5LbXdHASW4m4p3H0K1hJHORXZqCUnOEcZxDWNffnSEspRVYifgrFqGv4y
 Kj26KhRIVUoBKuigt9Q2mdl8jTmWXytY3VzlUIiR7tUQHVdIIbUdCyTnywoOmuD6VO0yepr5x
 bLQ4dW/TIsHMfmgenog//zbU7q2CO3bneqDQJPNt+SnDmx59ilBfNjed2YgZwvn4cQlSdaI0L
 F6NIFthjhreE3/Mi2NLvYEGxVUZoOMS2U7r5bxeagKeTc2gxxXa1GQVKaGa4DKQrDpFctrZO+
 VgS1EfusE5lk8m0igJwjGV8T5jJ4yK8zBmXHUgf2B7xsqbzIVsymf73VTGRYna5d8fpSlwFol
 Z7qd+KqzL47eifD09GmZjoE4UJBGc7zuzHDS6dRLZAuI/Zl84ps/Ym32YxhbN/YAsutAmmp+v
 TOkjv6MdafHxETdnQKdh/rPigxuHdcazx7XB6EEgDKbDg3iSQfzRgSR4xQ4NJ8AZ2iLg0mWum
 0vXgI8wXv34gMt9O2p3er2RQWDsVcZ08cX04PIZdsztxTjwu0CPkBaXXuUyTd+ZnGMu5xuqJ6
 NVigR36nr3N2Z8mQFMK5WqrimZH+EH+M90+yC79G0/T7t0PPocKOZnJL41HJTo+LovTIveleV
 HWrp9ctFsgjPDj6UJNJTykjtt8NgQ82/CLAEHggdCeEf/T9E6KPlLG59U+DvbDeDV1a/KcYk6
 oIKY/n0w1wj9RkAu6PcR+vZ6tUptSyjIto4BLBRON4Vu2xjOkAgT2n2QCgRNb4wktwpFOdB2t
 dil/Pn0qWsKxuLlEMj/YzfiGEHQVObo/J888IPK+k+5H0DLKihuIJZ57xoknHewbhE68lpmcV
 rG+nfMuo4dycdcDOCDQ3IWqIkBsiusNZFDRDG0JStERTtnEkvLAd8i/CYVJdEg4hKBw+fpLvN
 wNpIdlENtYji5zVvncyHslb0goYM=
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

=E2=80=A6
> This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci wi=
th
> the following Coccinelle rules:

Is only a single SmPL script rule relevant here?


> @depends on patch@
> expression E;
> @@
>
> -msecs_to_jiffies
> +secs_to_jiffies
> (E
> - * \( 1000 \| MSEC_PER_SEC \)
> )

I would miss two space characters in the first text column.
Please avoid typos also in such SmPL code.
Would you like to compare your contributions with a previous change sugges=
tion
like =E2=80=9C[PATCH v3 03/16] accel/habanalabs: convert timeouts to secs_=
to_jiffies()=E2=80=9D
once more?
https://lore.kernel.org/cocci/20250225-converge-secs-to-jiffies-part-two-v=
3-3-a43967e36c88@linux.microsoft.com/

Regards,
Markus

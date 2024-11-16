Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7799CFE2E
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 11:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975D110E245;
	Sat, 16 Nov 2024 10:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="wW9Dq3AZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277EF10E245
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2024 10:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1731753089; x=1732357889; i=markus.elfring@web.de;
 bh=eoB4Zba0oDILq/GyWjNIQLXHlVmq6QUNlZtjwtBqfrw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:Cc:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=wW9Dq3AZud0Mh8eIxx8h+BRWpDDanRbjX7te2PngHotAhatJcH6+ajq66DZf63ea
 x9DLAuX0ykm1CYkqOs2orWjR7ZQJhXLpZmi2LBFfsAYIhsv+oOmAyyLBXirS2etaB
 3v8P6ihgau9jYhEfuIxCW8C0qj/THZBJsFVy9UjbdEdswUDtqXoh5WN2vo2c8QIC2
 ZprWvwJrtaM5bhc1Y9aX3gLsg/KsfMgK11tyTQ6hzA0bcd65ovg1TdT4r4xPUSvmO
 +KtpYjEAK6gPBLG0T4JNvXp3Pc6eKzqMjpmUE9I0V75TuY1sr3p2Vk6RUU1fk1MxQ
 1RnqQMWB4+ZDArE2sA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M8kEV-1t87Dv2SuX-00FywX; Sat, 16
 Nov 2024 11:23:22 +0100
Message-ID: <9088f9a2-c4ab-4098-a255-25120df5c497@web.de>
Date: Sat, 16 Nov 2024 11:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [PATCH v2 02/21] coccinelle: misc: Add secs_to_jiffies
 script
To: Easwar Hariharan <eahariha@linux.microsoft.com>, cocci@inria.fr
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-2-911fb7595e79@linux.microsoft.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-scsi@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 linux-mm@kvack.org, linux-bluetooth@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 ceph-devel@vger.kernel.org, live-patching@vger.kernel.org,
 linux-sound@vger.kernel.org, etnaviv@lists.freedesktop.org,
 oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>,
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Jack Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann
 <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Louis Peens <louis.peens@corigine.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-2-911fb7595e79@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ozemPo5Q9OPy+/gWIfbNb/yTAwp7zpbaqzDjn4mcTmOYffBLZAH
 E0gCP/qnqze9l4Bx97cEhIN2OOovptOgRBkBUi+bKyV+a6ol7S4atoRxVmjqBCc2g41VI8a
 ROXhUKP5mlUoyzcJqOavJdVAoW8iKSPURqEhcga4JsnmJm/Pjl1vO+foxZw0grHWEblCrYI
 LJ17n1lYaEdE61JhX5uvg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ut1/dqQTShk=;F91m7WPtJ3BUlVtKRZAnC+LWCZI
 +cjg25fBUksbtmXV3nSekf0nLkHlUg4tw3z4wJctDOB9qkRVE5T3889SK3u5OptuGCUjAgrRf
 L6lrbhw6GVbJKYcgnlSqdu1AUNxdBMhY8cs/buNF0m9zdffO7397JvKUWSE0xfZoPvfVoiMtQ
 2rypQvC+rAdvnjnqX8Z/l5k+Ta4df6gtnQvEEsYlCov9jYav74lPb8Xas1COGI9D3lbjDyE1R
 xQHUN5EKkVXWHCZYvzqjvkK7xgPuLQmwwKaKwn4FWyyoU8MOdgZqVvWWExog11GG0Bj0waEUX
 HUF6YaxivoxzV2Y5r6LAhOiUt+GhhmvrhgCG4+8JWzJdznufPV4+fP5RiQujgbpv4FQKCggkT
 01YuDMSvbhlBCwREndb1mVyp/Erqfz9nbAeHfrlRmQkPDlPPMfDp37/XjM9SgT9g+3E1xLDzU
 6tjKxDcoMNwIfLBQAhkn/ctTSaSOGeSTJzvC4lcDGr0qvfJXzxBKJvncbMk+yMqocqR8p094H
 cSM2zmRmlXf68Vxl9f0C7PKENLFipAxCDkva4DTvoVoUlI6L/GtfVX31tDhqzH1PFsgN3pqgA
 uOLYrVX3IK9TTGfCi2nSCbQTe0E7nATRkM0VKCUZGi+5RpXx2iG0D9UNHgMvG3BL7wdrVBTHd
 BJ+c4iVcO8Svev6YSdYxb1bL3paWXdHs8pyu1P4qoch+rL3WDY2bpB4E+pAFlwHbOO3e/EfS5
 F1WlN2iSMXR4ghTDMCs9q/a9XUxas73+B6HL+2MGt4NnSTabSXrIWg+WxI1MpkT2odmFv3Upb
 BMqveJ3dDzTl4lVtdfqBjUxzAjnvnI3fgq9DlyELZUJD7cUU7+mWoUVp575fJT8KXsst97DoH
 2wg3SL/rW5+og6V1XmzKomcDLIBRD9wsq1M3n0ZVJM6dUoisRvTDLFWOYa1bwyAfdRxqEZZYL
 f/k/ozG8py9wxlN+Q1xgfUvmnR1kZgL5rJjRRSXKfSx0DYecB5roqhMSSN9DHVKRnVKG/Q==
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

Why is a change description missing here?


=E2=80=A6
> +++ b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> @@ -0,0 +1,21 @@
=E2=80=A6
> +/// Find usages of:
> +/// - msecs_to_jiffies(value*1000)
> +/// - msecs_to_jiffies(value*MSEC_PER_SEC)

I suggest to take another look at corresponding development documentation.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/dev-tools/coccinelle.rst?h=3Dv6.12-rc7#n71

Will the attention grow for the proper usage of operation modes
according to the tool =E2=80=9Ccoccicheck=E2=80=9D?


=E2=80=A6
> +// Copyright: (C) 2024 Easwar Hariharan Microsoft

Should personal details and company names be better distinguished in such =
information?


> +//
> +// Keywords: secs, seconds, jiffies

May a (blank) comment line be omitted here?


> +@@ constant C; @@
> +
> +- msecs_to_jiffies(C * 1000)
> ++ secs_to_jiffies(C)
> +
> +@@ constant C; @@
> +
> +- msecs_to_jiffies(C * MSEC_PER_SEC)
> ++ secs_to_jiffies(C)

I suggest to take a SmPL code variant (like the following)
better into account.


@depends on patch@
constant C;
@@
-msecs_to_jiffies
+secs_to_jiffies
 (C
- * \( 1000 \| MSEC_PER_SEC \)
 )


Can any expressions become relevant besides =E2=80=9Cconstants=E2=80=9D?

Regards,
Markus

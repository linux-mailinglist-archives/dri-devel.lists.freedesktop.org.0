Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D20C9EBF66
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 00:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE1D10E2F3;
	Tue, 10 Dec 2024 23:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JEUFC7jH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B5E10E2F3;
 Tue, 10 Dec 2024 23:36:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D5B0DA41CB9;
 Tue, 10 Dec 2024 23:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557E2C4CED6;
 Tue, 10 Dec 2024 23:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1733873767;
 bh=HHHMPXzhb0ErTbk6JDPXkklA5yJiK4ykiwi4ou5ZnCc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JEUFC7jHRCmHI3pSRcaodXf1l/diOVpYu0xkyvRNQH8mQQn7b8CBtOxBJCrSzxiPd
 x5Ao+At5E5iCnmOoRtx4XFH3yzCpaefWwlAOlUrwnX+e1Xpsqclis9IS5OMX5ZHkAC
 NceJVwBIegWzfPrxO3hIAUaRVAN7EpBlmQG/j2MY=
Date: Tue, 10 Dec 2024 15:36:04 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>, Pablo Neira Ayuso
 <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Julia Lawall
 <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack
 <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Ofir
 Bitton <obitton@habana.ai>, Oded Gabbay <ogabbay@kernel.org>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>, Dick Kennedy
 <dick.kennedy@broadcom.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Jens Axboe <axboe@kernel.dk>, Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Jack Wang <jinpu.wang@cloud.ionos.com>, Marcel
 Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Xiubo Li <xiubli@redhat.com>, Ilya
 Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri
 Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek
 <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Louis Peens
 <louis.peens@corigine.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen
 <anna-maria@linutronix.de>
Subject: Re: [PATCH v3 00/19] Converge on using secs_to_jiffies()
Message-Id: <20241210153604.cf99699f264f12740ffce5c7@linux-foundation.org>
In-Reply-To: <315e9178-5b10-4de0-bdcf-7243e0e355bb@oss.qualcomm.com>
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
 <315e9178-5b10-4de0-bdcf-7243e0e355bb@oss.qualcomm.com>
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

On Tue, 10 Dec 2024 15:14:22 -0800 Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:

> On 12/10/2024 2:02 PM, Easwar Hariharan wrote:
> > This is a series that follows up on my previous series to introduce
> > secs_to_jiffies() and convert a few initial users.[1] In the review for
> > that series, Anna-Maria requested converting other users with
> > Coccinelle. [2] This is part 1 that converts users of msecs_to_jiffies()
> > that use the multiply pattern of either of:
> > - msecs_to_jiffies(N*1000), or
> > - msecs_to_jiffies(N*MSEC_PER_SEC)
> > 
> > where N is a constant, to avoid the multiplication.
> > 
> > The entire conversion is made with Coccinelle in the script added in
> > patch 2. Some changes suggested by Coccinelle have been deferred to
> > later parts that will address other possible variant patterns.
> > 
> > CC: Anna-Maria Behnsen <anna-maria@linutronix.de>
> > Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> 
> I have the same question as before: How do you expect these to land?
> Do you now have a maintainer who will take all of them?
> Or do you want individual maintainers to take the ones applicable to them?

I'll just grab everything and see if anyone complains ;)

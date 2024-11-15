Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E7B9CFB0A
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 00:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782DD10E183;
	Fri, 15 Nov 2024 23:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="SaYzzMZW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="o0jZxjqE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5C810E183;
 Fri, 15 Nov 2024 23:20:48 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1731712845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ocF2UaqffllWgiGWdH3dEXBRLSQ8zx6v3UTSvYUEWBM=;
 b=SaYzzMZW0ZsY0TGo8HlsbXzuUvCi20iDEgp+8ohYBSE4TZQXRHLKLbged2BOetLpsx4OkO
 tbZB0k+QLCEJmNzJNJ7TX06kODrXybKEr0MN0pB2oucYCsCZhXwiPTvkrVYx4d0RSom1W9
 M5V6DhOs4++KN4sHh/UkGD4PfYSgL/msvq0en1H26aBKpf6quxCthUWooMmyaT4o/QkfC2
 lCNSo4ipp434fYIwklbWGy8m/kIcsHAL1J9mGF0JwBaNElltRXstfx+KSUKFTEf5oJlO1l
 imvGv9XAnBM1fMHYuOdaaDvDY2O6X0pakSlzfvsLT9wL98INhCHIDkaV3HsBDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1731712845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ocF2UaqffllWgiGWdH3dEXBRLSQ8zx6v3UTSvYUEWBM=;
 b=o0jZxjqE/bb/KZAxT0liDWVEJtakeTQr/m7JfpgliBKuwvw5FjJoNIULPPZ+hcCbxwHCjD
 VmO8h0eWyvF8dzAA==
To: Easwar Hariharan <eahariha@linux.microsoft.com>, Jeff Johnson
 <quic_jjohnson@quicinc.com>
Cc: eahariha@linux.microsoft.com, netfilter-devel@vger.kernel.org,
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
 etnaviv@lists.freedesktop.org, oss-drivers@corigine.com,
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Naveen N Rao <naveen@kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Louis Peens <louis.peens@corigine.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Lucas Stach
 <l.stach@pengutronix.de>, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela
 <perex@perex.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Miroslav Benes <mbenes@suse.cz>, Jiri Kosina
 <jikos@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Ilya Dryomov
 <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>, Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Luiz Augusto von Dentz
 <luiz.dentz@gmail.com>, Johan Hedberg <johan.hedberg@gmail.com>, Jens
 Axboe <axboe@kernel.dk>, Marcel Holtmann <marcel@holtmann.org>, Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>, Jack
 Wang <jinpu.wang@cloud.ionos.com>, Andrew Morton
 <akpm@linux-foundation.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Praveen Kaligineedi
 <pkaligineedi@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, James
 Smart <james.smart@broadcom.com>, Dick Kennedy
 <dick.kennedy@broadcom.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Jeroen de Borst <jeroendb@google.com>, Shailend Chand
 <shailend@google.com>, Thomas Zimmermann <tzimmermann@suse.de>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>, Ofir Bitton
 <obitton@habana.ai>, Sven Schnelle <svens@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko
 Carstens <hca@linux.ibm.com>, Russell King <linux@armlinux.org.uk>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>, Nicolas Palix
 <nicolas.palix@imag.fr>, Julia Lawall <Julia.Lawall@inria.fr>, Simon
 Horman <horms@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller"
 <davem@davemloft.net>, Jozsef Kadlecsik <kadlec@netfilter.org>, Pablo
 Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH v2 00/21] Converge on using secs_to_jiffies()
In-Reply-To: <8127a2e6-fa62-4c85-b7ed-24748cc9e285@linux.microsoft.com>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <10ee4e8f-d8b4-4502-a5e2-0657802aeb11@linux.microsoft.com>
 <3ac480f5-549b-4449-baa9-f766e074c409@quicinc.com>
 <8127a2e6-fa62-4c85-b7ed-24748cc9e285@linux.microsoft.com>
Date: Sat, 16 Nov 2024 00:20:50 +0100
Message-ID: <87plmwytgt.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, Nov 15 2024 at 14:15, Easwar Hariharan wrote:
> On 11/15/2024 1:41 PM, Jeff Johnson wrote:
>> 
>> How do you expect this series to land since it overlaps a large number of
>> maintainer trees? Do you have a maintainer who has volunteered to take the
>> series and the maintainers should just ack? Or do you want the maintainers to
>> take the individual patches that are applicable to them?
>> 
>> /jeff
>
> I am hoping for tglx to take it through his tree since the patch
> introducing secs_to_jiffies() is in his tree, so sequencing of
> dependencies would not be an issue.

Right, but it's two days before the merge window opens, so no.

> But if tglx won't, we could push it out another cycle and individual
> maintainers can take the patches that are applicable to their tree for
> the series.

That's the easiest way forward as it does not create conflicts and all
maintainers will have the base patch in their trees after rc1.

Thanks,

        tglx

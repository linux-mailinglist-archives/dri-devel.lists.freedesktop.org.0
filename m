Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDD49D35AC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 09:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72EC10E6CB;
	Wed, 20 Nov 2024 08:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="SIRiPqoh";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="eLQee8Kl";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="SIRiPqoh";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="eLQee8Kl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9065210E5F7;
 Tue, 19 Nov 2024 09:09:57 +0000 (UTC)
Received: from pobox.suse.cz (unknown [10.100.2.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D475321901;
 Tue, 19 Nov 2024 09:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1732007396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d3ZUiM0v/u9S5PwB6Ydqo1vhiAlHB49FGA/7ikHpEDE=;
 b=SIRiPqohnfZsfiR8rWfugglV6kBt9WZNkpsbbr+OOaRL3B/gLbNYdP82bjB0S/Sjpyp4Dh
 6DaUo1iD8tvsOcOGm8MLnAkvlYyhNoN/BKk+Nu5/yLAfPrF9/Eu//yrmX3tKwCADYf1zxx
 7juTShWa4+8m5I6ysJKabU6DZBznQQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1732007396;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d3ZUiM0v/u9S5PwB6Ydqo1vhiAlHB49FGA/7ikHpEDE=;
 b=eLQee8Kl//Z+uAJMSQ8O/3uMhn0cIi08Nnfcslit1gjRhYGbaqZ6swdcVqziESyeoUyf0K
 N0AZng7gJdnO9PAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1732007396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d3ZUiM0v/u9S5PwB6Ydqo1vhiAlHB49FGA/7ikHpEDE=;
 b=SIRiPqohnfZsfiR8rWfugglV6kBt9WZNkpsbbr+OOaRL3B/gLbNYdP82bjB0S/Sjpyp4Dh
 6DaUo1iD8tvsOcOGm8MLnAkvlYyhNoN/BKk+Nu5/yLAfPrF9/Eu//yrmX3tKwCADYf1zxx
 7juTShWa4+8m5I6ysJKabU6DZBznQQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1732007396;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d3ZUiM0v/u9S5PwB6Ydqo1vhiAlHB49FGA/7ikHpEDE=;
 b=eLQee8Kl//Z+uAJMSQ8O/3uMhn0cIi08Nnfcslit1gjRhYGbaqZ6swdcVqziESyeoUyf0K
 N0AZng7gJdnO9PAg==
Date: Tue, 19 Nov 2024 10:09:55 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Petr Mladek <pmladek@suse.com>
cc: Easwar Hariharan <eahariha@linux.microsoft.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Pablo Neira Ayuso <pablo@netfilter.org>, 
 Jozsef Kadlecsik <kadlec@netfilter.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Julia Lawall <Julia.Lawall@inria.fr>, 
 Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>, 
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jeroen de Borst <jeroendb@google.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>, 
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 James Smart <james.smart@broadcom.com>, 
 Dick Kennedy <dick.kennedy@broadcom.com>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 =?ISO-8859-15?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, 
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Jack Wang <jinpu.wang@cloud.ionos.com>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Louis Peens <louis.peens@corigine.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Naveen N Rao <naveen@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, netfilter-devel@vger.kernel.org, 
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
 linuxppc-dev@lists.ozlabs.org, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH v2 19/21] livepatch: Convert timeouts to secs_to_jiffies()
In-Reply-To: <ZzxR3uAcWFEPUIUK@pathway.suse.cz>
Message-ID: <alpine.LSU.2.21.2411191006340.15289@pobox.suse.cz>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-19-911fb7595e79@linux.microsoft.com>
 <718febc4-59ee-4701-ad62-8b7a8fa7a910@csgroup.eu>
 <Zzsfuuv3AVomkMxn@pathway.suse.cz>
 <96f3b51b-c28c-4ea8-b61e-a4982196215f@linux.microsoft.com>
 <ZzxR3uAcWFEPUIUK@pathway.suse.cz>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="1678380546-1247530484-1732007229=:15289"
Content-ID: <alpine.LSU.2.21.2411191007130.15289@pobox.suse.cz>
X-Spam-Level: 
X-Spamd-Result: default: False [-5.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; SUSPICIOUS_RECIPS(1.50)[];
 CTYPE_MIXED_BOGUS(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.998];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain];
 FROM_EQ_ENVFROM(0.00)[]; ARC_NA(0.00)[];
 REDIRECTOR_URL(0.00)[aka.ms]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux.microsoft.com,csgroup.eu,netfilter.org,davemloft.net,google.com,kernel.org,redhat.com,inria.fr,imag.fr,zonque.org,gmail.com,free.fr,armlinux.org.uk,linux.ibm.com,habana.ai,intel.com,linux.intel.com,suse.de,ffwll.ch,lunn.ch,broadcom.com,hansenpartnership.com,oracle.com,citrix.com,kernel.dk,arm.com,linux-foundation.org,cloud.ionos.com,holtmann.org,linuxfoundation.org,perex.cz,suse.com,pengutronix.de,corigine.com,ellerman.id.au,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.xenproject.org,kvack.org,lists.linux.dev,lists.ozlabs.org,linutronix.de];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+,1:+];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 TAGGED_RCPT(0.00)[netdev,etnaviv];
 MID_RHS_MATCH_FROMTLD(0.00)[]; RCPT_COUNT_GT_50(0.00)[94];
 RCVD_COUNT_ZERO(0.00)[0]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLst1ywfnn8h7y4sspo7cfrpds)];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,free.fr]
X-Spam-Score: -5.80
X-Spam-Flag: NO
X-Mailman-Approved-At: Wed, 20 Nov 2024 08:41:15 +0000
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1678380546-1247530484-1732007229=:15289
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.LSU.2.21.2411191007131.15289@pobox.suse.cz>

On Tue, 19 Nov 2024, Petr Mladek wrote:

> On Mon 2024-11-18 10:18:49, Easwar Hariharan wrote:
> > On 11/18/2024 3:06 AM, Petr Mladek wrote:
> > > On Sat 2024-11-16 11:10:52, Christophe Leroy wrote:
> > >>
> > >>
> > >> Le 15/11/2024 à 22:26, Easwar Hariharan a écrit :
> > >>> [Vous ne recevez pas souvent de courriers de eahariha@linux.microsoft.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > >>>
> > >>> Changes made with the following Coccinelle rules:
> > >>>
> > >>> @@ constant C; @@
> > >>>
> > >>> - msecs_to_jiffies(C * 1000)
> > >>> + secs_to_jiffies(C)
> > >>>
> > >>> @@ constant C; @@
> > >>>
> > >>> - msecs_to_jiffies(C * MSEC_PER_SEC)
> > >>> + secs_to_jiffies(C)
> > >>>
> > >>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> > >>> ---
> > >>>   samples/livepatch/livepatch-callbacks-busymod.c |  2 +-
> > >>>   samples/livepatch/livepatch-shadow-fix1.c       |  2 +-
> > >>>   samples/livepatch/livepatch-shadow-mod.c        | 10 +++++-----
> > >>>   3 files changed, 7 insertions(+), 7 deletions(-)
> > >>>
> > >>> diff --git a/samples/livepatch/livepatch-callbacks-busymod.c b/samples/livepatch/livepatch-callbacks-busymod.c
> > >>> index 378e2d40271a9717d09eff51d3d3612c679736fc..d0fd801a7c21b7d7939c29d83f9d993badcc9aba 100644
> > >>> --- a/samples/livepatch/livepatch-callbacks-busymod.c
> > >>> +++ b/samples/livepatch/livepatch-callbacks-busymod.c
> > >>> @@ -45,7 +45,7 @@ static int livepatch_callbacks_mod_init(void)
> > >>>   {
> > >>>          pr_info("%s\n", __func__);
> > >>>          schedule_delayed_work(&work,
> > >>> -               msecs_to_jiffies(1000 * 0));
> > >>> +               secs_to_jiffies(0));
> > >>
> > >> Using secs_to_jiffies() is pointless, 0 is universal, should become
> > >> schedule_delayed_work(&work, 0);
> > > 
> > > Yes, schedule_delayed_work(&work, 0) looks like the right solution.
> > > 
> > > Or even better, it seems that the delayed work might get replaced by
> > > a normal workqueue work.
> > > 
> > > Anyway, I am working on a patchset which would remove this sample
> > > module. There is no need to put much effort into the clean up
> > > of this particular module. Do whatever is easiest for you.
> > > 
> > > Best Regards,
> > > Petr
> > 
> > If we're removing the module, I'll drop it from the series. Just to
> > clarify, do you mean to remove all of samples/livepatch/* or some
> > particular file(s)?
> 
> To be precise, I am going to replace:
> 
> 	samples/livepatch/livepatch-callbacks-demo.c
> 	samples/livepatch/livepatch-callbacks-mod.c
> 	samples/livepatch/livepatch-callbacks-busymod.c
> 
> with a completely different modules because I am reworking the
> callbacks API.
> 
> All other sample modules are going to stay.
> 
> Feel free to remove livepatch-callbacks-busymod.c from the patchset.
> But also feel free to keep it. The API rework goes slowly. I am not
> sure if it would be ready for 6.14.

I would propose that Easwar goes on with his work and prepares an updated 
version of the patch based on Christophe's feedback. That is, disregarding 
Petr's rework for now. The patch set has a higher chance to be merged 
sooner. Petr can then easily rebase. If there is a conflict, we will 
handle it as usual. What do you think?

Miroslav
--1678380546-1247530484-1732007229=:15289--

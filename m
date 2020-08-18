Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 198A824957A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671E06E1B5;
	Wed, 19 Aug 2020 06:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29DA89BA1;
 Tue, 18 Aug 2020 11:32:20 +0000 (UTC)
Received: by mail-oo1-xc42.google.com with SMTP id g1so4069597oop.11;
 Tue, 18 Aug 2020 04:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ExSCm02y3qpUSj/p3vHeizuT1G9r/WCp9sMwgc77Xhw=;
 b=lpcmiZRC0Itwnv8XEX0Gt0g4YzYZoFD+0cQTl/lgDNgLVzRe6IuCkiyAsMKmXxtzyS
 DF5PMESVBKjCzoZjEI411d9Iw1L3XxuPkPVdy8WD0iLU9FEOhQt0C+gxLXxG9FwuHlLM
 rhDESa4KirIUUOyZAMa3fGnotL1y1ZAkDn7wOqcdEugoXuPZ7SjANkcHlMg4NvyiNbht
 ty6pszTzwEC7d8yfKI/mGHwXfZomUw3KmQy9Bjfu0tTtXYliq18/FxRxu1WvUqVtTDdI
 K3vNrDjnKkdMwRXJXjv0FWKEbAC/2OegAiVjrrRDrIlbVqKEFhwQhGoW00TK4+pX8gAo
 GGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to
 :user-agent;
 bh=ExSCm02y3qpUSj/p3vHeizuT1G9r/WCp9sMwgc77Xhw=;
 b=aUMGBloJscbF40nAq2l2SJjAK8P8nbPpb/p6V60YHdqas7dsTjtCaJY/djsquFi/qd
 3LkPC/M3ZqHcXLi1grL2OGgiy1GBeDKwPBiaB/ivDAiSG9xMyHwgaZoChPbVOOUUQ5pb
 NO9fsNW78e22hubkKDZNr+Tp0Nttf/DTYXL9Ve6XKwDPrz89zPgz2xBR71191sMJvoLV
 FeQx0JnRMwKkkgbuQ/kclCfgNTJBhr6np2I/wyS/hna7xaJV4wHUmmCa3CV8p6bBwVIw
 Xh9RkQW8VpWK6hoVcIMxIFkhZUxs3E5WG+cJKLVI6b36x3czSlaaqHgE18DjriYZOaJU
 1SXQ==
X-Gm-Message-State: AOAM533cZCN7CL2HMpAHyRcvCwhdvzTtG0mEcDgCZUD7aR6SUqsQVeBZ
 uYQLff3RxfTN6jPlUCgPFQ==
X-Google-Smtp-Source: ABdhPJywdLvN8lVgc2yDfHhvIZ4/3whUvULM6gOBhid0aKLlGB5miCWrsMhpAucNStAL2zXitNZckQ==
X-Received: by 2002:a4a:7241:: with SMTP id r1mr14426630ooe.48.1597750340029; 
 Tue, 18 Aug 2020 04:32:20 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id v35sm3862490otb.32.2020.08.18.04.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 04:32:18 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:8b39:c3f3:f502:5c4e])
 by serve.minyard.net (Postfix) with ESMTPSA id 4AF641800D4;
 Tue, 18 Aug 2020 11:32:17 +0000 (UTC)
Date: Tue, 18 Aug 2020 06:32:16 -0500
From: Corey Minyard <minyard@acm.org>
To: Allen <allen.lkml@gmail.com>
Subject: Re: [PATCH] char: ipmi: convert tasklets to use new tasklet_setup()
 API
Message-ID: <20200818113216.GD2842@minyard.net>
References: <20200817091617.28119-1-allen.cryptic@gmail.com>
 <20200817091617.28119-3-allen.cryptic@gmail.com>
 <20200817121514.GE2865@minyard.net>
 <CAOMdWSJXCn5KYHen4kynH1A5Oixo+yPzs3oathsfa8gtKZGkjg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMdWSJXCn5KYHen4kynH1A5Oixo+yPzs3oathsfa8gtKZGkjg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
Reply-To: minyard@acm.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 linux-atm-general@lists.sourceforge.net, manohar.vanga@gmail.com,
 airlied@linux.ie, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James.Bottomley@hansenpartnership.com, kys@microsoft.com,
 anton.ivanov@cambridgegreys.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 maximlevitsky@gmail.com, richard@nod.at, deller@gmx.de,
 jassisinghbrar@gmail.com, 3chas3@gmail.com, intel-gfx@lists.freedesktop.org,
 Jakub Kicinski <kuba@kernel.org>, mporter@kernel.crashing.org,
 jdike@addtoit.com, Kees Cook <keescook@chromium.org>, oakad@yahoo.com,
 s.hauer@pengutronix.de, linux-input@vger.kernel.org,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org, broonie@kernel.org,
 openipmi-developer@lists.sourceforge.net, mitch@sfgoth.com,
 linux-arm-kernel@lists.infradead.org, axboe@kernel.dk,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org, martyn@welchs.me.uk,
 dmitry.torokhov@gmail.com, linux-mmc@vger.kernel.org, sre@kernel.org,
 linux-spi@vger.kernel.org, alex.bou9@gmail.com,
 Allen Pais <allen.cryptic@gmail.com>, stefanr@s5r6.in-berlin.de,
 linux-ntb@googlegroups.com, Romain Perier <romain.perier@gmail.com>,
 shawnguo@kernel.org, David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 18, 2020 at 02:46:23PM +0530, Allen wrote:
> > >
> > > Signed-off-by: Romain Perier <romain.perier@gmail.com>
> > > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> >
> > This looks good to me.
> >
> > Reviewed-by: Corey Minyard <cminyard@mvista.com>
> >
> > Are you planning to push this, or do you want me to take it?  If you
> > want me to take it, what is the urgency?
> 
>  Thanks. Well, not hurry, as long as it goes into 5.9 with all other
> changes.

Ok, this is queued in my for-next branch.

-corey

> 
> 
> >
> > -corey
> >
> > > ---
> > >  drivers/char/ipmi/ipmi_msghandler.c | 13 ++++++-------
> > >  1 file changed, 6 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> > > index 737c0b6b24ea..e1814b6a1225 100644
> > > --- a/drivers/char/ipmi/ipmi_msghandler.c
> > > +++ b/drivers/char/ipmi/ipmi_msghandler.c
> > > @@ -39,7 +39,7 @@
> > >
> > >  static struct ipmi_recv_msg *ipmi_alloc_recv_msg(void);
> > >  static int ipmi_init_msghandler(void);
> > > -static void smi_recv_tasklet(unsigned long);
> > > +static void smi_recv_tasklet(struct tasklet_struct *t);
> > >  static void handle_new_recv_msgs(struct ipmi_smi *intf);
> > >  static void need_waiter(struct ipmi_smi *intf);
> > >  static int handle_one_recv_msg(struct ipmi_smi *intf,
> > > @@ -3430,9 +3430,8 @@ int ipmi_add_smi(struct module         *owner,
> > >       intf->curr_seq = 0;
> > >       spin_lock_init(&intf->waiting_rcv_msgs_lock);
> > >       INIT_LIST_HEAD(&intf->waiting_rcv_msgs);
> > > -     tasklet_init(&intf->recv_tasklet,
> > > -                  smi_recv_tasklet,
> > > -                  (unsigned long) intf);
> > > +     tasklet_setup(&intf->recv_tasklet,
> > > +                  smi_recv_tasklet);
> > >       atomic_set(&intf->watchdog_pretimeouts_to_deliver, 0);
> > >       spin_lock_init(&intf->xmit_msgs_lock);
> > >       INIT_LIST_HEAD(&intf->xmit_msgs);
> > > @@ -4467,10 +4466,10 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
> > >       }
> > >  }
> > >
> > > -static void smi_recv_tasklet(unsigned long val)
> > > +static void smi_recv_tasklet(struct tasklet_struct *t)
> > >  {
> > >       unsigned long flags = 0; /* keep us warning-free. */
> > > -     struct ipmi_smi *intf = (struct ipmi_smi *) val;
> > > +     struct ipmi_smi *intf = from_tasklet(intf, t, recv_tasklet);
> > >       int run_to_completion = intf->run_to_completion;
> > >       struct ipmi_smi_msg *newmsg = NULL;
> > >
> > > @@ -4542,7 +4541,7 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
> > >               spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
> > >
> > >       if (run_to_completion)
> > > -             smi_recv_tasklet((unsigned long) intf);
> > > +             smi_recv_tasklet(&intf->recv_tasklet);
> > >       else
> > >               tasklet_schedule(&intf->recv_tasklet);
> > >  }
> > > --
> > > 2.17.1
> > >
> 
> 
> 
> -- 
>        - Allen
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

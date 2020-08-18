Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26180249587
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AF36E1C4;
	Wed, 19 Aug 2020 06:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B22689D86;
 Tue, 18 Aug 2020 09:16:35 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id h3so17309634oie.11;
 Tue, 18 Aug 2020 02:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XZ5gSn6/zxDXq0JbeRnX/CK1QRoCv2dl+iqkeCW1pS8=;
 b=oAk9KLz4zf32ff8AWoLjc9RpJCU0tp2pqYqSeAskrK0ZuvgefHaPfMSjLFyZsdmGPe
 te4G+1pjgni1LPzEs8ACMIxIUvuyoHAcuLUM0MtETeGVCh8WdwKiKS7tJajtKiiKuEyx
 nSe+wjaCOjY/H+YXbeH9/w5O+j8asiWzGL7zUumlH8Xb/MaDp1vsFa9oDik3gP5W3Oy7
 HRujZb5rqlu9TSahSfcAn2YGlPMcHISk8UGHumVZMc/13KMA90JvU03ivC2rMRSghxXu
 ie9/eP5XbwHCE84n2rwd4SGlM0keNy0vyT0/ZYaZo7htPQZLV5eKfkX6krYhP46i5znY
 prXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XZ5gSn6/zxDXq0JbeRnX/CK1QRoCv2dl+iqkeCW1pS8=;
 b=ZnML6M3mEPCCfMefHTSZEQHz8SPWfUy0iFV0FWeczWY+bnmV8XPNdNmufWSgtl33Eh
 qCQaMWsEixc5L3bWWB8kI2feeOo17lk0IJ417cjA7l5Dm6B/jLoyKypk2fsEdWKbEJlA
 AunqmSCc5UK3lKg9RIr/pqTcPTBGbSu1rPOujXbRyn8SlGItywDQ4tlKZERJpr+YtMBA
 pc5LiVp9MftTmPmhKF4NWMAPp+C174wMjtCHNTrOe9si10uetVbMtnqLkO4CXJAgD80Q
 A9uW705VKvRpO3FsRP+1DbtQw1vjDnaAUPazpTcgZPjYFz28L3aYKGtBXi/4VFVdlp/w
 3S6g==
X-Gm-Message-State: AOAM532L8BWayaBnoWXNwx3BNJgLedRdEmZMz2CaJjCFjzyJnfHXrvje
 KWNSihju3GF7Z02wEKoqjjSy2l1nLETICLew5Xw=
X-Google-Smtp-Source: ABdhPJzoZrDFJA/sZSMB5eCKUKMwLIoW6MWAoom1GEFglhx9K88XCdrK0saLkhUm1iVXF7PVM6hI174/8O0mwAcreAA=
X-Received: by 2002:aca:6c6:: with SMTP id 189mr11628018oig.134.1597742194718; 
 Tue, 18 Aug 2020 02:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200817091617.28119-1-allen.cryptic@gmail.com>
 <20200817091617.28119-3-allen.cryptic@gmail.com>
 <20200817121514.GE2865@minyard.net>
In-Reply-To: <20200817121514.GE2865@minyard.net>
From: Allen <allen.lkml@gmail.com>
Date: Tue, 18 Aug 2020 14:46:23 +0530
Message-ID: <CAOMdWSJXCn5KYHen4kynH1A5Oixo+yPzs3oathsfa8gtKZGkjg@mail.gmail.com>
Subject: Re: [PATCH] char: ipmi: convert tasklets to use new tasklet_setup()
 API
To: minyard@acm.org
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

> >
> > Signed-off-by: Romain Perier <romain.perier@gmail.com>
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
>
> This looks good to me.
>
> Reviewed-by: Corey Minyard <cminyard@mvista.com>
>
> Are you planning to push this, or do you want me to take it?  If you
> want me to take it, what is the urgency?

 Thanks. Well, not hurry, as long as it goes into 5.9 with all other
changes.


>
> -corey
>
> > ---
> >  drivers/char/ipmi/ipmi_msghandler.c | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> > index 737c0b6b24ea..e1814b6a1225 100644
> > --- a/drivers/char/ipmi/ipmi_msghandler.c
> > +++ b/drivers/char/ipmi/ipmi_msghandler.c
> > @@ -39,7 +39,7 @@
> >
> >  static struct ipmi_recv_msg *ipmi_alloc_recv_msg(void);
> >  static int ipmi_init_msghandler(void);
> > -static void smi_recv_tasklet(unsigned long);
> > +static void smi_recv_tasklet(struct tasklet_struct *t);
> >  static void handle_new_recv_msgs(struct ipmi_smi *intf);
> >  static void need_waiter(struct ipmi_smi *intf);
> >  static int handle_one_recv_msg(struct ipmi_smi *intf,
> > @@ -3430,9 +3430,8 @@ int ipmi_add_smi(struct module         *owner,
> >       intf->curr_seq = 0;
> >       spin_lock_init(&intf->waiting_rcv_msgs_lock);
> >       INIT_LIST_HEAD(&intf->waiting_rcv_msgs);
> > -     tasklet_init(&intf->recv_tasklet,
> > -                  smi_recv_tasklet,
> > -                  (unsigned long) intf);
> > +     tasklet_setup(&intf->recv_tasklet,
> > +                  smi_recv_tasklet);
> >       atomic_set(&intf->watchdog_pretimeouts_to_deliver, 0);
> >       spin_lock_init(&intf->xmit_msgs_lock);
> >       INIT_LIST_HEAD(&intf->xmit_msgs);
> > @@ -4467,10 +4466,10 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
> >       }
> >  }
> >
> > -static void smi_recv_tasklet(unsigned long val)
> > +static void smi_recv_tasklet(struct tasklet_struct *t)
> >  {
> >       unsigned long flags = 0; /* keep us warning-free. */
> > -     struct ipmi_smi *intf = (struct ipmi_smi *) val;
> > +     struct ipmi_smi *intf = from_tasklet(intf, t, recv_tasklet);
> >       int run_to_completion = intf->run_to_completion;
> >       struct ipmi_smi_msg *newmsg = NULL;
> >
> > @@ -4542,7 +4541,7 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
> >               spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
> >
> >       if (run_to_completion)
> > -             smi_recv_tasklet((unsigned long) intf);
> > +             smi_recv_tasklet(&intf->recv_tasklet);
> >       else
> >               tasklet_schedule(&intf->recv_tasklet);
> >  }
> > --
> > 2.17.1
> >



-- 
       - Allen
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

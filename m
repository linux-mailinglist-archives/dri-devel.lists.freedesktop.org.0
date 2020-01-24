Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D521480E6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 12:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ED572A29;
	Fri, 24 Jan 2020 11:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3C772A2F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 11:15:41 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19993546-1500050 for multiple; Fri, 24 Jan 2020 11:15:33 +0000
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200124103123.GL1847@kadam>
References: <20200124101311.drryaegcdc7d4x7e@kili.mountain>
 <157986125623.2524.13979010293671565726@skylake-alporthouse-com>
 <20200124103123.GL1847@kadam>
Message-ID: <157986453128.2524.3980064063029834231@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] dma-buf: fix locking in sync_print_obj()
Date: Fri, 24 Jan 2020 11:15:31 +0000
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dan Carpenter (2020-01-24 10:31:23)
> On Fri, Jan 24, 2020 at 10:20:56AM +0000, Chris Wilson wrote:
> > Quoting Dan Carpenter (2020-01-24 10:13:12)
> > > This is always called with IRQs disabled and we don't actually want to
> > > enable IRQs at the end.
> > > 
> > > Fixes: a6aa8fca4d79 ("dma-buf/sw-sync: Reduce irqsave/irqrestore from known context")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  drivers/dma-buf/sync_debug.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
> > > index 101394f16930..952331344b1c 100644
> > > --- a/drivers/dma-buf/sync_debug.c
> > > +++ b/drivers/dma-buf/sync_debug.c
> > > @@ -107,15 +107,16 @@ static void sync_print_fence(struct seq_file *s,
> > >  static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
> > >  {
> > >         struct list_head *pos;
> > > +       unsigned long flags;
> > >  
> > >         seq_printf(s, "%s: %d\n", obj->name, obj->value);
> > >  
> > > -       spin_lock_irq(&obj->lock);
> > > +       spin_lock_irqsave(&obj->lock, flags);
> > 
> > Exactly, it can be just spin_lock() as the irq state is known.
> > 
> 
> I did consider that but I wasn't sure how this is going to be used in
> the future so I took a conservative approach.

Sure, it's debug so not critical (lists within lists to a seqfile, ouch)

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A83081EC1F5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 20:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5066E452;
	Tue,  2 Jun 2020 18:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foo.stuge.se (foo.stuge.se [212.116.89.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9ED96E451
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 18:38:41 +0000 (UTC)
Received: (qmail 29989 invoked by uid 1000); 2 Jun 2020 18:38:38 -0000
Message-ID: <20200602183838.29988.qmail@stuge.se>
Date: Tue, 2 Jun 2020 18:38:38 +0000
From: Peter Stuge <peter@stuge.se>
To: Alan Stern <stern@rowland.harvard.edu>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v3 4/6] drm: Add Generic USB Display driver
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200529175643.46094-5-noralf@tronnes.org>
 <20200529224531.22261.qmail@stuge.se>
 <614b0b0d-44d7-22e5-339d-cb8a13b426ac@tronnes.org>
 <20200602001207.17171.qmail@stuge.se>
 <20200602023254.GB15540@rowland.harvard.edu>
 <20200602052150.1505.qmail@stuge.se>
 <20200602152700.GB31640@rowland.harvard.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602152700.GB31640@rowland.harvard.edu>
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
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Alan Stern wrote:
> > > A gadget driver can STALL in response to a control-OUT data packet,
> > > but only before it has seen the packet.
> > 
> > How can it do that for OUT, and IN if possible there too?
> 
> In the way described just above: The gadget driver's SETUP handler tells 
> the UDC to stall the data packet.
> 
> > Is it related to f->setup() returning < 0 ?
> 
> Yes; the composite core interprets such a value as meaning to STALL 
> endpoint 0.

Thanks a lot for confirming this.


> > The spec also allows NAK, but the gadget code seems to not (need to?)
> > explicitly support that. Can you comment on this as well?
> 
> If the gadget driver doesn't submit a usb_request then the UDC will 
> reply with NAK.

And thanks for this as well.


> > a status request so I can know the result of the operation the device has
> > performed.
..
> There are two reasonable approaches you could use.  One is to have a 
> vendor-specific control request to get the result of the preceding 
> operation.
..
> The other approach is to send the status data over a bulk-IN endpoint.

I've tried to explain a third approach, which I think fits well because the
status is only a "Ready" flag - ie. a memory barrier or flow control,
to make the host not send data OUT.

I'm proposing that the gadget should NAK on data OUT when it isn't Ready, and
that the host driver shouldn't query status but simply send data when it has.

Per Alans description the NAK happens automatically if the gadget driver has
no usb_request pending while it is processing previously received data.

On the host that NAK makes the host controller retry automatically until
transfer success, timeout or fatal error.


> It would have to be formatted in such a way that the host could 
> recognize it as a status packet and not some other sort of data packet.

For host notification of status changes other than Ready I really like
such an IN endpoint, but preferably an interrupt endpoint.

To avoid the formatting problem each data packet could be one full status
message. That way the host would always receive a known data structure.
Interrupt packets can be max 64 byte. Noralf, do you think that's enough
for everyone in the first version?


//Peter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

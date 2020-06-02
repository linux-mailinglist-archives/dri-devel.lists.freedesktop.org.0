Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DA81EBF00
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 17:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE38C6E416;
	Tue,  2 Jun 2020 15:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by gabe.freedesktop.org (Postfix) with SMTP id 061796E416
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 15:27:00 +0000 (UTC)
Received: (qmail 4222 invoked by uid 1000); 2 Jun 2020 11:27:00 -0400
Date: Tue, 2 Jun 2020 11:27:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Peter Stuge <peter@stuge.se>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v3 4/6] drm: Add Generic USB Display driver
Message-ID: <20200602152700.GB31640@rowland.harvard.edu>
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200529175643.46094-5-noralf@tronnes.org>
 <20200529224531.22261.qmail@stuge.se>
 <614b0b0d-44d7-22e5-339d-cb8a13b426ac@tronnes.org>
 <20200602001207.17171.qmail@stuge.se>
 <20200602023254.GB15540@rowland.harvard.edu>
 <20200602052150.1505.qmail@stuge.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602052150.1505.qmail@stuge.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 02, 2020 at 05:21:50AM +0000, Peter Stuge wrote:
> > The USB protocol forbids a device from sending a STALL response to a
> > SETUP packet.  The only valid response is ACK.  Thus, there is no way
> > to prevent the host from sending its DATA packet for a control-OUT
> > transfer.
> =

> Right; a STALL handshake only after a DATA packet, but a udc could silent=
ly
> drop the first DATA packet if instructed to STALL during SETUP processing.
> I don't know how common that is for the udc:s supported by gadget, but so=
me
> MCU:s behave like that.

It happens from time to time, such as when the host sends a SETUP packet =

that the gadget driver doesn't understand.

> > A gadget driver can STALL in response to a control-OUT data packet,
> > but only before it has seen the packet.
> =

> How can it do that for OUT, and IN if possible there too?

In the way described just above: The gadget driver's SETUP handler tells =

the UDC to stall the data packet.

> Is it related to f->setup() returning < 0 ?

Yes; the composite core interprets such a value as meaning to STALL =

endpoint 0.

> The spec also allows NAK, but the gadget code seems to not (need to?)
> explicitly support that. Can you comment on this as well?

If the gadget driver doesn't submit a usb_request then the UDC will =

reply with NAK.

> > Once the driver knows what the data packet contains, the gadget API
> > doesn't provide any way to STALL the status stage.
> =

> Thanks. I think this particular gadget driver doesn't need to decide late.
> =

> Ideally the control transfers can even be avoided.


On Tue, Jun 02, 2020 at 01:46:38PM +0200, Noralf Tr=F8nnes wrote:

> > A gadget driver can STALL in response to a control-OUT data packet,
> > but only before it has seen the packet.  Once the driver knows what
> > the data packet contains, the gadget API doesn't provide any way to
> > STALL the status stage.  There has been a proposal to change the API
> > to make this possible, but so far it hasn't gone forward.
> > =

> =

> This confirms what I have seen in the kernel and the reason I added a
> status request so I can know the result of the operation the device has
> performed.

Does this status request use ep0 or some other endpoint?

> I have a problem that I've encountered with this status request.
> In my first version the gadget would usb_ep_queue() the status value
> when the operation was done and as long as this happended within the
> host timeout (5s) everything worked fine.
> =

> Then I hit a 10s timeout in the gadget when performing a display modeset
> operation (wait on missing vblank). The result of this was that the host
> timed out and moved on. The gadget however didn't know that the host
> gave up, so it queued up the status value. The result of this was that
> all further requests from the host would time out.
> Do you know a solution to this?
> My work around is to just poll on the status request, which returns a
> value immediately, until there's a result. The udc driver I use is dwc2.

It's hard to give a precise answer without knowing the details of how =

your driver works.

There are two reasonable approaches you could use.  One is to have a =

vendor-specific control request to get the result of the preceding =

operation.  This works but it has high overhead -- which may not matter =

if it happens infrequently and isn't sensitive to latency.

The other approach is to send the status data over a bulk-IN endpoint.  =

It would have to be formatted in such a way that the host could =

recognize it as a status packet and not some other sort of data packet.  =

That way, if the host received a stale status value, it could ignore it =

and move on.

You also may want to give some thought to a "resynchronization" =

protocol, for use in situations where the host times out waiting for a =

response from the device while the device is waiting for something else =

(the host, a vblank, or whatever).  This could be a special control =

request, or you could rely on the host doing a complete USB reset.

Alan Stern
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

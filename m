Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A3C1EB364
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 04:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37A36E0EC;
	Tue,  2 Jun 2020 02:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 399 seconds by postgrey-1.36 at gabe;
 Tue, 02 Jun 2020 02:39:35 UTC
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by gabe.freedesktop.org (Postfix) with SMTP id 6AB716E0EC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 02:39:35 +0000 (UTC)
Received: (qmail 16498 invoked by uid 1000); 1 Jun 2020 22:32:54 -0400
Date: Mon, 1 Jun 2020 22:32:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Peter Stuge <peter@stuge.se>
Subject: Re: [PATCH v3 4/6] drm: Add Generic USB Display driver
Message-ID: <20200602023254.GB15540@rowland.harvard.edu>
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200529175643.46094-5-noralf@tronnes.org>
 <20200529224531.22261.qmail@stuge.se>
 <614b0b0d-44d7-22e5-339d-cb8a13b426ac@tronnes.org>
 <20200602001207.17171.qmail@stuge.se>
MIME-Version: 1.0
Content-Description: it><enter-command> set editor=$my_editor
Content-Disposition: inline
In-Reply-To: <20200602001207.17171.qmail@stuge.se>
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
Cc: balbi@kernel.org, sam@ravnborg.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 02, 2020 at 12:12:07AM +0000, Peter Stuge wrote:

...

> The way I read composite_setup() after try_fun_setup: it calls f->setup()
> when available, and that can return < 0 to stall.
> 
> I expect that composite_setup() and thus f->setup() run when the
> SETUP packet has arrived, thus before the data packet arrives, and if
> composite_setup() stalls then the device/function should never see the
> data packet.
> 
> For an OUT transaction I think the host controller might still send
> the DATA packet, but the device controllers that I know don't make it
> visible to the application in that case.

...

Are you guys interested in comments from other people who know more
about the kernel and how it works with USB?  Your messages have been
far too long to go into in any detail, but I will address this one issue.

The USB protocol forbids a device from sending a STALL response to a
SETUP packet.  The only valid response is ACK.  Thus, there is no way
to prevent the host from sending its DATA packet for a control-OUT
transfer.

A gadget driver can STALL in response to a control-OUT data packet,
but only before it has seen the packet.  Once the driver knows what
the data packet contains, the gadget API doesn't provide any way to
STALL the status stage.  There has been a proposal to change the API
to make this possible, but so far it hasn't gone forward.

Alan Stern
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

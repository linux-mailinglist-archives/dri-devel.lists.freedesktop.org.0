Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB7C125E74
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1F96EAF4;
	Thu, 19 Dec 2019 10:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9086EAF4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:03:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 671EBE3B;
 Thu, 19 Dec 2019 11:03:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576749826;
 bh=ApbKPu6VSzePVame5Mt3wlW5rKA31/FJ8dOPMFuX0k0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jalzSUrkI3OEZuRezjs8/7vdtBcW7f8H1r85U8N+42lr5eJ4HlEWo2IZmU969PfcO
 ybuuBBhnPaWX1Oavz+rmLI0KtPlsKFoGAMB4YdT6/HN+YRAWbu36FxOoP0GcyVncRD
 YcZ7cchfslEEDrU7o0jwHgUQ71IKzKauTPf+nwe4=
Date: Thu, 19 Dec 2019 12:03:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 45/50] drm/omap: dpi: Register a drm_bridge
Message-ID: <20191219100332.GB15002@pendragon.ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-46-laurent.pinchart@ideasonboard.com>
 <8f7e454b-4d63-37cf-ef83-77e23e90e07d@ti.com>
 <20191219094013.GA15002@pendragon.ideasonboard.com>
 <6727b9aa-37de-68f8-d2e1-eb4cc2c471ad@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6727b9aa-37de-68f8-d2e1-eb4cc2c471ad@ti.com>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 19, 2019 at 12:01:34PM +0200, Tomi Valkeinen wrote:
> On 19/12/2019 11:40, Laurent Pinchart wrote:
> >> Do we ever get drm_bridge_funcs calls from multiple threads at the
> >> same time? Is there a difference between having a single DPI output,
> >> or multiple DPI outputs (i.e. can two different DPI outputs get calls
> >> simultaneously?).
> > 
> > I'll drop the lock, it's not needed. The core should serialize calls to
> > the bridge, at least per output. For different outputs, there's a
> > possibility I believe of atomic commits being handled concurrently if
> > they don't share any resource.
> 
> I don't think we do much locking with resource handling. E.g. we have single registers with mux 
> settings for multiple outputs. If DPI (or any other dss output) gets called concurrently for 
> different outputs, we might get a race.
> 
> I wonder if that concurrency is opt-in...

It's at least opt-out in the sense that we can acquire all resources in
our top-level .atomic_check() implementation if we want to. Of course
the best option would be to handle locking correcly in the core :-) With
this rework done, I want to focus on Sebastian's DSI move to drm_bridge,
and then remove lots of dead code. I think a cleanup pass in the DISPC
would be useful after that.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

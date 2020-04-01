Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 180EC19AAD5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 13:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DEA6E094;
	Wed,  1 Apr 2020 11:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38CE6E094
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 11:33:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63B20A2A;
 Wed,  1 Apr 2020 13:33:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1585740820;
 bh=dYL1tndhMD3o8cw1ArWqR9r9nRWzkyVl0kHNS4nl69E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QEl/8fyvm4zcHFvv6GtE8Lr7tsqUIUUWoWD26UNICW8tl0dbY3vNLPavD+K+npa6F
 z4OnbcKH5mWTkULDL4+6+rawjfTwCprkAzRJzmtedsR7rVkDIQcdIyawFx+1IPEHeP
 MWCT6QywKgYuPYa44341VbhqueMKj96IgEqnTqE8=
Date: Wed, 1 Apr 2020 14:33:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2 10/56] drm/omap: dsi: drop virtual channel logic
Message-ID: <20200401113333.GB4876@pendragon.ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-11-sebastian.reichel@collabora.com>
 <20200225150117.GI4764@pendragon.ideasonboard.com>
 <b3742008-1ac9-cf4d-62b2-b4afd904f2f9@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3742008-1ac9-cf4d-62b2-b4afd904f2f9@ti.com>
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Wed, Apr 01, 2020 at 02:30:25PM +0300, Tomi Valkeinen wrote:
> On 25/02/2020 17:01, Laurent Pinchart wrote:
> > On Tue, Feb 25, 2020 at 12:20:40AM +0100, Sebastian Reichel wrote:
> >> This drops the virtual channel logic. Afterwards DSI clients
> >> request their channel number and get the virtual channel with
> >> the same number or -EBUSY if already in use.
> > 
> > I wonder why this level of indirection was used, allocating "virtual
> > VCs". A single virtual indirection should be enough :-) I may be missing
> > some context though, I'll defer that to Tomi, but for me,
> 
> I haven't reviewed the code yet, and it's been a long time since I wrote this code. But maybe this 
> explains at least some:
> 
> (I hope I remember this right)
> 
> DSI packets have virtual channel IDs (VCID). That's number 0-3 that needs to be in the packets.
> 
> DSI IP has virtual channel "blocks" (VC), with associated registers. So 4 VC register blocks. These 
> are not related to DSI virtual channel IDs in any way.
> 
> To do DSI transactions, you choose a VC, and program it. A VC can send data via video pipeline, or 
> transmit and receive data messages created with CPU. And in both cases, you need to include the VCID 
> in the transmissions, of course.
> 
> So, I think a normal use case could be a single panel, with VCID 0. To send video data and control 
> messages, you would use VC0 and VC1. VC0 would be configured for video data, and VC1 would be 
> configured for control messages.
> 
> And if I recall right, currently you first request a free VC from the IP with request_vc(). Then you 
> use set_vc_id(channel, id) to set the VCID, used when doing transactions with that VC.
> 
> So the virtual channel naming is pretty confusing in the DSI IP, in my opinion.

I wasn't aware of those details, thank you for the explanation. It's
quite confusing indeed, let's try to document the architecture in a
comment block at the beginning of the dsi.c file for later reference.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

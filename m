Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C88864ACF78
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 04:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA8510E167;
	Tue,  8 Feb 2022 03:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1B310E167
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 03:04:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4840B340;
 Tue,  8 Feb 2022 04:04:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1644289440;
 bh=J0PGEAYz7Us3Tun1bqmFowk71Fw/EivbBzb3uusglxU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZLId+mL19qaW6qRJuYCYm51rDKhWlew1wRe+FyP37hxT31ngh7nHYJSy6Yj8gxEvu
 qKSqFmRBteVlj6zaWtc4R3HMDZkzPun3rtMuAKrwJGUtXOZB6wWaUpC14gwmH6gNOv
 H+wNL0UExoUOt13EvBPqQEisnFBTiNC4H0ueabMM=
Date: Tue, 8 Feb 2022 05:03:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Liu Ying <victor.liu@oss.nxp.com>
Subject: Re: [PATCH] [RFC] drm: mxsfb: Implement LCDIF scanout CRC32 support
Message-ID: <YgHdnggH46OVxKnw@pendragon.ideasonboard.com>
References: <20220206185643.275811-1-marex@denx.de>
 <d5ac849dc8aae325d98f215d4f92d492abd909c4.camel@oss.nxp.com>
 <9a2cc781-3277-7e09-530b-05c7361cdaa8@denx.de>
 <1020798373f3f54d1dd7df7174afaeb973ec86ff.camel@oss.nxp.com>
 <49519f3a-060d-feb5-891d-adaad10607e2@denx.de>
 <fc56574745fd53dfcc65425aab7547d9341cd308.camel@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fc56574745fd53dfcc65425aab7547d9341cd308.camel@oss.nxp.com>
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, Robert Chiras <robert.chiras@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Liu Ying,

On Tue, Feb 08, 2022 at 10:41:59AM +0800, Liu Ying wrote:
> On Mon, 2022-02-07 at 11:43 +0100, Marek Vasut wrote:
> > On 2/7/22 10:18, Liu Ying wrote:
> > > > > On Sun, 2022-02-06 at 19:56 +0100, Marek Vasut wrote:
> > > > > > The LCDIF controller as present in i.MX6SX/i.MX8M Mini/Nano has a CRC_STAT
> > > > > > register, which contains CRC32 of the frame as it was clocked out of the
> > > > > > DPI interface of the LCDIF. This is likely meant as a functional safety
> > > > > > register.
> > > > > > 
> > > > > > Unfortunatelly, there is zero documentation on how the CRC32 is calculated,
> > > > > > there is no documentation of the polynomial, the init value, nor on which
> > > > > > data is the checksum applied.
> > > > > > 
> > > > > > By applying brute-force on 8 pixel / 2 line frame, which is the minimum
> > > > > > size LCDIF would work with, it turns out the polynomial is CRC32_POLY_LE
> > > > > > 0xedb88320 , init value is 0xffffffff , the input data are bitrev32()
> > > > > > of the entire frame and the resulting CRC has to be also bitrev32()ed.
> > > > > 
> > > > > No idea how the HW calculates the CRC value.
> > > > > I didn't hear anyone internal tried this feature.
> > > > 
> > > > It would be nice if the datasheet could be improved.
> > > 
> > > Agreed.
> > > 
> > > > There are many blank areas which are undocumented, this LCDIF CRC32
> > > > feature, i.MX8M Mini Arteris NOC at 0x32700000 , the ARM GPV NIC-301 at
> > > > 0x32{0,1,2,3,4,5,6,8}00000 and their master/slave port mapping. The NOC
> > > > and NICs were documented at least up to i.MX6QP and then that
> > > > information disappeared from NXP datasheets. I think reconfiguring the
> > > > NOC/NIC QoS would help mitigate this shift issue described below
> > > > (*).
> > > 
> > > I also think the QoS would help if it is configureable.
> > 
> > It is programmable, it's just the port mapping which is undocumented.
> > 
> > > > Do you know if there is some additional NOC/NIC documentation for i.MX8M
> > > > Mini available ?
> > > 
> > > No.
> > 
> > Can you ask someone internally in NXP maybe ?
> 
> Maybe, you may try community.nxp.com, like the i.MXRT case.

Overall we seem to have had little luck with community.nxp.com. I wonder
if it would be possible for key community members to get some more
direct access to support when working on upstream drivers. I'm pretty
sure nobody will try to abuse it :-)

-- 
Regards,

Laurent Pinchart

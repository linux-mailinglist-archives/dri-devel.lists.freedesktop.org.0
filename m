Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D197C7FB7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 10:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0076410E00E;
	Fri, 13 Oct 2023 08:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A026910E00E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 08:12:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1qrDHW-0004ZQ-77; Fri, 13 Oct 2023 10:12:26 +0200
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1qrDHR-001Ltf-TW; Fri, 13 Oct 2023 10:12:21 +0200
Received: from sha by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1qrDHR-00EF2M-Qh; Fri, 13 Oct 2023 10:12:21 +0200
Date: Fri, 13 Oct 2023 10:12:21 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 3/3] drm/rockchip: fix the plane format defination of
 rk3568/6
Message-ID: <20231013081221.GN3359458@pengutronix.de>
References: <20231012023439.1497304-1-andyshrk@163.com>
 <20231012023705.1497648-1-andyshrk@163.com>
 <20231013061106.GH3359458@pengutronix.de>
 <afd589f4-4fcc-4ede-8e16-a8bb4d8f29f2@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afd589f4-4fcc-4ede-8e16-a8bb4d8f29f2@rock-chips.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: sjoerd.simons@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, sebastian.reichel@collabora.com,
 linux-rockchip@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 02:43:31PM +0800, Andy Yan wrote:
> Hi Sacha:
> 
> On 10/13/23 14:11, Sascha Hauer wrote:
> > On Thu, Oct 12, 2023 at 10:37:05AM +0800, Andy Yan wrote:
> > > From: Andy Yan <andy.yan@rock-chips.com>
> > > 
> > > The cluster windows on rk3568/6 only support afbc format,
> > > linear format(RGB/YUV) are not supported.
> > > The cluster windows on rk3588 support both linear and afbc rgb
> > > format, but for yuv format it only support afbc.
> > > 
> > > The esmart windows on rk3588 support uv swap for yuyv, but
> > > rk356x does not support it.
> > It's a bit hard to track which sentence in the description refers to
> > which change in the patch. Could you split this up into multiple patches
> > to make this easier reviewable?
> > 
> > Renaming of the formats could also be a separate patch. Patches marked
> > with "no functional change" are nice and easy to review.
> 
> 
> How do you like if I split  the patch like bellow:
> 
> PATCH 1 : fix the format

When you say "The cluster windows on rk3568/6 only support afbc format, ..."
and "The esmart windows on rk3588 support uv swap for yuyv, ..."
it sounds like two orthogonal changes which should be done in two
patches.

> 
> PATCH 2: rename: s/formats_win_full_10bit/formats_cluster/
> 
> s/formats_win_full_10bit_yuyv/formats_rk356x_esmart/
> 
> s/formats_win_little/formats_win_smart/

I'd likely do the rename first, but I guess that's just a matter of
taste.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

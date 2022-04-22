Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 730E350BFD6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 20:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE0310E5C2;
	Fri, 22 Apr 2022 18:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFDD10E5C2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 18:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=4uzR2rK5OCZlYEp9+SK873slcwW5cQ56te5TQ7xXqds=;
 b=Dq/d11yNs0c0Yje18A2awkeT1AN9jzcp8k74eRR/z7ltGHxgFUmhXT486i9E/LhL58C5yV4JbPyRe
 UwEPCOxRMyBNT1ttXw+8H69yZxKoz5w2X8helEBkBrvheq8U4EqPz8xyRqS7SK/sCJ+1ulJ5FVjEox
 WZBrefsGw4rWE6lrSrfGUB7Gf6atLQiW/9xw3QomFzzFapqJQPE/fFHtgUdBi0lMGuMChlFi9Ci5pp
 mORBjxDSSqI4odnVj2D7INU4FoVa+2hAAd7yz6WFBwH0UpbumFrGXlNCLPbQtsQT20yTZdlYeAnBGn
 ufI9V0oL9YD4L6Yfw9Vz3lEBF0LNHnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=4uzR2rK5OCZlYEp9+SK873slcwW5cQ56te5TQ7xXqds=;
 b=n3LhNgSWVeE4975Bv0IpwciusAyJtmRbpRQs1yQUZ3YpyizFHquNyUdTL1kl/QqKrQE1NLr+rp0GU
 K88ORQaAQ==
X-HalOne-Cookie: bf7b9af81cc9e97e32a0b3080ed448e6a6af2b0c
X-HalOne-ID: 1dc91fae-c26b-11ec-be69-d0431ea8bb03
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 1dc91fae-c26b-11ec-be69-d0431ea8bb03;
 Fri, 22 Apr 2022 18:36:26 +0000 (UTC)
Date: Fri, 22 Apr 2022 20:36:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v3 3/4] drm: mxsfb: Factor out mxsfb_set_mode()
Message-ID: <YmL1qF4y46OME2+d@ravnborg.org>
References: <20220417020800.336675-1-marex@denx.de>
 <20220417020800.336675-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220417020800.336675-3-marex@denx.de>
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 17, 2022 at 04:07:59AM +0200, Marek Vasut wrote:
> Pull mode registers programming from mxsfb_enable_controller() into
> dedicated function mxsfb_set_mode(). This is a clean up. No functional
> change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

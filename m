Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D49BA50BFCF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 20:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D392610E58A;
	Fri, 22 Apr 2022 18:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B3F10E58A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 18:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=6IKssA/iEecDo5WQMi/mnE4FEbWoQThT+aPPMeRPsQA=;
 b=rO+tgkzYKkXDHqlepewvx5Hd6gPP3CE90Wn6M3YcZu1/kWLXUJJmOr85ntpw91e2LGSb7XwgQipF9
 UkHfxGa9jCy8agoQUNDqjPGDOi46E1nx72Hnu+z/0UG4loqGI1fAT2dREz/vKcee8mdKsLCwMnb9a/
 Tiop1FQMQMLh4cFP2JbAkVpZDJR19YJHD6vYJj5tEgniRknw/+Wrw07SIUFqEucbTHzrubYnA8rD0+
 ZCi2SMgXCvBxmd0cUifMFP9QyqWQ3/aNARDHa8T1XjVsQeuv0bq4uBuWivexyQtIPTslL5om0Xx6hG
 puGlo8w9aX665Z2wssxIE32DR8QOEFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=6IKssA/iEecDo5WQMi/mnE4FEbWoQThT+aPPMeRPsQA=;
 b=AQo5pHSBEA3TovpKP9YZcZTp88wT2s4X4UgDor9xsnAESQlcrBIKv+EcTlmdflSx7A9tLjdgfiW5v
 96/9oiKDA==
X-HalOne-Cookie: c773f9ba0d50bc9cfc21506b7e4b4f45e03fd49b
X-HalOne-ID: 06212fd4-c26b-11ec-a6b6-d0431ea8a283
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 06212fd4-c26b-11ec-a6b6-d0431ea8a283;
 Fri, 22 Apr 2022 18:35:46 +0000 (UTC)
Date: Fri, 22 Apr 2022 20:35:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v3 2/4] drm: mxsfb: Replace mxsfb_get_fb_paddr() with
 drm_fb_cma_get_gem_addr()
Message-ID: <YmL1gOUzbC30VnaQ@ravnborg.org>
References: <20220417020800.336675-1-marex@denx.de>
 <20220417020800.336675-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220417020800.336675-2-marex@denx.de>
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

On Sun, Apr 17, 2022 at 04:07:58AM +0200, Marek Vasut wrote:
> Replace mxsfb_get_fb_paddr() with drm_fb_cma_get_gem_addr() to correctly handle
> FB offset.
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

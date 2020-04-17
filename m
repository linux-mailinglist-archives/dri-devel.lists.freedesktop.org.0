Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED661ADDB6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 14:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B436EBD3;
	Fri, 17 Apr 2020 12:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8516EBD3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 12:58:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0869497D;
 Fri, 17 Apr 2020 14:58:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1587128333;
 bh=e+lZnXOFmwYAafs1rUwGAffn/mSqK6KsiLIDdoGiaJg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DpdK2agNgtfCcwmOGIPA2g5tWkaxjdb6QreWcZ8zk+idfwNZc52qPt0h05weJJJXn
 oxo5dWQmaJTkhR2m3KxBX/YQrZRZNkuXGiWyeppAY4+4cGGCuNBq/eHiuQ/3sLUnCP
 z0huaf/6k8sgep2mz0GUXphFZHZxNrByGIxdjuS4=
Date: Fri, 17 Apr 2020 15:58:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [drm:simple_bridge_attach [simple_bridge]] *ERROR* Fix bridge
 driver to make connector optional!
Message-ID: <20200417125840.GB4748@pendragon.ideasonboard.com>
References: <CB5A5B81-F06C-4CBE-95DE-96C8723D2AC5@goldelico.com>
 <20200417124422.fl35igitvd7thpr5@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417124422.fl35igitvd7thpr5@gilmour.lan>
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
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>,
 linux-omap <linux-omap@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Fri, Apr 17, 2020 at 02:44:22PM +0200, Maxime Ripard wrote:
> On Fri, Apr 17, 2020 at 02:18:11PM +0200, H. Nikolaus Schaller wrote:
> > Hi Maxime,
> > I have started to test v5.7-rc1 and can't fully boot the GTA04
> > device any more.
> > 
> > What I see in the log is:
> > 
> > [   28.567840] [drm:simple_bridge_attach [simple_bridge]] *ERROR* Fix bridge driver to make connector optional!
> > [   28.567871] omapdrm omapdrm.0: unable to attach bridge /ocp@68000000/dss@48050000/encoder@48050c00
> > [   28.786529] omapdrm omapdrm.0: omap_modeset_init failed: ret=-22
> > [   28.841552] omapdrm: probe of omapdrm.0 failed with error -22
> > 
> > This device uses the ti,opa362 chip which did have a dedicated
> > omapdss driver before (which is removed now) and which seems to
> > be supported by the simple_bridge now.
> > 
> > The opa362 is sitting in the video out path from
> > 
> > 	omapdrm -> venc -> opa362 -> video-out-connector.
> > 
> > What does this error mean? How can it be fixed?
> 
> -22 is usually EINVAL, which can be pretty much anything. A good thing to do
>  would be to bisect to see which actual commit broke it, but if I was to bet on
>  something I guess it would be
> 
> https://lore.kernel.org/dri-devel/20200226112514.12455-1-laurent.pinchart@ideasonboard.com/

Would "[PATCH 0/2] drm: bridge: simple-bridge: Enable usage with DRM
bridge connector helper" solve it ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

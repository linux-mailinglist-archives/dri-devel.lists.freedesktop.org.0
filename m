Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 782621F4F3B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96ED06E451;
	Wed, 10 Jun 2020 07:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 477276E2CA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 17:10:47 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id AC9D28088;
 Tue,  9 Jun 2020 17:11:37 +0000 (UTC)
Date: Tue, 9 Jun 2020 10:10:43 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 1/5] drm/omap: Fix suspend resume regression after
 platform data removal
Message-ID: <20200609171043.GN37466@atomide.com>
References: <20200531193941.13179-1-tony@atomide.com>
 <20200531193941.13179-2-tony@atomide.com>
 <16ba1808-5c7f-573d-8dd0-c80cac2f476e@ti.com>
 <20200603140639.GG37466@atomide.com>
 <47e286dd-f87a-4440-5bde-1f7b53e8b672@ti.com>
 <20200609151943.GL37466@atomide.com>
 <9ed70121-2a53-d2b3-051a-88eb83e6c53f@ti.com>
 <20200609165234.GM37466@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200609165234.GM37466@atomide.com>
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keerthy <j-keerthy@ti.com>, Suman Anna <s-anna@ti.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Tony Lindgren <tony@atomide.com> [200609 16:53]:
> * Tomi Valkeinen <tomi.valkeinen@ti.com> [200609 15:27]:
> > On 09/06/2020 18:19, Tony Lindgren wrote:
> > > Currently I'm only able to rmmod -f omapdrm, not sure if these issues might
> > > be related.
> > 
> > Hmm, I always use modules, and can unload omapdrm and drm fine. But there's
> > a sequence that must be followed. However, the sequence starts with
> > unloading omapdrm... What behavior you see with rmmod?
> 
> Hmm maybe it's output specific somehow?
> 
> I just tried again with the following with v5.7. I see the omapdrm
> usage count issue happen at least on duovero, but don't seem to
> currently get /dev/fb0 initialized on x15 with these:
> 
> modprobe omapdrm
> #modprobe connector_hdmi	# up to v5.6
> modprobe display-connector	# starting with v5.7-rc1
> modprobe ti-tpd12s015		# beagle-x15
> modprobe omapdss
> 
> # rmmod omapdrm
> rmmod: ERROR: Module omapdrm is in use
> 
> # lsmod | grep omapdrm
> omapdrm                65536  1
> omapdss_base           16384  2 omapdrm,omapdss
> drm_kms_helper        155648  3 omapdss_base,omapdrm,omapdss
> drm                   372736  7 ti_tpd12s015,omapdss_base,display_connector,omapdrm,omapdss,drm_kms_helper

I'm also seeing the rmmod omapdrm issue on am437x-sk-evm:

modprobe pwm-omap-dmtimer
modprobe pwm-tiecap
modprobe pwm_bl
modprobe omapdrm
modprobe panel-simple
modprobe display-connector      # starting with v5.7-rc1
modprobe omapdss

# rmmod omapdrm
rmmod: ERROR: Module omapdrm is in use

> On beagle-x15 I see these errors after modprobe:
> 
> DSS: OMAP DSS rev 6.1
> omapdss_dss 58000000.dss: bound 58001000.dispc (ops dispc_component_ops [omapdss])
> omapdss_dss 58000000.dss: bound 58040000.encoder (ops hdmi5_component_ops [omapdss])
> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> omapdrm omapdrm.0: [drm] Cannot find any crtc or sizes
> [drm] Initialized omapdrm 1.0.0 20110917 for omapdrm.0 on minor 0
> omapdrm omapdrm.0: [drm] Cannot find any crtc or sizes
> aic_dvdd_fixed: disabling
> ldousb: disabling
> 
> Maybe I'm missing some related module on x15?

Still did not figure what I might be missing on x15 :)

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

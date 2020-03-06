Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3808217BA15
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 11:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCEE6ECC3;
	Fri,  6 Mar 2020 10:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDCB16ECC3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 10:21:00 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jAA68-00018D-KZ; Fri, 06 Mar 2020 11:20:52 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jAA67-0007hp-HB; Fri, 06 Mar 2020 11:20:51 +0100
Message-ID: <69903c69a95902c0ddc8fb9e7a6762abf28aa034.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/4] drm/imx: Add initial support for DCSS on iMX8MQ
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Lucas Stach
 <l.stach@pengutronix.de>
Date: Fri, 06 Mar 2020 11:20:51 +0100
In-Reply-To: <20200306095830.sa5eig67phngr3fa@fsr-ub1864-141>
References: <1575625964-27102-1-git-send-email-laurentiu.palcu@nxp.com>
 <1575625964-27102-3-git-send-email-laurentiu.palcu@nxp.com>
 <03b551925d079fcc151239afa735562332cfd557.camel@pengutronix.de>
 <20200306095830.sa5eig67phngr3fa@fsr-ub1864-141>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, lukas@mntmn.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 agx@sigxcpu.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurentiu,

On Fri, 2020-03-06 at 11:58 +0200, Laurentiu Palcu wrote:
> On Wed, Feb 26, 2020 at 02:19:11PM +0100, Lucas Stach wrote:
[...]
> > > +/* This function will be called from interrupt context. */
> > > +void dcss_scaler_write_sclctrl(struct dcss_scaler *scl)
> > > +{
> > > +	int chnum;
> > > +
> > > +	for (chnum = 0; chnum < 3; chnum++) {
> > > +		struct dcss_scaler_ch *ch = &scl->ch[chnum];
> > > +
> > > +		if (ch->scaler_ctrl_chgd) {
> > > +			dcss_ctxld_write_irqsafe(scl->ctxld, scl->ctx_id,
> > > +						 ch->scaler_ctrl,
> > > +						 ch->base_ofs +
> > > +						 DCSS_SCALER_CTRL);
> > 
> > Why is this using the _irqsafe variant without any locking? Won't this
> > lead to potential internal state corruption? dcss_ctxld_write is using
> > the _irqsave locking variants, so it fine with being called from IRQ
> > context.
> 
> This is only called from __dcss_ctxld_enable() which is already protected
> by lock/unlock in dcss_ctxld_kick().

You could add a lockdep_assert_held() line to the top of this function
to make it clear this depends on the lock being held.

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

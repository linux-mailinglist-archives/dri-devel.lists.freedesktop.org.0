Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A333D11F6ED
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2019 10:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855476E40D;
	Sun, 15 Dec 2019 09:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921936E40D
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 09:13:38 +0000 (UTC)
Received: from ip5f5a5f74.dynamic.kabel-deutschland.de ([95.90.95.116]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1igPxy-0001xP-1M; Sun, 15 Dec 2019 10:13:30 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 3/3] drm/panel: add panel driver for Xinpeng XPP055C272
 panels
Date: Sun, 15 Dec 2019 10:13:29 +0100
Message-ID: <1744285.zQlJhejOUX@phil>
In-Reply-To: <20191215082916.GA25772@ravnborg.org>
References: <20191209144208.4863-1-heiko@sntech.de> <2272108.TFxdGdtKl4@diego>
 <20191215082916.GA25772@ravnborg.org>
MIME-Version: 1.0
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Am Sonntag, 15. Dezember 2019, 09:29:16 CET schrieb Sam Ravnborg:
> Hi Heiko.
> 
> > Am Samstag, 14. Dezember 2019, 09:17:30 CET schrieb Sam Ravnborg:
> > > > +#define dsi_generic_write_seq(dsi, cmd, seq...) do {			\
> > > > +		static const u8 d[] = { seq };				\
> > > > +		int ret;						\
> > > > +		ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));	\
> > > > +		if (ret < 0)						\
> > > > +			return ret;					\
> > > > +	} while (0)
> > > This macro return an error code if a write fails.
> > > 
> > > > +
> > > > +static int xpp055c272_init_sequence(struct xpp055c272 *ctx)
> > > > +{
> > > > +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> > > > +	struct device *dev = ctx->dev;
> > > > +	int ret;
> > > > +
> > > > +	/*
> > > > +	 * Init sequence was supplied by the panel vendor without much
> > > > +	 * documentation.
> > > > +	 */
> > > > +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
> > > But all uses of the macro here ignore the error.
> > 
> > hmm, am I way off track here?
> > 
> > 	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
> > 	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETMIPI,
> > 			      0x33, 0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
> > 			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
> > 			      0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4f, 0x01,
> > 			      0x00, 0x00, 0x37);
> > 	...
> > 
> > should just expand to
> > 
> > do {
> > 		static const u8 d[] = { 0xf1, 0x12, 0x83 };
> > 		int ret;
> > 		ret = mipi_dsi_dcs_write(dsi, XPP055C272_CMD_SETEXTC, d, ARRAY_SIZE(d));
> > 		if (ret < 0)
> > 			return ret;
> > } while (0)
> > do {
> > 		static const u8 d[] = { 0x33, 0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
> > 			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
> > 			      0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4f, 0x01,
> > 			      0x00, 0x00, 0x37 };
> > 		int ret;
> > 		ret = mipi_dsi_dcs_write(dsi, XPP055C272_CMD_SETMIPI, d, ARRAY_SIZE(d));
> > 		if (ret < 0)
> > 			return ret;
> > } while (0)
> > ...
> > 
> > so every write instance will actually return an error if it happens and not
> > continue on with the next init item.
> The idea was that if a write returned an error then do not even attempt
> more writes. So if a write fails we do not loose the original error
> code, assuming subsequent write would also fail.

Shouldn't the code above do exactly that? ... Because it's like

	ret = dcs_write(...)
	if (ret <0)
		return ret;

So if any of the dcs_writes goes wrong it should just return the
error code from that write from the function and not try any more
writes. (or I'm blind and do not see something ;-) )


Heiko

> I have looked through all the panel drivers now, and the majority does
> not check if the write goes wrong.
> So following the pattern on the other panels you can also decide to just
> ignore the return value of mipi_dsi_dcs_write() rahter than trying to
> invent the check I tried to explain.
> 
> 	Sam
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D00911F502
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2019 00:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BF56E3FB;
	Sat, 14 Dec 2019 23:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0696E3FB
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2019 23:07:59 +0000 (UTC)
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1igGVq-00005i-Hi; Sun, 15 Dec 2019 00:07:50 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 3/3] drm/panel: add panel driver for Xinpeng XPP055C272
 panels
Date: Sun, 15 Dec 2019 00:07:49 +0100
Message-ID: <2272108.TFxdGdtKl4@diego>
In-Reply-To: <20191214081730.GC22818@ravnborg.org>
References: <20191209144208.4863-1-heiko@sntech.de>
 <20191209144208.4863-3-heiko@sntech.de> <20191214081730.GC22818@ravnborg.org>
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
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

thanks for the thorough review :-)

Am Samstag, 14. Dezember 2019, 09:17:30 CET schrieb Sam Ravnborg:
> > +#define dsi_generic_write_seq(dsi, cmd, seq...) do {			\
> > +		static const u8 d[] = { seq };				\
> > +		int ret;						\
> > +		ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));	\
> > +		if (ret < 0)						\
> > +			return ret;					\
> > +	} while (0)
> This macro return an error code if a write fails.
> 
> > +
> > +static int xpp055c272_init_sequence(struct xpp055c272 *ctx)
> > +{
> > +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> > +	struct device *dev = ctx->dev;
> > +	int ret;
> > +
> > +	/*
> > +	 * Init sequence was supplied by the panel vendor without much
> > +	 * documentation.
> > +	 */
> > +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
> But all uses of the macro here ignore the error.

hmm, am I way off track here?

	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETMIPI,
			      0x33, 0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
			      0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4f, 0x01,
			      0x00, 0x00, 0x37);
	...

should just expand to

do {
		static const u8 d[] = { 0xf1, 0x12, 0x83 };
		int ret;
		ret = mipi_dsi_dcs_write(dsi, XPP055C272_CMD_SETEXTC, d, ARRAY_SIZE(d));
		if (ret < 0)
			return ret;
} while (0)
do {
		static const u8 d[] = { 0x33, 0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
			      0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4f, 0x01,
			      0x00, 0x00, 0x37 };
		int ret;
		ret = mipi_dsi_dcs_write(dsi, XPP055C272_CMD_SETMIPI, d, ARRAY_SIZE(d));
		if (ret < 0)
			return ret;
} while (0)
...

so every write instance will actually return an error if it happens and not
continue on with the next init item.

Or I'm not thinking correctly at 0:07 ;-)


Heiko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

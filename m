Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B6911F6DB
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2019 09:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B196E40C;
	Sun, 15 Dec 2019 08:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486166E40C
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 08:29:21 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C5EEA20028;
 Sun, 15 Dec 2019 09:29:17 +0100 (CET)
Date: Sun, 15 Dec 2019 09:29:16 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 3/3] drm/panel: add panel driver for Xinpeng XPP055C272
 panels
Message-ID: <20191215082916.GA25772@ravnborg.org>
References: <20191209144208.4863-1-heiko@sntech.de>
 <20191209144208.4863-3-heiko@sntech.de>
 <20191214081730.GC22818@ravnborg.org> <2272108.TFxdGdtKl4@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2272108.TFxdGdtKl4@diego>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=B31p6XxBGmTHbxNlXPsA:9 a=CjuIK1q_8ugA:10 a=Z5ABNNGmrOfJ6cZ5bIyy:22
 a=SsAZrZ5W_gNWK9tOzrEV:22
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

Hi Heiko.

> Am Samstag, 14. Dezember 2019, 09:17:30 CET schrieb Sam Ravnborg:
> > > +#define dsi_generic_write_seq(dsi, cmd, seq...) do {			\
> > > +		static const u8 d[] = { seq };				\
> > > +		int ret;						\
> > > +		ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));	\
> > > +		if (ret < 0)						\
> > > +			return ret;					\
> > > +	} while (0)
> > This macro return an error code if a write fails.
> > 
> > > +
> > > +static int xpp055c272_init_sequence(struct xpp055c272 *ctx)
> > > +{
> > > +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> > > +	struct device *dev = ctx->dev;
> > > +	int ret;
> > > +
> > > +	/*
> > > +	 * Init sequence was supplied by the panel vendor without much
> > > +	 * documentation.
> > > +	 */
> > > +	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
> > But all uses of the macro here ignore the error.
> 
> hmm, am I way off track here?
> 
> 	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
> 	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETMIPI,
> 			      0x33, 0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
> 			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
> 			      0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4f, 0x01,
> 			      0x00, 0x00, 0x37);
> 	...
> 
> should just expand to
> 
> do {
> 		static const u8 d[] = { 0xf1, 0x12, 0x83 };
> 		int ret;
> 		ret = mipi_dsi_dcs_write(dsi, XPP055C272_CMD_SETEXTC, d, ARRAY_SIZE(d));
> 		if (ret < 0)
> 			return ret;
> } while (0)
> do {
> 		static const u8 d[] = { 0x33, 0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
> 			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
> 			      0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4f, 0x01,
> 			      0x00, 0x00, 0x37 };
> 		int ret;
> 		ret = mipi_dsi_dcs_write(dsi, XPP055C272_CMD_SETMIPI, d, ARRAY_SIZE(d));
> 		if (ret < 0)
> 			return ret;
> } while (0)
> ...
> 
> so every write instance will actually return an error if it happens and not
> continue on with the next init item.
The idea was that if a write returned an error then do not even attempt
more writes. So if a write fails we do not loose the original error
code, assuming subsequent write would also fail.

I have looked through all the panel drivers now, and the majority does
not check if the write goes wrong.
So following the pattern on the other panels you can also decide to just
ignore the return value of mipi_dsi_dcs_write() rahter than trying to
invent the check I tried to explain.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

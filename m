Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4113671B6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 19:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE9C6E1B5;
	Wed, 21 Apr 2021 17:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63956E1B5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 17:46:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5776C6113B;
 Wed, 21 Apr 2021 17:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619027215;
 bh=a6WRC3swuMxcN5gibDf6fwqEFFmXnQfRYNe6DYYDHGg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K+zuczsW81yOc1sT0GCZabu+dTVGED9HH1O1aB3buMu8rY5as57wDTRXsiRonMCCh
 8F+JJjt4cCF1j1e1YzoASdZcDJsSJMgj7XnpT1D8nMxk3h3zNJce+tetMUaWXgcxjk
 J3T/3koZ+c7vtbf4l2R/j4CevgT3OE1WlI5c7sMgj9s1okKI5W6aZtd10bsRHZydPD
 HAPDpsVceaH0BpI1owE971oufN4iERFqMDQwMG6J/wAhtEakNx6Qu+NF5BPBjcb3D7
 gg7xbksiDqgJKOGPh5yNSr8vz8CGj7mKQQABCntxKprI8QU6BP4mDF6rZ/7T8Q4vIB
 ysmQ0vqikyOKA==
Date: Wed, 21 Apr 2021 18:46:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in probe
Message-ID: <20210421174629.GD4617@sirena.org.uk>
References: <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
 <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
 <VE1PR04MB66387217EDE5133FD2D8F793894E9@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <50ef17a2d57b022c48bbca71fd4e074cc3ca9be5.camel@pengutronix.de>
 <VE1PR04MB6638EE85485768351755557B89499@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <97262466d537402ad4032098ef277d6d47734f1f.camel@pengutronix.de>
 <VE1PR04MB6638659EC8557D01861042B189489@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <d8d084aa7ff183e2f78128a46a0ce5241f357c9a.camel@pengutronix.de>
 <VE1PR04MB66887C731E32BDBB340B044C89479@VE1PR04MB6688.eurprd04.prod.outlook.com>
 <18fbdc4bf0574a722134400ad9e4510d3cbcb767.camel@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <18fbdc4bf0574a722134400ad9e4510d3cbcb767.camel@pengutronix.de>
X-Cookie: RELATIVES!!
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Robin Gong <yibin.gong@nxp.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "perex@perex.cz" <perex@perex.cz>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Timur Tabi <timur@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Content-Type: multipart/mixed; boundary="===============0157604047=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0157604047==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sgneBHv3152wZ8jf"
Content-Disposition: inline


--sgneBHv3152wZ8jf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 21, 2021 at 07:43:18PM +0200, Lucas Stach wrote:

> If your driver code drops the rpm refcount to 0 and starts the
> autosuspend timer while a cyclic transfer is still in flight this is
> clearly a bug. Autosuspend is not there to paper over driver bugs, but
> to amortize cost of actually suspending and resuming the hardware. Your
> driver code must still work even if the timeout is 0, i.e. the hardware
> is immediately suspended after you drop the rpm refcount to 0.

> If you still have transfers queued/in-flight the driver code must keep
> a rpm reference.

Right, failing to do that is a clear bug.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--sgneBHv3152wZ8jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCAZPQACgkQJNaLcl1U
h9CQHwf/aovjO8Ad2u7sCq5MwvRFCIYwJ1CpKRnX4pLM6wYJq/w0MMfWMFZsAxb9
9S1OpyvCFbGe76zbcqhKj8S21KBhXizZkfD6Vpe7TFugCGPJCjB51bMfLr2pGBBI
lDbi5cFUapnWSp38AOK4/JEVOP/dQKJgt3ndadidkyLPtTUBqpEYMhiZ8EymPB8z
YTmINg9bemV7OpbuzDCytmQIGSf/UPGYu09wfS5uLHUS2qdVPdc+uWqUe+RgsZqT
88ZMLGQBZMRhTcdn4UVONaM3WNTv7hi1Xh/3B+3NlViFFrbhk7RQ9HGjNDrEKQ0C
P2NTaTgDl0M0cEWTDLH8M/aAJzaCqg==
=XMAS
-----END PGP SIGNATURE-----

--sgneBHv3152wZ8jf--

--===============0157604047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0157604047==--

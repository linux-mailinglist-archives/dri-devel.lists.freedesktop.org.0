Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730B0191370
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 15:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B296E49F;
	Tue, 24 Mar 2020 14:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604A76E49F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 14:43:14 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jGklo-0001vv-Na; Tue, 24 Mar 2020 15:43:08 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jGkln-0000tK-B5; Tue, 24 Mar 2020 15:43:07 +0100
Date: Tue, 24 Mar 2020 15:43:07 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v11 10/12] backlight: pwm_bl: Use 64-bit division function
Message-ID: <20200324144307.kxhqzyjj4evrouqa@pengutronix.de>
References: <cover.1584667964.git.gurus@codeaurora.org>
 <17fc1dcf8b9b392d1e37dc7e3e67409e3c502840.1584667964.git.gurus@codeaurora.org>
 <20200320133123.GD5477@dell> <20200324110710.GL5477@dell>
 <20200324125735.2mjuvbxt5bpon2ft@pengutronix.de>
 <20200324130410.dwlg767ku6kwequv@holly.lan>
 <20200324142441.GD442973@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324142441.GD442973@dell>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
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
Cc: Guru Das Srinagesh <gurus@codeaurora.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-pwm@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-fbdev@vger.kernel.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 02:24:41PM +0000, Lee Jones wrote:
> On Tue, 24 Mar 2020, Daniel Thompson wrote:
> =

> > On Tue, Mar 24, 2020 at 01:57:35PM +0100, Uwe Kleine-K=F6nig wrote:
> > > Hello Lee,
> > > =

> > > On Tue, Mar 24, 2020 at 11:07:10AM +0000, Lee Jones wrote:
> > > > On Fri, 20 Mar 2020, Lee Jones wrote:
> > > > =

> > > > > On Thu, 19 Mar 2020, Guru Das Srinagesh wrote:
> > > > > =

> > > > > > Since the PWM framework is switching struct pwm_state.period's =
datatype
> > > > > > to u64, prepare for this transition by using div_u64 to handle =
a 64-bit
> > > > > > dividend instead of a straight division operation.
> > > > > > =

> > > > > > Cc: Lee Jones <lee.jones@linaro.org>
> > > > > > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > > > > > Cc: Jingoo Han <jingoohan1@gmail.com>
> > > > > > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > > > > > Cc: linux-pwm@vger.kernel.org
> > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > Cc: linux-fbdev@vger.kernel.org
> > > > > > =

> > > > > > Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> > > > > > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > > > > ---
> > > > > >  drivers/video/backlight/pwm_bl.c | 3 ++-
> > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > =

> > > > > Can this patch be taken on its own?
> > > > =

> > > > Hellooooo ...
> > > =

> > > Conceptually it can. As the last patch depends on this one (and the
> > > others) some coordination might be beneficial. But that's up to Thier=
ry
> > > to decide how (and if) he want this series to be applied.
> > =

> > ... and on the backlight side we definitely need to know about the "if"
> > otherwise there's no point in taking it.
> =

> Right.
> =

> I'm happy to wait for Thierry.  Although this isn't the only set he's
> currently blocking.  Is he okay?  On holiday perhaps?

The newest commit by him in next is from last week. My guess is he
just didn't come around yet to care for the PWM duties.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

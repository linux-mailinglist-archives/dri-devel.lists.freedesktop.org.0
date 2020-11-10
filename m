Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E44BE2AD1E8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:57:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A41895B9;
	Tue, 10 Nov 2020 08:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C92895B9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 08:57:02 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 09C9F20038;
 Tue, 10 Nov 2020 09:56:59 +0100 (CET)
Date: Tue, 10 Nov 2020 09:56:58 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: ipu: Search for scaling coefs up to 102%
 of?? the screen
Message-ID: <20201110085658.GA2027451@ravnborg.org>
References: <20201105083905.8780-1-paul@crapouillou.net>
 <20201107193311.GB1039949@ravnborg.org>
 <YJOKJQ.8KD9M5MU0NTP2@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJOKJQ.8KD9M5MU0NTP2@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8 a=ER_8r6IbAAAA:8
 a=9CIfjzEbJXW8LZeqSngA:9 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=9LHmKk7ezEChjTCyhBa9:22
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 od@zcrc.me, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,
On Tue, Nov 10, 2020 at 08:50:22AM +0000, Paul Cercueil wrote:
> Hi,
> =

> Le sam. 7 nov. 2020 =E0 20:33, Sam Ravnborg <sam@ravnborg.org> a =E9crit :
> > Hi Paul.
> > =

> > On Thu, Nov 05, 2020 at 08:39:05AM +0000, Paul Cercueil wrote:
> > >  Increase the scaled image's theorical width/height until we find a
> > >  configuration that has valid scaling coefficients, up to 102% of the
> > >  screen's resolution. This makes sure that we can scale from almost
> > >  every resolution possible at the cost of a very small distorsion.
> > >  The CRTC_W / CRTC_H are not modified.
> > > =

> > >  This algorithm was already in place but would not try to go above
> > > the
> > >  screen's resolution, and as a result would only work if the CRTC_W /
> > >  CRTC_H were smaller than the screen resolution. It will now try
> > > until it
> > >  reaches 102% of the screen's resolution.
> > > =

> > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > =

> > Looks like the patch does what the descriptions says.
> > So in other words - look OK to me. I am not confident enogh for a r-b
> > but my code reading is enough to warrant an a-b:
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> =

> Note that this algorithm exists mostly as a band-aid for a missing
> functionality: it is not possible for userspace to request the closest mo=
de
> that would encapsulate the provided one, because the GEM buffer is created
> beforehand. If there was a way to let the kernel tweak the mode, I could
> write a better algorithm that would result in a better looking picture.

Could you add this nice explanation to the changelog so when we wonder
why this was done in some years we can dig up this from git history.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

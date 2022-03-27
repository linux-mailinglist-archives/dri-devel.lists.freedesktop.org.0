Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B33B4E89CE
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 21:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D5210E012;
	Sun, 27 Mar 2022 19:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D272F10E012
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 19:45:17 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 6cdf4254-ae06-11ec-8da1-0050568c148b;
 Sun, 27 Mar 2022 19:45:16 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 4749C194B36;
 Sun, 27 Mar 2022 21:45:15 +0200 (CEST)
Date: Sun, 27 Mar 2022 21:45:11 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Christophe Branchereau <cbranchereau@gmail.com>
Subject: Re: [PATCH v5 3/3] drm/panel : innolux-ej030na and abt-y030xx067a :
 add .enable and .disable
Message-ID: <YkC+x4m0BQFgu/n0@ravnborg.org>
References: <20220321133651.291592-1-cbranchereau@gmail.com>
 <20220321133651.291592-4-cbranchereau@gmail.com>
 <GJM39R.I3L8ZIKHOJ252@crapouillou.net>
 <CAFsFa85Rcxh7G-X9zygHdAaca2nydUXxGfE2Vgcx_nzqgQZVgw@mail.gmail.com>
 <CAFsFa85P8V-yePR5LTLjn57GCoqJJYn5pX6WNdp+a+G23XEbSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFsFa85P8V-yePR5LTLjn57GCoqJJYn5pX6WNdp+a+G23XEbSg@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe,

On Mon, Mar 21, 2022 at 03:42:08PM +0100, Christophe Branchereau wrote:
> Sorry I meant "sleep out" not "sleep in" obviously
> 
> On Mon, Mar 21, 2022 at 3:39 PM Christophe Branchereau
> <cbranchereau@gmail.com> wrote:
> >
> > Following the introduction of bridge_atomic_enable in the ingenic
> > drm driver, the crtc is enabled between .prepare and .enable, if
> > it exists. Add it so the backlight is only enabled after the crtc is, to
> > avoid graphical issues.
> >
> > As we're moving the "sleep in" command out of the init sequence
> > into .enable for the ABT, we need to switch the regmap cache
> > to REGCACHE_FLAT to be able to use regmap_set_bits, given this
> > panel registers are write-ony and read as 0.
> >
> > On Mon, Mar 21, 2022 at 3:21 PM Paul Cercueil <paul@crapouillou.net> wrote:
> > >
> > > Hi Christophe,
> > >
> > > Le lun., mars 21 2022 at 14:36:51 +0100, Christophe Branchereau
> > > <cbranchereau@gmail.com> a écrit :
> > > > Following the introduction of bridge_atomic_enable in the ingenic
> > > > drm driver, the crtc is enabled between .prepare and .enable, if
> > > > it exists.
> > > >
> > > > Add it so the backlight is only enabled after the crtc is, to avoid
> > > > graphical issues.
> > > >
> > > > Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> > >
> > > Didn't Sam acked it?
No, that was the new driver, already replied.

For these changes - with the updated changelog:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DE54F9C2C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 20:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB0310E6F3;
	Fri,  8 Apr 2022 18:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C65D10E6F3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 18:01:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95516499;
 Fri,  8 Apr 2022 20:01:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1649440888;
 bh=XVlXldVmMbK4ZdMZR7ZO2iAnFDbXwYeICcHEaM4OKaw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aEHATppX9zQY9R+9cEkR+sMDyoZAUFK90JqaRLSnle1V00UREIk02jU6h2N7xAyHL
 4E8SlG4u0nEkTE8NiLILRVPwQPK9NMXkfPN70gyts6AVE5L8Leib+VT9B1bU4jlUrH
 FEqnj9TH0Y9Dg4Q8G1/wkJOAak2cGIBYd6yspnwM=
Date: Fri, 8 Apr 2022 21:01:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
Message-ID: <YlB4c6/5ysA4o6J4@pendragon.ideasonboard.com>
References: <9c9a10ca-e6a1-c310-c0a5-37d4fed6efd6@denx.de>
 <CAEHkU3We_odwtWBXHdcwu+_9yEUo0mudC5sVjr0or0C6nbw+vw@mail.gmail.com>
 <20220318163549.5a5v3lex4btnnvgb@houat>
 <CAPY8ntDgWwXyWXDWVouzhdC2wsyjbRgfrvWGU=MRG_2sAquHyQ@mail.gmail.com>
 <20220318171642.y72eqf5qbmuu2ln2@houat>
 <CAPY8ntAjnmAyr=6sdAJWbmiEODHM3=Q3c5UnBCTNgyZqBsWBzQ@mail.gmail.com>
 <5ae44b7cd1f7577c98f316a7d288aa4cf423da2d.camel@active.ch>
 <20220323155817.xcsqxothziot7ba3@houat>
 <ab2db55f6dedba76cd112e4bbc43cf8a7e4332a3.camel@gmail.com>
 <20220324081533.GA249009@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220324081533.GA249009@francesco-nb.int.toradex.com>
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
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Max Krummenacher <max.oss.09@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 DenysDrozdov <denys.drozdov@toradex.com>, Maxime Ripard <maxime@cerno.tech>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 24, 2022 at 09:15:33AM +0100, Francesco Dolcini wrote:
> On Wed, Mar 23, 2022 at 09:06:18PM +0100, Max Krummenacher wrote:
> > Am Mittwoch, den 23.03.2022, 16:58 +0100 schrieb Maxime Ripard:
> > > On Wed, Mar 23, 2022 at 09:42:11AM +0100, Max Krummenacher wrote:
> > > > I would copy the definitions of media-bus-format.h into a header in
> > > > include/dt-bindings similarly as it is done for
> > > > include/dt-bindings/display/sdtv-standards.h for TV standards.
> > > 
> > > That might not be an option: that header is licensed under the GPL,
> > > device trees are usually licensed under GPL+MIT, and we don't have any
> > > requirements on the license for other projects using a DT (hence the
> > > dual license).
> > 
> > That one I didn't consider. That would be solved by a newly invented
> > enum.
> 
> IANAL, but we are talking about the copyright of something that is not
> even a complete API, it is just a list of name/value. I do not believe
> that this is a real problem without solution.

I agree here, I don't think it's an issue.

-- 
Regards,

Laurent Pinchart

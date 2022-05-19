Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFF152D42B
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 15:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1E711A676;
	Thu, 19 May 2022 13:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A034B11A676
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 13:40:26 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 107)
 id 6E0AC68BEB; Thu, 19 May 2022 15:40:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on verein.lst.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_50
 autolearn=disabled version=3.3.1
Received: from blackhole (p5b0d840b.dip0.t-ipconnect.de [91.13.132.11])
 by verein.lst.de (Postfix) with ESMTPSA id 6467768AA6;
 Thu, 19 May 2022 15:39:58 +0200 (CEST)
Date: Thu, 19 May 2022 15:39:52 +0200
From: Torsten Duwe <duwe@lst.de>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH] drm/bridge: fix anx6345 power up sequence
Message-ID: <20220519153952.7c6c412b@blackhole>
In-Reply-To: <CA+E=qVcNasK=q8o0g1teqK3+cD3aywy+1bgtTJC4VvaZvfZtGA@mail.gmail.com>
References: <20220417181538.57fa1303@blackhole>
 <CA+E=qVeX2aU0hiDMxLXzVk-YiMsqKKFKpm=cc=72joMhZmNV1g@mail.gmail.com>
 <CA+E=qVdEtx8wVbcrMQYGB1ur1ykvNRp1L174mVSMkB0zeOPYNQ@mail.gmail.com>
 <20220428175759.13f75c21@blackhole.lan>
 <CA+E=qVcNasK=q8o0g1teqK3+cD3aywy+1bgtTJC4VvaZvfZtGA@mail.gmail.com>
Organization: LST e.V.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, stable@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 May 2022 09:53:58 -0700
Vasily Khoruzhick <anarsoul@gmail.com> wrote:

> On Thu, Apr 28, 2022 at 8:58 AM Torsten Duwe <duwe@lst.de> wrote:

> > power on the eDP bridge? Could there be any leftovers from that
> > mechanism? I use a hacked-up U-Boot with a procedure similar to the
> > kernel driver as fixed by this change.

I was asking because I recall an ugly hack in some ATF code to power up
the chip correctly. Did you patch ATF, and maybe call functions of it
at runtime?

> >
> > But the main question is: does this patch in any way worsen the
> > situation on the pinebook?
> 
> I don't think it worsens anything, but according to the datasheet the
> change makes no sense. Could you try increasing T2 instead of changing
> the power sequence?

According to the datasheet, there is also T3, I realise now. The
diagram talks about "System Clock", but both Teres and Pinebook have a
passive resonator circuit there. Correct me if I'm wrong, but without
chip power, there is little to resonate. What if that driving clock
circuit is powered by Vdd25? Maybe the earlier provision of 2V5 is
enough for Teres' Q4, but Pinebook X4 takes even longer? The start-up
times can be in the range of milliseconds.

	Torsten

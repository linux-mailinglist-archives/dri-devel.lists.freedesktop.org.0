Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A3F9B8066
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 17:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA4C10E8ED;
	Thu, 31 Oct 2024 16:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ChAAW7w1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECDC10E8ED
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 16:42:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 49DFBA4449B;
 Thu, 31 Oct 2024 16:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B93C4DDFE;
 Thu, 31 Oct 2024 16:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730392418;
 bh=cRqp5Dj5S3H85dcH2UYBCVC3a46bB8FUl4uywK4ZmjQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ChAAW7w1SFQ2sdQrQTh/ESg33bAT4JCN3urBYczD83+2MIjv4+Fw1PfRRPY4GxLL1
 dtPO8yl+Qec6+kDpHYB3kc41IoBZey0b9cQEFSgYMiTywCuZtOul4Hpbaj2mn07TgD
 fiznwabdzOz5yKPKvio3/6P9WqMYhS6e8apZBNOn8tZq4CNPZREDc0qYxDM7Sltdjt
 gBlUjOxV5keDIBO7lJerRaOwmiljmJYftnovNTz5qipxQsU2IAe+OqswiLcanl35tE
 Ru+g0j6JokVa4ZXzKPvm1CsMH2RkOUZZQhgIAJmNd/mZuZCk1Z3cmkairc4nPdjUR6
 SAVxmQU1MzlYA==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1t6Y75-000000007IP-42FB;
 Thu, 31 Oct 2024 17:33:36 +0100
Date: Thu, 31 Oct 2024 17:33:35 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
Message-ID: <ZyOxX31QV2GA8Ef8@hovoldconsulting.com>
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
 <ZxYBa11Ig_HHQngV@hovoldconsulting.com>
 <ZyOOwEPB9NLNtL4N@hovoldconsulting.com>
 <ZyOsuTr4XBU3ogRx@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyOsuTr4XBU3ogRx@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 31, 2024 at 06:13:45PM +0200, Abel Vesa wrote:
> On 24-10-31 15:05:52, Johan Hovold wrote:
> > On Mon, Oct 21, 2024 at 09:23:24AM +0200, Johan Hovold wrote:
> > > On Fri, Oct 18, 2024 at 03:49:34PM +0300, Abel Vesa wrote:

> > > > Cc: stable@vger.kernel.org      # 6.8
> 
> > > I assume there are no existing devicetrees that need this since then we
> > > would have heard about it sooner. Do we still need to backport it?
> 
> None of the DTs I managed to scan seem to have this problem.
> 
> Maybe backporting it is not worth it then.

Thanks for confirming. Which (new) driver and DT are you seeing this
with?

> > > When exactly are you hitting this?
> 
> Here is one of the examples.
> 
> [    5.768283] x1e80100-tlmm f100000.pinctrl: error -EINVAL: pin-185 (aux_bridge.aux_bridge.3)
> [    5.768289] x1e80100-tlmm f100000.pinctrl: error -EINVAL: could not request pin 185 (GPIO_185) from group gpio185 on device f100000.pinctrl
> [    5.768293] aux_bridge.aux_bridge aux_bridge.aux_bridge.3: Error applying setting, reverse things back

I meant with which driver and DT you hit this with.

> > Abel, even if Neil decided to give me the finger here, please answer the
> > above so that it's recorded in the archives at least.

> Sorry for not replying in time before the patch was merge.

That's not your fault.

Johan

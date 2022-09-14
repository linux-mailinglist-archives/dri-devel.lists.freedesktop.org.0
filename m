Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B68E05B8ECD
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 20:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E45510E9BD;
	Wed, 14 Sep 2022 18:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18D910E9BD
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 18:21:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3E3FF61D2B;
 Wed, 14 Sep 2022 18:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92286C433D6;
 Wed, 14 Sep 2022 18:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663179661;
 bh=0k1o6bRr+NEvKLRyyWRelzjtd4DFbk4nFQCS2HGUee4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=lMDyla8CGKj9lVQmz4y65wn+Av/UPaMz0rAPrKy4RNHqc+uRdnZW6zqNnYXqts19e
 rWykZtJthMqEb0j1UwnAnKPgUcyV0evqJ8WXnkDC5EWfcSYIXiWqc1Px7sq/8iQXN/
 d/LJwkdiqVqQPI8Fr22/tXHHpxsXI+ye60PEgTWgtlEEcY7p0bTBxLH2LSsGGPvjJF
 ogplaJ0Ck88abKk/YDQpt2Y5W9jwft13EMM3ENV7GzrGiEOkc4QlpGhmLfDoCT0acw
 fXD2dVAQ54yzHBZAC65OwJ5cIXbJ0eupRlSzydszyFAizETOihaiizunruM1WZT117
 oHK5jIztyc/4w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c221873f-f230-0cce-e120-7e3cc732cf00@i2se.com>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
 <20220815-rpi-fix-4k-60-v1-2-c52bd642f7c6@cerno.tech>
 <20220914155035.88E45C433C1@smtp.kernel.org>
 <50e8f1e8-806a-3599-7cbe-0c7d4bec1c51@i2se.com>
 <20220914180508.0EDD9C433D6@smtp.kernel.org>
 <c221873f-f230-0cce-e120-7e3cc732cf00@i2se.com>
Subject: Re: [PATCH v1 2/7] clk: bcm: rpi: Add a function to retrieve the
 maximum
From: Stephen Boyd <sboyd@kernel.org>
To: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>
Date: Wed, 14 Sep 2022 11:20:59 -0700
User-Agent: alot/0.10
Message-Id: <20220914182101.92286C433D6@smtp.kernel.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Stefan Wahren (2022-09-14 11:09:04)
> Am 14.09.22 um 20:05 schrieb Stephen Boyd:
> > Quoting Stefan Wahren (2022-09-14 10:45:48)
> >> Am 14.09.22 um 17:50 schrieb Stephen Boyd:
> >>> Furthermore, I wonder if even that part needs to be implemented.  Why
> >>> not make a direct call to rpi_firmware_property() and get the max rat=
e?
> >>> All of that can live in the drm driver. Making it a generic API that
> >>> takes a 'struct clk' means that it looks like any clk can be passed,
> >>> when that isn't true. It would be better to restrict it to the one use
> >>> case so that the scope of the problem doesn't grow. I understand that=
 it
> >>> duplicates a few lines of code, but that looks like a fair tradeoff v=
s.
> >>> exposing an API that can be used for other clks in the future.
> >> it would be nice to keep all the Rpi specific stuff out of the DRM
> >> driver, since there more users of it.
> > Instead of 'all' did you mean 'any'?
> yes

Another idea is to populate an OPP table in the rpi firmware driver for
this platform device with the adjusted max frequency. That would be an
SoC/firmware agnostic interface that expresses the constraints. I'm
almost certain we talked about this before.

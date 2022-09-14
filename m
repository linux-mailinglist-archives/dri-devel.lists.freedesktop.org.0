Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587945B8E87
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 20:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A744810E0C8;
	Wed, 14 Sep 2022 18:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2064A10E0C8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 18:05:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 55D76B81C4D;
 Wed, 14 Sep 2022 18:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDD9C433D6;
 Wed, 14 Sep 2022 18:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663178708;
 bh=e2slHSgeoUgIh3zoiTFJXIXJMSZ4aPFjE289S3cMQXc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=CtRKZzYcmdo9mBSod6ZxSQ9g/KI0FkHzt63GRo9Z5DDOVT5i9b/Gz3YIRgJvTb+V+
 I0wtOcGf5epD8SP8k63ozUjFRZe39PFNghx5I+UYQa1nmthhRT0bOZZ3q82isApGL1
 /xyvHo5LZMTR9y4dapbH32H8Y29c7n1kH4cAh2IOo/Vm7Kx2XiZA6mM6tZHpQqu6/p
 uYlXXcVqpYyI0aVHJT0oTej5Heg9JyY+do6Qz9p68+nNA7+WdjJcWqHdN2LiPCgFQr
 xomfQcBAI0WsHa8zm2gETtS7zRs0e24stjyb4zwiPcC2eq5p2HvTeFiK5+kH1dGYKW
 F1gcNlftXe4pw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <50e8f1e8-806a-3599-7cbe-0c7d4bec1c51@i2se.com>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
 <20220815-rpi-fix-4k-60-v1-2-c52bd642f7c6@cerno.tech>
 <20220914155035.88E45C433C1@smtp.kernel.org>
 <50e8f1e8-806a-3599-7cbe-0c7d4bec1c51@i2se.com>
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
Date: Wed, 14 Sep 2022 11:05:06 -0700
User-Agent: alot/0.10
Message-Id: <20220914180508.0EDD9C433D6@smtp.kernel.org>
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

Quoting Stefan Wahren (2022-09-14 10:45:48)
> Am 14.09.22 um 17:50 schrieb Stephen Boyd:
> >
> > Furthermore, I wonder if even that part needs to be implemented.  Why
> > not make a direct call to rpi_firmware_property() and get the max rate?
> > All of that can live in the drm driver. Making it a generic API that
> > takes a 'struct clk' means that it looks like any clk can be passed,
> > when that isn't true. It would be better to restrict it to the one use
> > case so that the scope of the problem doesn't grow. I understand that it
> > duplicates a few lines of code, but that looks like a fair tradeoff vs.
> > exposing an API that can be used for other clks in the future.
> it would be nice to keep all the Rpi specific stuff out of the DRM=20
> driver, since there more users of it.

Instead of 'all' did you mean 'any'?

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2C746335F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 12:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261EA6E86A;
	Tue, 30 Nov 2021 11:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 362 seconds by postgrey-1.36 at gabe;
 Tue, 30 Nov 2021 11:52:05 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5E66E888
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 11:52:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89D33B81853;
 Tue, 30 Nov 2021 11:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B290C53FD2;
 Tue, 30 Nov 2021 11:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638272758;
 bh=NaJPt5ZfhcOqGwPuUoJxkdXpkvIfXMuvm1EjiLlhrA8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=l6SVrj96Z9TEcxscLwygYJqGqnP8XY6ccBjU5L1bUR0Xu+aCdPbem7raqQp1lWlj3
 zyjudDEyIVFZ4AggYGgiY3bT1/KgrszWwdWGwY6ifHsyaOm3Ojxrmc0o7GfOflxJ/U
 zcU6cu6hqs1uyOJraEnZKJiu3bI/j/7EKsJXAEBCWcuW32wNZfq1jUq7Y6Xfl+jrA+
 rEfivr+GXb8t0jthTGX8x5nfZxPGd8oKGba6Bv6gh1U3fO8L1asf8sNAPIUX9Zgwlv
 GZ2wlmvH/taqmPK+IxH90TobtHa1yWSSdiOmOoj565egkY0sgto89YFvVuFXIYWfv4
 kblF0b/QpOLaQ==
Message-ID: <cad0e66b5cb88f224bbbe54e7ed8552275864733.camel@kernel.org>
Subject: Re: [PATCH 0/5] drm/vc4: Use the firmware to stop the display pipeline
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, Scott Branden
 <sbranden@broadcom.com>,  Rob Herring <robh+dt@kernel.org>, Frank Rowand
 <frowand.list@gmail.com>, Ray Jui <rjui@broadcom.com>,  Florian Fainelli
 <f.fainelli@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, David
 Airlie <airlied@linux.ie>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 30 Nov 2021 12:45:49 +0100
In-Reply-To: <20211117145040.334827-1-maxime@cerno.tech>
References: <20211117145040.334827-1-maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Wed, 2021-11-17 at 15:50 +0100, Maxime Ripard wrote:
> Hi,
> 
> The VC4 driver has had limited support to disable the HDMI controllers and
> pixelvalves at boot if the firmware has enabled them.
> 
> However, this proved to be limited, and a bit unreliable so a new firmware
> command has been introduced some time ago to make it free all its resources and
> disable any display output it might have enabled.
> 
> This series takes advantage of that command to call it once the transition from
> simplefb to the KMS driver has been done.

I think it would make sense to integrate this funtionality into
'reset/reset-raspberrypi.c' and pass it to VC4 as a reset controller. It fits
the same startup situation as the one we have with the USB controller. Also, it
would contain the firmware weirdness in a single spot.

Otherwise, please use 'devm_rpi_firmware_get()'.

Regards,
Nicolas

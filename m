Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B45322F5F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 18:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AB56EA06;
	Tue, 23 Feb 2021 17:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DA46E9E4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 17:10:25 +0000 (UTC)
Received: from maud (unknown [IPv6:2600:8800:8c08:3600::7632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A6B7B1F457E0;
 Tue, 23 Feb 2021 17:10:21 +0000 (GMT)
Date: Tue, 23 Feb 2021 17:10:16 +0000
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Brian Starkey <brian.starkey@arm.com>
Subject: Re: [PATCH] drm/rockchip: Require the YTR modifier for AFBC
Message-ID: <YDU2+A0MNJnrWxPs@maud>
References: <20200811202631.3603-1-alyssa.rosenzweig@collabora.com>
 <CAPj87rMS5zxY6sK4N8zVZF9MHThmURj6kuso=G5+MQDVmNjC4Q@mail.gmail.com>
 <20210223145143.7bfayhp32tzdj637@DESKTOP-E1NTVVP.localdomain>
 <CAPj87rMkSdtrHnoLzK6zAVvST2KH8SprNnp5bS92qpr84g=fPg@mail.gmail.com>
 <20210223165348.edghgglgx4g2lvfw@DESKTOP-E1NTVVP.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210223165348.edghgglgx4g2lvfw@DESKTOP-E1NTVVP.localdomain>
X-Mailman-Approved-At: Tue, 23 Feb 2021 17:13:42 +0000
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
Cc: nd <nd@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> If YTR can't be turned off, then according to the AFBC spec - correct.

There is no public AFBC spec, so I'm not sure how to respond to this.

> If the hardware allows it to be configured to use YTR with other
> component orders, I don't know exactly what the impact would be -
> maybe nothing.

It's legal to use YTR with a BGR framebuffer regardless of the content
of the framebuffer, yes? Could I postprocess with the following shader?

	void main() {
		vec4 colour = ....;
		gl_FragColor = colour.bgra;
	}

That's just 3D rendering. But now if I feed that rendered "BGR"
framebuffer in I get the illusion of RGB out.

Doing the colourspace conversion in hardware (with the
GPU's component reordering) is mathematically indistinguishable from
rendering BGR with that shader.

I sympathize with reducing AFBC's combinatoric explosion, and I realize
that the Rockchip VOP is probably wrong. I also realize that the
transform is defined for BGR inputs, not RGB ones, so it might be
slightly less effective for real content. But it seems to me allowing
both BGR+YTR and RGB+YTR upstream is the better route than simply
preventing hardware from using AFBC at all, and there are natural
encodings for both with fourcc modifiers.

Maybe there's a deeper reason to require BGR that I'm missing? Please
let me know if I've misunderstood, I only know AFBC from the GPU side.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C562B5097D5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 08:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F3C10F2F3;
	Thu, 21 Apr 2022 06:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8B610E5A4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 06:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xkg/9fBx91D98nGOM7iMUznlEWdi4zGYGgMCknbS6fg=; b=HhAjS2WKe9oB9WWs9KZtnCFVXr
 C1N/qwuSD8n5GT+YN72L1mkOrQl9ENF0LWI38XgbUSgUXGIQS2kOLp8/3vloH4sZOeLoiUfHWWSNz
 c+kOjPTQbRAwailjS/Ma3fUu1rRgd6z4ySOdlIUtXvK6yEDscEO8f04w3y/UlZdp0BT4=;
Received: from p200300ccff1491001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff14:9100:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1nhQXU-0002cN-3m; Thu, 21 Apr 2022 08:43:40 +0200
Date: Thu, 21 Apr 2022 08:43:38 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [RFC PATCH 00/16] drm/rockchip: Rockchip EBC ("E-Book
 Controller") display driver
Message-ID: <20220421084338.084c4d6e@aktux>
In-Reply-To: <20220413221916.50995-1-samuel@sholland.org>
References: <20220413221916.50995-1-samuel@sholland.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
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
Cc: David Airlie <airlied@linux.ie>, =?UTF-8?B?T25kxZllag==?= Jirman <x@xff.cz>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Liang Chen <cl@rock-chips.com>, devicetree@vger.kernel.org,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh+dt@kernel.org>,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Sandy Huang <hjc@rock-chips.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Apr 2022 17:19:00 -0500
Samuel Holland <samuel@sholland.org> wrote:

[...]
> Waveform Selection From Userspace
> =================================
> EPDs use different waveforms for different purposes: high-quality
> grayscale vs. monochrome text vs. dithered monochrome video. How can
> userspace select which waveform to use? Should this be a plane property?
> 
Or does userspace rather select a QoS, like low-latency vs. high
quality. Or this will not change for a longer time: like doing full
refreshes.

> It is also likely that userspace will want to use different waveforms at
> the same time for different parts of the screen, for example a fast
> monochrome waveform for the drawing area of a note-taking app, but a
> grayscale waveform for surrounding UI and window manager.
> 

> I believe the i.MX6 EPDC supports multiple planes, each with their own
> waveform choice. That seems like a good abstraction, but the EBC only
> supports one plane in hardware. So using this abstraction with the EBC
> would require blending pixels and doing waveform lookups in software.
> 
The iMX6 EPDC has one working buffer containing the old+new state of
the pixel. That is 16bpp. Then for each update you can specify a
rectangle in an independant 8bpp buffer as a source. For now I am just
using a single buffer. But yes, that construction could be used to do
some multi plane stuff.

> Blitting/Blending in Software
> =============================
> There are multiple layers to this topic (pun slightly intended):
>  1) Today's userspace does not expect a grayscale framebuffer.
>     Currently, the driver advertises XRGB8888 and converts to Y4
>     in software. This seems to match other drivers (e.g. repaper).
> 
>  2) Ignoring what userspace "wants", the closest existing format is
>     DRM_FORMAT_R8. Geert sent a series[4] adding DRM_FORMAT_R1 through
>     DRM_FORMAT_R4 (patch 9), which I believe are the "correct" formats
>     to use.
>
hmm R=red? That sounds strange. I am unsure whether doing things with
lower bit depths actually really helps. 

>  3) The RK356x SoCs have an "RGA" hardware block that can do the
>     RGB-to-grayscale conversion, and also RGB-to-dithered-monochrome
>     which is needed for animation/video. Currently this is exposed with
>     a V4L2 platform driver. Can this be inserted into the pipeline in a
>     way that is transparent to userspace? Or must some userspace library
>     be responsible for setting up the RGA => EBC pipeline?

hmm, we have other drivers with some hardware block doing rotation, but
in that cases it is not exposed as v4l2 mem2mem device.

On IMX6 there is also the PXP doing RGB-to-grayscale and rotation but
exposed as v4l2 device. But it can also be used to do undocumented
stuff writing to the 16bpp working buffer. So basically it is similar.
But I would do thoso things in a second step and just have the basic
stuff upstreamed

Regards,
Andreas

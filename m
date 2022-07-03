Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A74565AED
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D1D10E749;
	Mon,  4 Jul 2022 16:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C9010E02A
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 06:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=vxP0cGw3hHh8TfpWoKjeipnz7SqgYobDoDSTvlK7xfI=;
 b=BdYzAY7AndzrdqXiZrVmQ+K3Y+sJHfZ71LyfcIm95V83WcdXusc6jj3tVIp+LwGtablMQ3VIE6tMF
 laGLsSRfgztZj/KABU97clWyFT5lNp5Oy/EbAUPcHNQC14gqrjyeZ+/PRnBsYipc1qalyo+x7mehkd
 PjIGQ80L6+lMug8l33Jk2SaE/r3MD3eeZRRJaxf4xLgd0hbY2GYHHduvanzjNfvfkPneuI52AFweNj
 IZELEobn/pWDWqOaOQbTnu/m7Yk2aM3GoxH7Al/A1Vj5YMEfsWFdgpnWXV9pAEYvy4iIlvMWFdGjcl
 gJhBk2ODXhFdTTS6amjCQl7RihyIDAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=vxP0cGw3hHh8TfpWoKjeipnz7SqgYobDoDSTvlK7xfI=;
 b=QJPUfLbpvJmfb1Na9QQPmRMMP/16yIZVld0HfuL7gtHH7x14JBK1p/OoSeWTcK3R1SErQxvhLBSPp
 xZMyBDXDg==
X-HalOne-Cookie: 62bbb06fc9a29970a031891bb17428932ea70f5a
X-HalOne-ID: 787f57d8-fa9b-11ec-a917-d0431ea8a290
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 787f57d8-fa9b-11ec-a917-d0431ea8a290;
 Sun, 03 Jul 2022 06:43:39 +0000 (UTC)
Date: Sun, 3 Jul 2022 08:43:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Use the highest possible DMA burst size
Message-ID: <YsE6mZanHLy9LpBd@ravnborg.org>
References: <20220702230727.66704-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220702230727.66704-1-paul@crapouillou.net>
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
Cc: David Airlie <airlied@linux.ie>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, list@opendingux.net,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

On Sun, Jul 03, 2022 at 12:07:27AM +0100, Paul Cercueil wrote:
> Until now, when running at the maximum resolution of 1280x720 at 32bpp
> on the JZ4770 SoC the output was garbled, the X/Y position of the
> top-left corner of the framebuffer warping to a random position with
> the whole image being offset accordingly, every time a new frame was
> being submitted.
> 
> This problem can be eliminated by using a bigger burst size for the DMA.

Are there any alignment constraints of the framebuffer that depends on
the burst size? I am hit by this with some atmel IP - which is why I
ask.

Patch looks good and is a-b.

> 
> Set in each soc_info structure the maximum burst size supported by the
> corresponding SoC, and use it in the driver.
> 
> Set the new value using regmap_update_bits() instead of
> regmap_set_bits(), since we do want to override the old value of the
> burst size. (Note that regmap_set_bits() wasn't really valid before for
> the same reason, but it never seemed to be a problem).
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 90b86fcc47b4 ("DRM: Add KMS driver for the Ingenic JZ47xx SoCs")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

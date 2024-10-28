Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2F79B38F8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 19:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB0710E35E;
	Mon, 28 Oct 2024 18:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nDF74+/0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0359410E35E
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 18:19:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E565B1C0004;
 Mon, 28 Oct 2024 18:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730139591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b/kO4kEXCHHF3kJ5Bu3ijehycRJX0SWC+3a8OLL3WQ8=;
 b=nDF74+/0gi1F49A5sbYDgWy8Q/KuHjQwDnQsNkE7mBITemNslObdEXWgXlD603+Umh48Hs
 glP6DmvnjHLdFFfyPigYgyFHxGMgE9kLTFW2i8oqrqEXae+CE6kLfsNOXECLKzWnHJwfrM
 92hl2sMAfXuzi8qH9foB+qhB1RGT8MDTu0WdjcErJKWbFwz6zDqLTpIpZxfvUyNsn/2BlG
 qJNBBqbNfr1DqiYuu+biLD218A4EsBrOmJEVl5nhFhPLRKZgwlu9dhXVUeQ3y3iqSHW7IU
 6W1OSHfOi836/w0GQ2M2RUKLCWk5K2slZqPiV7aJ9e+WV6AD92Mby8dq4TvL3g==
Date: Mon, 28 Oct 2024 19:19:48 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Walle <mwalle@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <20241028191948.5fd1bd6d@bootlin.com>
In-Reply-To: <c9c5064e-e780-4bfe-b85d-7930df7a5443@denx.de>
References: <20241024095539.1637280-1-herve.codina@bootlin.com>
 <20241024095539.1637280-3-herve.codina@bootlin.com>
 <78a09625-6bad-4fda-8ee5-92b8dd0de381@denx.de>
 <20241028090220.1fd803ff@bootlin.com>
 <16edb769-a608-4b6a-9391-a63a69df8c8d@denx.de>
 <20241028145259.5d520445@bootlin.com>
 <c9c5064e-e780-4bfe-b85d-7930df7a5443@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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

On Mon, 28 Oct 2024 15:47:25 +0100
Marek Vasut <marex@denx.de> wrote:

> On 10/28/24 2:52 PM, Herve Codina wrote:
> > Hi Marek,  
> 
> Hi,
> 
> >>> On Sat, 26 Oct 2024 00:53:51 +0200
> >>> Marek Vasut <marex@denx.de> wrote:
> >>>      
> >>>> On 10/24/24 11:55 AM, Herve Codina wrote:  
> >>>>> In some cases observed during ESD tests, the TI SN65DSI83 cannot recover
> >>>>> from errors by itself. A full restart of the bridge is needed in those
> >>>>> cases to have the bridge output LVDS signals again.  
> >>>>
> >>>> I have seen the bridge being flaky sometimes, do you have any more
> >>>> details of what is going on when this irrecoverable error occurs ?  
> >>>
> >>> The panel attached to the bridge goes and stays black. That's the behavior.
> >>> A full reset brings the panel back displaying frames.  
> >> Is there some noticeable change in 0xe0/0xe1/0xe5 registers, esp. 0xe5,
> >> do they indicate the error occurred somehow ?  
> > 
> > 0xe5 register can signal any DSI errors (depending on when the ESD affects
> > the DSI bus) even PLL unlock bit was observed set but we didn't see any
> > relationship between the bits set in 0xe5 register and the recoverable or
> > unrecoverable behavior.
> > 
> > Also, in some cases, reading the register was not even possible (i2c
> > transaction nacked).  
> Oh, wow, I haven't seen that one before. But this is really useful 
> information, can you please add it into the commit message for V2 ?

Yes, I will add this information in v2.

Best regards,
Hervé


-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

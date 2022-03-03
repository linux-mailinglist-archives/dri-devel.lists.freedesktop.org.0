Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AF74CC398
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 18:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8768A10EC60;
	Thu,  3 Mar 2022 17:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D4F10EC6C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 17:21:05 +0000 (UTC)
Date: Thu, 03 Mar 2022 17:20:51 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [Letux-kernel] [PATCH v16 1/4] drm/bridge: dw-hdmi: introduce
 dw_hdmi_enable_poll()
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <RUI68R.Z009SPJAAD8N1@crapouillou.net>
In-Reply-To: <ABC1BD09-383B-4499-B034-340CE88725B3@goldelico.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <e54838849f80454b863f9f5634dd10f79ef7bb8f.1645895582.git.hns@goldelico.com>
 <983e9064-17ad-e646-f37d-ca9173ba0967@baylibre.com>
 <C8AE9A7A-E288-4637-ACAD-40CD33CD5F8C@goldelico.com>
 <3E620AF4-402E-45EA-9D92-92EAEA9647F5@goldelico.com>
 <SHH68R.Z3J9KSY0GQVA2@crapouillou.net>
 <ABC1BD09-383B-4499-B034-340CE88725B3@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
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
Cc: Paul Boddie <paul@boddie.org.uk>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-mips <linux-mips@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

[snip]

>>  Well he said "the Ingenic DRM core" aka ingenic-drm-drv.c. You do 
>> have access to the main drm_device in the ingenic_drm_bind() 
>> function, so you can add it there (with a cleanup function calling 
>> drm_kms_helper_poll_fini() registered with 
>> drmm_add_action_or_reset()).
> 
> Well, do you really want to mix HPD detection between connector, 
> Synopsys bridge and Ingenic DRM core? These are independent...
> Or should be accessed only through the bridge chain pointers.
> 
> IMHO we should keep separate functions separate.

The drm_kms_helper_poll_init() just says "this DRM device may have 
connectors that need to be polled" so it very well fits inside the main 
driver, IMHO.

-Paul

> 
> And maybe this should also be conditional? Maybe not depend on 
> compatible = jz4780 but compatible = ci20?
> 
> Looks to me to be a quick fix in the wrong place.
> 
> Let's fix the CSC issue first.
> 
> BR,
> Nikolaus
> 



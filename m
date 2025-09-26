Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5812BBA4AC1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 18:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D859A10EAB3;
	Fri, 26 Sep 2025 16:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YUmd4+fr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01F210EAAC
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 16:37:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9BC584E40E10;
 Fri, 26 Sep 2025 16:37:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5BEB2606B5;
 Fri, 26 Sep 2025 16:37:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1B7C7102F1829; 
 Fri, 26 Sep 2025 18:37:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758904647; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=T1eiJCTJ6hVPTGuj8KbihOiPvUVNoT41QjPfSexdEuU=;
 b=YUmd4+frzkFLYYweqAUp2rj0oGFqAqrP8nWBzvm27hW7BqWCWt+iOFK2tV/G6RUgx08OKK
 7BAOPGoAgleRRoRfLEk2wtw7lGTsm7UMjBJXcIkddxIZcylMThwhFGYak0OvEhUdBzXBtI
 xaftiTFrwD2CeJJbtR+FUdX7knjxHIiMVST0PEhsJiVAsKqhu4pWChqCZZ5EmTuk75A0XA
 cHFJ6713SmhoUOzsT17ZRlUrtfpT0xB16M+A+b9JRskpll2wvI7ela5hB8vQF4AlHymeGE
 wf7Q3b/AQGXb+8jaUtypT9NDvQYFmClTzCFDCL4qbjAzahvxruzHytFeDbE0sw==
Date: Fri, 26 Sep 2025 18:37:22 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: protect device resources
 on unplug
Message-ID: <20250926183722.0f449251@booty>
In-Reply-To: <20250915165156.35378299@booty>
References: <20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com>
 <20250808-drm-bridge-atomic-vs-remove-v1-2-a52e933b08a8@bootlin.com>
 <l2orbpdoh3cqqgqudbnbdlogo3bd57uu4nv3ax74uoahknzjgr@gbxxuky3huw6>
 <20250820131302.6a2da5ef@booty>
 <20250827-charming-arcane-stingray-cfb8b6@houat>
 <20250908154906.16693078@booty>
 <20250910-glittering-serval-of-piety-b32844@houat>
 <20250910184752.6c42f004@booty>
 <20250915-benign-rare-marmot-9fbb96@penduick>
 <20250915165156.35378299@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Maxime,

On Mon, 15 Sep 2025 16:51:56 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> I'm going to send soon a v2 with my devres changes so we can continue
> this discussion on actual code.

v2 sent, with the devres changes. Discussion con continue there.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

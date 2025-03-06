Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D100EA54456
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 09:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E40810E916;
	Thu,  6 Mar 2025 08:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OAmb5Orx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6FC10E916
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 08:12:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF9BC442A4;
 Thu,  6 Mar 2025 08:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741248778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8EKlyOPXjkNZAG+QiNmAnCRyBkRUayYQjOTsTJ/8zU=;
 b=OAmb5OrxJqHbXkzQJk86hL/XvqDltPG4L41QY0wohsgUv6WMFdT3dW8BgiBTiGLZfY8PeA
 YrDQXB3Jlrw8vHAbkiqhwwdmeoRAxWsDGocfCEM1l++8vbw5Wyt91s5eBP7GSI+z3Axho2
 aij6fxN/EY0jsscgB5qFrRunZXsAXrYfa26h3BKGxvDSIbOtcXsXcTl7rLhawlXMEVb/+Q
 TvR7G4RJMy9oS359Ro+QJxXeTsx8Ejag3APkqFfAI5+fR+CcNJb8SmWanInbqeLE2VhoJp
 3y4A8JgBoCS25x7wb6A67NZ8FUliXyMaxgJG7wOB9yjUBy18rhQP7IyJdHmJ2w==
Date: Thu, 6 Mar 2025 09:12:56 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas
 Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v5 08/16] drm/bridge: Add helper to reset bridge pipeline
Message-ID: <20250306091256.2f0e2e86@bootlin.com>
In-Reply-To: <20250304-bridge-connector-v5-8-aacf461d2157@kernel.org>
References: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
 <20250304-bridge-connector-v5-8-aacf461d2157@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdejvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhiv
 ggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrgh
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

Hi Maxime,

On Tue, 04 Mar 2025 12:10:51 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> Let's provide an helper to make it easier for bridge drivers to
> power-cycle their bridge.
> 
> In order to avoid a circular dependency between that new helper and
> drm_atomic_helper_reset_crtc(), this new helper will be in a
> drm_bridge_helper.c file to follow the pattern we have for other
> objects.
> 
> Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/Makefile            |  1 +
>  drivers/gpu/drm/drm_bridge_helper.c | 55 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_bridge_helper.h     | 12 ++++++++
>  3 files changed, 68 insertions(+)
> 

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Also tested on my system using the ti-sn65dsi83 driver (updated in this series)
with faults manually generated on the hardware. No regressions were observed in
the driver recovery process. Works fine.

Tested-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019A5A89F41
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 15:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0075310E78C;
	Tue, 15 Apr 2025 13:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="JOm+tc7l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C8410E78C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 13:19:49 +0000 (UTC)
Message-ID: <8f72b42e-c38d-45fd-b04d-c2b48a809d0c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1744723187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZLSozCorBBEWbCogUwnoTzrWlqCaGFlvu0gweRfCrow=;
 b=JOm+tc7lz9LZ6iM6+e0XfHi2diggzB6r/LJPLb2Vt1uEcdtUrE69EkRmCJ+YcRCLDgnK1p
 kc7Pv9xnaosXzQdCamVpC6X4D9V2Pqk9tqVvrydTJqxWUv5SXOB7Zx2XlzHG1cfbLs5EiK
 oxafoQuowdcOlbUBj+8PkuwJAqTs3Ag=
Date: Tue, 15 Apr 2025 18:48:53 +0530
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: Re: [PATCH v3 09/17] drm/bridge: cdns-dsi: Drop checks that shouldn't
 be in .mode_valid()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jayesh Choudhary <j-choudhary@ti.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>,
 Devarsh Thakkar <devarsht@ti.com>
References: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
 <20250414-cdns-dsi-impro-v3-9-4e52551d4f07@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20250414-cdns-dsi-impro-v3-9-4e52551d4f07@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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


On 14/04/25 16:41, Tomi Valkeinen wrote:
> The docs say about mode_valid():
> 
> "it is not allowed to look at anything else but the passed-in mode, and
> validate it against configuration-invariant hardware constraints"
> 
> We're doing a lot more than just looking at the mode. The main issue
> here is that we're doing checks based on the pixel clock, before we know
> what the pixel clock from the crtc actually is.
> 
> So, drop the cdns_dsi_check_conf() call from .mode_valid().
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

--
Regards
Aradhya


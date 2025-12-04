Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FF7CA43E3
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 16:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4958210E201;
	Thu,  4 Dec 2025 15:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Muw99Q3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 556 seconds by postgrey-1.36 at gabe;
 Thu, 04 Dec 2025 15:25:33 UTC
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BC310E201
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 15:25:33 +0000 (UTC)
Message-ID: <369afee2-2ae9-4dee-ab0c-c9f196c8dbb1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1764861375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C1WFKmJAqdQOsrn5LBL7ihECviyJrkF8uPSQqPQKLmw=;
 b=Muw99Q3oLkmh1GuLJgjVocivZRtHEuRhrWoQoFNBg0w4a3Ls2dUzsY7oeA/sGkzfk9x3ql
 HrtQbATnA74HAQFpZw+uAFrZra1Kaj8/4p6+YtXR4BXBkjUMgBsT7oHR7gUXN/KZ47a8OP
 wwl5iU0UrWDxHndsG6QlPgaGmCldnBI=
Date: Thu, 4 Dec 2025 15:16:10 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/4] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
To: Linus Walleij <linusw@kernel.org>, Vicente Bergas <vicencb@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
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

Hi,


On 02/12/2025 21:02, Linus Walleij wrote:
> This fixes two regressions experienced in the MCDE and
> R-Car DU DRM drivers after
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused a series of regressions in all panels that send
> DSI commands in their .prepare() and .unprepare()
> callbacks.>
> This series make it possible to selectively bring back the
> old behaviour with explicit semantics and implements
> the old behaviour as modified commit tails in MCDE and
> R-Car DU.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Thank you for your patches, Linus. I am sorry multiple drivers had
regressed due the original patches.

I haven't been tracking the mailing lists actively past few weeks, and
only came across this when Laurent mentioned a patch from the v3 of this
series a couple days back in a discussion for the Rockchip drivers.

My email-id that is indeed used in all those conversations is long gone,
and I had hoped having the newer email-id in the sign-off-by tags would
make up for it. Perhaps that wasn't the case.


I am a little late, but I did give a look at the v6. I don't for-see any
concerns with it.


--
Regards
Aradhya



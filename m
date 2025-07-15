Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF34B0526C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5ABE10E0EB;
	Tue, 15 Jul 2025 07:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WF2ns62b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7470110E0EB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 07:09:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 30E1543993;
 Tue, 15 Jul 2025 07:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09BC7C4CEE3;
 Tue, 15 Jul 2025 07:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752563396;
 bh=Nvzui/TM7VJRjAiGp/4YnsBIzg9V4PsOmMn93z6Xg6I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WF2ns62bfzZeUmtFVTPHni6K9cHhWJhx4h4uUDXySVVtcDOrqLYNUKL/jH4LEj3Re
 Pzu/zosASsN0QPtUSs9UwhTXq3ZIsjt3HhEtaQF9SAt+OaUitHq9GPHWzVIzIn2hB2
 Z7Ms9zZo1FyuRJyfUdjIIYIZHXS0exUPz2extkM8HF4sFA3/C1c9UEZ5JeE4auuGOE
 fc+Sje2t6jjPriDMGQW5dnQckAUrDs3L+wUU90khEGBtHHnpNVUr8hi53xhyHld/PB
 LU0N20L7M9aH7PgCvspTs/TaqVpLgyGsEkNYXIzhh6AbVjl0NWtq3Uk9rlm5s6q3wE
 cSGEVo0swFZRA==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1ubZnT-000000007aQ-0aGV;
 Tue, 15 Jul 2025 09:09:51 +0200
Date: Tue, 15 Jul 2025 09:09:51 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi86: fix OF node leak
Message-ID: <aHX-vyOnb-gZmsi1@hovoldconsulting.com>
References: <20250708085124.15445-1-johan@kernel.org>
 <20250708085124.15445-3-johan@kernel.org>
 <CAD=FV=V1LN2Q2C9P9Ed3V+Uar_T2Sp--ssnf8H29R-N2Qz3uEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=V1LN2Q2C9P9Ed3V+Uar_T2Sp--ssnf8H29R-N2Qz3uEA@mail.gmail.com>
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

On Mon, Jul 14, 2025 at 11:46:12AM -0700, Doug Anderson wrote:
> On Tue, Jul 8, 2025 at 1:52 AM Johan Hovold <johan@kernel.org> wrote:

> > Make sure to drop the OF node reference taken when creating the bridge
> > device when the device is later released.
> >
> > Fixes: a1e3667a9835 ("drm/bridge: ti-sn65dsi86: Promote the AUX channel to its own sub-dev")
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> The patch doesn't apply to drm-misc-next, which has commit
> 6526b02e1020 ("drm/bridge: ti-sn65dsi86: use the auxiliary device").
> Seems like you need to resubmit as a patch to the new
> auxiliary_device_create() function?

I've already sent a fix for the generic implementation here:

	https://lore.kernel.org/lkml/20250708084654.15145-1-johan@kernel.org/

> Do you feel that this is urgent
> enough that we need a separate patch for stable?

No, we should be good then as I assume this bridge is typically
registered at boot and never deregistered (that's also why I left out
the stable tag).

Johan

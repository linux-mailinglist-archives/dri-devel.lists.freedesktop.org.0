Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFE991BCAC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 12:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A5D10E289;
	Fri, 28 Jun 2024 10:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="abAHHkQW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEE510E289
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 10:31:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4D191C000F;
 Fri, 28 Jun 2024 10:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1719570703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H4UhXaKGGiqWbE/y6PE/bVJrZS6D8ezkcI0nguMWpPo=;
 b=abAHHkQWCf3kaqf1WX05tIQ773iVUboRCxc9OugxgtCCF1ogI4wYrLO3SG3iC3C8tiS3NP
 4vLha43TsmdSL6b0zlan0elffXrzncmoXX3QBBf/fHEy5doIc8GE9RGN+KKWCTGNm9Khvz
 h1J2ypQWAooRnpigF+/+aY2uAzy4sUtQ7ah8S2CtbNohDG2mFqwCu3E99kw4SGad9kCTgQ
 HV4HEggYTeioJPsvD7X/fRHouGQsVEV1xcjYwvQVsTjPdjXwpGw0qmvslMFF3k1nC1a9H0
 G4WfXFy5oXFzvIDRrCWw0r1F0EtLF8wVE6eoCJrhGt/OSZ+X+Ge8SNSnCC4PjQ==
Date: Fri, 28 Jun 2024 12:31:40 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Herring
 <robh@kernel.org>
Subject: Re: [PATCH v2] drm/mipi-dsi: Add OF notifier handler
Message-ID: <20240628123140.5872fc6f@booty>
In-Reply-To: <20240627071904.4017160-1-wenst@chromium.org>
References: <20240627071904.4017160-1-wenst@chromium.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello Chen-Yu,

+Rob

On Thu, 27 Jun 2024 15:19:03 +0800
Chen-Yu Tsai <wenst@chromium.org> wrote:

> Add OF notifier handler needed for creating/destroying MIPI DSI devices
> according to dynamic runtime changes in the DT live tree. This code is
> enabled when CONFIG_OF_DYNAMIC is selected.
> 
> This is based on existing code for I2C and SPI subsystems.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Thanks for copying me on this patch. Could be useful for my
hotplug-bridge work, however I'm aiming at writing code that works also
for non-DSI so we'll see. The code looks pretty fine however.

My concern however is about the usage of an OF reconfig notifier. A few
days ago Rob Herring wrote:

> a notifier is never a great design so
> maybe we can come up with something better

(https://lore.kernel.org/all/CAL_Jsq+=mGEJXsjq1UZFMJtHko_z+doiFMXnx9K7exDuznymSA@mail.gmail.com)

So maybe this is something you can clarify with him.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

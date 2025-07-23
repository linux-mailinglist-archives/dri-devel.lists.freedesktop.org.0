Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4350EB0F704
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 17:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1AC10E7F6;
	Wed, 23 Jul 2025 15:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="Qu6aQ8jd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EF710E193
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 15:29:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753284551; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=XRtulgxgQtjCSgT8DD64R1R0tydqvcpKjitZFNrZaE7SiTelJybBZ8+mq47N7MsBpzeLQvEJAVMU4+PPSW8HdbkN8Sd4TaXMAisblYbxndPRGvhMW3o5PzcpkLW0M8zJNqxNCQPM/+GFgu2tFSNLJbLazenHRQNgodNPcANEdX4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753284551;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=p1mGR8RrETsRU+pbOh6xvnBmADrKnol8mLncWhNqDJQ=; 
 b=jKBUZyW67QgODDAqPhyEbkag/COEC4vUmGJcJ9vQny4fea7GdZ3colZc2jyS9VLh/xuznbeu4IDXsknEWRuIiikepXMBjMXI4BldpF1cg0BxLOD5Z0OuJkuDR2sWAhrATBMhalwo0EA5wT/L3sZlZmO128bdHdb3EcaprYTVyvs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
 dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753284551; 
 s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=p1mGR8RrETsRU+pbOh6xvnBmADrKnol8mLncWhNqDJQ=;
 b=Qu6aQ8jdjF8N8nxtXSZMDjdtk5wkI6HZkXVap3gYJWE99ERRUx7eyXgm1a7Ugp8v
 56KOyX1KqBr9BR+46aQQ+2rSEpIwIeZFDNRqErIkW2FGqM3HnVxXqX+6Tlj9RU41Ahp
 NpHkxMKiddIAhGknPdVcQ+2MWBZYaJI8OkKOUVw0=
Received: by mx.zohomail.com with SMTPS id 1753284550006678.199939611792;
 Wed, 23 Jul 2025 08:29:10 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Raag Jadav <raag.jadav@intel.com>, dri-devel@lists.freedesktop.org,
 linux-sound@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v2 2/3] ASoC: hdac_hdmi: Use dev_info on invalid ELD
 version
Date: Wed, 23 Jul 2025 11:29:07 -0400
Message-ID: <1927750.tdWV9SEqCh@earth>
In-Reply-To: <b209b185-8caa-41d4-8f8d-95aefec1d785@sirena.org.uk>
References: <20250722195437.1347865-1-detlev.casanova@collabora.com>
 <20250722195437.1347865-3-detlev.casanova@collabora.com>
 <b209b185-8caa-41d4-8f8d-95aefec1d785@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
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

Hi Mark,
On Wednesday, 23 July 2025 06:40:13 EDT Mark Brown wrote:
> On Tue, Jul 22, 2025 at 03:54:36PM -0400, Detlev Casanova wrote:
> > When disconnected, the ELD data cannot be read by the display driver, so
> > it just sets the data to 0.
> 
> Please don't put patches for different subsystems into the same series
> if there's no dependencies, it just makes dependencies less obvious and
> creates hassle merging things.

Yes, sorry, I'll send v3 of this patch separately.

> > That makes the ELD parsing code read an ELD version of 0, which is
> > invalid. In hdac_hdmi, that is logged with dev_err(), but should be
> > logged with dev_info() instead as it is done in sound/core/pcm_drm_eld.c
> > 
> > This avoids printing multiple messages like:
> >     HDMI: Unknown ELD version 0
> > 
> > in the kernel log when userspace tries to open the sound device.
> 
> It doesn't, it just lowers the severity of the logs that are printed.
> If the goal is to lower the number of messages printed you need to use
> a ratelimited print.

I see, ratelimited would be good, but it still prints a message about 
something that is normal behaviour. Maybe this should go further to a 
dev_dbg(), or is there a specific reason to show this message ?

This could also be a special case:
 - version == 0 -> dev_dbg()
 - version !=0 && != known_versions -> dev_err()

Detlev.



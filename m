Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD21FBB6253
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 09:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CCA10E8CE;
	Fri,  3 Oct 2025 07:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pFMvjqIT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D754C10E8CE
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 07:11:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D664CC00D8D;
 Fri,  3 Oct 2025 07:11:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C30EA606EB;
 Fri,  3 Oct 2025 07:11:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CB78C102F1C04; 
 Fri,  3 Oct 2025 09:11:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759475478; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GBWWiR//EQGy7wU3r/D2KO4EkutCKxZsEaDltcQpM4g=;
 b=pFMvjqITUMPW427SBAfWge/eWzYs7aqJJgZBofTJyUd5r+r4JYbTvYNlq05gcaK+2Jktby
 UwAf27c5upeCs+eyQi8Oz8jEionMsV+tAQNpj321jvP7YcZqW403A5NF9uQ3eE6xTTwQy0
 AXSfCTQm97VRW9QJsDGjU0VbunCTHG/lajEZ4kFq7yAH6luhIoKpwpTWdwPGPn3+zWHv4h
 nDra7NgnJu3LEg9rQQMuDOqy4K271eKw+anm/rvKJpDCNX7I0EHUZacsiW41dPbBEMkYJy
 YvKIqHNd5OReDg2mmEWQM5cn9weV/sHmM568shRdg4ixDLlRAzlUHOJJGZD/Lg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250924-b4-drm-bridge-alloc-getput-drm_atomic_bridge_chain_select_bus_fmts-v1-1-f8c2efdb783f@bootlin.com>
References: <20250924-b4-drm-bridge-alloc-getput-drm_atomic_bridge_chain_select_bus_fmts-v1-1-f8c2efdb783f@bootlin.com>
Subject: Re: [PATCH] drm/bridge: refcount last_bridge in
 drm_atomic_bridge_chain_select_bus_fmts()
Message-Id: <175947547459.489455.4866603213884120000.b4-ty@bootlin.com>
Date: Fri, 03 Oct 2025 09:11:14 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Wed, 24 Sep 2025 17:11:01 +0200, Luca Ceresoli wrote:
> Get a reference for the last_bridge when it is obtained and release it
> using a cleanup action.
> 
> 

Applied, thanks!

[1/1] drm/bridge: refcount last_bridge in drm_atomic_bridge_chain_select_bus_fmts()
      commit: 0f2efbe6d8305b91c9b2c92ebaf8c24a614bc305

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


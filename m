Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604ABCB6340
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 15:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE8210E2E5;
	Thu, 11 Dec 2025 14:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SQL0VVIU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F2B10E2E5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 14:35:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DAED2C19342;
 Thu, 11 Dec 2025 14:34:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DD46C6068C;
 Thu, 11 Dec 2025 14:35:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A0390103C8C93; Thu, 11 Dec 2025 15:35:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765463719; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=iDA+A0ovH3m6IMjM9osaCpupthizmxnW5vOnHPPGajo=;
 b=SQL0VVIU4hl+yBcR14nH8sGSclcE3hTA1BFAhQARPX1aReSoDtQkAyiw6s2wjthvKfY7u+
 7W/9BZMe5VMUi/ETQfZCwJZDLlWyWI7BjD8zQgG5KBDWeyjphc8kx9RBj14XNtlDqPNF2E
 QtNEq/LsOwuhmjYv24lip0+EfGBPSWtYxf3TVgON9MgzVsX+IKWKDfXelYJbrvN5ab1XfD
 vqYvINo37KZcKvlRfJ2Zd7nDpE+DLK4Wyrthi5JHecjjRt7Lv5UTgB8t9kAgbbhhA1p8ct
 Dxe2NypAFIj1fPwKjbkg4Hrz2iv/y4BYiNJrBY10/RPF43dLOs3hBenkRyp0SA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20251112-drm-bridge-atomic-vs-remove-v3-0-85db717ce094@bootlin.com>
References: <20251112-drm-bridge-atomic-vs-remove-v3-0-85db717ce094@bootlin.com>
Subject: Re: [PATCH v3 0/2] drm/bridge: handle gracefully atomic updates
 during bridge removal
Message-Id: <176546371453.266527.15671825201183233856.b4-ty@bootlin.com>
Date: Thu, 11 Dec 2025 15:35:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
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


On Wed, 12 Nov 2025 17:34:33 +0100, Luca Ceresoli wrote:
> This is a first attempt at gracefully handling the case of atomic updates
> happening concurrently to physical removal of DRM bridges.
> 
> This is part of the work to support hotplug of DRM bridges. The grand plan
> was discussed in [1].
> 
> Here's the work breakdown (➜ marks the current series):
> 
> [...]

Applied, thanks!

[1/2] drm/bridge: add drm_bridge_unplug() and drm_bridge_enter/exit()
      commit: d36137085a4aa2d2f039359a0d67d9e07667f2de
[2/2] drm/bridge: ti-sn65dsi83: protect device resources on unplug
      commit: d2e8d1bc840b849fc23d8812995645cc79990e7b

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


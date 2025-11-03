Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A813C2B849
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 12:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA7710E3BE;
	Mon,  3 Nov 2025 11:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FbvePhAA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C4810E3BE
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 11:52:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 86532C0D7A9;
 Mon,  3 Nov 2025 11:52:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 49AB260628;
 Mon,  3 Nov 2025 11:52:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F0E6410B5005F; Mon,  3 Nov 2025 12:52:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762170746; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=nxLsgXaX3S7Wf96NrKXVV0SE7yKYs5dnel8d4jei4WI=;
 b=FbvePhAAaYxdeRQVSnYhE7UWK6DoHCvGymwxDkiWTU0lpiuIg60oBggkuzXgey7qynUvxV
 RVVN7od4+LESxZ02FMEkv24OswzAkrfIL4PAsYgUoQdeWsc0Fcxrz/ekicDsUpquTUzoCs
 TlIbS1pTmMSvdZ7PyQdGtnwVNqGPxvMUf+VIUgjJcbLLay9pteEAiA1gliQU7IrRAz0tiO
 AGp4tX/2t+7JfAz2TFqtQy1I+MQGGOh+Ofm3rTjiI/82hBTvajaxhet3JAHMoDWPdIeaX9
 jSP8Lz2hG5JhyuWRuU64gFZU8L1ikExIWOfYbOff83S6r+4rMYh0ygX48w3Ybw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
References: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
Subject: Re: [PATCH v2 0/3] drm/display: bridge_connector: get/put the
 stored bridges: fix NULL pointer regression
Message-Id: <176217074003.78559.5719838860402143983.b4-ty@bootlin.com>
Date: Mon, 03 Nov 2025 12:52:20 +0100
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


On Fri, 17 Oct 2025 18:15:03 +0200, Luca Ceresoli wrote:
> A patch of mine recently merged in drm-misc-next [1] has a NULL pointer
> deref regression (reported here [2] and here [3]). Being in lack of a quick
> fix, I sent a revert proposal [4].
> 
> The revert proposal has no answers currenty, and in the meanwhile I have a
> patch that implements the original idea but without the same bug. So here's
> a v2 series with:
> 
> [...]

Applied, thanks!

[1/3] Revert "drm/display: bridge_connector: get/put the stored bridges"
      commit: b4027536933f813e51cc53be0b7542012f09aa38
[2/3] drm/display: bridge_connector: get/put the stored bridges
      commit: 13adb8c97846603efc7bfc7663dfdc0ba2f34b8f
[3/3] drm/display: bridge_connector: get/put the panel_bridge
      commit: a3f433c57c46776f95fdf4cfaad1ab27dbca7311

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


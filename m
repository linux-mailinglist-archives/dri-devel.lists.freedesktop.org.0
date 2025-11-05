Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD927C373BD
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 19:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B084810E0F5;
	Wed,  5 Nov 2025 18:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="O5/TgQxv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCA310E0F5
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 18:00:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 928791A18C5;
 Wed,  5 Nov 2025 18:00:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5114460693;
 Wed,  5 Nov 2025 18:00:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3AC3F10B50BBB; Wed,  5 Nov 2025 19:00:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762365615; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xP7Y8koYi9IHWBME2pD01BGWN60oH+3eeZKFFJBDguI=;
 b=O5/TgQxvbOZwMSLzDkfWNh/06f7nw7AFufES2OlcLyo+LXhav7H0gtouWCTedfTcOvNRVi
 01BTge6Ydlbt9mbzFt4n78mvqhMFFOz0x4RvOBjR5B3jYhxjtHMZ9FMR+vRGSDiXP4zXL/
 8gf/0LZXaXk+PbvQRmeQKi3QR/0XVzK+OMDs3Hylpji1e6sLs1spDW7byBkkVHBH0BAokb
 PNkP3WrE1ayorpDfQ07YcUbncyE5ylDRVSUF/4e7e2OhLryXPccy2CAByIYK4ej31VVm4N
 VeEambZXxQ7jTFPeoF4hc9qSkxH5lWYHb8PwoNgsIDZFSwi4Z1Y8AvVruK3+cg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Nov 2025 19:00:08 +0100
Message-Id: <DE0YGVJR925W.3HZY4SQ8B7UBQ@bootlin.com>
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "David Airlie"
 <airlied@gmail.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] drm/display: bridge_connector: Assign
 bridge_connector->bridge_hdmi_cec before drmm_connector_hdmi_cec_register()
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <20251103200316.172531-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251103200316.172531-1-marek.vasut+renesas@mailbox.org>
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

Hello Marek,

On Mon Nov 3, 2025 at 9:02 PM CET, Marek Vasut wrote:
> Set valid bridge_connector->bridge_hdmi_cec pointer before calling
> possibly calling drmm_connector_hdmi_cec_register(), because
> drmm_connector_hdmi_cec_register() directory calls
> drm_bridge_connector_hdmi_cec_funcs .init callback,
> which does access and use bridge_connector->bridge_hdmi_cec
> and expects a valid pointer there.
>
> Without this fix, on Renesas R-Car E3 R8A77990 , the system
> crashes on NULL pointer dereference.
>
> Fixes: 2be300f9a0b6 ("drm/display: bridge_connector: get/put the stored b=
ridges")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for the report!

A fix was committed to drm-misc-next last Monday. It's actually a revert of
the original patch followed by a correct implementation:

  b4027536933f  Revert "drm/display: bridge_connector: get/put the stored b=
ridges"
  13adb8c97846  drm/display: bridge_connector: get/put the stored bridges
  a3f433c57c46  drm/display: bridge_connector: get/put the panel_bridge

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

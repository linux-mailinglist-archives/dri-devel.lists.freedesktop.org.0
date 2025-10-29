Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF0AC1898A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 08:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6791A10E129;
	Wed, 29 Oct 2025 07:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=dwurp.de header.i=@dwurp.de header.b="XtMPyJig";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.dwurp.de (mail.dwurp.de [185.183.156.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A09F10E129
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 07:13:00 +0000 (UTC)
Message-ID: <33e255dc-64f9-4e4f-82eb-6f5e9c1d63d4@dwurp.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dwurp.de; s=mail;
 t=1761721977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omGzvBI9DSCb25E1jWi57SCRRWBg2xgmKwZX4A7/h2M=;
 b=XtMPyJigtJouJI4+RxS78xlgzCynGWtvf3MXaJ9lhBDKu/sOOizXajn1P4Vl/aL/eVOU8L
 yD7XAjPWzoylcF0JITiP0n9NkZbFXRBv9OreNL4orIDEXKgFZ+ZJmsPMCJvnOEiTfvOdoW
 4vUloSxkmy3MUis1vi7Qdj5DGa5mT1o=
Date: Wed, 29 Oct 2025 08:12:53 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/panel: kingdisplay-kd097d04: Disable EoTp
To: chf.fritz@googlemail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251028214045.1944956-1-dev@dwurp.de>
 <aeee5f47ef2842fde66bc66fc598ee4f007fc1c2.camel@googlemail.com>
Content-Language: en-US, de-DE
From: Sebastian Fleer <dev@dwurp.de>
In-Reply-To: <aeee5f47ef2842fde66bc66fc598ee4f007fc1c2.camel@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Christoph,

On 10/28/25 23:31, Christoph Fritz wrote:
 > Hi Sebastian
 >
 > On Tue, 2025-10-28 at 22:38 +0100, Sebastian Fleer wrote:
 >> Since commit d97e71e44937 ("drm/bridge: synopsys: dw-mipi-dsi: 
enable EoTp by
 >> default") panel output on an Acer Chromebook Tab 10 (google-dru) is 
corrupted.
 >> The tablet I use is equipped with a kingdisplay-kd097d04 panel, 
disabling EoTp
 >> restores the correct functionality.
 >>
 >> Fixes: d97e71e44937 ("drm/bridge: synopsys: dw-mipi-dsi: enable EoTp 
by default")
 >
 > Just to clarify: This is not a fix for that commit, it is a fix for the
 > panel driver itself.
 >
 > EoTp is the default in Linux, a panel driver cannot enable it, only
 > disable it.
 >
 > Commit d97e71e44937 ("drm/bridge: synopsys: dw-mipi-dsi: enable EoTp by
 > default") fixed a bug in the synopsys dw-mipi-dsi because EoTp was not
 > enabled there by default.
 >
 > Enabling EoTp in dw-mipi-dsi revealed an underlying issue in panel-
 > kingdisplay-kd097d04.
 >
 > That same issue appears if one would connect this panel to a different
 > mipi-dsi core (because there EoTp is also enabled by default).
 >
thanks for your clarification. You're right, this change is merely a 
workaround for the kingdisplay panel.
However, I'm in favor of keeping the "Fixes:" line since using bisect, 
commit d97e71e44937 ("drm/bridge: synopsys: dw-mipi-dsi: enable EoTp by
default") is found as the first commit that shows distorted output for 
that panel.
But I can make the nature of the change more clear in the commit 
message. Would that be OK for you?

Best regards,
Sebastian

 >> Signed-off-by: Sebastian Fleer <dev@dwurp.de>
 >> ---
 >>   drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c | 2 +-
 >>   1 file changed, 1 insertion(+), 1 deletion(-)
 >>
 >> diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c 
b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
 >> index 2fc7b0779b37..893af9b16756 100644
 >> --- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
 >> +++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
 >> @@ -359,7 +359,7 @@ static int kingdisplay_panel_probe(struct 
mipi_dsi_device *dsi)
 >>   	dsi->lanes = 4;
 >>   	dsi->format = MIPI_DSI_FMT_RGB888;
 >>   	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 >> -			  MIPI_DSI_MODE_LPM;
 >> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
 >>
 >>   	kingdisplay = devm_drm_panel_alloc(&dsi->dev, 
__typeof(*kingdisplay), base,
 >>   					   &kingdisplay_panel_funcs,

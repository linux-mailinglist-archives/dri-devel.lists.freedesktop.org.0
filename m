Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4918FC1624A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3648710E624;
	Tue, 28 Oct 2025 17:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CN1ejqL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782F110E625
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:29:00 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C85EE77;
 Tue, 28 Oct 2025 18:27:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1761672430;
 bh=kvCaVxU1ELq1lPUuwkUP04tYtGpS5sdCXONZfIGMmCI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CN1ejqL13IPGxh4mjjRRw44+4531n7VBYtCO1ErJMxulfL2GAlBRym02qBaHB+nc0
 YlzMwTWETUWejYWYrj2Ou45lh93O2X0KWAgD+uRw14yrsNzv1/wEgmrEA0F/zkY5TO
 Si2U39gMIET0Is4R+KMxHBgnQ0jBTGEhENjzCMjs=
Message-ID: <bff68fb9-d826-4d5e-8896-13cc62d40093@ideasonboard.com>
Date: Tue, 28 Oct 2025 19:28:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] drm/rcar-du: dsi: Convert register bits to
 BIT()/GENMASK() macros
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 05/10/2025 06:02, Marek Vasut wrote:
> Convert register bits to BIT() macro and bitfields to GENMASK()/FIELD_PREP() macros.
> Most of this patchset is boring mechanical conversion.
> 
> Noteworthy patches are 6 and 7 , those introduce handling of DSI mode flags
> and convert use of DRM_MODE_FLAG_P.SYNC into DRM_MODE_FLAG_N.SYNC, but that
> should not have any adverse effect on existing hardware.

After the few minor comments I sent resolved, for the series:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

 Tomi


> Marek Vasut (11):
>   drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
>   drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as bitfield
>   drm/rcar-du: dsi: Document PHTR TESTDOUT as bitfield
>   drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
>   drm/rcar-du: dsi: Clean up VCLKSET register macros
>   drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
>   drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
>   drm/rcar-du: dsi: Respect DSI mode flags
>   drm/rcar-du: dsi: Clean up handling of DRM mode flags
>   drm/rcar-du: dsi: Convert register bits to BIT() macro
>   drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
> 
>  .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   |  50 ++-
>  .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 387 +++++++++---------
>  2 files changed, 237 insertions(+), 200 deletions(-)
> 
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> 


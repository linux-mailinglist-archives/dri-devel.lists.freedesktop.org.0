Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37786C0E224
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8247010E16B;
	Mon, 27 Oct 2025 13:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ojxWCtje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AB810E16B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:45:38 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cwFBl1FbMz9stG;
 Mon, 27 Oct 2025 14:45:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761572735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BnB21FDiwxmVcyKyiTqv1p4dgJtK06tH8IXDXJKcNbc=;
 b=ojxWCtjeIWSwCsxtp3H318kobeaHbB3qtciVrqHeFsWcYY4bsMiJARvSkLRHQgLjAx/HdX
 D4k9MgsLuD4kc81TXybRsvYu/ITfDKmsad/7VCdb+60DWL65gqWE4S+7r4j3cEqZaDtAtf
 uAryfWhx97Hbe9yLTQ5WdL9feFmoYAXvTAbEjo3mBV1k35m9e/qsrx4xSRc/O0i5jvWeMy
 r131ei0P2sj1jEw/jkpxe3CKskYMQecvyPSvek7htctvwnlX6ShSYP92KcvqWYtdMOnv8+
 lB7INreFeFvgUOd8nV9VCxbMCeqAcyVZIGH1iCNCq8cOFUTLPHl7c46LwOnJiw==
Message-ID: <59645a9a-69f3-4a81-8983-1594956958ea@mailbox.org>
Date: Mon, 27 Oct 2025 14:45:30 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v3 00/11] drm/rcar-du: dsi: Convert register bits to
 BIT()/GENMASK() macros
To: dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 3cfnicdoe113ynxgenp1tw58wqeu4ww3
X-MBO-RS-ID: 6bf091ff043e94b4015
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

On 10/5/25 5:02 AM, Marek Vasut wrote:
> Convert register bits to BIT() macro and bitfields to GENMASK()/FIELD_PREP() macros.
> Most of this patchset is boring mechanical conversion.
> 
> Noteworthy patches are 6 and 7 , those introduce handling of DSI mode flags
> and convert use of DRM_MODE_FLAG_P.SYNC into DRM_MODE_FLAG_N.SYNC, but that
> should not have any adverse effect on existing hardware.
> 
> Marek Vasut (11):
>    drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
>    drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as bitfield
>    drm/rcar-du: dsi: Document PHTR TESTDOUT as bitfield
>    drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
>    drm/rcar-du: dsi: Clean up VCLKSET register macros
>    drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
>    drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
>    drm/rcar-du: dsi: Respect DSI mode flags
>    drm/rcar-du: dsi: Clean up handling of DRM mode flags
>    drm/rcar-du: dsi: Convert register bits to BIT() macro
>    drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
> 
>   .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   |  50 ++-
>   .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 387 +++++++++---------
>   2 files changed, 237 insertions(+), 200 deletions(-)
How can we proceed with this series ?

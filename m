Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C820B3DE1B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 11:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABB510E3EA;
	Mon,  1 Sep 2025 09:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o0Dm4phU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4B510E3EA
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 09:22:58 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05167EFE;
 Mon,  1 Sep 2025 11:21:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1756718509;
 bh=inHRaS4Kg5KmM8x2x1WVTksGZ37CfV4NG8BOkOKDvC4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=o0Dm4phUp+R3cxtxsrWrEoOL97EwFPH2RUt4L1B7oo4QhScvIJJuiT++F3xtf2FuZ
 3VmKk3COtouhjK/V3fkKJbQ3Hld3SW7rHc8XNOcyNOmlQ8NdCff1SMoNBHnl71eVDg
 qWDx9M6YMkhdPxZfaNXr3ApnQxksqesrqa/7qf24=
Message-ID: <e03c3fcb-7392-4ddc-80f1-8c104cd04e3c@ideasonboard.com>
Date: Mon, 1 Sep 2025 12:22:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/rcar-du: dsi: Fix 1/2/3 lane support
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20250813210840.97621-1-marek.vasut+renesas@mailbox.org>
 <d1354951-cbd3-4216-970b-e1e130f58522@ideasonboard.com>
 <fa0d9882-aadd-49e4-8a39-e0d0c321ecc1@mailbox.org>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <fa0d9882-aadd-49e4-8a39-e0d0c321ecc1@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 31/08/2025 20:01, Marek Vasut wrote:
> On 8/14/25 7:54 AM, Tomi Valkeinen wrote:
> 
> Hello Tomi,
> 
>> On 14/08/2025 00:08, Marek Vasut wrote:
>>> Remove fixed PPI lane count setup. The R-Car DSI host is capable
>>> of operating in 1..4 DSI lane mode. Remove the hard-coded 4-lane
>>> configuration from PPI register settings and instead configure
>>> the PPI lane count according to lane count information already
>>> obtained by this driver instance.
>>>
>>> Configure TXSETR register to match PPI lane count. The R-Car V4H
>>> Reference Manual R19UH0186EJ0121 Rev.1.21 section 67.2.2.3 Tx Set
>>> Register (TXSETR), field LANECNT description indicates that the
>>> TXSETR register LANECNT bitfield lane count must be configured
>>> such, that it matches lane count configuration in PPISETR register
>>> DLEN bitfield. Make sure the LANECNT and DLEN bitfields are
>>> configured to match.
>>>
>>> Fixes: 155358310f01 ("drm: rcar-du: Add R-Car DSI driver")
>>> Cc: <stable@vger.kernel.org>
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>> ---
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Magnus Damm <magnus.damm@gmail.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: linux-renesas-soc@vger.kernel.org
>>> ---
>>> V2: - Split this out of a series, update commit message, combine from
>>>        drm/rcar-du: dsi: Remove fixed PPI lane count setup
>>>        drm/rcar-du: dsi: Configure TXSETR register to match PPI lane
>>> count
>>>      - add Fixes tag, CC stable
>>> ---
>>>   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      | 5 ++++-
>>>   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 8 ++++----
>>>   2 files changed, 8 insertions(+), 5 deletions(-)
>>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Would you like to pick this up via drm-misc , or shall I ?

I'll push to drm-misc. Thanks!

 Tomi


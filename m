Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A374B3D485
	for <lists+dri-devel@lfdr.de>; Sun, 31 Aug 2025 19:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923B110E0DA;
	Sun, 31 Aug 2025 17:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="GOdAHYwx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5EF10E0DA
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 17:01:19 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cFJDq4xWZz9sQK;
 Sun, 31 Aug 2025 19:01:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1756659675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A7GEQBYNbyunVEo4I3Gbg8TbyHclBPj4LrGMEV9WsWw=;
 b=GOdAHYwx5DVYCNt6yIcPSCQgXsjMTlMQ716xIOS4auH+7sNDa7zmeg/DHUrPuGvQpU3GUO
 uE5KtO1hyeJ/j715yVwT471kLW2XUtP67Jss9NEjhpD5Bq3XyQPEeu72V8f59ohLB3kobz
 8bsgq1vXaRBynQ6wxIge0sB/GyzcaVo4gyhhdRytIr/JsAgPexUvixbW9JJb6Bb7bvji8R
 P3s037x09d6YW0cYkB258RuQyHzEPlYEDJKwp4bZxZAMUk+pk6WSgyvgMUxQQOrhDNmUz/
 aOeNb9GVZiIRwLO38JGC5SLDhhbb3dm9VnOBk1J8H6jyhWX1WhlwBmoSFGanvA==
Message-ID: <fa0d9882-aadd-49e4-8a39-e0d0c321ecc1@mailbox.org>
Date: Sun, 31 Aug 2025 19:01:09 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/rcar-du: dsi: Fix 1/2/3 lane support
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <d1354951-cbd3-4216-970b-e1e130f58522@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 3c0f5edf151ecbf2bbb
X-MBO-RS-META: xcsbqa76psbanfbngsgahm7qji8s7z7d
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

On 8/14/25 7:54 AM, Tomi Valkeinen wrote:

Hello Tomi,

> On 14/08/2025 00:08, Marek Vasut wrote:
>> Remove fixed PPI lane count setup. The R-Car DSI host is capable
>> of operating in 1..4 DSI lane mode. Remove the hard-coded 4-lane
>> configuration from PPI register settings and instead configure
>> the PPI lane count according to lane count information already
>> obtained by this driver instance.
>>
>> Configure TXSETR register to match PPI lane count. The R-Car V4H
>> Reference Manual R19UH0186EJ0121 Rev.1.21 section 67.2.2.3 Tx Set
>> Register (TXSETR), field LANECNT description indicates that the
>> TXSETR register LANECNT bitfield lane count must be configured
>> such, that it matches lane count configuration in PPISETR register
>> DLEN bitfield. Make sure the LANECNT and DLEN bitfields are
>> configured to match.
>>
>> Fixes: 155358310f01 ("drm: rcar-du: Add R-Car DSI driver")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Magnus Damm <magnus.damm@gmail.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>> V2: - Split this out of a series, update commit message, combine from
>>        drm/rcar-du: dsi: Remove fixed PPI lane count setup
>>        drm/rcar-du: dsi: Configure TXSETR register to match PPI lane count
>>      - add Fixes tag, CC stable
>> ---
>>   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      | 5 ++++-
>>   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 8 ++++----
>>   2 files changed, 8 insertions(+), 5 deletions(-)
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Would you like to pick this up via drm-misc , or shall I ?

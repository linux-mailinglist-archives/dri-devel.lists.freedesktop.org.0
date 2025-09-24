Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6763FB97D93
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 02:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4E810E66F;
	Wed, 24 Sep 2025 00:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="hXvGrFbX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACF610E66F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 00:13:03 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cWckM3wfFz9v1T;
 Wed, 24 Sep 2025 02:12:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758672779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RkwsfrWFijrTMkqrvyuobCGTWoBCwmeED3SJNQLA3xE=;
 b=hXvGrFbXzJlEEYtymgUy0Q5qwceghDt3oVCzViQ0bPvRSta2Y0J/YEx4lvyoCTGWbTyA6P
 OKl5IfSO8PCeBiLTHdWIwRjaP2gxeeKgicXsyG+qQgmqq5/AdrG7ejZkIycqhd8aBwWyYt
 ogsbNzemkad8vUfh3IHsxJPBiz46n2mQBJAfoNk0ojoa1rdNQsC5JW0zPxbGZfyHlZLuL5
 7yY0f6tUnmNRCku6/9KWpRq6Oj2pYBGpdK/X/FKIIgXWKR4php2grGVTTY++qIyvHobkij
 8LhgiMk8bPlARXjtHEkIob4qNBcJYPX8Weia5A3ioyUxT5LkSK1OXzutAtVO4g==
Message-ID: <e4e07d4d-2b9b-4ec5-a013-5415472b12b6@mailbox.org>
Date: Wed, 24 Sep 2025 02:12:56 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 7/9] drm/rcar-du: dsi: Clean up handling of DRM mode flags
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-8-marek.vasut+renesas@mailbox.org>
 <20250923132616.GH20765@pendragon.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250923132616.GH20765@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: zg17zs4tz9g9ko8oyroaodfsnus9cqbw
X-MBO-RS-ID: 97bbbd742b2de6ece61
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

On 9/23/25 3:26 PM, Laurent Pinchart wrote:
> Hi Marek,

Hello Laurent,

> On Mon, Sep 22, 2025 at 08:55:03PM +0200, Marek Vasut wrote:
>> Introduce TXVMVPRMSET0R_BPP_MASK macro and use FIELD_PREP() to generate
>> appropriate bitfield from mask and value without bitshift, assign this
>> value into vprmset0r. Remove TXVMVPRMSET0R_CSPC_RGB which is never used,
>> replace it with code comment next to TXVMVPRMSET0R_CSPC_YCbCr.
>>
>> Replace (mode->flags & DRM_MODE_FLAG_P.SYNC) test with inverted conditional
>> (mode->flags & DRM_MODE_FLAG_N.SYNC) and bitwise orr vprmset0r with either
> 
> I wonder if the DRM_MODE_FLAG_P[HV]SYNC flags are always the exact
> opposite of DRM_MODE_FLAG_N[HV]SYNC. It's probably fine to assume that
> here.

Maybe not _exact_ opposite.

DRM_MODE_FLAG_P[HV]SYNC set -- devices with HVsync pulse active high
DRM_MODE_FLAG_N[HV]SYNC set -- devices with HVsync pulse active low
Neither flag set -- devices without HVsync pulse, like DE panels or so
Both flags set -- invalid

> A quick grep showed one panel driver setting both the N and P
> flags (drivers/gpu/drm/panel/panel-sitronix-st7789v.c, see
> t28cp45tn89_mode, which I assume is a bug - Sebastian, could you check
> that ?).
This looks like a bug indeed. Also, the ST77xx are DSI-to-TCON chips, 
they directly drive the TFT matrix, I don't think they have a concept of 
sync signal polarity at all.

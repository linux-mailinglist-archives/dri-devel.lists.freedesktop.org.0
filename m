Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CDE7EAC14
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 09:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A0E10E1D3;
	Tue, 14 Nov 2023 08:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E8810E1D3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 08:52:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF0FE611B4;
 Tue, 14 Nov 2023 08:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FA5C433C7;
 Tue, 14 Nov 2023 08:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699951958;
 bh=/aqCliNQYdGzkivbC4gPQMVt1iUyLr2vVnNHe84oBRA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tF0m2bd2aUqfZ35D87SJauIEaKUrLiKUKu2xKc2BUKTTJBggWf/D/EggQFTCVos9L
 XTg/PQQssJ9DfXAm+DcxycLLgQNkV1RlYxifrIigNC7aOHzHFG8a3K4So52br/GRVs
 rUmk58vP6XGNDcy3/aykv7pqHnC1y2OZL3G8aAs5rXgwnnbGif+JnWwIRNXWi6PnEX
 KOdUMWgDEJosGQs1eVNa8tMQf5yneuquUzJCmnwpuBlDekLSRci0rbejzp56iWtQUr
 4coEzpzBSV/Zm3Psejgygz+fe38mExkZGVjrZzwc9YRD/N0PtMZrcjv17E3eCK35/E
 Y9/cht7Han8nQ==
MIME-Version: 1.0
Date: Tue, 14 Nov 2023 09:52:33 +0100
From: Michael Walle <mwalle@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
In-Reply-To: <4527280.LvFx2qVVIh@steina-w>
References: <20231113164344.1612602-1-mwalle@kernel.org>
 <4527280.LvFx2qVVIh@steina-w>
Message-ID: <acfd12b7966710172aa92fdf5f19a05c@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexander,

>> The FORCE_STOP_STATE bit is unsuitable to force the DSI link into 
>> LP-11
>> mode. It seems the bridge internally queues DSI packets and when the
>> FORCE_STOP_STATE bit is cleared, they are sent in close succession
>> without any useful timing (this also means that the DSI lanes won't go
>> into LP-11 mode). The length of this gibberish varies between 1ms and
>> 5ms. This sometimes breaks an attached bridge (TI SN65DSI84 in this
>> case). In our case, the bridge will fail in about 1 per 500 reboots.
>> 
>> The FORCE_STOP_STATE handling was introduced to have the DSI lanes in
>> LP-11 state during the .pre_enable phase. But as it turns out, none of
>> this is needed at all. Between samsung_dsim_init() and
>> samsung_dsim_set_display_enable() the lanes are already in LP-11 mode.
> 
> Apparently LP-11 is actually entered with the call to
> samsung_dsim_enable_lane(), but I don't know about other requisites on 
> that
> matter. Unfortunately documentation lacks a lot in that regard.

Which is called during samsung_dsim_atomic_pre_enable(). So I'm not sure
why the FORCE_STOP_STATE was needed at all. Lanes will be in LP-11 mode
if the video stream isn't enabled.

>> The code as it was before commit 20c827683de0 ("drm: bridge:
>> samsung-dsim: Fix init during host transfer") and 0c14d3130654 ("drm:
>> bridge: samsung-dsim: Fix i.MX8M enable flow to meet spec") was 
>> correct
>> in this regard.
>> 
>> This patch basically reverts both commits. It was tested on an i.MX8M
>> SoC with an SN65DSI84 bridge. The signals were probed and the DSI
>> packets were decoded during initialization and link start-up. After 
>> this
>> patch the first DSI packet on the link is a VSYNC packet and the 
>> timing
>> is correct.
> 
> At which point does SN65DSI84 require LP-11?

I guess I have the same requirement as Frieder (we use the same bridge).
According to the datasheet, the DSI data must be in LP-11 when releasing
EN. According to the init sequence:
  - asserting EN
  - configure CSRs
  - enable video stream

Although not, stated explicitly, LP-11 should also be active during CSR
writes.

But after all, the DSIM driver should adhere to the linux requirement,
which Frieder cited [1].

> You have access to a DSI/D-PHY analyzer?

A pretty fast oscilloscope with an DSI decoder. So we can analyze one 
DSI
lane.

>> Command mode between .pre_enable and .enable was also briefly tested 
>> by
>> a quick hack. There was no DSI link partner which would have 
>> responded,
>> but it was made sure the DSI packet was send on the link. As a side
>> note, the command mode seems to just work in HS mode. I couldn't find
>> that the bridge will handle commands in LP mode.
> 
> AFAIK ti-sn65dsi83.c only uses I2C for communication. Did you send DSI 
> read/
> writes instead?

Yeah the bridge only supports I2C. I just wanted to try that a DSI 
command
will still work after this patch. As a quick hack, I just added an
mipi_dsi_generic_write() to sn65dsi83_atomic_pre_enable() and made sure
there is a DSI write packet on the actual link.

-michael

> 
> best regards,
> Alexander
> 
>> Fixes: 20c827683de0 ("drm: bridge: samsung-dsim: Fix init during host
>> transfer") Fixes: 0c14d3130654 ("drm: bridge: samsung-dsim: Fix i.MX8M
>> enable flow to meet spec") Signed-off-by: Michael Walle 
>> <mwalle@kernel.org>
>> ---
>> Let me know wether this should be two commits each reverting one, but 
>> both
>> commits appeared first in kernel 6.5.
>> 

[1] 
https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation

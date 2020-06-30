Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494E72104B5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1CA6E830;
	Wed,  1 Jul 2020 07:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49936E287
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 14:34:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 7ACC42A4ED6
Subject: Re: [RESEND PATCH v4 0/7] Convert mtk-dsi to drm_bridge API and get
 EDID for ps8640 bridge
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200615203108.786083-1-enric.balletbo@collabora.com>
 <20200620213302.GC74146@ravnborg.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <593a4666-d6aa-7d16-f3a0-ba3713047d84@collabora.com>
Date: Tue, 30 Jun 2020 16:33:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200620213302.GC74146@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, drinkcat@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 linux-mediatek@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam, Chun-Kuan,

On 20/6/20 23:33, Sam Ravnborg wrote:
> Hi Enric
> 
> On Mon, Jun 15, 2020 at 10:31:01PM +0200, Enric Balletbo i Serra wrote:
>> (This resend is to fix some trivial conflicts due the merge window)
>>
>> The PS8640 dsi-to-eDP bridge driver is using the panel bridge API,
>> however, not all the components in the chain have been ported to the
>> drm_bridge API. Actually, when a panel is attached the default panel's mode
>> is used, but in some cases we can't get display up if mode getting from
>> eDP control EDID is not chosen.
>>
>> This series address that problem, first implements the .get_edid()
>> callback in the PS8640 driver (which is not used until the conversion is
>> done) and then, converts the Mediatek DSI driver to use the drm_bridge
>> API.
>>
>> As far as I know, we're the only users of the mediatek dsi driver in
>> mainline, so should be safe to switch to the new chain of drm_bridge API
>> unconditionally.
>>
>> The patches has been tested on a Acer Chromebook R13 (Elm) running a
>> Chrome OS userspace and checking that the valid EDID mode reported by
>> the bridge is selected.
>>
>> Changes in v4:
>> - Remove double call to drm_encoder_init(). (Chun-Kuang Hu)
>> - Cleanup the encoder in mtk_dsi_unbind(). (Chun-Kuang Hu)
>>
>> Changes in v3:
>> - Replace s/bridge/next bridge/ for comment. (Laurent Pinchart)
>> - Add the bridge.type. (Laurent Pinchart)
>> - Use next_bridge field to store the panel bridge. (Laurent Pinchart)
>> - Add the bridge.type field. (Laurent Pinchart)
>> - This patch requires https://lkml.org/lkml/2020/4/16/2080 to work
>>   properly.
>> - Move the bridge.type line to the patch that adds drm_bridge support. (Laurent Pinchart)
>>
>> Changes in v2:
>> - Do not set connector_type for panel here. (Sam Ravnborg)
>>
>> Enric Balletbo i Serra (7):
>>   drm/bridge: ps8640: Get the EDID from eDP control
>>   drm/bridge_connector: Set default status connected for eDP connectors
>>   drm/mediatek: mtk_dsi: Rename bridge to next_bridge
>>   drm/mediatek: mtk_dsi: Convert to bridge driver
>>   drm/mediatek: mtk_dsi: Use simple encoder
>>   drm/mediatek: mtk_dsi: Use the drm_panel_bridge API
>>   drm/mediatek: mtk_dsi: Create connector for bridges
> 
> Patch seems ready to apply. Will they be applied to a mediatek tree
> or to drm-misc-next?
> Or shall we take the first two patches via drm-misc-next, and the
> remaning via a mediatek tree? (I hope not)
> 

I think the only concern is from Chun-Kuan regarding patch 7/7 "drm/mediatek:
mtk_dsi: Create connector for bridges" whether we should support the old API or
not, but the discussion stalled.

Thanks,
 Enric



> 	Sam
> 
> 
>>
>>  drivers/gpu/drm/bridge/parade-ps8640.c |  12 ++
>>  drivers/gpu/drm/drm_bridge_connector.c |   1 +
>>  drivers/gpu/drm/mediatek/mtk_dsi.c     | 269 ++++++++-----------------
>>  3 files changed, 97 insertions(+), 185 deletions(-)
>>
>> -- 
>> 2.27.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

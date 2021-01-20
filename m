Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC5E2FE589
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB736E52F;
	Thu, 21 Jan 2021 08:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669226E09A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 17:12:52 +0000 (UTC)
Date: Wed, 20 Jan 2021 16:25:16 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/3] drm: bridge/panel: Cleanup connector on bridge
 detach
To: Daniel Vetter <daniel@ffwll.ch>
Message-Id: <4YQ8NQ.HNQ7IMBKVEBV2@crapouillou.net>
In-Reply-To: <CAKMK7uGGDe8bZpeTnyCkF7g_2gC1nixOzWe4FWYXPRWi-q5y7A@mail.gmail.com>
References: <20210120123535.40226-1-paul@crapouillou.net>
 <20210120123535.40226-2-paul@crapouillou.net>
 <CAKMK7uGGDe8bZpeTnyCkF7g_2gC1nixOzWe4FWYXPRWi-q5y7A@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:52:32 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, od@zcrc.me,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 stable <stable@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le mer. 20 janv. 2021 =E0 17:03, Daniel Vetter <daniel@ffwll.ch> a =

=E9crit :
> On Wed, Jan 20, 2021 at 1:35 PM Paul Cercueil <paul@crapouillou.net> =

> wrote:
>> =

>>  If we don't call drm_connector_cleanup() manually in
>>  panel_bridge_detach(), the connector will be cleaned up with the =

>> other
>>  DRM objects in the call to drm_mode_config_cleanup(). However, =

>> since our
>>  drm_connector is devm-allocated, by the time =

>> drm_mode_config_cleanup()
>>  will be called, our connector will be long gone. Therefore, the
>>  connector must be cleaned up when the bridge is detached to avoid
>>  use-after-free conditions.
> =

> For -fixes this sounds ok, but for -next I think switching to drmm_
> would be much better.

The API would need to change to have access to the drm_device struct, =

though. That would be quite a big patch, there are a few dozens source =

files that use this API already.

Cheers,
-Paul

> =

>>  v2: Cleanup connector only if it was created
>> =

>>  Fixes: 13dfc0540a57 ("drm/bridge: Refactor out the panel wrapper =

>> from the lvds-encoder bridge.")
>>  Cc: <stable@vger.kernel.org> # 4.12+
>>  Cc: Andrzej Hajda <a.hajda@samsung.com>
>>  Cc: Neil Armstrong <narmstrong@baylibre.com>
>>  Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>>  Cc: Jonas Karlman <jonas@kwiboo.se>
>>  Cc: Jernej Skrabec <jernej.skrabec@siol.net>
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   drivers/gpu/drm/bridge/panel.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>> =

>>  diff --git a/drivers/gpu/drm/bridge/panel.c =

>> b/drivers/gpu/drm/bridge/panel.c
>>  index 0ddc37551194..df86b0ee0549 100644
>>  --- a/drivers/gpu/drm/bridge/panel.c
>>  +++ b/drivers/gpu/drm/bridge/panel.c
>>  @@ -87,6 +87,12 @@ static int panel_bridge_attach(struct drm_bridge =

>> *bridge,
>> =

>>   static void panel_bridge_detach(struct drm_bridge *bridge)
>>   {
>>  +       struct panel_bridge *panel_bridge =3D =

>> drm_bridge_to_panel_bridge(bridge);
>>  +       struct drm_connector *connector =3D &panel_bridge->connector;
>>  +
>>  +       /* Cleanup the connector if we know it was initialized */
>>  +       if (!!panel_bridge->connector.dev)
>>  +               drm_connector_cleanup(connector);
>>   }
>> =

>>   static void panel_bridge_pre_enable(struct drm_bridge *bridge)
>>  --
>>  2.29.2
>> =

> =

> =

> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

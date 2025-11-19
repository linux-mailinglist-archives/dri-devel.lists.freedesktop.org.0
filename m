Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C80C70E46
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 20:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE9910E25D;
	Wed, 19 Nov 2025 19:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JXf09Dz3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC9010E25D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 19:49:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 28C291A1BF1;
 Wed, 19 Nov 2025 19:49:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D932060699;
 Wed, 19 Nov 2025 19:49:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9639A102F2165; Wed, 19 Nov 2025 20:49:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1763581794; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=idyisNLwX/81MGmvTcXblC/vtIFhEqtsf+2ziThKUl0=;
 b=JXf09Dz37KSxb84fPt0xCNsN6GavF6zxGYaDnAtetqDs1Km7Qg7tyl3ucVCrlP7/wI3vAH
 Brt1JLyQr6Z57RRLIel57nTLTRpZp/sci2HRmjHC9IN8P66AnuvhSLwoAleU1e/B5bLIs9
 iaCY9MyqzKGWVk2uTAulwuStyUlVPQz3dHD/IHrZ0mSJPM4G72sjQoDupWx8MFVv4jORI6
 skNrYrosDF7JY6jIe6vF8gCgT7WtJ7AMpQezOWiZJq6UpmsLH1LyIMmlFoUNpI6slEiwTZ
 GOY43hLWnRXakTMPShCKL/gGL2evdNlbs5ZmEWzSbKZqvB85NowHOsfPoUyZLA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 20:49:42 +0100
Message-Id: <DECXKE9A67HG.35AR5UZKKQ8A1@bootlin.com>
To: "Chaoyi Chen" <chaoyi.chen@rock-chips.com>, "Chaoyi Chen"
 <kernel@airkyi.com>, "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Peter Chen" <hzpeterchen@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Sandy Huang" <hjc@rock-chips.com>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Yubing Zhang" <yubing.zhang@rock-chips.com>,
 "Frank Wang" <frank.wang@rock-chips.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Amit Sunil Dhamne"
 <amitsd@google.com>, "Dragan Simic" <dsimic@manjaro.org>, "Johan Jonker"
 <jbx6244@gmail.com>, "Diederik de Haas" <didi.debian@cknow.org>, "Peter
 Robinson" <pbrobinson@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v9 08/10] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <20251111105040.94-1-kernel@airkyi.com>
 <20251111105040.94-9-kernel@airkyi.com>
 <DE5YP3AVGOG3.OHP68Z0F6KBU@bootlin.com>
 <b1a339e7-a011-4b4b-8988-2e3768753c85@rock-chips.com>
 <2ebace6f-d3c4-4516-b6cb-4951de06b6c8@rock-chips.com>
In-Reply-To: <2ebace6f-d3c4-4516-b6cb-4951de06b6c8@rock-chips.com>
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

Hello Chaoyi,

On Mon Nov 17, 2025 at 2:33 AM CET, Chaoyi Chen wrote:
...
>>>> +=C2=A0=C2=A0=C2=A0 /* One endpoint may correspond to one next bridge.=
 */
>>>> +=C2=A0=C2=A0=C2=A0 for_each_of_graph_port_endpoint(port, dp_ep) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device_node *next_b=
ridge_node __free(device_node) =3D
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of=
_graph_get_remote_port_parent(dp_ep);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bridge =3D of_drm_find_bri=
dge(next_bridge_node);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!bridge) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t =3D -EPROBE_DEFER;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to out;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dp->next_bridge_valid =3D =
true;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dp->next_bridge_list[count=
].bridge =3D bridge;
>>> You are storing a reference to a drm_bridge, so have to increment the
>>> refcount:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dp->next_bridge_list[count].=
bridge =3D drm_bridge_get(bridge);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^
>>>
>>> FYI there is a plan to replace of_drm_find_bridge() with a function tha=
t
>>> increases the bridge refcount before returning the bridge, but it's not
>>> there yet. When that will happen, the explicit drm_bridge_get() won't b=
e
>>> needed anymore and this code can be updated accordingly.
>
> Out of curiosity, I checked the callers of of_drm_find_bridge(), and it
> seems that the vast majority of them do not pay attention to the increase
> or decrease of reference counts.

They do not call drm_bridge_put() to decrease the refcount, and that's
"correct" because of_drm_find_bridge() does not increase it. This was
totally correct in the past because DRM bridge refcounting did not exist.

Refcounting has been added to support hot-pluggable bridges. If you want
more info, this presentation I gave at ELCE 2025 is a good summary, with
links to relevant patches:

 * Video (start at 19:30): https://www.youtube.com/watch?v=3DmsmBQBSyZZ4
 * Slides (start at slide 27):
   https://bootlin.com/pub/conferences/2025/elce/ceresoli-hotplug-status.pd=
f

> Does this mean that even if we add reference counting in
> of_drm_find_bridge(), we still need to modify the corresponding functions
> of their callers and decrease the reference count at the appropriate
> time?

Exactly. I have explored that approach but it turned out being not
reasonably doable due to the large number of (direct + indirect) callers of
of_drm_find_bridge() as well as the trickiness of those involvingthe
panel_bridge. So Maxime proposed a different approach [0]: deprecate
of_drm_find_bridge() and replace it with a function that increments the
refcount, then let the various callers move to the new function over time.

Earlier today I sent a series doing that, and converting lots of users
[1]. If/when that approach will be accepted, you can update your driver to
use the new drm_of_fund_bridge() and take care of putting the reference
when appropriate. But you don't need to do anything until then.

[0] https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad=
@houat/
[1] https://lore.kernel.org/lkml/20251119-drm-bridge-alloc-getput-drm_of_fi=
nd_bridge-v1-0-0db98a7fe474@bootlin.com/

> Thank you.

You're welcome. I hope it was a clear explanation.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

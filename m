Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA38B9B6CEF
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 20:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1720E10E7F5;
	Wed, 30 Oct 2024 19:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BaG/8wNw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0823610E7F5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 19:39:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 307FBA8F;
 Wed, 30 Oct 2024 20:39:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1730317172;
 bh=0hN4Dxbc88JoFnTjDC6D8vcsDV41vBFTbn2UWygs4+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BaG/8wNwxN5d0Z4/fRu0OKDMasM9ukvWucJhfwfasHvt3WCt9fQRc3mShkBSBVMmR
 uPFy+wL8R+2tpswHO2hn6kzkuF1g9/P80W3doG654t+RgUTHm6mPjQhWfoTVyXH54x
 qXvEJQrBg7UEVjsL5FbcbUVQQiXapjxsAr+iDdcQ=
Date: Wed, 30 Oct 2024 21:39:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
Message-ID: <20241030193928.GC920@pendragon.ideasonboard.com>
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
 <ux2lfkaeoyakulhllitxraduqjldtxrcmpgsis3us7msixiguq@ff5gfhtkakh2>
 <f2119a4d-7ba3-4f11-91d7-54aac51ef950@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f2119a4d-7ba3-4f11-91d7-54aac51ef950@linux.dev>
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

On Thu, Oct 31, 2024 at 12:45:24AM +0800, Sui Jingfeng wrote:
> Hi,
> 
> On 2024/10/18 23:43, Dmitry Baryshkov wrote:
> > On Fri, Oct 18, 2024 at 03:49:34PM +0300, Abel Vesa wrote:
> >> The assignment of the of_node to the aux bridge needs to mark the
> >> of_node as reused as well, otherwise resource providers like pinctrl will
> >> report a gpio as already requested by a different device when both pinconf
> >> and gpios property are present.
> >> Fix that by using the device_set_of_node_from_dev() helper instead.
> >>
> >> Fixes: 6914968a0b52 ("drm/bridge: properly refcount DT nodes in aux bridge drivers")
> >> Cc: stable@vger.kernel.org      # 6.8
> >> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> >> ---
> >> Changes in v2:
> >> - Re-worded commit to be more explicit of what it fixes, as Johan suggested
> >> - Used device_set_of_node_from_dev() helper, as per Johan's suggestion
> >> - Added Fixes tag and cc'ed stable
> >> - Link to v1: https://lore.kernel.org/r/20241017-drm-aux-bridge-mark-of-node-reused-v1-1-7cd5702bb4f2@linaro.org
> >> ---
> >>   drivers/gpu/drm/bridge/aux-bridge.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Technically speaking, your driver just move the burden to its caller.
> Because this driver requires its user call drm_aux_bridge_register()
> to create an AUX child device manually, you need it call ida_alloc()
> to generate a unique id.

There's a relevant discussion for a ti-sn65dsi86 patch, see
https://lore.kernel.org/r/20241030102846.GB14276@pendragon.ideasonboard.com

I agree it shouldn't be the responsibility of each caller to generate
unique IDs.

> Functions symbols still have to leak to other subsystems, which is
> not really preserve coding sharing.
> 
> What's worse, the action that allocating unique device id traditionally
> is the duty of driver core. Why breaks (so called) perfect device driver
> model by moving that out of core. Especially in the DT world that the
> core knows very well how to populate device instance and manage the
> reference counter.
> 
> HPD handling is traditionally belongs to connector, create standalone
> driver like this one *abuse* to both Maxime's simple bridge driver and
> Laurent's display-connector bridge driver or drm_bridge_connector or
> whatever. Why those work can't satisfy you? At least, their drivers
> are able to passing the mode setting states to the next bridge.
> 
> Basically those AUX drivers implementation abusing the definition of
> bridge, abusing the definition of connector and abusing the DT.
> Its just manually populate instances across drivers.

-- 
Regards,

Laurent Pinchart

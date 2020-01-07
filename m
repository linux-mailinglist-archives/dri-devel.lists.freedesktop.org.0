Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EEA132933
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 15:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D2E89958;
	Tue,  7 Jan 2020 14:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1DB89958
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 14:46:15 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jan 2020 06:46:14 -0800
X-IronPort-AV: E=Sophos;i="5.69,406,1571727600"; d="scan'208";a="233207651"
Received: from ideak-desk.fi.intel.com ([10.237.68.142])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jan 2020 06:46:09 -0800
Date: Tue, 7 Jan 2020 16:46:05 +0200
From: Imre Deak <imre.deak@intel.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v6 1/4] drm/bridge: Add a drm_bridge_state object
Message-ID: <20200107144605.GD29830@ideak-desk.fi.intel.com>
References: <20200106143409.32321-1-narmstrong@baylibre.com>
 <20200106143409.32321-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200106143409.32321-2-narmstrong@baylibre.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: imre.deak@intel.com
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jan 06, 2020 at 03:34:06PM +0100, Neil Armstrong wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> One of the last remaining objects to not have its atomic state.
> 
> This is being motivated by our attempt to support runtime bus-format
> negotiation between elements of the bridge chain.
> This patch just paves the road for such a feature by adding a new
> drm_bridge_state object inheriting from drm_private_obj so we can
> re-use some of the existing state initialization/tracking logic.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> [...]
> +
> +/**
> + * __drm_atomic_helper_bridge_duplicate_state() - Copy atomic bridge state
> + * @bridge: bridge object
> + * @state: atomic bridge state
> + *
> + * Copies atomic state from a bridge's current state and resets inferred values.
> + * This is useful for drivers that subclass the bridge state.
> + */
> +void __drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge,
> +						struct drm_bridge_state *state)
> +{
> +	__drm_atomic_helper_private_obj_duplicate_state(&bridge->base,
> +							&state->base);

When DRM and DRM_KMS_HELPER are built as modules the above will cause the
following build error:

depmod: ERROR: Cycle detected: drm_kms_helper -> drm -> drm_kms_helper
depmod: ERROR: Found 2 modules in dependency cycles!

Using __drm_atomic_helper_private_obj_duplicate_state will add the
drm.ko->drm_kms_helper.ko dependency but drm_kms_helper.ko already
depends on drm.ko

--Imre
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

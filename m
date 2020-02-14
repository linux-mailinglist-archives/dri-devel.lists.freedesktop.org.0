Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEC515E06C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BBD6FA1D;
	Fri, 14 Feb 2020 16:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6638B6FA1D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:14:03 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id BFFBF8045F;
 Fri, 14 Feb 2020 17:14:00 +0100 (CET)
Date: Fri, 14 Feb 2020 17:13:59 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/4] drm/connector: Add data polarity flags
Message-ID: <20200214161359.GB18287@ravnborg.org>
References: <cover.b12a054012ce067fa2094894147f953ab816d8d0.1581682983.git-series.maxime@cerno.tech>
 <b541006fa0a1c34ac5f668dc561aa1598f8fd86c.1581682983.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b541006fa0a1c34ac5f668dc561aa1598f8fd86c.1581682983.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=8sOSbDn3uDz3MpWGLZkA:9 a=CjuIK1q_8ugA:10
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime.

On Fri, Feb 14, 2020 at 01:24:38PM +0100, Maxime Ripard wrote:
> Some LVDS encoders can change the polarity of the data signals being
> sent. Add a DRM bus flag to reflect this.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  include/drm/drm_connector.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 221910948b37..9a08fe6ab7c2 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -330,6 +330,8 @@ enum drm_panel_orientation {
>   *					edge of the pixel clock
>   * @DRM_BUS_FLAG_SHARP_SIGNALS:		Set if the Sharp-specific signals
>   *					(SPL, CLS, PS, REV) must be used
> + * @DRM_BUS_FLAG_DATA_LOW:		The Data signals are active low
> + * @DRM_BUS_FLAG_DATA_HIGH:		The Data signals are active high
Reading the description of these falgs always confuses me.
In this case if neither bit 9 nor bit 10 is set then the data signals
are netiher active low nor active high.
So what can I then expect?

We have the same logic loophole for DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE
and DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE.
So it is not new, but can we do better here?

	Sam


>   */
>  enum drm_bus_flags {
>  	DRM_BUS_FLAG_DE_LOW = BIT(0),
> @@ -349,6 +351,8 @@ enum drm_bus_flags {
>  	DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE = DRM_BUS_FLAG_SYNC_NEGEDGE,
>  	DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE = DRM_BUS_FLAG_SYNC_POSEDGE,
>  	DRM_BUS_FLAG_SHARP_SIGNALS = BIT(8),
> +	DRM_BUS_FLAG_DATA_LOW = BIT(9),
> +	DRM_BUS_FLAG_DATA_HIGH = BIT(10),
>  };
>  
>  /**
> -- 
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

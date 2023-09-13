Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CA079E3D2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 11:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6837010E492;
	Wed, 13 Sep 2023 09:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C5F10E492
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 09:33:46 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qgMFW-00005k-SA; Wed, 13 Sep 2023 11:33:30 +0200
Message-ID: <c54d19b8-eb5c-9977-b7e4-d2806054b5ae@pengutronix.de>
Date: Wed, 13 Sep 2023 11:33:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 0/3] Support non-default LVDS data mapping for simple
 panel
Content-Language: en-US, de-DE
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
References: <20230523-simplepanel_support_nondefault_datamapping-v4-0-e6e7011f34b5@pengutronix.de>
From: Johannes Zink <j.zink@pengutronix.de>
In-Reply-To: <20230523-simplepanel_support_nondefault_datamapping-v4-0-e6e7011f34b5@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dan Carpenter <error27@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-jzi@pengutronix.de, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

gentle ping - is there any feedback you can give me for moving this series forward?

Best regards
Johannes

On 7/28/23 16:16, Johannes Zink wrote:
> Some LVDS panels, such as the innolux,g101ice-l01 support multiple LVDS
> data mapping modes, which can be configured by strapping a dataformat
> pin on the display to a specific voltage.
> 
> This can be particularly useful for using the jeida-18 format, which
> requires only 3 instead of 4 LVDS lanes.
> 
> This series moves the data-mapping property for LVDS panels in a
> separate file and optionally adds it to simple-panel when matching to
> the innolux,g101ice-l01 compatible. This property allows to override
> the default data mapping set in the panel description in simple-panel.
> 
> The last patch in this series actually adds the driver support for
> parsing the data format override device tree property and modifying the
> corresponding values for bit per color and media bus format in the panel
> descriptor.
> 
> Best regards
> Johannes
> 
> ---
> 
> Changelog:
> 
> v3 -> v4:  - driver: worked in Dan's Feedback:
>               - return with proper error in case the call into
> 	       panel_simple_override_nondefault_lvds_datamapping()
> 	       failed
> 	     - drop the unneeded and ambiguous ret local value
> 
> - Link to v3: https://lore.kernel.org/r/20230523-simplepanel_support_nondefault_datamapping-v3-0-78ede374d3d9@pengutronix.de
> v2 -> v3:  - dt bindings: Worked in Conor's and Laurent's Feedback
> 	     (thanks for your review): Drop the chomping indicator
> 	   - dt bindings: Worked in Laurent's Feedback: fix typos
> 	   - driver: worked in Laurent's review findings:
> 	     - extract function for fixing up the bus format
> 	     - only call this function on LVDS panels
> 	     - fix typo
>             - Link to v2: https://lore.kernel.org/r/20230523-simplepanel_support_nondefault_datamapping-v2-0-87196f0d0b64@pengutronix.de
> 
> v1 -> v2:  - dt bindings: Worked in Rob's review findings (thanks for your
>               review), refactored to use common include instead of duplication
>             - driver: added missing error unwinding goto, as found by Dan
>               Carpenter's test robot:
>               Reported-by: kernel test robot <lkp@intel.com>
>               Reported-by: Dan Carpenter <error27@gmail.com>
>               Link: https://lore.kernel.org/r/202304160359.4LHmFOlU-lkp@intel.com/
> 
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Rob Herring <robh+dt@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Thierry Reding <thierry.reding@gmail.com>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Sam Ravnborg <sam@ravnborg.org>
> Cc: patchwork-jzi@pengutronix.de
> Cc: kernel@pengutronix.de
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
> 
> ---
> 
> ---
> Johannes Zink (3):
>        dt-bindings: display: move LVDS data-mapping definition to separate file
>        dt-bindings: display: simple: support non-default data-mapping
>        drm/panel-simple: allow LVDS format override
> 
>   .../bindings/display/lvds-data-mapping.yaml        | 84 ++++++++++++++++++++++
>   .../devicetree/bindings/display/lvds.yaml          | 77 +++-----------------
>   .../bindings/display/panel/panel-simple.yaml       | 26 ++++++-
>   drivers/gpu/drm/panel/panel-simple.c               | 53 ++++++++++++++
>   4 files changed, 171 insertions(+), 69 deletions(-)
> ---
> base-commit: 52920704df878050123dfeb469aa6ab8022547c1
> change-id: 20230523-simplepanel_support_nondefault_datamapping-13c3f2ea28f8
> 
> Best regards,

-- 
Pengutronix e.K.                | Johannes Zink                  |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |


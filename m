Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659C33653CF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 10:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22B16E461;
	Tue, 20 Apr 2021 08:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15B16E454;
 Tue, 20 Apr 2021 08:14:26 +0000 (UTC)
IronPort-SDR: NXmaxhx+CzkHGeaIHLWFAnkz8yg446hl2kXblrKpBuQBmZtxQWCASFOU8zhWSVdqY0mOlp2h4/
 fVZStJ01WSsA==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="193343365"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="193343365"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 01:14:26 -0700
IronPort-SDR: Cxj7ganx+nV90yPpMiVWE6qtl6+EMVAiGF6UykeJoDtukenFRfrSPjRTDSrKPkZSKpGF2Cna0F
 F6uvu7cEBDBQ==
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="426831797"
Received: from karunatx-mobl.gar.corp.intel.com (HELO localhost)
 ([10.252.35.249])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 01:14:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rajeev Nandan <rajeevny@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [v1 0/3] drm: Add support for backlight control of eDP panel on
 ti-sn65dsi86 bridge
In-Reply-To: <1618418390-15055-1-git-send-email-rajeevny@codeaurora.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1618418390-15055-1-git-send-email-rajeevny@codeaurora.org>
Date: Tue, 20 Apr 2021 11:14:18 +0300
Message-ID: <871rb5bcf9.fsf@intel.com>
MIME-Version: 1.0
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
Cc: mkrishn@codeaurora.org, Rajeev Nandan <rajeevny@codeaurora.org>,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, dianders@chromium.org,
 seanpaul@chromium.org, Thomas Zimmermann <tzimmermann@suse.de>,
 kalyan_t@codeaurora.org, hoegsberg@chromium.org, "Lankhorst,
 Maarten" <maarten.lankhorst@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Cc: Lyude and drm-misc maintainers

On Wed, 14 Apr 2021, Rajeev Nandan <rajeevny@codeaurora.org> wrote:
> The backlight level of an eDP panel can be controlled through the AUX
> channel using DPCD registers of the panel.
>
> The capability for the Source device to adjust backlight characteristics
> within the panel, using the Sink device DPCD registers is indicated by
> the TCON_BACKLIGHT_ADJUSTMENT_CAPABLE bit in the EDP_GENERAL_CAPABILITY_1
> register (DPCD Address 701h, bit0). In this configuration, the eDP TCON
> receives the backlight level information from the host, through the AUX
> channel.

i915 has had this capability for some years now, and work is in progress
to extract the DP AUX backlight code to drm core as helpers [1]. There's
much more to it than what's proposed here. Adding incompatible DP AUX
code at this point would be a pretty bad outcome.

For example, we can't tie backlight device register to DP AUX backlight,
because there are modes where *both* the eDP PWM pin based backlight
control and DP AUX backlight control are used *simultaneously*. The
backlight device register needs to be in code that is aware of both.

Granted, it was a mistake way back when to add this in i915 only, and it
should've been lifted to drm much earlier. It would've been done by
Lyude by now, but people were not happy about not using drm device based
logging. And that has unfortunately lead to a pretty massive prep series
[2].

Please look into the code added to drm helpers in [1], and see how that
would work for you.


BR,
Jani.


[1] http://lore.kernel.org/r/20210205234515.1216538-1-lyude@redhat.com
[2] http://lore.kernel.org/r/20210419225523.184856-1-lyude@redhat.com


>
> The changes in this patch series do the following:
> - Add drm_dp_aux_backlight_ APIs to support backlight control using DPCD
>   registers on the DisplayPort AUX channel.
>   The current version only supports backlight brightness control by the
>   EDP_BACKLIGHT_BRIGHTNESS_MSB/LSB registers (DPCD Addresses 722h-723h).
> - Add support for backlight control of the eDP panel connected to the
>   ti-sn65dsi86 bridge.
>
> Rajeev Nandan (3):
>   drm/dp: Add DisplayPort aux backlight control support
>   dt-bindings: drm/bridge: ti-sn65dsi86: Document use-aux-backlight
>   drm/bridge: ti-sn65dsi86: Add DisplayPort aux backlight support
>
>  .../bindings/display/bridge/ti,sn65dsi86.yaml      |   8 +
>  drivers/gpu/drm/Kconfig                            |   8 +
>  drivers/gpu/drm/Makefile                           |   1 +
>  drivers/gpu/drm/bridge/Kconfig                     |   1 +
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  26 +++
>  drivers/gpu/drm/drm_dp_aux_backlight.c             | 191 +++++++++++++++++++++
>  include/drm/drm_dp_aux_backlight.h                 |  29 ++++
>  7 files changed, 264 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_dp_aux_backlight.c
>  create mode 100644 include/drm/drm_dp_aux_backlight.h

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

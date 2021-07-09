Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874AD3C2A7B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 22:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC1F6EA8B;
	Fri,  9 Jul 2021 20:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2B16E9FC;
 Fri,  9 Jul 2021 20:41:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10040"; a="209813182"
X-IronPort-AV: E=Sophos;i="5.84,227,1620716400"; d="scan'208";a="209813182"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 13:41:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,227,1620716400"; d="scan'208";a="450411488"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 09 Jul 2021 13:40:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 09 Jul 2021 23:40:57 +0300
Date: Fri, 9 Jul 2021 23:40:57 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [v8 0/6] drm: Support basic DPCD backlight in panel-simple and
 add a new panel ATNA33XC20
Message-ID: <YOi0WbTP0crIkOGy@intel.com>
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
 <CAD=FV=UP9jrS=JG=TuB7+i9QcZv8GOLYdPdb3_KNhEsgapGeww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UP9jrS=JG=TuB7+i9QcZv8GOLYdPdb3_KNhEsgapGeww@mail.gmail.com>
X-Patchwork-Hint: comment
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 Rajeev Nandan <rajeevny@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Jani Nikula <jani.nikula@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 09, 2021 at 06:54:05AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Sat, Jun 26, 2021 at 9:52 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
> >
> > This series adds the support for the eDP panel that needs the backlight
> > controlling over the DP AUX channel using DPCD registers of the panel
> > as per the VESA's standard.
> >
> > This series also adds support for the Samsung eDP AMOLED panel that
> > needs DP AUX to control the backlight, and introduces new delays in the
> > @panel_desc.delay to support this panel.
> >
> > This patch series depends on the following two series:
> > - Doug's series [1], exposed the DP AUX channel to the panel-simple.
> > - Lyude's series [2], introduced new drm helper functions for DPCD
> >   backlight.
> >
> > This series is the logical successor to the series [3].
> >
> > Changes in v1:
> > - Created dpcd backlight helper with very basic functionality, added
> >   backlight registration in the ti-sn65dsi86 bridge driver.
> >
> > Changes in v2:
> > - Created a new DisplayPort aux backlight driver and moved the code from
> >   drm_dp_aux_backlight.c (v1) to the new driver.
> >
> > Changes in v3:
> > - Fixed module compilation (kernel test bot).
> >
> > Changes in v4:
> > - Added basic DPCD backlight support in panel-simple.
> > - Added support for a new Samsung panel ATNA33XC20 that needs DPCD
> >   backlight controlling and has a requirement of delays between enable
> >   GPIO and regulator.
> >
> > Changes in v5:
> > Addressed review suggestions from Douglas:
> > - Created a new API drm_panel_dp_aux_backlight() in drm_panel.c
> > - Moved DP AUX backlight functions from panel-simple.c to drm_panel.c
> > - panel-simple probe() calls drm_panel_dp_aux_backlight() to create
> >   backlight when the backlight phandle is not specified in panel DT
> >   and DP AUX channel is present.
> > - Added check for drm_edp_backlight_supported() before registering.
> > - Removed the @uses_dpcd_backlight flag from panel_desc as this
> >   should be auto-detected.
> > - Updated comments/descriptions.
> >
> > Changes in v6:
> > - Rebased
> > - Updated wanrning messages, fixed word wrapping in comments.
> > - Fixed ordering of memory allocation
> >
> > Changes in v7:
> > - Updated the disable_to_power_off and power_to_enable panel delays
> > as discovered at <https://crrev.com/c/2966167> (Douglas)
> >
> > Changes in v8:
> > - Now using backlight_is_blank() to get the backlight blank status (Sam Ravnborg)
> > - Added a new patch #4 to fix the warnings for eDP panel description (Sam Ravnborg)
> >
> > [1] https://lore.kernel.org/dri-devel/20210525000159.3384921-1-dianders@chromium.org/
> > [2] https://lore.kernel.org/dri-devel/20210514181504.565252-1-lyude@redhat.com/
> > [3] https://lore.kernel.org/dri-devel/1619416756-3533-1-git-send-email-rajeevny@codeaurora.org/
> >
> > Rajeev Nandan (6):
> >   drm/panel: add basic DP AUX backlight support
> >   drm/panel-simple: Support DP AUX backlight
> >   drm/panel-simple: Support for delays between GPIO & regulator
> >   drm/panel-simple: Update validation warnings for eDP panel description
> >   dt-bindings: display: simple: Add Samsung ATNA33XC20
> >   drm/panel-simple: Add Samsung ATNA33XC20
> >
> >  .../bindings/display/panel/panel-simple.yaml       |   2 +
> >  drivers/gpu/drm/drm_panel.c                        | 108 +++++++++++++++++++++
> >  drivers/gpu/drm/panel/panel-simple.c               |  73 +++++++++++++-
> >  include/drm/drm_panel.h                            |  15 ++-
> >  4 files changed, 190 insertions(+), 8 deletions(-)
> 
> Pushed to drm-misc-next.
> 
> 4bfe6c8f7c23 drm/panel-simple: Add Samsung ATNA33XC20
> c20dec193584 dt-bindings: display: simple: Add Samsung ATNA33XC20
> 13aceea56fd5 drm/panel-simple: Update validation warnings for eDP
> panel description
> 18a1488bf1e1 drm/panel-simple: Support for delays between GPIO & regulator
> bfd451403d70 drm/panel-simple: Support DP AUX backlight
> 10f7b40e4f30 drm/panel: add basic DP AUX backlight support

depmod: ERROR: Cycle detected: drm_kms_helper -> drm -> drm_kms_helper

Looks to be due to drm_edp_backlight_enable().

-- 
Ville Syrjälä
Intel

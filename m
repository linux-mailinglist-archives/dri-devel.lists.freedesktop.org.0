Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 271672CF6D1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 23:36:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496F36E220;
	Fri,  4 Dec 2020 22:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51716EC7F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 22:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607121378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aNsxtvDeEpU2rFFWxdOTmdRSlc01cOdQavk/G3A+TNI=;
 b=QQ1VsNdckKzJOw095ui8Zzsm1CfHaL2yOPk3f1qs6DKBH7hNCn+0glK6fNOFNoRihGgNuz
 F1ct2/sj6gbxxboYRb6Za/dk8i/1XpCNZpYyUkO8BW9wnO3RGT93liCq8xdf/eZPp7WG04
 qoATjKbEttkA508tiYvF0OpdbOHVm+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-gHBnbpupN9Sg-a-RVhcEKw-1; Fri, 04 Dec 2020 17:36:13 -0500
X-MC-Unique: gHBnbpupN9Sg-a-RVhcEKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55E9C3FD4;
 Fri,  4 Dec 2020 22:36:12 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-112-159.rdu2.redhat.com
 [10.10.112.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81FA063BA7;
 Fri,  4 Dec 2020 22:36:11 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/9] drm/i915: Add support for Intel's eDP backlight
 controls
Date: Fri,  4 Dec 2020 17:35:54 -0500
Message-Id: <20201204223603.249878-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A while ago we ran into issues while trying to enable the eDP backlight
control interface as defined by VESA, in order to make the DPCD
backlight controls on newer laptop panels work. The issue ended up being
much more complicated however, as we also apparently needed to add
support for an Intel-specific DPCD backlight control interface as the
VESA interface is broken on many laptop panels. For lack of a better
name, we just call this the Intel HDR backlight interface.

While this only adds support for the SDR backlight mode (I think), this
will fix a lot of user's laptop panels that we weren't able to properly
automatically detect DPCD backlight controls on previously.

Series-wide changes in v3:
* Pass down brightness values to enable/disable backlight callbacks in a
  separate patch
* Rebase

Lyude Paul (9):
  drm/i915/dp: Program source OUI on eDP panels
  drm/i915: Rename pwm_* backlight callbacks to ext_pwm_*
  drm/i915: Pass down brightness values to enable/disable backlight
    callbacks
  drm/i915: Keep track of pwm-related backlight hooks separately
  drm/i915/dp: Rename eDP VESA backlight interface functions
  drm/i915/dp: Add register definitions for Intel HDR backlight
    interface
  drm/i915/dp: Enable Intel's HDR backlight interface (only SDR for now)
  drm/i915/dp: Allow forcing specific interfaces through
    enable_dpcd_backlight
  drm/dp: Revert "drm/dp: Introduce EDID-based quirks"

 drivers/gpu/drm/drm_dp_helper.c               |  83 +---
 drivers/gpu/drm/drm_dp_mst_topology.c         |   3 +-
 .../drm/i915/display/intel_display_types.h    |  18 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  42 +-
 .../drm/i915/display/intel_dp_aux_backlight.c | 394 +++++++++++++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   3 +-
 .../i915/display/intel_dsi_dcs_backlight.c    |   7 +-
 drivers/gpu/drm/i915/display/intel_panel.c    | 435 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_panel.h    |   4 +
 drivers/gpu/drm/i915/display/intel_psr.c      |   2 +-
 drivers/gpu/drm/i915/i915_params.c            |   2 +-
 include/drm/drm_dp_helper.h                   |  21 +-
 12 files changed, 655 insertions(+), 359 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41DE2F5550
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 00:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233406ECB6;
	Wed, 13 Jan 2021 23:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA2D6ECB6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 23:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610582079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vqJDg9BfbN+RVZA333fXDHgcuBhof5Wizkh74OzfPqs=;
 b=e8eQZWcY+F5KD89Up/OSn2XZhpkKicL7AsnudTY9PkysqlOyypr2nZvQ1L+fJ2svJtx55P
 KhQX34IwoUoSgvk0x58/Vm1z97dS6OO0Fml3jJZADOsj/0GIRraUZouByjmyrorRindvBL
 noUFRhMyosuWmj2I62hzgtd09dAIZxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-IucgF7NBNSq7aOyD81z7CQ-1; Wed, 13 Jan 2021 18:54:38 -0500
X-MC-Unique: IucgF7NBNSq7aOyD81z7CQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3840C1005E40;
 Wed, 13 Jan 2021 23:54:37 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-119-79.rdu2.redhat.com
 [10.10.119.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85FF510016F4;
 Wed, 13 Jan 2021 23:54:36 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 0/4] drm/i915: Add support for Intel's eDP backlight
 controls
Date: Wed, 13 Jan 2021 18:54:22 -0500
Message-Id: <20210113235426.2190684-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Lyude Paul (4):
  drm/i915: Keep track of pwm-related backlight hooks separately
  drm/i915/dp: Enable Intel's HDR backlight interface (only SDR for now)
  drm/i915/dp: Allow forcing specific interfaces through
    enable_dpcd_backlight
  drm/dp: Revert "drm/dp: Introduce EDID-based quirks"

 drivers/gpu/drm/drm_dp_helper.c               |  83 +---
 drivers/gpu/drm/drm_dp_mst_topology.c         |   3 +-
 .../drm/i915/display/intel_display_types.h    |  14 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   9 +-
 .../drm/i915/display/intel_dp_aux_backlight.c | 286 ++++++++++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   3 +-
 drivers/gpu/drm/i915/display/intel_panel.c    | 368 +++++++++++-------
 drivers/gpu/drm/i915/display/intel_panel.h    |   4 +
 drivers/gpu/drm/i915/display/intel_psr.c      |   2 +-
 drivers/gpu/drm/i915/i915_params.c            |   2 +-
 include/drm/drm_dp_helper.h                   |  21 +-
 11 files changed, 504 insertions(+), 291 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

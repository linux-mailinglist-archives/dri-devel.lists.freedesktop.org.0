Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9743D311742
	for <lists+dri-devel@lfdr.de>; Sat,  6 Feb 2021 00:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A016E1F6;
	Fri,  5 Feb 2021 23:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A89B6EAC7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 23:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612568724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iY3IjhQPYa+p63OMFoqW4AwhQgkWYCOrFg/cQCxrZBA=;
 b=N7BPbh/nneJqxFgfcklJF6DgU0nF0uZtaLPuHbCZxXqt/A1e02U149LK+gcGoDNMYCXS14
 0dXiDYkE+9hTrKtYGcWrXisxiL3IQegccq90NXR9Q3fzPtHWj+AtVpJRlm+1ep+Q4uS0qQ
 i2Brxkju2FzboiztsLN6rTA1DGKTROw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-uvYRsLNKMH6Vjmtqog3o9A-1; Fri, 05 Feb 2021 18:45:22 -0500
X-MC-Unique: uvYRsLNKMH6Vjmtqog3o9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D1E210051A2;
 Fri,  5 Feb 2021 23:45:21 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-116-79.rdu2.redhat.com
 [10.10.116.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97C0219727;
 Fri,  5 Feb 2021 23:45:20 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC v3 00/10] drm: Extract DPCD backlight helpers from i915,
 add support in nouveau
Date: Fri,  5 Feb 2021 18:45:04 -0500
Message-Id: <20210205234515.1216538-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Jani Nikula <jani.nikula@intel.com>, greg.depoire@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series:
* Cleans up i915's DPCD backlight code a little bit
* Extracts i915's DPCD backlight code into a set of shared DRM helpers
* Starts using those helpers in nouveau to add support to nouveau for
  DPCD backlight control

v2 series-wide changes:
* Rebase
v3 series-wide changes:
* Split up the changes to intel's backlight code into separate patches

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Dave Airlie <airlied@gmail.com>
Cc: greg.depoire@gmail.com

Lyude Paul (10):
  drm/nouveau/kms/nv40-/backlight: Assign prop type once
  drm/nouveau/kms: Don't probe eDP connectors more then once
  drm/i915/dpcd_bl: Remove redundant AUX backlight frequency
    calculations
  drm/i915/dpcd_bl: Handle drm_dpcd_read/write() return values correctly
  drm/i915/dpcd_bl: Cleanup intel_dp_aux_vesa_enable_backlight() a bit
  drm/i915/dpcd_bl: Cache some backlight capabilities in
    intel_panel.backlight
  drm/i915/dpcd_bl: Move VESA backlight enabling code closer together
  drm/i915/dpcd_bl: Return early in vesa_calc_max_backlight if we can't
    read PWMGEN_BIT_COUNT
  drm/i915/dpcd_bl: Print return codes for VESA backlight failures
  drm/dp: Extract i915's eDP backlight code into DRM helpers

 drivers/gpu/drm/drm_dp_helper.c               | 332 ++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |   2 +-
 .../drm/i915/display/intel_dp_aux_backlight.c | 329 +++--------------
 drivers/gpu/drm/nouveau/nouveau_backlight.c   |   4 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c   |   6 +
 include/drm/drm_dp_helper.h                   |  48 +++
 6 files changed, 428 insertions(+), 293 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

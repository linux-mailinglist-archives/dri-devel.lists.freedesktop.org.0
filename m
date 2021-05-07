Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C94376D4C
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 01:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0E56E5A3;
	Fri,  7 May 2021 23:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A516E5A3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 23:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620430799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ieKXSzDqhVgqc642wx/XUfXN10nXFMC0TsmetlrzGqY=;
 b=Bj6MbOOaG0rhuivcVQOoVtOguC9hPS3GR+imW2kzeUCnci07yTkFHwyJBnIg5miZxD/mHj
 iUMbBuDp/oPfPUSd5VTRIwXx66AlD1F0xYAWGLJ72J1Im4tbWc8AJuAnZVDFF20CQHAfxR
 B9KOBII/F/ueSyDctCSWi9AzdFZfhXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-ZGLgH3G6Oa6mJOIC1fS8lA-1; Fri, 07 May 2021 19:39:58 -0400
X-MC-Unique: ZGLgH3G6Oa6mJOIC1fS8lA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C830A800D62;
 Fri,  7 May 2021 23:39:55 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6074100164C;
 Fri,  7 May 2021 23:39:54 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [RFC v5 0/9] drm: Extract DPCD backlight helpers from i915,
 add support in nouveau
Date: Fri,  7 May 2021 19:39:38 -0400
Message-Id: <20210507233947.751846-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Jani Nikula <jani.nikula@intel.com>, greg.depoire@gmail.com,
 Rajeev Nandan <rajeevny@codeaurora.org>
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
v4 series-wide changes:
* Don't forget to actually include the patch that starts using these
  helpers in nouveau
v5 series-wide changes:
* Rebase
* Use new drm_dbg_*() logging helpers

Lyude Paul (9):
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
  drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau

 drivers/gpu/drm/drm_dp_helper.c               | 347 ++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |   2 +-
 .../drm/i915/display/intel_dp_aux_backlight.c | 329 ++---------------
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  28 ++
 drivers/gpu/drm/nouveau/nouveau_backlight.c   | 166 ++++++++-
 drivers/gpu/drm/nouveau/nouveau_connector.h   |   9 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h     |   1 +
 include/drm/drm_dp_helper.h                   |  48 +++
 8 files changed, 622 insertions(+), 308 deletions(-)

-- 
2.30.2


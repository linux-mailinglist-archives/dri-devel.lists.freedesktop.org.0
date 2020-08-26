Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF822536BC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 20:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200D56E82B;
	Wed, 26 Aug 2020 18:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CE46E82B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 18:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598466314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0vrJKSvfDSDZY8uMwS7EfqyWxwPx+edNGvuc7fbgOtg=;
 b=hvOg3asu3GmJSyXuwZNK73UqaZ9CFqeG7h0KHRatIr8BfRRAEL/4XaDt2iiBJ9Mss0Cwy9
 P6EORjtYOK2qIooAWCYkQOVub3wcgUP/nrUbuVWXC8SncFT6hgmqhRTOu0CLF6cTpk4XZR
 6hxCEL8vq53uZAusiC8etJQ5U46aIhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-17Naue9gMM2QUdRRF0kcCQ-1; Wed, 26 Aug 2020 14:25:12 -0400
X-MC-Unique: 17Naue9gMM2QUdRRF0kcCQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A163800C78;
 Wed, 26 Aug 2020 18:25:11 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-119-77.rdu2.redhat.com
 [10.10.119.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2084210021AA;
 Wed, 26 Aug 2020 18:25:11 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v5 00/20] drm/dp, i915,
 nouveau: Cleanup nouveau HPD and add DP features from i915
Date: Wed, 26 Aug 2020 14:24:36 -0400
Message-Id: <20200826182456.322681-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
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

Most of the reason I'm asking for an RFC here is because this
code pulls a lot of code out of i915 and into shared DP helpers.

Anyway-nouveau's HPD related code has been collecting dust for a while.
Other then the occasional runtime PM related and MST related fixes,
we're missing a lot of nice things that have been added to DRM since
this was originally written. Additionally, the code is just really
unoptimized in general:

* We handle connector probing in the same context that we handle short
  IRQs in for DP, which means connector probing could potentially block
  ESI handling for MST
* When we receive a hotplug event from a connector, we reprobe every
  single connector instead of just the connector that was hotplugged
* Additionally because of the above reason, combined with the fact I had
  the bad idea of reusing some of the MST locks when I last rewrote
  nouveau's DP MST detection, trying to handle any other events that
  require short HPD IRQs is a bit awkward to actually implement.
* We don't actually properly check whether EDIDs change or not when
  reprobing, which means we basically send out a hotplug event every
  single time we receive one even if nothing has changed

Additionally, the code for handling DP that we have in nouveau is also
quite unoptimized in general, doesn't use a lot of helpers that have
been added since it was written, and is also missing quite a number of
features:

* Downstream port capability probing
* Extended DPRX cap parsing
* SINK_COUNT handling for hpd on dongles

Luckily for us - all of these are implemented in i915 already. Since
there's no reason for us to reinvent the wheel, and having more shared
code is always nice, I decided to take the opportunity to extract the
code for all of these features from i915 into a set of core DP helpers,
which both i915 and nouveau (and hopefully other drivers in the future)
can use.

As well, this patch series also addesses the other general
connector probing related issues I mentioned above, along with rewriting
how we handle MST probing so we don't hit any surprise locking design
issues in the future.

As a note - most of this work is motivated by the fact that I'm
planning on adding max_bpc/output_bpc prop support, DSC support (for
both MST and SST, along with proper helpers for handling bandwidth
limitations and DSC), and fallback link retraining. I figured I might as
clean this code up and implement missing DP features like the ones
mentioned here before moving on to those tasks.

Lyude Paul (20):
  drm/nouveau/kms: Fix some indenting in nouveau_dp_detect()
  drm/nouveau/kms/nv50-: Remove open-coded drm_dp_read_desc()
  drm/nouveau/kms/nv50-: Just use drm_dp_dpcd_read() in nouveau_dp.c
  drm/nouveau/kms/nv50-: Use macros for DP registers in nouveau_dp.c
  drm/nouveau/kms: Don't clear DP_MST_CTRL DPCD in nv50_mstm_new()
  drm/nouveau/kms: Search for encoders' connectors properly
  drm/nouveau/kms/nv50-: Use drm_dp_dpcd_(readb|writeb)() in
    nv50_sor_disable()
  drm/nouveau/kms/nv50-: Refactor and cleanup DP HPD handling
  drm/i915/dp: Extract drm_dp_read_mst_cap()
  drm/nouveau/kms: Use new drm_dp_read_mst_cap() helper for checking MST
    caps
  drm/nouveau/kms: Move drm_dp_cec_unset_edid() into
    nouveau_connector_detect()
  drm/nouveau/kms: Only use hpd_work for reprobing in HPD paths
  drm/i915/dp: Extract drm_dp_read_downstream_info()
  drm/nouveau/kms/nv50-: Use downstream DP clock limits for mode
    validation
  drm/i915/dp: Extract drm_dp_read_sink_count_cap()
  drm/i915/dp: Extract drm_dp_read_sink_count()
  drm/nouveau/kms/nv50-: Add support for DP_SINK_COUNT
  drm/nouveau/kms: Don't change EDID when it hasn't actually changed
  drm/i915/dp: Extract drm_dp_read_dpcd_caps()
  drm/nouveau/kms: Start using drm_dp_read_dpcd_caps()

 drivers/gpu/drm/drm_dp_helper.c             | 187 +++++++++++-
 drivers/gpu/drm/drm_dp_mst_topology.c       |  22 ++
 drivers/gpu/drm/i915/display/intel_dp.c     | 124 ++------
 drivers/gpu/drm/i915/display/intel_dp.h     |   1 -
 drivers/gpu/drm/i915/display/intel_lspcon.c |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/dac.c      |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c      |   7 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.c     |  24 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.h     |   4 +
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c   |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c   |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 305 +++++++++++---------
 drivers/gpu/drm/nouveau/nouveau_connector.c | 132 ++++-----
 drivers/gpu/drm/nouveau/nouveau_connector.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_display.c   |  72 ++++-
 drivers/gpu/drm/nouveau/nouveau_display.h   |   3 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c        | 210 +++++++++++---
 drivers/gpu/drm/nouveau/nouveau_drm.c       |   4 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h       |   2 +
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |  48 ++-
 include/drm/drm_dp_helper.h                 |  15 +-
 include/drm/drm_dp_mst_helper.h             |   3 +-
 22 files changed, 779 insertions(+), 393 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

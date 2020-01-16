Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CB513FB2A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 22:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037B26E2A3;
	Thu, 16 Jan 2020 21:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F5D6E2A3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 21:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579209404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=XYpBIn2xi7ER9BDGUkOZA9lOy9JYb1E+lxLSXL5KsV0=;
 b=eQNp5/MxMeVDUeh4PkZsLXJsQ7TnSNyj0KwqowD2wNTYzYksJ91edREQJbtsPtcx7ITa9d
 GbknWVIDKBcSBvWZwVK6P0OMMVJCSB36YDq1P3wLZxi4m3Mw+1nY6D9uCgyWrDwS/C/5mQ
 fiXe6gi7Ig3sI5XT9wtiBlmBCm9TmK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-8SE2qs9WOcOQW2T5IJLV-A-1; Thu, 16 Jan 2020 16:16:41 -0500
X-MC-Unique: 8SE2qs9WOcOQW2T5IJLV-A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E737184CACF;
 Thu, 16 Jan 2020 21:16:37 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-90.bss.redhat.com
 [10.20.1.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5142D60C63;
 Thu, 16 Jan 2020 21:16:35 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/5] drm/i915: eDP DPCD aux backlight fixes
Date: Thu, 16 Jan 2020 16:16:07 -0500
Message-Id: <20200116211623.53799-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I recently got a ThinkPad X1 Extreme 2nd Generation for fixing some
issues on, and noticed that out of the box the backlight doesn't work.
Along the way of fixing that, I found a few issues with how i915 handles
DPCD AUX backlight control and fixed them. Now I've got working
backlight controls, hooray!

Note that this patch series enables DPCD backlight controls by default.
This time however, we ignore the backlight type advertised in the VBT
(unless it's a custom backlight interface that doesn't use the standard
VESA interface over AUX) and just trust the DPCD.

Lyude Paul (5):
  drm/i915: Fix eDP DPCD aux max backlight calculations
  drm/i915: Assume 100% brightness when not in DPCD control mode
  drm/i915: Fix DPCD register order in intel_dp_aux_enable_backlight()
  drm/i915: Don't use VBT for detecting DPCD backlight controls
  drm/i915: Auto detect DPCD backlight support by default

 .../drm/i915/display/intel_display_types.h    |   3 +
 .../drm/i915/display/intel_dp_aux_backlight.c | 175 ++++++++++++------
 drivers/gpu/drm/i915/i915_params.c            |   2 +-
 drivers/gpu/drm/i915/i915_params.h            |   2 +-
 4 files changed, 126 insertions(+), 56 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

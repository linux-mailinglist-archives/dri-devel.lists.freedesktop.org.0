Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561FA1598B9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 19:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95CB6E12C;
	Tue, 11 Feb 2020 18:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BA36E13C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 18:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581446051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=L6sDU4tMPoI49wPdSUl0EfKYp+lvyu+SM87E9CYvdLk=;
 b=FUJlKgpdHUf5X6f4Pfxj/4o8syruJoxssbzwQxhlGxPOsIeQRcHlmLW0xGzrGLZImaIVkP
 XtilUFAloUb9deseG7tWAQ8Chn4mU8rbyk8LPD2DBeu/WKLEu/PcO1jRTA2lEaNm9nwk2p
 zQvXi8zQldYZGn3Z+YnW8qkIN46mRAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-S4JzFpgiPB2I_lM_BsLbXw-1; Tue, 11 Feb 2020 13:34:09 -0500
X-MC-Unique: S4JzFpgiPB2I_lM_BsLbXw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CBCE1922962;
 Tue, 11 Feb 2020 18:34:06 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8D5E5C11E;
 Tue, 11 Feb 2020 18:34:03 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/dp,
 i915: eDP DPCD backlight control detection fixes
Date: Tue, 11 Feb 2020 13:33:45 -0500
Message-Id: <20200211183358.157448-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unfortunately, it turned out that the DPCD is also not a reliable way of
probing for DPCD backlight support as some panels will lie and say they
have DPCD backlight controls when they don't actually.

So, revert back to the old behavior and add a bunch of EDID-based DP
quirks for the panels that we know need this. As you might have already
guessed, OUI quirks didn't seem to be a very safe bet for these panels
due to them not having their device IDs filled out.

Lyude Paul (3):
  drm/dp: Introduce EDID-based quirks
  drm/i915: Force DPCD backlight mode on X1 Extreme 2nd Gen 4K AMOLED
    panel
  drm/i915: Force DPCD backlight mode for some Dell CML 2020 panels

 drivers/gpu/drm/drm_dp_helper.c               | 79 +++++++++++++++++++
 drivers/gpu/drm/drm_dp_mst_topology.c         |  3 +-
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 11 ++-
 .../drm/i915/display/intel_dp_aux_backlight.c | 25 +++++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  2 +-
 include/drm/drm_dp_helper.h                   | 21 ++++-
 8 files changed, 130 insertions(+), 14 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

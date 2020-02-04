Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9F8152100
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 20:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E5E6E8D2;
	Tue,  4 Feb 2020 19:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30E06E8D2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 19:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580844521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xK7o2h0uCPzTn+BZp466NtcC29JdyGYqqZEyBuivOnc=;
 b=TtsMuv73+QiunvUHI+KsMxOZEiDxJpRebeAdupxR+PubLC0V4zUYgd1ZuTFBy8FU70IRHk
 A9P5yKZd1a42EXK/QFxqgAzC41Hi6ZMivtY7wb40srzX2UaVpXgPsDWyJ086QueSaCZIEX
 Kj1FkBVRhDWfX2Qalfl0jX107+TfDhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-gEqV_sM4PEmr472pFVoaeg-1; Tue, 04 Feb 2020 14:28:36 -0500
X-MC-Unique: gEqV_sM4PEmr472pFVoaeg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99ABA1005F73;
 Tue,  4 Feb 2020 19:28:33 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-90.bss.redhat.com
 [10.20.1.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40CF68068E;
 Tue,  4 Feb 2020 19:28:31 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/4] drm/dp,i915: eDP DPCD backlight control detection fixes
Date: Tue,  4 Feb 2020 14:28:08 -0500
Message-Id: <20200204192823.111404-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 linux-kernel@vger.kernel.org, Manasi Navare <manasi.d.navare@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
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

Lyude Paul (4):
  Revert "drm/i915: Don't use VBT for detecting DPCD backlight controls"
  drm/dp: Introduce EDID-based quirks
  drm/i915: Force DPCD backlight mode on X1 Extreme 2nd Gen 4K AMOLED
    panel
  drm/i915: Force DPCD backlight mode for some Precision 7750 panels

 drivers/gpu/drm/drm_dp_helper.c               | 78 +++++++++++++++++++
 drivers/gpu/drm/drm_dp_mst_topology.c         |  3 +-
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 11 ++-
 .../drm/i915/display/intel_dp_aux_backlight.c | 28 +++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  2 +-
 include/drm/drm_dp_helper.h                   | 21 ++++-
 8 files changed, 130 insertions(+), 16 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

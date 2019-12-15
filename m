Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6585B11F910
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2019 17:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1404D6E0F0;
	Sun, 15 Dec 2019 16:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C9E6E0F0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 16:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576427898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0xv0+3tSKNk/ps0C2flwuIl5hdVqRnVV8Q2tM73ssjw=;
 b=GC1ZhOuufuckqRfgWBmgFqKFi1hL/2gpuFaU0ctVJkge2Tprz0mjqo2j06fQxE6K793vOu
 r1cGH+cNKHtDpsCRmWDfvT/xO0Gn7Cnt2kC9M7gAWioaOeAkky1IG0yuw9tOLzkHhOLos/
 hSNREAKhzngQ3XY9rp6Egxip8GW+5yM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-5CKBZr4SNwe0EMgtsxAapA-1; Sun, 15 Dec 2019 11:38:16 -0500
X-MC-Unique: 5CKBZr4SNwe0EMgtsxAapA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30625477;
 Sun, 15 Dec 2019 16:38:14 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-49.ams2.redhat.com
 [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08C605D9C9;
 Sun, 15 Dec 2019 16:38:11 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/5] drm/i915/dsi: Control panel and backlight enable GPIOs
 from VBT
Date: Sun, 15 Dec 2019 17:38:05 +0100
Message-Id: <20191215163810.52356-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

This is a new (completely rewritten) version of my patches to make the
i915 code control the SoC panel- and backlight-enable GPIOs on Bay Trail
devices when the VBT indicates that the SoC should be used for backlight
control. This fixes the panel not lighting up on various devices when
booted with a HDMI monitor connected, in which case the firmware skips
initializing the panel as it inits the HDMI instead.

This series has been tested on; and fixes this issue on; the following models:

Peaq C1010
Point of View MOBII TAB-P800W
Point of View MOBII TAB-P1005W
Terra Pad 1061
Thundersoft TST178
Yours Y8W81

Linus, this series starts with the already discussed pinctrl change to
export the function to unregister a pinctrl-map. We can either merge this
through drm-intel, or you could pick it up and then provide an immutable
branch with it for merging into drm-intel-next. Which option do you prefer?

Lee, I know you don't like this, but unfortunately this series introcudes
some (other) changes to drivers/mfd/intel_soc_pmic_core.c. The GPIO subsys
allows only one mapping-table per consumer, so in hindsight adding the code
which adds the mapping for the PMIC panel-enable pin to the PMIC mfd driver
was a mistake, as the PMIC code is a provider where as mapping-tables are
per consumer. The 4th patch fixes this by moving the mapping-table to the
i915 code, so that we can also add mappings for some of the pins on the SoC
itself. Since this whole series makes change to the i915 code I plan to
merge this mfd change to the drm-intel tree.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

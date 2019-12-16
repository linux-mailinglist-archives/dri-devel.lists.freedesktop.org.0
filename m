Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15229121B33
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 21:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3AC6E88E;
	Mon, 16 Dec 2019 20:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89D36E88B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 20:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576529488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=q4pspJCdzJHL0VVXVauT76J/4/qmwgwoup+ryPsQ0H4=;
 b=G7iKu4nmPZEDltb8UwJjxSc8ndcHuWKvYSNc2XPv9c/JdEI+AcECGs6Ic9eQ29V8nGPsrv
 ymZpEHMhI7OsPR2m+3sGjmgau4sTNkmDB0OOAS/wg039NB4qP4FOthO3gQaE0Oiw8lXNnG
 2IP2eiVaiuuPvtA1mYTEkeHzBiSV5s0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-YXQNXfcXNxil1ya8_5vNkA-1; Mon, 16 Dec 2019 15:51:27 -0500
X-MC-Unique: YXQNXfcXNxil1ya8_5vNkA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A269C189DF47;
 Mon, 16 Dec 2019 20:51:25 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 712741001B00;
 Mon, 16 Dec 2019 20:51:23 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/5] drm/i915/dsi: Control panel and backlight enable GPIOs
 from VBT
Date: Mon, 16 Dec 2019 21:51:17 +0100
Message-Id: <20191216205122.1850923-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Here is v2 of my patch-series to make the
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

Linus the main change in v2 is the discussed fixing of the patch to
export pinctrl_unregister_mappings. Can you please provide a new
immutable branch with the new version (assuming the new version is ok)?

Another change on the version is the use of intel_dsi_get_hw_state() to
check if the panel is on instead of relying on the current_mode pointer
in "[PATCH v2 3/5] drm/i915/dsi: Init panel-enable GPIO to low when the
LCD is initially off (v2)".

Other then that there are some small style tweaks addressing comments
from Andy and Ville.

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

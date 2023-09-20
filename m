Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECF77A8D31
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 21:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5623A10E549;
	Wed, 20 Sep 2023 19:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D93810E546
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 19:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695239786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LSQ9IydGm9rFExCMlIfDXR8MiIrP+KlxGlrDrc1PXPI=;
 b=WrWAjAd3f0jxy1K33b4UK/yOhw6zU3nrcBZNScrdK8YzZNqt+P7Y1+J3VdwKcRFxUPc9sh
 WuA2FFfLru8pxNv7K3WAV93oHPvZ7B7An1eNVyw8ZaW40LKbTLemfYfMWaD+Cr/vojNyFH
 oDWHCk+FbH7+Q+gePwvEug+jBWP+twA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-zZcoMJetMg-poMqddeegAA-1; Wed, 20 Sep 2023 15:56:23 -0400
X-MC-Unique: zZcoMJetMg-poMqddeegAA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2836D85A5BE;
 Wed, 20 Sep 2023 19:56:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED0ACC154CA;
 Wed, 20 Sep 2023 19:56:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 0/4] drm/i915/vlv_dsi: Add quirks for x86 android tablets (v3)
Date: Wed, 20 Sep 2023 21:56:09 +0200
Message-ID: <20230920195613.304091-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Some vlv/chv tablets ship with Android as factory OS. The factory OS
BSP style kernel on these tablets does not use the normal x86 hw
autodetection instead it hardcodes a whole bunch of things including
using panel drivers instead of relying on VBT MIPI sequences to
turn the panel/backlight on/off.

The normal i915 driver (which does not use panel drivers) mostly works
since the VBT still needs to contain valid info for the GOP, but because
of the Android kernel relying on panel drivers with various things
hardcoded some DMI quirks are necessary to fix some issues on these
devices.

Some of these issues also are related to which I2C bus to use for
MIPI sequence elements which do I2C transfers. This series also
includes a patch adding some extra debugging to mipi_exec_i2c() to
help with debugging similar issues in the future.

These patches have been posted before but back then I did not get around
to follow up on the series:
https://lore.kernel.org/intel-gfx/20220225214934.383168-1-hdegoede@redhat.com/

v2:
- Drop the changes how the I2C bus number is found, instead just have
  the quirks set the right number directly where necessary. This should
  avoid any chances of causing regressions on devices where the quirks
  do not apply.
- New quirk for backlight control issues on Lenovo Yoga Tab 3
- Address Jani Nikula's remark about __func__ being redundant when using
  drm_dbg_kms()

v3:
- File 3 gitlab issues with drm.debug=0xe dmesg output, VBT dump for all
  3 affected models. Add Closes: tags with links to gitlab issues

Regards,

Hans


Hans de Goede (4):
  drm/i915/vlv_dsi: Add DMI quirk for wrong panel modeline in BIOS on
    Asus TF103C (v3)
  drm/i915/vlv_dsi: Add DMI quirk for wrong I2C bus and panel size on
    Lenovo Yoga Tablet 2 series (v3)
  drm/i915/vlv_dsi: Add DMI quirk for backlight control issues on Lenovo
    Yoga Tab 3 (v2)
  drm/i915/dsi: Add some debug logging to mipi_exec_i2c (v2)

 drivers/gpu/drm/i915/display/intel_dsi_vbt.c |   3 +
 drivers/gpu/drm/i915/display/vlv_dsi.c       | 124 +++++++++++++++++++
 2 files changed, 127 insertions(+)

-- 
2.41.0


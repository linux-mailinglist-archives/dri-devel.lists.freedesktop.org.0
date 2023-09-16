Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 517257A3054
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 14:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257D710E100;
	Sat, 16 Sep 2023 12:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8046710E0EE
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 12:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694868901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tHrsxnSCmL+04jBN9QFDxpYu8BoUyZMMJai44HfNJwE=;
 b=CYETs/4+umFMkXnnBphIGBquxS+zC4n0NaTjCfWxb2fCilPZZO6JMZyt+UfslNYylQF825
 rj/LKvBlN4bBnidzxZfe53gYz/t4rr+ze2OQnUEkqz3QCgyIJDJRdjHfM5cMUCvWgdaNHq
 XIRs5rGDgIcqRNoMWDluEz4XmHlsMHM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-atdXI9OkOv6eXRhHtUclFg-1; Sat, 16 Sep 2023 08:54:58 -0400
X-MC-Unique: atdXI9OkOv6eXRhHtUclFg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53B41811E7B;
 Sat, 16 Sep 2023 12:54:57 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3854840C6EA8;
 Sat, 16 Sep 2023 12:54:56 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH 0/4] drm/i915/vlv_dsi: Add quirks for x86 android tablets (v2)
Date: Sat, 16 Sep 2023 14:54:51 +0200
Message-ID: <20230916125455.237325-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Changes compared to this old version:
- Drop the changes how the I2C bus number is found, instead just have
  the quirks set the right number directly where necessary. This should
  avoid any chances of causing regressions on devices where the quirks
  do not apply.

- New quirk for backlight control issues on Lenovo Yoga Tab 3

- Address Jani Nikula's remark about __func__ being redundant when using
  drm_dbg_kms()


Regards,

Hans



Hans de Goede (4):
  drm/i915/vlv_dsi: Add DMI quirk for wrong panel modeline in BIOS on
    Asus TF103C (v2)
  drm/i915/vlv_dsi: Add DMI quirk for wrong I2C bus and panel size on
    Lenovo Yoga Tablet 2 series (v2)
  drm/i915/vlv_dsi: Add DMI quirk for backlight control issues on Lenovo
    Yoga Tab 3
  drm/i915/dsi: Add some debug logging to mipi_exec_i2c (v2)

 drivers/gpu/drm/i915/display/intel_dsi_vbt.c |   3 +
 drivers/gpu/drm/i915/display/vlv_dsi.c       | 124 +++++++++++++++++++
 2 files changed, 127 insertions(+)

-- 
2.41.0


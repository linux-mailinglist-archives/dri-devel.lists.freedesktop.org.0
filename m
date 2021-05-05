Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E6E373F8C
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 18:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B656F6EB5E;
	Wed,  5 May 2021 16:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854AC6EB5E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620231864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3EhU4OEfah1XGTcRkhD0WUD+XZJT95s2WFsG7w+GL7s=;
 b=EwyEF/fth4Rp65jc077ykMj+73s1uA7UrAqDphmi5oLG0RoLMW7DI11QLgsOR6kRDtBYLV
 grTRqDOe2oZUeHnu3be63k0siGPMO/B7fqIKPSK2w97LRcrDBXtEPerfjiYoFT4G0AsnFt
 3xA2+REKrthDnFUsboIbqXGhbH/D0tQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-FHrWcxalPPawy4qYtKbw8A-1; Wed, 05 May 2021 12:24:23 -0400
X-MC-Unique: FHrWcxalPPawy4qYtKbw8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 125D919251A4;
 Wed,  5 May 2021 16:24:21 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-71.ams2.redhat.com [10.36.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4621A5C5B5;
 Wed,  5 May 2021 16:24:16 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Imre Deak <imre.deak@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 0/8] drm + usb-type-c: Add support for out-of-band hotplug
 notification (v3)
Date: Wed,  5 May 2021 18:24:07 +0200
Message-Id: <20210505162415.531876-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 intel-gfx <intel-gfx@lists.freedesktop.org>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Here is v3 of my patchset making DP over Type-C work on devices where the
Type-C controller does not drive the HPD pin on the GPU, but instead
we need to forward HPD events from the Type-C controller to the DRM driver.

Changes in v3:
- Base on top of latest drm-tip, which should fix the CI being unable to
  apply (and thus to test) the patches
- Make intel_acpi_assign_connector_fwnodes() take a ref on the fwnode
  it stores in connector->fwnode and have drm_connector_cleanup() put
  this reference
- Drop data argument from drm_connector_oob_hotplug_event()
- Make the Type-C DP altmode code only call drm_connector_oob_hotplug_event()
  when the HPD bit in the status vdo changes
- Drop the platform/x86/intel_cht_int33fe: Correct "displayport" fwnode
  reference patch, this will be merged independently through the pdx86 tree

Changes in v2:
- Replace the bogus "drm/connector: Make the drm_sysfs connector->kdev
  device hold a reference to the connector" patch with:
  "drm/connector: Give connector sysfs devices there own device_type"
  the new patch is a dep for patch 2/9 see the patches

- Stop using a class-dev-iter, instead at a global connector list
  to drm_connector.c and use that to find the connector by the fwnode,
  similar to how we already do this in drm_panel.c and drm_bridge.c

- Make drm_connector_oob_hotplug_event() take a fwnode pointer as
  argument, rather then a drm_connector pointer and let it do the
  lookup itself. This allows making drm_connector_find_by_fwnode() a
  drm-internal function and avoids code outside the drm subsystem
  potentially holding on the a drm_connector reference for a longer
  period.

This series not only touches drm subsys files but it also touches
drivers/usb/typec/altmodes/typec_displayport.c, that file usually
does not see a whole lot of changes. So I believe it would be best
to just merge the entire series through drm-misc, Assuming we can
get an ack from Greg for merging the typec_displayport.c changes
this way.

Regards,

Hans


Hans de Goede (7):
  drm/connector: Give connector sysfs devices there own device_type
  drm/connector: Add a fwnode pointer to drm_connector and register with
    ACPI (v2)
  drm/connector: Add drm_connector_find_by_fwnode() function (v2)
  drm/connector: Add support for out-of-band hotplug notification (v3)
  drm/i915/dp: Add support for out-of-bound hotplug events
  usb: typec: altmodes/displayport: Make dp_altmode_notify() more
    generic
  usb: typec: altmodes/displayport: Notify drm subsys of hotplug events

Heikki Krogerus (1):
  drm/i915: Associate ACPI connector nodes with connector entries (v2)

 drivers/gpu/drm/drm_connector.c              | 79 ++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h          |  1 +
 drivers/gpu/drm/drm_sysfs.c                  | 87 +++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_acpi.c    | 46 +++++++++++
 drivers/gpu/drm/i915/display/intel_acpi.h    |  3 +
 drivers/gpu/drm/i915/display/intel_display.c |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c      | 12 +++
 drivers/usb/typec/altmodes/Kconfig           |  1 +
 drivers/usb/typec/altmodes/displayport.c     | 58 ++++++++-----
 include/drm/drm_connector.h                  | 25 ++++++
 10 files changed, 278 insertions(+), 35 deletions(-)

-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

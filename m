Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9D0371843
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 17:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D612D6E8CE;
	Mon,  3 May 2021 15:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29836E8C8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 15:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620056818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mu6XG45KFRW/fQQiVN4KYt8IYAlebpPIH/GecaPst0Q=;
 b=MtbNkvBeUVPM739K2EBE3uPLL94HfBfiTxhrYREUpWKeSuQVfxp6GdKiw+kvDfLfDgqd1K
 I75B+rAWiQQRShEfGhTodTPmOclCii9BRgp4kAxwue7KgO4uZJIo6DoEh9BKYvTjpCpAu6
 orKIR7MYiuEtdBF9z7NimqDe9LhYXQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-zBshJR2aOVKXfw_nm_1nvQ-1; Mon, 03 May 2021 11:46:54 -0400
X-MC-Unique: zBshJR2aOVKXfw_nm_1nvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C576802575;
 Mon,  3 May 2021 15:46:52 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-158.ams2.redhat.com [10.36.112.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3B2E1007610;
 Mon,  3 May 2021 15:46:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 0/9] drm + usb-type-c: Add support for out-of-band hotplug
 notification (v2)
Date: Mon,  3 May 2021 17:46:38 +0200
Message-Id: <20210503154647.142551-1-hdegoede@redhat.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Here is v2 of my work on making DP over Type-C work on devices where the
Type-C controller does not drive the HPD pin on the GPU, but instead
we need to forward HPD events from the Type-C controller to the DRM driver.

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

### 

As already mentioned in the v1 cover-letter this series replaces
a previous attempt from quite some time ago. 
For anyone interested here are the old (2019!) patches for this:

https://patchwork.freedesktop.org/patch/288491/
https://patchwork.freedesktop.org/patch/288493/
https://patchwork.freedesktop.org/patch/288495/

Last time I posted this the biggest change requested was for more info to
be included in the event send to the DRM-subsystem, specifically sending
the following info was requested:

1. Which DP connector on the GPU the event is for
2. How many lanes are available
3. Connector orientation

This series is basically an entirely new approach, which no longer
uses the notifier framework at all. Instead the Type-C code looksup
a connector based on a fwnode (this was suggested by Heikki Krogerus)
and then calls a new oob_hotplug_event drm_connector_func directly
on the connector, passing the requested info as argument.

Info such as the orientation and the number of dp-lanes is now passed
to the drm_connector_oob_hotplug_event() function as requested in the
review of the old code, but nothing is done with it for now.
Using this info falls well outside of my knowledge of the i915 driver
so this is left to a follow-up patch (I will be available to test
patches for this).

Regards,

Hans


Hans de Goede (8):
  drm/connector: Give connector sysfs devices there own device_type
  drm/connector: Add a fwnode pointer to drm_connector and register with
    ACPI
  drm/connector: Add drm_connector_find_by_fwnode() function (v2)
  drm/connector: Add support for out-of-band hotplug notification (v2)
  drm/i915/dp: Add support for out-of-bound hotplug events
  usb: typec: altmodes/displayport: Make dp_altmode_notify() more
    generic
  usb: typec: altmodes/displayport: Notify drm subsys of hotplug events
  platform/x86/intel_cht_int33fe: Correct "displayport" fwnode reference

Heikki Krogerus (1):
  drm/i915: Associate ACPI connector nodes with connector entries

 drivers/gpu/drm/drm_connector.c               | 79 +++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h           |  1 +
 drivers/gpu/drm/drm_sysfs.c                   | 87 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_acpi.c     | 40 +++++++++
 drivers/gpu/drm/i915/display/intel_acpi.h     |  3 +
 drivers/gpu/drm/i915/display/intel_display.c  |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 13 +++
 .../platform/x86/intel_cht_int33fe_typec.c    |  4 +-
 drivers/usb/typec/altmodes/Kconfig            |  1 +
 drivers/usb/typec/altmodes/displayport.c      | 73 +++++++++++-----
 include/drm/drm_connector.h                   | 43 +++++++++
 11 files changed, 308 insertions(+), 37 deletions(-)

-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

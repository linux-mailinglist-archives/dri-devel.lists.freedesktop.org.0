Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FED39C0A9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 21:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FFE6E151;
	Fri,  4 Jun 2021 19:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4296E151
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 19:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622836129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/Oq3crxGcu8BCiHyspLNPjUA4QSzXEeZmDdS/L3KIEY=;
 b=YsKyHcAfxaB9ghL+9o7LRnR8zZ2eIHdyWSMDxA91Fe/Yl5nrQxyfLAwDM7p5eBp3s3hJep
 rochJTDouw7QUrKxhqHAlQn+X0y68ARSgnrnRG8KDeY9SstmmQsIEUgIUvEwYUS5X3ambW
 nLyTLLJcJktfH0IdAlqLPn7zNduE3yA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-5HbFtEdJMwiBpEQlW5yHJw-1; Fri, 04 Jun 2021 15:48:47 -0400
X-MC-Unique: 5HbFtEdJMwiBpEQlW5yHJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EE0E8186E5;
 Fri,  4 Jun 2021 19:48:45 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7D4E189CE;
 Fri,  4 Jun 2021 19:48:41 +0000 (UTC)
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
 notification (v4)
Date: Fri,  4 Jun 2021 21:48:32 +0200
Message-Id: <20210604194840.14655-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here is v3 of my patchset making DP over Type-C work on devices where the
Type-C controller does not drive the HPD pin on the GPU, but instead
we need to forward HPD events from the Type-C controller to the DRM driver.

Changes in v4:
- Rebase on top of latest drm-tip
- Add forward declaration for struct fwnode_handle to drm_crtc_internal.h
  (fixes warning reported by kernel test robot <lkp@intel.com>)
- Add Heikki's Reviewed-by to patch 7 & 8
- Add Heikki's Tested-by to the series

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
  drm/connector: Add drm_connector_find_by_fwnode() function (v3)
  drm/connector: Add support for out-of-band hotplug notification (v3)
  drm/i915/dp: Add support for out-of-bound hotplug events
  usb: typec: altmodes/displayport: Make dp_altmode_notify() more
    generic
  usb: typec: altmodes/displayport: Notify drm subsys of hotplug events

Heikki Krogerus (1):
  drm/i915: Associate ACPI connector nodes with connector entries (v2)

 drivers/gpu/drm/drm_connector.c              | 79 ++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h          |  2 +
 drivers/gpu/drm/drm_sysfs.c                  | 87 +++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_acpi.c    | 46 +++++++++++
 drivers/gpu/drm/i915/display/intel_acpi.h    |  3 +
 drivers/gpu/drm/i915/display/intel_display.c |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c      | 12 +++
 drivers/usb/typec/altmodes/Kconfig           |  1 +
 drivers/usb/typec/altmodes/displayport.c     | 58 ++++++++-----
 include/drm/drm_connector.h                  | 25 ++++++
 10 files changed, 279 insertions(+), 35 deletions(-)

-- 
2.31.1


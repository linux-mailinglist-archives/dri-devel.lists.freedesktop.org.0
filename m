Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE53135F705
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 17:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C756E92A;
	Wed, 14 Apr 2021 15:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BF86E92A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 15:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618413062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KeYwEf+mpEoK4qCRvXVhcHaaZfKB7ES3iMBylnvUcVc=;
 b=RJgeT+CtaQn/CVbr/VK+uk/9fhvs/+eT0OC9cDBSyb2cOSgTePQUFx0KPdHwYGuFw51Doi
 E3IvjpJVMSiF9XEPUNfbLS42UbJoRatVPPn3Yju/mdPG4VY/x7ZBtDuYN4IegjJUV1nl8D
 1AtO0i6wH55nvX7YeFZ/5oeIfxpDLio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-_-lplF7CN5egNHGbY4zXcw-1; Wed, 14 Apr 2021 11:10:58 -0400
X-MC-Unique: _-lplF7CN5egNHGbY4zXcw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B872100A621;
 Wed, 14 Apr 2021 15:10:55 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-168.ams2.redhat.com [10.36.112.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DCAE5D6A8;
 Wed, 14 Apr 2021 15:10:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Rajat Jain <rajatja@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Gross <mgross@linux.intel.com>,
 Andy Shevchenko <andy@infradead.org>
Subject: [PATCH resend 0/9] drm: Add privacy-screen class and connector
 properties
Date: Wed, 14 Apr 2021 17:10:40 +0200
Message-Id: <20210414151049.95828-1-hdegoede@redhat.com>
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
Cc: Marco Trevisan <marco.trevisan@canonical.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sebastien Bacher <seb128@ubuntu.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Mark Pearson <markpearson@lenovo.com>,
 Mario Limonciello <mario.limonciello@outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Here is the privacy-screen related code which I last posted in August
of last year. To the best of my knowledge there is consensus about /
everyone is in agreement with the new userspace API (2 connector properties)
this patch-set add (patch 1 of the series).

The blocker the last time was that there were no userspace users of
the new properties and as a rule we don't add new drm userspace API
without users.

There now is GNOME userspace code using the new properties:
https://hackmd.io/@3v1n0/rkyIy3BOw

The new API works as designed for this userspace user and the branches
mentioned at the above link add the following features to GNOME:

1. Showing an OSD notification when the privacy-screen is toggled on/off
   through hotkeys handled by the embedded-controller
2. Allowing control of the privacy-screen from the GNOME control-panel,
   including the on/off slider shown there updating to match the hw-setting
   when the setting is changed with the control-panel open.
3. Restoring the last user-setting at login

This series consists of a number of different parts:

1. A new version of Rajat's privacy-screen connector properties patch,
this adds new userspace API in the form of new properties

2. Since on most devices the privacy screen is actually controlled by
some vendor specific ACPI/WMI interface which has a driver under
drivers/platform/x86, we need some "glue" code to make this functionality
available to KMS drivers. Patches 2-4 add a new privacy-screen class for
this, which allows non KMS drivers (and possibly KMS drivers too) to
register a privacy-screen device and also adds an interface for KMS drivers
to get access to the privacy-screen associated with a specific connector.
This is modelled similar to how we deal with e.g. PWMs and GPIOs in the
kernel, including separate includes for consumers and providers(drivers).

3. Some drm_connector helper functions to keep the actual changes needed
for this in individual KMS drivers as small as possible (patch 5).

4. Make the thinkpad_acpi code register a privacy-screen device on
ThinkPads with a privacy-screen (patches 6-8)

5. Make the i915 driver export the privacy-screen functionality through
the connector properties on the eDP connector.

I believe that it would be best to merge the entire series, including
the thinkpad_acpi changes through drm-misc in one go. As the pdx86
subsys maintainer I hereby give my ack for merging the thinkpad_acpi
changes through drm-misc.

There is one small caveat with this series, which it is good to be
aware of. The i915 driver will now return -EPROBE_DEFER on Thinkpads
with an eprivacy screen, until the thinkpad_acpi driver is loaded.
This means that initrd generation tools will need to be updated to
include thinkpad_acpi when the i915 driver is added to the initrd.
Without this the loading of the i915 driver will be delayed to after
the switch to real rootfs.

Regards,

Hans


Hans de Goede (8):
  drm: Add privacy-screen class
  drm/privacy-screen: Add X86 specific arch init code
  drm/privacy-screen: Add notifier support
  drm/connector: Add a drm_connector privacy-screen helper functions
  platform/x86: thinkpad_acpi: Add hotkey_notify_extended_hotkey()
    helper
  platform/x86: thinkpad_acpi: Get privacy-screen / lcdshadow ACPI
    handles only once
  platform/x86: thinkpad_acpi: Register a privacy-screen device
  drm/i915: Add privacy-screen support

Rajat Jain (1):
  drm/connector: Add support for privacy-screen properties (v4)

 Documentation/gpu/drm-kms-helpers.rst        |  15 +
 Documentation/gpu/drm-kms.rst                |   2 +
 MAINTAINERS                                  |   8 +
 drivers/gpu/drm/Kconfig                      |   5 +
 drivers/gpu/drm/Makefile                     |   4 +
 drivers/gpu/drm/drm_atomic_uapi.c            |   4 +
 drivers/gpu/drm/drm_connector.c              | 214 ++++++++
 drivers/gpu/drm/drm_privacy_screen.c         | 493 +++++++++++++++++++
 drivers/gpu/drm/drm_privacy_screen_x86.c     |  82 +++
 drivers/gpu/drm/i915/display/intel_display.c |   5 +
 drivers/gpu/drm/i915/display/intel_dp.c      |  10 +
 drivers/gpu/drm/i915/i915_pci.c              |  12 +
 drivers/platform/x86/Kconfig                 |   1 +
 drivers/platform/x86/thinkpad_acpi.c         | 131 +++--
 include/drm/drm_connector.h                  |  56 +++
 include/drm/drm_privacy_screen_consumer.h    |  32 ++
 include/drm/drm_privacy_screen_driver.h      |  84 ++++
 include/drm/drm_privacy_screen_machine.h     |  46 ++
 18 files changed, 1162 insertions(+), 42 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_privacy_screen.c
 create mode 100644 drivers/gpu/drm/drm_privacy_screen_x86.c
 create mode 100644 include/drm/drm_privacy_screen_consumer.h
 create mode 100644 include/drm/drm_privacy_screen_driver.h
 create mode 100644 include/drm/drm_privacy_screen_machine.h

-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

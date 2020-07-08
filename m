Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA48A218D49
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 18:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C328C6E179;
	Wed,  8 Jul 2020 16:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEF96E560
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 16:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594226624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0BHHvMU3Cp8lzzI95VEIg9wkjEjV2TgJ/DE7ee2ilTk=;
 b=esfXwmuZeEBFdaGBNTEKfB9K+jx7TErwDyfPOnV6/Q3ZZfPKBa1hmIPZ0MBw3CtP/9qeFN
 yfNTklJUrV9yIDCfeDrIs/5bIqQdFFp0xXaU+rLHxeoW9Z1OwjXb5NpgdaVWhCtHRlHG3D
 o/tjzdwNA1u/mJUBZNpcLs8thfEdv3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-37oAdJkNNJeSDn_WsU2SwA-1; Wed, 08 Jul 2020 12:43:42 -0400
X-MC-Unique: 37oAdJkNNJeSDn_WsU2SwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 438FC1083;
 Wed,  8 Jul 2020 16:43:40 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-5.ams2.redhat.com [10.36.112.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C754D79229;
 Wed,  8 Jul 2020 16:43:36 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/9] drm: Add privacy-screen class and connector properties
Date: Wed,  8 Jul 2020 18:43:26 +0200
Message-Id: <20200708164335.25097-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Sebastien Bacher <seb128@ubuntu.com>,
 Marco Trevisan <marco.trevisan@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Here is the privacy-screen related code which we discussed a while ago.
This series consists of a number of different parts:

1. A new version of Rajat's privacy-screen connector properties patch,
this adds new userspace API in the form of new properties

2. Since on most devices the privacy screen is actually controlled by
some vendor specific ACPI/WMI interface which has a driver under
drivers/platform/x86, we need some "glue" code to make this functionality
available to KMS drivers. Patches 3-5 add a new privacy-screen class for
this, which allows non KMS drivers (and possibly KMS drivers too) to
register a privacy-screen device and also adds an interface for KMS drivers
to get access to the privacy-screen associated with a specific connector.
This is modelled similar to how we deal with e.g. PWMs and GPIOs in the
kernel, including separate includes for consumers and providers(drivers).

3. Some drm_connector helper functions to keep the actual changes needed
for this in individual KMS drivers as small as possible (patch 6).

4. Make the thinkpad_acpi code register a privacy-screen device on
ThinkPads with a privacy-screen (patches 7-8)

5. Make the i915 driver export the privacy-screen functionality through
the connector properties on the eDP connector.

I was a bit in doubt if I should calls this series a RFC, or just call
it v1, since there is no real userspace code using this yet. It was
tested using xrandr property access and udevadm event monitoring.
I do expect / hope we will have patches for a userspace consumer of the
new properties (mutter) ready soon.

But since the code is completely ready, including API documentation,
I've decided to just call this v1. Hopefully we can get patches for the
first userspace consumer of this ready during the review of this.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

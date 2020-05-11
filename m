Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB0E1CE1FC
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 19:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673F26E51C;
	Mon, 11 May 2020 17:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7346E51C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 17:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589219261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5jaY4tWfBZCT11klW8iNUU8mY6MUMP48zEJY/zwOZG4=;
 b=USvl0d+0vmoEdTp/TVR88ywymZwD5uiiv6Qq2L75cbkl6Lk7hCBRaSjU79w69zbKH/PpER
 4w0yT3uOs1Wrv7gpiw/sz2llwQ20wM7AeCNLXMv/yM6pTMORScFwYWp2oHeTFu5PtRajNh
 4nueR1bdOjpsUJrS+Zn/qrS+gSEXzUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-a1e07HvDMzOaJfUyhRRZrQ-1; Mon, 11 May 2020 13:47:31 -0400
X-MC-Unique: a1e07HvDMzOaJfUyhRRZrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89BAF8005B7;
 Mon, 11 May 2020 17:47:29 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-126.ams2.redhat.com
 [10.36.112.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B20595D9DC;
 Mon, 11 May 2020 17:47:25 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Rajat Jain <rajatja@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [RFC v2 0/1] drm/connector: Add support for privacy-screen properties
Date: Mon, 11 May 2020 19:47:23 +0200
Message-Id: <20200511174724.21512-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Sonny.Quintanilla@dell.com, Mario Limonciello <mario.limonciello@dell.com>,
 Jared Dominguez <jaredz@redhat.com>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Mark Pearson <mpearson@lenovo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

This RFC takes Rajat's earlier patch for adding privacy-screen properties
infra to drm_connector.c and then adds the results of the discussion from
the "RFC: Drm-connector properties managed by another driver / privacy
screen support" mail thread on top, hence the v2.

The most important thing here is big kernel-doc comment which gets added in
the first patch-chunk modifying drm_connector.c, this summarizes, or at
least tries to summarize, the conclusions of our previous discussion on
the userspace API and lays down the ground rules for how the 2 new
"privacy-screen sw-state" and  "privacy-screen hw-state" properties are
to be used both from the driver side as well as from the userspace side.

Other then that this modifies Rajat's patch to add 2 properties instead
of one, without much other changes.

Rajat, perhaps you can do a new version of your patch-set integration /
using this version of the properties and then if everyone is ok with
the proposed userspace API Jani can hopefully merge the whole set
through the i915 tree sometime during the 5.9 cycle.

Regards,

Hans

p.s.

I plan to start working on the lcdshadow subsystem next. As discussed the
plan for this subsystem is to allow drivers outside of the DRM subsys, such
as for example the thinkpad_acpi driver, to register a lcdshadow device,
which DRM drivers can then get a reference to and use to implement these
properties.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

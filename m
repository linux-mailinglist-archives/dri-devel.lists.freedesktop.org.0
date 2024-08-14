Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26060952268
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 21:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0AA10E51E;
	Wed, 14 Aug 2024 19:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DrtyS5eG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A008F10E51E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 19:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723662144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=sCzm2W6O4T8GkztKRcrottopCG1C6+IdUKb3GyWFWZU=;
 b=DrtyS5eG8tMKthd5LWppYWIKweOiiAu2BEty7+I1sBpnBGJPk8cafPEc90wqWP3uy1CS7u
 btysnhcCv5g6W+VSr6cAgIgdO3VmOPCmnNSbOvblSpxnLLu/9RJ//LN0dpS9kRYe8+vZmJ
 CF3JvYlPdBV62VqFNsZdNGFr41VSktg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-191-cu-_gS2zO0SWi46f11Rezw-1; Wed,
 14 Aug 2024 15:02:04 -0400
X-MC-Unique: cu-_gS2zO0SWi46f11Rezw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 45D6718EB232; Wed, 14 Aug 2024 19:02:03 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.22])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 351A319560AA; Wed, 14 Aug 2024 19:02:00 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/3] ACPI/video / platform/x86: Add backlight=native quirk for
 Dell OptiPlex 7760 AIO
Date: Wed, 14 Aug 2024 21:01:56 +0200
Message-ID: <20240814190159.15650-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rafael,

6.10 has a new backlight driver for UART attached backlight controller
boards found in some Dell All in One models.

Now the first AIO has turned up which has not only the DSDT bits for this,
but also an actual controller attached to the UART, yet it is not using
this controller for backlight control (it needs GPU native control).

I did not tie the dell-uart-backlight into acpi_video_get_backlight_type()
yet, so the first 2 patches in this series deal with that and the third
patch adds a DMI quirk to select native backlight control on top.

Backlight control used to work on the Dell OptiPlex 7760 AIO with kernel
6.9 and older, so this is a regression and I would like to see this
series merged as fixes for 6.11.

Rafael, the drivers/platform/x86/dell/dell-uart-backlight.c are small
and isolated. So I believe it is best if you take the entire series,
to avoid conflicts if any other drivers/apci/video_detect.c DMI quirks
show up this cycle.

Regards,

Hans


Hans de Goede (3):
  ACPI: video: Add Dell UART backlight controller detection
  platform/x86: dell-uart-backlight: Use acpi_video_get_backlight_type()
  ACPI: video: Add backlight=native quirk for Dell OptiPlex 7760 AIO

 drivers/acpi/video_detect.c                   | 22 +++++++++++++++++++
 drivers/platform/x86/dell/Kconfig             |  1 +
 .../platform/x86/dell/dell-uart-backlight.c   |  8 +++++++
 include/acpi/video.h                          |  1 +
 4 files changed, 32 insertions(+)

-- 
2.46.0


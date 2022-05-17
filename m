Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D8252A641
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 17:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2562E112DF9;
	Tue, 17 May 2022 15:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5396E112CAF
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 15:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652801048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ngme+KBZsio7L3hgMjmFvUQ3vX2ypuHKRmCzfY/wkz4=;
 b=E01bNjPm0yuAckyNGR+4BgeZVGGvkELGv9YsBBFrN2TVeV4a++r69QDSSEYPyfzB9cuGk3
 JYz2QqDLm64hS7nw7EcWTYT+1vvF8rFT+vhpBSBiah9fEsdNep+RflXqVRPXrNZOcJIuIZ
 GNQp5f4qCCYunrvLTPGZN9JviN4pK6Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-SiHUwUMWNcCW_I5X6sC0Yw-1; Tue, 17 May 2022 11:24:05 -0400
X-MC-Unique: SiHUwUMWNcCW_I5X6sC0Yw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A058A803B22;
 Tue, 17 May 2022 15:24:02 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22B79C15D70;
 Tue, 17 May 2022 15:23:59 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
	Daniel Dadap <ddadap@nvidia.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>
Subject: [PATCH 06/14] ACPI: video: Drop backlight_device_get_by_type() call
 from acpi_video_get_backlight_type()
Date: Tue, 17 May 2022 17:23:23 +0200
Message-Id: <20220517152331.16217-7-hdegoede@redhat.com>
In-Reply-To: <20220517152331.16217-1-hdegoede@redhat.com>
References: <20220517152331.16217-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: linux-acpi@vger.kernel.org, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, amd-gfx@lists.freedesktop.org,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that all kms drivers which register native/BACKLIGHT_RAW type backlight
devices on x86/ACPI boards call acpi_video_get_backlight_type(true), with
the native=true value getting cached, there no longer is a need to call
backlight_device_get_by_type(BACKLIGHT_RAW) to see if a native backlight
device is available.

Relying on the cached native_available value not only is simpler, it will
also work correctly in cases where then native backlight registration was
skipped because of the acpi_video_get_backlight_type() return value.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/video_detect.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index 0a06f0edd298..6caabdf189c9 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -586,8 +586,7 @@ enum acpi_backlight_type acpi_video_get_backlight_type(bool native)
 	if (!(video_caps & ACPI_VIDEO_BACKLIGHT))
 		return acpi_backlight_vendor;
 
-	if (acpi_osi_is_win8() &&
-	    (native_available || backlight_device_get_by_type(BACKLIGHT_RAW)))
+	if (acpi_osi_is_win8() && native_available)
 		return acpi_backlight_native;
 
 	return acpi_backlight_video;
-- 
2.36.0


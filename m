Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0362243CA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 21:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4926E15C;
	Fri, 17 Jul 2020 19:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D369C6E15C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 19:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595012753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QA04z49XQxRpsbQtr5ADLmijNDZoNbT33TpqwbOswEA=;
 b=Ekg8tG64+C3wxzMc0yoCmRp/vH+G2rvY0gqfVyoRjSER8kqnkGnC667Pkq6h+CGcT5KloX
 ztp3No6DbM0HGJU8wNXJA0j5TAtVcw7kb3BynUVsG7L1O3ePqUb2MQFMs+GbgldIbEsNfc
 MxaCV1LXNlnehovGe5L8ZMtcxD9yzkU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-ofMGisqIOw--qyact2rUxA-1; Fri, 17 Jul 2020 15:05:52 -0400
X-MC-Unique: ofMGisqIOw--qyact2rUxA-1
Received: by mail-ed1-f70.google.com with SMTP id y66so6429730ede.19
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 12:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QA04z49XQxRpsbQtr5ADLmijNDZoNbT33TpqwbOswEA=;
 b=MO0GrE6q6NmXGWBzHTtuAhiecMpnFkjIfOEy8idHex3hS8NdNdP0T714EHzRN/U76v
 m4Zgbkc2qVlAwqkcLlpTIlLQ5l1z9pzKFMaEPc/wvTAEov55dudDKm1ikdHBPciM2G8Q
 5RWuqjyFPP5NrcL+Bogtv+a9GifgsO6l9agJMY94glemCs6Rl6BBJHDLdOCIT5BnKlFc
 ApUIYvbCk9Tsa1a+z78jQMCvmHzqkXp3Q1j3Uw5ZwiNuXlyHxCBlSgBpcHiRr6y/LJe2
 /aMge5zHjS+ykJWNkrixKiUq2twDuQdnQBoDN4Nccd31wIIx7kEOsZkkA02fSC4niOv4
 jXgw==
X-Gm-Message-State: AOAM531mehJdUKXIRodt09mO/oyVoK/Qd5DpbKktVXK3SaB79xSvjnU9
 0GDMLA44leX4vKKREwRxLUu93zVZL1RgkQDoh03GYLIBb6526NoLYqpYNJxXCWn7t7wzRKWlZSu
 zZg3IDtzeqWsOqYoLpPTWfMDmRDw8
X-Received: by 2002:a17:906:a449:: with SMTP id
 cb9mr9659941ejb.115.1595012750736; 
 Fri, 17 Jul 2020 12:05:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxawMnEihhU00mwwY2KMXzPnp583S5oS9vU4nqqnr6E/4WlXYRDH2z1ZDUEgvDfZKxqw/acwg==
X-Received: by 2002:a17:906:a449:: with SMTP id
 cb9mr9659924ejb.115.1595012750517; 
 Fri, 17 Jul 2020 12:05:50 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:482c:9537:40:83ba])
 by smtp.gmail.com with ESMTPSA id 92sm9030732edg.78.2020.07.17.12.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 12:05:49 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-acpi@vger.kernel.org
Subject: [PATCH] RFC: ACPI / OSI: remove workarounds for hybrid graphics
 laptops
Date: Fri, 17 Jul 2020 21:05:47 +0200
Message-Id: <20200717190547.648604-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Hung <alex.hung@canonical.com>,
 Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's hard to figure out what systems are actually affected and right now I
don't see a good way of removing those...

But I'd like to see thos getting removed and drivers fixed instead (which
happened at least for nouveau).

And as mentioned before, I prefer people working on fixing issues instead
of spending time to add firmware level workarounds which are hard to know
to which systems they apply to, hard to remove and basically a big huge
pain to work with.
In the end I have no idea how to even figure out what systems are affected
and which not by this, so I have no idea how to even verify we can safely
remove this (which just means those are impossible to remove unless we risk
breaking systems, which again makes those supper annoying to deal with).

Also from the comments it's hard to get what those bits really do. Are they
just preventing runtime pm or do the devices are powered down when booting?
I am sure it's the former, still...

Please, don't do this again.

For now, those workaround prevent power savings on systems those workaround
applies to, which might be any so those should get removed asap and if
new issues arrise removing those please do a proper bug report and we can
look into it and come up with a proper fix (and keep this patch out until
we resolve all of those).

Signed-off-by: Karol Herbst <kherbst@redhat.com>
CC: Alex Hung <alex.hung@canonical.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Len Brown <lenb@kernel.org>
CC: Lyude Paul <lyude@redhat.com>
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: nouveau@lists.freedesktop.org
---
 drivers/acpi/osi.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/acpi/osi.c b/drivers/acpi/osi.c
index 9f68538091384..d4405e1ca9b97 100644
--- a/drivers/acpi/osi.c
+++ b/drivers/acpi/osi.c
@@ -44,30 +44,6 @@ osi_setup_entries[OSI_STRING_ENTRIES_MAX] __initdata = {
 	{"Processor Device", true},
 	{"3.0 _SCP Extensions", true},
 	{"Processor Aggregator Device", true},
-	/*
-	 * Linux-Dell-Video is used by BIOS to disable RTD3 for NVidia graphics
-	 * cards as RTD3 is not supported by drivers now.  Systems with NVidia
-	 * cards will hang without RTD3 disabled.
-	 *
-	 * Once NVidia drivers officially support RTD3, this _OSI strings can
-	 * be removed if both new and old graphics cards are supported.
-	 */
-	{"Linux-Dell-Video", true},
-	/*
-	 * Linux-Lenovo-NV-HDMI-Audio is used by BIOS to power on NVidia's HDMI
-	 * audio device which is turned off for power-saving in Windows OS.
-	 * This power management feature observed on some Lenovo Thinkpad
-	 * systems which will not be able to output audio via HDMI without
-	 * a BIOS workaround.
-	 */
-	{"Linux-Lenovo-NV-HDMI-Audio", true},
-	/*
-	 * Linux-HPI-Hybrid-Graphics is used by BIOS to enable dGPU to
-	 * output video directly to external monitors on HP Inc. mobile
-	 * workstations as Nvidia and AMD VGA drivers provide limited
-	 * hybrid graphics supports.
-	 */
-	{"Linux-HPI-Hybrid-Graphics", true},
 };
 
 static u32 acpi_osi_handler(acpi_string interface, u32 supported)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

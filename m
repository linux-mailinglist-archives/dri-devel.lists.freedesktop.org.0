Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CDB3889C4
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 10:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DFC6ECEE;
	Wed, 19 May 2021 08:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF6F6ECEF
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 08:51:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FB2261363;
 Wed, 19 May 2021 08:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621414311;
 bh=iyFVJg+w8mMo6vTmpXBdqeCrOwgNEUQUAQbzViHwUn8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f/x5izC2ftKUGYv4TMTGjWcCi/uYYC/QXETZrNy2Zzgqs82kmFxcaZGlUsc+H31T2
 7e4LGiLA4jDRcLr6Z+hIFvpW1XcKYsrnmdN0ZnSHX8vTK0zCbUeaK5Vi7YKKxmaZ6m
 tuxti06jhZN4M1lcWzdjdpq+ngV6LGFcDiy6psp8QiuJ5UehfrFjxN6z+PWs/fUKZ9
 QsjAMaMIo1qrkMk0O8XZfIVn/SwUdqHTzlJO7b72F4lP0/lZ8EWz8UmAVTt5rHUgRM
 /LDTsqexw0YOrax/lsY2uxzAkA4CyNYE8dQhmKMFBiz9G5j4xxlWFcmrTpW6SDT6HG
 YxzFpHPda4dzA==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1ljHvh-007gYQ-Mi; Wed, 19 May 2021 10:51:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 08/10] docs: ABI: sysfs-class-backlight: unify ambient light
 zone nodes
Date: Wed, 19 May 2021 10:51:45 +0200
Message-Id: <c13c6ebd03cd04a0d15d89018f8d529918fc0a73.1621413933.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621413933.git.mchehab+huawei@kernel.org>
References: <cover.1621413933.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

./scripts/get_abi.pl is warning about duplicated symbol
definition:

	Warning: /sys/class/backlight/<backlight>/l1_daylight_max is defined 2 times:  ./Documentation/ABI/testing/sysfs-class-backlight-driver-adp8870:4  ./Documentation/ABI/testing/sysfs-class-backlight-adp8860:12

What happens is that 3 drivers use the same pattern to report
max and dim setting for different ambient light zones.

It should be noticed that the adp8870 doc was missing an
entry for l1_daylight_dim, which was fixed on this patch.

While the ambient light zone is device-specific, the sysfs
definition is actually common. So, unify them at:

	Documentation/ABI/testing/sysfs-class-backlight

and use as the contact point, the e-mail reported by
get_maintainers.pl for the subsystem.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../ABI/testing/sysfs-class-backlight         | 100 ++++++++++++++++++
 .../ABI/testing/sysfs-class-backlight-adp5520 |  31 ------
 .../ABI/testing/sysfs-class-backlight-adp8860 |  37 -------
 .../sysfs-class-backlight-driver-adp8870      |  32 ------
 4 files changed, 100 insertions(+), 100 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-class-backlight-adp5520
 delete mode 100644 Documentation/ABI/testing/sysfs-class-backlight-adp8860
 delete mode 100644 Documentation/ABI/testing/sysfs-class-backlight-driver-adp8870

diff --git a/Documentation/ABI/testing/sysfs-class-backlight b/Documentation/ABI/testing/sysfs-class-backlight
index 1fc86401bf95..c453646b06e2 100644
--- a/Documentation/ABI/testing/sysfs-class-backlight
+++ b/Documentation/ABI/testing/sysfs-class-backlight
@@ -84,3 +84,103 @@ Description:
 		It can be enabled by writing the value stored in
 		/sys/class/backlight/<backlight>/max_brightness to
 		/sys/class/backlight/<backlight>/brightness.
+
+What:		/sys/class/backlight/<backlight>/<ambient light zone>_max
+Date:		Sep, 2009
+KernelVersion:	v2.6.32
+Contact:	device-drivers-devel@blackfin.uclinux.org
+Description:
+		Control the maximum brightness for <ambient light zone>
+		on this <backlight>. Values are between 0 and 127. This file
+		will also show the brightness level stored for this
+		<ambient light zone>.
+
+		The <ambient light zone> is device-driver specific:
+
+		For ADP5520 and ADP5501, <ambient light zone> can be:
+
+		===========  ================================================
+		Ambient      sysfs entry
+		light zone
+		===========  ================================================
+		daylight     /sys/class/backlight/<backlight>/daylight_max
+		office       /sys/class/backlight/<backlight>/office_max
+		dark         /sys/class/backlight/<backlight>/dark_max
+		===========  ================================================
+
+		For ADP8860, <ambient light zone> can be:
+
+		===========  ================================================
+		Ambient      sysfs entry
+		light zone
+		===========  ================================================
+		l1_daylight  /sys/class/backlight/<backlight>/l1_daylight_max
+		l2_office    /sys/class/backlight/<backlight>/l2_office_max
+		l3_dark      /sys/class/backlight/<backlight>/l3_dark_max
+		===========  ================================================
+
+		For ADP8870, <ambient light zone> can be:
+
+		===========  ================================================
+		Ambient      sysfs entry
+		light zone
+		===========  ================================================
+		l1_daylight  /sys/class/backlight/<backlight>/l1_daylight_max
+		l2_bright    /sys/class/backlight/<backlight>/l2_bright_max
+		l3_office    /sys/class/backlight/<backlight>/l3_office_max
+		l4_indoor    /sys/class/backlight/<backlight>/l4_indoor_max
+		l5_dark      /sys/class/backlight/<backlight>/l5_dark_max
+		===========  ================================================
+
+		See also: /sys/class/backlight/<backlight>/ambient_light_zone.
+
+What:		/sys/class/backlight/<backlight>/<ambient light zone>_dim
+Date:		Sep, 2009
+KernelVersion:	v2.6.32
+Contact:	device-drivers-devel@blackfin.uclinux.org
+Description:
+		Control the dim brightness for <ambient light zone>
+		on this <backlight>. Values are between 0 and 127, typically
+		set to 0. Full off when the backlight is disabled.
+		This file will also show the dim brightness level stored for
+		this <ambient light zone>.
+
+		The <ambient light zone> is device-driver specific:
+
+		For ADP5520 and ADP5501, <ambient light zone> can be:
+
+		===========  ================================================
+		Ambient      sysfs entry
+		light zone
+		===========  ================================================
+		daylight     /sys/class/backlight/<backlight>/daylight_dim
+		office       /sys/class/backlight/<backlight>/office_dim
+		dark         /sys/class/backlight/<backlight>/dark_dim
+		===========  ================================================
+
+		For ADP8860, <ambient light zone> can be:
+
+		===========  ================================================
+		Ambient      sysfs entry
+		light zone
+		===========  ================================================
+		l1_daylight  /sys/class/backlight/<backlight>/l1_daylight_dim
+		l2_office    /sys/class/backlight/<backlight>/l2_office_dim
+		l3_dark      /sys/class/backlight/<backlight>/l3_dark_dim
+		===========  ================================================
+
+		For ADP8870, <ambient light zone> can be:
+
+		===========  ================================================
+		Ambient      sysfs entry
+		light zone
+		===========  ================================================
+		l1_daylight  /sys/class/backlight/<backlight>/l1_daylight_dim
+		l2_bright    /sys/class/backlight/<backlight>/l2_bright_dim
+		l3_office    /sys/class/backlight/<backlight>/l3_office_dim
+		l4_indoor    /sys/class/backlight/<backlight>/l4_indoor_dim
+		l5_dark      /sys/class/backlight/<backlight>/l5_dark_dim
+		===========  ================================================
+
+		See also: /sys/class/backlight/<backlight>/ambient_light_zone.
+
diff --git a/Documentation/ABI/testing/sysfs-class-backlight-adp5520 b/Documentation/ABI/testing/sysfs-class-backlight-adp5520
deleted file mode 100644
index 34b6ebafa210..000000000000
--- a/Documentation/ABI/testing/sysfs-class-backlight-adp5520
+++ /dev/null
@@ -1,31 +0,0 @@
-sysfs interface for analog devices adp5520(01) backlight driver
----------------------------------------------------------------
-
-The backlight brightness control operates at three different levels for the
-adp5520 and adp5501 devices: daylight (level 1), office (level 2) and dark
-(level 3). By default the brightness operates at the daylight brightness level.
-
-What:		/sys/class/backlight/<backlight>/daylight_max
-What:		/sys/class/backlight/<backlight>/office_max
-What:		/sys/class/backlight/<backlight>/dark_max
-Date:		Sep, 2009
-KernelVersion:	v2.6.32
-Contact:	Michael Hennerich <michael.hennerich@analog.com>
-Description:
-		(RW) Maximum current setting for the backlight when brightness
-		is at one of the three levels (daylight, office or dark). This
-		is an input code between 0 and 127, which is transformed to a
-		value between 0 mA and 30 mA using linear or non-linear
-		algorithms.
-
-What:		/sys/class/backlight/<backlight>/daylight_dim
-What:		/sys/class/backlight/<backlight>/office_dim
-What:		/sys/class/backlight/<backlight>/dark_dim
-Date:		Sep, 2009
-KernelVersion:	v2.6.32
-Contact:	Michael Hennerich <michael.hennerich@analog.com>
-Description:
-		(RW) Dim current setting for the backlight when brightness is at
-		one of the three levels (daylight, office or dark). This is an
-		input code between 0 and 127, which is transformed to a value
-		between 0 mA and 30 mA using linear or non-linear algorithms.
diff --git a/Documentation/ABI/testing/sysfs-class-backlight-adp8860 b/Documentation/ABI/testing/sysfs-class-backlight-adp8860
deleted file mode 100644
index 6610ac73f9ba..000000000000
--- a/Documentation/ABI/testing/sysfs-class-backlight-adp8860
+++ /dev/null
@@ -1,37 +0,0 @@
-sysfs interface for analog devices adp8860 backlight driver
------------------------------------------------------------
-
-The backlight brightness control operates at three different levels for the
-adp8860, adp8861 and adp8863 devices: daylight (level 1), office (level 2) and
-dark (level 3). By default the brightness operates at the daylight brightness
-level.
-
-See also /sys/class/backlight/<backlight>/ambient_light_level and
-/sys/class/backlight/<backlight>/ambient_light_zone.
-
-
-What:		/sys/class/backlight/<backlight>/l1_daylight_max
-What:		/sys/class/backlight/<backlight>/l2_office_max
-What:		/sys/class/backlight/<backlight>/l3_dark_max
-Date:		Apr, 2010
-KernelVersion:	v2.6.35
-Contact:	Michael Hennerich <michael.hennerich@analog.com>
-Description:
-		(RW) Maximum current setting for the backlight when brightness
-		is at one of the three levels (daylight, office or dark). This
-		is an input code between 0 and 127, which is transformed to a
-		value between 0 mA and 30 mA using linear or non-linear
-		algorithms.
-
-
-What:		/sys/class/backlight/<backlight>/l1_daylight_dim
-What:		/sys/class/backlight/<backlight>/l2_office_dim
-What:		/sys/class/backlight/<backlight>/l3_dark_dim
-Date:		Apr, 2010
-KernelVersion:	v2.6.35
-Contact:	Michael Hennerich <michael.hennerich@analog.com>
-Description:
-		(RW) Dim current setting for the backlight when brightness is at
-		one of the three levels (daylight, office or dark). This is an
-		input code between 0 and 127, which is transformed to a value
-		between 0 mA and 30 mA using linear or non-linear algorithms.
diff --git a/Documentation/ABI/testing/sysfs-class-backlight-driver-adp8870 b/Documentation/ABI/testing/sysfs-class-backlight-driver-adp8870
deleted file mode 100644
index b08ca912cad4..000000000000
--- a/Documentation/ABI/testing/sysfs-class-backlight-driver-adp8870
+++ /dev/null
@@ -1,32 +0,0 @@
-See also /sys/class/backlight/<backlight>/ambient_light_level and
-/sys/class/backlight/<backlight>/ambient_light_zone.
-
-What:		/sys/class/backlight/<backlight>/<ambient light zone>_max
-What:		/sys/class/backlight/<backlight>/l1_daylight_max
-What:		/sys/class/backlight/<backlight>/l2_bright_max
-What:		/sys/class/backlight/<backlight>/l3_office_max
-What:		/sys/class/backlight/<backlight>/l4_indoor_max
-What:		/sys/class/backlight/<backlight>/l5_dark_max
-Date:		May 2011
-KernelVersion:	3.0
-Contact:	device-drivers-devel@blackfin.uclinux.org
-Description:
-		Control the maximum brightness for <ambient light zone>
-		on this <backlight>. Values are between 0 and 127. This file
-		will also show the brightness level stored for this
-		<ambient light zone>.
-
-What:		/sys/class/backlight/<backlight>/<ambient light zone>_dim
-What:		/sys/class/backlight/<backlight>/l2_bright_dim
-What:		/sys/class/backlight/<backlight>/l3_office_dim
-What:		/sys/class/backlight/<backlight>/l4_indoor_dim
-What:		/sys/class/backlight/<backlight>/l5_dark_dim
-Date:		May 2011
-KernelVersion:	3.0
-Contact:	device-drivers-devel@blackfin.uclinux.org
-Description:
-		Control the dim brightness for <ambient light zone>
-		on this <backlight>. Values are between 0 and 127, typically
-		set to 0. Full off when the backlight is disabled.
-		This file will also show the dim brightness level stored for
-		this <ambient light zone>.
-- 
2.31.1


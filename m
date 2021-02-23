Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2227322EEF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 17:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7218D6E9E6;
	Tue, 23 Feb 2021 16:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102766E9E6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 16:41:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614098462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NMSoGkZ7tOncwXKdvkLdYenM0RdMgXI+RBMm6qRER6I=;
 b=W+kyOdBWY8kJxh7KzhKbLljqa3O1QsVa3t762qMv69AocuhZs6IOnP+e5VvrqhegOb3kys
 VVNcbsfPvfG5Z2GQE+DCm6fhmjqpWJCh5TtlbyofVTO2mZ8HFPZwElIWc83iMXSttb2ES/
 yGh9982qAKeM23RgcYvnFxykbPBs5Vs=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99159ADE3;
 Tue, 23 Feb 2021 16:41:02 +0000 (UTC)
To: "oleksandr_andrushchenko@epam.com" <oleksandr_andrushchenko@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] drm/xen: adjust Kconfig
Message-ID: <54ae54f9-1ba9-900b-a56f-f48e2c9a82b0@suse.com>
Date: Tue, 23 Feb 2021 17:41:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Language: en-US
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By having selected DRM_XEN, I was assuming I would build the frontend
driver. As it turns out this is a dummy option, and I have really not
been building this (because I had DRM disabled). Make it a promptless
one, moving the "depends on" to the other, real option, and "select"ing
the dummy one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/drivers/gpu/drm/xen/Kconfig
+++ b/drivers/gpu/drm/xen/Kconfig
@@ -1,15 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_XEN
-	bool "DRM Support for Xen guest OS"
-	depends on XEN
-	help
-	  Choose this option if you want to enable DRM support
-	  for Xen.
+	bool
 
 config DRM_XEN_FRONTEND
 	tristate "Para-virtualized frontend driver for Xen guest OS"
-	depends on DRM_XEN
-	depends on DRM
+	depends on XEN && DRM
+	select DRM_XEN
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
 	select XEN_XENBUS_FRONTEND
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

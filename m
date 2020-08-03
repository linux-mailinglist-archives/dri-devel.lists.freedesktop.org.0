Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A74C239ED2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 07:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141476E202;
	Mon,  3 Aug 2020 05:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2071E6E202
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 05:20:00 +0000 (UTC)
IronPort-SDR: mAN5ysQ7ISlhnv9hL35M7lBJYBLZ1258eRiAQLRjoXQCDSjR2E9yx8CYNJ5EHZNzEZNiHV1hAR
 9EhfwAMCU9ag==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="132105624"
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="132105624"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 22:19:59 -0700
IronPort-SDR: 1P3zlw70YK4CpXzkgSelhDwpbESepA0dWywWnFc5gq0JD7383hb5d8+IfsWhWoC5qtQg2dxy/x
 IDKWeYxwiZ+w==
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="366195655"
Received: from dwillia2-desk3.jf.intel.com (HELO
 dwillia2-desk3.amr.corp.intel.com) ([10.54.39.16])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 22:19:59 -0700
Subject: [PATCH v4 14/23] drivers/base: Make device_find_child_by_name()
 compatible with sysfs inputs
From: Dan Williams <dan.j.williams@intel.com>
To: akpm@linux-foundation.org
Date: Sun, 02 Aug 2020 22:03:41 -0700
Message-ID: <159643102106.4062302.12229802117645312104.stgit@dwillia2-desk3.amr.corp.intel.com>
In-Reply-To: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
User-Agent: StGit/0.18-3-g996c
MIME-Version: 1.0
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
Cc: linux-acpi@vger.kernel.org, ard.biesheuvel@linaro.org, peterz@infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dave.hansen@linux.intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, vishal.l.verma@intel.com,
 "Rafael J. Wysocki" <rafael@kernel.org>, joao.m.martins@oracle.com,
 linux-nvdimm@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use sysfs_streq() in device_find_child_by_name() to allow it to use a
sysfs input string that might contain a trailing newline.

The other "device by name" interfaces,
{bus,driver,class}_find_device_by_name(), already account for sysfs
strings.

Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/base/core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 2169c5132558..231189dd6599 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3328,7 +3328,7 @@ struct device *device_find_child_by_name(struct device *parent,
 
 	klist_iter_init(&parent->p->klist_children, &i);
 	while ((child = next_device(&i)))
-		if (!strcmp(dev_name(child), name) && get_device(child))
+		if (sysfs_streq(dev_name(child), name) && get_device(child))
 			break;
 	klist_iter_exit(&i);
 	return child;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

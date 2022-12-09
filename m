Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439C46485E3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 16:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265C910E556;
	Fri,  9 Dec 2022 15:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCE110E556;
 Fri,  9 Dec 2022 15:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670600957; x=1702136957;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P6mxkpgd/Y8Bq72Ach78IUjaBu+/BBrZjDnHgxQR2ks=;
 b=EKd59fFs+WhI+Zt7IcOQEX81cwzhu+8EPAV5X8BRKyMOhlpUUIHW+tMH
 q6wORFIo/+5JTsLcGLdTXDDSgyl4GvFsBdw9LvczGBw0OtDXlF75crvBD
 f6cRq0Si/afMybQssVvuoS0GsBEq8Hx4gt34VsAv5rz9BS0Po9xZbooQT
 FrTq/Tfh58jhLkzymBKZkPyPvPbEYVQLgjj3tnVbhVPYu8nWpGGEeAvVe
 cN+fD7BBMfFBfsOukC38PkCkDFPEMUJEMycoA78mjD+GJ+DJD7jtD2r+n
 guDf6ri8ufEI/iRZCcw6v1VOUncDkB8K6bjPVIftk9loFh31uuhP3vGKs Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="315119782"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="315119782"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 07:49:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="647433321"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="647433321"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 07:49:13 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] linux/minmax.h: add non-atomic version of xchg
Date: Fri,  9 Dec 2022 16:48:39 +0100
Message-Id: <20221209154843.4162814-1-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pattern of setting variable with new value and returning old
one is very common in kernel. Usually atomicity of the operation
is not required, so xchg seems to be suboptimal and confusing in
such cases. Since name xchg is already in use and __xchg is used
in architecture code, proposition is to name the macro exchange.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Hi,

I hope there will be place for such tiny helper in kernel.
Quick cocci analyze shows there is probably few thousands places
where it could be used, of course I do not intend to do it :).

I was not sure where to put this macro, I hope near swap definition
is the most suitable place.

Moreover sorry if to/cc is not correct - get_maintainers.pl was
more confused than me, to who address this patch.

Regards
Andrzej
---
 include/linux/minmax.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/minmax.h b/include/linux/minmax.h
index 5433c08fcc6858..17d48769203bd5 100644
--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -144,4 +144,18 @@
 #define swap(a, b) \
 	do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
 
+/**
+ * exchange - set variable pointed by @ptr to @val, return old value
+ * @ptr: pointer to affected variable
+ * @val: value to be written
+ *
+ * This is non-atomic variant of xchg.
+ */
+#define exchange(ptr, val) ({		\
+	typeof(ptr) __ptr = ptr;	\
+	typeof(*__ptr) __t = *__ptr;	\
+	*(__ptr) = (val);		\
+	__t;				\
+})
+
 #endif	/* _LINUX_MINMAX_H */
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D60E149C66E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 10:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8B010E7D8;
	Wed, 26 Jan 2022 09:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9C610E529;
 Wed, 26 Jan 2022 09:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643189970; x=1674725970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=07WBSgMRDpJKqoyYch5hDAXQZYzth7c5ZCJjIGOcNFw=;
 b=azB3zvlRcNIUQ/XfmIITIq7BIvMDBmiwpaeZGw4eJ3YUZQolqsNyc3F2
 y/+rvu9VHlZ3C16k4SK9TlWhzkfRnT6Wqp0MtdKUs9VEhx43CJnMMZww5
 0+gN5HqeLJep2BbnT3Tf+bBDuatSwTGj0BmMISf/UAXvsekBF+q761xDG
 nGa7CpK9r/yDK8odq+hn7fwMJAkWN5BfTB6EH3Gcw29noL0QiTaZMraug
 1oQKGZ6yIIZ+WnjsTxLYEuRWiWtdTV6Al4MsL/b6u3m/QI2Ul54qqznK6
 isOiRa3XhHTVa3b3V5dlN2o27k6JHFaGHj1+0GSWudxutCG6DVWSeTNiQ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="227188779"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="227188779"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:39:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="477433079"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:39:29 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-security-module@vger.kernel.org, nouveau@lists.freedesktop.org,
 netdev@vger.kernel.org
Subject: [PATCH v2 01/11] lib/string_helpers: Consolidate string helpers
 implementation
Date: Wed, 26 Jan 2022 01:39:41 -0800
Message-Id: <20220126093951.1470898-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126093951.1470898-1-lucas.demarchi@intel.com>
References: <20220126093951.1470898-1-lucas.demarchi@intel.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Chris Wilson <chris@chris-wilson.co.uk>, Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, Leo Li <sunpeng.li@amd.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Raju Rangoju <rajur@chelsio.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are a few implementations of string helpers in the tree like yesno()
that just returns "yes" or "no" depending on a boolean argument. Those
are helpful to output strings to the user or log.

In order to consolidate them, prefix all of them str_ prefix to make it
clear what they are about and avoid symbol clashes.
Taking the commoon `val ? "yes" : "no"` implementation,  quite a few
users of open coded yesno() could later be converted to the new
function:

$ git grep '?\s*"yes"\s*' | wc -l
286
$ git grep '?\s*"no"\s*' | wc -l
20

The inlined function should keep the const strings local to each
compilation unit, the same way it's now, thus not changing the current
behavior.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 include/linux/string_helpers.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 7a22921c9db7..4d72258d42fd 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -106,4 +106,24 @@ void kfree_strarray(char **array, size_t n);
 
 char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n);
 
+static inline const char *str_yes_no(bool v)
+{
+	return v ? "yes" : "no";
+}
+
+static inline const char *str_on_off(bool v)
+{
+	return v ? "on" : "off";
+}
+
+static inline const char *str_enable_disable(bool v)
+{
+	return v ? "enable" : "disable";
+}
+
+static inline const char *str_enabled_disabled(bool v)
+{
+	return v ? "enabled" : "disabled";
+}
+
 #endif
-- 
2.34.1


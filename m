Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52861B93201
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 21:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E2410E4FE;
	Mon, 22 Sep 2025 19:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.b="VkMupMSC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fra-out-010.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 (fra-out-010.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 [63.178.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F26110E193;
 Mon, 22 Sep 2025 10:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
 t=1758537265; x=1790073265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GIzXOOEvZKeS6UuNgkU2k1mesw4I+NOSJCqENQl3gzM=;
 b=VkMupMSCyccaDqqRSPSmWBO719n0DJmfX39CZnR1P1maE/sX5GbP4ylb
 4T+mi21hkRL4wPa+DpnpFK8StxacLbh+XtNXm/93TZbMtB3vaDeeGNYSr
 mGXFo5vF2v3b4/WI3nOZIJwIkLPgFiWN2H1ylQObaPxYd4mAM+RrZP8+t
 ernA8jVQcr+q3m5KbMLg3NTbGJS6IVXyX5WZlePyIRaFy8dpX1y4xFqw1
 Cq1kIndpHL4OxLq2JvyJZ9heSAPxBTX8R7jLmsA3BosJWfWIUOg/V1vFB
 16S7dvJMRRVvl3eM4J76kZdvIGjMSaPUZ2M/a8ZzHFEbsv9xD9hnYDFDN w==;
X-CSE-ConnectionGUID: h9HJdj9ZSL6OxFZaboM3vg==
X-CSE-MsgGUID: olU9DTdMSs2kDNXwuFOHDg==
X-IronPort-AV: E=Sophos;i="6.18,284,1751241600"; 
   d="scan'208";a="2370489"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
 by internal-fra-out-010.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 10:34:14 +0000
Received: from EX19MTAEUA002.ant.amazon.com [54.240.197.232:28647]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.36.68:2525]
 with esmtp (Farcaster)
 id 15c415c2-fd16-4370-94f6-83d5598a6dea; Mon, 22 Sep 2025 10:34:14 +0000 (UTC)
X-Farcaster-Flow-ID: 15c415c2-fd16-4370-94f6-83d5598a6dea
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Mon, 22 Sep 2025 10:34:04 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D018EUA004.ant.amazon.com (10.252.50.85) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Mon, 22 Sep 2025
 10:33:39 +0000
From: Eliav Farber <farbere@amazon.com>
To: <richard@nod.at>, <anton.ivanov@cambridgegreys.com>,
 <johannes@sipsolutions.net>, <dave.hansen@linux.intel.com>,
 <luto@kernel.org>, <peterz@infradead.org>, <tglx@linutronix.de>,
 <mingo@redhat.com>, <bp@alien8.de>, <x86@kernel.org>, <hpa@zytor.com>,
 <tony.luck@intel.com>, <qiuxu.zhuo@intel.com>, <james.morse@arm.com>,
 <mchehab@kernel.org>, <rric@kernel.org>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <evan.quan@amd.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <jdelvare@suse.com>,
 <linux@roeck-us.net>, <linus.walleij@linaro.org>,
 <dmitry.torokhov@gmail.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
 <samuel@sholland.org>, <agk@redhat.com>, <snitzer@kernel.org>,
 <dm-devel@lists.linux.dev>, <mailhol.vincent@wanadoo.fr>,
 <wg@grandegger.com>, <mkl@pengutronix.de>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
 <mcoquelin.stm32@gmail.com>, <krzysztof.kozlowski@linaro.org>,
 <malattia@linux.it>, <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
 <markgross@kernel.org>, <artur.paszkiewicz@intel.com>, <jejb@linux.ibm.com>,
 <martin.petersen@oracle.com>, <sakari.ailus@linux.intel.com>,
 <gregkh@linuxfoundation.org>, <clm@fb.com>, <josef@toxicpanda.com>,
 <dsterba@suse.com>, <luc.vanoostenryck@gmail.com>, <rostedt@goodmis.org>,
 <mhiramat@kernel.org>, <pmladek@suse.com>,
 <andriy.shevchenko@linux.intel.com>, <linux@rasmusvillemoes.dk>,
 <senozhatsky@chromium.org>, <minchan@kernel.org>,
 <akpm@linux-foundation.org>, <dsahern@kernel.org>, <shuah@kernel.org>,
 <keescook@chromium.org>, <wad@chromium.org>, <farbere@amazon.com>,
 <David.Laight@ACULAB.COM>, <arnd@kernel.org>, <linux-um@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-hwmon@vger.kernel.org>, <linux-input@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-media@vger.kernel.org>, <linux-can@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-btrfs@vger.kernel.org>,
 <linux-sparse@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <bpf@vger.kernel.org>, <stable@vger.kernel.org>
CC: Linus Torvalds <torvalds@linux-foundation.org>, David Laight
 <David.Laight@aculab.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [PATCH 02/15 6.6.y] minmax: simplify and clarify min_t()/max_t()
 implementation
Date: Mon, 22 Sep 2025 10:32:28 +0000
Message-ID: <20250922103241.16213-3-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922103241.16213-1-farbere@amazon.com>
References: <20250922103241.16213-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D039UWB002.ant.amazon.com (10.13.138.79) To
 EX19D018EUA004.ant.amazon.com (10.252.50.85)
X-Mailman-Approved-At: Mon, 22 Sep 2025 19:47:43 +0000
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

From: Linus Torvalds <torvalds@linux-foundation.org>

[ Upstream commit 017fa3e89187848fd056af757769c9e66ac3e93d ]

This simplifies the min_t() and max_t() macros by no longer making them
work in the context of a C constant expression.

That means that you can no longer use them for static initializers or
for array sizes in type definitions, but there were only a couple of
such uses, and all of them were converted (famous last words) to use
MIN_T/MAX_T instead.

Cc: David Laight <David.Laight@aculab.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 include/linux/minmax.h | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/include/linux/minmax.h b/include/linux/minmax.h
index a7ef65f78933..9c2848abc804 100644
--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -45,17 +45,20 @@
 
 #define __cmp(op, x, y)	((x) __cmp_op_##op (y) ? (x) : (y))
 
-#define __cmp_once(op, x, y, unique_x, unique_y) ({	\
-	typeof(x) unique_x = (x);			\
-	typeof(y) unique_y = (y);			\
+#define __cmp_once_unique(op, type, x, y, ux, uy) \
+	({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
+
+#define __cmp_once(op, type, x, y) \
+	__cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
+
+#define __careful_cmp_once(op, x, y) ({			\
 	static_assert(__types_ok(x, y),			\
 		#op "(" #x ", " #y ") signedness error, fix types or consider u" #op "() before " #op "_t()"); \
-	__cmp(op, unique_x, unique_y); })
+	__cmp_once(op, __auto_type, x, y); })
 
 #define __careful_cmp(op, x, y)					\
 	__builtin_choose_expr(__is_constexpr((x) - (y)),	\
-		__cmp(op, x, y),				\
-		__cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
+		__cmp(op, x, y), __careful_cmp_once(op, x, y))
 
 #define __clamp(val, lo, hi)	\
 	((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
@@ -158,7 +161,7 @@
  * @x: first value
  * @y: second value
  */
-#define min_t(type, x, y)	__careful_cmp(min, (type)(x), (type)(y))
+#define min_t(type, x, y) __cmp_once(min, type, x, y)
 
 /**
  * max_t - return maximum of two values, using the specified type
@@ -166,7 +169,7 @@
  * @x: first value
  * @y: second value
  */
-#define max_t(type, x, y)	__careful_cmp(max, (type)(x), (type)(y))
+#define max_t(type, x, y) __cmp_once(max, type, x, y)
 
 /*
  * Do not check the array parameter using __must_be_array().
-- 
2.47.3


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 124B5C581CF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 16:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADDB10E84F;
	Thu, 13 Nov 2025 15:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7DLHB1S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F52010E841;
 Thu, 13 Nov 2025 15:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763046150; x=1794582150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2B46NT1dSQc4u95Gk/QrFTNjX7VR1jBDUh9ZV8b1ovg=;
 b=K7DLHB1SEzdT5zBcnj4as3kMCzsYGiLeyZKNOchp8teOvWgPhcze3NbB
 vKoLGuth8tlpzox0hYH/7Ap2OzEtwMx0xr/GkeaS2mrDACaih21G5ECFD
 ecibKqUJJJr6cCC961Q4pT3zE4nj3jox4sY3u5ixpQdrBXMsqQ0jxUeDc
 RG67bWLgzFLR2wYKyOG25fRaZb21xL+diR6nMx0TK60W4NFH4HjBf8thR
 jSBTvJ3aotJDg/pSRL6U/cF2NLpjH8zsWdqIPXUcoUgCCDI2hFXUmiklV
 XSfLVmZ/3BeOC5gNUcftKbundRE/B22swhDHm0CdGPkI59x/b0mHhazbM w==;
X-CSE-ConnectionGUID: d5thQn3qT9at9KnDXYBN6Q==
X-CSE-MsgGUID: +w6WoIioS1Cz0JtYx2sEAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="68991440"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="68991440"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 07:02:29 -0800
X-CSE-ConnectionGUID: Vz8xRacFQwaRx7eYs36+8g==
X-CSE-MsgGUID: H/6qh459QiuQ7G0yqQYVsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="188810179"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP; 13 Nov 2025 07:02:19 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id 05CA197; Thu, 13 Nov 2025 16:02:19 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Corey Minyard <corey@minyard.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Vitaly Lifshits <vitaly.lifshits@intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Calvin Owens <calvin@wbinvd.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Sagi Maimon <maimon.sagi@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Karan Tilak Kumar <kartilak@cisco.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>,
 Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
 Max Kellermann <max.kellermann@ionos.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vladimir Oltean <olteanv@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Rodolfo Giometti <giometti@enneenne.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Stefan Haberland <sth@linux.ibm.com>,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>,
 Sesidhar Baddela <sebaddel@cisco.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 01/21] lib/vsprintf: Add specifier for printing struct
 timespec64
Date: Thu, 13 Nov 2025 15:32:15 +0100
Message-ID: <20251113150217.3030010-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A handful drivers want to print a content of the struct timespec64
in a format of %lld:%09ld. In order to make their lives easier, add
the respecting specifier directly to the printf() implementation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/core-api/printk-formats.rst | 11 +++++++--
 lib/tests/printf_kunit.c                  |  4 ++++
 lib/vsprintf.c                            | 28 ++++++++++++++++++++++-
 3 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index 7f2f11b48286..c0b1b6089307 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -547,11 +547,13 @@ Time and date
 	%pt[RT]s		YYYY-mm-dd HH:MM:SS
 	%pt[RT]d		YYYY-mm-dd
 	%pt[RT]t		HH:MM:SS
-	%pt[RT][dt][r][s]
+	%ptSp			<seconds>.<nanoseconds>
+	%pt[RST][dt][r][s]
 
 For printing date and time as represented by::
 
-	R  struct rtc_time structure
+	R  content of struct rtc_time
+	S  content of struct timespec64
 	T  time64_t type
 
 in human readable format.
@@ -563,6 +565,11 @@ The %pt[RT]s (space) will override ISO 8601 separator by using ' ' (space)
 instead of 'T' (Capital T) between date and time. It won't have any effect
 when date or time is omitted.
 
+The %ptSp is equivalent to %lld.%09ld for the content of the struct timespec64.
+When the other specifiers are given, it becomes the respective equivalent of
+%ptT[dt][r][s].%09ld. In other words, the seconds are being printed in
+the human readable format followed by a dot and nanoseconds.
+
 Passed by reference.
 
 struct clk
diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
index bc54cca2d7a6..7617e5b8b02c 100644
--- a/lib/tests/printf_kunit.c
+++ b/lib/tests/printf_kunit.c
@@ -504,6 +504,7 @@ time_and_date(struct kunit *kunittest)
 	};
 	/* 2019-01-04T15:32:23 */
 	time64_t t = 1546615943;
+	struct timespec64 ts = { .tv_sec = t, .tv_nsec = 11235813 };
 
 	test("(%pt?)", "%pt", &tm);
 	test("2018-11-26T05:35:43", "%ptR", &tm);
@@ -522,6 +523,9 @@ time_and_date(struct kunit *kunittest)
 	test("0119-00-04 15:32:23", "%ptTsr", &t);
 	test("15:32:23|2019-01-04", "%ptTts|%ptTds", &t, &t);
 	test("15:32:23|0119-00-04", "%ptTtrs|%ptTdrs", &t, &t);
+
+	test("2019-01-04T15:32:23.011235813", "%ptS", &ts);
+	test("1546615943.011235813", "%ptSp", &ts);
 }
 
 static void
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 11dbf1023391..51a88b3f5b52 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1983,6 +1983,28 @@ char *time64_str(char *buf, char *end, const time64_t time,
 	return rtc_str(buf, end, &rtc_time, spec, fmt);
 }
 
+static noinline_for_stack
+char *timespec64_str(char *buf, char *end, const struct timespec64 *ts,
+		     struct printf_spec spec, const char *fmt)
+{
+	static const struct printf_spec default_dec09_spec = {
+		.base = 10,
+		.field_width = 9,
+		.precision = -1,
+		.flags = ZEROPAD,
+	};
+
+	if (fmt[2] == 'p')
+		buf = number(buf, end, ts->tv_sec, default_dec_spec);
+	else
+		buf = time64_str(buf, end, ts->tv_sec, spec, fmt);
+	if (buf < end)
+		*buf = '.';
+	buf++;
+
+	return number(buf, end, ts->tv_nsec, default_dec09_spec);
+}
+
 static noinline_for_stack
 char *time_and_date(char *buf, char *end, void *ptr, struct printf_spec spec,
 		    const char *fmt)
@@ -1993,6 +2015,8 @@ char *time_and_date(char *buf, char *end, void *ptr, struct printf_spec spec,
 	switch (fmt[1]) {
 	case 'R':
 		return rtc_str(buf, end, (const struct rtc_time *)ptr, spec, fmt);
+	case 'S':
+		return timespec64_str(buf, end, (const struct timespec64 *)ptr, spec, fmt);
 	case 'T':
 		return time64_str(buf, end, *(const time64_t *)ptr, spec, fmt);
 	default:
@@ -2456,9 +2480,11 @@ early_param("no_hash_pointers", no_hash_pointers_enable);
  * - 'd[234]' For a dentry name (optionally 2-4 last components)
  * - 'D[234]' Same as 'd' but for a struct file
  * - 'g' For block_device name (gendisk + partition number)
- * - 't[RT][dt][r][s]' For time and date as represented by:
+ * - 't[RST][dt][r][s]' For time and date as represented by:
  *      R    struct rtc_time
+ *      S    struct timespec64
  *      T    time64_t
+ * - 'tSp' For time represented by struct timespec64 printed as <seconds>.<nanoseconds>
  * - 'C' For a clock, it prints the name (Common Clock Framework) or address
  *       (legacy clock framework) of the clock
  * - 'G' For flags to be printed as a collection of symbolic strings that would
-- 
2.50.1


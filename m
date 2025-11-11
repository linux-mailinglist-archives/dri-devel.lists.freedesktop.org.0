Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728D7C4DB3D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 13:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A1F10E588;
	Tue, 11 Nov 2025 12:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fUwsmYfE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC2C10E57D;
 Tue, 11 Nov 2025 12:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762864094; x=1794400094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N6ej1S2Oe19sN5Q2t2DX/aJ/MSv694AtxQx/bMLeQmA=;
 b=fUwsmYfElgjj2bk+As/KZRcvhPYEhu88IyL2E+w6xtAVySpvHA2GhCdQ
 TkT53fc8bpwWSDLvLInwyi8Kl3uvmfpInHugB04vQ1Srde4skFMubBYbY
 Yrn6TWRvvuWTARfzRENiyvDlmFqm9pGFPZ1jn2Ab1IFGsvaXk4NGCx5yx
 ffopvUCPA7njFfBSk/JTK/+vWS7j5HJLBLUzBszcMN1dZJrCrldQUla6y
 Pf5kMW3c1s81XpOYML5lBZ6NiXufmPqZw6zljE73CY4cFR1r49RiiREyL
 UfNYUDBwZlFXUzujmxP0UC2Nx1wZ+dR0MGdjtbjdPZciuXtEnTZEFu/P4 Q==;
X-CSE-ConnectionGUID: TkCZfny7RTOM5P7y2JLzVg==
X-CSE-MsgGUID: y0JIe8wjRkKsbWtMRgZo0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82553280"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="82553280"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 04:28:13 -0800
X-CSE-ConnectionGUID: ZcPImyfHSWW+qsvDKuVEog==
X-CSE-MsgGUID: OlA2RrkTQCeZxnb5n7rdTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="212343336"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP; 11 Nov 2025 04:28:05 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id 5152DA9; Tue, 11 Nov 2025 13:27:38 +0100 (CET)
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
 Richard Cochran <richardcochran@gmail.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
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
Subject: [PATCH v2 19/21] scsi: fnic: Switch to use %ptS
Date: Tue, 11 Nov 2025 13:20:19 +0100
Message-ID: <20251111122735.880607-20-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251111122735.880607-1-andriy.shevchenko@linux.intel.com>
References: <20251111122735.880607-1-andriy.shevchenko@linux.intel.com>
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

Use %ptS instead of open coded variants to print content of
struct timespec64 in human readable format.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/scsi/fnic/fnic_trace.c | 46 +++++++++++++++-------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/scsi/fnic/fnic_trace.c b/drivers/scsi/fnic/fnic_trace.c
index cdc6b12b1ec2..f5543bb92ee4 100644
--- a/drivers/scsi/fnic/fnic_trace.c
+++ b/drivers/scsi/fnic/fnic_trace.c
@@ -138,9 +138,8 @@ int fnic_get_trace_data(fnic_dbgfs_t *fnic_dbgfs_prt)
 			 */
 			len += scnprintf(fnic_dbgfs_prt->buffer + len,
 				  (trace_max_pages * PAGE_SIZE * 3) - len,
-				  "%16llu.%09lu %-50s %8x %8x %16llx %16llx "
-				  "%16llx %16llx %16llx\n", (u64)val.tv_sec,
-				  val.tv_nsec, str, tbp->host_no, tbp->tag,
+				  "%ptSp %-50s %8x %8x %16llx %16llx %16llx %16llx %16llx\n",
+				  &val, str, tbp->host_no, tbp->tag,
 				  tbp->data[0], tbp->data[1], tbp->data[2],
 				  tbp->data[3], tbp->data[4]);
 			rd_idx++;
@@ -180,9 +179,8 @@ int fnic_get_trace_data(fnic_dbgfs_t *fnic_dbgfs_prt)
 			 */
 			len += scnprintf(fnic_dbgfs_prt->buffer + len,
 				  (trace_max_pages * PAGE_SIZE * 3) - len,
-				  "%16llu.%09lu %-50s %8x %8x %16llx %16llx "
-				  "%16llx %16llx %16llx\n", (u64)val.tv_sec,
-				  val.tv_nsec, str, tbp->host_no, tbp->tag,
+				  "%ptSp %-50s %8x %8x %16llx %16llx %16llx %16llx %16llx\n",
+				  &val, str, tbp->host_no, tbp->tag,
 				  tbp->data[0], tbp->data[1], tbp->data[2],
 				  tbp->data[3], tbp->data[4]);
 			rd_idx++;
@@ -225,20 +223,16 @@ int fnic_get_stats_data(struct stats_debug_info *debug,
 		"------------------------------------------\n");
 
 	len += scnprintf(debug->debug_buffer + len, buf_size - len,
-		"Current time :          [%lld:%ld]\n"
-		"Last stats reset time:  [%lld:%09ld]\n"
-		"Last stats read time:   [%lld:%ld]\n"
-		"delta since last reset: [%lld:%ld]\n"
-		"delta since last read:  [%lld:%ld]\n",
-	(s64)val1.tv_sec, val1.tv_nsec,
-	(s64)stats->stats_timestamps.last_reset_time.tv_sec,
-	stats->stats_timestamps.last_reset_time.tv_nsec,
-	(s64)stats->stats_timestamps.last_read_time.tv_sec,
-	stats->stats_timestamps.last_read_time.tv_nsec,
-	(s64)timespec64_sub(val1, stats->stats_timestamps.last_reset_time).tv_sec,
-	timespec64_sub(val1, stats->stats_timestamps.last_reset_time).tv_nsec,
-	(s64)timespec64_sub(val1, stats->stats_timestamps.last_read_time).tv_sec,
-	timespec64_sub(val1, stats->stats_timestamps.last_read_time).tv_nsec);
+		"Current time :          [%ptSp]\n"
+		"Last stats reset time:  [%ptSp]\n"
+		"Last stats read time:   [%ptSp]\n"
+		"delta since last reset: [%ptSp]\n"
+		"delta since last read:  [%ptSp]\n",
+	&val1,
+	&stats->stats_timestamps.last_reset_time,
+	&stats->stats_timestamps.last_read_time,
+	&timespec64_sub(val1, stats->stats_timestamps.last_reset_time),
+	&timespec64_sub(val1, stats->stats_timestamps.last_read_time));
 
 	stats->stats_timestamps.last_read_time = val1;
 
@@ -416,8 +410,8 @@ int fnic_get_stats_data(struct stats_debug_info *debug,
 	jiffies_to_timespec64(stats->misc_stats.last_ack_time, &val2);
 
 	len += scnprintf(debug->debug_buffer + len, buf_size - len,
-		  "Last ISR time: %llu (%8llu.%09lu)\n"
-		  "Last ACK time: %llu (%8llu.%09lu)\n"
+		  "Last ISR time: %llu (%ptSp)\n"
+		  "Last ACK time: %llu (%ptSp)\n"
 		  "Max ISR jiffies: %llu\n"
 		  "Max ISR time (ms) (0 denotes < 1 ms): %llu\n"
 		  "Corr. work done: %llu\n"
@@ -438,9 +432,9 @@ int fnic_get_stats_data(struct stats_debug_info *debug,
 		 "Number of receive frame errors: %lld\n"
 		 "Port speed (in Mbps): %lld\n",
 		  (u64)stats->misc_stats.last_isr_time,
-		  (s64)val1.tv_sec, val1.tv_nsec,
+		  &val1,
 		  (u64)stats->misc_stats.last_ack_time,
-		  (s64)val2.tv_sec, val2.tv_nsec,
+		  &val2,
 		  (u64)atomic64_read(&stats->misc_stats.max_isr_jiffies),
 		  (u64)atomic64_read(&stats->misc_stats.max_isr_time_ms),
 		  (u64)atomic64_read(&stats->misc_stats.corr_work_done),
@@ -857,8 +851,8 @@ void copy_and_format_trace_data(struct fc_trace_hdr *tdata,
 	len = *orig_len;
 
 	len += scnprintf(fnic_dbgfs_prt->buffer + len, max_size - len,
-			 "%ptTs.%09lu ns%8x       %c%8x\t",
-			 &tdata->time_stamp.tv_sec, tdata->time_stamp.tv_nsec,
+			 "%ptSs ns%8x       %c%8x\t",
+			 &tdata->time_stamp,
 			 tdata->host_no, tdata->frame_type, tdata->frame_len);
 
 	fc_trace = (char *)FC_TRACE_ADDRESS(tdata);
-- 
2.50.1


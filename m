Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130D6C582B5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 16:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF4E10E888;
	Thu, 13 Nov 2025 15:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PrPdozC6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AEF10E866;
 Thu, 13 Nov 2025 15:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763046203; x=1794582203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mKCfGvyzNhw96Cnh7FIRHLBI440Q6rRaNHGoDV+QYYs=;
 b=PrPdozC609gDHHe33jnkM+omof/ThnLh3DLtLIwECVF6Yh7ygIVli5rw
 v3I6qu5xjja/1yzkmfYH0iSXCjcJXha6X8hXgqMXSnmnylpnLa0KD3TCi
 mcjEITFdvmJ2J8vMzcafz/1rYHj79U+dYTgSqh7lwqGG6bEiBU3G/nqD5
 kiGfo6Cv+uFJKaHtG/e2Tset5phAvmat36r+uit6ZXvnr7wjyyybk7Jsz
 pgeSXi3scTPeoD8ACASdznMStshcL/VS4o2xgs8cMdULs5j90qXs0JEG3
 SALZ6AnFyDvpkuA29YK9kRnTVmUY9jX9L0TB9RnHg5ykGnBebgYKYSzpp Q==;
X-CSE-ConnectionGUID: 3N/mfCc8RZiM5RVJppGfAw==
X-CSE-MsgGUID: RM+YA1dSSYGble9gtK13kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65054734"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65054734"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 07:03:03 -0800
X-CSE-ConnectionGUID: yKzzlJzzQWapQitGWcT/+Q==
X-CSE-MsgGUID: xLZAMTLNQZqO3A74MNxPAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="220325230"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP; 13 Nov 2025 07:02:54 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id 81C62AA; Thu, 13 Nov 2025 16:02:19 +0100 (CET)
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
Subject: [PATCH v3 20/21] scsi: snic: Switch to use %ptSp
Date: Thu, 13 Nov 2025 15:32:34 +0100
Message-ID: <20251113150217.3030010-21-andriy.shevchenko@linux.intel.com>
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

Use %ptSp instead of open coded variants to print content of
struct timespec64 in human readable format.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/scsi/snic/snic_debugfs.c | 10 ++++------
 drivers/scsi/snic/snic_trc.c     |  5 ++---
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/scsi/snic/snic_debugfs.c b/drivers/scsi/snic/snic_debugfs.c
index 9dd975b36b5b..edf3e5ef28a6 100644
--- a/drivers/scsi/snic/snic_debugfs.c
+++ b/drivers/scsi/snic/snic_debugfs.c
@@ -282,8 +282,8 @@ snic_stats_show(struct seq_file *sfp, void *data)
 	jiffies_to_timespec64(stats->misc.last_ack_time, &last_ack_tms);
 
 	seq_printf(sfp,
-		   "Last ISR Time               : %llu (%8llu.%09lu)\n"
-		   "Last Ack Time               : %llu (%8llu.%09lu)\n"
+		   "Last ISR Time               : %llu (%ptSp)\n"
+		   "Last Ack Time               : %llu (%ptSp)\n"
 		   "Ack ISRs                    : %llu\n"
 		   "IO Cmpl ISRs                : %llu\n"
 		   "Err Notify ISRs             : %llu\n"
@@ -298,10 +298,8 @@ snic_stats_show(struct seq_file *sfp, void *data)
 		   "Queue Ramp Down             : %lld\n"
 		   "Queue Last Queue Depth      : %lld\n"
 		   "Target Not Ready            : %lld\n",
-		   (u64) stats->misc.last_isr_time,
-		   last_isr_tms.tv_sec, last_isr_tms.tv_nsec,
-		   (u64)stats->misc.last_ack_time,
-		   last_ack_tms.tv_sec, last_ack_tms.tv_nsec,
+		   (u64) stats->misc.last_isr_time, &last_isr_tms,
+		   (u64) stats->misc.last_ack_time, &last_ack_tms,
 		   (u64) atomic64_read(&stats->misc.ack_isr_cnt),
 		   (u64) atomic64_read(&stats->misc.cmpl_isr_cnt),
 		   (u64) atomic64_read(&stats->misc.errnotify_isr_cnt),
diff --git a/drivers/scsi/snic/snic_trc.c b/drivers/scsi/snic/snic_trc.c
index c2e5ab7e976c..6bad1ea9a6a7 100644
--- a/drivers/scsi/snic/snic_trc.c
+++ b/drivers/scsi/snic/snic_trc.c
@@ -56,9 +56,8 @@ snic_fmt_trc_data(struct snic_trc_data *td, char *buf, int buf_sz)
 	jiffies_to_timespec64(td->ts, &tmspec);
 
 	len += snprintf(buf, buf_sz,
-			"%llu.%09lu %-25s %3d %4x %16llx %16llx %16llx %16llx %16llx\n",
-			tmspec.tv_sec,
-			tmspec.tv_nsec,
+			"%ptSp %-25s %3d %4x %16llx %16llx %16llx %16llx %16llx\n",
+			&tmspec,
 			td->fn,
 			td->hno,
 			td->tag,
-- 
2.50.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8D4C4DB46
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 13:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E5010E56B;
	Tue, 11 Nov 2025 12:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OM4aRTbv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F84710E587;
 Tue, 11 Nov 2025 12:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762864088; x=1794400088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9P5AC3KVHcn4TcLoSKblVZwstZQ28owfF1NSWgu0v6M=;
 b=OM4aRTbv4pvCop/AUKB5rVvvtL9LIMaYTV2odcyNz50Chkhz4YzKAjb4
 mevNV3MnTZZPUYWryVVcOZD87coy3liIkchBvBuqGaNcj43y8ROexv9fP
 BdAzAYOGwZr9h/tKGFygG2Yv8o1SxCFIfXbDiaEjPyhmgUi+XtlfJ25I+
 N+tcvU3+kZlwa3nDuGHSBzO26YNhYoDzA68hqpo4spSrdBsnjI+eomDGm
 LiaDhG8HJofShihoT/DYJnSSB9Z/B7TVu1o6K2x/D9glKFs/uF8FTi4iI
 +eE9zMTO8yVoaI7ra2zZ+Mgok7ZpLbMVQ3rcdBs+xBfoH4Jl0ORlzXM4i w==;
X-CSE-ConnectionGUID: qao4NHG/SjGpbxRmb2sPVQ==
X-CSE-MsgGUID: CS9D+ImDRfqiGueYlYipgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82553197"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="82553197"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 04:28:06 -0800
X-CSE-ConnectionGUID: C4sha4TYQL6Ra9K6KrIJ/w==
X-CSE-MsgGUID: nOZ6GvmYRmiuO92CznfCzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="212343329"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP; 11 Nov 2025 04:27:59 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id 3E4F2A6; Tue, 11 Nov 2025 13:27:38 +0100 (CET)
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
Subject: [PATCH v2 16/21] pps: Switch to use %ptSp
Date: Tue, 11 Nov 2025 13:20:16 +0100
Message-ID: <20251111122735.880607-17-andriy.shevchenko@linux.intel.com>
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

Use %ptSp instead of open coded variants to print content of
struct timespec64 in human readable format.

Acked-by: Rodolfo Giometti <giometti@enneenne.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pps/generators/pps_gen_parport.c | 3 +--
 drivers/pps/kapi.c                       | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pps/generators/pps_gen_parport.c b/drivers/pps/generators/pps_gen_parport.c
index f5eeb4dd01ad..05bbf8d30ef1 100644
--- a/drivers/pps/generators/pps_gen_parport.c
+++ b/drivers/pps/generators/pps_gen_parport.c
@@ -80,8 +80,7 @@ static enum hrtimer_restart hrtimer_event(struct hrtimer *timer)
 	/* check if we are late */
 	if (expire_time.tv_sec != ts1.tv_sec || ts1.tv_nsec > lim) {
 		local_irq_restore(flags);
-		pr_err("we are late this time %lld.%09ld\n",
-				(s64)ts1.tv_sec, ts1.tv_nsec);
+		pr_err("we are late this time %ptSp\n", &ts1);
 		goto done;
 	}
 
diff --git a/drivers/pps/kapi.c b/drivers/pps/kapi.c
index e9389876229e..6985c34de2ce 100644
--- a/drivers/pps/kapi.c
+++ b/drivers/pps/kapi.c
@@ -163,8 +163,7 @@ void pps_event(struct pps_device *pps, struct pps_event_time *ts, int event,
 	/* check event type */
 	BUG_ON((event & (PPS_CAPTUREASSERT | PPS_CAPTURECLEAR)) == 0);
 
-	dev_dbg(&pps->dev, "PPS event at %lld.%09ld\n",
-			(s64)ts->ts_real.tv_sec, ts->ts_real.tv_nsec);
+	dev_dbg(&pps->dev, "PPS event at %ptSp\n", &ts->ts_real);
 
 	timespec_to_pps_ktime(&ts_real, ts->ts_real);
 
-- 
2.50.1


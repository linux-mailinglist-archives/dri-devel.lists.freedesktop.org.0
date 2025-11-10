Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1597AC48A2A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 19:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B00D10E2EA;
	Mon, 10 Nov 2025 18:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CiBdtdyW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0959B10E2EA;
 Mon, 10 Nov 2025 18:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762800468; x=1794336468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fCt0uZJtXQzZViSDNcneyMtrnn/y5yDZ8tsLO9qgG3A=;
 b=CiBdtdyWymNjBZZ8GKXHeKNsOdLWp7u4dqTdo8MaYrWPkmlxjEL4yM0O
 +3m0AWSypxbTjU0VG+LbGClindsmh3YiD8fCAbcE7obqqpLfAvR14PgjA
 IEoTBd/TmGnWaq7rhIcDC07Zpmi58vSIBeVa5RUo4naGqRAJ+sywyTHfG
 FqlqwUAUmRs7sYghlTqx4E4YFYVwnVOnX3GkEyyc2gxTelsNemQPoQ+a9
 XYUulVOZq8E/I8VyVkiBZVxuQCzy6BplNBhW6b9H1y2gHJZkUpCR0vUQH
 w0xZ1AlLF+YMeuQUQT7KtHbJZ6h4AGZ6HSpfjeAt/UZVbggw7KLjaRIj+ Q==;
X-CSE-ConnectionGUID: woMRvPeJT0uiNKo1Lqyptg==
X-CSE-MsgGUID: k3g3Uz+NRICGhNILiI+7Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="63861710"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="63861710"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 10:47:48 -0800
X-CSE-ConnectionGUID: vLwpzXxWTlqMkVe0jU7QSA==
X-CSE-MsgGUID: vqdaBx3wRd2oCOgUpZsMtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189190196"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa009.fm.intel.com with ESMTP; 10 Nov 2025 10:47:39 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id 0116B97; Mon, 10 Nov 2025 19:47:28 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Corey Minyard <corey@minyard.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vitaly Lifshits <vitaly.lifshits@intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Calvin Owens <calvin@wbinvd.org>, Sagi Maimon <maimon.sagi@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Karan Tilak Kumar <kartilak@cisco.com>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>,
 Max Kellermann <max.kellermann@ionos.com>, Takashi Iwai <tiwai@suse.de>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-pci@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-staging@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-sound@vger.kernel.org
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Rodolfo Giometti <giometti@enneenne.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Richard Cochran <richardcochran@gmail.com>,
 Stefan Haberland <sth@linux.ibm.com>,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>,
 Sesidhar Baddela <sebaddel@cisco.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 02/23] ALSA: seq: Switch to use %ptSp
Date: Mon, 10 Nov 2025 19:40:21 +0100
Message-ID: <20251110184727.666591-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
References: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
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

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/core/seq/seq_queue.c | 2 +-
 sound/core/seq/seq_timer.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
index f5c0e401c8ae..f6e86cbf38bc 100644
--- a/sound/core/seq/seq_queue.c
+++ b/sound/core/seq/seq_queue.c
@@ -699,7 +699,7 @@ void snd_seq_info_queues_read(struct snd_info_entry *entry,
 		snd_iprintf(buffer, "current tempo      : %d\n", tmr->tempo);
 		snd_iprintf(buffer, "tempo base         : %d ns\n", tmr->tempo_base);
 		snd_iprintf(buffer, "current BPM        : %d\n", bpm);
-		snd_iprintf(buffer, "current time       : %d.%09d s\n", tmr->cur_time.tv_sec, tmr->cur_time.tv_nsec);
+		snd_iprintf(buffer, "current time       : %ptSp s\n", &tmr->cur_time);
 		snd_iprintf(buffer, "current tick       : %d\n", tmr->tick.cur_tick);
 		snd_iprintf(buffer, "\n");
 	}
diff --git a/sound/core/seq/seq_timer.c b/sound/core/seq/seq_timer.c
index 29b018a212fc..06074d822bae 100644
--- a/sound/core/seq/seq_timer.c
+++ b/sound/core/seq/seq_timer.c
@@ -442,7 +442,7 @@ void snd_seq_info_timer_read(struct snd_info_entry *entry,
 	int idx;
 	struct snd_seq_timer *tmr;
 	struct snd_timer_instance *ti;
-	unsigned long resolution;
+	struct timespec64 resolution;
 	
 	for (idx = 0; idx < SNDRV_SEQ_MAX_QUEUES; idx++) {
 		struct snd_seq_queue *q __free(snd_seq_queue) = queueptr(idx);
@@ -457,8 +457,8 @@ void snd_seq_info_timer_read(struct snd_info_entry *entry,
 			if (!ti)
 				break;
 			snd_iprintf(buffer, "Timer for queue %i : %s\n", q->queue, ti->timer->name);
-			resolution = snd_timer_resolution(ti) * tmr->ticks;
-			snd_iprintf(buffer, "  Period time : %lu.%09lu\n", resolution / 1000000000, resolution % 1000000000);
+			resolution = ns_to_timespec64(snd_timer_resolution(ti) * tmr->ticks);
+			snd_iprintf(buffer, "  Period time : %ptSp\n", &resolution);
 			snd_iprintf(buffer, "  Skew : %u / %u\n", tmr->skew, tmr->skew_base);
 		}
  	}
-- 
2.50.1


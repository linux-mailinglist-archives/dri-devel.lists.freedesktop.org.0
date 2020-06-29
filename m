Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BAE20CCD5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 08:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E096E409;
	Mon, 29 Jun 2020 06:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9666E40B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 03:18:59 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id t9so8239434lfl.5
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 20:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SDOxLugkRc98jm7/ARfCzhMETuCaOUFDx45/EJB4D+Q=;
 b=bfBHZ1yogzA+VchQuTWQ0ker0M7Ji52RzCTwoGXm06HNI7t2KEy0ospuNpn1bEfOSw
 c7cI6vm3MJcC9QTkjncuEjp7GI9q3Kqlsgr2MhvKE6ltS/sj/njHE3j6bHDtttpAqogT
 rpy/fKBU+ZGp3BZiEK8sW7pj2sF6oF/oO2Wvdxj0EK+EF3kah1BKYf2SZnQxPzBFpkkL
 S82UVk4ewUdu0eBv+TaWi4sM4vglFiCsYVHJkx1pDzSGgVLIvJuESID8Pwdh3JXXQXQu
 ws/X5bvJrLAmGDdMoisRvW+V+pKq1JvwxrR7+D4dNalMbSAPVsz1MlVUb5Y54+QjPPRl
 1glQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SDOxLugkRc98jm7/ARfCzhMETuCaOUFDx45/EJB4D+Q=;
 b=edSL/t1CsaApv/T0tno5VTxB7FCYFFvf9VEBNKg9eApX5gFeqMqgFlNl9/XqCwY6JS
 Gn536uLkXd1xY/kvB8o00j1pqOOM0LbMjdnBl6HS5tEpr/61g4wCdvr+i5IkXvq6VcYw
 H69tWdcF65mct4aUaj7fIK1n3SyguGuNkON/ArzKrW/hTJlOryc730gpvZJ3eSjeEylh
 BRKsct32+AJv05CJtAUG3b/RsgFNLH9DQJngEjPk3cJIaLex61y23VsKfqJyPBR0Jqkb
 tN5iXhe32Y+QB6yZtZ74bZOHKa8yElgGrRS2eH21s/M0++qrvm1goYHqbsv6mS/Pzyf9
 3XNA==
X-Gm-Message-State: AOAM532HN1zeUqrFz2/rn5CVXaxkgDHtLwZ2seAs0jNVJSBtKKIZs0NX
 +HlTNtLsnkcfFHtZrGIr3Xw=
X-Google-Smtp-Source: ABdhPJyyQwfSCzRkdvYbrlKjQwQFxvBehxFedIbbhc6doEWkZGUOabFsSpUXNuMFOVNEocXvmKZUUw==
X-Received: by 2002:ac2:5593:: with SMTP id v19mr8025383lfg.43.1593400737514; 
 Sun, 28 Jun 2020 20:18:57 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id m1sm2383295ljg.60.2020.06.28.20.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 20:18:57 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v2 6/6] gpu: host1x: debug: Dump push buffer state
Date: Mon, 29 Jun 2020 06:18:42 +0300
Message-Id: <20200629031842.32463-7-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200629031842.32463-1-digetx@gmail.com>
References: <20200629031842.32463-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jun 2020 06:50:54 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When job hangs and there is a memory error pointing at channel's push
buffer, it is very handy to know the push buffer's state. This patch
makes the push buffer's state to be dumped into KMSG in addition to the
job's gathers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/hw/debug_hw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/host1x/hw/debug_hw.c b/drivers/gpu/host1x/hw/debug_hw.c
index 02125842071c..f31bcfa1b837 100644
--- a/drivers/gpu/host1x/hw/debug_hw.c
+++ b/drivers/gpu/host1x/hw/debug_hw.c
@@ -192,8 +192,14 @@ static void show_gather(struct output *o, phys_addr_t phys_addr,
 
 static void show_channel_gathers(struct output *o, struct host1x_cdma *cdma)
 {
+	struct push_buffer *pb = &cdma->push_buffer;
 	struct host1x_job *job;
 
+	host1x_debug_output(o, "PUSHBUF at %pad, %u words\n",
+			    &pb->dma, pb->size / 4);
+
+	show_gather(o, pb->dma, pb->size / 4, cdma, pb->dma, pb->mapped);
+
 	list_for_each_entry(job, &cdma->sync_queue, list) {
 		unsigned int i;
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

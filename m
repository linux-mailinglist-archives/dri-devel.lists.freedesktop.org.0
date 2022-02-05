Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908F04AAC12
	for <lists+dri-devel@lfdr.de>; Sat,  5 Feb 2022 19:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59CC10EFB8;
	Sat,  5 Feb 2022 18:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D830D10EF4B;
 Sat,  5 Feb 2022 18:59:44 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id s21so1467708ejx.12;
 Sat, 05 Feb 2022 10:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WOFeBJ64dmtg1TOUySBDnDMIhOcmOEsctVk6jKGZNmc=;
 b=mJ/l/5BNvplluvVRHfQCGUGai4Et4wivja4WsJcPMQiIktN5h5BlHUAFjt95NET7B4
 0f1SOpnaRjI6s/AbCBk+mKXJNR5J4bWApl+zF6R2rE6Ih1FvbeOam2O8Nkc7lnu62S8I
 rv0xqW7gmIOccm/3W2YAuEOlvYDPNq5ba9DxLHb8+W/Te9UPvPEO57RziSCYiwFUijRh
 du8ktgyvd9zpzLamY86iOZYeBL9okci2KKunoZr3vjND3wxCwa958WC1u8eejYiESN7S
 QVQ8JwGHZxiBdPslVznkerIZoKKYa/V/LNoeNWbZbvRh0aRKEsHzwfpNHiYvo36VR0yC
 IgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WOFeBJ64dmtg1TOUySBDnDMIhOcmOEsctVk6jKGZNmc=;
 b=A7yKOUag+Sl4u2jZxMXcvSIaSnF4I+2jHOpwH0m2767Xnu+zl03CG4MVHI3qteX5qm
 CWs7xagzDHKWvplf0A8gljCNqg87QHfD5o1KfV9sdhedRMk+lukiAb3a74NwqQjoa/GT
 X99Ziu3R0bmB8jmptufFyg8zUxk3DoCDyH60uYRU3+lY1ATAqLeQ+DFvPk8fgGoxsm5R
 yAygExhvwhY34+V5elZGepLS0WMZYLcm2rLGqvyaxVzPf7r3+enoMYFmxRQ9LtYGl6wf
 j3hr8HuRGWCZN0OwL/PhM85QmVcqPK+pay9BMDu6RezZYaA8NnJVCMLY4NP9e4n7QsQ8
 i1fQ==
X-Gm-Message-State: AOAM530OH0b762UnMSidyawGVjnW75lrU3OBjf4A4c3ZImB0ayjiHKxf
 s3v+lwoHwT2aXAIFzKJhkMzkJxjmdXg=
X-Google-Smtp-Source: ABdhPJztCj/bhSAnQQ9Tckgi7fi8+cgHDPhHTqKvRATOgSl8JYf40cmKzDW8CsNRoq76vWqfbS/6ww==
X-Received: by 2002:a17:907:97c9:: with SMTP id
 js9mr3944342ejc.351.1644087583420; 
 Sat, 05 Feb 2022 10:59:43 -0800 (PST)
Received: from centennial.enunes.eu (ip-78-45-67-25.net.upcbroadband.cz.
 [78.45.67.25])
 by smtp.gmail.com with ESMTPSA id c20sm720474edy.41.2022.02.05.10.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 10:59:43 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] lima: avoid error task dump attempt when not enabled
Date: Sat,  5 Feb 2022 19:59:09 +0100
Message-Id: <20220205185909.878643-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: David Airlie <airlied@linux.ie>, Erico Nunes <nunes.erico@gmail.com>,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently when users try to run an application with lima and that hits
an issue such as a timeout, a message saying "fail to save task state"
and "error task list is full" is shown in dmesg.

The error task dump is a debug feature disabled by default, so the
error task list is usually not going to be available at all.
The message can be misleading and creates confusion in bug reports.

We can avoid that code path and that particular message when the user
has not explicitly set the max_error_tasks parameter to enable the
feature.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_sched.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 5612d73f238f..12437e42cc76 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -409,7 +409,8 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
 
 	drm_sched_increase_karma(&task->base);
 
-	lima_sched_build_error_task_list(task);
+	if (lima_max_error_tasks)
+		lima_sched_build_error_task_list(task);
 
 	pipe->task_error(pipe);
 
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 337751B281F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 15:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA7A6E969;
	Tue, 21 Apr 2020 13:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484D86E966;
 Tue, 21 Apr 2020 13:37:41 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 18so2961496pfx.6;
 Tue, 21 Apr 2020 06:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZvpB2OLlW8f604XO1Vw/EtDA4S3id/uYjXH7SZjwG2I=;
 b=UzIXv5u7JEiXxjssQrdoRfpDDZbU0ZPXvvZDXLQJ5Tf+wUHUugwE4TsX/NA5ZTFmMb
 7FBnf/N/XEqhyDTnISVh0iBNUKv9tKJBE/5qbimBU37jwoZ1jtb+L5w7wMNKCtEnLu84
 7SfWQQ/Vvh9bOqgyGsdJn5xfGYU+4Pqqc9uZPn0SchlEsviKKCm3KW7TW7GFLYAlmNMh
 sgKDy2pM/tq3lsm6+0dsodmzr18Tb61yPnrvJLc7/qXHUTpjpz/dZ2ZNormDYCJLf72r
 rrCyZYLiY+qq32CvEPIAQA0djQGBBJA/hEaGqRSMafevbI1CKanPj2Lufw282njAXB2s
 XwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZvpB2OLlW8f604XO1Vw/EtDA4S3id/uYjXH7SZjwG2I=;
 b=syUX4RdtXZ5UhW6rn+alORxGoGV0O9wUQZxiAqPm4bkcgrBDJvcxDhfeXx3d+ubKcr
 py4uwzDhWFwNtgTRav1M+hGhY1Xavpei/lLD2nTLAydBdtBMvv/4TDqdq1S7zYk390aD
 TDJ3dI66hVahYc2MV8ceYCliqXK+bE0cIPLeVQ9GRnCv12uVlhTBQqDsluLaLScnc73d
 4kONmIrXKFE49dhrpQBYpZgBDpe3cYud2ls4ZwekpkHOdorNX21UUBfvScoeh+gaXKhj
 7g3NF4KDJrbvXtDoHR/TDfPVMlvA0yaDsiboHSCV+GtvAWQD6N/aqYGaNloBo4mr4Ej4
 mRjg==
X-Gm-Message-State: AGi0PubeDfFgtadDaxIzHJ/3pQIiBo2UsPACWK6D61kPiXsMqeZc8+W8
 MJTT+Qw/Mb0x/cFoz1+kKgBvmnMPvwU/eQ==
X-Google-Smtp-Source: APiQypIiDfrPxy0mplOhS3afkmButAjyF75gH8diBmw1ei6hFiHdeKKZnZPxy4SQtniYyWDJIwOWBA==
X-Received: by 2002:a63:4d18:: with SMTP id a24mr20621333pgb.97.1587476260670; 
 Tue, 21 Apr 2020 06:37:40 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (li2017-195.members.linode.com.
 [172.105.124.195])
 by smtp.gmail.com with ESMTPSA id r23sm2551327pfr.64.2020.04.21.06.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:37:40 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/10] drm/lima: add lima_devfreq_resume/suspend
Date: Tue, 21 Apr 2020 21:35:46 +0800
Message-Id: <20200421133551.31481-6-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421133551.31481-1-yuq825@gmail.com>
References: <20200421133551.31481-1-yuq825@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Bhushan Shah <bshah@kde.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Qiang Yu <yuq825@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Used for device resume/suspend in the following commits.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_devfreq.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/lima/lima_devfreq.h |  3 +++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
index 8c4d21d07529..f5bf85bbbb67 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.c
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -232,3 +232,27 @@ void lima_devfreq_record_idle(struct lima_devfreq *devfreq)
 
 	spin_unlock_irqrestore(&devfreq->lock, irqflags);
 }
+
+int lima_devfreq_resume(struct lima_devfreq *devfreq)
+{
+	unsigned long irqflags;
+
+	if (!devfreq->devfreq)
+		return 0;
+
+	spin_lock_irqsave(&devfreq->lock, irqflags);
+
+	lima_devfreq_reset(devfreq);
+
+	spin_unlock_irqrestore(&devfreq->lock, irqflags);
+
+	return devfreq_resume_device(devfreq->devfreq);
+}
+
+int lima_devfreq_suspend(struct lima_devfreq *devfreq)
+{
+	if (!devfreq->devfreq)
+		return 0;
+
+	return devfreq_suspend_device(devfreq->devfreq);
+}
diff --git a/drivers/gpu/drm/lima/lima_devfreq.h b/drivers/gpu/drm/lima/lima_devfreq.h
index 8d71ba9fb22a..5eed2975a375 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.h
+++ b/drivers/gpu/drm/lima/lima_devfreq.h
@@ -38,4 +38,7 @@ void lima_devfreq_fini(struct lima_device *ldev);
 void lima_devfreq_record_busy(struct lima_devfreq *devfreq);
 void lima_devfreq_record_idle(struct lima_devfreq *devfreq);
 
+int lima_devfreq_resume(struct lima_devfreq *devfreq);
+int lima_devfreq_suspend(struct lima_devfreq *devfreq);
+
 #endif
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

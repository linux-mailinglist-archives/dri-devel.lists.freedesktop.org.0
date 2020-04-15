Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A661AA911
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 15:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EDA6E9E1;
	Wed, 15 Apr 2020 13:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2506E9E0;
 Wed, 15 Apr 2020 13:53:40 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id w3so12407plz.5;
 Wed, 15 Apr 2020 06:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XqufiimgzptGbIiLqGBwiwvU98F4xD+BMGDQo0FlqCg=;
 b=sExHSfITepxSiyS7EL2EA/czeOKQGUISshfJJYS01bh2Z87Hm0ZQ1LSvFeAQ04DwNq
 DoguEpRhyv1y+fWVIoLiPpnp+kq8s2S0V2TELPa/Iz1VS15nXYr+sHqsTquD8gbzHXUd
 kR5cI3JMJiUfq0Uc+QnJcvwK7ejkH8MvMksXMsukXI8KZ+1StkJZAE537+SObad/hOw2
 84Fhs4PewMf6ve7vj6KMBZFPiyuYrO6hS5O3sWyokILLPiVME7h12/Es85DJlPaj5CVL
 QpnpvUcjsEFe4PG79R9+GCYjLnp/JDPPs9xty8/oQUqS8qMtiMq5TSOdJlIUFlfWyY1p
 G0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XqufiimgzptGbIiLqGBwiwvU98F4xD+BMGDQo0FlqCg=;
 b=mcqElIrcPlE4LfbzFukEnxyHA+p8qtxrIwyu+4a8pSUOYWj0+sQOOjjSN31aSmex4S
 KKkWSa7b5ta36ijnnPPBSb/LV2kBEjommUCFBP5mVL2BEO5qLoz7eiyoOQXb+45STIIt
 Kzw60IjifEPVjjCvROUo7Bf1xXODPA59hiKVryzsAjdYtqo22mcFbu7R4uUI2wJ0mHC1
 5lTKEpJ/5KxjxfW4kcZypZGqHLoX3zo00Dqj6yxts4rKx/LvVMq6E2fsIUbMjG665CrG
 2C6NZdx9D75O6njdIKhrMBgS3rVDzzydDS2Iempq5rtpXr0zZTJ7fAyzFHaE55+wLEtH
 XPew==
X-Gm-Message-State: AGi0Pubg/kZZqZLQ4UgTXkQDqUvZToL1cy6QE2CTriAa+DWx5jS4O8fq
 lM5Q2Hat9WPSVwl7IeIuazaXGJcx8IWBag==
X-Google-Smtp-Source: APiQypLLmLqCjrX5Y1A2Pen7T2h6uL27H+7Brcp2S/1u7Ix+nfZErSj+0JVwb+HVgWvI8Kf4domJDw==
X-Received: by 2002:a17:90a:c687:: with SMTP id
 n7mr6414386pjt.12.1586958820172; 
 Wed, 15 Apr 2020 06:53:40 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (li2017-195.members.linode.com.
 [172.105.124.195])
 by smtp.gmail.com with ESMTPSA id z1sm3331069pjt.42.2020.04.15.06.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 06:53:39 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/lima: add lima_devfreq_resume/suspend
Date: Wed, 15 Apr 2020 21:52:05 +0800
Message-Id: <20200415135208.8960-2-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200415135208.8960-1-yuq825@gmail.com>
References: <20200415135208.8960-1-yuq825@gmail.com>
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

Tested-by: Bhushan Shah <bshah@kde.org>
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

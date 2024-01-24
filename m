Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F92839FCE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 04:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4ABC10F5C9;
	Wed, 24 Jan 2024 03:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E888C10F5C3;
 Wed, 24 Jan 2024 03:01:11 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-40ec32453d5so8142555e9.2; 
 Tue, 23 Jan 2024 19:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706065210; x=1706670010; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BaTJtCWzAa42d+m/EougaGDz2r//03gZrDKzLfNv26E=;
 b=lxYV3hwHYHV+KCkLopZgy9ENJWBov3L/Md0d93T8ntSUZ0/D98E2A8EZGOzLvkF/Y2
 6yXzAyNnvnvzZNQgv4C0+Chf+84ffG7BUPeTeAIaETdAJe82ZtO0sr9U0ibM/4x9ioch
 jHEMb+ZZE+WHnAeTLNJrPRTimjLp1de60JxwcC0Jm/6JjFX9/zJ+hFO0LecuBrITQqxB
 2VmPWqYiNJLkyibMtCRfCCy00esThZUWbaOE3QDUI8tiDFg6ykEXnwTS+5a5kT1VVkIE
 hTml50wM+sKQ4OzRFkkOBnRC0ctR870767CLUCeaZm8+mWjmJG/Gu0jRmzswmdibdIBW
 ixAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706065210; x=1706670010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BaTJtCWzAa42d+m/EougaGDz2r//03gZrDKzLfNv26E=;
 b=wgJIwVupMuGCIUR8738+KE0wg+3/ocDFfcw1Qa/tvd56cxIzRvFWgg26CvM8H11Hex
 ingKk1pkXXsvx9dsZYXlAaqGIFBhjJMsJYR0PF0jT5BYo/ZAOndJxKQTyWWJ9gWSQ+Og
 iGjUz/EKqQRLmy87vQwwlZe9PHagaUiQUrqA65Zf3rSR4zBHdWbbfSBAHyrZqtpV2ZGo
 M3mVlz2RjF+yNbVTZwrHZKTixFjYU4r9e+Q0dYqimLd9y5YkI1QulzGBGfqneBcPgWcD
 xvfLJyJsOlRJcI6tk0bdI7/qHy4hB4MLGH2BKBx6ImCrFrH70/wIet9zfK3tDNkMUmds
 HTrA==
X-Gm-Message-State: AOJu0YzTLnlEyI5lSjR/INZdQaN8WtK0EkIW2gfPhQTh8UncdTnndpAk
 Vgv8vTmx+MpzxooPO8OzuhIqg6w6i7u9zxNNwdIHJpU/xIndkp9M
X-Google-Smtp-Source: AGHT+IFwR+0PHlmlGEWSlXVj5MQPq5ymiWct8wa0quwiQCc/blJhRIrth30UAoMURGBv8vL3XTjvRA==
X-Received: by 2002:a05:600c:5115:b0:40e:b6d0:82d8 with SMTP id
 o21-20020a05600c511500b0040eb6d082d8mr1030534wms.88.1706065210383; 
 Tue, 23 Jan 2024 19:00:10 -0800 (PST)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 dj17-20020a05640231b100b00559bb146ecbsm9637914edb.6.2024.01.23.19.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 19:00:09 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Subject: [PATCH v2 2/8] drm/lima: reset async_reset on gp hard reset
Date: Wed, 24 Jan 2024 03:59:41 +0100
Message-ID: <20240124025947.2110659-3-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124025947.2110659-1-nunes.erico@gmail.com>
References: <20240124025947.2110659-1-nunes.erico@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lima gp jobs use an async reset to avoid having to wait for the soft
reset right after a job. The soft reset is done at the end of a job and
a reset_complete flag is expected to be set at the next job.
However, in case the user runs into a job timeout from any application,
a hard reset is issued to the hardware. This hard reset clears the
reset_complete flag, which causes an error message to show up before the
next job.
This is probably harmless for the execution but can be very confusing to
debug, as it blames a reset timeout on the next application to submit a
job.
Reset the async_reset flag when doing the hard reset so that we don't
get that message.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_gp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_gp.c b/drivers/gpu/drm/lima/lima_gp.c
index 8dd501b7a3d0..b9a06e701a33 100644
--- a/drivers/gpu/drm/lima/lima_gp.c
+++ b/drivers/gpu/drm/lima/lima_gp.c
@@ -189,6 +189,13 @@ static int lima_gp_hard_reset(struct lima_ip *ip)
 	gp_write(LIMA_GP_PERF_CNT_0_LIMIT, 0);
 	gp_write(LIMA_GP_INT_CLEAR, LIMA_GP_IRQ_MASK_ALL);
 	gp_write(LIMA_GP_INT_MASK, LIMA_GP_IRQ_MASK_USED);
+
+	/*
+	 * if there was an async soft reset queued,
+	 * don't wait for it in the next job
+	 */
+	ip->data.async_reset = false;
+
 	return 0;
 }
 
-- 
2.43.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6835594C2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FEF112C60;
	Fri, 24 Jun 2022 08:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB152112C57;
 Fri, 24 Jun 2022 08:05:02 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id e40so2342159eda.2;
 Fri, 24 Jun 2022 01:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TEEoP8KCSv5pjlxAC2eGIjep+gJf30N0QWrbUiAblRs=;
 b=NsqpIeUqz6z1oXfKvdYH1/TqTFTXK9j1sJxHR/6+teGsI6wAcS38sTUENz1r/j+qWB
 Zx5BEXmUAQRLHC+0/WMd5cHg7pqTjt2mJsun4y65v/FkbkdUuEowB0Xeil8wiVIopW0C
 v7uFC+sCP7XMFz3Y74shfL8paThvoo6rqN5jyvJIG2lp6HaYqdHKi3OzUK5gdPk77trY
 JLyV0mg+oHiky3PUkntBd6bE+5pzI81H81uvLdg5+PBonm8eW64IOlBu28lZPhHT9xEL
 e7ST6iswEXQNp5oHPD8epprMYI811lDLgUfizTiIewMN4uvazsjzOwEcCSjRB0yo2rxG
 tMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TEEoP8KCSv5pjlxAC2eGIjep+gJf30N0QWrbUiAblRs=;
 b=uo4BHFxKgjRqnaaOUfPgD7j/QKYp/ik6dmIWAzmjoCzpM3UcaJl2X8dxs7niQYszag
 boz3KkHdrBbnsbPh2OQ1s5cvpNArI0fdq4vjgASl2PlM9vZTBkglSQup6nb/9mWgBU1G
 ZOa+789EgXexLIUfks6lHxkYFhSg/AbXM/CQdT+ZnUD5yLYjvjag4hAMYGU0VHchySMa
 KLbMhvU3DSpV9cjoWF+q++J7ZGe0mpG+hFt1upQ9yuDqsgLLkiuLPrQLhzCt1C2vmzoU
 nXq9Z6ctwQNLRNk0bH1QiDsrKYi7MLYAg7JEHC6p3Fbku2TN+AczU87PRYaUp28zbrni
 0YXQ==
X-Gm-Message-State: AJIora/PgmsH+hs4+0J0clJAx6W/5fNG9ZTBq23Mh2iI0zeviFa3XfU1
 ypsLIRZkM3JuJRCH8AnxQJI=
X-Google-Smtp-Source: AGRyM1s12FOWdmvVSggeHhbhrd16lE3/DoVEUD/LwuW4RhCc+Y/hP3ZDhy6clyaoJ7ITIboMGB65hA==
X-Received: by 2002:aa7:c952:0:b0:434:edcc:f247 with SMTP id
 h18-20020aa7c952000000b00434edccf247mr15543375edt.412.1656057901251; 
 Fri, 24 Jun 2022 01:05:01 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170906155300b006fea43db5c1sm697779ejd.21.2022.06.24.01.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:05:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 11/14] drm/nouveau: use drm_file_rss
Date: Fri, 24 Jun 2022 10:04:41 +0200
Message-Id: <20220624080444.7619-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624080444.7619-1-christian.koenig@amd.com>
References: <20220624080444.7619-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: mhocko@suse.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows the OOM killer to make a better decision which process to reap.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 561309d447e0..cc0ac7b059fe 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1218,6 +1218,7 @@ nouveau_driver_fops = {
 	.compat_ioctl = nouveau_compat_ioctl,
 #endif
 	.llseek = noop_llseek,
+	.file_rss = drm_file_rss,
 };
 
 static struct drm_driver
-- 
2.25.1


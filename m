Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB84F5594A6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30494112C2D;
	Fri, 24 Jun 2022 08:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEC2112C01;
 Fri, 24 Jun 2022 08:04:57 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z19so2279007edb.11;
 Fri, 24 Jun 2022 01:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ID2laRfYSApmjGzin/c5O7ZzYP1tMI9ua34YWk456Wk=;
 b=U7uY3MsA0DHippF6S8UKVRKmsJnNzZVtyS/oxSk8mnuxYbuH6lVcfrpX+0QqNbAzsr
 OHPqC1A2CJXe90yHB7/dZKLeRQkrpAbVd3R0tfpASOsFiFVpqjxyZSja4Ln6UQfGkV1F
 vEhUaLJqQTsf0mDlK6LHd6b+sDgfx27xoxB1E1JLj9lewb9qKNqcQpOqIQ9VN902Eeco
 K9AuesVMeK0hPkCglbUSWjfKsjVujF7T8cb3mCE5ZaCnxoDqUl7F2zCL64/5pa0gH7B9
 1NKNHVz889djG0KWGG8iwf1I/ljLUIKtvBLVbUBVPCkEvOT+MIVlMWKc5SSwZwD6KAKU
 AbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ID2laRfYSApmjGzin/c5O7ZzYP1tMI9ua34YWk456Wk=;
 b=WcPYqiKraWHqQM60SEvo+WiHHAfv+0i8yUB69s+O/9t68FzKVO2BsD1o50LrbCy48I
 VZpMzFyBnXm+REzoqb6Q+J8CAYewa2DArI/XAjFLbnDQrncHnBxrurBDB6J0ODHe2Qst
 /qzJY+RIRDyaVYbPb1rA2FdByNyy4B2isfUg5JLsG02SqJNpmppnK07q70iNpNkKK811
 iudtyxPHV6w0/Jua45AiGpb+zfsVc2w3pEzFFCDk5X2VISao0JDtbT4VNW1PTZ99qeVO
 ck8tdDTQBEgCb8r2+6bBaFElMTBmoW8xDPmagYgXFWVJh5K0bRuvrT/4KvgFh45o3w8g
 twyw==
X-Gm-Message-State: AJIora+naXhwWJi9NmOtUFeuItrbnez2He26bHEPlfnxopA67Htscwdn
 ctd2iZ4SSWxbgJwGdPgWx1M=
X-Google-Smtp-Source: AGRyM1vXothqzNCeq2wfXu0Iy7pDBGR1100k8JOpLZpuKKiLhk+9M6Fn95/BBmkDNLC1mjmi1D/X+w==
X-Received: by 2002:a05:6402:11d1:b0:435:d76d:f985 with SMTP id
 j17-20020a05640211d100b00435d76df985mr7954996edw.8.1656057896438; 
 Fri, 24 Jun 2022 01:04:56 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170906155300b006fea43db5c1sm697779ejd.21.2022.06.24.01.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:04:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 07/14] drm/gma500: use drm_file_rss
Date: Fri, 24 Jun 2022 10:04:37 +0200
Message-Id: <20220624080444.7619-8-christian.koenig@amd.com>
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
 drivers/gpu/drm/gma500/psb_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 1d8744f3e702..92c005aa6e9e 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -513,6 +513,7 @@ static const struct file_operations psb_gem_fops = {
 	.mmap = drm_gem_mmap,
 	.poll = drm_poll,
 	.read = drm_read,
+	.file_rss = drm_file_rss,
 };
 
 static const struct drm_driver driver = {
-- 
2.25.1


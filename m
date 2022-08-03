Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49327589140
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 19:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7C718A4B4;
	Wed,  3 Aug 2022 17:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7E211B070;
 Wed,  3 Aug 2022 17:22:34 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id o3so17007867ple.5;
 Wed, 03 Aug 2022 10:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=9lYXINAlxxMxWSbvsI8AJB5wGlCbPGWBgmb6qoY0xm4=;
 b=icUeEm2PKM5WXTxzKJFNcPkN/1w9jNcDpqXthRNOePTbuqlNuwmsHAHZh0UYrco2uV
 lXR+rVyNGmoAWv2aWAhcNwvpmQzwtQesbe+v/Vzh/lmNO5VFrkMlvjCx1WaQz+PFah+h
 nTS71/uWhVJcrBUL5v0Rh5eVesXhkBSiPFXfVDPdFjGvxOeSPA5xtcsNWf4+Ub3z+cMc
 6Fz98feK5mr4tkjugDJfIg1LD6KD2ldbfQ8BeLTqMnNiCsbCvMoO1loqoZA2xHNycKDK
 jv5vbUFjaZiD8X/ER6DfsPMdoKir8DziTFI6T8paN+D6pEsBOjegHkOKpkn2FYbpFvzC
 IXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=9lYXINAlxxMxWSbvsI8AJB5wGlCbPGWBgmb6qoY0xm4=;
 b=VapRb3XShATGYMuwlEYapus6k8pkWAg4R5UxaFfpHD32rJKMkhmscvalGlqxOSBxr+
 Z//on2Hp9006TWiRcRLwz63zLi4M2z+S8fHJOVd9NbV8DM1R2H436P6HlnfP5uEdscoi
 RJ8I5JKHC3hRNlUwnt/Gbmx2tFyeo1U4GVu8gX5smGXn4URQSHBtfosTXu4nZkgTHCIA
 Kek3mk5OprPFTkccorf/xPRtk/SvIgmA4Quh3ddpOPnHxVmkAIRiUbVC+NxO3uuLGZzk
 Aq56JQRgYMiytKQN3fZix1dHI8fzoHHh4H0YeoZBnmUd7w6UMxdN8J7RRkR7w6HNpaZy
 IENQ==
X-Gm-Message-State: ACgBeo1Vma7r7XmmLWWbgi2kO9sSk72MZVpBm3IT7k8g90313c+tjNne
 j6wDChPtBONl6YYp3efiY+EV5AaSah8=
X-Google-Smtp-Source: AA6agR4anjaSlbUEFkuNTyBJBYjx1Dfme76YDiiwhXa3CuIz6Y3YjdykMMx8iwP5lYQ+74B54uQZXg==
X-Received: by 2002:a17:90b:1c8e:b0:1f1:b5a8:330f with SMTP id
 oo14-20020a17090b1c8e00b001f1b5a8330fmr5815071pjb.179.1659547353432; 
 Wed, 03 Aug 2022 10:22:33 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b0016d01c133e1sm2226044plh.248.2022.08.03.10.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 10:22:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/rd: Fix FIFO-full deadlock
Date: Wed,  3 Aug 2022 10:23:02 -0700
Message-Id: <20220803172302.1976981-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220803172302.1976981-1-robdclark@gmail.com>
References: <20220803172302.1976981-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If the previous thing cat'ing $debugfs/rd left the FIFO full, then
subsequent open could deadlock in rd_write() (because open is blocked,
not giving a chance for read() to consume any data in the FIFO).  Also
it is generally a good idea to clear out old data from the FIFO.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_rd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index a92ffde53f0b..db2f847c8535 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -196,6 +196,9 @@ static int rd_open(struct inode *inode, struct file *file)
 	file->private_data = rd;
 	rd->open = true;
 
+	/* Reset fifo to clear any previously unread data: */
+	rd->fifo.head = rd->fifo.tail = 0;
+
 	/* the parsing tools need to know gpu-id to know which
 	 * register database to load.
 	 *
-- 
2.36.1


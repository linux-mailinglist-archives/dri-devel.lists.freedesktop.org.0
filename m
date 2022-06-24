Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A74DF5594C8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB723112C71;
	Fri, 24 Jun 2022 08:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25EB112C48;
 Fri, 24 Jun 2022 08:05:04 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id g26so3093829ejb.5;
 Fri, 24 Jun 2022 01:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7h6tONB4sw4uv1o8ITO08dQoAN0r8TWfzTc1cDvUnqs=;
 b=Q59ZDM0bs66kYTouHFV3SH7kQiFRv8zAdPLal5R6bK6lLwicp/kD7pik3lBee8DZX6
 WjFSGBfwF+GZvlJE8V2r4yZYlHtq+V7w5wxAfdmue81Rk5Au3jDlZEuUJFHZndYxL05t
 Ibe4zJZteTFiI3OYBpLOLUg3BL649o69+FMAHcL8GF+ZgZAjH9/pTivOYrkyoaDuf/d6
 QStbApg579KEKEi3o8lC8TkfL1GqADjPzKl4hmJsbaygYpN4yg8E0HDtU5D+m69zgWyk
 oqqPfy5Xdm5n/aLuRFeGPi/fosEZBhi026xzbJX77OYzK7dtCEyZRZkwWliyAnH8t2Be
 qmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7h6tONB4sw4uv1o8ITO08dQoAN0r8TWfzTc1cDvUnqs=;
 b=mvZm3GOb/7rXSxkshdTF2wepUBK3UtFzbE2DPHl7Gd1PLanjyTdTDKLgX7KidPghLR
 SFJVfWiTUaUljo+5FG1Fu6pB5wxRIhgIchHQ629htyJE1unROwTu7gzlwIEH6lzUwQxD
 b80yZ3oATnqh2Jv/DkbBs6ZffAb0hdu4ZPUmr3nFqe56vjqpx5Pmb/7Ri+DWIf+OypCy
 D4aPdT6BN2pHvoM8EMC8i+hncxrZ3VoyH10C4qsaSc2WBrGT1dLHs6500IK5SNqAZDaV
 VZYtrkvu6Dr6sqKMKio8OorxCAmrfub9wuvkX8Ey6u79TGq5gE0bifTBlRWHQkhazXEM
 gDEQ==
X-Gm-Message-State: AJIora+9/O+7163ttNbO9m2DBBuHucMh22xuDacmIHVwTFY2rn4Gk/o5
 R/gYWt6kFKNIa75r+UNb7mXKl2ljLsY=
X-Google-Smtp-Source: AGRyM1u1kM9hV5B2jw9gM+JFOfPel32sur1C9sCcKAHE7MFpkQ9lyzjasZeMq//UEzPa6HSaMFHF8w==
X-Received: by 2002:a17:907:97d1:b0:722:e6fc:a04 with SMTP id
 js17-20020a17090797d100b00722e6fc0a04mr12082666ejc.217.1656057902587; 
 Fri, 24 Jun 2022 01:05:02 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170906155300b006fea43db5c1sm697779ejd.21.2022.06.24.01.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:05:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 12/14] drm/omap: use drm_file_rss
Date: Fri, 24 Jun 2022 10:04:42 +0200
Message-Id: <20220624080444.7619-13-christian.koenig@amd.com>
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
 drivers/gpu/drm/omapdrm/omap_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index eaf67b9e5f12..dff637de00a3 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -684,6 +684,7 @@ static const struct file_operations omapdriver_fops = {
 	.poll = drm_poll,
 	.read = drm_read,
 	.llseek = noop_llseek,
+	.file_rss = drm_file_rss,
 };
 
 static const struct drm_driver omap_drm_driver = {
-- 
2.25.1


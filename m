Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFBE49C6D8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 10:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F1B89AC9;
	Wed, 26 Jan 2022 09:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1826 seconds by postgrey-1.36 at gabe;
 Wed, 26 Jan 2022 09:48:32 UTC
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A52C89AC9;
 Wed, 26 Jan 2022 09:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=7+gQH
 ova1ewkBfJn3FFDQ+n/FuOVx0d3gWZmjoaJ1o8=; b=SrQkLJJwtPGN3KkoORFKj
 WpGAqajGI+h9X4EGjpGVijTUKkeY9W3bcNYl01vdk4RtjwdCKishi2PTmBUnWArF
 JAgaDKzuu5Yf773OYnqJK5EEzw3rf8UMwJ2opKWQPifgDkQWiyA+uHflurjo+6pm
 eIlWy1VBseBREQ5jkEzgF8=
Received: from CD-huangqu.Hygon.cn (unknown [175.152.51.41])
 by smtp3 (Coremail) with SMTP id DcmowAAngeVWEfFh6zUzAA--.15463S2;
 Wed, 26 Jan 2022 17:16:07 +0800 (CST)
From: jinsdb@126.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: Wrong order for config and counter_id parameters
Date: Wed, 26 Jan 2022 17:16:02 +0800
Message-Id: <20220126091602.1647-1-jinsdb@126.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowAAngeVWEfFh6zUzAA--.15463S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7XFWUZr1rZw47Xry5tw48Crg_yoW8JryDpr
 WrJryDtFWkAFnFq3yDua4vvFyDA3ZFva4Skr1UJ34a9a45A34rZrW3JF12yF1UWrWrCrW7
 tFn7GayUuFnFvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziHUDJUUUUU=
X-Originating-IP: [175.152.51.41]
X-CM-SenderInfo: pmlq2vbe6rjloofrz/1tbijB+UDlpEGQnX8gAAsi
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
Cc: jinsdb@126.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: huangqu <jinsdb@126.com>

Wrong order for config and counter_id parameters was passed, when calling df_v3_6_pmc_set_deferred and df_v3_6_pmc_is_deferred functions.

Signed-off-by: huangqu <jinsdb@126.com>
---
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
index 43c5e3ec9..f4dfca013 100644
--- a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
+++ b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
@@ -458,7 +458,7 @@ static int df_v3_6_pmc_add_cntr(struct amdgpu_device *adev,

 #define DEFERRED_ARM_MASK	(1 << 31)
 static int df_v3_6_pmc_set_deferred(struct amdgpu_device *adev,
-				    int counter_idx, uint64_t config,
+				    uint64_t config, int counter_idx,
 				    bool is_deferred)
 {

@@ -476,8 +476,8 @@ static int df_v3_6_pmc_set_deferred(struct amdgpu_device *adev,
 }

 static bool df_v3_6_pmc_is_deferred(struct amdgpu_device *adev,
-				    int counter_idx,
-				    uint64_t config)
+				    uint64_t config,
+				    int counter_idx)
 {
 	return	(df_v3_6_pmc_has_counter(adev, config, counter_idx) &&
 			(adev->df_perfmon_config_assign_mask[counter_idx]
--
2.31.1


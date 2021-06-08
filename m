Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1EA39EECA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 08:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F301D6EAAA;
	Tue,  8 Jun 2021 06:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CAB6EA95
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 04:32:47 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 w130-20020a25df880000b02905327e5d7f43so25261590ybg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 21:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=1CsAHJB1drzJFE9aMs2rQoto13RGg0fVp1ldOeOJhJM=;
 b=AODPeS3Rxy2dCzZVvlT77V++MmhgHwq/LXwUy62+WDULLkPs3l7t2Y3YlSU2OjGQxR
 wRSr6oKoRjTEq51NPDaNczweGae+Jm19rFf8p0D5OaFId+n1nPwvgzxFuLh4LXw1S3QA
 MlDb9Z41YtIo7OVegofT3m75hTP5y4ZKA8kLLhHCTMA3VMmJxMvAugXCIMSbiEfuHiPX
 l+2sM+hwGu4aP8yjEWplKd/vPOAJeenAlCNz4bOpqFQQmQe5Eiee/FvebF7i5MxXku5F
 PHbrhdGGqnsemAsDaDo5A53MJ4cVUbzYoHZdk1btN6z0Gl0BwAEeWgU7kEOQooBIeWs0
 GOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=1CsAHJB1drzJFE9aMs2rQoto13RGg0fVp1ldOeOJhJM=;
 b=lOFPT4E3rP+PewIREHCrhra1NDV3QHOSZ5C4GCbJkheOEx8MW4sAjg6Tq3tjclcgKz
 45qX4DfUeWF3RPb7L5L943FUS6mmB9jNT7IsM8XFxGEHnJmhtV9VX4oBCLxrlL1hpTcp
 BMHCZ+W+p4m11/HOIAUJloGoRAWSUoPkRNK8yUDrMHxvf0AhvqXoliSISkxUbdYXqcfn
 UtkLl7Ql1sx2/A/kz4zZdknPwh3KXek/TVb9QlKYcD++hbkyDXn0qHp9qOnfZ1K+Y9qL
 meTbl2wRCDMLb/JO7z5H8qO4JUoVpzDUQFSxHez7dzllL+88wBAaDmCpHsE5J8t7i259
 dcjw==
X-Gm-Message-State: AOAM531kmn/5DISMmXCpzAsdt1LDvGupeybScEPDHi4RZ45qboQdImbl
 jsYKiQpB1806dWLJCSlKyCbC8luWbhf2
X-Google-Smtp-Source: ABdhPJzGFYSJkGjEYy0wczei19iWM6Y/PFAcqGhaMiTDjHXzZj8TJzkLVLUqX7h6ji794vCiYrmvD3iMRwb6
X-Received: from nandos.syd.corp.google.com
 ([2401:fa00:9:14:7455:f4f3:5253:80b3])
 (user=amistry job=sendgmr) by 2002:a25:7a41:: with SMTP id
 v62mr28852515ybc.225.1623126766754; Mon, 07 Jun 2021 21:32:46 -0700 (PDT)
Date: Tue,  8 Jun 2021 14:32:38 +1000
Message-Id: <20210608143159.1.I230026301243fbcee23d408c75aa468c1fec58f7@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
Subject: [PATCH] drm/amd/display: Fix error code on failure to set brightness
From: Anand K Mistry <amistry@google.com>
To: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 08 Jun 2021 06:34:28 +0000
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
Cc: Anand K Mistry <amistry@google.com>, Eryk Brol <eryk.brol@amd.com>,
 David Airlie <airlied@linux.ie>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nikola Cornij <nikola.cornij@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The backlight_ops.update_status function is required to return a
negative error code on failure. Returning a positive code may be
interpreted as a success. This is true for the 'brightness' sysfs file,
which passes through a non-zero value as the return value of the write()
syscall. This is interpreted in user-space as a successful write of 1
character, which is obviously wrong.

It's not clear exactly what error code to use, but EINVAL should be
reasonable.

Signed-off-by: Anand K Mistry <amistry@google.com>
---

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 652cc1a0e450..ad322613390d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3431,7 +3431,7 @@ static int amdgpu_dm_backlight_update_status(struct backlight_device *bd)
 	else
 		rc = dc_link_set_backlight_level(dm->backlight_link, brightness, 0);
 
-	return rc ? 0 : 1;
+	return rc ? 0 : -EINVAL;
 }
 
 static int amdgpu_dm_backlight_get_brightness(struct backlight_device *bd)
-- 
2.32.0.rc1.229.g3e70b5a671-goog


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6D01DE06C
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE62F6E9A3;
	Fri, 22 May 2020 06:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9DA6E7F5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 12:31:14 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id bs4so2880216edb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 05:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6AN0zlcO+OFgXZ5HZFaDYCsDNCzeKbHF4q9hGEKhnoo=;
 b=mLPIXL760+K8t7V1USFTDLvmSBQjnbLFnaFuOjInzW8VnZARQ7GjU1JdefgZ7H9OB+
 g3b+oioGX5bVtg4E0LtECTvBkLeuuiz8/NVcxGglCG4SI/lNChrSysd5rwGxOZSKeyTC
 IsvOEYScjgZhOhbeUbD4LW51y8oFW5O0fwfY04MmcDok9QZiw4X49KKJ6w/HvrAMqS9Q
 I3/rHsBf6fgAjDjoocVtJiv2YAAgCJL1fEfDWCw3EHU+8M37KjsCuw2hvSX8Jx2ANmFL
 GTzA1gmGd6FDQ5KgTfXrEJV+TwOxHU350d1eJYDMuaKVmBTP94ZPyTnW4YEREs+Qyob8
 4FTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6AN0zlcO+OFgXZ5HZFaDYCsDNCzeKbHF4q9hGEKhnoo=;
 b=oCI6M/Xg43/AipTPuVJ1mm3/FbAyL6P2Fd24MkON37MOyXRSYFacLc2JxX0+Z40LAq
 vvY/xZ2cxp5b3q+1iTFRWbHveFGby+OTtCAgvdxF3I3UduGr77WBxC24rkg1XU31Q4xx
 XnY9Q8zlQE2CGQcn0c5t+vcGk4a1S/AGDGRHMcSeHeFJN8d22ZjS9tTvWSFVcUwhAkMX
 ygsv5BT/fujkcshknsKE1fCW79AvVP3OYP1mMM8tmbiXmYvHOfY72YR8rlySqsIthziY
 6BB4q00+zbKZFf4QHkPle2OAuWX/ov5Mli6SFklbSgo5K/pSEkpSJsA7FwvnnGKShkr2
 cbjA==
X-Gm-Message-State: AOAM532GVIrysBIDCIN7bSdTBJkAkloso++IXfAosbRKb2kO+wqhvE2w
 dX/BkJIEREOgYaG2WJucU3exgy31Fk4=
X-Google-Smtp-Source: ABdhPJwwvdua36vEkdVeEGpKQ4KOS3Gw3LCBN3jzIdUffs/BDKr0IXWqZnL0TtQSsRbhcBRbzOfV5g==
X-Received: by 2002:a50:a8a2:: with SMTP id k31mr3038471edc.357.1589977872581; 
 Wed, 20 May 2020 05:31:12 -0700 (PDT)
Received: from localhost.localdomain
 (p200300c58f225e00cb12a21916b827a8.dip0.t-ipconnect.de.
 [2003:c5:8f22:5e00:cb12:a219:16b8:27a8])
 by smtp.gmail.com with ESMTPSA id u26sm1774978eje.35.2020.05.20.05.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 05:31:11 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/1] drm: check for NULL pointer in drm_gem_object_put
Date: Wed, 20 May 2020 14:31:18 +0200
Message-Id: <20200520123118.85706-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 May 2020 06:56:07 +0000
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, emil.l.velikov@gmail.com,
 christian.koenig@amd.com, nirmoy.aiemd@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_gem_fb_destroy() calls drm_gem_object_put() with NULL obj causing:

[   11.584209] BUG: kernel NULL pointer dereference, address: 0000000000000000
[   11.584213] #PF: supervisor write access in kernel mode
[   11.584215] #PF: error_code(0x0002) - not-present page
[   11.584216] PGD 0 P4D 0
[   11.584220] Oops: 0002 [#1] SMP NOPTI
[   11.584223] CPU: 7 PID: 1571 Comm: gnome-shell Tainted: G            E     5.7.0-rc1-1-default+ #27
[   11.584225] Hardware name: Micro-Star International Co., Ltd. MS-7A31/X370 XPOWER GAMING TITANIUM (MS-7A31), BIOS 1.MR 12/03/2019
[   11.584237] RIP: 0010:drm_gem_fb_destroy+0x28/0x70 [drm_kms_helper]
<snip>
[   11.584256] Call Trace:
[   11.584279]  drm_mode_rmfb+0x189/0x1c0 [drm]
[   11.584299]  ? drm_mode_rmfb+0x1c0/0x1c0 [drm]
[   11.584314]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[   11.584329]  drm_ioctl+0x1ff/0x3b0 [drm]
[   11.584347]  ? drm_mode_rmfb+0x1c0/0x1c0 [drm]
[   11.584421]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[   11.584427]  ksys_ioctl+0x87/0xc0
[   11.584430]  __x64_sys_ioctl+0x16/0x20
[   11.584434]  do_syscall_64+0x5f/0x240
[   11.584438]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   11.584440] RIP: 0033:0x7f0ef80f7227

Fixes: b5d250744cccfb400 ("drm/gem: fold drm_gem_object_put_unlocked and __drm_gem_object_put()")

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 include/drm/drm_gem.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 52173abdf500..a13510346a9b 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -372,6 +372,9 @@ static inline void drm_gem_object_get(struct drm_gem_object *obj)
 static inline void
 drm_gem_object_put(struct drm_gem_object *obj)
 {
+	if (!obj)
+		return;
+
 	kref_put(&obj->refcount, drm_gem_object_free);
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

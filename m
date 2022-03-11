Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF5D4D5C2D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 08:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA7A10E033;
	Fri, 11 Mar 2022 07:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3900B10E033
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 07:23:14 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 mm23-20020a17090b359700b001bfceefd8c6so4121474pjb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 23:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=2UiXXrEjdOpBieCoiCd3aIQdcB5Bw07/UD0oa+EI5Cs=;
 b=VGw2sJf7ZC5hIzk26XFnKPx84Hs7TL3fu43vK4vihxZ1OU6Ow8coT6SRzjKUqCLP3W
 PuReiL/3OaezeQYUIpCI4Vj0eb8gMnOf7OTcHr0lHQN5iI+t73DSIB3Y/i2zNeFILLBu
 WJix6q602iGFXeE54Ld7N85ac2s73RMCN+j3lWM9mlszRqX0x0uqDfXS2nOxaaKrwf6r
 xys/HsaSzzU9fHfhithhTXUhcwj+Z8lWSuP7uzhW+SbhJMejhkEN0XFKkx/4sVXp6+d9
 FOg5V/ZYfyGc9WwJ+Oh7qpuuVT4uptvUmZ33JokW370SW4qsxGLI5l184okvrha56Rce
 D48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2UiXXrEjdOpBieCoiCd3aIQdcB5Bw07/UD0oa+EI5Cs=;
 b=WPnaeRAFBSHEIOrxA8qC8Rtzs4bpCZvUXCahK/5zguZX8xSmDNxiS5sDRwx8c0jhbh
 YfKWhOVXCICMOkOBSQNyIQiMvzyaWeC8MUaH1/cVynacULV7GM1h2Ku1nEHPL1GaheoQ
 +jiM+lZxEapjMZW9DqcMSyeybvFaObfEhEdgvJFvEt1TQz4mRvwNORky3qekcssl5ovq
 r9gmxqLSJW9q4Dc5JVTE3IxhaCzx4JZAT12uHnEQJJQloxoGM6ZiFZAPbi4/dzc1P7RT
 AOox47eB+EGsVd6K3uxDB0KF8y66zBgbT3PnwLdrnLd/bDYnRXAwQ2HDGGd0tyNmAbf7
 LDZA==
X-Gm-Message-State: AOAM530d4QbdDMyc6CGgo5/HXtnNTPgk4RUZKy+txNE3aRKtiRZ9eJC0
 TVTeQ5R/k0BaWRvqyfwXcA==
X-Google-Smtp-Source: ABdhPJwK5t4CfKDqHjqDyY3n+hI+DNnXEM4ILZ3cGz9W2U5alypJtzbJ+Q0FEvrFPgMYq4olE7DrRA==
X-Received: by 2002:a17:902:b204:b0:14d:a8c8:af37 with SMTP id
 t4-20020a170902b20400b0014da8c8af37mr9119476plr.108.1646983393619; 
 Thu, 10 Mar 2022 23:23:13 -0800 (PST)
Received: from vultr.guest ([107.191.53.97]) by smtp.gmail.com with ESMTPSA id
 w23-20020a627b17000000b004f6cf170070sm8967270pfc.186.2022.03.10.23.23.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Mar 2022 23:23:13 -0800 (PST)
From: Zheyu Ma <zheyuma97@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm: drm_bufs: Error out if 'dev->agp' is a null pointer
Date: Fri, 11 Mar 2022 07:23:02 +0000
Message-Id: <1646983382-30036-1-git-send-email-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Zheyu Ma <zheyuma97@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The user program can control the 'drm_buf_desc::flags' via ioctl system
call and enter the function drm_legacy_addbufs_agp(). If the driver
doesn't initialize the agp resources, the driver will cause a null
pointer dereference.

The following log reveals it:
    general protection fault, probably for non-canonical address
    0xdffffc000000000f: 0000 [#1] PREEMPT SMP KASAN PTI
    KASAN: null-ptr-deref in range [0x0000000000000078-0x000000000000007f]
    Call Trace:
     <TASK>
     drm_ioctl_kernel+0x342/0x450 drivers/gpu/drm/drm_ioctl.c:785
     drm_ioctl+0x592/0x940 drivers/gpu/drm/drm_ioctl.c:885
     vfs_ioctl fs/ioctl.c:51 [inline]
     __do_sys_ioctl fs/ioctl.c:874 [inline]
     __se_sys_ioctl+0xaa/0xf0 fs/ioctl.c:860
     do_syscall_x64 arch/x86/entry/common.c:50 [inline]
     do_syscall_64+0x43/0x90 arch/x86/entry/common.c:80
     entry_SYSCALL_64_after_hwframe+0x44/0xae

Fix this bug by adding a check.

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/gpu/drm/drm_bufs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index fcca21e8efac..4fe2363b1e34 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -734,7 +734,7 @@ int drm_legacy_addbufs_agp(struct drm_device *dev,
 	int i, valid;
 	struct drm_buf **temp_buflist;
 
-	if (!dma)
+	if (!dma || !dev->agp)
 		return -EINVAL;
 
 	count = request->count;
-- 
2.25.1


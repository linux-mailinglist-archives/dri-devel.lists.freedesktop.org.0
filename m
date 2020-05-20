Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E331DE039
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A636E351;
	Fri, 22 May 2020 06:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF1E6E14D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 12:14:45 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id bs4so2836788edb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 05:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kq1Qz0GWk7RbjsgtORVXfMssG98Pv1AOPlAYwu4bI1I=;
 b=jjGC3xcYAOxM8EPZTJS1QpltJOgZZxyNa2Gde/e9Ybb8+3S4pfDvriy5uQ44533iC2
 vUuOf2j0Bymm/xWGM2DFR8xHKQ/PWhzcnTyFMvVfsU7unDhrSXeYtZgrYLAXkZaVCIDT
 /r1mmjti6InTxYkFafSEAKMVA+xbMB9t/4LXinpexFkg+qQE6ahSyxi2vFuv+44zYufP
 AWnL2v8gYp5d7zqKgsn/Phg5WN9BMY/lYKMmdson8LRbD6TDZu5e/QK7KyGZh9GDhrpv
 ir5RJslINR4gxwuEQ+/J6aCQKug4AmdJGvHUA+5Cwl8yS5/88ctPhpew6/zyJjA64BlS
 /GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kq1Qz0GWk7RbjsgtORVXfMssG98Pv1AOPlAYwu4bI1I=;
 b=Mz5xWaL6tu+lUd3d0O8K5jELpk+ks0N+Oo6FetjdEaWuLoiS7ZJ6TJI8FTU2zDDoF8
 FO1sLutviGYk06huqsHqSz40JoTd3BYB7IpfSq2DHXCMZuyeBlIGpqMeYeiwk6MDZKzF
 PiSx/I7HuRIIecyFrzJOH0EiilytPQxbfWq5vDE2m9X8/A+j9MGGx0B5qXTwo7ge13HB
 XyD9je2lDpXIoDwcYHjG95if0EWGTM3V2dpPeHylw/ix5IkQLMFVB5DNYAmXhrB9bxAq
 l489xjF6W58qqszegOYSEzPGxXkM4EMUT5jMhsXZnWo+krtWbVw0rB0pX3hf+sJRZMZ4
 efLA==
X-Gm-Message-State: AOAM533PD6onIakqXKEQqIxtT8ucykrC965MeyLJzhlnuT7EL2CmdUYM
 jU719+l8xRDrYNk/9tCnRlL+glujITI=
X-Google-Smtp-Source: ABdhPJwcC4b4ZeVPu0K0apo96aVP4tDFmV/5I6a1s5ypqkMGhmCt+Xy01D6DCx4abp8bnGA1B1yqsw==
X-Received: by 2002:a50:85ca:: with SMTP id q10mr665756edh.51.1589976883426;
 Wed, 20 May 2020 05:14:43 -0700 (PDT)
Received: from localhost.localdomain
 (p200300c58f225e00cb12a21916b827a8.dip0.t-ipconnect.de.
 [2003:c5:8f22:5e00:cb12:a219:16b8:27a8])
 by smtp.gmail.com with ESMTPSA id g23sm1728875edh.59.2020.05.20.05.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 05:14:42 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm: check for NULL pointer in drm_gem_object_put
Date: Wed, 20 May 2020 14:14:50 +0200
Message-Id: <20200520121450.79340-1-nirmoy.das@amd.com>
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, christian.koenig@amd.com,
 nirmoy.aiemd@gmail.com
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

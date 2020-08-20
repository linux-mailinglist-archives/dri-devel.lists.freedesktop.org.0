Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7074E24AD66
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 05:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B33A6E894;
	Thu, 20 Aug 2020 03:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F6D6E894
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 03:41:05 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id h12so505707pgm.7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 20:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=B9EvtRMB5UVF86YnoHZC/uHFJ9AM6zutWYeLdC0SWPo=;
 b=J6C7ICzFYJGV3tWZk5soVRVxCRF4eadzc/OAyuvKSnyBUVeWXBJufUSp5SrId1XKLj
 6r8wz5IPJFIHX0hv0Wcz3JhYOlDMDmjjvsYRvUIi9AvCpajh4gxxFFK0oTZ40OErAzvJ
 f+6KcTMpbTTJYB31y7uvlnnh0BWMfpBEFWYAZ+0czMfx7bY9/uzn6Z1Clf70GKetDBlG
 XD9018HxSAbapSc9yzX4y2kX8+LEnZuLQu3B+K28eZJAwtBKLALb8UhkI7rsm9x78qae
 JuNYMBjzUhSe8+1cnTN0L9cAdrvRNRHgAgnB41Zy7/htCDlJKnQG5p1JjhX/4saRcFsK
 wE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=B9EvtRMB5UVF86YnoHZC/uHFJ9AM6zutWYeLdC0SWPo=;
 b=IminAbHQH78bqQlUnEacKp44oevdztCJhTbqARrEA4DFWDfNrf6SHJu3afU2uI7nnG
 813AVvj3FHiYcachaPU5p8LNiLpSWtbRRE5QhYRK6PrfdeUyxVAUq+uq4eLqtq7nAtC7
 PF0dSBB6C9pLIVRyB1XwIqtE6ZGqjASVp9MBQU1mp9lcHQK4wiHyZ76gRAYVB/9n6pek
 +3uAfV8HLTifQ3RzdoHOFB4k9hT7bvQSruv27rDyKO0T73k8fdKrw+OrAHn9WeLzcm52
 02s3xU9Up6AQzxrXSaUxdN3/1ztpE0EBp3LPUKo6tSUqvVGA2W1gbz9t4all5bNRZtV9
 hFPg==
X-Gm-Message-State: AOAM531VdHZE/S8NTZOI8UMabSbgaEnm2JyVd9USFc00bH0rY92JcYUa
 rcMVxFnuapcnsQvlCZ/pswLWqQ==
X-Google-Smtp-Source: ABdhPJw4A1teuRlyb1TkMhqLDkqloYQulBKDv393Chr/svrFg49o9APmr8NElPKuIMXNWDkeTvOLiA==
X-Received: by 2002:a63:5552:: with SMTP id f18mr1054188pgm.298.1597894864955; 
 Wed, 19 Aug 2020 20:41:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 y126sm786477pfy.138.2020.08.19.20.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 20:41:04 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] drm: hikey9xxx: Fix null pointer crash on reboot
Date: Thu, 20 Aug 2020 03:41:00 +0000
Message-Id: <20200820034100.128062-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200820034100.128062-1-john.stultz@linaro.org>
References: <20200820033939.127932-1-john.stultz@linaro.org>
 <20200820034100.128062-1-john.stultz@linaro.org>
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
Cc: Liwei Cai <cailiwei@hisilicon.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is against Mauro's tree here:
https://gitlab.freedesktop.org/mchehab_kernel/hikey-970/-/commits/master/

On reboot we see the following crash:

[  608.746787] Unable to handle kernel read from unreadable memory at virtual address 00000000000000a8
...
[  608.822101] CPU: 3 PID: 234 Comm: kworker/3:2 Not tainted 5.8.0-00183-g03481a190c60-dirty #32
[  608.830626] Hardware name: HiKey960 (DT)
[  608.834571] Workqueue: events drm_mode_rmfb_work_fn
[  608.839454] pstate: 80400005 (Nzcv daif +PAN -UAO BTYPE=--)
[  608.845031] pc : drm_gem_fb_get_obj+0x10/0x28
[  608.849390] lr : drm_fb_cma_get_gem_obj+0x10/0x20
[  608.854093] sp : ffffffc012f63b10
[  608.857404] x29: ffffffc012f63b10 x28: ffffff8212282e00
[  608.862716] x27: 0000000000000000 x26: ffffff8217501800
[  608.868027] x25: 0000000000000000 x24: ffffffc012f63d60
[  608.873339] x23: 0000000000000001 x22: ffffff8217504080
[  608.878652] x21: ffffffc0119b9000 x20: ffffff8212282e00
[  608.883963] x19: ffffff82175047c0 x18: ffffffffffffffff
[  608.889275] x17: ffffff8219c97708 x16: ffffff8219c97728
[  608.894586] x15: ffffffc0119b9d08 x14: 0000000000000000
[  608.899898] x13: 0000000000000000 x12: 0000000000000000
[  608.905209] x11: 0000003c00000000 x10: 0000046500000441
[  608.910519] x9 : ffffffc0119b9d08 x8 : ffffffc011bf7000
[  608.915830] x7 : 0000000000000898 x6 : ffffff8217504080
[  608.921142] x5 : ffffff8212282e00 x4 : ffffffc0111935e0
[  608.926454] x3 : 0000000000000000 x2 : ffffffc0119b9d08
[  608.931764] x1 : 0000000000000000 x0 : 0000000000000000
[  608.937079] Call trace:
[  608.939531]  drm_gem_fb_get_obj+0x10/0x28
[  608.943547]  hisi_fb_pan_display+0x50/0x1f8
[  608.947736]  dss_plane_atomic_update+0x10/0x20
[  608.952183]  drm_atomic_helper_commit_planes+0xe0/0x228
[  608.957412]  drm_atomic_helper_commit_tail+0x34/0x80
[  608.962377]  commit_tail+0x150/0x180
[  608.965955]  drm_atomic_helper_commit+0x164/0x178
[  608.970665]  drm_atomic_commit+0x4c/0x60
[  608.974591]  drm_framebuffer_remove+0x3f4/0x440
[  608.979123]  drm_mode_rmfb_work_fn+0x48/0x68
[  608.983398]  process_one_work+0x1ec/0x4b0
[  608.987408]  worker_thread+0x208/0x478
[  608.991160]  kthread+0x140/0x150
[  608.994390]  ret_from_fork+0x10/0x30
[  608.997972] Code: d503233f 71000c3f 540000a8 8b214c01 (f9405420)
[  609.004069] ---[ end trace a837c42fc434e1a4 ]---

Which is due to the plane->state->fb value being null.

Fix this with a solution used in a different version of this
patch series.

Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Cc: Liwei Cai <cailiwei@hisilicon.com>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Chen Feng <puck.chen@hisilicon.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
index f2e99c766927..7adbd924bec2 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
@@ -702,6 +702,13 @@ static int dss_plane_atomic_check(struct drm_plane *plane,
 static void dss_plane_atomic_update(struct drm_plane *plane,
 				    struct drm_plane_state *old_state)
 {
+	struct drm_plane_state *state = plane->state;
+
+	if (!state->fb) {
+		state->visible = false;
+		return;
+	}
+
 	hisi_fb_pan_display(plane);
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
